Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5062CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:01:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.34356.1697187673949798210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="135526701"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="135526701"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:01:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F8B3DDC6B
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:01:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 63D18D5626
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:01:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B37A120050184;
	Fri, 13 Oct 2023 18:01:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ltp: upgrade 20230516 -> 20230929
Date: Fri, 13 Oct 2023 17:00:54 +0800
Message-Id: <1697187654-4317-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--0.272100-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqMJxigKCCiSx+D
	Nq/mrYtSUZi428o+pFryCZGzF+DOCUukTd3HgdOwp6QZlc7BQG641iXfjivJzFGJGXffuLdvn0y
	b56lxfCtzPp5EZUj4M8Yoh/qEF/tVATh1ufKMwlpO5y1KmK5bJRSLgSFq3TnjN2WxgvaD/ztvKp
	xZPgVlF2leUUQDb5BuOIzB8VNpCtDymVDB8yZElJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOsg3bhHg26V3eVBXsi3Q1eZlWrpaxEGbASbFK/c3VnVVG/14pnieVFqPYsOg20S2qjMs/
	BmgmZQhsOb4P58j7NAPUdhX5UT10gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189041

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-New tests
-Increased coverage
-ebizzy benchmark counter increment races and overflows were fixed
-A few more testcases were converted to guarded buffers
 that is data passed by pointer to kernel are immediatelly
 following a PROT_NONE page and followed by canaries
 to catch off-by-one errors
-Tests that modprobe kernel modules are now skipped when secure boot is
 enabled on x86 and ppc64le
-ioprio tests now use IOPRIO_PRIO_NUM instead of hardcoded value
 to check for prio range
-35 testcases were converted to the new test library
-The usual amount of fixes and cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ltp/{ltp_20230516.bb => ltp_20230929.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/{ltp_20230516.bb => ltp_20230929.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230929.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20230516.bb
rename to meta/recipes-extended/ltp/ltp_20230929.bb
index 4d132b761a..5c43346883 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230929.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "3ebc2dfa85c2445bb68d8c0d66e33c4da1e1b3a7"
+SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.34.1


