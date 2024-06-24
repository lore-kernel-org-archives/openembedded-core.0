Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ACEC2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 08:27:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.135705.1719217663870802198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 01:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CVFJT9i3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719217664; x=1750753664;
  h=from:to:cc:subject:date:message-id;
  bh=cNM/cJm7ekkthZg/dsVr9SX31qCH/GK8pJTZ9ft+9Ws=;
  b=CVFJT9i3BzDElHvXgGc999LpkQZDq2gu40u/s5vPn13EWZkM85xHNG6k
   pLYb+Bjx6rlhI6Km62CqiA3XG7J8Q04Kdf8DzTXYEVMNx1ziPPY3mvH+d
   mHwgvlmq7cGpmyA19Wi0XtalUwNYDpzTJxTxT4zLZJqET17zakBCX2pWo
   KREx7dLgIgGlfJW5FtowMTODS5exmJ0Iofqke1dGfNZtnK8M6VEJVM4dJ
   UQlyORJwL+gcGYvPUQi16wadPtzKcqaXZiXl0ZQKpbjGiBZcaY1IisCS2
   sPLIiiDMdkiTTMXieOHbRmJax67Mv1//UPf4FuXBUqn+WFGqxlCUun9Wa
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="143596035"
X-IronPort-AV: E=Sophos;i="6.08,261,1712588400"; 
   d="scan'208";a="143596035"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 17:27:41 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A5D5D6486
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 17:27:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A1F23D4F41
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 17:27:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 207AE40FCC
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 17:27:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A07391A0002;
	Mon, 24 Jun 2024 16:27:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: handle rename of inode_includes() from e2fsprogs 1.47.1
Date: Mon, 24 Jun 2024 16:27:19 +0800
Message-Id: <1719217640-2921-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28476.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28476.006
X-TMASE-Result: 10--8.162300-10.000000
X-TMASE-MatchedRID: vWLMKRYJCze7xhJnFx1wJgrcxrzwsv5uegIHHX2L4YzfUZT83lbkELsV
	j+wJQ/DTKaYrswcBhT7Z5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrPxq3ixYTmGC4OzbiG14BOf38rWKQkiws5rzsINdopFUmvaomg0i4KNqVcrZytfYOsIpj
	Lek0l1pbxCOIWkboHE3qe4H1U4masp5Wc8n1vCF+ScxJMb2Uf4MrX+p1uNztCYYk3ZI64JBK/HZ
	bHbBC5xfAsSomQPqZb9KP9acIz8sx8TzIzimOwPC24oEZ6SpSkj80Za3RRg8NBC1pc28/0AtjkR
	08XUmOBrwbgouedsNzCp7kn5Y9Lj0X/jRT2yP4g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201068

From: Wang Mingyu <wangmy@fujitsu.com>

To fix the do_compile error,  use the new prefixed macro and add backward compatibility
that would still use inode_includes().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ename-of-inode_includes-from-e2fspro.patch | 64 +++++++++++++++++++
 .../btrfs-tools/btrfs-tools_6.8.1.bb          |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
new file mode 100644
index 0000000000..6fefbb2bca
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
@@ -0,0 +1,64 @@
+From f9ba9752ba5fd72441bc2018b2453967e75460d4 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Mon, 24 Jun 2024 02:00:11 +0000
+Subject: [PATCH] convert: handle rename of inode_includes() from e2fsprogs
+ 1.47.1
+
+Upstream-Status: Backport
+[https://kernel.googlesource.com/pub/scm/linux/kernel/git/kdave/btrfs-progs/+/bcb887a4de2c56426a7a7de8d440b6ad75579f10%5E%21/#F0]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ configure.ac          |  3 ++-
+ convert/source-ext2.c | 11 +++++++++--
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 007d29b..816dd36 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -312,7 +312,8 @@ AS_IF([test "x$have_ext4_epoch_mask_define" = xno], [
+             AC_DEFINE([EXT4_EPOCH_BITS], [2],[for encode and decode tv_nsec in ext2 inode])
+             AC_DEFINE([EXT4_EPOCH_MASK], [((1U << EXT4_EPOCH_BITS) - 1)], [For encode and decode tv_nsec info in ext2 inode])
+             AC_DEFINE([EXT4_NSEC_MASK],  [(~0UL << EXT4_EPOCH_BITS)], [For encode and decode tv_nsec info in ext2 inode])
+-            AC_DEFINE([inode_includes(size, field)],[m4_normalize[(size >= (sizeof(((struct ext2_inode_large *)0)->field) + offsetof(struct ext2_inode_large, field)))]],
++            # Use name from 1.47.1, backward compatibility is handled in convert/source-ext2.c
++            AC_DEFINE([ext2fs_inode_includes(size, field)],[m4_normalize[(size >= (sizeof(((struct ext2_inode_large *)0)->field) + offsetof(struct ext2_inode_large, field)))]],
+                 [For encode and decode tv_nsec info in ext2 inode])
+         ],
+         [AC_MSG_WARN([It seems that ext2_inode_large don't includes tv_nsec related info, probably old e2fsprogs, no 64bit time precision of converted images])],
+diff --git a/convert/source-ext2.c b/convert/source-ext2.c
+index 2186b25..bba81e4 100644
+--- a/convert/source-ext2.c
++++ b/convert/source-ext2.c
+@@ -727,10 +727,17 @@ static inline void ext4_decode_extra_time(__le32 * tv_sec, __le32 * tv_nsec,
+         *tv_nsec = (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_BITS;
+ }
+ 
++/*
++ * In e2fsprogs < 1.47.1 it's inode_includes, from >= on it's with ext2fs_ prefix.
++ */
++#ifndef ext2fs_inode_includes
++#define ext2fs_inode_includes(size, field)	inode_includes(size, field)
++#endif
++
+ #define EXT4_COPY_XTIME(xtime, dst, tv_sec, tv_nsec)					\
+ do {											\
+ 	tv_sec = src->i_ ## xtime ;							\
+-	if (inode_includes(inode_size, i_ ## xtime ## _extra)) {			\
++	if (ext2fs_inode_includes(inode_size, i_ ## xtime ## _extra)) {			\
+ 		tv_sec = src->i_ ## xtime ;						\
+ 		ext4_decode_extra_time(&tv_sec, &tv_nsec, src->i_ ## xtime ## _extra);	\
+ 		btrfs_set_stack_timespec_sec(&dst->xtime , tv_sec);			\
+@@ -771,7 +778,7 @@ static int ext4_copy_inode_timespec_extra(struct btrfs_inode_item *dst,
+ 	EXT4_COPY_XTIME(ctime, dst, tv_sec, tv_nsec);
+ 
+ 	tv_sec = src->i_crtime;
+-	if (inode_includes(inode_size, i_crtime_extra)) {
++	if (ext2fs_inode_includes(inode_size, i_crtime_extra)) {
+ 		tv_sec = src->i_crtime;
+ 		ext4_decode_extra_time(&tv_sec, &tv_nsec, src->i_crtime_extra);
+ 		btrfs_set_stack_timespec_sec(&dst->otime, tv_sec);
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
index fac9f8f7ef..d61d956a70 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
@@ -17,6 +17,7 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch \
            "
 SRCREV = "5d97c32d6f94cf6f473a5f82964e3edaeb1b146e"
 S = "${WORKDIR}/git"
-- 
2.34.1


