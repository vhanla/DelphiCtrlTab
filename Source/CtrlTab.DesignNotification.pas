{===============================================================================
 Project : DelphiCtrlTab_D27

 Name    : CtrlTab.DesignNotification

 Info    : This Unit contains the class TDesignNotification.
           This class is notified of various designer events.

 Copyright (c) 2020 Santiago Burbano
===============================================================================}
unit CtrlTab.DesignNotification;

interface

uses
  Classes, SysUtils, ToolsAPI, CtrlTab.Interfaces, DesignIntf;

type
  TDesignNotification = class(TInterfacedObject, IDesignNotification)
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
    procedure DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
     procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemsModified(const ADesigner: IDesigner);
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
  end;

implementation

uses
  CtrlTab.IdePlugin;

{-------------------------------------------------------------------------------
 Name   : DesignerClosed
 Info   : This method is called when a form designer is closed.
 Input  : ADesigner =
          AGoingDormant =
 Output :
 Result : None
-------------------------------------------------------------------------------}
procedure TDesignNotification.DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
var
  FormFileName: string;
  ImplFileName: string;
  IntfFileName: string;
begin
  // ideally we could have used IOTAFormNotifier to know when a designer is closed. But no notifications
  // were triggered :-(
  // So ended up using this is a workaround.
  ADesigner.ModuleFileNames(ImplFileName, IntfFileName, FormFileName);
  Plugin.DesignerClosed(FormFileName);
end;

{-------------------------------------------------------------------------------
 Name   : DesignerOpened
 Info   :
 Input  : ADesigner =
          AResurrecting =
 Output :
 Result : None
-------------------------------------------------------------------------------}
procedure TDesignNotification.DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
begin
end;

{-------------------------------------------------------------------------------
 Name   : ItemDeleted
 Info   :
 Input  : ADesigner =
          AItem =
 Output :
 Result : None
-------------------------------------------------------------------------------}
procedure TDesignNotification.ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
begin

end;

{-------------------------------------------------------------------------------
 Name   : ItemInserted
 Info   :
 Input  : ADesigner =
          AItem =
 Output :
 Result : None
-------------------------------------------------------------------------------}
procedure TDesignNotification.ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
begin

end;

{-------------------------------------------------------------------------------
 Name   : ItemsModified
 Info   :
 Input  : ADesigner =
 Output :
 Result : None
-------------------------------------------------------------------------------}
procedure TDesignNotification.ItemsModified(const ADesigner: IDesigner);
begin

end;

{-------------------------------------------------------------------------------
 Name   : SelectionChanged
 Info   :
 Input  : ADesigner =
          ASelection =
 Output :
 Result : None
-------------------------------------------------------------------------------}
procedure TDesignNotification.SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
begin
end;

end.

