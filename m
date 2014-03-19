Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52B5C621BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:18:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2J9Ia2o026342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 02:18:36 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 02:18:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 17:23:53 +0800
Message-ID: <42d9ea96726ffe46b2c599aa9193b73f6810b846.1395220982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395220982.git.liezhi.yang@windriver.com>
References: <cover.1395220982.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image_types.bbclass: use 4096 instead of 8192 bytes-per-inode
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
X-List-Received-Date: Wed, 19 Mar 2014 09:18:42 -0000
Content-Type: text/plain

The image not correctly created if 'ptest-pkgs' is in IMAGE_FEATURES,
this is because there is no free inode left. We can use 4096 instead of
8192 bytes-per-inode to fix the problem, and most of the distributions
us 4096, such as Ubuntu, Suse, Fedora and CentOS.

There are another problems:
* There are error message when there is no free inode left if we run the
  mke2fs command manually, but they are not in log.do_rootfs.

* The image generation doesn't stop when error happens because mke2fs
  doesn't return failed for this case.

Will fix them in other threads.

[YOCTO #5957]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5864006..b693317 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -103,9 +103,9 @@ JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
 
 # Change these if you want default mkfs behavior (i.e. create minimal inode number)
-EXTRA_IMAGECMD_ext2 ?= "-i 8192"
-EXTRA_IMAGECMD_ext3 ?= "-i 8192"
-EXTRA_IMAGECMD_ext4 ?= "-i 8192"
+EXTRA_IMAGECMD_ext2 ?= "-i 4096"
+EXTRA_IMAGECMD_ext3 ?= "-i 4096"
+EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= ""
 EXTRA_IMAGECMD_elf ?= ""
 
-- 
1.8.3.1


