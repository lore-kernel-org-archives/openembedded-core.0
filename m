Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5F57D557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:58:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x35Ew6Rg021678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2019 07:58:07 -0700 (PDT)
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 5 Apr 2019 07:58:06 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Apr 2019 17:56:31 +0300
Message-ID: <20190405145631.10612-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ghostscript: Fix 3 CVEs
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
X-List-Received-Date: Fri, 05 Apr 2019 14:58:09 -0000
Content-Type: text/plain

It was discovered that the ghostscript /invalidaccess checks fail under
certain conditions. An attacker could possibly exploit this to bypass
the -dSAFER protection and, for example, execute arbitrary shell commands
via a specially crafted PostScript document.

It was found that the superexec operator was available in the internal
dictionary in ghostscript before 9.27. A specially crafted PostScript
file could use this flaw in order to, for example, have access to the
file system outside of the constrains imposed by -dSAFER.

It was found that the forceput operator could be extracted from the
DefineResource method in ghostscript before 9.27. A specially crafted
PostScript file could use this flaw in order to, for example, have
access to the file system outside of the constrains imposed by -dSAFER.

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-6116
https://www.openwall.com/lists/oss-security/2019/01/23/5
https://nvd.nist.gov/vuln/detail/CVE-2019-3835
https://nvd.nist.gov/vuln/detail/CVE-2019-3838

Upstream patches:
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=13b0a36
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=2db98f9
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=99f1309
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=59d8f4d
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=2768d1a
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=49c8092
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=2ff600a
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=779664d
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=e8acf6d
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=2055917
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d683d1e
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=ed9fcd9
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=a82601e

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../ghostscript/CVE-2019-3835-0001.patch      |  99 +++
 .../ghostscript/CVE-2019-3835-0002.patch      |  71 +++
 .../ghostscript/CVE-2019-3835-0003.patch      | 295 +++++++++
 .../ghostscript/CVE-2019-3835-0004.patch      | 167 +++++
 .../ghostscript/CVE-2019-3838-0001.patch      |  34 +
 .../ghostscript/CVE-2019-3838-0002.patch      |  30 +
 .../ghostscript/CVE-2019-6116-0001.patch      | 177 ++++++
 .../ghostscript/CVE-2019-6116-0002.patch      | 442 +++++++++++++
 .../ghostscript/CVE-2019-6116-0003.patch      |  32 +
 .../ghostscript/CVE-2019-6116-0004.patch      | 136 ++++
 .../ghostscript/CVE-2019-6116-0005.patch      | 250 ++++++++
 .../ghostscript/CVE-2019-6116-0006.patch      | 596 ++++++++++++++++++
 .../ghostscript/CVE-2019-6116-0007.patch      | 346 ++++++++++
 .../ghostscript/ghostscript_9.26.bb           |  13 +
 14 files changed, 2688 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0002.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0003.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0004.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0002.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0002.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0003.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0004.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0005.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0006.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0007.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0001.patch
