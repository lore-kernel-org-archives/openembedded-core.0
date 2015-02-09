Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id BA4D173291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 16:52:39 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t19GqcmX006320 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Feb 2015 10:52:40 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015020910523801-960606 ;
	Mon, 9 Feb 2015 10:52:38 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 9 Feb 2015 10:52:25 -0600
Message-Id: <1423500745-2142-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/09/2015 10:52:38 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/09/2015 10:52:39 AM,
	Serialize complete at 02/09/2015 10:52:39 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-09_02:, , signatures=0
Subject: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Mon, 09 Feb 2015 16:52:46 -0000

Update to version 2.5.2 to match trace-cmd.

Changes include:

 - Remove kernelshark-fix-syntax-error-of-shell.patch (the syntax error
   is no longer present in the new version).

 - Specify bindir_relative and libdir in EXTRA_OEMAKE as in the
   trace-cmd recipe so files get installed to the right place.
   Additionally, remove unnecessary EXTRA_OEMAKE options.

 - Fix up the do_install steps to remove the plugins directory; that
   directory now lives under /usr/lib.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../kernelshark-fix-syntax-error-of-shell.patch    | 30 ----------------------
 .../{kernelshark_1.2.bb => kernelshark_git.bb}     | 17 +++++++-----
 2 files changed, 10 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
 rename meta/recipes-kernel/trace-cmd/{kernelshark_1.2.bb => kernelshark_git.bb} (58%)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
deleted file mode 100644
index faef049..0000000
--- a/meta/recipes-kernel/trace-cmd/kernelshark/kernelshark-fix-syntax-error-of-shell.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-kernelshark: fix syntax error of shell
-
-Delete "<<<" syntax of bash in Makefile, else we would get following error:
-
-	Syntax error: redirection unexpected
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- Makefile |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c1fa906..be84415 100644
---- a/Makefile
-+++ b/Makefile
-@@ -89,8 +89,7 @@ endif
- 
- # $(call test-build, snippet, ret) -> ret if snippet compiles
- #                                  -> empty otherwise
--test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
--	                  <<<'$1' && echo y), $2)
-+test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
- 
- # have udis86 disassembler library?
- udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
similarity index 58%
rename from meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
rename to meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index 28412c7..814e8bf 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -9,9 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = "gtk+ libxml2"
 RDEPENDS_${PN} = "trace-cmd"
 
-SRC_URI_append = "file://kernelshark-fix-syntax-error-of-shell.patch"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
+EXTRA_OEMAKE = "\
+    'prefix=${prefix}' \
+    'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
+    'libdir=${@oe.path.relative(prefix, libdir)}' \
+    gui \
+"
 
 do_compile_prepend() {
     # Make sure the recompile is OK
@@ -19,8 +22,8 @@ do_compile_prepend() {
 }
 
 do_install() {
-	oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
-	rm ${D}${bindir}/trace-cmd
-	rm -rf ${D}${datadir}/trace-cmd
-	rmdir ${D}${datadir}
+    oe_runmake DESTDIR="${D}" install_gui
+    rm ${D}${bindir}/trace-cmd
+    rm -rf ${D}${libdir}/trace-cmd
+    rmdir ${D}${libdir}
 }
-- 
2.3.0


