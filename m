Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 343BD7872A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:22:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFMW58021247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:22:33 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpXs-0004jB-JX; Wed, 17 Jan 2018 15:22:32 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:22:28 +0000
Message-Id: <1516202549-18121-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516202549-18121-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1516202549-18121-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/4] lttng-modules: upgrade 2.9.5 -> 2.10.4
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
X-List-Received-Date: Wed, 17 Jan 2018 15:22:34 -0000

LICENSE file contains a list of files and addtional files were added to
the list, license was unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb | 35 +++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb  | 34 ----------------------
 2 files changed, 35 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
new file mode 100644
index 0000000..dd695f8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.4.bb
@@ -0,0 +1,35 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad \
+                    "
+
+inherit module
+
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
+
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+"
+
+SRC_URI[md5sum] = "832452b321a4df6836549e72d05b2ce9"
+SRC_URI[sha256sum] = "f918e3b890f378f47a9ba8710ff52590e9b1d9c63b12a0e64d138e2e2e1b3c8a"
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
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
deleted file mode 100644
index 61d9744..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
-LICENSE = "LGPLv2.1 & GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
-
-inherit module
-
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
-
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-"
-
-SRC_URI[md5sum] = "af97aaaf86133fd783bb9937dc3b4d59"
-SRC_URI[sha256sum] = "3f4e82ceb1c3c1875ec1fe89fba08294ed7feec2161339a5a71a066b27fc3e22"
-
-export INSTALL_MOD_DIR="kernel/lttng-modules"
-
-EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/${nonarch_base_libdir} -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D'), d.getVar('nonarch_base_libdir')[1:], 'modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
-}
-
-- 
2.7.4


