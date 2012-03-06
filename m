Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvl-0003cc-AZ
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714840"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:06 -0800
Message-Id: <0ea00dab7b56ea5addc8a76030aadc3acbbdf191.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/20] image_types: add IMAGE_ROOTFS_ALIGNMENT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 17:12:10 -0000

From: Ken Werner <ken.werner@linaro.org>

Introduce a new variable called IMAGE_ROOTFS_ALIGNMENT that allows to control
the aligment of the size of the rootfs. Its default value is set to 1KiB so
that the existing behaviour is not changed. In case the SD card emulation of
a QEMU system emulator gets used you may set the alignment to 2MiB.
---
 meta/classes/image_types.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 1bf59a5..8b82018 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -60,9 +60,19 @@ def get_imagecmds(d):
         cmds += "\n" + localdata.getVar("runimagecmd", True)
     return cmds
 
+# The default aligment of the size of the rootfs is set to 1KiB. In case
+# you're using the SD card emulation of a QEMU system simulator you may
+# set this value to 2048 (2MiB alignment).
+IMAGE_ROOTFS_ALIGNMENT ?= "1"
+
 runimagecmd () {
 	# Image generation code for image type ${type}
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = ($1 * ${IMAGE_OVERHEAD_FACTOR});  OFMT = "%.0f" ; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
+	# The base_size gets calculated:
+	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
+	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
+	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
+	#  - finally tested against IMAGE_ROOTFS_SIZE
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
 	${cmd}
 	# Now create the needed compressed versions
 	cd ${DEPLOY_DIR_IMAGE}/
-- 
1.7.7.6



