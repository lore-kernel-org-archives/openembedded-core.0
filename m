Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4226FFEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 19:06:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jun 2016 12:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,481,1459839600"; d="scan'208";a="720242938"
Received: from swold-mobl2.jf.intel.com ([10.255.79.42])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2016 12:06:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 16 Jun 2016 12:06:16 -0700
Message-Id: <1466103976-20560-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH v2] linux-firmware: add iwlwifi-8000C-19 version
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
X-List-Received-Date: Thu, 16 Jun 2016 19:06:16 -0000

This version is required for certain iwlwifi hardware
can not use the most recent firmware blob.

[YOCTO #9771]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
v2: use kernel.org version of file
    removed extra do_install_append

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 52fd176..2393afb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -178,6 +178,12 @@ PV = "0.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
+# Some devices need a specific version, not the latest
+SRC_URI += "https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/linux-firmware.git/plain/iwlwifi-8000C-19.ucode;name=iwlwifi-19"
+
+SRC_URI[iwlwifi-19.md5sum] = "132fbaee36beec5e98714f0bd66f7a1d"
+SRC_URI[iwlwifi-19.sha256sum] = "2034470df64d323b827c4f2d4d0d55be2846b7360179b5574aa28ff77b6c9471"
+
 S = "${WORKDIR}/git"
 
 inherit allarch update-alternatives
@@ -207,6 +213,9 @@ do_install() {
 
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
+
+        # Copy the iwlwifi ucode
+        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}/lib/firmware/
 }
 
 
-- 
2.5.0


