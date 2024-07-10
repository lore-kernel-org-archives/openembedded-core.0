Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB504C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.10225.1720604654270418084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EXojw6vI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604654; x=1752140654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bjZyQbLtfBQonecN82ukCn4WkFJd1Tl9HBTLKsoFke0=;
  b=EXojw6vIGhvUetvcg08Zcy8gNNqJJSP2R0EnNPBIxfEM0m/lZY8kLl2H
   TGwEADwuFhbH3bI3A8f7T2afMPDwJsUZHtDrxo0dpgkouzOtt7JesyzVG
   7SXmqMuWMOrSOlE8PBdr8zu3SywU+HX/UHJwGSa6endCDK7kRuUCRQMWR
   kIry2AZB3Km8Uad0qjETFkX7y6jAmOVp87S0bd6+CaIPwVnyfPENtO2vc
   W51Koc6bsQ4y4zgSjPfBaxrX1kBVo8q4/He4OttLI8yaRv8EKBYM7fL3H
   tomz5fxwXTICRyDTyv1DpnVdyfcftpEs2iho6sw6FtQiRwA4StwicQlDb
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145396392"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145396392"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:11 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5203DC68E1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 985C7CF7FE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E9FF2005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D33D21A0002;
	Wed, 10 Jul 2024 17:44:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/30] btrfs-tools: upgrade 6.8.1 -> 6.9.2
Date: Wed, 10 Jul 2024 17:43:26 +0800
Message-Id: <1720604634-23406-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--11.301700-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yaoXHZz/dXlxkdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI21KUg0iYiIufcf/VR1nlQ7jWs2YGWPbxrVV4ZZmbE3YxMkOX0UoduuZjmdWmKHGLDlSG
	36bKvRczbyQpcPtsJ2cYoh/qEF/tVATh1ufKMwlpO5y1KmK5bJRSLgSFq3TnjtXl9IxEPXOrT0P
	pHDbMis3p43NEwWFkyHRcmVVOwSxsqvhmfWR8SIaqHmm/V4M/PvLBXbMsZJb7PWp1UK7zV9xZaD
	voiUT/Mg1jj+Zp5wflXhoA8IOVa1ST8BiMun0hMWCjDJRYeAZ3e22ctUL9zM754YCapH5tA1ssW
	FRf+KhrzflyoTkWhRYAy6p60ZV62fJ5/bZ6npdjiRhduhvElsqX8y2tPBLhQ71RtoD4KmWLSpIk
	DyMyKF+Y4sVeDnW1omRQoBBPd5SiH7Szq/aKVdw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201698

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
removed since it's included in 6.9.2

Changelog:
==========
* subvol list: fix accidental trimming of subvolume name
* check: revert checking file extent item 'ram_bytes'
* libbtrfsutil:
   * patchlevel version update 1.3.2
   * fix accidentally closing fd passed to subvolume iterator

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...y-to-specify-where-python-modules-ar.patch |  6 +-
 ...ename-of-inode_includes-from-e2fspro.patch | 64 -------------------
 ...fs-tools_6.8.1.bb => btrfs-tools_6.9.2.bb} |  3 +-
 3 files changed, 4 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.8.1.bb => btrfs-tools_6.9.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 4b1797b65f..ef431cd69a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 980f6edc269fa3ef8d4d4b9cd1aada2328131c19 Mon Sep 17 00:00:00 2001
