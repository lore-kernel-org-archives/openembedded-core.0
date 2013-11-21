Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7746DBE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EdKr013425
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:39 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:38 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:58 -0600
Message-ID: <1385018038-23380-13-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 12/12] image_types.bbclass: use mke2fs -d to create the ext2/3/4 image
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:39 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

We used populate-extfs.sh which invoked the debugfs to create the image,
now the mke2fs' option "-d root-directory" can do the same thing, and
which is a little faster, for example, the glibc_std:

$ time mkfs
$ time populate-extfs.sh /path/to/rootfs/ wrlinux-image-glibc-std-qemux86.ext4
real    1m3.724s
user    0m54.955s
sys     0m8.021s

$ time mkfs.ext4 -F -d /path/to/rootfs/ wrlinux-image-glibc-std-qemux86.ext4
real    0m46.256s
user    0m40.323s
sys     0m1.628s

17s are saved.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8c49169..d6c80a2 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -152,8 +152,7 @@ oe_mkext234fs () {
 
 	# Create a sparse image block
 	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=0 bs=1k
-	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
-	populate-extfs.sh ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
+	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype -d ${IMAGE_ROOTFS}
 }
 
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-- 
1.8.1.2.545.g2f19ada


