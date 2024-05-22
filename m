Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF98C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.5632.1716369310412529408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=slaqIacA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369310; x=1747905310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yrInMa8u0GwXJl7DmkPG4YeUHlB6rMkz5P2kW3vCFwM=;
  b=slaqIacA37By0BkhgFMTsrEk/5vqVDhOLCJaNXH3uF+YemJZ+IjodsWM
   fNyZufVyRV0KIB+Z7m8CQ9Jm+c4YSJSaCfqHw8QU7P61jRgS/2v9QhvwR
   vGaxoIQwHiobrXsDJbCsKMULxTNU2zFoktGwTGAP7X3YTHd7PEkvQX6Ca
   t0KnDtVZCzBAaVF/zsEJ/NWmYNOw2uY7bL5IGz9uNATSi5IRQg/DzIn7a
   yrZ1lkFRCQ8mRdZuZCFGQ6xnExvuJIkV0PU5n33E74cCZdO2LHHRJssOi
   3q7ZSOpTbRcFGmsb4g5jAHfeeFmTJqc6uUP1aNzbzV+SOAig6/9Od459f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159376718"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159376718"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C715BCD7E5
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E26F31B07
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A029820097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C1E41A000B;
	Wed, 22 May 2024 17:15:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/42] btrfs-tools: upgrade 6.8 -> 6.8.1
Date: Wed, 22 May 2024 17:14:11 +0800
Message-Id: <1716369289-22526-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--3.276400-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvTL2GRHAc9cZKy
	Pf1j7t43BEleHrOyiTdiabBZEvOqkibFpXq4ZRfVv5rsfD7H2pkxXH/dlhvLvy99T+uJIleRwov
	TjpKK9edcxuOgnUtRUNQeKSe3B8we/ayzaxBypN4gFhzkd+/gE2HWZvjZxlUHlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDazGfgakLdjaguwtqyXlE6HozDhGeQC9EirJt
	dE04QwiF9I3HgybRyEyh2C7EeKtCx8TzIzimOwPur1QVFMnSQrEQdG7H66TyHEqm8QYBtMOh8pI
	IoglfOYiHmU4hy3RCubY2a7CYvswQAbkJxVewehEhOGoljm7Jn7mkRuW+IRhtXWDG7XtxUDeXzS
	T21d5p46Ludyj0cYBgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* mkfs: fix writing on zoned device when block-group-tree is selected
* tune: fix writing on zoned device with option --convert-to-block-group-tree
* check:
   * more progress and error messages
   * unify handling of unknown command line options with other commands
* subvolume delete: remove options --delete-qgroup and --no-delete-qgroup
  (added in 6.6.3), qgroup deletion does not always work due to delayed
  background processing of subvolume or set value in
  sysfs:ggroup/drop_subtree_threshold
* other:
   * misc refactoring
   * error handling fixes reported by gcc -fanalyzer
   * documentation updates
   * new and updated tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.8.bb => btrfs-tools_6.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.8.bb => btrfs-tools_6.8.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
index 15cc7ac244..fac9f8f7ef 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "3793e987d2b4e878410da16f33d963043d137d48"
+SRCREV = "5d97c32d6f94cf6f473a5f82964e3edaeb1b146e"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


