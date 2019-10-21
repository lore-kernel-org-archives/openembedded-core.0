Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Oct 2019 14:45:57 UTC
Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
	by mail.openembedded.org (Postfix) with ESMTP id 304F77F29D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 14:45:56 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id MYpFi0zB937rvMYpHibF8R; Mon, 21 Oct 2019 15:38:27 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UvodyN4B c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=XobE76Q3jBoA:10 a=-An2I_7KAAAA:8 a=435tqQJKJGW6pDeICAkA:9
	a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=D7kp9QTXx5nKPM2BmVaLNnyeC+/w3emqJrVULM0rPGw=;
	b=YF
	0ltgi3Dmrsf1YRfwakZ2HWVOM9B6YLgPTs5f8P2YUM/0GeNktNwUx6lQeFBVKkJT/IJnXsDnqiRT4
	HSwBNNAdyy17s8Sip7O+VgDlAcEQ6DwC/4VUJPdza6wgKwh8S2ae5m5Wl/2I3jzQNqO8BF9hrXAhF
	LVh3vDjplrsjII2fFooW+z12C31WSZGywVKw+IsMkVCfhRg3/j0FM17BfRDk4cDzY890q6uZ3AOEv
	M6m1VBJ9UdFrnrZfmxSO1hhC723TLM1BrmPw5G0sPkoOGl5P+NVq4uaLmZTM2aZGMnNsVumAPtofN
	IdnWXmTNmY45tcc6RfbYRxXygzb8ib3Q==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1iMYpE-0006WK-JD; Mon, 21 Oct 2019 15:38:24 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 15:38:17 +0100
Message-Id: <20191021143818.19678-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJLokTUcxQoxjLd7bGRHX47fb51AhU28NqL4NJ2azCRVMfpNsdtPF61Xo0kvr2NrK8GU4FGQkzfp038HnWwuqxDPwiX4lL3g8/vmeoxNnBhdTrNb208M
	dvBpSH7/sPma6cUzfXuSAQNiA7eO3a728he2OTUooJrSMtqSGHtc63x9
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] kernel-fitimage: Cope with non-standard kernel deploy subdirectory
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
X-List-Received-Date: Mon, 21 Oct 2019 14:45:57 -0000
Content-Transfer-Encoding: 8bit

kernel.bbclass installs non-standard kernels (where
KERNEL_PACKAGE_NAME is not "kernel") in a subdirectory of ${DEPLOYDIR}.
To achieve this kernel_do_deploy sets the deployDir shell variable to
${DEPLOYDIR} for the standard kernel or
${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR} for non-standard kernels.

kernel-fitimage.bbclass's kernel_do_deploy_append ought to do the same
and can do so by using the same shell variable.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel-fitimage.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 1bcb09c598..e53487ee23 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -500,27 +500,27 @@ kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		echo "Copying fit-image.its source file..."
-		install -m 0644 ${B}/fit-image.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_NAME}.its
-		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_LINK_NAME}
+		install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
+		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
 
 		echo "Copying linux.bin file..."
-		install -m 0644 ${B}/linux.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
+		install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
+		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its
-			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}
+			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 
 			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
-			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin
-			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}
+			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
+			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 		fi
 		if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 			# UBOOT_DTB_IMAGE is a realfile, but we can't use
 			# ${UBOOT_DTB_IMAGE} since it contains ${PV} which is aimed
 			# for u-boot, but we are in kernel env now.
-			install -m 0644 ${B}/u-boot-${MACHINE}*.dtb ${DEPLOYDIR}/
+			install -m 0644 ${B}/u-boot-${MACHINE}*.dtb "$deployDir/"
 		fi
 	fi
 }
-- 
2.20.1


