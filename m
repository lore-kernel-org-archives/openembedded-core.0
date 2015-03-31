Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1DFF73C71
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VLY52O013970 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:34:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gcbP-Ctii6mG
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:34:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VLXrDR013925
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:34:04 +0100
Message-ID: <1427837633.14020.365.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Mar 2015 22:33:53 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] image_types: Add missing ext4 support
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
X-List-Received-Date: Tue, 31 Mar 2015 21:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is particularly problematic since qemu images switched to ext4 by 
default and now cannot work properly with UIs like hob.

This patch adds in ext4 to the appropriate IMAGE* variables fixing this.

[YOCTO #7426]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 98a08bf..72c7337 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -146,6 +146,7 @@ IMAGE_TYPES = " \
     cramfs \
     ext2 ext2.gz ext2.bz2 ext2.lzma \
     ext3 ext3.gz \
+    ext4 ext4.gz \
     btrfs \
     iso \
     hddimg \
@@ -171,7 +172,7 @@ COMPRESS_DEPENDS_xz = "xz-native"
 COMPRESS_DEPENDS_lz4 = "lz4-native"
 COMPRESS_DEPENDS_sum = "mtd-utils-native"
 
-RUNNABLE_IMAGE_TYPES ?= "ext2 ext3"
+RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 
 DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 



