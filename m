Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B562C282D9
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 07:19:41 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8209.1741159170606107454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 23:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gF0E1gjP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741159171; x=1772695171;
  h=from:to:cc:subject:date:message-id;
  bh=eIMpBZP5OrFEJ9DAi5gY2aFLlFyS6BIMJCpqCI8aN9o=;
  b=gF0E1gjPJP9K2KDyOjemfLTx/AtT0cN8EoMPCj0ft1TuBRhluu42CvfU
   aDkbUNOQrWSRxjcx9yFHcoiTNTnVgeV1zxeZS/Twr7hN5fQ4qn+GdSwoZ
   Mb6PCWOb+z+HMHaLZTgX8IwYgo4b1wrjcPSCr+7OKazd8/DT97rS3ZYUu
   2n54nRpg9jtnwNVEvkPnB/qimonD6Y+Vu+XNwkOdYUFk7H+btw/HsCuRV
   7fnBjDe2lT3DPhANFmwwAyQZFwr9Uqyk7W5W7xw1Sgxuky3waES3/4icz
   Lxn6hBJEEfjS1j58qawzLdxyqKKHPEOjmlhk4VHIxq7lJRSqlWjnAKeJy
   g==;
X-CSE-ConnectionGUID: d3R6VBPCSR+DL6HpP3i1Yg==
X-CSE-MsgGUID: Rr/8G99VQGibYkOp+Do0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="171477596"
X-IronPort-AV: E=Sophos;i="6.14,222,1736780400"; 
   d="scan'208";a="171477596"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 16:19:29 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1225C19553
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 16:19:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CA70810362
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 16:19:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5BDFE1A0078;
	Wed,  5 Mar 2025 15:19:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] btrfs-tools: upgrade 6.12 -> 6.13
Date: Wed,  5 Mar 2025 15:19:19 +0800
Message-Id: <1741159159-21356-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212298

From: Wang Mingyu <wangmy@fujitsu.com>

The upstream add lzo to --compress option, so add lzo to PACKAGECONFIG.

Changelog:
===========
* mkfs:
  * new option to enable compression
  * updated summary (subvolumes, compression)
  * completely remove option --leafsize, deprecated long ago
* btrfstune: add option to remove squota
* scrub:
  * start: new option --limit to set the bandwidth limit for the duration of the run
  * status: fix printing of Rate unit suffix (SI/IEC)
* qgroup clean-stale: check if quotas are enabled before starting
filesystem sync()
* print builtin features and options in --version output (mkfs,
convert, image, btrfstune)
* build:
  * Botan minimum version is now 3.x
  * target to build compile_commands.json (for LSP)
* other:
  * a bit more optimized crc32c code
  * sync some headers from kernel code
  * command help updates and fixes
  * build warning fixes
  * error message updates
  * cleanups and refactoring
  * updated tests
  * lots of documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.12.bb => btrfs-tools_6.13.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
index 3c0bb81f75..afc69a36f2 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.13.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "85ca0a6d60c14eefda509970a26616ff16115612"
+SRCREV = "26e4d9174c70aac0e53c3b5de55cf159f8d9397f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
@@ -26,6 +26,7 @@ PACKAGECONFIG ??= " \
     convert \
     python \
     crypto-builtin \
+    lzo \
 "
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, python3-sphinx-native python3-sphinx-rtd-theme-native"
 PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
-- 
2.43.0


