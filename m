Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2118C7E72A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 09:15:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5C9FLqK005824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 02:15:31 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 12 Jun 2019 02:15:10 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jun 2019 17:15:09 +0800
Message-ID: <1560330909-164994-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 09:15:40 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This is based on meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb and is for
those who want to build lttng-modules with bleeding edge kernel, to avoid
regularly backporting patches from upstream.

Note that PREFERRED_VERSION needs to be set to select this recipe instead of the
tar ball one.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_git.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
new file mode 100644
index 0000000..966d342
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -0,0 +1,34 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128 \
+                    "
+DEFAULT_PREFERENCE = "-1"
+
+inherit module
+
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
+
+SRC_URI = "git://git.lttng.org/lttng-modules;branch=master \
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           "
+SRCREV = "${AUTOREV}"
+PV = "2.11.0-rc+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+
+EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D'), d.getVar('nonarch_base_libdir')[1:], 'modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
+}
+
-- 
2.7.4


