Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B225678A3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:52:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w669qQ0g019911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2018 02:52:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 6 Jul 2018 02:52:25 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2018 05:51:46 -0400
Message-ID: <1530870706-206950-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH v3] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Fri, 06 Jul 2018 09:52:25 -0000
Content-Type: text/plain

The recipe builds the framework for kernel-selftest. Now, it just
contains two sets of testcase, bpf and vm. We are appending others
to the recipe.

It needs some features which will be written into relevant recipe.
But now, you should add them to conf/local.conf manually.
KERNEL_FEATURES_append += "features/bpf/bpf.scc"

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../kernel-selftest/kernel-selftest.bb             | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-selftest.bb

diff --git a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
new file mode 100644
index 0000000..28fd178
--- /dev/null
+++ b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -0,0 +1,94 @@
+SUMMARY = "Kernel selftest for Linux"
+DESCRIPTION = "Kernel selftest for Linux"
+LICENSE = "GPLv2"
+
+# for bpf and vm
+DEPENDS = " \
+    elfutils \
+    libcap \
+    libcap-ng \
+    fuse \
+    util-linux \
+    rsync-native \
+"
+# for vm
+RDEPENDS_${PN} += "libgcc \
+                   bash \
+"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+inherit linux-kernel-base kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+S = "${WORKDIR}/${BP}"
+
+# now we just test bpf and vm
+# we will append other kernel selftest in the future
+TEST_LIST = "bpf \
+             vm \
+"
+
+EXTRA_OEMAKE = '\
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+    LD="${LD}" \
+'
+
+EXTRA_OEMAKE += "\
+    'DESTDIR=${D}' \
+"
+
+KERNEL_SELFTEST_SRC ?= "Makefile \
+                        include \
+                        tools \
+                        scripts \
+                        arch \
+"
+
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
+}
+
+do_configure() {
+    :
+}
+
+do_configure[prefuncs] += "copy_perf_source_from_kernel remove_clang_related"
+python copy_perf_source_from_kernel() {
+    sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
+    src_dir = d.getVar("STAGING_KERNEL_DIR")
+    dest_dir = d.getVar("S")
+    bb.utils.mkdirhier(dest_dir)
+    for s in sources:
+        src = oe.path.join(src_dir, s)
+        dest = oe.path.join(dest_dir, s)
+        if os.path.isdir(src):
+            oe.path.copytree(src, dest)
+        else:
+            bb.utils.copyfile(src, dest)
+}
+
+remove_clang_related() {
+	sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT="1"
+FILES_${PN} += "/opt/kselftest/"
-- 
2.8.1


