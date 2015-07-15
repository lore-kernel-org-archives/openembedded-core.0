Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF1273BB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 23:57:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2015 16:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,484,1432623600"; d="scan'208";a="607040775"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.73])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2015 16:57:15 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 16:56:59 -0700
Message-Id: <1437004619-9341-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bootimg: remove previous FATIMG before creating a new one
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
X-List-Received-Date: Wed, 15 Jul 2015 23:57:17 -0000

Since version 3.0.0 of dosfstools, mkdosfs opens the to-be-filesystem
file with O_EXCL. Since the filesystem is also opened with O_CREAT,
the -C option of mkdosfs can only succeed if FATIMG does not exists.
Thus, delete any previous FATIMG file. The file can be safely deleted
as we are inside build_fat_img because we want to create an new
FATIMG.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/classes/bootimg.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 0a4546e..975973b 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -251,6 +251,12 @@ build_fat_img() {
 		FATSIZE="-F 32"
 	fi
 
+	# mkdosfs will fail if ${FATIMG} exists. Since we are creating an
+	# new image, it is safe to delete any previous image.
+	if [ -e ${FATIMG} ]; then
+		rm ${FATIMG}
+	fi
+
 	if [ -z "${HDDIMG_ID}" ]; then
 		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
 			${BLOCKS}
-- 
1.9.1


