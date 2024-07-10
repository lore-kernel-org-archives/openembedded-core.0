Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E515FC3DA4D
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10244.1720604657021339322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m0eVnCxX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604658; x=1752140658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PII1KnKj/+3vUicd068KMTHO9T3th9WizMUOzOIyY64=;
  b=m0eVnCxXNZCJBO+hxo82b3PzbKIMrDLvL0Du48YshYolgpFqKHpNOCcG
   Q+89jfEDBvvmKuaH0HmC/rug5fUhYZpdtq0N8LvVNhJIA74dCSBzOfQF3
   jFoUBcONuLQfkKVYCbDPr9gUsoFYlO6T7WwJpTWUkuhOQZ4mHiwaL4T3N
   ZauOk5XDEXXLmH9yrIJqXEF3g32Wd9IUeD0mrh2GsTv1IuEPPkY2hIeFc
   Hte+dSjdfkuq5f3OXKdzLiJCDb0NUMR1mgrftFDuImkYQKuZoEs9iQyjC
   fxHfGWuBUR2Fvu8r0Xfw5faERZ/rqPREGg0sDDXQb5I3Wbo41da2AljAW
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166585667"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166585667"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8845FD647A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C8BA1D8B6A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 658E82005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 165991A0002;
	Wed, 10 Jul 2024 17:44:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/30] dnf: upgrade 4.20.0 -> 4.21.0
Date: Wed, 10 Jul 2024 17:43:32 +0800
Message-Id: <1720604634-23406-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--9.606100-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga3k6Qbi+9i6D/U1
	0nHva68PPH9ecFb4bGerlQnbB6G4N3VsOt9k9zl+joyKzEmtrEdFRimkaZP3VxnzRGIUdtbdmLq
	BK5ktl0fu7KKAW/bb2jtuVglUWXzvPubnqD2XLwjy3h9RQZ4StBCE2NlBjIjcB/FMznsE8cO/BR
	68O365busIM/D0ygBYmXBLY6995k1+vBKZN3JunBwbN4ob6DCIXLILvyEBT85jyv+d0Z0OxX0mm
	lU2RvUrWTlnP7UAwom3P2Qi5OQGrq+/EguYor8cFEUknJ/kEl7dB/CxWTRRu25FeHtsUoHuXEyz
	7Wy1gvrRlrtG6R56L6Y7dSOYeUQLW/GPE2R8Ro5oBmTSwRxjXg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201703

From: Wang Mingyu <wangmy@fujitsu.com>

0005-Do-not-prepend-installroot-to-logdir.patch
refreshed for 4.21.0

Changelog:
===========
- Add detection for ostree-based systems and warn users about losing changes
- Fix: No traceback when Python interpreter is running with -P, allow -P in shebang lines
- man: Improve upgrade-minimal command docs (RHEL-6417)
- Limit queries to nevra forms when provided by command
- Update the man page entry for the countme option
- Drop collect file for ABRT

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.20.0.bb => dnf_4.21.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.20.0.bb => dnf_4.21.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index cfbda11f77..82f616a389 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
+From 4e0f83e931e059ba93604617c462adcc90e5baab Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index 1824bd00..4dcb1c1c 100644
+index c14f8363..bfc07ab9 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -944,7 +944,7 @@ class Cli(object):
+@@ -953,7 +953,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf_4.20.0.bb b/meta/recipes-devtools/dnf/dnf_4.21.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.20.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.21.0.bb
index 4757346cbf..66d15bca77 100644
--- a/meta/recipes-devtools/dnf/dnf_4.20.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.21.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
+SRCREV = "d29dfa0634235d7ad957c4746a749eb1e4a85a88"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


