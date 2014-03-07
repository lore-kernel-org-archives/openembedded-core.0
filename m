Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A36C6F691
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 07:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s27705tO016504
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 23:00:05 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 23:00:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:34 -0500
Message-ID: <472b3f35379635d1cb8705b69292621f132cdea9.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] image_types.bbclass: use mke2fs -d to create the ext2/3/4 image
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
X-List-Received-Date: Fri, 07 Mar 2014 07:00:04 -0000
Content-Type: text/plain

We used populate-extfs.sh which invoked the debugfs to create the image,
now the mke2fs' option "-d root-directory" can do the same thing, and
which is more faster, for example, the core-imag-sato:

* In the past:
$ time mke2fs -t ext4 rootfs.ext4
real    0m0.249s
user    0m0.036s
sys     0m0.132s
$ time populate-extfs.sh /path/to/rootfs/ rootfs.ext4
real    0m29.355s
user    0m10.637s
sys     0m5.544s

* Now:
$ time mkfs.ext4 -F -d /path/to/rootfs/ rootfs.ext4
real    0m6.338s
user    0m3.824s
sys     0m1.356s

More than 25 seconds are saved.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 602c1f0..5864006 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -49,8 +49,7 @@ oe_mkext234fs () {
 
 	# Create a sparse image block
 	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=0 bs=1k
-	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
-	populate-extfs.sh ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
+	mkfs.$fstype -F $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype -d ${IMAGE_ROOTFS}
 }
 
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-- 
1.7.10.4