new file mode 100644
index 0000000000..30ce04a7b1
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0001.patch
@@ -0,0 +1,99 @@
+From ad3ad6b389653722507e588c5cb34d8731e49e89 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 26 Nov 2018 18:01:25 +0000
+Subject: [PATCH] Have gs_cet.ps run from gs_init.ps
+
+Previously gs_cet.ps was run on the command line, to set up the interpreter
+state so our output more closely matches the example output for the QL CET
+tests.
+
+Allow a -dCETMODE command line switch, which will cause gs_init.ps to run the
+file directly.
+
+This works better for gpdl as it means the changes are made in the intial
+interpreter state, rather than after initialisation is complete.
+
+This also means adding a definition of the default procedure for black
+generation and under color removal (rather it being defined in-line in
+.setdefaultbgucr
+
+Also, add a check so gs_cet.ps only runs once - if we try to run it a second
+time, we'll just skip over the file, flushing through to the end.
+
+CVE: CVE-2019-3835
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_cet.ps  | 11 ++++++++++-
+ Resource/Init/gs_init.ps | 13 ++++++++++++-
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/Resource/Init/gs_cet.ps b/Resource/Init/gs_cet.ps
+index d3e1686..75534bb 100644
+--- a/Resource/Init/gs_cet.ps
++++ b/Resource/Init/gs_cet.ps
+@@ -1,6 +1,11 @@
+ %!PS
+ % Set defaults for Ghostscript to match Adobe CPSI behaviour for CET
+ 
++systemdict /product get (PhotoPRINT SE 5.0v2) readonly eq
++{
++  (%END GS_CET) .skipeof
++} if
++
+ % do this in the server level so it is persistent across jobs
+ //true 0 startjob not {
+   (*** Warning: CET startup is not in server default) = flush
+@@ -25,7 +30,9 @@ currentglobal //true setglobal
+ 
+ /UNROLLFORMS true def
+ 
+-{ } bind dup
++(%.defaultbgrucrproc) cvn { } bind def
++
++(%.defaultbgrucrproc) cvn load dup
+ setblackgeneration
+ setundercolorremoval
+ 0 array cvx readonly dup dup dup setcolortransfer
+@@ -109,3 +116,5 @@ userdict /.smoothness currentsmoothness put
+ % end of slightly nasty hack to give consistent cluster results
+ 
+ //false 0 startjob pop		% re-enter encapsulated mode
++
++%END GS_CET
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 45bebf4..e6b9cd2 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -1538,10 +1538,18 @@ setpacking
+   % any-part-of-pixel rule.
+   0.5 .setfilladjust
+ } bind def
++
+ % Set the default screen and BG/UCR.
++% We define the proc here, rather than inline in .setdefaultbgucr
++% for the benefit of gs_cet.ps so jobs that do anything that causes
++% .setdefaultbgucr to be called will still get the redefined proc
++% in gs_cet.ps
++(%.defaultbgrucrproc) cvn { pop 0 } def
++
+ /.setdefaultbgucr {
+   systemdict /setblackgeneration known {
+-    { pop 0 } dup setblackgeneration setundercolorremoval
++    (%.defaultbgrucrproc) cvn load dup
++    setblackgeneration setundercolorremoval
+   } if
+ } bind def
+ /.useloresscreen {	% - .useloresscreen <bool>
+@@ -2491,4 +2499,7 @@ WRITESYSTEMDICT {
+ % be 'true' in some cases.
+ userdict /AGM_preserve_spots //false put
+ 
++systemdict /CETMODE .knownget
++{ { (gs_cet.ps) runlibfile } if } if
++
+ % The interpreter will run the initial procedure (start).
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0002.patch
new file mode 100644
index 0000000000..590b92e186
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0002.patch
@@ -0,0 +1,71 @@
+From ba6dbd6e61dbb3cc6ee6db9dd3a4f70cc18f706e Mon Sep 17 00:00:00 2001
+From: Nancy Durgin <nancy.durgin@artifex.com>
+Date: Thu, 14 Feb 2019 10:09:00 -0800
+Subject: [PATCH] Undef /odef in gs_init.ps
+
+Made a new temporary utility function in gs_cet.ps (.odef) to use instead
+of /odef.  This makes it fine to undef odef with all the other operators in
+gs_init.ps
+
+This punts the bigger question of what to do with .makeoperator, but it
+doesn't make the situation any worse than it already was.
+
+CVE: CVE-2019-3835
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_cet.ps  | 10 ++++++++--
+ Resource/Init/gs_init.ps |  1 +
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/Resource/Init/gs_cet.ps b/Resource/Init/gs_cet.ps
+index 75534bb..dbc5c4e 100644
+--- a/Resource/Init/gs_cet.ps
++++ b/Resource/Init/gs_cet.ps
+@@ -1,6 +1,10 @@
+ %!PS
+ % Set defaults for Ghostscript to match Adobe CPSI behaviour for CET
+ 
++/.odef {		% <name> <proc> odef -
++  1 index exch .makeoperator def
++} bind def
++
+ systemdict /product get (PhotoPRINT SE 5.0v2) readonly eq
+ {
+   (%END GS_CET) .skipeof
+@@ -93,8 +97,8 @@ userdict /.smoothness currentsmoothness put
+    } {
+      /setsmoothness .systemvar /typecheck signalerror
+    } ifelse
+-} bind odef
+-/currentsmoothness { userdict /.smoothness get } bind odef % for 09-55.PS, 09-57.PS .
++} bind //.odef exec
++/currentsmoothness { userdict /.smoothness get } bind //.odef exec % for 09-55.PS, 09-57.PS .
+ 
+ % slightly nasty hack to give consistent cluster results
+ /ofnfa systemdict /filenameforall get def
+@@ -113,6 +117,8 @@ userdict /.smoothness currentsmoothness put
+   } ifelse
+   ofnfa
+ } bind def
++
++currentdict /.odef undef
+ % end of slightly nasty hack to give consistent cluster results
+ 
+ //false 0 startjob pop		% re-enter encapsulated mode
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index e6b9cd2..80d9585 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2257,6 +2257,7 @@ SAFER { .setsafeglobal } if
+   /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserparams /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
+   /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath /.currentoutputdevice
+   /.type /.writecvs /.setSMask /.currentSMask /.needinput /.countexecstack /.execstack /.applypolicies
++  /odef
+ 
+   % Used by a free user in the Library of Congress. Apparently this is used to
+   % draw a partial page, which is then filled in by the results of a barcode
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0003.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0003.patch
new file mode 100644
index 0000000000..a339fa2f33
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0003.patch
@@ -0,0 +1,295 @@
+From 4203e04ef9e6ca22ed68a1ab10a878aa9ceaeedc Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Thu, 14 Feb 2019 10:20:03 -0800
+Subject: [PATCH] Fix bug 700585: Restrict superexec and remove it from
+ internals and gs_cet.ps
+
+Also while changing things, restructure the CETMODE so that it will
+work with -dSAFER. The gs_cet.ps is now run when we are still at save
+level 0 with systemdict writeable. Allows us to undefine .makeoperator
+and .setCPSImode internal operators after CETMODE is handled.
+
+Change previous uses of superexec to using .forceput (with the usual
+.bind executeonly to hide it).
+
+CVE: CVE-2019-3835
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_cet.ps   | 38 ++++++++++++++------------------------
+ Resource/Init/gs_dps1.ps  |  2 +-
+ Resource/Init/gs_fonts.ps |  8 ++++----
+ Resource/Init/gs_init.ps  | 38 +++++++++++++++++++++++++++-----------
+ Resource/Init/gs_ttf.ps   |  8 ++++----
+ Resource/Init/gs_type1.ps |  6 +++---
+ 6 files changed, 53 insertions(+), 47 deletions(-)
+
+diff --git a/Resource/Init/gs_cet.ps b/Resource/Init/gs_cet.ps
+index dbc5c4e..3cc6883 100644
+--- a/Resource/Init/gs_cet.ps
++++ b/Resource/Init/gs_cet.ps
+@@ -1,37 +1,29 @@
+ %!PS
+ % Set defaults for Ghostscript to match Adobe CPSI behaviour for CET
+ 
+-/.odef {		% <name> <proc> odef -
+-  1 index exch .makeoperator def
+-} bind def
+-
++% skip if we've already run this -- based on fake "product"
+ systemdict /product get (PhotoPRINT SE 5.0v2) readonly eq
+ {
+   (%END GS_CET) .skipeof
+ } if
+ 
+-% do this in the server level so it is persistent across jobs
+-//true 0 startjob not {
+-  (*** Warning: CET startup is not in server default) = flush
+-} if
++% Note: this must be run at save level 0 and when systemdict is writeable
++currentglobal //true setglobal
++systemdict dup dup dup
++/version (3017.102) readonly .forceput		% match CPSI 3017.102
++/product (PhotoPRINT SE 5.0v2) readonly .forceput	% match CPSI 3017.102
++/revision 0 put			% match CPSI 3017.103 Tek shows revision 5
++/serialnumber dup {233640} readonly .makeoperator .forceput % match CPSI 3017.102 Tek shows serialnumber 1401788461
++
++systemdict /.odef {           % <name> <proc> odef -
++  1 index exch //.makeoperator def
++} .bind .forceput          % this will be undefined at the end
+ 
+ 300 .sethiresscreen	% needed for language switch build since it
+                         % processes gs_init.ps BEFORE setting the resolution
+ 
+ 0 array 0 setdash % CET 09-08 wants local setdash
+ 
+-currentglobal //true setglobal
+-
+-{
+-  systemdict dup dup dup
+-  /version (3017.102) readonly put		% match CPSI 3017.102
+-  /product (PhotoPRINT SE 5.0v2) readonly put	% match CPSI 3017.102
+-  /revision 0 put			% match CPSI 3017.103 Tek shows revision 5
+-  /serialnumber dup {233640} readonly .makeoperator put % match CPSI 3017.102 Tek shows serialnumber 1401788461
+-  systemdict /deviceinfo undef                  % for CET 20-23-1
+-%  /UNROLLFORMS true put                 % CET files do unreasonable things inside forms
+-} 1183615869 internaldict /superexec get exec
+-
+ /UNROLLFORMS true def
+ 
+ (%.defaultbgrucrproc) cvn { } bind def
+@@ -118,9 +110,7 @@ userdict /.smoothness currentsmoothness put
+   ofnfa
+ } bind def
+ 
+-currentdict /.odef undef
+-% end of slightly nasty hack to give consistent cluster results
+-
+-//false 0 startjob pop		% re-enter encapsulated mode
++systemdict /.odef .undef
+ 
++% end of slightly nasty hack to give consistent cluster results
+ %END GS_CET
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index 3d2cf7a..c4fd839 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -89,7 +89,7 @@ level2dict begin
+                 % definition, copy it into the local directory.
+       //systemdict /SharedFontDirectory .knownget
+        { 1 index .knownget
+-          { //.FontDirectory 2 index 3 -1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse } % readonly
++          { //.FontDirectory 2 index 3 -1 roll .forceput } % readonly
+          if
+        }
+       if
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 0562235..f2b4e19 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -519,11 +519,11 @@ buildfontdict 3 /.buildfont3 cvx put
+                 % the font in LocalFontDirectory.
+    .currentglobal
+     { //systemdict /LocalFontDirectory .knownget
+-       { 2 index 2 index { .growput } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse }	% readonly
++       { 2 index 2 index .forceput }	% readonly
+       if
+     }
+    if
+-   dup //.FontDirectory 4 -2 roll { .growput } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse	% readonly
++   dup //.FontDirectory 4 -2 roll .forceput % readonly
+                 % If the font originated as a resource, register it.
+    currentfile .currentresourcefile eq { dup .registerfont } if
+    readonly
+@@ -1191,13 +1191,13 @@ $error /SubstituteFont { } put
+           //.FontDirectory 1 index known not {
+             2 dict dup /FontName 3 index put
+             dup /FontType 1 put
+-            //.FontDirectory 3 1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse   % readonly
++            //.FontDirectory 3 1 roll //.forceput exec % readonly
+           } {
+             pop
+           } ifelse
+         } forall
+       } forall
+-    }
++    } executeonly	% hide .forceput
+ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+ 
+ % Install initial fonts from Fontmap.
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 80d9585..0d5c4f7 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2188,9 +2188,6 @@ SAFER { .setsafeglobal } if
+   /.endtransparencygroup     % transparency-example.ps
+   /.setdotlength             % Bug687720.ps
+   /.sort /.setdebug /.mementolistnewblocks /getenv
+-
+-  /.makeoperator /.setCPSImode              % gs_cet.ps, this won't work on cluster with -dSAFER
+-
+   /unread
+   ]
+   {systemdict exch .forceundef} forall
+@@ -2270,7 +2267,6 @@ SAFER { .setsafeglobal } if
+ 
+   % Used by our own test suite files
+   %/.fileposition %image-qa.ps
+-  %/.makeoperator /.setCPSImode % gs_cet.ps
+ 
+   % Either our code uses these in ways which mean they can't be undefined, or they are used directly by
+   % test files/utilities, or engineers expressed a desire to keep them visible.
+@@ -2457,6 +2453,16 @@ end
+ /vmreclaim where
+  { pop NOGC not { 2 .vmreclaim 0 vmreclaim } if
+  } if
++
++% Do this before systemdict is locked (see below for additional CETMODE setup using gs_cet.ps)
++systemdict /CETMODE .knownget {
++  {
++    (gs_cet.ps) runlibfile
++  } if
++} if
++systemdict /.makeoperator .undef	% must be after gs_cet.ps
++systemdict /.setCPSImode .undef		% must be after gs_cet.ps
++
+ DELAYBIND not {
+   systemdict /.bindnow .undef       % We only need this for DELAYBIND
+   systemdict /.forcecopynew .undef	% remove temptation
+@@ -2464,16 +2470,29 @@ DELAYBIND not {
+   systemdict /.forceundef .undef	% ditto
+ } if
+ 
+-% Move superexec to internaldict if superexec is defined.
+-systemdict /superexec .knownget {
+-  1183615869 internaldict /superexec 3 -1 roll put
+-  systemdict /superexec .undef
++% Move superexec to internaldict if superexec is defined. (Level 2 or later)
++systemdict /superexec known {
++  % restrict superexec to single known use by PScript5.dll
++  % We could do this only for SAFER mode, but internaldict and superexec are
++  % not very well documented, and we don't want them to be used.
++  1183615869 internaldict /superexec {
++    2 index /Private eq		% first check for typical use in PScript5.dll
++    1 index length 1 eq and	% expected usage is: dict /Private <value> {put} superexec
++    1 index 0 get systemdict /put get eq and
++    {
++      //superexec exec		% the only usage we allow
++    } {
++      /superexec load /invalidaccess signalerror
++    } ifelse
++  } bind cvx executeonly put
++  systemdict /superexec .undef	% get rid of the dangerous (unrestricted) operator
+ } if
+ 
+ % Can't remove this one until the last minute :-)
+ DELAYBIND not {
+ systemdict /.undef .undef
+ } if
++
+ WRITESYSTEMDICT {
+    SAFER {
+        (\n *** WARNING - you have selected SAFER, indicating you want Ghostscript\n) print
+@@ -2500,7 +2519,4 @@ WRITESYSTEMDICT {
+ % be 'true' in some cases.
+ userdict /AGM_preserve_spots //false put
+ 
+-systemdict /CETMODE .knownget
+-{ { (gs_cet.ps) runlibfile } if } if
+-
+ % The interpreter will run the initial procedure (start).
+diff --git a/Resource/Init/gs_ttf.ps b/Resource/Init/gs_ttf.ps
+index 05943c5..da97afa 100644
+--- a/Resource/Init/gs_ttf.ps
++++ b/Resource/Init/gs_ttf.ps
+@@ -1421,7 +1421,7 @@ mark
+           TTFDEBUG { (\n1 setting alias: ) print dup ==only
+                 ( to be the same as  ) print 2 index //== exec } if
+ 
+-          7 index 2 index 3 -1 roll exch //.growput systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse
++          7 index 2 index 3 -1 roll exch .forceput
+         } forall
+         pop pop pop
+       }
+@@ -1439,7 +1439,7 @@ mark
+           exch pop
+           TTFDEBUG { (\n2 setting alias: ) print 1 index ==only
+                      ( to use glyph index: ) print dup //== exec } if
+-          5 index 3 1 roll //.growput systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse
++          5 index 3 1 roll .forceput
+           //false
+         }
+         {
+@@ -1456,7 +1456,7 @@ mark
+         {                            %  CharStrings(dict) isunicode(boolean) cmap(dict) RAGL(dict) gname(name) codep(integer) gindex(integer)
+           TTFDEBUG { (\3 nsetting alias: ) print 1 index ==only
+                 ( to be index: ) print dup //== exec } if
+-          exch pop 5 index 3 1 roll //.growput systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse
++          exch pop 5 index 3 1 roll .forceput
+         }
+         {
+           pop pop
+@@ -1486,7 +1486,7 @@ mark
+       } ifelse
+     ]
+   TTFDEBUG { (Encoding: ) print dup === flush } if
+-} bind def
++} .bind executeonly odef		% hides .forceput
+ 
+ % to be removed 9.09......
+ currentdict /postalias undef
+diff --git a/Resource/Init/gs_type1.ps b/Resource/Init/gs_type1.ps
+index 96e1ced..61f5269 100644
+--- a/Resource/Init/gs_type1.ps
++++ b/Resource/Init/gs_type1.ps
+@@ -116,7 +116,7 @@
+                  {                                               % scratch(string) RAGL(dict) AGL(dict) CharStrings(dict) cstring gname aglname
+                    CFFDEBUG { (\nsetting alias: ) print dup ==only
+                          ( to be the same as glyph: ) print 1 index //== exec } if
+-                   3 index exch 3 index //.growput systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse
++                   3 index exch 3 index .forceput
+                                                                  % scratch(string) RAGL(dict) AGL(dict) CharStrings(dict) cstring gname
+                  }
+                  {pop} ifelse
+@@ -135,7 +135,7 @@
+          3 1 roll pop pop
+      } if
+      pop
+-     dup /.AGLprocessed~GS //true //.growput systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse
++     dup /.AGLprocessed~GS //true .forceput
+    } if
+ 
+    %% We need to excute the C .buildfont1 in a stopped context so that, if there
+@@ -148,7 +148,7 @@
+    {//.buildfont1} stopped
+    4 3 roll .setglobal
+    {//.buildfont1 $error /errorname get signalerror} if
+- } bind def
++ } .bind executeonly def	% hide .forceput
+ 
+ % If the diskfont feature isn't included, define a dummy .loadfontdict.
+ /.loadfontdict where
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0004.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0004.patch
new file mode 100644
index 0000000000..5228cace24
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3835-0004.patch
@@ -0,0 +1,167 @@
+From 5845e667dda3c945ee793fbe6af021533cb4fbec Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Sun, 24 Feb 2019 22:01:04 -0800
+Subject: [PATCH] Bug 700585: Obliterate "superexec". We don't need it, nor
+ do any known apps.
+
+We were under the impression that the Windows driver 'PScript5.dll' used
+superexec, but after testing with our extensive suite of PostScript file,
+and analysis of the PScript5 "Adobe CoolType ProcSet, it does not appear
+that this operator is needed anymore. Get rid of superexec and all of the
+references to it, since it is a potential security hole.
+
+CVE: CVE-2019-3835
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_init.ps | 18 ------------------
+ psi/icontext.c           |  1 -
+ psi/icstate.h            |  1 -
+ psi/zcontrol.c           | 30 ------------------------------
+ psi/zdict.c              |  6 ++----
+ psi/zgeneric.c           |  3 +--
+ 6 files changed, 3 insertions(+), 56 deletions(-)
+
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 0d5c4f7..c5ac82a 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2470,24 +2470,6 @@ DELAYBIND not {
+   systemdict /.forceundef .undef	% ditto
+ } if
+ 
+-% Move superexec to internaldict if superexec is defined. (Level 2 or later)
+-systemdict /superexec known {
+-  % restrict superexec to single known use by PScript5.dll
+-  % We could do this only for SAFER mode, but internaldict and superexec are
+-  % not very well documented, and we don't want them to be used.
+-  1183615869 internaldict /superexec {
+-    2 index /Private eq		% first check for typical use in PScript5.dll
+-    1 index length 1 eq and	% expected usage is: dict /Private <value> {put} superexec
+-    1 index 0 get systemdict /put get eq and
+-    {
+-      //superexec exec		% the only usage we allow
+-    } {
+-      /superexec load /invalidaccess signalerror
+-    } ifelse
+-  } bind cvx executeonly put
+-  systemdict /superexec .undef	% get rid of the dangerous (unrestricted) operator
+-} if
+-
+ % Can't remove this one until the last minute :-)
+ DELAYBIND not {
+ systemdict /.undef .undef
+diff --git a/psi/icontext.c b/psi/icontext.c
+index 1fbe486..7462ea3 100644
+--- a/psi/icontext.c
++++ b/psi/icontext.c
+@@ -151,7 +151,6 @@ context_state_alloc(gs_context_state_t ** ppcst,
+     pcst->rand_state = rand_state_initial;
+     pcst->usertime_total = 0;
+     pcst->keep_usertime = false;
+-    pcst->in_superexec = 0;
+     pcst->plugin_list = 0;
+     make_t(&pcst->error_object, t__invalid);
+     {	/*
+diff --git a/psi/icstate.h b/psi/icstate.h
+index 4c6a14d..1009d85 100644
+--- a/psi/icstate.h
++++ b/psi/icstate.h
+@@ -54,7 +54,6 @@ struct gs_context_state_s {
+     long usertime_total;	/* total accumulated usertime, */
+                                 /* not counting current time if running */
+     bool keep_usertime;		/* true if context ever executed usertime */
+-    int in_superexec;		/* # of levels of superexec */
+     /* View clipping is handled in the graphics state. */
+     ref error_object;		/* t__invalid or error object from operator */
+     ref userparams;		/* t_dictionary */
+diff --git a/psi/zcontrol.c b/psi/zcontrol.c
+index 0362cf4..dc813e8 100644
+--- a/psi/zcontrol.c
++++ b/psi/zcontrol.c
+@@ -158,34 +158,6 @@ zexecn(i_ctx_t *i_ctx_p)
+     return o_push_estack;
+ }
+ 
+-/* <obj> superexec - */
+-static int end_superexec(i_ctx_t *);
+-static int
+-zsuperexec(i_ctx_t *i_ctx_p)
+-{
+-    os_ptr op = osp;
+-    es_ptr ep;
+-
+-    check_op(1);
+-    if (!r_has_attr(op, a_executable))
+-        return 0;		/* literal object just gets pushed back */
+-    check_estack(2);
+-    ep = esp += 3;
+-    make_mark_estack(ep - 2, es_other, end_superexec); /* error case */
+-    make_op_estack(ep - 1,  end_superexec); /* normal case */
+-    ref_assign(ep, op);
+-    esfile_check_cache();
+-    pop(1);
+-    i_ctx_p->in_superexec++;
+-    return o_push_estack;
+-}
+-static int
+-end_superexec(i_ctx_t *i_ctx_p)
+-{
+-    i_ctx_p->in_superexec--;
+-    return 0;
+-}
+-
+ /* <array> <executable> .runandhide <obj>				*/
+ /* 	before executing  <executable>, <array> is been removed from	*/
+ /*	the operand stack and placed on the execstack with attributes	*/
+@@ -971,8 +943,6 @@ const op_def zcontrol3_op_defs[] = {
+     {"0%loop_continue", loop_continue},
+     {"0%repeat_continue", repeat_continue},
+     {"0%stopped_push", stopped_push},
+-    {"1superexec", zsuperexec},
+-    {"0%end_superexec", end_superexec},
+     {"2.runandhide", zrunandhide},
+     {"0%end_runandhide", end_runandhide},
+     op_def_end(0)
+diff --git a/psi/zdict.c b/psi/zdict.c
+index b0deaaa..e2e525d 100644
+--- a/psi/zdict.c
++++ b/psi/zdict.c
+@@ -212,8 +212,7 @@ zundef(i_ctx_t *i_ctx_p)
+     int code;
+ 
+     check_type(*op1, t_dictionary);
+-    if (i_ctx_p->in_superexec == 0)
+-        check_dict_write(*op1);
++    check_dict_write(*op1);
+     code = idict_undef(op1, op);
+     if (code < 0 && code != gs_error_undefined) /* ignore undefined error */
+         return code;
+@@ -504,8 +503,7 @@ zsetmaxlength(i_ctx_t *i_ctx_p)
+     int code;
+ 
+     check_type(*op1, t_dictionary);
+-    if (i_ctx_p->in_superexec == 0)
+-        check_dict_write(*op1);
++    check_dict_write(*op1);
+     check_type(*op, t_integer);
+     if (op->value.intval < 0)
+         return_error(gs_error_rangecheck);
+diff --git a/psi/zgeneric.c b/psi/zgeneric.c
+index 8048e28..d4edddb 100644
+--- a/psi/zgeneric.c
++++ b/psi/zgeneric.c
+@@ -204,8 +204,7 @@ zput(i_ctx_t *i_ctx_p)
+ 
+     switch (r_type(op2)) {
+         case t_dictionary:
+-            if (i_ctx_p->in_superexec == 0)
+-                check_dict_write(*op2);
++            check_dict_write(*op2);
+             {
+                 int code = idict_put(op2, op1, op);
+ 
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0001.patch
new file mode 100644
index 0000000000..593109fb9f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0001.patch
@@ -0,0 +1,34 @@
+From 53f0cb4c54ac951697704cb87d24154ae08aecce Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 20 Feb 2019 09:54:28 +0000
+Subject: [PATCH] Bug 700576: Make a transient proc executeonly (in
+ DefineResource).
+
+This prevents access to .forceput
+
+Solution originally suggested by cbuissar@redhat.com.
+
+CVE: CVE-2019-3838
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_res.ps | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index 89c0ed6..a163541 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -426,7 +426,7 @@ status {
+                         % so we have to use .forceput here.
+                   currentdict /.Instances 2 index .forceput	% Category dict is read-only
+                 } executeonly if
+-              }
++              } executeonly
+               { .LocalInstances dup //.emptydict eq
+                  { pop 3 dict localinstancedict Category 2 index put
+                  }
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0002.patch
new file mode 100644
index 0000000000..921e5b6876
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3838-0002.patch
@@ -0,0 +1,30 @@
+From 0cb5e967c0200559f946291b5b54f8da30c32cd6 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 22 Feb 2019 12:28:23 +0000
+Subject: [PATCH] Bug 700576(redux): an extra transient proc needs
+ executeonly'ed.
+
+CVE: CVE-2019-3838
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_res.ps | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index a163541..8ce4ae3 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -438,7 +438,7 @@ status {
+                         % Now make the resource value read-only.
+              0 2 copy get { readonly } .internalstopped pop
+              dup 4 1 roll put exch pop exch pop
+-           }
++           } executeonly
+            { /defineresource cvx /typecheck signaloperror
+            }
+         ifelse
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0001.patch
new file mode 100644
index 0000000000..b2c1ade4be
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0001.patch
@@ -0,0 +1,177 @@
+From c8c77690199b677f70093824382f0881e643e17b Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 5 Dec 2018 12:22:13 +0000
+Subject: [PATCH 1/7] Sanitize op stack for error conditions
+
+We save the stacks to an array and store the array for the error handler to
+access.
+
+For SAFER, we traverse the array, and deep copy any op arrays (procedures). As
+we make these copies, we check for operators that do *not* exist in systemdict,
+when we find one, we replace the operator with a name object (of the form
+"/--opname--").
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ psi/int.mak  |  3 +-
+ psi/interp.c |  8 ++++++
+ psi/istack.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ psi/istack.h |  3 ++
+ 4 files changed, 91 insertions(+), 1 deletion(-)
+
+diff --git a/psi/int.mak b/psi/int.mak
+index 6ab5bf0..6b349cb 100644
+--- a/psi/int.mak
++++ b/psi/int.mak
+@@ -204,7 +204,8 @@ $(PSOBJ)iparam.$(OBJ) : $(PSSRC)iparam.c $(GH)\
+ $(PSOBJ)istack.$(OBJ) : $(PSSRC)istack.c $(GH) $(memory__h)\
+  $(ierrors_h) $(gsstruct_h) $(gsutil_h)\
+  $(ialloc_h) $(istack_h) $(istkparm_h) $(istruct_h) $(iutil_h) $(ivmspace_h)\
+- $(store_h) $(INT_MAK) $(MAKEDIRS)
++ $(store_h) $(icstate_h) $(iname_h) $(dstack_h) $(idict_h) \
++ $(INT_MAK) $(MAKEDIRS)
+ 	$(PSCC) $(PSO_)istack.$(OBJ) $(C_) $(PSSRC)istack.c
+ 
+ $(PSOBJ)iutil.$(OBJ) : $(PSSRC)iutil.c $(GH) $(math__h) $(memory__h) $(string__h)\
+diff --git a/psi/interp.c b/psi/interp.c
+index 6dc0dda..aa5779c 100644
+--- a/psi/interp.c
++++ b/psi/interp.c
+@@ -761,6 +761,7 @@ copy_stack(i_ctx_t *i_ctx_p, const ref_stack_t * pstack, int skip, ref * arr)
+     uint size = ref_stack_count(pstack) - skip;
+     uint save_space = ialloc_space(idmemory);
+     int code, i;
++    ref *safety, *safe;
+ 
+     if (size > 65535)
+         size = 65535;
+@@ -778,6 +779,13 @@ copy_stack(i_ctx_t *i_ctx_p, const ref_stack_t * pstack, int skip, ref * arr)
+                 make_null(&arr->value.refs[i]);
+         }
+     }
++    if (pstack == &o_stack && dict_find_string(systemdict, "SAFETY", &safety) > 0 &&
++        dict_find_string(safety, "safe", &safe) > 0 && r_has_type(safe, t_boolean) &&
++        safe->value.boolval == true) {
++        code = ref_stack_array_sanitize(i_ctx_p, arr, arr);
++        if (code < 0)
++            return code;
++    }
+     ialloc_set_space(idmemory, save_space);
+     return code;
+ }
+diff --git a/psi/istack.c b/psi/istack.c
+index 8fe151f..f1a3e51 100644
+--- a/psi/istack.c
++++ b/psi/istack.c
+@@ -27,6 +27,10 @@
+ #include "iutil.h"
+ #include "ivmspace.h"		/* for local/global test */
+ #include "store.h"
++#include "icstate.h"
++#include "iname.h"
++#include "dstack.h"
++#include "idict.h"
+ 
+ /* Forward references */
+ static void init_block(ref_stack_t *pstack, const ref *pblock_array,
+@@ -294,6 +298,80 @@ ref_stack_store_check(const ref_stack_t *pstack, ref *parray, uint count,
+     return 0;
+ }
+ 
++int
++ref_stack_array_sanitize(i_ctx_t *i_ctx_p, ref *sarr, ref *darr)
++{
++    int i, code;
++    ref obj, arr2;
++    ref *pobj2;
++    gs_memory_t *mem = (gs_memory_t *)idmemory->current;
++
++    if (!r_is_array(sarr) || !r_has_type(darr, t_array))
++        return_error(gs_error_typecheck);
++
++    for (i = 0; i < r_size(sarr); i++) {
++        code = array_get(mem, sarr, i, &obj);
++        if (code < 0)
++            make_null(&obj);
++        switch(r_type(&obj)) {
++          case t_operator:
++          {
++            int index = op_index(&obj);
++
++            if (index > 0 && index < op_def_count) {
++                const byte *data = (const byte *)(op_index_def(index)->oname + 1);
++                if (dict_find_string(systemdict, (const char *)data, &pobj2) <= 0) {
++                    byte *s = gs_alloc_bytes(mem, strlen((char *)data) + 5, "ref_stack_array_sanitize");
++                    if (s) {
++                        s[0] =  '\0';
++                        strcpy((char *)s, "--");
++                        strcpy((char *)s + 2, (char *)data);
++                        strcpy((char *)s + strlen((char *)data) + 2, "--");
++                    }
++                    else {
++                        s = (byte *)data;
++                    }
++                    code = name_ref(imemory, s, strlen((char *)s), &obj, 1);
++                    if (code < 0) make_null(&obj);
++                    if (s != data)
++                        gs_free_object(mem, s, "ref_stack_array_sanitize");
++                }
++            }
++            else {
++                make_null(&obj);
++            }
++            ref_assign(darr->value.refs + i, &obj);
++            break;
++          }
++          case t_array:
++          case t_shortarray:
++          case t_mixedarray:
++          {
++            int attrs = r_type_attrs(&obj) & (a_write | a_read | a_execute | a_executable);
++            /* We only want to copy executable arrays */
++            if (attrs & (a_execute | a_executable)) {
++                code = ialloc_ref_array(&arr2, attrs, r_size(&obj), "ref_stack_array_sanitize");
++                if (code < 0) {
++                    make_null(&arr2);
++                }
++                else {
++                    code = ref_stack_array_sanitize(i_ctx_p, &obj, &arr2);
++                }
++                ref_assign(darr->value.refs + i, &arr2);
++            }
++            else {
++                ref_assign(darr->value.refs + i, &obj);
++            }
++            break;
++          }
++          default:
++            ref_assign(darr->value.refs + i, &obj);
++        }
++    }
++    return 0;
++}
++
++
+ /*
+  * Store the top 'count' elements of a stack, starting 'skip' elements below
+  * the top, into an array, with or without store/undo checking.  age=-1 for
+diff --git a/psi/istack.h b/psi/istack.h
+index 051dcbe..54be405 100644
+--- a/psi/istack.h
++++ b/psi/istack.h
+@@ -129,6 +129,9 @@ int ref_stack_store(const ref_stack_t *pstack, ref *parray, uint count,
+                     uint skip, int age, bool check,
+                     gs_dual_memory_t *idmem, client_name_t cname);
+ 
++int
++ref_stack_array_sanitize(i_ctx_t *i_ctx_p, ref *sarr, ref *darr);
++
+ /*
+  * Pop the top N elements off a stack.
+  * The number must not exceed the number of elements in use.
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0002.patch
new file mode 100644
index 0000000000..97c74e7e31
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0002.patch
@@ -0,0 +1,442 @@
+From 20001d2bdf3cc60e76241a6ae72b1df01c5424c5 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 13 Dec 2018 15:28:34 +0000
+Subject: [PATCH 2/7] Any transient procedures that call .force* operators
+
+(i.e. for conditionals or loops) make them executeonly.
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_diskn.ps |  2 +-
+ Resource/Init/gs_dps1.ps  |  4 ++--
+ Resource/Init/gs_fntem.ps |  4 ++--
+ Resource/Init/gs_fonts.ps | 12 ++++++------
+ Resource/Init/gs_init.ps  |  4 ++--
+ Resource/Init/gs_lev2.ps  | 11 ++++++-----
+ Resource/Init/gs_pdfwr.ps |  2 +-
+ Resource/Init/gs_res.ps   |  4 ++--
+ Resource/Init/gs_setpd.ps |  2 +-
+ Resource/Init/pdf_base.ps | 13 ++++++++-----
+ Resource/Init/pdf_draw.ps | 16 +++++++++-------
+ Resource/Init/pdf_font.ps |  6 +++---
+ Resource/Init/pdf_main.ps |  4 ++--
+ Resource/Init/pdf_ops.ps  |  7 ++++---
+ 14 files changed, 49 insertions(+), 42 deletions(-)
+
+diff --git a/Resource/Init/gs_diskn.ps b/Resource/Init/gs_diskn.ps
+index fd694bc..8bf2054 100644
+--- a/Resource/Init/gs_diskn.ps
++++ b/Resource/Init/gs_diskn.ps
+@@ -51,7 +51,7 @@ systemdict begin
+     mark 5 1 roll ] mark exch { { } forall } forall ]
+     //systemdict /.searchabledevs 2 index .forceput
+     exch .setglobal
+-  }
++  } executeonly
+   if
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index ec5db61..4fae283 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -78,7 +78,7 @@ level2dict begin
+    .currentglobal
+     {		% Current mode is global; delete from local directory too.
+       //systemdict /LocalFontDirectory .knownget
+-       { 1 index .forceundef }		% LocalFontDirectory is readonly
++       { 1 index .forceundef } executeonly		% LocalFontDirectory is readonly
+       if
+     }
+     {		% Current mode is local; if there was a shadowed global
+@@ -126,7 +126,7 @@ level2dict begin
+           }
+          ifelse
+        } forall
+-      pop counttomark 2 idiv { .forceundef } repeat pop		% readonly
++      pop counttomark 2 idiv { .forceundef } executeonly repeat pop		% readonly
+     }
+    if
+    //SharedFontDirectory exch .forcecopynew pop
+diff --git a/Resource/Init/gs_fntem.ps b/Resource/Init/gs_fntem.ps
+index c1f7651..6eb672a 100644
+--- a/Resource/Init/gs_fntem.ps
++++ b/Resource/Init/gs_fntem.ps
+@@ -401,12 +401,12 @@ currentdict end def
+       .forceput % FontInfo can be read-only.
+       pop                                                        % bool <font>
+       exit
+-    } if
++    } executeonly if
+     dup /FontInfo get                                            % bool <font> <FI>
+     /GlyphNames2Unicode /Unicode /Decoding findresource
+     .forceput % FontInfo can be read-only.
+     exit
+-  } loop
++  } executeonly loop
+   exch setglobal
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 803faca..290da0c 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -374,7 +374,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ /.setnativefontmapbuilt { % set whether we've been run
+   dup type /booleantype eq {
+       systemdict exch /.nativefontmapbuilt exch .forceput
+-  }
++  } executeonly
+   {pop}
+   ifelse
+ } .bind executeonly odef
+@@ -1007,11 +1007,11 @@ $error /SubstituteFont { } put
+ { 2 index gcheck currentglobal
+   2 copy eq {
+     pop pop .forceput
+-  } {
++  } executeonly {
+     5 1 roll setglobal
+     dup length string copy
+     .forceput setglobal
+-  } ifelse
++  } executeonly ifelse
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+ % Attempt to load a font from a file.
+@@ -1084,7 +1084,7 @@ $error /SubstituteFont { } put
+            .FontDirectory 3 index .forceundef		% readonly
+            1 index (r) file .loadfont .FontDirectory exch
+            /.setglobal .systemvar exec
+-         }
++         } executeonly
+          { .loadfont .FontDirectory
+          }
+         ifelse
+@@ -1105,7 +1105,7 @@ $error /SubstituteFont { } put
+         dup 3 index .fontknownget
+          { dup /PathLoad 4 index .putgstringcopy
+            4 1 roll pop pop pop //true exit
+-         } if
++         } executeonly if
+ 
+                 % Maybe the file had a different FontName.
+                 % See if we can get a FontName from the file, and if so,
+@@ -1134,7 +1134,7 @@ $error /SubstituteFont { } put
+               ifelse  % Stack: origfontname fontdict
+               exch pop //true exit
+                       % Stack: fontdict
+-            }
++            } executeonly
+            if pop % Stack: origfontname fontdirectory path
+          }
+         if pop pop  % Stack: origfontname
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index d733124..56c0bd2 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2357,7 +2357,7 @@ SAFER { .setsafeglobal } if
+         % Update the copy of the user parameters.
+   mark .currentuserparams counttomark 2 idiv {
+     userparams 3 1 roll .forceput	% userparams is read-only
+-  } repeat pop
++  } executeonly repeat pop
+         % Turn on idiom recognition, if available.
+   currentuserparams /IdiomRecognition known {
+     /IdiomRecognition //true .definepsuserparam
+@@ -2376,7 +2376,7 @@ SAFER { .setsafeglobal } if
+         % Remove real system params from pssystemparams.
+   mark .currentsystemparams counttomark 2 idiv {
+     pop pssystemparams exch .forceundef
+-  } repeat pop
++  } executeonly repeat pop
+ } if
+ 
+ % Set up AlignToPixels :
+diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
+index 44fe619..0f0d573 100644
+--- a/Resource/Init/gs_lev2.ps
++++ b/Resource/Init/gs_lev2.ps
+@@ -154,7 +154,8 @@ end
+       % protect top level of parameters that we copied
+       dup type dup /arraytype eq exch /stringtype eq or { readonly } if
+       /userparams .systemvar 3 1 roll .forceput  % userparams is read-only
+-    } {
++    } executeonly
++    {
+       pop pop
+     } ifelse
+   } forall
+@@ -224,7 +225,7 @@ end
+          % protect top level parameters that we copied
+          dup type dup /arraytype eq exch /stringtype eq or { readonly } if
+          //pssystemparams 3 1 roll .forceput	% pssystemparams is read-only
+-       }
++       } executeonly
+        { pop pop
+        }
+       ifelse
+@@ -934,7 +935,7 @@ mark
+   dup /PaintProc get
+   1 index /Implementation known not {
+     1 index dup /Implementation //null .forceput readonly pop
+-  } if
++  } executeonly if
+   exec
+ }.bind odef
+ 
+@@ -958,7 +959,7 @@ mark
+   dup /PaintProc get
+   1 index /Implementation known not {
+     1 index dup /Implementation //null .forceput readonly pop
+-  } if
++  } executeonly if
+   /UNROLLFORMS where {/UNROLLFORMS get}{false}ifelse not
+   %% [CTM] <<Form>> PaintProc .beginform -
+   {
+@@ -1005,7 +1006,7 @@ mark
+         %% Form dictioanry using the /Implementation key).
+         1 dict dup /FormID 4 -1 roll put
+         1 index exch /Implementation exch .forceput readonly pop
+-      }
++      } executeonly
+       ifelse
+     }
+     {
+diff --git a/Resource/Init/gs_pdfwr.ps b/Resource/Init/gs_pdfwr.ps
+index 58e75d3..b425103 100644
+--- a/Resource/Init/gs_pdfwr.ps
++++ b/Resource/Init/gs_pdfwr.ps
+@@ -650,7 +650,7 @@ currentdict /.pdfmarkparams .undef
+             } ifelse
+           } bind .makeoperator .forceput
+           systemdict /.pdf_hooked_DSC_Creator //true .forceput
+-        } if
++        } executeonly if
+         pop
+       } if
+     } {
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index 8eb8bb0..d9b3459 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -152,7 +152,7 @@ setglobal
+                 % use .forceput / .forcedef later to replace the dummy,
+                 % empty .Instances dictionary with the real one later.
+           readonly
+-        } {
++        }{
+           /defineresource cvx /typecheck signaloperror
+         } ifelse
+ } bind executeonly odef
+@@ -424,7 +424,7 @@ status {
+                         % As noted above, Category dictionaries are read-only,
+                         % so we have to use .forcedef here.
+                   /.Instances 1 index .forcedef	% Category dict is read-only
+-                } if
++                } executeonly if
+               }
+               { .LocalInstances dup //.emptydict eq
+                  { pop 3 dict localinstancedict Category 2 index put
+diff --git a/Resource/Init/gs_setpd.ps b/Resource/Init/gs_setpd.ps
+index e22597e..7875d1f 100644
+--- a/Resource/Init/gs_setpd.ps
++++ b/Resource/Init/gs_setpd.ps
+@@ -634,7 +634,7 @@ NOMEDIAATTRS {
+   SETPDDEBUG { (Rolling back.) = pstack flush } if
+   3 index 2 index 3 -1 roll .forceput
+   4 index 1 index .knownget
+-  { 4 index 3 1 roll .forceput }
++  { 4 index 3 1 roll .forceput } executeonly
+   { 3 index exch .undef }
+   ifelse
+ } bind executeonly odef
+diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
+index b45e980..7312729 100644
+--- a/Resource/Init/pdf_base.ps
++++ b/Resource/Init/pdf_base.ps
+@@ -130,26 +130,29 @@ currentdict /num-chars-dict .undef
+ 
+ /.pdfexectoken {		% <count> <opdict> <exectoken> .pdfexectoken ?
+   PDFDEBUG {
+-    pdfdict /PDFSTEPcount known not { pdfdict /PDFSTEPcount 1 .forceput } if
++    pdfdict /PDFSTEPcount known not { pdfdict /PDFSTEPcount 1 .forceput } executeonly if
+     PDFSTEP {
+       pdfdict /PDFtokencount 2 copy .knownget { 1 add } { 1 } ifelse .forceput
+       PDFSTEPcount 1 gt {
+         pdfdict /PDFSTEPcount PDFSTEPcount 1 sub .forceput
+-      } {
++      } executeonly
++      {
+         dup ==only
+         (    step # ) print PDFtokencount =only
+         ( ? ) print flush 1 //false .outputpage
+         (%stdin) (r) file 255 string readline {
+           token {
+             exch pop pdfdict /PDFSTEPcount 3 -1 roll .forceput
+-          } {
++          } executeonly
++          {
+             pdfdict /PDFSTEPcount 1 .forceput
+-          } ifelse % token
++          } executeonly ifelse % token
+         } {
+           pop /PDFSTEP //false def	 % EOF on stdin
+         } ifelse % readline
+       } ifelse % PDFSTEPcount > 1
+-    } {
++    } executeonly
++    {
+       dup ==only () = flush
+     } ifelse % PDFSTEP
+   } if % PDFDEBUG
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index 6b0ba93..40c6ac8 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -1118,14 +1118,14 @@ currentdict end readonly def
+           pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+-        } ifelse
++        } executeonly ifelse
+       }
+       {
+         currentglobal pdfdict gcheck .setglobal
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+       end
+     } ifelse
+   } loop
+@@ -1141,14 +1141,14 @@ currentdict end readonly def
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+     }
+     {
+       currentglobal pdfdict gcheck .setglobal
+       pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+-    } ifelse
++    } executeonly ifelse
+   } if
+   pop
+ 
+@@ -2350,9 +2350,10 @@ currentdict /last-ditch-bpc-csp undef
+ /IncrementAppearanceNumber {
+   pdfdict /AppearanceNumber .knownget {
+     1 add pdfdict /AppearanceNumber 3 -1 roll .forceput
+-  }{
++  } executeonly
++  {
+     pdfdict /AppearanceNumber 0 .forceput
+-  } ifelse
++  } executeonly ifelse
+ }bind executeonly odef
+ 
+ /MakeAppearanceName {
+@@ -2510,7 +2511,8 @@ currentdict /last-ditch-bpc-csp undef
+     %% want to preserve it.
+     pdfdict /.PreservePDFForm false .forceput
+     /q cvx /execform cvx 5 -2 roll
+-  }{
++  } executeonly
++  {
+     /q cvx /PDFexecform cvx 5 -2 roll
+   } ifelse
+ 
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index bea9ea9..4cd62b9 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -714,7 +714,7 @@ currentdict end readonly def
+     pop pop pop
+     currentdict /.stackdepth .forceundef
+     currentdict /.dstackdepth .forceundef
+-  }
++  } executeonly
+   {pop pop pop}
+   ifelse
+ 
+@@ -1232,7 +1232,7 @@ currentdict /eexec_pdf_param_dict .undef
+                 (\n   **** Warning: Type 3 glyph has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+                 pdfformatwarning
+                 pdfdict /.Qqwarning_issued //true .forceput
+-              } if
++              } executeonly if
+               Q
+             } repeat
+             Q
+@@ -2016,7 +2016,7 @@ currentdict /CMap_read_dict undef
+               /CIDFallBack /CIDFont findresource
+             } if
+             exit
+-          } if
++          } executeonly if
+         } if
+       } if
+ 
+diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
+index 00da47a..37e69b3 100644
+--- a/Resource/Init/pdf_main.ps
++++ b/Resource/Init/pdf_main.ps
+@@ -2701,14 +2701,14 @@ currentdict /PDF2PS_matrix_key undef
+           pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+-        } ifelse
++        } executeonly ifelse
+       }
+       {
+         currentglobal pdfdict gcheck .setglobal
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+     } if
+   } if
+   pop
+diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
+index 8672d61..aa09641 100644
+--- a/Resource/Init/pdf_ops.ps
++++ b/Resource/Init/pdf_ops.ps
+@@ -184,14 +184,14 @@ currentdict /gput_always_allow .undef
+         pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+-      } ifelse
++      } executeonly ifelse
+     }
+     {
+       currentglobal pdfdict gcheck .setglobal
+       pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+-    } ifelse
++    } executeonly ifelse
+   } if
+ } bind executeonly odef
+ 
+@@ -439,7 +439,8 @@ currentdict /gput_always_allow .undef
+   dup type /booleantype eq {
+     .currentSMask type /dicttype eq {
+       .currentSMask /Processed 2 index .forceput
+-    } {
++  } executeonly
++  {
+       .setSMask
+   }ifelse
+   }{
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0003.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0003.patch
new file mode 100644
index 0000000000..02b1dc962f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0003.patch
@@ -0,0 +1,32 @@
+From 60b77b8bf8b6e4d30519c47724631012b530cf0e Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Sat, 15 Dec 2018 09:08:32 +0000
+Subject: [PATCH 3/7] Bug700317: Fix logic for an older change
+
+Unlike almost every other function in gs, dict_find_string() returns 1 on
+success 0 or <0 on failure. The logic for this case was wrong.
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ psi/interp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psi/interp.c b/psi/interp.c
+index aa5779c..f6c45bb 100644
+--- a/psi/interp.c
++++ b/psi/interp.c
+@@ -703,7 +703,7 @@ again:
+                  * i.e. it's an internal operator we have hidden
+                  */
+                 code = dict_find_string(systemdict, (const char *)bufptr, &tobj);
+-                if (code < 0) {
++                if (code <= 0) {
+                     buf[0] = buf[1] = buf[rlen + 2] = buf[rlen + 3] = '-';
+                     rlen += 4;
+                     bufptr = buf;
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0004.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0004.patch
new file mode 100644
index 0000000000..cc15453f00
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0004.patch
@@ -0,0 +1,136 @@
+From d739565534e955c4336731e4ea4eebc895c09c5c Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 18 Dec 2018 10:42:10 +0000
+Subject: [PATCH 4/7] Harden some uses of .force* operators
+
+by adding a few immediate evalutions
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_dps1.ps  |  4 ++--
+ Resource/Init/gs_fonts.ps | 20 ++++++++++----------
+ Resource/Init/gs_init.ps  |  6 +++---
+ 3 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index 4fae283..b75ea14 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -74,7 +74,7 @@ level2dict begin
+  } odef
+ % undefinefont has to take local/global VM into account.
+ /undefinefont		% <fontname> undefinefont -
+- { .FontDirectory 1 .argindex .forceundef	% FontDirectory is readonly
++ { //.FontDirectory 1 .argindex .forceundef	% FontDirectory is readonly
+    .currentglobal
+     {		% Current mode is global; delete from local directory too.
+       //systemdict /LocalFontDirectory .knownget
+@@ -85,7 +85,7 @@ level2dict begin
+                 % definition, copy it into the local directory.
+       //systemdict /SharedFontDirectory .knownget
+        { 1 index .knownget
+-          { .FontDirectory 2 index 3 -1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse } % readonly
++          { //.FontDirectory 2 index 3 -1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse } % readonly
+          if
+        }
+       if
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index 290da0c..c13a2fc 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -516,7 +516,7 @@ buildfontdict 3 /.buildfont3 cvx put
+       if
+     }
+    if
+-   dup .FontDirectory 4 -2 roll { .growput } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse	% readonly
++   dup //.FontDirectory 4 -2 roll { .growput } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse	% readonly
+                 % If the font originated as a resource, register it.
+    currentfile .currentresourcefile eq { dup .registerfont } if
+    readonly
+@@ -943,7 +943,7 @@ $error /SubstituteFont { } put
+ % Try to find a font using only the present contents of Fontmap.
+ /.tryfindfont {         % <fontname> .tryfindfont <font> true
+                         % <fontname> .tryfindfont false
+-  .FontDirectory 1 index .fontknownget
++  //.FontDirectory 1 index .fontknownget
+     {                   % Already loaded
+       exch pop //true
+     }
+@@ -975,7 +975,7 @@ $error /SubstituteFont { } put
+                {                % Font with a procedural definition
+                  exec           % The procedure will load the font.
+                                 % Check to make sure this really happened.
+-                 .FontDirectory 1 index .knownget
++                 //.FontDirectory 1 index .knownget
+                   { exch pop //true exit }
+                  if
+                }
+@@ -1081,11 +1081,11 @@ $error /SubstituteFont { } put
+                 % because it's different depending on language level.
+            .currentglobal exch /.setglobal .systemvar exec
+                 % Remove the fake definition, if any.
+-           .FontDirectory 3 index .forceundef		% readonly
+-           1 index (r) file .loadfont .FontDirectory exch
++           //.FontDirectory 3 index .forceundef		% readonly
++           1 index (r) file .loadfont //.FontDirectory exch
+            /.setglobal .systemvar exec
+          } executeonly
+-         { .loadfont .FontDirectory
++         { .loadfont //.FontDirectory
+          }
+         ifelse
+                 % Stack: fontname fontfilename fontdirectory
+@@ -1119,8 +1119,8 @@ $error /SubstituteFont { } put
+                       % Stack: origfontname fontdirectory filefontname fontdict
+               3 -1 roll pop
+                       % Stack: origfontname filefontname fontdict
+-              dup /FontName get dup FontDirectory exch .forceundef
+-              GlobalFontDirectory exch .forceundef
++              dup /FontName get dup //.FontDirectory exch .forceundef
++              /GlobalFontDirectory .systemvar exch .forceundef
+               dup length dict .copydict dup 3 index /FontName exch put
+               2 index exch definefont
+               exch
+@@ -1176,10 +1176,10 @@ currentdict /.putgstringcopy .undef
+       {
+         {
+           pop dup type /stringtype eq { cvn } if
+-          .FontDirectory 1 index known not {
++          //.FontDirectory 1 index known not {
+             2 dict dup /FontName 3 index put
+             dup /FontType 1 put
+-            .FontDirectory 3 1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse   % readonly
++            //.FontDirectory 3 1 roll { put } systemdict /superexec known {//superexec}{1183615869 internaldict /superexec get exec} ifelse   % readonly
+           } {
+             pop
+           } ifelse
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 56c0bd2..d9a0829 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -1168,8 +1168,8 @@ errordict /unknownerror .undef
+     }ifelse
+   }forall
+   noaccess pop
+-  systemdict /.setsafeerrors .forceundef
+-  systemdict /.SAFERERRORLIST .forceundef
++  //systemdict /.setsafeerrors .forceundef
++  //systemdict /.SAFERERRORLIST .forceundef
+ } bind executeonly odef
+ 
+ SAFERERRORS {.setsafererrors} if
+@@ -2114,7 +2114,7 @@ currentdict /tempfilepaths undef
+ 
+ /.locksafe {
+   .locksafe_userparams
+-  systemdict /getenv {pop //false} .forceput
++  //systemdict /getenv {pop //false} .forceput
+   % setpagedevice has the side effect of clearing the page, but
+   % we will just document that. Using setpagedevice keeps the device
+   % properties and pagedevice .LockSafetyParams in agreement even
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0005.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0005.patch
new file mode 100644
index 0000000000..db70bba215
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0005.patch
@@ -0,0 +1,250 @@
+From 1e830cafa56c6e3e1b08d246eaf5496fe81a0032 Mon Sep 17 00:00:00 2001
+From: Nancy Durgin <nancy.durgin@artifex.com>
+Date: Tue, 27 Nov 2018 12:36:14 -0800
+Subject: [PATCH 5/7] Undef a bunch of internal things in gs_res.ps
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_res.ps   | 72 +++++++++++++++++++++++++--------------
+ Resource/Init/gs_resmp.ps |  4 +--
+ 2 files changed, 49 insertions(+), 27 deletions(-)
+
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index d9b3459..18d5452 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -197,7 +197,7 @@ setglobal
+ /.findresource {		% <key> <category> findresource <instance>
+         2 copy dup /Category eq
+           { pop //Category 0 get begin } { .findcategory } ifelse
+-        /FindResource .resourceexec exch pop exch pop
++        /FindResource //.resourceexec exec exch pop exch pop
+ } bind
+ end		% .Instances of Category
+ def
+@@ -223,7 +223,7 @@ def
+             not { /defineresource cvx /typecheck signaloperror } if
+           } if
+         } if
+-        /DefineResource .resourceexec
++        /DefineResource //.resourceexec exec
+         4 1 roll pop pop pop
+     } .errorexec
+ } bind executeonly odef
+@@ -252,7 +252,7 @@ def
+       % without the check.
+       /resourcestatus cvx /typecheck signalerror
+     } if
+-    2 copy .findcategory /ResourceStatus .resourceexec
++    2 copy .findcategory /ResourceStatus //.resourceexec exec
+     { 4 2 roll pop pop //true } { pop pop //false } ifelse
+   } stopped {
+     % Although resourcestatus is an operator, Adobe uses executable name
+@@ -266,7 +266,7 @@ def
+   } if
+   1 .argindex 1 index		% catch stackunderflow
+ 
+-  { .findcategory /UndefineResource .resourceexec pop pop
++  { .findcategory /UndefineResource //.resourceexec exec pop pop
+   } stopped {
+     % Although undefineresource is an operator, Adobe uses executable name
+     % here but uses operator for the errors above. CET 23-33
+@@ -315,10 +315,10 @@ currentdict /pssystemparams known not {
+   /pssystemparams 10 dict readonly def
+ } if
+ pssystemparams begin
+-  .default_resource_dir
+-  /FontResourceDir (Font) .resource_dir_name
++  //.default_resource_dir exec
++  /FontResourceDir (Font) //.resource_dir_name exec
+      readonly .forcedef	% pssys'params is r-o
+-  /GenericResourceDir () .resource_dir_name
++  /GenericResourceDir () //.resource_dir_name exec
+      readonly .forcedef	% pssys'params is r-o
+   pop % .default_resource_dir
+   /GenericResourcePathSep
+@@ -387,13 +387,13 @@ status {
+ } bind def
+ /.localresourceforall {		% <key> <value> <args> .localr'forall -
+   exch pop
+-  2 copy 0 get .stringmatch { .enumerateresource } { pop pop } ifelse
++  2 copy 0 get .stringmatch { //.enumerateresource exec } { pop pop } ifelse
+ } bind def
+ /.globalresourceforall {	% <key> <value> <args> .globalr'forall -
+   exch pop
+   2 copy 0 get .stringmatch {
+     dup 3 get begin .LocalInstances end 2 index known not {
+-      .enumerateresource
++      //.enumerateresource exec
+     } {
+       pop pop
+     } ifelse
+@@ -408,7 +408,7 @@ status {
+   3 index known {
+     pop pop pop
+   } {
+-    2 index known { pop pop } { .enumerateresource } ifelse
++    2 index known { pop pop } { //.enumerateresource exec } ifelse
+   } ifelse
+ } bind def
+ 
+@@ -468,19 +468,19 @@ status {
+           % .knownget doesn't fail on null
+           /findresource cvx /typecheck signaloperror
+         } if
+-        dup .getvminstance {
++        dup //.getvminstance exec {
+           exch pop 0 get
+         } {
+           dup ResourceStatus {
+             pop 1 gt {
+-              .DoLoadResource .getvminstance not {
+-                /findresource cvx .undefinedresource
++              .DoLoadResource //.getvminstance exec not {
++                /findresource cvx //.undefinedresource exec
+               } if 0 get
+             } {
+               .GetInstance pop 0 get
+             } ifelse
+           } {
+-           /findresource cvx .undefinedresource
++           /findresource cvx //.undefinedresource exec
+           } ifelse
+         } ifelse
+ } bind executeonly
+@@ -621,7 +621,7 @@ status {
+     .currentglobal not .setglobal
+     vmstatus pop exch pop add
+   } repeat
+-} bind def
++} bind executeonly odef
+ /.DoLoadResource {
+                 % .LoadResource may push entries on the operand stack.
+                 % It is an undocumented feature of Adobe implementations,
+@@ -633,8 +633,8 @@ status {
+         {.LoadResource} 4 1 roll 4 .execn
+                 % Stack: ... count key memused
+         .vmused exch sub
+-        1 index .getvminstance not {
+-          pop dup .undefinedresource	% didn't load
++        1 index //.getvminstance exec not {
++          pop dup //.undefinedresource exec	% didn't load
+         } if
+         dup 1 1 put
+         2 3 -1 roll put
+@@ -648,7 +648,7 @@ status {
+               { //true setglobal { .runresource } stopped //false setglobal { stop } if }
+              ifelse
+            }
+-           { dup .undefinedresource
++           { dup //.undefinedresource exec
+            }
+          ifelse
+         } bind
+@@ -758,7 +758,7 @@ counttomark 2 idiv
+    /FindResource
+         { .Instances 1 index .knownget
+            { exch pop }
+-           { /findresource cvx .undefinedresource }
++           { /findresource cvx //.undefinedresource exec }
+           ifelse
+         } bind executeonly
+    /ResourceStatus
+@@ -862,7 +862,7 @@ userdict /.localcsdefaults //false put
+   2 copy /Generic /Category findresource /DefineResource get exec
+   exch pop
+   exch //.defaultcsnames exch .knownget {
+-    1 index .definedefaultcs
++    1 index //.definedefaultcs exec
+     currentglobal not { .userdict /.localcsdefaults //true put } if
+   } if
+ } bind executeonly
+@@ -872,13 +872,13 @@ userdict /.localcsdefaults //false put
+   //.defaultcsnames 1 index .knownget {
+         % Stack: resname index
+     currentglobal {
+-      .undefinedefaultcs pop
++      //.undefinedefaultcs exec pop
+     } {
+         % We removed the local definition, but there might be a global one.
+       exch .GetInstance {
+-        0 get .definedefaultcs
++        0 get //.definedefaultcs exec
+       } {
+-        .undefinedefaultcs
++        //.undefinedefaultcs exec
+       } ifelse
+         % Recompute .localcsdefaults by scanning.  This is rarely needed.
+       .userdict /.localcsdefaults //false //.defaultcsnames {
+@@ -997,7 +997,7 @@ currentdict /.fontstatusaux .undef
+           /Generic /Category findresource /UndefineResource get exec
+         } bind executeonly
+ /FindResource {
+-        dup .getvminstance {
++        dup //.getvminstance exec {
+           exch pop 0 get
+         } {
+           dup ResourceStatus {
+@@ -1024,7 +1024,7 @@ currentdict /.fontstatusaux .undef
+                 % stack: name font vmused
+                 % findfont has the prerogative of not calling definefont
+                 % in certain obscure cases of font substitution.
+-        2 index .getvminstance {
++        2 index //.getvminstance exec {
+           dup 1 1 put
+           2 3 -1 roll put
+         } {
+@@ -1159,3 +1159,25 @@ end				% level2dict
+ 
+ %% Replace 1 (gs_resmp.ps)
+ (gs_resmp.ps)  dup runlibfile VMDEBUG
++
++[
++    /.default_resource_dir
++    /.resource_dir_name
++]
++{systemdict exch .forceundef} forall
++
++[
++    /.definedefaultcs
++    /.undefinedefaultcs
++    /.defaultcsnames
++    /.enumerateresource
++    /.externalresourceforall
++    /.getvminstance
++    /.globalresourceforall
++    /.localresourceforall
++    /resourceforall1
++    /.resourceexec
++    /.undefinedresource
++    /.vmused
++]
++{level2dict exch .forceundef} forall
+diff --git a/Resource/Init/gs_resmp.ps b/Resource/Init/gs_resmp.ps
+index 9bb4263..cb948d1 100644
+--- a/Resource/Init/gs_resmp.ps
++++ b/Resource/Init/gs_resmp.ps
+@@ -230,7 +230,7 @@ currentpacking //false setpacking
+       } {
+         dup dup .map exch .knownget {      % /Name /Name <<record>>
+           dup dup /RecordVirtualMethods get /IsActive get exec {
+-            1 index .getvminstance {       % /Name /Name <<record>> holder
++            1 index //.getvminstance exec {       % /Name /Name <<record>> holder
+               1 get 1 eq
+             } {
+               //true
+@@ -242,7 +242,7 @@ currentpacking //false setpacking
+             DefineResource exec            % size bStatusIs1 /Name Instance
+             % Make ResourceStatus to return correct values for this instance :
+             % Hack: we replace status values in the instance holder :
+-            exch .getvminstance pop        % size bStatusIs1 Instance holder
++            exch //.getvminstance exec pop        % size bStatusIs1 Instance holder
+             dup 5 -1 roll 2 exch put       % bStatusIs1 Instance holder
+             3 2 roll {                     % Instance holder
+               1 1 put                      % Instance
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0006.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0006.patch
new file mode 100644
index 0000000000..79e640b18f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0006.patch
@@ -0,0 +1,596 @@
+From 97f9052ce49e6844b06a49ff9e4b8fc1eaf6bd10 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 9 Jan 2019 14:24:07 +0000
+Subject: [PATCH 6/7] Undefine a bunch of gs_fonts.ps specific procs
+
+Also reorder and add some immediate evaluation, so it still works with the
+undefining.
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_dps1.ps  |   3 +-
+ Resource/Init/gs_fonts.ps | 275 +++++++++++++++++++++-----------------
+ Resource/Init/gs_res.ps   |   7 +-
+ 3 files changed, 157 insertions(+), 128 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index b75ea14..8700c8c 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -67,7 +67,8 @@ level2dict begin
+ 
+ /selectfont		% <fontname> <size> selectfont -
+  {
+-   { 1 .argindex findfont
++   {
++     1 .argindex findfont
+      1 index dup type /arraytype eq { makefont } { scalefont } ifelse
+      setfont pop pop
+    } stopped { /selectfont .systemvar $error /errorname get signalerror } if
+diff --git a/Resource/Init/gs_fonts.ps b/Resource/Init/gs_fonts.ps
+index c13a2fc..0562235 100644
+--- a/Resource/Init/gs_fonts.ps
++++ b/Resource/Init/gs_fonts.ps
+@@ -100,7 +100,7 @@ userdict /.nativeFontmap .FontDirectory maxlength dict put
+        { 2 index token not
+           { (Fontmap entry for ) print 1 index =only
+             ( ends prematurely!  Giving up.) = flush
+-            {.loadFontmap} 0 get 1 .quit
++            {//.loadFontmap exec} 0 get 1 .quit
+           } if
+          dup /; eq { pop 3 index 3 1 roll .growput exit } if
+          pop
+@@ -202,6 +202,14 @@ NOFONTPATH { /FONTPATH () def } if
+  { pop }
+  { /FONTPATH (GS_FONTPATH) getenv not { () } if def }
+ ifelse
++
++% The following are dummy definitions that, if we have a FONTPATH, will
++% be replaced in the following section.
++% They are here so immediately evaulation will work, and allow them to
++% undefined at the bottom of the file.
++/.scanfontbegin{} bind def
++/.scanfontdir {} bind def
++
+ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ /FONTPATH [ FONTPATH .pathlist ] def
+ 
+@@ -242,12 +250,12 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+ /.scanfontbegin
+  {      % Construct the table of all file names already in Fontmap.
+    currentglobal //true setglobal
+-   .scanfontdict dup maxlength Fontmap length 2 add .max .setmaxlength
++   //.scanfontdict dup maxlength Fontmap length 2 add .max .setmaxlength
+    Fontmap
+     { exch pop
+        { dup type /stringtype eq
+-          { .splitfilename pop .fonttempstring copy .lowerstring cvn
+-            .scanfontdict exch //true put
++          { //.splitfilename exec pop //.fonttempstring copy //.lowerstring exec cvn
++            //.scanfontdict exch //true put
+           }
+           { pop
+           }
+@@ -280,9 +288,9 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+   /txt //true
+ .dicttomark def
+ /.scan1fontstring 8192 string def
+-% %%BeginFont: is not per Adobe documentation, but a few fonts have it.
++% BeginFont: is not per Adobe documentation, but a few fonts have it.
+ /.scanfontheaders [(%!PS-Adobe*) (%!FontType*) (%%BeginFont:*)] def
+-0 .scanfontheaders { length .max } forall 6 add % extra for PFB header
++0 //.scanfontheaders { length .max } forall 6 add % extra for PFB header
+ /.scan1fontfirst exch string def
+ /.scanfontdir           % <dirname> .scanfontdir -
+  { currentglobal exch //true setglobal
+@@ -291,10 +299,10 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+    0 0 0 4 -1 roll      % found scanned files
+     {           % stack: <fontcount> <scancount> <filecount> <filename>
+       exch 1 add exch                   % increment filecount
+-      dup .splitfilename .fonttempstring copy .lowerstring
++      dup //.splitfilename exec //.fonttempstring copy //.lowerstring exec
+                 % stack: <fontcount> <scancount> <filecount+1> <filename>
+                 %       <BASE> <ext>
+-      .scanfontskip exch known exch .scanfontdict exch known or
++      //.scanfontskip exch known exch //.scanfontdict exch known or
+        { pop
+                 % stack: <fontcount> <scancount> <filecount+1>
+        }
+@@ -309,7 +317,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+                 % On some platforms, the file operator will open directories,
+                 % but an error will occur if we try to read from one.
+                 % Handle this possibility here.
+-            dup .scan1fontfirst { readstring } .internalstopped
++            dup //.scan1fontfirst { readstring } .internalstopped
+              { pop pop () }
+              { pop }
+             ifelse
+@@ -322,7 +330,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+           { dup length 6 sub 6 exch getinterval }
+          if
+                 % Check for font file headers.
+-         //false .scanfontheaders
++         //false //.scanfontheaders
+           { 2 index exch .stringmatch or
+           }
+          forall exch pop
+@@ -335,7 +343,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+                 { exch copystring exch
+                   DEBUG { ( ) print dup =only flush } if
+                   1 index .definenativefontmap
+-                  .splitfilename pop //true .scanfontdict 3 1 roll .growput
++                  //.splitfilename exec pop //true //.scanfontdict 3 1 roll .growput
+                         % Increment fontcount.
+                   3 -1 roll 1 add 3 1 roll
+                 }
+@@ -352,7 +360,7 @@ FONTPATH length 0 eq { (%END FONTPATH) .skipeof } if
+        }
+       ifelse
+     }
+-   .scan1fontstring filenameforall
++   //.scan1fontstring filenameforall
+    QUIET
+     { pop pop pop }
+     { ( ) print =only ( files, ) print =only ( scanned, ) print
+@@ -422,7 +430,6 @@ systemdict /NONATIVEFONTMAP known .setnativefontmapbuilt
+     //true .setnativefontmapbuilt
+   } ifelse
+ } bind def
+-currentdict /.setnativefontmapbuilt .forceundef
+ 
+ % Create the dictionary that registers the .buildfont procedure
+ % (called by definefont) for each FontType.
+@@ -526,7 +533,8 @@ buildfontdict 3 /.buildfont3 cvx put
+ % We use this only for explicitly aliased fonts, not substituted fonts:
+ % we think this matches the observed behavior of Adobe interpreters.
+ /.aliasfont             % <name> <font> .aliasfont <newFont>
+- { .currentglobal 3 1 roll dup .gcheck .setglobal
++ {
++   currentglobal 3 1 roll dup gcheck setglobal
+                              % <bool> <name> <font>
+    dup length 2 add dict     % <bool> <name> <font> <dict>
+    dup 3 -1 roll             % <bool> <name> <dict> <dict> <font>
+@@ -541,7 +549,7 @@ buildfontdict 3 /.buildfont3 cvx put
+                 % whose FontName is a local non-string, if someone passed a
+                 % garbage value to findfont.  In this case, just don't
+                 % call definefont at all.
+-   2 index dup type /stringtype eq exch .gcheck or 1 index .gcheck not or
++    2 index dup type /stringtype eq exch gcheck or 1 index gcheck not or
+     { pop                              % <bool> <name> <dict>
+       1 index dup type /stringtype eq { cvn } if
+                                        % <bool> <name> <dict> <name1>
+@@ -566,10 +574,11 @@ buildfontdict 3 /.buildfont3 cvx put
+                 % Don't bind in definefont, since Level 2 redefines it.
+       /definefont .systemvar exec
+     }
+-    { /findfont cvx {.completefont} .errorexec pop exch pop
++    {
++      /findfont cvx {.completefont} //.errorexec exec pop exch pop
+     }
+    ifelse
+-   exch .setglobal
++   exch setglobal
+  } odef         % so findfont will bind it
+ 
+ % Define .loadfontfile for loading a font.  If we recognize Type 1 and/or
+@@ -669,10 +678,19 @@ buildfontdict 3 /.buildfont3 cvx put
+   [(Cn) 4] [(Cond) 4] [(Narrow) 4] [(Pkg) 4] [(Compr) 4]
+   [(Serif) 8] [(Sans) -8]
+ ] readonly def
++
++/.fontnamestring {              % <fontname> .fontnamestring <string|name>
++  dup type dup /nametype eq {
++    pop .namestring
++  } {
++    /stringtype ne { pop () } if
++  } ifelse
++} bind def
++
+ /.fontnameproperties {          % <int> <string|name> .fontnameproperties
+                                 %   <int'>
+-  .fontnamestring
+-  .substituteproperties {
++  //.fontnamestring exec
++  //.substituteproperties {
+     2 copy 0 get search {
+       pop pop pop dup length 1 sub 1 exch getinterval 3 -1 roll exch {
+         dup 0 ge { or } { neg not and } ifelse
+@@ -710,13 +728,7 @@ buildfontdict 3 /.buildfont3 cvx put
+                                 % <other> .nametostring <other>
+   dup type /nametype eq { .namestring } if
+ } bind def
+-/.fontnamestring {              % <fontname> .fontnamestring <string|name>
+-  dup type dup /nametype eq {
+-    pop .namestring
+-  } {
+-    /stringtype ne { pop () } if
+-  } ifelse
+-} bind def
++
+ /.substitutefontname {          % <fontname> <properties> .substitutefontname
+                                 %   <altname|null>
+         % Look for properties and/or a face name in the font name.
+@@ -724,7 +736,7 @@ buildfontdict 3 /.buildfont3 cvx put
+         % base font; otherwise, use the default font.
+         % Note that the "substituted" font name may be the same as
+         % the requested one; the caller must check this.
+-  exch .fontnamestring {
++  exch //.fontnamestring exec {
+     defaultfontname /Helvetica-Oblique /Helvetica-Bold /Helvetica-BoldOblique
+     /Helvetica-Narrow /Helvetica-Narrow-Oblique
+     /Helvetica-Narrow-Bold /Helvetica-Narrow-BoldOblique
+@@ -734,12 +746,12 @@ buildfontdict 3 /.buildfont3 cvx put
+   } 3 1 roll
+         % Stack: facelist properties fontname
+         % Look for a face name.
+-  .substitutefaces {
++  //.substitutefaces {
+     2 copy 0 get search {
+       pop pop pop
+         % Stack: facelist properties fontname [(pattern) family properties]
+       dup 2 get 4 -1 roll or 3 1 roll
+-      1 get .substitutefamilies exch get
++      1 get //.substitutefamilies exch get
+       4 -1 roll pop 3 1 roll
+     } {
+       pop pop
+@@ -748,7 +760,7 @@ buildfontdict 3 /.buildfont3 cvx put
+   1 index length mod get exec
+ } bind def
+ /.substitutefont {              % <fontname> .substitutefont <altname>
+-  dup 0 exch .fontnameproperties .substitutefontname
++  dup 0 exch //.fontnameproperties exec .substitutefontname
+         % Only accept fonts known in the Fontmap.
+    Fontmap 1 index known not
+    {
+@@ -814,7 +826,7 @@ FAKEFONTS not { (%END FAKEFONTS) .skipeof } if
+   counttomark 1 sub { .aliasfont } repeat end
+                       % <fontname> mark <font>
+   exch pop exch pop
+-} odef
++} bind odef
+ /findfont {
+   .findfont
+ } bind def
+@@ -860,7 +872,7 @@ FAKEFONTS not { (%END FAKEFONTS) .skipeof } if
+       } {
+         dup .substitutefont
+         2 copy eq { pop defaultfontname } if
+-        .checkalias
++        //.checkalias exec
+         QUIET not {
+           SHORTERRORS {
+             (%%[) print 1 index =only
+@@ -886,8 +898,8 @@ $error /SubstituteFont { } put
+   //null 0 1 FONTPATH length 1 sub {
+     FONTPATH 1 index get //null ne { exch pop exit } if pop
+   } for dup //null ne {
+-    dup 0 eq { .scanfontbegin } if
+-    FONTPATH 1 index get .scanfontdir
++    dup 0 eq { //.scanfontbegin exec} if
++    FONTPATH 1 index get //.scanfontdir exec
+     FONTPATH exch //null put //true
+   } {
+     pop //false
+@@ -897,11 +909,10 @@ $error /SubstituteFont { } put
+ % scanning of FONTPATH.
+ /.dofindfont {   %  mark <fontname> .dofindfont % mark <alias> ... <font>
+   .tryfindfont not {
+-
+                         % We didn't find the font.  If we haven't scanned
+                         % all the directories in FONTPATH, scan the next one
+                         % now and look for the font again.
+-    .scannextfontdir {
++    //.scannextfontdir exec {
+                         % Start over with an empty alias list.
+       counttomark 1 sub { pop } repeat    % mark <fontname>
+       .dofindfont
+@@ -927,6 +938,7 @@ $error /SubstituteFont { } put
+         } if
+                         % Substitute for the font.  Don't alias.
+                         % Same stack as at the beginning of .dofindfont.
++
+         $error /SubstituteFont get exec
+                          %
+                          % igorm: I guess the surrounding code assumes that .stdsubstfont
+@@ -935,72 +947,11 @@ $error /SubstituteFont { } put
+                          % used in .dofindfont and through .stdsubstfont
+                          % just to represent a simple iteration,
+                          % which accumulates the aliases after the mark.
+-        .stdsubstfont
++        //.stdsubstfont exec
+       } ifelse
+     } ifelse
+   } if
+ } bind def
+-% Try to find a font using only the present contents of Fontmap.
+-/.tryfindfont {         % <fontname> .tryfindfont <font> true
+-                        % <fontname> .tryfindfont false
+-  //.FontDirectory 1 index .fontknownget
+-    {                   % Already loaded
+-      exch pop //true
+-    }
+-    {
+-       dup Fontmap exch .knownget
+-       { //true //true }
+-       {                % Unknown font name.  Look for a file with the
+-                        % same name as the requested font.
+-         dup .tryloadfont
+-         { exch pop //true //false }
+-         {
+-           % if we can't load by name check the native font map
+-           dup .nativeFontmap exch .knownget
+-           { //true //true }
+-           { //false //false } ifelse
+-         } ifelse
+-       } ifelse
+-
+-       {                % Try each element of the Fontmap in turn.
+-         pop
+-         //false exch   % (in case we exhaust the list)
+-                        % Stack: fontname false fontmaplist
+-         { exch pop
+-           dup type /nametype eq
+-            {                   % Font alias
+-              .checkalias .tryfindfont exit
+-            }
+-            { dup dup type dup /arraytype eq exch /packedarraytype eq or exch xcheck and
+-               {                % Font with a procedural definition
+-                 exec           % The procedure will load the font.
+-                                % Check to make sure this really happened.
+-                 //.FontDirectory 1 index .knownget
+-                  { exch pop //true exit }
+-                 if
+-               }
+-               {                % Font file name
+-                 //true .loadfontloop { //true exit } if
+-               }
+-              ifelse
+-            }
+-           ifelse //false
+-         }
+-         forall
+-                        % Stack: font true -or- fontname false
+-         { //true
+-         }
+-         {                      % None of the Fontmap entries worked.
+-                                % Try loading a file with the same name
+-                                % as the requested font.
+-           .tryloadfont
+-         }
+-        ifelse
+-       }
+-      if
+-    }
+-   ifelse
+- } bind def
+ 
+ % any user of .putgstringcopy must use bind and executeonly
+ /.putgstringcopy  %   <dict> <name> <string> .putgstringcopy -
+@@ -1014,25 +965,6 @@ $error /SubstituteFont { } put
+   } executeonly ifelse
+ } .bind executeonly odef % must be bound and hidden for .forceput
+ 
+-% Attempt to load a font from a file.
+-/.tryloadfont {         % <fontname> .tryloadfont <font> true
+-                        % <fontname> .tryloadfont false
+-  dup .nametostring
+-                % Hack: check for the presence of the resource machinery.
+-  /.genericrfn where {
+-    pop
+-    pop dup .fonttempstring /FontResourceDir getsystemparam .genericrfn
+-    {//false .loadfontloop} .internalstopped {//false} if {
+-      //true
+-    } {
+-      dup .nametostring
+-      {//true .loadfontloop} .internalstopped {//false} if
+-    } ifelse
+-  } {
+-    {//true .loadfontloop} .internalstopped {//false} if
+-  } ifelse
+-} bind def
+-
+ /.loadfontloop {        % <fontname> <filename> <libflag> .loadfontloop
+                         %   <font> true
+                         % -or-
+@@ -1102,7 +1034,7 @@ $error /SubstituteFont { } put
+          } if
+ 
+                 % Check to make sure the font was actually loaded.
+-        dup 3 index .fontknownget
++        dup 3 index //.fontknownget exec
+          { dup /PathLoad 4 index .putgstringcopy
+            4 1 roll pop pop pop //true exit
+          } executeonly if
+@@ -1113,7 +1045,7 @@ $error /SubstituteFont { } put
+         exch dup      % Stack: origfontname fontdirectory path path
+         (r) file .findfontname
+          {            % Stack: origfontname fontdirectory path filefontname
+-           2 index 1 index .fontknownget
++           2 index 1 index //.fontknownget exec
+             {   % Yes.  Stack: origfontname fontdirectory path filefontname fontdict
+               dup 4 -1 roll /PathLoad exch .putgstringcopy
+                       % Stack: origfontname fontdirectory filefontname fontdict
+@@ -1136,7 +1068,7 @@ $error /SubstituteFont { } put
+                       % Stack: fontdict
+             } executeonly
+            if pop % Stack: origfontname fontdirectory path
+-         }
++         } executeonly
+         if pop pop  % Stack: origfontname
+ 
+                 % The font definitely did not load correctly.
+@@ -1150,7 +1082,87 @@ $error /SubstituteFont { } put
+ 
+  } bind executeonly odef % must be bound and hidden for .putgstringcopy
+ 
+-currentdict /.putgstringcopy .undef
++% Attempt to load a font from a file.
++/.tryloadfont {         % <fontname> .tryloadfont <font> true
++                        % <fontname> .tryloadfont false
++  dup //.nametostring exec
++                % Hack: check for the presence of the resource machinery.
++  /.genericrfn where {
++    pop
++    pop dup //.fonttempstring /FontResourceDir getsystemparam .genericrfn
++    {//false .loadfontloop} .internalstopped {//false} if {
++      //true
++    } {
++      dup //.nametostring exec
++      {//true .loadfontloop} .internalstopped {//false} if
++    } ifelse
++  } {
++    {//true .loadfontloop} .internalstopped {//false} if
++  } ifelse
++} bind def
++
++% Try to find a font using only the present contents of Fontmap.
++/.tryfindfont {         % <fontname> .tryfindfont <font> true
++                        % <fontname> .tryfindfont false
++  //.FontDirectory 1 index //.fontknownget exec
++    {                   % Already loaded
++      exch pop //true
++    }
++    {
++       dup Fontmap exch .knownget
++       { //true //true }
++       {                % Unknown font name.  Look for a file with the
++                        % same name as the requested font.
++         dup //.tryloadfont exec
++         { exch pop //true //false }
++         {
++           % if we can't load by name check the native font map
++           dup .nativeFontmap exch .knownget
++           { //true //true }
++           { //false //false } ifelse
++         } ifelse
++       } ifelse
++
++       {                % Try each element of the Fontmap in turn.
++         pop
++         //false exch   % (in case we exhaust the list)
++                        % Stack: fontname false fontmaplist
++         { exch pop
++           dup type /nametype eq
++            {                   % Font alias
++              //.checkalias exec
++              .tryfindfont exit
++            }
++            { dup dup type dup /arraytype eq exch /packedarraytype eq or exch xcheck and
++               {                % Font with a procedural definition
++                 exec           % The procedure will load the font.
++                                % Check to make sure this really happened.
++                 //.FontDirectory 1 index .knownget
++                  { exch pop //true exit }
++                 if
++               }
++               {                % Font file name
++                 //true .loadfontloop { //true exit } if
++               }
++              ifelse
++            }
++           ifelse //false
++         }
++         forall
++                        % Stack: font true -or- fontname false
++         { //true
++         }
++         {                      % None of the Fontmap entries worked.
++                                % Try loading a file with the same name
++                                % as the requested font.
++           //.tryloadfont exec
++         }
++        ifelse
++       }
++      if
++    }
++   ifelse
++ } bind def
+ 
+ % Define a procedure to load all known fonts.
+ % This isn't likely to be very useful.
+@@ -1192,9 +1204,9 @@ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+ /.loadinitialfonts
+  { NOFONTMAP not
+     { /FONTMAP where
+-          { pop [ FONTMAP .pathlist ]
++          { pop [ FONTMAP //.pathlist exec]
+              { dup VMDEBUG findlibfile
+-                { exch pop .loadFontmap }
++                { exch pop //.loadFontmap exec }
+                 { /undefinedfilename signalerror }
+                ifelse
+              }
+@@ -1208,7 +1220,7 @@ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+                    pop pop
+                    defaultfontmap_content { .definefontmap } forall
+                  } {
+-                   .loadFontmap
++                   //.loadFontmap exec
+                  } ifelse
+                } {
+                  pop pop
+@@ -1272,3 +1284,18 @@ FAKEFONTS { exch } if pop def   % don't bind, .current/setglobal get redefined
+  { .makemodifiedfont
+    dup /FontName get exch definefont pop
+  } bind def
++
++% Undef these, not needed outside this file
++[
++ % /.fonttempstring /.scannextfontdir - are also used in gs_res.ps, so are undefined there
++ % /.fontnameproperties - is used in pdf_font.ps
++ % /.scanfontheaders - used in gs_cff.ps, gs_ttf.ps
++ /.loadfontloop /.tryloadfont /.findfont /.pathlist /.loadFontmap /.lowerstring
++ /.splitfilename /.scanfontdict /.scanfontbegin
++ /.scanfontskip /.scan1fontstring
++ /.scan1fontfirst /.scanfontdir
++ /.setnativefontmapbuilt /.aliasfont
++ /.setloadingfont /.substitutefaces /.substituteproperties /.substitutefamilies
++ /.nametostring /.fontnamestring /.checkalias /.fontknownget /.stdsubstfont
++ /.putgstringcopy
++] {systemdict exch .forceundef} forall
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index 18d5452..b016113 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -961,7 +961,7 @@ userdict /.localcsdefaults //false put
+     dup type /nametype eq { .namestring } if
+     dup type /stringtype ne { //false exit } if
+                 % Check the resource directory.
+-    dup .fonttempstring /FontResourceDir getsystemparam .genericrfn
++    dup //.fonttempstring /FontResourceDir getsystemparam .genericrfn
+     status {
+       pop pop pop pop //true exit
+     } if
+@@ -969,7 +969,7 @@ userdict /.localcsdefaults //false put
+                 % as the font.
+     findlibfile { closefile //true exit } if
+                 % Scan a FONTPATH directory and try again.
+-    .scannextfontdir not { //false exit } if
++    //.scannextfontdir exec not { //false exit } if
+   } loop
+ } bind def
+ 
+@@ -1008,7 +1008,7 @@ currentdict /.fontstatusaux .undef
+         } ifelse
+ } bind executeonly
+ /ResourceForAll {
+-        { .scannextfontdir not { exit } if } loop
++        { //.scannextfontdir exec not { exit } if } loop
+         /Generic /Category findresource /ResourceForAll get exec
+ } bind executeonly
+ /.ResourceFileStatus {
+@@ -1163,6 +1163,7 @@ end				% level2dict
+ [
+     /.default_resource_dir
+     /.resource_dir_name
++    /.fonttempstring /.scannextfontdir % from gs_fonts.ps
+ ]
+ {systemdict exch .forceundef} forall
+ 
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0007.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0007.patch
new file mode 100644
index 0000000000..5c1f839597
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-6116-0007.patch
@@ -0,0 +1,346 @@
+From 5c49efe24dda0f2dbd2a09b9159e683cce99b6d8 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 11 Jan 2019 13:36:36 +0000
+Subject: [PATCH 7/7] Remove .forcedef, and harden .force* ops more
+
+Remove .forcedef and replace all uses with a direct call to .forceput instead.
+
+Ensure every procedure (named and trasient) that calls .forceput is
+executeonly.
+
+CVE: CVE-2019-6116
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ Resource/Init/gs_dps1.ps  | 15 +++++++-----
+ Resource/Init/gs_init.ps  | 28 ++++++++-------------
+ Resource/Init/gs_lev2.ps  | 51 +++++++++++++++++++--------------------
+ Resource/Init/gs_ll3.ps   |  5 ++--
+ Resource/Init/gs_res.ps   | 29 +++++++++++-----------
+ Resource/Init/gs_statd.ps |  4 +--
+ 6 files changed, 63 insertions(+), 69 deletions(-)
+
+diff --git a/Resource/Init/gs_dps1.ps b/Resource/Init/gs_dps1.ps
+index 8700c8c..3d2cf7a 100644
+--- a/Resource/Init/gs_dps1.ps
++++ b/Resource/Init/gs_dps1.ps
+@@ -33,14 +33,17 @@ systemdict begin
+ 
+ /SharedFontDirectory .FontDirectory .gcheck
+  { .currentglobal //false .setglobal
++   currentdict
+    /LocalFontDirectory .FontDirectory dup maxlength dict copy
+-   .forcedef	% LocalFontDirectory is local, systemdict is global
++   .forceput	% LocalFontDirectory is local, systemdict is global
+    .setglobal .FontDirectory
+- }
+- { /LocalFontDirectory .FontDirectory
+-   .forcedef	% LocalFontDirectory is local, systemdict is global
++ } executeonly
++ {
++   currentdict
++   /LocalFontDirectory .FontDirectory
++   .forceput	% LocalFontDirectory is local, systemdict is global
+    50 dict
+- }
++ }executeonly
+ ifelse def
+ 
+ end				% systemdict
+@@ -55,7 +58,7 @@ level2dict begin
+     { //SharedFontDirectory }
+     { /LocalFontDirectory .systemvar }	% can't embed ref to local VM
+    ifelse .forceput pop	% LocalFontDirectory is local, systemdict is global
+- } .bind odef
++ } .bind executeonly odef
+ % Don't just copy (load) the definition of .setglobal:
+ % it gets redefined for LL3.
+ /setshared { /.setglobal .systemvar exec } odef
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index d9a0829..45bebf4 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -54,7 +54,7 @@ systemdict exch
+    dup /userdict
+    currentdict dup 200 .setmaxlength		% userdict
+    .forceput			% userdict is local, systemdict is global
+- }
++ } executeonly
+ if begin
+ 
+ % Define dummy local/global operators if needed.
+@@ -299,13 +299,6 @@ QUIET not { printgreeting flush } if
+   1 index exch .makeoperator def
+ } .bind def
+ 
+-% Define a special version of def for storing local objects into global
+-% dictionaries.  Like .forceput, this exists only during initialization.
+-/.forcedef {		% <key> <value> .forcedef -
+-  1 .argindex pop	% check # of args
+-  currentdict 3 1 roll .forceput
+-} .bind odef
+-
+ % Define procedures for accessing variables in systemdict and userdict
+ % regardless of the contents of the dictionary stack.
+ /.systemvar {		% <name> .systemvar <value>
+@@ -347,7 +340,7 @@ DELAYBIND
+        }
+       ifelse
+     } .bind def
+-} if
++} executeonly if
+ 
+ %**************** BACKWARD COMPATIBILITY ****************
+ /hwsizedict mark /HWSize //null .dicttomark readonly def
+@@ -655,7 +648,7 @@ currentdict /.typenames .undef
+       /ifelse .systemvar
+     ] cvx executeonly
+   exch .setglobal
+-} odef
++} executeonly odef
+ systemdict /internaldict dup .makeinternaldict .makeoperator
+ .forceput		% proc is local, systemdict is global
+ 
+@@ -1093,7 +1086,7 @@ def
+ 
+ % Define $error.  This must be in local VM.
+ .currentglobal //false .setglobal
+-/$error 40 dict .forcedef	% $error is local, systemdict is global
++currentdict /$error 40 dict .forceput	% $error is local, systemdict is global
+                 % newerror, errorname, command, errorinfo,
+                 % ostack, estack, dstack, recordstacks,
+                 % binary, globalmode,
+@@ -1112,8 +1105,8 @@ end
+ % Define errordict similarly.  It has one entry per error name,
+ %   plus handleerror.  However, some astonishingly badly written PostScript
+ %   files require it to have at least one empty slot.
+-/errordict ErrorNames length 3 add dict
+-.forcedef		% errordict is local, systemdict is global
++currentdict /errordict ErrorNames length 3 add dict
++.forceput		% errordict is local, systemdict is global
+ .setglobal		% back to global VM
+ %  gserrordict contains all the default error handling methods, but unlike
+ %  errordict it is noaccess after creation (also it is in global VM).
+@@ -1273,8 +1266,9 @@ end
+ (END PROCS) VMDEBUG
+ 
+ % Define the font directory.
++currentdict
+ /FontDirectory //false .setglobal 100 dict //true .setglobal
+-.forcedef		% FontDirectory is local, systemdict is global
++.forceput		% FontDirectory is local, systemdict is global
+ 
+ % Define the encoding dictionary.
+ /EncodingDirectory 16 dict def	% enough for Level 2 + PDF standard encodings
+@@ -2333,7 +2327,6 @@ SAFER { .setsafeglobal } if
+   //systemdict /UndefinePostScriptOperators get exec
+   //systemdict /UndefinePDFOperators get exec
+   //systemdict /.forcecopynew .forceundef	% remove temptation
+-  //systemdict /.forcedef .forceundef		% ditto
+   //systemdict /.forceput .forceundef		% ditto
+   //systemdict /.undef .forceundef		    % ditto
+   //systemdict /.forceundef .forceundef		% ditto
+@@ -2368,9 +2361,9 @@ SAFER { .setsafeglobal } if
+         % (and, if implemented, context switching).
+   .currentglobal //false .setglobal
+      mark userparams { } forall .dicttomark readonly
+-     /userparams exch .forcedef		% systemdict is read-only
++     currentdict exch /userparams exch .forceput		% systemdict is read-only
+   .setglobal
+-} if
++} executeonly if
+ /.currentsystemparams where {
+   pop
+         % Remove real system params from pssystemparams.
+@@ -2458,7 +2451,6 @@ end
+ DELAYBIND not {
+   systemdict /.bindnow .undef       % We only need this for DELAYBIND
+   systemdict /.forcecopynew .undef	% remove temptation
+-  systemdict /.forcedef .undef		% ditto
+   systemdict /.forceput .undef		% ditto
+   systemdict /.forceundef .undef	% ditto
+ } if
+diff --git a/Resource/Init/gs_lev2.ps b/Resource/Init/gs_lev2.ps
+index 0f0d573..9c0c3a6 100644
+--- a/Resource/Init/gs_lev2.ps
++++ b/Resource/Init/gs_lev2.ps
+@@ -304,31 +304,30 @@ end
+     psuserparams exch /.checkFilePermitparams load put
+   .setglobal
+ 
+-pssystemparams begin
+-  /CurDisplayList 0 .forcedef
+-  /CurFormCache 0 .forcedef
+-  /CurInputDevice () .forcedef
+-  /CurOutlineCache 0 .forcedef
+-  /CurOutputDevice () .forcedef
+-  /CurPatternCache 0 .forcedef
+-  /CurUPathCache 0 .forcedef
+-  /CurScreenStorage 0 .forcedef
+-  /CurSourceList 0 .forcedef
+-  /DoPrintErrors //false .forcedef
+-  /JobTimeout 0 .forcedef
+-  /LicenseID (LN-001) .forcedef     % bogus
+-  /MaxDisplayList 140000 .forcedef
+-  /MaxFormCache 100000 .forcedef
+-  /MaxImageBuffer 524288 .forcedef
+-  /MaxOutlineCache 65000 .forcedef
+-  /MaxPatternCache 100000 .forcedef
+-  /MaxUPathCache 300000 .forcedef
+-  /MaxScreenStorage 84000 .forcedef
+-  /MaxSourceList 25000 .forcedef
+-  /PrinterName product .forcedef
+-  /RamSize 4194304 .forcedef
+-  /WaitTimeout 40 .forcedef
+-end
++pssystemparams
++dup /CurDisplayList 0 .forceput
++dup /CurFormCache 0 .forceput
++dup /CurInputDevice () .forceput
++dup /CurOutlineCache 0 .forceput
++dup /CurOutputDevice () .forceput
++dup /CurPatternCache 0 .forceput
++dup /CurUPathCache 0 .forceput
++dup /CurScreenStorage 0 .forceput
++dup /CurSourceList 0 .forceput
++dup /DoPrintErrors //false .forceput
++dup /JobTimeout 0 .forceput
++dup /LicenseID (LN-001) .forceput     % bogus
++dup /MaxDisplayList 140000 .forceput
++dup /MaxFormCache 100000 .forceput
++dup /MaxImageBuffer 524288 .forceput
++dup /MaxOutlineCache 65000 .forceput
++dup /MaxPatternCache 100000 .forceput
++dup /MaxUPathCache 300000 .forceput
++dup /MaxScreenStorage 84000 .forceput
++dup /MaxSourceList 25000 .forceput
++dup /PrinterName product .forceput
++dup /RamSize 4194304 .forceput
++    /WaitTimeout 40 .forceput
+ 
+ % Define the procedures for handling comment scanning.  The names
+ % %ProcessComment and %ProcessDSCComment are known to the interpreter.
+@@ -710,7 +709,7 @@ pop		% currentsystemparams
+ /statusdict currentdict def
+ 
+ currentdict end
+-/statusdict exch .forcedef	% statusdict is local, systemdict is global
++currentdict exch /statusdict exch .forceput	% statusdict is local, systemdict is global
+ 
+ % The following compatibility operators are in systemdict.  They are
+ % defined here, rather than in gs_init.ps, because they require the
+diff --git a/Resource/Init/gs_ll3.ps b/Resource/Init/gs_ll3.ps
+index c86721f..881af44 100644
+--- a/Resource/Init/gs_ll3.ps
++++ b/Resource/Init/gs_ll3.ps
+@@ -521,9 +521,8 @@ end
+ % Define additional user and system parameters.
+ /HalftoneMode 0 .definepsuserparam
+ /MaxSuperScreen 1016 .definepsuserparam
+-pssystemparams begin		% read-only, so use .forcedef
+-  /MaxDisplayAndSourceList 160000 .forcedef
+-end
++% read-only, so use .forceput
++pssystemparams  /MaxDisplayAndSourceList 160000 .forceput
+ 
+ % Define the IdiomSet resource category.
+ { /IdiomSet } {
+diff --git a/Resource/Init/gs_res.ps b/Resource/Init/gs_res.ps
+index b016113..89c0ed6 100644
+--- a/Resource/Init/gs_res.ps
++++ b/Resource/Init/gs_res.ps
+@@ -41,10 +41,10 @@ level2dict begin
+ % However, Ed Taft of Adobe says their interpreters don't implement this
+ % either, so we aren't going to worry about it for a while.
+ 
+-currentglobal //false setglobal systemdict begin
+-  /localinstancedict 5 dict
+-  .forcedef	% localinstancedict is local, systemdict is global
+-end //true setglobal
++currentglobal //false setglobal
++  systemdict /localinstancedict 5 dict
++  .forceput	% localinstancedict is local, systemdict is global
++//true setglobal
+ /.emptydict 0 dict readonly def
+ setglobal
+ 
+@@ -149,7 +149,7 @@ setglobal
+           dup [ exch 0 -1 ] exch
+           .Instances 4 2 roll put
+                 % Make the Category dictionary read-only.  We will have to
+-                % use .forceput / .forcedef later to replace the dummy,
++                % use .forceput / .forceput later to replace the dummy,
+                 % empty .Instances dictionary with the real one later.
+           readonly
+         }{
+@@ -304,7 +304,8 @@ systemdict begin
+      dup () ne {
+      .file_name_directory_separator concatstrings
+     } if
+-    2 index exch //false .file_name_combine not {
++    2 index exch //false
++    .file_name_combine not {
+       (Error: .default_resource_dir returned ) print exch print ( that can't combine with ) print =
+       /.default_resource_dir cvx /configurationerror signalerror
+     } if
+@@ -317,14 +318,14 @@ currentdict /pssystemparams known not {
+ pssystemparams begin
+   //.default_resource_dir exec
+   /FontResourceDir (Font) //.resource_dir_name exec
+-     readonly .forcedef	% pssys'params is r-o
++     readonly currentdict 3 1 roll .forceput	% pssys'params is r-o
+   /GenericResourceDir () //.resource_dir_name exec
+-     readonly .forcedef	% pssys'params is r-o
++     readonly currentdict 3 1 roll .forceput	% pssys'params is r-o
+   pop % .default_resource_dir
+   /GenericResourcePathSep
+-        .file_name_separator readonly .forcedef		% pssys'params is r-o
+-  (%diskFontResourceDir) cvn (/Resource/Font/) readonly .forcedef	% pssys'params is r-o
+-  (%diskGenericResourceDir) cvn (/Resource/) readonly .forcedef	% pssys'params is r-o
++        .file_name_separator readonly currentdict 3 1 roll .forceput		% pssys'params is r-o
++  currentdict (%diskFontResourceDir) cvn (/Resource/Font/) readonly .forceput	% pssys'params is r-o
++  currentdict (%diskGenericResourceDir) cvn (/Resource/) readonly .forceput	% pssys'params is r-o
+ end
+ end
+ 
+@@ -422,8 +423,8 @@ status {
+                 .Instances dup //.emptydict eq {
+                   pop 3 dict
+                         % As noted above, Category dictionaries are read-only,
+-                        % so we have to use .forcedef here.
+-                  /.Instances 1 index .forcedef	% Category dict is read-only
++                        % so we have to use .forceput here.
++                  currentdict /.Instances 2 index .forceput	% Category dict is read-only
+                 } executeonly if
+               }
+               { .LocalInstances dup //.emptydict eq
+@@ -441,7 +442,7 @@ status {
+            { /defineresource cvx /typecheck signaloperror
+            }
+         ifelse
+-} .bind executeonly .makeoperator		% executeonly to prevent access to .forcedef
++} .bind executeonly .makeoperator		% executeonly to prevent access to .forceput
+ /UndefineResource
+         {  { dup 2 index .knownget
+               { dup 1 get 1 ge
+diff --git a/Resource/Init/gs_statd.ps b/Resource/Init/gs_statd.ps
+index 20d4c96..b6a7659 100644
+--- a/Resource/Init/gs_statd.ps
++++ b/Resource/Init/gs_statd.ps
+@@ -21,10 +21,10 @@ systemdict begin
+         % We make statusdict a little larger for Level 2 stuff.
+         % Note that it must be allocated in local VM.
+  .currentglobal //false .setglobal
+- /statusdict 91 dict .forcedef		% statusdict is local, sys'dict global
++ currentdict /statusdict 91 dict .forceput		% statusdict is local, sys'dict global
+         % To support the Level 2 job control features,
+         % serverdict must also be in local VM.
+- /serverdict 10 dict .forcedef		% serverdict is local, sys'dict global
++ currentdict /serverdict 10 dict .forceput		% serverdict is local, sys'dict global
+  .setglobal
+ end
+ 
+-- 
+2.18.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
index 5ca978f86c..bb32347880 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
@@ -32,6 +32,19 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
+           file://CVE-2019-6116-0001.patch \
+           file://CVE-2019-6116-0002.patch \
+           file://CVE-2019-6116-0003.patch \
+           file://CVE-2019-6116-0004.patch \
+           file://CVE-2019-6116-0005.patch \
+           file://CVE-2019-6116-0006.patch \
+           file://CVE-2019-6116-0007.patch \
+           file://CVE-2019-3835-0001.patch \
+           file://CVE-2019-3835-0002.patch \
+           file://CVE-2019-3835-0003.patch \
+           file://CVE-2019-3835-0004.patch \
+           file://CVE-2019-3838-0001.patch \
+           file://CVE-2019-3838-0002.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.20.1


