Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7831076E2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:58:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2015 05:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,547,1437462000"; d="scan'208";a="771069221"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 17 Sep 2015 05:58:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:00:38 +0300
Message-Id: <f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1442494048.git.jussi.kukkonen@intel.com>
References: <cover.1442494048.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] xinput-calibrator: Add a dummy calibration file for qemu
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
X-List-Received-Date: Thu, 17 Sep 2015 12:58:40 -0000

This prevents xinput_calibrator from popping up on every boot in qemu.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput      | 2 ++
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb    | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput
new file mode 100644
index 0000000..a816d6d
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput
@@ -0,0 +1,2 @@
+# Dummy pointercal.xinput file to prevent xinput_calibrator
+# from running on qemu startup
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 65348c3..cab3d14 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -5,8 +5,14 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PR = "r7"
 
 SRC_URI = "file://pointercal.xinput"
+SRC_URI_append_qemuall = " file://pointercal-qemu.xinput"
 S = "${WORKDIR}"
 
+do_install_prepend_qemuall () {
+    install -d ${D}${sysconfdir}/
+    install -m 0644 ${S}/pointercal-qemu.xinput ${D}${sysconfdir}/pointercal.xinput
+}
+
 do_install() {
     # Only install file if it has a contents
     if [ -s ${S}/pointercal.xinput ] &&\
-- 
2.1.4


