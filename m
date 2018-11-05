Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 942B079E99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 07:53:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA57rE2I002892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Nov 2018 23:53:24 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 4 Nov 2018 23:53:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 5 Nov 2018 16:03:35 +0800
Message-ID: <1541405017-7246-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] ghostscript: fix CVE-2018-17961
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
X-List-Received-Date: Mon, 05 Nov 2018 07:53:49 -0000
Content-Type: text/plain

Artifex Ghostscript 9.25 and earlier allows attackers to bypass a
sandbox protection mechanism via vectors involving errorhandler
setup. NOTE: this issue exists because of an incomplete fix for
CVE-2018-17183.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...add-operand-checking-to-.setnativefontmap.patch |  59 +++
 ...Improve-hiding-of-security-critical-custo.patch | 434 +++++++++++++++++++++
 ...32-add-control-over-hiding-error-handlers.patch | 172 ++++++++
 ...operators-pass-a-name-object-to-error-han.patch | 105 +++++
 ...-699938-.loadfontloop-must-be-an-operator.patch |  31 ++
 .../ghostscript/ghostscript_9.25.bb                |   5 +
 6 files changed, 806 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-699795-add-operand-checking-to-.setnativefontmap.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-699816-Improve-hiding-of-security-critical-custo.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0003-Bug-699832-add-control-over-hiding-error-handlers.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0004-For-hidden-operators-pass-a-name-object-to-error-han.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0005-Bug-699938-.loadfontloop-must-be-an-operator.patch

