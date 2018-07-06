Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D16EA78B2F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:08:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6698P4n013420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2018 02:08:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 6 Jul 2018 02:08:25 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2018 05:07:42 -0400
Message-ID: <cf0cc593ca47deb213a8dacbeeae6deea3b195e4.1530867788.git.hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1530867788.git.hongzhi.song@windriver.com>
References: <cover.1530867788.git.hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] kernel-selftest: add vm testcase to recipe
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
X-List-Received-Date: Fri, 06 Jul 2018 09:08:25 -0000
Content-Type: text/plain

Add vm testcase to recipe, and sightly modify organization of code

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../kernel-selftest/kernel-selftest.bb             | 62 +++++++++++-----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
index c976e7b..28fd178 100644
--- a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -2,6 +2,7 @@ SUMMARY = "Kernel selftest for Linux"
 DESCRIPTION = "Kernel selftest for Linux"
 LICENSE = "GPLv2"
 
+# for bpf and vm
 DEPENDS = " \
     elfutils \
     libcap \
@@ -10,6 +11,10 @@ DEPENDS = " \
     util-linux \
     rsync-native \
 "
+# for vm
+RDEPENDS_${PN} += "libgcc \
+                   bash \
+"
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -17,14 +22,13 @@ inherit linux-kernel-base kernel-arch
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-inherit kernelsrc
-
 S = "${WORKDIR}/${BP}"
 
-# The LDFLAGS is required or some old kernels fails due missing
-# symbols and this is preferred than requiring patches to every old
-# supported kernel.
-LDFLAGS="-ldl -lutil"
+# now we just test bpf and vm
+# we will append other kernel selftest in the future
+TEST_LIST = "bpf \
+             vm \
+"
 
 EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
@@ -32,41 +36,37 @@ EXTRA_OEMAKE = '\
     CC="${CC}" \
     AR="${AR}" \
     LD="${LD}" \
-    EXTRA_CFLAGS="-ldw" \
-    ${PACKAGECONFIG_CONFARGS} \
 '
 
 EXTRA_OEMAKE += "\
     'DESTDIR=${D}' \
-    'prefix=${prefix}' \
-    'bindir=${bindir}' \
-    'sharedir=${datadir}' \
-    'sysconfdir=${sysconfdir}' \
-    'sharedir=${@os.path.relpath(datadir, prefix)}' \
-    'mandir=${@os.path.relpath(mandir, prefix)}' \
-    'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
 KERNEL_SELFTEST_SRC ?= "Makefile \
-             include \
-             tools \
+                        include \
+                        tools \
+                        scripts \
+                        arch \
 "
 
-# Add bpf selftest now, other can be added later.
-do_compile () {
-	# Linux kernel build system is expected to do the right thing
-	unset CFLAGS
-	oe_runmake -C ${S}/tools/testing/selftests/bpf
+do_compile() {
+    for i in ${TEST_LIST}
+    do
+        oe_runmake -C ${S}/tools/testing/selftests/${i}
+    done
+}
+
+do_install() {
+    for i in ${TEST_LIST}
+    do
+        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install
+    done
+
+    chown root:root  -R ${D}/opt/kselftest
 }
 
-# On target, enter /opt/kselftest/bpf directory, run "./test_align 0 11"
-# The test_align testcase test the bpf instruction set, the testcase defined here:
-# https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/tree/tools/testing/selftests/bpf/test_align.c#n47
-do_install () {
-	# Linux kernel build system is expected to do the right thing
-	unset CFLAGS
-	mkdir -p ${D}/opt/kselftest/bpf
-	install -m 0755 ${B}/tools/testing/selftests/bpf/test_align ${D}/opt/kselftest/bpf/
+do_configure() {
+    :
 }
 
 do_configure[prefuncs] += "copy_perf_source_from_kernel remove_clang_related"
@@ -91,4 +91,4 @@ remove_clang_related() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-FILES_${PN} += "/opt/kselftest/bpf/*"
+FILES_${PN} += "/opt/kselftest/"
-- 
2.8.1


