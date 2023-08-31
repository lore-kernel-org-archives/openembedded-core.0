Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B670C83F1D
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:38:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8524.1693449527356967754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="130201628"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="130201628"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:38:43 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F887C53CA
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:38:41 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8974D948C
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:38:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E61F787FC3;
	Thu, 31 Aug 2023 11:38:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3: upgrade 3.11.4 -> 3.11.5
Date: Thu, 31 Aug 2023 10:38:13 +0800
Message-Id: <1693449493-28135-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--4.278800-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys5D+TQhrkTqOY8
	6qN+YNggfZg6P/m0sxb+Cu5vAbubSjuZPz8QQL7+S0+fRjdTGvuL5j5DDdPHPxGPZGESuCV03tl
	cknz+/vgAjPE9XBt9MXyUfyd7Tqx/rQvyT6gp/YygbAkpFzt7u74X/8yfdrbDn3FSfHC/GTtdxv
	G5XI6NmOArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtmpTkI0HK8zpbsVj
	+wJQ/DTgZ5aGCv7x/zcvZurf9s8J2sV28ESZOe8dXu122+iJtpV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNYnizCZ+cCQqn3E2p+JwUYkwXX0FJZdYd0XTj5fWZWCh6JcOgyGOFdp2Gbs
	vGcHQhc7Typ9lHTyrPEL1n4gWFkhorWzikvwhcoJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186946

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-gh-104432: Fix potential unaligned memory access on C APIs involving returned
 sequences of char * pointers within the grp and socket modules. These were
 revealed using a -fsaniziter=alignment build on ARM macOS.
-gh-77377: Ensure that multiprocessing synchronization objects created in a fork
 context are not sent to a different process created in a spawn context.
 This changes a segfault into an actionable RuntimeError in the parent process.
-gh-106092: Fix a segmentation fault caused by a use-after-free bug in frame_dealloc when the trashcan delays the deallocation of a PyFrameObject.
-gh-106719: No longer suppress arbitrary errors in the __annotations__ getter and setter in the type and module types.
-gh-106723: Propagate frozen_modules to multiprocessing spawned process interpreters.
-gh-105979: Fix crash in _imp.get_frozen_object() due to improper exception handling.
-gh-105840: Fix possible crashes when specializing function calls with too many __defaults__.
-gh-105588: Fix an issue that could result in crashes when compiling malformed ast nodes.
-gh-105375: Fix bugs in the builtins module where exceptions could end up being overwritten.
-gh-105375: Fix bug in the compiler where an exception could end up being overwritten.
-gh-105375: Improve error handling in PyUnicode_BuildEncodingMap() where an exception could end up being overwritten.
-gh-105235: Prevent out-of-bounds memory access during mmap.find() calls.
--gh-101006: Improve error handling when read marshal data.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3_3.11.4.bb => python3_3.11.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.11.4.bb => python3_3.11.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.4.bb
rename to meta/recipes-devtools/python/python3_3.11.5.bb
index 8fd1382caa..416b5f174d 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6"
+SRC_URI[sha256sum] = "85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