diff --git a/meta/recipes-extended/ghostscript/files/0001-Bug-699795-add-operand-checking-to-.setnativefontmap.patch b/meta/recipes-extended/ghostscript/files/0001-Bug-699795-add-operand-checking-to-.setnativefontmap.patch
new file mode 100644
index 0000000..f175da0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0001-Bug-699795-add-operand-checking-to-.setnativefontmap.patch
@@ -0,0 +1,59 @@
+From 274b2cc08b0d10a4cac3fe8b50022889f22580cb Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 20 Sep 2018 16:35:28 +0100
+Subject: [PATCH 1/5] Bug 699795: add operand checking to
+ .setnativefontmapbuilt
+
+.setnativefontmapbuilt .forceputs a value into systemdict - it is intended
+to be a boolean, but in this case was being called with a compound object
+(a dictionary). Such an object, in local VM, being forced into systemdict
+would then confuse the garbager, since it could be restored away with the
+reference remaining.
+
+This adds operand checking, so .setnativefontmapbuilt will simply ignore
+anything other than a boolean value, and also removes the definition of
+.setnativefontmapbuilt after use, since it is only used in two, closely
+related places.
+
+CVE: CVE-2018-17961
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_fonts.ps | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 38f0f6c..45b6613 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -372,9 +372,13 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ % of strings: what the system thinks is the ps name,
+ % and the access path.
+ /.setnativefontmapbuilt { % set whether we've been run
+-  systemdict exch /.nativefontmapbuilt exch .forceput
++  dup type /booleantype eq {
++      systemdict exch /.nativefontmapbuilt exch .forceput
++  }
++  {pop}
++  ifelse
+ } .bind executeonly def
+-systemdict /NONATIVEFONTMAP known .setnativefontmapbuilt
++systemdict /NONATIVEFONTMAP known //.setnativefontmapbuilt exec
+ /.buildnativefontmap {   % - .buildnativefontmap <bool>
+   systemdict /.nativefontmapbuilt .knownget not
+   { //false} if
+@@ -415,9 +419,10 @@ systemdict /NONATIVEFONTMAP known .setnativefontmapbuilt
+       } forall
+     } if
+     % record that we've been run
+-    //true .setnativefontmapbuilt
++    //true //.setnativefontmapbuilt exec
+   } ifelse
+ } bind def
++currentdict /.setnativefontmapbuilt .forceundef
+ 
+ % Create the dictionary that registers the .buildfont procedure
+ % (called by definefont) for each FontType.
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ghostscript/files/0002-Bug-699816-Improve-hiding-of-security-critical-custo.patch b/meta/recipes-extended/ghostscript/files/0002-Bug-699816-Improve-hiding-of-security-critical-custo.patch
new file mode 100644
index 0000000..000f9c9
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0002-Bug-699816-Improve-hiding-of-security-critical-custo.patch
@@ -0,0 +1,434 @@
+From 0661bf23a5be32973682e17afed4a2f23a8214ba Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Sat, 29 Sep 2018 15:34:55 +0100
+Subject: [PATCH 2/5] Bug 699816: Improve hiding of security critical custom
+ operators
+
+Make procedures that use .forceput/.forcedef/.forceundef into operators.
+
+The result of this is that errors get reported against the "top" operator,
+rather than the "called" operator within the procedure.
+
+For example:
+/myproc
+{
+  myop
+} bind def
+
+If 'myop' throws an error, the error handler will be passed the 'myop'
+operator. Promoting 'myproc' to a operator means the error handler will be
+passed 'myproc'.
+
+CVE: CVE-2018-17961
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_diskn.ps |  2 +-
+ Resource/Init/gs_dps.ps   |  2 +-
+ Resource/Init/gs_fntem.ps |  2 +-
+ Resource/Init/gs_fonts.ps | 10 +++++-----
+ Resource/Init/gs_lev2.ps  | 13 +++++++++----
+ Resource/Init/gs_pdfwr.ps |  2 +-
+ Resource/Init/gs_setpd.ps | 25 +++++++++++++++++--------
+ Resource/Init/gs_typ32.ps | 14 +++++++++-----
+ Resource/Init/gs_type1.ps |  2 +-
+ Resource/Init/pdf_base.ps |  2 +-
+ Resource/Init/pdf_draw.ps | 10 +++++-----
+ Resource/Init/pdf_font.ps |  8 ++++----
+ Resource/Init/pdf_main.ps |  4 ++--
+ Resource/Init/pdf_ops.ps  |  8 ++++----
+ 14 files changed, 61 insertions(+), 43 deletions(-)
+
+diff --git a/Resource/Init/gs_diskn.ps b/Resource/Init/gs_diskn.ps
+index 5540715..26ec0b5 100644
+--- a/Resource/Init/gs_diskn.ps
++++ b/Resource/Init/gs_diskn.ps
+@@ -53,7 +53,7 @@ systemdict begin
+     exch .setglobal
+   }
+   if
+-} .bind executeonly def % must be bound and hidden for .forceput
++} .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ % Modify .putdevparams to force regeneration of .searchabledevs list
+ /.putdevparams {
+diff --git a/Resource/Init/gs_dps.ps b/Resource/Init/gs_dps.ps
+index cad7056..daf7b0f 100644
+--- a/Resource/Init/gs_dps.ps
++++ b/Resource/Init/gs_dps.ps
+@@ -70,7 +70,7 @@
+                 % Save a copy of the initial gstate.
+   //systemdict /savedinitialgstate gstate readonly .forceput
+   .setglobal
+-} .bind executeonly def % must be bound and hidden for .forceput
++} .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ % Initialize local dictionaries and gstate when creating a new context.
+ % Note that until this completes, we are in the anomalous situation of
+diff --git a/Resource/Init/gs_fntem.ps b/Resource/Init/gs_fntem.ps
+index 3ceee18..c1f7651 100644
+--- a/Resource/Init/gs_fntem.ps
++++ b/Resource/Init/gs_fntem.ps
+@@ -408,7 +408,7 @@ currentdict end def
+     exit
+   } loop
+   exch setglobal
+-} .bind executeonly def % must be bound and hidden for .forceput
++} .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ currentdict end /ProcSet defineresource pop
+ 
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 45b6613..89c3ab7 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -377,8 +377,8 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+   }
+   {pop}
+   ifelse
+-} .bind executeonly def
+-systemdict /NONATIVEFONTMAP known //.setnativefontmapbuilt exec
++} .bind executeonly odef
++systemdict /NONATIVEFONTMAP known .setnativefontmapbuilt
+ /.buildnativefontmap {   % - .buildnativefontmap <bool>
+   systemdict /.nativefontmapbuilt .knownget not
+   { //false} if
+@@ -419,7 +419,7 @@ systemdict /NONATIVEFONTMAP known //.setnativefontmapbuilt exec
+       } forall
+     } if
+     % record that we've been run
+-    //true //.setnativefontmapbuilt exec
++    //true .setnativefontmapbuilt
+   } ifelse
+ } bind def
+ currentdict /.setnativefontmapbuilt .forceundef
+@@ -1103,7 +1103,7 @@ $error /SubstituteFont { } put
+ 
+                 % Check to make sure the font was actually loaded.
+         dup 3 index .fontknownget
+-         { dup /PathLoad 4 index //.putgstringcopy exec
++         { dup /PathLoad 4 index .putgstringcopy
+            4 1 roll pop pop pop //true exit
+          } if
+ 
+@@ -1115,7 +1115,7 @@ $error /SubstituteFont { } put
+          {            % Stack: origfontname fontdirectory path filefontname
+            2 index 1 index .fontknownget
+             {   % Yes.  Stack: origfontname fontdirectory path filefontname fontdict
+-              dup 4 -1 roll /PathLoad exch //.putgstringcopy exec
++              dup 4 -1 roll /PathLoad exch .putgstringcopy
+                       % Stack: origfontname fontdirectory filefontname fontdict
+               3 -1 roll pop
+                       % Stack: origfontname filefontname fontdict
+diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
+index eee0b9f..a8ed892 100644
+--- a/Resource/Init/gs_lev2.ps
++++ b/Resource/Init/gs_lev2.ps
+@@ -163,10 +163,11 @@ end
+         % Set them again to the new values.  From here on, we are safe,
+         % since a context switch will consult userparams.
+   .setuserparams
+-} .bind executeonly def % must be bound and hidden for .forceput
++} .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ /setuserparams {		% <dict> setuserparams -
+-    .setuserparams2
++    {.setuserparams2} stopped
++    {/setuserparams load $error /errorname get signalerror} if
+ } .bind odef
+ % Initialize user parameters managed here.
+ /JobName () .definepsuserparam
+@@ -415,7 +416,9 @@ psuserparams /ProcessDSCComment {.checkprocesscomment} put
+ 
+ % VMReclaim and VMThreshold are user parameters.
+ /setvmthreshold {		% <int> setvmthreshold -
+-  mark /VMThreshold 2 .argindex .dicttomark .setuserparams2 pop
++  mark /VMThreshold 2 .argindex .dicttomark {.setuserparams2} stopped
++  {pop /setvmthreshold load $error /errorname get signalerror}
++  {pop} ifelse
+ } odef
+ /vmreclaim {			% <int> vmreclaim -
+   dup 0 gt {
+@@ -427,7 +430,9 @@ psuserparams /ProcessDSCComment {.checkprocesscomment} put
+     ifelse
+   } {
+     % VMReclaim userparam controls enable/disable GC
+-    mark /VMReclaim 2 index .dicttomark .setuserparams2 pop
++    mark /VMReclaim 2 index .dicttomark {.setuserparams2} stopped
++    {pop /vmreclaim load $error /errorname get signalerror}
++    {pop} ifelse
+   } ifelse
+ } odef
+ -1 setvmthreshold
+diff --git a/Resource/Init/gs_pdfwr.ps b/Resource/Init/gs_pdfwr.ps
+index fb1c419..58e75d3 100644
+--- a/Resource/Init/gs_pdfwr.ps
++++ b/Resource/Init/gs_pdfwr.ps
+@@ -660,7 +660,7 @@ currentdict /.pdfmarkparams .undef
+   {
+     pop
+   } ifelse
+-} .bind executeonly def % must be bound and hidden for .forceput
++} .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ % Use the DSC processing hook to pass DSC comments to the driver.
+ % We use a pseudo-parameter named DSC whose value is an array:
+diff --git a/Resource/Init/gs_setpd.ps b/Resource/Init/gs_setpd.ps
+index 8fa7c51..afb4ffa 100644
+--- a/Resource/Init/gs_setpd.ps
++++ b/Resource/Init/gs_setpd.ps
+@@ -608,6 +608,20 @@ NOMEDIAATTRS {
+ % in the <failed> dictionary with the policy value,
+ % and we replace the key in the <merged> dictionary with its prior value
+ % (or remove it if it had no prior value).
++
++% Making this an operator means we can properly hide
++% the contents - specifically .forceput
++/1Policy
++{
++  % Roll back the failed request to its previous status.
++  SETPDDEBUG { (Rolling back.) = pstack flush } if
++  3 index 2 index 3 -1 roll .forceput
++  4 index 1 index .knownget
++   { 4 index 3 1 roll .forceput }
++   { 3 index exch .undef }
++  ifelse
++} bind executeonly odef
++
+ /.policyprocs mark
+ % These procedures are called with the following on the stack:
+ %   <orig> <merged> <failed> <Policies> <key> <policy>
+@@ -631,14 +645,7 @@ NOMEDIAATTRS {
+         /setpagedevice .systemvar /configurationerror signalerror
+       } ifelse
+   } bind
+-  1 {		% Roll back the failed request to its previous status.
+-SETPDDEBUG { (Rolling back.) = pstack flush } if
+-        3 index 2 index 3 -1 roll .forceput
+-        4 index 1 index .knownget
+-         { 4 index 3 1 roll .forceput }
+-         { 3 index exch .undef }
+-        ifelse
+-  } .bind executeonly % must be bound and hidden for .forceput
++  1 /1Policy load
+   7 {		% For PageSize only, just impose the request.
+         1 index /PageSize eq
+          { pop pop 1 index /PageSize 7 put }
+@@ -646,6 +653,8 @@ SETPDDEBUG { (Rolling back.) = pstack flush } if
+         ifelse
+   } bind
+ .dicttomark readonly def
++currentdict /1Policy undef
++
+ /.applypolicies		% <orig> <merged> <failed> .applypolicies
+                         %   <orig> <merged'> <failed'>
+  { 1 index /Policies get 1 index
+diff --git a/Resource/Init/gs_typ32.ps b/Resource/Init/gs_typ32.ps
+index b6600b0..9150f71 100644
+--- a/Resource/Init/gs_typ32.ps
++++ b/Resource/Init/gs_typ32.ps
+@@ -79,15 +79,19 @@ systemdict /.removeglyphs .undef
+ .dicttomark /ProcSet defineresource pop
+ 
+ /.cidfonttypes where { pop } { /.cidfonttypes 6 dict def } ifelse
+-.cidfonttypes begin
+-
+-4	% CIDFontType 4 = FontType 32
+-{ dup /FontType 32 .forceput
++/CIDFontType4
++{
++  dup /FontType 32 .forceput
+   dup /CharStrings 20 dict .forceput
+   1 index exch .buildfont32 exch pop
+-} .bind executeonly def % must be bound and hidden for .forceput
++} .bind executeonly odef
++.cidfonttypes begin
++
++
++4 /CIDFontType4 load def % CIDFontType 4 = FontType 32
+ 
+ end		% .cidfonttypes
++currentdict /CIDFontType4 .forceundef
+ 
+ % Define the BuildGlyph procedure.
+ % Since Type 32 fonts are indexed by CID, there is no BuildChar procedure.
+diff --git a/Resource/Init/gs_type1.ps b/Resource/Init/gs_type1.ps
+index efdae48..2935d9c 100644
+--- a/Resource/Init/gs_type1.ps
++++ b/Resource/Init/gs_type1.ps
+@@ -283,7 +283,7 @@ currentdict /closesourcedict .undef
+   } if
+   2 copy /WeightVector exch .forceput
+   .setweightvector
+-} .bind executeonly def
++} .bind executeonly odef
+ end
+ 
+ % Register the font types for definefont.
+diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
+index a82a2a3..7ccd4cd 100644
+--- a/Resource/Init/pdf_base.ps
++++ b/Resource/Init/pdf_base.ps
+@@ -218,7 +218,7 @@ currentdict /num-chars-dict .undef
+       } ifelse
+     } ifelse
+   } ifelse
+-} bind executeonly def
++} bind executeonly odef
+ /PDFScanRules_true << /PDFScanRules //true >> def
+ /PDFScanRules_null << /PDFScanRules //null >> def
+ /.pdfrun {			% <file> <opdict> .pdfrun -
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index d1b6ac9..c239daf 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -1158,7 +1158,7 @@ currentdict end readonly def
+   Q
+   PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%End PaintProc) print dup === flush } if } if
+   PDFfile exch setfileposition
+-} bind executeonly def
++} bind executeonly odef
+ 
+ /.pdfpaintproc {
+     %% Get the /m from pdfopdict (must be present)
+@@ -1189,7 +1189,7 @@ currentdict end readonly def
+     {
+       switch_to_text_marking_ops
+     } if
+-}bind executeonly def
++}bind executeonly odef
+ 
+ /resolvepattern {	% <patternstreamdict> resolvepattern <patterndict>
+                 % Don't do the resolvestream now: just capture the data
+@@ -2353,7 +2353,7 @@ currentdict /last-ditch-bpc-csp undef
+   }{
+     pdfdict /AppearanceNumber 0 .forceput
+   } ifelse
+-}bind executeonly def
++}bind executeonly odef
+ 
+ /MakeAppearanceName {
+   pdfdict /AppearanceNumber get
+@@ -2382,7 +2382,7 @@ currentdict /last-ditch-bpc-csp undef
+   DoForm
+   pdfdict /.PreservePDFForm 3 -1 roll .forceput
+   grestore
+-} bind executeonly def
++} bind executeonly odef
+ 
+ /DoForm {
+   %% save the current value, if its true we will set it to false later, in order
+@@ -2541,7 +2541,7 @@ currentdict /last-ditch-bpc-csp undef
+     end
+   } if
+   pdfdict /.PreservePDFForm 3 -1 roll .forceput
+-} bind executeonly def
++} bind executeonly odef
+ 
+ /_dops_save 1 array def
+ 
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index feaf0d0..535b14a 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -718,7 +718,7 @@ currentdict end readonly def
+   {pop pop pop}
+   ifelse
+ 
+-} bind executeonly def
++} bind executeonly odef
+ 
+ currentdict /.DoToUnicode? .forceundef
+ 
+@@ -1241,7 +1241,7 @@ currentdict /eexec_pdf_param_dict .undef
+     } bdef
+     dup currentdict Encoding .processToUnicode
+     currentdict end .completefont exch pop
+-} bind executeonly def
++} bind executeonly odef
+ /.adjustcharwidth {	% <wx> <wy> .adjustcharwidth <wx'> <wy'>
+   % Enforce the metrics, in glyph space, to the values found in the PDF Font object
+   % - force wy == 0 (assumed, and not stored in the PDF font)
+@@ -2026,7 +2026,7 @@ currentdict /CMap_read_dict undef
+     } if
+     /findresource cvx /undefined signalerror
+   } loop
+-} bind executeonly def
++} bind executeonly odef
+ 
+ /buildCIDType0 {	% <CIDFontType0-font-resource> buildCIDType0 <font>
+   dup /BaseFont get findCIDFont exch pop
+@@ -2211,7 +2211,7 @@ currentdict /CMap_read_dict undef
+   /Type0 //buildType0
+   /Type1 //buildType1
+   /MMType1 //buildType1
+-  /Type3 //buildType3
++  /Type3 /buildType3 load
+   /TrueType //buildTrueType
+   /CIDFontType0 //buildCIDType0
+   /CIDFontType2 //buildCIDType2
+diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
+index 09f8735..c823e69 100644
+--- a/Resource/Init/pdf_main.ps
++++ b/Resource/Init/pdf_main.ps
+@@ -660,7 +660,7 @@ currentdict /runpdfstring .undef
+     } forall
+     pop
+   } ifelse
+-} bind executeonly def
++} bind executeonly odef
+ 
+ currentdict /pdf_collection_files .undef
+ 
+@@ -2715,7 +2715,7 @@ currentdict /PDF2PS_matrix_key undef
+   .setglobal
+   /RepairedAnError exch def
+   /Repaired exch def
+-} bind executeonly def
++} bind executeonly odef
+ 
+ % Display the contents of a page (including annotations).
+ /showpagecontents {	% <pagedict> showpagecontents -
+diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
+index c45fc51..8672d61 100644
+--- a/Resource/Init/pdf_ops.ps
++++ b/Resource/Init/pdf_ops.ps
+@@ -193,7 +193,7 @@ currentdict /gput_always_allow .undef
+       pdfformaterror
+     } ifelse
+   } if
+-} bind executeonly def
++} bind executeonly odef
+ 
+ % Save PDF gstate
+ /qstate {       % - qstate <qstate>
+@@ -451,7 +451,7 @@ currentdict /gput_always_allow .undef
+   %% a gsave, so we haven't copied it to /self, if we don't do that here
+   %% then transparent annotations cause an invalid access error.
+   currentdict //nodict eq {/self dup load end 5 dict begin def} if
+-} bind executeonly def
++} bind executeonly odef
+ /AIS { .setalphaisshape } bind executeonly def
+ /BM {
+   /.setblendmode where {
+@@ -1077,7 +1077,7 @@ end readonly def
+     pdfopdict /v {inside_text_v} bind .forceput
+     pdfopdict /y {inside_text_y} bind .forceput
+     pdfopdict /re {inside_text_re} bind .forceput
+-} bind executeonly def
++} bind executeonly odef
+ 
+ /switch_to_normal_marking_ops {
+     pdfopdict /m {normal_m} bind .forceput
+@@ -1086,7 +1086,7 @@ end readonly def
+     pdfopdict /v {normal_v} bind .forceput
+     pdfopdict /y {normal_y} bind .forceput
+     pdfopdict /re {normal_re} bind .forceput
+-} bind executeonly def
++} bind executeonly odef
+ 
+ /BT {
+   currentdict /TextSaveMatrix known {
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ghostscript/files/0003-Bug-699832-add-control-over-hiding-error-handlers.patch b/meta/recipes-extended/ghostscript/files/0003-Bug-699832-add-control-over-hiding-error-handlers.patch
new file mode 100644
index 0000000..cd78659
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0003-Bug-699832-add-control-over-hiding-error-handlers.patch
@@ -0,0 +1,172 @@
+From 1f9a91c86bd56acf57826b9b0e020ebe1953e2ae Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 4 Oct 2018 10:42:13 +0100
+Subject: [PATCH 3/5] Bug 699832: add control over hiding error handlers.
+
+With a previous commit changing error handling in SAFER so the handler gets
+passed a name object (rather than executable object), it is less critical to
+hide the error handlers.
+
+This introduces a -dSAFERERRORS option to force only use of the default error
+handlers.
+
+It also adds a .setsafererrors Postscript call, meaning a caller, without
+-dSAFERERRORS, can create their own default error handlers (in errordict, as
+normal), and then call .setsafererrors meaning their own handlers are always
+called.
+
+With -dSAFERERRORS or after a call to .setsafererrors, .setsafererrors is
+removed.
+
+CVE: CVE-2018-17961
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_init.ps | 42 +++++++++++++++++++++++++++++------------
+ psi/interp.c             | 49 ++++++++++++++++++++++++++++--------------------
+ 2 files changed, 59 insertions(+), 32 deletions(-)
+
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index bec307d..f952f32 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -188,6 +188,16 @@ currentdict /DELAYSAFER known { /DELAYSAFER //true def /NOSAFER //true def } if
+   currentdict /PARANOIDSAFER known or	% PARANOIDSAFER is equivalent
+ }
+ ifelse def
++
++/SAFERERRORS
++currentdict /NOSAFERERRORS known
++{
++  //false
++}
++{
++  currentdict /SAFERERRORS known
++} ifelse def
++
+ currentdict /SHORTERRORS known   /SHORTERRORS exch def
+ currentdict /TTYPAUSE known   /TTYPAUSE exch def
+ currentdict /WRITESYSTEMDICT known   /WRITESYSTEMDICT exch def
+@@ -1123,12 +1133,23 @@ errordict begin
+  } bind def
+ end		% errordict
+ 
+-% Put all the default handlers in gserrordict
+-gserrordict
+-errordict {2 index 3 1 roll put} forall
+-noaccess pop
+-% remove the non-standard errors from errordict
++gserrordict /unknownerror errordict /unknownerror get put
+ errordict /unknownerror .undef
++
++/.SAFERERRORLIST ErrorNames def
++/.setsafererrors
++{
++% Put all the requested handlers in gserrordict
++  gserrordict
++  //.SAFERERRORLIST
++  {dup errordict exch get 2 index 3 1 roll put} forall
++  noaccess pop
++  systemdict /.setsafeerrors .forceundef
++  systemdict /.SAFERERRORLIST .forceundef
++} bind executeonly odef
++
++SAFERERRORS {.setsafererrors} if
++
+ % Define a stable private copy of handleerror that we will always use under
+ % JOBSERVER mode.
+ /.GShandleerror errordict /handleerror get def
+@@ -1760,18 +1781,15 @@ currentdict /.runlibfile .undef
+ 
+ % Bind all the operators defined as procedures.
+ /.bindoperators		% binds operators in currentdict
+- { % Temporarily disable the typecheck error.
+-   errordict /typecheck 2 copy get
+-   errordict /typecheck { pop } put	% pop the command
++ {
+    currentdict
+     { dup type /operatortype eq
+-       { % This might be a real operator, so bind might cause a typecheck,
+-         % but we've made the error a no-op temporarily.
+-         .bind
++       {
++         % This might be a real operator, so bind might cause a typecheck
++         {.bind} .internalstopped pop
+        }
+       if pop pop
+     } forall
+-   put
+  } def
+ DELAYBIND not { .bindoperators } if
+ 
+diff --git a/psi/interp.c b/psi/interp.c
+index 3dd5f7a..cd894f9 100644
+--- a/psi/interp.c
++++ b/psi/interp.c
+@@ -662,27 +662,18 @@ again:
+     if (gs_errorname(i_ctx_p, code, &error_name) < 0)
+         return code;            /* out-of-range error code! */
+ 
+-    /*  If LockFilePermissions is true, we only refer to gserrordict, which
+-     *  is not accessible to Postcript jobs
++    /*  We refer to gserrordict first, which is not accessible to Postcript jobs
++     *  If we're running with SAFERERRORS all the handlers are copied to gserrordict
++     *  so we'll always find the default one. If not SAFERERRORS, only gs specific
++     *  errors are in gserrordict.
+      */
+-    if (i_ctx_p->LockFilePermissions) {
+-        if (((dict_find_string(systemdict, "gserrordict", &perrordict) <= 0 ||
+-              dict_find(perrordict, &error_name, &epref) <= 0))
+-            )
+-            return code;            /* error name not in errordict??? */
+-    }
+-    else {
+-        /*
+-         * For greater Adobe compatibility, only the standard PostScript errors
+-         * are defined in errordict; the rest are in gserrordict.
+-         */
+-        if (dict_find_string(systemdict, "errordict", &perrordict) <= 0 ||
+-            (dict_find(perrordict, &error_name, &epref) <= 0 &&
+-             (dict_find_string(systemdict, "gserrordict", &perrordict) <= 0 ||
+-              dict_find(perrordict, &error_name, &epref) <= 0))
+-            )
+-            return code;            /* error name not in errordict??? */
+-    }
++    if (dict_find_string(systemdict, "gserrordict", &perrordict) <= 0 ||
++        (dict_find(perrordict, &error_name, &epref) <= 0 &&
++         (dict_find_string(systemdict, "errordict", &perrordict) <= 0 ||
++          dict_find(perrordict, &error_name, &epref) <= 0))
++        )
++        return code;            /* error name not in errordict??? */
++
+     doref = *epref;
+     epref = &doref;
+     /* Push the error object on the operand stack if appropriate. */
+@@ -695,6 +686,24 @@ again:
+         }
+         *osp = *perror_object;
+         errorexec_find(i_ctx_p, osp);
++        /* If using SAFER, hand a name object to the error handler, rather than the executable
++         * object/operator itself.
++         */
++        if (i_ctx_p->LockFilePermissions) {
++            code = obj_cvs(imemory, osp, buf + 2, 256, &rlen, (const byte **)&bufptr);
++            if (code < 0) {
++                const char *unknownstr = "--unknown--";
++                rlen = strlen(unknownstr);
++                memcpy(buf, unknownstr, rlen);
++            }
++            else {
++                buf[0] = buf[1] = buf[rlen + 2] = buf[rlen + 3] = '-';
++                rlen += 4;
++            }
++            code = name_ref(imemory, buf, rlen, osp, 1);
++            if (code < 0)
++                make_null(osp);
++        }
+     }
+     goto again;
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ghostscript/files/0004-For-hidden-operators-pass-a-name-object-to-error-han.patch b/meta/recipes-extended/ghostscript/files/0004-For-hidden-operators-pass-a-name-object-to-error-han.patch
new file mode 100644
index 0000000..6c715ad
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0004-For-hidden-operators-pass-a-name-object-to-error-han.patch
@@ -0,0 +1,105 @@
+From 34a8c5aa987d4db5234172a62218b168371606b1 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 2 Oct 2018 16:02:58 +0100
+Subject: [PATCH 4/5] For hidden operators, pass a name object to error
+ handler.
+
+In normal operation, Postscript error handlers are passed the object which
+triggered the error: this is invariably an operator object.
+
+The issue arises when an error is triggered by an operator which is for internal
+use only, and that operator is then passed to the error handler, meaning it
+becomes visible to the error handler code.
+
+By converting to a name object, the error message is still valid, but we no
+longer expose internal use only operators.
+
+The change in gs_dps1.ps is related to the above: previously an error in
+scheck would throw an error against .gcheck, but as .gcheck is now a hidden
+operator, it resulted in a name object being passed to the error handler. As
+scheck is a 'real' operator, it's better to use the real operator, rather than
+the name of an internal, hidden one.
+
+CVE: CVE-2018-17961
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_dps1.ps |  2 +-
+ psi/interp.c             | 33 ++++++++++++++++++++++++---------
+ 2 files changed, 25 insertions(+), 10 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index 1182f53..ec5db61 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -21,7 +21,7 @@ level2dict begin
+ % ------ Virtual memory ------ %
+ 
+ /currentshared /.currentglobal load def
+-/scheck /.gcheck load def
++/scheck {.gcheck} bind odef
+ %****** FOLLOWING IS WRONG ******
+ /shareddict currentdict /globaldict .knownget not { 20 dict } if def
+ 
+diff --git a/psi/interp.c b/psi/interp.c
+index cd894f9..b70769d 100644
+--- a/psi/interp.c
++++ b/psi/interp.c
+@@ -678,6 +678,8 @@ again:
+     epref = &doref;
+     /* Push the error object on the operand stack if appropriate. */
+     if (!GS_ERROR_IS_INTERRUPT(code)) {
++        byte buf[260], *bufptr;
++        uint rlen;
+         /* Replace the error object if within an oparray or .errorexec. */
+         osp++;
+         if (osp >= ostop) {
+@@ -686,23 +688,36 @@ again:
+         }
+         *osp = *perror_object;
+         errorexec_find(i_ctx_p, osp);
+-        /* If using SAFER, hand a name object to the error handler, rather than the executable
+-         * object/operator itself.
+-         */
+-        if (i_ctx_p->LockFilePermissions) {
++
++        if (!r_has_type(osp, t_string) && !r_has_type(osp, t_name)) {
+             code = obj_cvs(imemory, osp, buf + 2, 256, &rlen, (const byte **)&bufptr);
+             if (code < 0) {
+                 const char *unknownstr = "--unknown--";
+                 rlen = strlen(unknownstr);
+                 memcpy(buf, unknownstr, rlen);
++                bufptr = buf;
+             }
+             else {
+-                buf[0] = buf[1] = buf[rlen + 2] = buf[rlen + 3] = '-';
+-                rlen += 4;
++                ref *tobj;
++                bufptr[rlen] = '\0';
++                /* Only pass a name object if the operator doesn't exist in systemdict
++                 * i.e. it's an internal operator we have hidden
++                 */
++                code = dict_find_string(systemdict, (const char *)bufptr, &tobj);
++                if (code < 0) {
++                    buf[0] = buf[1] = buf[rlen + 2] = buf[rlen + 3] = '-';
++                    rlen += 4;
++                    bufptr = buf;
++                }
++                else {
++                    bufptr = NULL;
++                }
++            }
++            if (bufptr) {
++                code = name_ref(imemory, buf, rlen, osp, 1);
++                if (code < 0)
++                    make_null(osp);
+             }
+-            code = name_ref(imemory, buf, rlen, osp, 1);
+-            if (code < 0)
+-                make_null(osp);
+         }
+     }
+     goto again;
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ghostscript/files/0005-Bug-699938-.loadfontloop-must-be-an-operator.patch b/meta/recipes-extended/ghostscript/files/0005-Bug-699938-.loadfontloop-must-be-an-operator.patch
new file mode 100644
index 0000000..4924b3c
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/files/0005-Bug-699938-.loadfontloop-must-be-an-operator.patch
@@ -0,0 +1,31 @@
+From f0a61679d28bc1561640403d92492e199bc1c0f3 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 10 Oct 2018 23:25:51 +0100
+Subject: [PATCH 5/5] Bug 699938: .loadfontloop must be an operator
+
+In the fix for Bug 699816, I omitted to make .loadfontloop into an operator, to
+better hide .forceundef and .putgstringcopy.
+
+CVE: CVE-2018-17961
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_fonts.ps | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 89c3ab7..72feff2 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -1148,7 +1148,7 @@ $error /SubstituteFont { } put
+ 
+     } loop              % end of loop
+ 
+- } bind executeonly def % must be bound and hidden for .putgstringcopy
++ } bind executeonly odef % must be bound and hidden for .putgstringcopy
+ 
+ currentdict /.putgstringcopy .undef
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
index 35eaaeb..55251a5 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
@@ -25,6 +25,11 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://0001-Bug-699795-add-operand-checking-to-.setnativefontmap.patch \
+                file://0002-Bug-699816-Improve-hiding-of-security-critical-custo.patch \
+                file://0003-Bug-699832-add-control-over-hiding-error-handlers.patch \
+                file://0004-For-hidden-operators-pass-a-name-object-to-error-han.patch \
+                file://0005-Bug-699938-.loadfontloop-must-be-an-operator.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.7.4


