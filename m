Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 452 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Oct 2019 14:46:03 UTC
Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF647F555
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 14:46:02 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id MYpHi1Ye1bMsOMYpJiYw1k; Mon, 21 Oct 2019 15:38:32 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=C5WXNjH+ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=XobE76Q3jBoA:10 a=-An2I_7KAAAA:8
	a=435tqQJKJGW6pDeICAkA:9 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description; bh=gF3nrjN8oxONQgGTI+fQxsUcYrAANUjSEjWYUEcfge4=;
	b=cGPD1
	QmgGtHOHd8eHemD/vkosnY7R8tR/oRVSsum20Nho2UQoGsg42orIprfBmIBnqqXwYmMkHB5VQV5qk
	lEJkbBf9HRPhg9ou4rbfQYCdJG8srBu1ZcD15nYM/bvDn1ToPtV2XpogcMvXKqVsXDpe4OgcDI7nL
	D59tNayMPOdpNrrhDjqfrZpGANwLrqpNdL9dqQT9l3H88YuUT5rQEBKYQ0Jy4GHuZkYAtBviHid5D
	mkSqIvxjwJRv1CLgUyA3rx+ZSUphGV3reBfAVejwoAGFW8kzKrmp/Y4DV3X1RqNhONyY4PRv2HBYE
	kCVCA6YdB6eWuJvK4RzTqIONI+skw==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1iMYpG-0006Wr-C5; Mon, 21 Oct 2019 15:38:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 15:38:18 +0100
Message-Id: <20191021143818.19678-2-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021143818.19678-1-mac@mcrowe.com>
References: <20191021143818.19678-1-mac@mcrowe.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAscPXxpfwzVx1NSu8ev45H8hooxuG76RaMM24N7+tj9gJJKV8pGk/tlK6fAWdboCnoox5GI6/X/RaPSTVTLNjGlZD+6++Y2RgkpE2JY+Wg3QvCH69uE
	dJJh/0mJFmPSTw5fKFcusJNQIeKisT0JCIhUOEl8EcKAvs5GAlIo5Y/E
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] kernel-devicetree: Cope with non-standard kernel deploy subdirectory
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
X-List-Received-Date: Mon, 21 Oct 2019 14:46:03 -0000
Content-Transfer-Encoding: 8bit

kernel.bbclass installs non-standard kernels (where
KERNEL_PACKAGE_NAME is not "kernel") in a subdirectory of ${DEPLOYDIR}.
To achieve this kernel_do_deploy sets the deployDir shell variable to
${DEPLOYDIR} for the standard kernel or
${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR} for non-standard kernels.

kernel-devicetree.bbclass's do_deploy_append ought to do the same
and can do so by using the same shell variable.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/kernel-devicetree.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 8a81c850fd..522c46575d 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -71,23 +71,23 @@ do_deploy_append() {
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
-		install -d ${DEPLOYDIR}
-		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+		install -d $deployDir
+		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name.$dtb_ext
+		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${D}/${KERNEL_IMAGEDEST}/$type \
-					${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
-					> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+					$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
+					> $deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
 				ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-					${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+					$deployDir/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
-						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
-						>  ${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+						$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
+						>  $deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
 					ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-						${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+						$deployDir/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
 				fi
 			fi
 		done
-- 
2.20.1


