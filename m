Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 409FF774FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 09:47:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1O9lkF9010809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 01:47:47 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 01:47:46 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2017 01:47:45 -0800
Message-ID: <fa4fb5a91643087bc48597be473226be3d907709.1487929089.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1487929089.git.liezhi.yang@windriver.com>
References: <cover.1487929089.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/1] core-image-minimal-initramfs: set QB_DEFAULT_FSTYPE
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
X-List-Received-Date: Fri, 24 Feb 2017 09:47:47 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86"
$ bitbake core-image-minimal-initramfs
$ runqemu qemux86 nographic
[snip]
Exception: Failed to find rootfs: tmp/deploy/images/qemux86/core-image-minimal-initramfs-qemux86-20170224082533*.ext4 or tmp/deploy/images/qemux86/core-image-minimal-initramfs-qemux86*.ext4
[snip]

This is because core-image-minimal-initramfs doesn't generate ext4 image which
is the default value or QB_DEFAULT_FSTYPE, it only generates cpio.gz.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 5794a25..1ea3490 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -16,6 +16,8 @@ LICENSE = "MIT"
 IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
+QB_DEFAULT_FSTYPE = "cpio.gz"
+
 IMAGE_ROOTFS_SIZE = "8192"
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-- 
2.10.2


