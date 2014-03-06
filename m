Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF636F4EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:10:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 09:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="495285766"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 09:09:32 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:09:26 -0600
Message-Id: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394124934.git.tom.zanussi@linux.intel.com>
References: <cover.1394124934.git.tom.zanussi@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] lttng-modules: Add version 2.4.0
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
X-List-Received-Date: Thu, 06 Mar 2014 17:10:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tom Zanussi <tom.zanussi@intel.com>

This updates lttng-modules to 2.4.0, codenamed Époque Opaque, needed
for interoperability with the 3.14 (dev) kernel.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
new file mode 100644
index 0000000..0b7d5e8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
@@ -0,0 +1,34 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = "virtual/kernel"
+
+inherit module
+
+SRCREV = "fb2c37799306d16fb590aebee6fad8be431264b7"
+PV = "2.4.0"
+
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+export KERNEL_SRC="${STAGING_KERNEL_DIR}"
+
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
+}
+
-- 
1.8.3.1


