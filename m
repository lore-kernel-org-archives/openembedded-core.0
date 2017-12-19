Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DDDBB7807D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 20:11:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 12:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="188186025"
Received: from swold-mobl2.jf.intel.com ([10.24.8.185])
	by fmsmga005.fm.intel.com with ESMTP; 19 Dec 2017 12:11:48 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, ross.burton@intel.com,
	liezhi.yang@windriver.com
Date: Tue, 19 Dec 2017 12:11:48 -0800
Message-Id: <20171219201148.19828-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 20:11:48 -0000

We have seen more failures, but have not been able to directly reproduce
it maybe svaing the rootfs and it contains some content that is tripping
up the e2fsprogs mkfs.ext4 populate_rootfs() function

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9188bed4197..6b4f39ed274 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -86,9 +86,14 @@ oe_mkext234fs () {
 	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
 	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
-	bbdebug 1 "Actual Partion size: `ls -s ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
+	bbdebug 1 "Actual Partion size: `ls -l ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
 	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
+	if [ $? -ne 0 ]; then
+		tmp_saved_rootfs=`mktemp -d -p /tmp saved_rootfs.XXXXX`
+		cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
+	fi
+
 	# Error codes 0-3 indicate successfull operation of fsck (no errors or errors corrected)
 	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
 }
-- 
2.13.6


