Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59F346C3AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 11:33:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x53BXHTp009503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jun 2019 04:33:17 -0700 (PDT)
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 3 Jun 2019 04:33:16 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2019 14:33:14 +0300
Message-ID: <20190603113314.22742-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [thud][PATCH] ghostscript: Fix CVE-2019-3839
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2019 11:33:17 -0000
Content-Type: text/plain

It was found that in ghostscript some privileged operators
remained accessible from various places after the CVE-2019-6116
fix. A specially crafted PostScript file could use this flaw in
order to, for example, have access to the file system outside of
the constrains imposed by -dSAFER. Ghostscript versions before
9.28 are vulnerable.

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-3839

Upstream patches:
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=4ec9ca7
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=db24f25

These two commits are already present in ghostscript 9.27, so current master
is not affected.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../ghostscript/CVE-2019-3839-0001.patch      | 441 ++++++++++++++++++
 .../ghostscript/CVE-2019-3839-0002.patch      |  68 +++
 .../ghostscript/ghostscript_9.26.bb           |   2 +
 3 files changed, 511 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0001.patch
new file mode 100644
index 0000000000..6c32ca7cc8
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0001.patch
@@ -0,0 +1,441 @@
+From 07ec80d317c441a1ad9602c83c35b092e3fa1a27 Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Thu, 31 Jan 2019 11:31:30 -0800
+Subject: [PATCH 1/2] Hide pdfdict and GS_PDF_ProcSet (internal stuff for the
+ PDF interp).
+
+We now keep GS_PDF_ProcSet in pdfdict, and immediately bind pdfdict
+where needed so we can undef it after the last PDF interp file has
+run (pdf_sec.ps).
+
+CVE: CVE-2019-3839
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/pdf_base.ps | 11 ++++----
+ Resource/Init/pdf_draw.ps | 59 +++++++++++++++++++--------------------
+ Resource/Init/pdf_font.ps |  9 +++---
+ Resource/Init/pdf_main.ps | 25 +++++++++--------
+ Resource/Init/pdf_ops.ps  | 11 ++++----
+ Resource/Init/pdf_sec.ps  |  4 ++-
+ 6 files changed, 60 insertions(+), 59 deletions(-)
+
+diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
+index 7312729..2665197 100644
+--- a/Resource/Init/pdf_base.ps
++++ b/Resource/Init/pdf_base.ps
+@@ -23,7 +23,6 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+ pdfdict begin
+ 
+ % Define the name interpretation dictionary for reading values.
+@@ -130,11 +129,11 @@ currentdict /num-chars-dict .undef
+ 
+ /.pdfexectoken {		% <count> <opdict> <exectoken> .pdfexectoken ?
+   PDFDEBUG {
+-    pdfdict /PDFSTEPcount known not { pdfdict /PDFSTEPcount 1 .forceput } executeonly if
++    //pdfdict /PDFSTEPcount known not { //pdfdict /PDFSTEPcount 1 .forceput } executeonly if
+     PDFSTEP {
+-      pdfdict /PDFtokencount 2 copy .knownget { 1 add } { 1 } ifelse .forceput
++      //pdfdict /PDFtokencount 2 copy .knownget { 1 add } { 1 } ifelse .forceput
+       PDFSTEPcount 1 gt {
+-        pdfdict /PDFSTEPcount PDFSTEPcount 1 sub .forceput
++        //pdfdict /PDFSTEPcount PDFSTEPcount 1 sub .forceput
+       } executeonly
+       {
+         dup ==only
+@@ -142,10 +141,10 @@ currentdict /num-chars-dict .undef
+         ( ? ) print flush 1 //false .outputpage
+         (%stdin) (r) file 255 string readline {
+           token {
+-            exch pop pdfdict /PDFSTEPcount 3 -1 roll .forceput
++            exch pop //pdfdict /PDFSTEPcount 3 -1 roll .forceput
+           } executeonly
+           {
+-            pdfdict /PDFSTEPcount 1 .forceput
++            //pdfdict /PDFSTEPcount 1 .forceput
+           } executeonly ifelse % token
+         } {
+           pop /PDFSTEP //false def	 % EOF on stdin
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index 40c6ac8..2b4532f 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -18,8 +18,7 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+-GS_PDF_ProcSet begin
++/GS_PDF_ProcSet load begin
+ pdfdict begin
+ 
+ % For simplicity, we use a single interpretation dictionary for all
+@@ -113,7 +112,7 @@ pdfdict begin
+ 
+ /resolvefunction {	% <fndict> resolvefunction <function>
+   .resolvefn
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Function: ) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Function: ) print dup === flush } if } if
+ } bind executeonly def
+ 
+ /resolvefnproc {	% <fndict> resolvefnproc <proc>
+@@ -1073,7 +1072,7 @@ currentdict end readonly def
+ %% finished running the PaintProc.
+ 
+ /.actual_pdfpaintproc {         % <patdict> <resdict> .pdfpaintproc -
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Begin PaintProc) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Begin PaintProc) print dup === flush } if } if
+   PDFfile fileposition 3 1 roll
+   q
+   1 index /PaintType oget 1 eq {
+@@ -1108,21 +1107,21 @@ currentdict end readonly def
+       Q
+     }{
+       (\n   **** Error: File has unbalanced q/Q operators \(too many Q's\)\n               Output may be incorrect.\n)
+-      pdfdict /.Qqwarning_issued .knownget
++      //pdfdict /.Qqwarning_issued .knownget
+       {
+         {
+           pop
+         }
+         {
+-          currentglobal pdfdict gcheck .setglobal
+-          pdfdict /.Qqwarning_issued //true .forceput
++          currentglobal //pdfdict gcheck .setglobal
++          //pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+         } executeonly ifelse
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+@@ -1131,21 +1130,21 @@ currentdict end readonly def
+   } loop
+   {
+     (\n   **** Error: File has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+-    pdfdict /.Qqwarning_issued .knownget
++    //pdfdict /.Qqwarning_issued .knownget
+     {
+       {
+         pop
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+     }
+     {
+-      currentglobal pdfdict gcheck .setglobal
+-      pdfdict /.Qqwarning_issued //true .forceput
++      currentglobal //pdfdict gcheck .setglobal
++      //pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+     } executeonly ifelse
+@@ -1156,7 +1155,7 @@ currentdict end readonly def
+   /pdfemptycount exch def
+ 
+   Q
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%End PaintProc) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%End PaintProc) print dup === flush } if } if
+   PDFfile exch setfileposition
+ } bind executeonly odef
+ 
+@@ -1227,7 +1226,7 @@ currentdict end readonly def
+   ] cvx put
+   dup /BBox 2 copy knownoget { normrect FixPatternBBox put } { pop pop } ifelse
+   dup /.pattern_uses_transparency  1 index patternusestransparency put
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Pattern: ) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Pattern: ) print dup === flush } if } if
+ } bind executeonly def
+ 
+ /ignore_color_op  (   **** Error: Ignoring a color operation in a cached context.\n               Output may be incorrect.\n) readonly def
+@@ -2348,16 +2347,16 @@ currentdict /last-ditch-bpc-csp undef
+ } bind executeonly def
+ 
+ /IncrementAppearanceNumber {
+-  pdfdict /AppearanceNumber .knownget {
+-    1 add pdfdict /AppearanceNumber 3 -1 roll .forceput
++  //pdfdict /AppearanceNumber .knownget {
++    1 add //pdfdict /AppearanceNumber 3 -1 roll .forceput
+   } executeonly
+   {
+-    pdfdict /AppearanceNumber 0 .forceput
++    //pdfdict /AppearanceNumber 0 .forceput
+   } executeonly ifelse
+ }bind executeonly odef
+ 
+ /MakeAppearanceName {
+-  pdfdict /AppearanceNumber get
++  //pdfdict /AppearanceNumber get
+   10 string cvs
+   dup length 10 add string dup 0 (\{FormName) putinterval
+   dup 3 -1 roll
+@@ -2378,17 +2377,17 @@ currentdict /last-ditch-bpc-csp undef
+   gsave initclip
+   MakeNewAppearanceName
+   .pdfFormName
+-  pdfdict /.PreservePDFForm known {pdfdict /.PreservePDFForm get} {//false}ifelse exch
+-  pdfdict /.PreservePDFForm true .forceput
++  //pdfdict /.PreservePDFForm known {//pdfdict /.PreservePDFForm get} {//false}ifelse exch
++  //pdfdict /.PreservePDFForm true .forceput
+   DoForm
+-  pdfdict /.PreservePDFForm 3 -1 roll .forceput
++  //pdfdict /.PreservePDFForm 3 -1 roll .forceput
+   grestore
+ } bind executeonly odef
+ 
+ /DoForm {
+   %% save the current value, if its true we will set it to false later, in order
+   %% to prevent us preserving Forms which are used *from* an annotation /Appearance.
+-  pdfdict /.PreservePDFForm known {pdfdict /.PreservePDFForm get} {//false}ifelse exch
++  //pdfdict /.PreservePDFForm known {//pdfdict /.PreservePDFForm get} {//false}ifelse exch
+ 
+   %% We may alter the Default* colour spaces, if the Resources
+   %% ColorSpace entry contains one of them. But we don't want that
+@@ -2503,13 +2502,13 @@ currentdict /last-ditch-bpc-csp undef
+   pdfemptycount countdictstack 3 -1 roll
+   /pdfemptycount count 4 sub store
+ 
+-  pdfdict /.PreservePDFForm known {pdfdict /.PreservePDFForm get}{//false} ifelse
++  //pdfdict /.PreservePDFForm known {//pdfdict /.PreservePDFForm get}{//false} ifelse
+   {
+     %% We must *not* preserve any subsidiary forms (curently at least) as PDF
+     %% form preservation doesn't really work. This is used just for Annotation
+     %% Appearances currently, and if they should happen to use a form, we do not
+     %% want to preserve it.
+-    pdfdict /.PreservePDFForm false .forceput
++    //pdfdict /.PreservePDFForm false .forceput
+     /q cvx /execform cvx 5 -2 roll
+   } executeonly
+   {
+@@ -2542,7 +2541,7 @@ currentdict /last-ditch-bpc-csp undef
+     saved_DCMYK /DefaultCMYK exch /ColorSpace defineresource pop
+     end
+   } if
+-  pdfdict /.PreservePDFForm 3 -1 roll .forceput
++  //pdfdict /.PreservePDFForm 3 -1 roll .forceput
+ } bind executeonly odef
+ 
+ /_dops_save 1 array def
+@@ -2701,13 +2700,13 @@ drawopdict begin
+     % Start by getting the object number for a Form XObject
+     dup Page /XObject obj_get dup 0 eq not {
+       % Now get the recording dictionary and see if that object number has been seen
+-      pdfdict /Recursive_XObject_D get 1 index known {
++      //pdfdict /Recursive_XObject_D get 1 index known {
+         (   **** Error: Recursive XObject detected, ignoring ") print 1 index 256 string cvs print (", object number ) print 256 string cvs print (\n) print
+         (               Output may be incorrect.\n) pdfformaterror
+         //false
+       }{
+         % We haven't seen it yet, so record it.
+-        pdfdict /Recursive_XObject_D get 1 index null put
++        //pdfdict /Recursive_XObject_D get 1 index null put
+         3 1 roll
+         //true
+       }ifelse
+@@ -2745,7 +2744,7 @@ drawopdict begin
+         (               Output may be incorrect.\n) pdfformaterror
+       } ifelse
+       PDFfile exch setfileposition
+-      pdfdict /Recursive_XObject_D get exch undef
++      //pdfdict /Recursive_XObject_D get exch undef
+     }{
+       % Otherwise ignore it and tidy up the stacks
+       pop pop
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index 4cd62b9..48d1646 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -37,8 +37,7 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+-GS_PDF_ProcSet begin
++/GS_PDF_ProcSet load begin	% from userdict at this point
+ pdfdict begin
+ 
+ % We cache the PostScript font in an additional element of the
+@@ -1227,11 +1226,11 @@ currentdict /eexec_pdf_param_dict .undef
+             .pdfruncontext
+             countdictstack BuildCharDictDepth sub
+             {
+-              pdfdict /.Qqwarning_issued .knownget {not}{//true} ifelse
++              //pdfdict /.Qqwarning_issued .knownget {not}{//true} ifelse
+               {
+                 (\n   **** Warning: Type 3 glyph has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+                 pdfformatwarning
+-                pdfdict /.Qqwarning_issued //true .forceput
++                //pdfdict /.Qqwarning_issued //true .forceput
+               } executeonly if
+               Q
+             } repeat
+@@ -2361,7 +2360,7 @@ currentdict /bndef undef
+   dup //null eq
+   {pop}
+   {
+-    pdfdict /InputPDFFileName .knownget {.CRCHashFilenameAndObject} if
++    //pdfdict /InputPDFFileName .knownget {.CRCHashFilenameAndObject} if
+     exch dup /.OrigUniqueIDXUID .knownget not
+     {
+       dup /XUID .knownget not
+diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
+index 37e69b3..4f81068 100644
+--- a/Resource/Init/pdf_main.ps
++++ b/Resource/Init/pdf_main.ps
+@@ -18,8 +18,9 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+ pdfdict begin
++/GS_PDF_ProcSet dup load def	% keep in pdfdict to hide it
++userdict /GS_PDF_ProcSet undef
+ 
+ % Patch in an obsolete variable used by some third-party software.
+ /#? //false def
+@@ -304,8 +305,8 @@ currentdict /runpdfstring .undef
+    /Page //null def
+    /DSCPageCount 0 def
+    /PDFSave //null def
+-   GS_PDF_ProcSet begin
+-   pdfdict begin
++   //pdfdict /GS_PDF_ProcSet get begin
++   //pdfdict begin
+    pdfopen begin
+    /CumulativePageCount currentpagedevice /PageCount get def
+ } bind executeonly def
+@@ -624,7 +625,7 @@ currentdict /runpdfstring .undef
+   %% copied to a temporary file) and store it in pdfdict. We will use this for
+   %% hashing fonts to detect if fonts with the same name are from different files.
+   %%
+-  dup currentglobal exch true setglobal .getfilename exch setglobal /InputPDFFileName exch pdfdict 3 1 roll .forceput
++  dup currentglobal exch true setglobal .getfilename exch setglobal /InputPDFFileName exch //pdfdict 3 1 roll .forceput
+ 
+   //runpdfbegin exec
+   //pdf_collection_files exec
+@@ -1390,7 +1391,7 @@ currentdict /xref-char-dict undef
+ } bind executeonly def
+ 
+ /pdfopenfile {		% <file> pdfopenfile <dict>
+-   pdfdict readonly pop		% can't do it any earlier than this
++   //pdfdict readonly pop		% can't do it any earlier than this
+    32 dict begin
+    /LocalResources 0 dict def
+    /DefaultQstate //null def	% establish binding
+@@ -2691,21 +2692,21 @@ currentdict /PDF2PS_matrix_key undef
+     StreamRunAborted not {
+       (\n   **** Error: File has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+ 
+-      pdfdict /.Qqwarning_issued .knownget
++      //pdfdict /.Qqwarning_issued .knownget
+       {
+         {
+           pop
+         }
+         {
+-          currentglobal pdfdict gcheck .setglobal
+-          pdfdict /.Qqwarning_issued //true .forceput
++          currentglobal //pdfdict gcheck .setglobal
++          //pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+         } executeonly ifelse
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+@@ -2717,8 +2718,8 @@ currentdict /PDF2PS_matrix_key undef
+   Repaired		% pass Repaired state around the restore
+   RepairedAnError
+   PDFSave restore
+-  currentglobal pdfdict gcheck .setglobal
+-  pdfdict /.Qqwarning_issued //false .forceput
++  currentglobal //pdfdict gcheck .setglobal
++  //pdfdict /.Qqwarning_issued //false .forceput
+   .setglobal
+   /RepairedAnError exch def
+   /Repaired exch def
+diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
+index aa09641..c2e7461 100644
+--- a/Resource/Init/pdf_ops.ps
++++ b/Resource/Init/pdf_ops.ps
+@@ -24,6 +24,7 @@
+ systemdict /pdfmark known not
+  { userdict /pdfmark { cleartomark } bind executeonly put } if
+ 
++systemdict /pdfdict where { pop } { /pdfdict 100 dict put } ifelse
+ userdict /GS_PDF_ProcSet 256 dict dup begin
+ 
+ % ---------------- Abbreviations ---------------- %
+@@ -174,21 +175,21 @@ currentdict /gput_always_allow .undef
+   {
+     (\n   **** Error: File has unbalanced q/Q operators \(too many Q's\)\n               Output may be incorrect.\n)
+ 
+-    pdfdict /.Qqwarning_issued .knownget
++    //pdfdict /.Qqwarning_issued .knownget
+     {
+       {
+         pop
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+     }
+     {
+-      currentglobal pdfdict gcheck .setglobal
+-      pdfdict /.Qqwarning_issued //true .forceput
++      currentglobal //pdfdict gcheck .setglobal
++      //pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+     } executeonly ifelse
+diff --git a/Resource/Init/pdf_sec.ps b/Resource/Init/pdf_sec.ps
+index 143efb7..a8e3d2e 100644
+--- a/Resource/Init/pdf_sec.ps
++++ b/Resource/Init/pdf_sec.ps
+@@ -39,7 +39,6 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+ pdfdict begin
+ 
+ % Older ghostscript versions do not have .pdftoken, so we use 'token' instead.
+@@ -748,4 +747,7 @@ currentdict /PDFScanRules_null undef
+  } bind executeonly def
+ 
+ end			% pdfdict
++
++systemdict /pdfdict .forceundef		% hide pdfdict
++
+ .setglobal
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0002.patch
new file mode 100644
index 0000000000..1ac9f0cec9
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0002.patch
@@ -0,0 +1,68 @@
+From 873ab2685cee146cfa120dbc983b49f3495b8672 Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Tue, 19 Mar 2019 09:25:48 -0700
+Subject: [PATCH 2/2] Fix lib/pdf2dsc.ps to use documented Ghostscript pdf
+ procedures.
+
+We eliminated GS_PDF_ProcSet and pdfdict, but runpdfbegin, dopdfpages,
+and runpdfend are still available.
+
+CVE: CVE-2019-3839
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ lib/pdf2dsc.ps | 17 +++++------------
+ 1 file changed, 5 insertions(+), 12 deletions(-)
+
+diff --git a/lib/pdf2dsc.ps b/lib/pdf2dsc.ps
+index 878788f..9e44fc5 100644
+--- a/lib/pdf2dsc.ps
++++ b/lib/pdf2dsc.ps
+@@ -52,10 +52,7 @@ systemdict /.setsafe known { .setsafe } if
+ /DSCstring 255 string def
+ /MediaTypes 10 dict def
+ 
+-   GS_PDF_ProcSet begin
+-   pdfdict begin
+-   PDFfile
+-   pdfopen begin
++   PDFfile runpdfbegin
+    /FirstPage where { pop } { /FirstPage 1 def } ifelse
+    /LastPage where { pop } { /LastPage pdfpagecount def } ifelse
+ 
+@@ -108,13 +105,12 @@ systemdict /.setsafe known { .setsafe } if
+    (%%BeginProlog\n) puts
+    (/Page null def\n/Page# 0 def\n/PDFSave null def\n) puts
+    (/DSCPageCount 0 def\n) puts
+-   (/DoPDFPage {dup /Page# exch store pdfgetpage pdfshowpage } def\n) puts
+-   (GS_PDF_ProcSet begin\npdfdict begin\n) puts
++   (/DoPDFPage {dup /Page# exch store dup dopdfpages } def\n) puts
+    (%%EndProlog\n) puts
+    (%%BeginSetup\n) puts
+    DSCfile PDFname write==only
+    ( \(r\) file { DELAYSAFER { .setsafe } if } stopped pop\n) puts
+-   ( pdfopen begin\n) puts
++   ( runpdfbegin\n) puts
+    ( process_trailer_attrs\n) puts
+    (%%EndSetup\n) puts
+ 
+@@ -239,13 +235,10 @@ systemdict /.setsafe known { .setsafe } if
+        DSCfile exch DSCstring cvs writestring
+        ( DoPDFPage\n) puts
+     } for
+-   currentdict pdfclose
+-   end
+-   end
+-   end
++    runpdfend
+ % write trailer
+ (%%Trailer\n) puts
+-(currentdict pdfclose\nend\nend\nend\n) puts
++(runpdfend\n) puts
+ (%%EOF\n) puts
+ % close output file and exit
+ DSCfile closefile
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
index ad4c5e17d2..af65b4792f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
@@ -39,6 +39,8 @@ SRC_URI = "${SRC_URI_BASE} \
            file://CVE-2019-6116-0005.patch \
            file://CVE-2019-6116-0006.patch \
            file://CVE-2019-6116-0007.patch \
+           file://CVE-2019-3839-0001.patch \
+           file://CVE-2019-3839-0002.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.20.1


