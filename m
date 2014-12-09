Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE117101A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 09:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB99cxbg029940
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 01:38:59 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 9 Dec 2014 01:38:59 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 17:36:41 +0800
Message-ID: <1418117801-9614-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH] valgrind: update to 3.10.1
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
X-List-Received-Date: Tue, 09 Dec 2014 09:39:07 -0000
Content-Type: text/plain

Update valgrind from 3.10.0 to 3.10.1 which is a bug fix release.  It
fixes various bugs reported in 3.10.0 and backports fixes for all
reported missing AArch64 ARMv8 instructions and syscalls from the trunk.

Add dependency perl-module-file-glob for ptest subpackage.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.0.bb | 98 -----------------------
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 98 +++++++++++++++++++++++
 2 files changed, 98 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
 create mode 100644 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
deleted file mode 100644
index 4c6e1a7..0000000
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY = "Valgrind memory debugger and instrumentation framework"
-HOMEPAGE = "http://valgrind.org/"
-BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
-LICENSE = "GPLv2 & GPLv2+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=e7071929a50d4b0fc27a3014b315b0f7 \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=92df8a1bde56fe2af70931ff55f6622f \
-                    file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
-
-X11DEPENDS = "virtual/libx11"
-DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
-           file://fixed-perl-path.patch \
-           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
-           file://sepbuildfix.patch \
-           file://glibc-2.20.patch \
-           file://force-nostabs.patch \
-           file://remove-arm-variant-specific.patch \
-           file://remove-ppc-tests-failing-build.patch \
-           file://valgrind-remove-rpath.patch \
-           file://add-ptest.patch \
-           file://run-ptest \
-          "
-
-SRC_URI[md5sum] = "7c311a72a20388aceced1aa5573ce970"
-SRC_URI[sha256sum] = "03047f82dfc6985a4c7d9d2700e17bc05f5e1a0ca6ad902e5d6c81aeb720edc9"
-
-COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
-COMPATIBLE_HOST_armv7a = 'arm.*-linux'
-
-inherit autotools ptest
-
-EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
-EXTRA_OEMAKE = "-w"
-PARALLEL_MAKE = ""
-
-do_install_append () {
-    install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
-}
-
-RDEPENDS_${PN} += "perl"
-
-FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
-
-# valgrind needs debug information for ld.so at runtime in order to
-# redirect functions like strlen.
-RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
-
-RDEPENDS_${PN}-ptest += " sed perl glibc-utils"
-
-do_compile_ptest() {
-    oe_runmake check
-}
-
-
-do_install_ptest() {
-    chmod +x ${B}/tests/vg_regtest
-
-    # The test application binaries are not automatically installed.
-    # Grab them from the build directory.
-    #
-    # The regression tests require scripts and data files that are not
-    # copied to the build directory.  They must be copied from the
-    # source directory. 
-    saved_dir=$PWD
-    for parent_dir in ${S} ${B} ; do
-        cd $parent_dir
-
-        # exclude shell or the package won't install
-        rm -rf none/tests/shell* 2>/dev/null
-
-        subdirs="tests cachegrind/tests callgrind/tests drd/tests helgrind/tests massif/tests memcheck/tests none/tests"
-
-        # Get the vg test scripts, filters, and expected files
-        for dir in $subdirs ; do
-            find $dir | cpio -pvdu ${D}${PTEST_PATH}
-        done
-        cd $saved_dir
-    done
-
-    # clean out build artifacts before building the rpm
-    find ${D}${PTEST_PATH} \
-         \( -name "Makefile*" \
-        -o -name "*.o" \
-        -o -name "*.c" \
-        -o -name "*.S" \
-        -o -name "*.h" \) \
-        -exec rm {} \;
-
-    # needed by massif tests
-    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
-
-    # handle multilib
-    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
-}
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
new file mode 100644
index 0000000..a25922a
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -0,0 +1,98 @@
+SUMMARY = "Valgrind memory debugger and instrumentation framework"
+HOMEPAGE = "http://valgrind.org/"
+BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
+LICENSE = "GPLv2 & GPLv2+ & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
+                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=e7071929a50d4b0fc27a3014b315b0f7 \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=92df8a1bde56fe2af70931ff55f6622f \
+                    file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
+
+X11DEPENDS = "virtual/libx11"
+DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+
+SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
+           file://fixed-perl-path.patch \
+           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
+           file://sepbuildfix.patch \
+           file://glibc-2.20.patch \
+           file://force-nostabs.patch \
+           file://remove-arm-variant-specific.patch \
+           file://remove-ppc-tests-failing-build.patch \
+           file://valgrind-remove-rpath.patch \
+           file://add-ptest.patch \
+           file://run-ptest \
+          "
+
+SRC_URI[md5sum] = "60ddae962bc79e7c95cfc4667245707f"
+SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1dfcb997"
+
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST_armv7a = 'arm.*-linux'
+
+inherit autotools ptest
+
+EXTRA_OECONF = "--enable-tls --without-mpicc"
+EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
+EXTRA_OEMAKE = "-w"
+PARALLEL_MAKE = ""
+
+do_install_append () {
+    install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
+}
+
+RDEPENDS_${PN} += "perl"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
+
+# valgrind needs debug information for ld.so at runtime in order to
+# redirect functions like strlen.
+RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
+
+RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
+
+do_compile_ptest() {
+    oe_runmake check
+}
+
+
+do_install_ptest() {
+    chmod +x ${B}/tests/vg_regtest
+
+    # The test application binaries are not automatically installed.
+    # Grab them from the build directory.
+    #
+    # The regression tests require scripts and data files that are not
+    # copied to the build directory.  They must be copied from the
+    # source directory. 
+    saved_dir=$PWD
+    for parent_dir in ${S} ${B} ; do
+        cd $parent_dir
+
+        # exclude shell or the package won't install
+        rm -rf none/tests/shell* 2>/dev/null
+
+        subdirs="tests cachegrind/tests callgrind/tests drd/tests helgrind/tests massif/tests memcheck/tests none/tests"
+
+        # Get the vg test scripts, filters, and expected files
+        for dir in $subdirs ; do
+            find $dir | cpio -pvdu ${D}${PTEST_PATH}
+        done
+        cd $saved_dir
+    done
+
+    # clean out build artifacts before building the rpm
+    find ${D}${PTEST_PATH} \
+         \( -name "Makefile*" \
+        -o -name "*.o" \
+        -o -name "*.c" \
+        -o -name "*.S" \
+        -o -name "*.h" \) \
+        -exec rm {} \;
+
+    # needed by massif tests
+    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
+
+    # handle multilib
+    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+}
+
-- 
1.9.1


