Received: from e06smtp18.uk.ibm.com ([195.75.94.114])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1S3DKb-0004Kr-Ei
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 22:14:33 +0100
Received: from /spool/local
	by e06smtp18.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Thu, 1 Mar 2012 20:55:55 -0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com (9.149.38.185)
	by e06smtp18.uk.ibm.com (192.168.101.148) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 1 Mar 2012 20:55:51 -0000
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q21KtojG2461866
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 20:55:50 GMT
Received: from d06av05.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q21Kto8i019744
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 13:55:50 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-213-71.boeblingen.de.ibm.com [9.152.213.71])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q21Ktoco019741; Thu, 1 Mar 2012 13:55:50 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2012 21:55:44 +0100
Message-Id: <1330635344-27411-1-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
x-cbid: 12030120-6892-0000-0000-0000012D0908
Subject: [PATCH] image_types: add IMAGE_ROOTFS_ALIGNMENT
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
X-List-Received-Date: Thu, 01 Mar 2012 21:14:33 -0000

Introduce a new variable called IMAGE_ROOTFS_ALIGNMENT that allows to control
the aligment of the size of the rootfs. Its default value is set to 1KiB so
that the existing behaviour is not changed. In case the SD card emulation of
a QEMU system emulator gets used you may set the alignment to 2MiB.
---
 meta/classes/image_types.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f756c39..314d6d1 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -55,9 +55,19 @@ def get_imagecmds(d):
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
1.7.5.4



