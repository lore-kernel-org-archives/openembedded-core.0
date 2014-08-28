Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0668F70281
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 18:44:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2014 11:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="378304099"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2014 11:40:38 -0700
From: nitin.a.kamble@intel.com
To: darren.hart@intel.com, richard.purdie@linuxfoundation.org,
	saul.wold@intel.com, Openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 11:47:28 -0700
Message-Id: <e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1409251282.git.nitin.a.kamble@intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 18:44:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This recipe adds ability to configure a BSP image for a specific
machine or platform at the boot time. The machine configurations
are not provided here, and are to be provided in the BSP layers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../imageconfigurator/imageconfigurator_git.bb     | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb

diff --git a/meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb b/meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb
new file mode 100644
index 0000000..7208ad0
--- /dev/null
+++ b/meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Daemon to configure an image for a specific machine at boot time."
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+RDEPENDS_${PN} = "sysvinit sed"
+
+PE = "1"
+PV = "0.1+git${SRCPV}"
+
+SRCREV = "90603bed54f7c033a7b2f92214c21d011459844b"
+
+SRC_URI = "git://git.yoctoproject.org/imageconfigurator.git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools pkgconfig update-rc.d
+
+INITSCRIPT_NAME = "imageconfigurator"
+INITSCRIPT_PARAMS = "start 00 S . stop 20 0 1 6 ."
+
+RRECOMMENDS_${PN} += "kernel-module-uinput"
+
+python __anonymous () {
+    src_uri = d.getVar('SRC_URI', True)
+    machine_config_files = (d.getVar('MACHINE_CONFIG_FILES', True) or "")
+    for file in machine_config_files.split():
+         src_uri += " file://" + file
+    d.setVar('SRC_URI', src_uri)
+}
+
+do_install_append() {
+	{
+	echo SUPPORTED_MACHINES=${SUPPORTED_MACHINES}
+	echo DEFAULT_MACHINE_SELECTION=${DEFAULT_MACHINE_SELECTION}
+	} > ${D}/${sysconfdir}/${BPN}/defaults
+
+	for file in ${MACHINE_CONFIG_FILES}
+	do
+		install -m 0644 ${S}/../${file} ${D}/${sysconfdir}/${BPN}/config/
+	done
+}
+
+# following variables are initialized to empty values now.
+# These need to be populated with the desired machine configurations
+# for each BSP in it's own layer.
+MACHINE_CONFIG_FILES = ""
+SUPPORTED_MACHINES = ""
+DEFAULT_MACHINE_SELECTION = "none"
-- 
1.8.1.4