+From 3b9b9b6ac033b44b3864abb1296fce1e19a2b622 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 374f59b9..ed083f6b 100644
+index 82dfb1b4..4968989a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -959,7 +959,7 @@ endif
+@@ -984,7 +984,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
deleted file mode 100644
index 6fefbb2bca..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From f9ba9752ba5fd72441bc2018b2453967e75460d4 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 24 Jun 2024 02:00:11 +0000
-Subject: [PATCH] convert: handle rename of inode_includes() from e2fsprogs
- 1.47.1
-
-Upstream-Status: Backport
-[https://kernel.googlesource.com/pub/scm/linux/kernel/git/kdave/btrfs-progs/+/bcb887a4de2c56426a7a7de8d440b6ad75579f10%5E%21/#F0]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- configure.ac          |  3 ++-
- convert/source-ext2.c | 11 +++++++++--
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 007d29b..816dd36 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -312,7 +312,8 @@ AS_IF([test "x$have_ext4_epoch_mask_define" = xno], [
-             AC_DEFINE([EXT4_EPOCH_BITS], [2],[for encode and decode tv_nsec in ext2 inode])
-             AC_DEFINE([EXT4_EPOCH_MASK], [((1U << EXT4_EPOCH_BITS) - 1)], [For encode and decode tv_nsec info in ext2 inode])
-             AC_DEFINE([EXT4_NSEC_MASK],  [(~0UL << EXT4_EPOCH_BITS)], [For encode and decode tv_nsec info in ext2 inode])
--            AC_DEFINE([inode_includes(size, field)],[m4_normalize[(size >= (sizeof(((struct ext2_inode_large *)0)->field) + offsetof(struct ext2_inode_large, field)))]],
-+            # Use name from 1.47.1, backward compatibility is handled in convert/source-ext2.c
-+            AC_DEFINE([ext2fs_inode_includes(size, field)],[m4_normalize[(size >= (sizeof(((struct ext2_inode_large *)0)->field) + offsetof(struct ext2_inode_large, field)))]],
-                 [For encode and decode tv_nsec info in ext2 inode])
-         ],
-         [AC_MSG_WARN([It seems that ext2_inode_large don't includes tv_nsec related info, probably old e2fsprogs, no 64bit time precision of converted images])],
-diff --git a/convert/source-ext2.c b/convert/source-ext2.c
-index 2186b25..bba81e4 100644
---- a/convert/source-ext2.c
-+++ b/convert/source-ext2.c
-@@ -727,10 +727,17 @@ static inline void ext4_decode_extra_time(__le32 * tv_sec, __le32 * tv_nsec,
-         *tv_nsec = (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_BITS;
- }
- 
-+/*
-+ * In e2fsprogs < 1.47.1 it's inode_includes, from >= on it's with ext2fs_ prefix.
-+ */
-+#ifndef ext2fs_inode_includes
-+#define ext2fs_inode_includes(size, field)	inode_includes(size, field)
-+#endif
-+
- #define EXT4_COPY_XTIME(xtime, dst, tv_sec, tv_nsec)					\
- do {											\
- 	tv_sec = src->i_ ## xtime ;							\
--	if (inode_includes(inode_size, i_ ## xtime ## _extra)) {			\
-+	if (ext2fs_inode_includes(inode_size, i_ ## xtime ## _extra)) {			\
- 		tv_sec = src->i_ ## xtime ;						\
- 		ext4_decode_extra_time(&tv_sec, &tv_nsec, src->i_ ## xtime ## _extra);	\
- 		btrfs_set_stack_timespec_sec(&dst->xtime , tv_sec);			\
-@@ -771,7 +778,7 @@ static int ext4_copy_inode_timespec_extra(struct btrfs_inode_item *dst,
- 	EXT4_COPY_XTIME(ctime, dst, tv_sec, tv_nsec);
- 
- 	tv_sec = src->i_crtime;
--	if (inode_includes(inode_size, i_crtime_extra)) {
-+	if (ext2fs_inode_includes(inode_size, i_crtime_extra)) {
- 		tv_sec = src->i_crtime;
- 		ext4_decode_extra_time(&tv_sec, &tv_nsec, src->i_crtime_extra);
- 		btrfs_set_stack_timespec_sec(&dst->otime, tv_sec);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
index d61d956a70..9f5586490d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
@@ -17,9 +17,8 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch \
            "
-SRCREV = "5d97c32d6f94cf6f473a5f82964e3edaeb1b146e"
+SRCREV = "b0e5ef4cf7c8b473119e0d487a26b96058e8f80d"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


