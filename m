Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB336FA97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:26:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q9QlUV011388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:26:47 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 02:26:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 05:26:45 -0400
Message-ID: <82d565c2843fdc8d864e5bd40227202ccbe64877.1395802146.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395802146.git.liezhi.yang@windriver.com>
References: <cover.1395802146.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Wed, 26 Mar 2014 09:26:47 -0000
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

(From OE-Core master rev: 09ab3a00598d06e3a1bf871811c2ac37359c74da)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f4938d1..09f3b47 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -210,9 +210,9 @@ JFFS2_ERASEBLOCK ?= "0x40000"
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
1.7.10.4


