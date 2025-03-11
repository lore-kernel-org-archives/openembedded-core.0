Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B4AC28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:37 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.3396.1741678591514790424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 00:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YU6kOByO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741678592; x=1773214592;
  h=from:to:cc:subject:date:message-id;
  bh=A7GuF3e5hJjZWu2Jz6d7pNLt0OKT1kNcsU10VHpswA8=;
  b=YU6kOByO1rJzSTdBPrUAJ7oW4+klT67WDpatukYlE8imd+eCRShT0XoN
   2LSjOHbJpY4tCRm+x3K6MmdBOfAnWkhGKo654HE2vF1qWEiVURIdOwP7E
   RkUCet3tmBvTbMALuVT1LkV6W9nm63e/u3sYIuGpLmcDCwjMPdZsyo7DU
   1RIAt4wyyjKZuLWbpy6SOInPfkzz1+Q63gyptfCpCsd3SwwE1zuM+kPoI
   EUNO4J3APa6DD6QfYQY9QDsOLeZjhLEyzs+oYfo3cIKrnYZM10Ez81Lgm
   wQYA4XWP2gjxx1PW4eNjCUyQ1qo9dMzxxS8HPC7z37i+PvtF7okhpub+c
   Q==;
X-CSE-ConnectionGUID: X9LS+efLRbadADMyjn/Q/w==
X-CSE-MsgGUID: Tk7/UJjxR5WwfnTBnbwdSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="172130617"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="172130617"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 16:36:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 011F2D4C33
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 16:36:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BB109BDC92
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 16:36:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9BC11A0078;
	Tue, 11 Mar 2025 15:36:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v4] btrfs-tools: upgrade 6.12 -> 6.13
Date: Tue, 11 Mar 2025 15:36:18 +0800
Message-Id: <1741678578-8179-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212546

From: Wang Mingyu <wangmy@fujitsu.com>

Add patch fix the error when do_image_btrfs:
  ERROR: lzo support not compiled in

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...dd-break-to-case-BTRFS_COMPRESS_NONE.patch | 40 +++++++++++++++++++
 ...trfs-tools_6.12.bb => btrfs-tools_6.13.bb} |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
new file mode 100644
index 0000000000..750ba83074
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch
@@ -0,0 +1,40 @@
+From ae0743dea3498429fce144e75c8b5b6eeed6f490 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Tue, 11 Mar 2025 05:24:54 +0000
+Subject: [PATCH] mkfs: add break to case BTRFS_COMPRESS_NONE
+
+when compression null, always through error "lzo support not compiled in"
+
+This bug was imported by following commit:
+----------------------------------------------------
+commit c6d24a363daed6501d13d9125c560387e2d755ca
+Author: Mark Harmstone <maharmstone@fb.com>
+Date:   Thu Dec 12 20:36:55 2024 +0000
+
+     btrfs-progs: mkfs: add lzo to --compress option
+
+     Allow --compress to work with lzo.
+----------------------------------------------------
+
+Upstream-Status: Submitted [https://github.com/kdave/btrfs-progs/pull/967]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ mkfs/rootdir.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
+index 1927394..5f4cfb9 100644
+--- a/mkfs/rootdir.c
++++ b/mkfs/rootdir.c
+@@ -1654,6 +1654,7 @@ int btrfs_mkfs_fill_dir(struct btrfs_trans_handle *trans, const char *source_dir
+ 
+ 	switch (compression) {
+ 	case BTRFS_COMPRESS_NONE:
++                break;
+ 	case BTRFS_COMPRESS_LZO:
+ #if !COMPRESSION_LZO
+ 		error("lzo support not compiled in");
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
index 3c0bb81f75..d73d86ba8a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
@@ -17,8 +17,9 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0001-mkfs-add-break-to-case-BTRFS_COMPRESS_NONE.patch \
            "
-SRCREV = "85ca0a6d60c14eefda509970a26616ff16115612"
+SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.43.0


