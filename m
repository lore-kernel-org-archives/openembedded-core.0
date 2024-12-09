Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E41E77184
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.116737.1733788626235899667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nPLI11zx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788626; x=1765324626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=34akwgoboh3dd6dTjlMXByMHP2Oz5Ryis8MGP/sCEsY=;
  b=nPLI11zxQMTIPW2bBk8dYs7YjdFz3di9BqmV3oi7Dkmiz+W3Fd4/XQw9
   TlNGT51ug2z15DEZdDcy/VU/u25UIbiZ1i6XXRKMd54orxGq53aqlz6U/
   OSx57oxKyV6q1r06TTTagvx40Bury99fm/dWvc9z4QXO1vbj4H50XUfsx
   cho1HgX2t8a0KxriOAYRl6xc4RzGIG65iGJFlxiJ6lQnChnA8t140fGgs
   XcASdz01b2xcbkQOxpZzjkGmvti6iNx2Ar/Az2B+L24PjgI97+xkjgEcg
   w9YzeWwGBTHXbQMpGY98wEm7EPvl4CH7ImVPBCEsyW98bgyX/4mJOkXUp
   g==;
X-CSE-ConnectionGUID: /bPzQPbCR16IQYEekOG7fQ==
X-CSE-MsgGUID: OeT3R2KlRiuSKljiFyDWYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183153653"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183153653"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F8CD4F55
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A452ED5060
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A54820076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D63011A000B;
	Tue, 10 Dec 2024 07:57:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 03/20] btrfs-tools: upgrade 6.11 -> 6.12
Date: Tue, 10 Dec 2024 07:56:35 +0800
Message-Id: <1733788612-20933-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--4.021400-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrlwT0XposETXk6Qbi+9i6D74z
	fTpGjdbaQxTNQIR96f71R1PbV8KOojratjAp/g+VuLt50vtxBA47Cr2cnprobFy92pa0KjKScoy
	S8VEfbTluf5ur5byPpauVCdsHobg3SkIVw15u2jb1DLOXgVLtncWaYx0jCOsOUGf/0pAtLtK+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AguwtqyXlE6HxpjULkgRvhaPFj
	JEFr+olKE0Je8DR/D6No+PRbWqfRMZW5ai5WKlyU3082HCFmF9IvV7BmU3tn7MIJImVmRWIwtpC
	yy+nKkW6VV1hXdikaIkFJIMLC+6StbTiS9OrlAvWmCeCELOFE4EC+5DNJpQi/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208499

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
============
* subvolume delete: add new option to do recursive subvolume deletion (for
regular user delete only accessible subvolumes)
* mkfs:
  * new option --subvol to create subvolumes in given paths, read-write,
  read-only and default
  * add hard link detection support for --rootdir option
* fixes:
  * receive: message verbosity fixes
  * check: fix false positive report of missing checksum for extent holes
  * check: handle compressed extents when checking tree log
  * when asking Y/N user questions, flush the terminal so the question is
   displayed (e.g. btrfstune -S)
* other
  * code refactoring, error handling
  * python packaging fixes
  * documentation updates
  * new tests

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.11.bb => btrfs-tools_6.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.11.bb => btrfs-tools_6.12.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.11.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.11.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
index fa0599d28d..3c0bb81f75 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.11.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.12.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "8859114eaee39c117ff95f5b60b4e81fc22f96e7"
+SRCREV = "85ca0a6d60c14eefda509970a26616ff16115612"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


