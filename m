Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B2DC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 06:19:17 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2570.1741673949446699027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 23:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=df2aywd9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741673949; x=1773209949;
  h=from:to:cc:subject:date:message-id;
  bh=S4PFa1ITPJvnAH8Al5LCTb/lwb8tdFeZAKWVyZjWeGw=;
  b=df2aywd9pFFnLgNUIDTcbCVDpX78A5iqQoMJZh5wQALPcowXQ1X7ym2z
   Iq2pBElIq/lb4XkQyTfRKOot6Y2RpRt0Q26XscXvoTN8naFPWSNac86LQ
   l5HMnQ4QRzVILr6b7DYW/I8ec9hge7UHZaL7VjwTXAX5IFqdU8ZtLnYGr
   ioCNVi2DFSGZdB+XdAn3/5s62EH38O5uT5p6WPQQIkN4EIh8Z51zbvudh
   VQ9lkw1E/YyyFBySXFkbye2Qw8djVo84uH8Snrr/oa7c5HuyhkDjFizV6
   k2dDKKiFkz2X6vRsMZ+SMZHS7Mde572HBE0BK0dQU3Eb/+RCZTe1zs4lD
   Q==;
X-CSE-ConnectionGUID: 3MReBZ14Sa+VKzUv1Sdy1Q==
X-CSE-MsgGUID: sIbA9Wp0Q2aBrPwjcC/Bjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192701375"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192701375"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 15:19:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92497D6EAD
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 15:19:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52631D3F38
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 15:19:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF9F41A0078;
	Tue, 11 Mar 2025 14:19:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] btrfs-tools: upgrade 6.12 -> 6.13
Date: Tue, 11 Mar 2025 14:18:56 +0800
Message-Id: <1741673936-7373-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212543

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
index 0000000000..3037d36644
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
+Upstream-Status: Summited [https://github.com/kdave/btrfs-progs/pull/967]
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


