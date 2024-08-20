Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC47C5472C
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.12714.1724136734165970101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aMLjhzIj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136735; x=1755672735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tF1RhYGfa4U8Jb5JMmm1cGGOTDqs2vIupcqNWnI1hV0=;
  b=aMLjhzIjrfLsZRUDz7trk111tHcKUfdGZg3AcJxpug62G6RtaQSSs9tV
   RYgLE9YrkbnzNRD+8snaucExI/c1bx5RXsE255qrX/ys9REJXUmrHFx/E
   rNj0ICx+Rr5JriZQviIPAQ/Ake0bYJ6syLf4sd3fmHI0mtvjwqaBXN0c/
   znRZB32XCla8/sq9lSxbV8pjeqTJOnelHmN99wIrmH+vwMz/NufD0vV0T
   0bslBGmoArcWu5vYWruo+PU/2gJu57IzjdwTfb8hJH4fugDWkAhSHXkUD
   onW/u0ImjIQkLjb1prhjwk0QqsRJoSwlSbrAGavNAbAG7KMA0D8vOeTdL
   Q==;
X-CSE-ConnectionGUID: pSlF6HJ0TXiSiVTnZJoP/w==
X-CSE-MsgGUID: Aq/EScs8SRWmrhll4c2SvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="170301712"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="170301712"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:12 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D9E0C213F
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 439DAD4C39
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1B5E20086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B09C1A0002;
	Tue, 20 Aug 2024 14:52:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/24] dnf: upgrade 4.21.0 -> 4.21.1
Date: Tue, 20 Aug 2024 14:51:24 +0800
Message-Id: <1724136703-20023-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10-0.150100-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yTo39wOA02LhpxAd6mi1Ga3LZWwGxK/FTrqQ
	ldU8NEzp5vwbTr8Qw9EJSf4nh0R0pw407JLUrwByutvHF25zoU8Hw3hIDAYijjVjvc93O9dktZD
	LKHqpwOTn+AbwJRh2K3nbv4FbkMngWkIi5GvRHEq5x7uAXGEprdXLiEcLf+DIwLkNMQzGl5AUfQ
	gp6GFqhgMK9XdTA/p44yf6Jl3/aORYBLr7Rpo7C3zmmMD/HXF+ELbqrOgWzycsTMNBTJAZWVT4t
	KeZleMYhElS9On82DvcFPFR1xoqQh8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFGeatx4ho9LNr+wE
	Ud/BeLThh5Nf7wSNPLIpF6dWsb4wpPmwesUw9BDj8zvYKSgWKgoYqrbQ8jVlraRVdW3SZrw/UyL
	nM5tQlex9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203528

From: Wang Mingyu <wangmy@fujitsu.com>

0005-Do-not-prepend-installroot-to-logdir.patch
refreshed for 4.21.1

Changelog:
==========
- doc: minor formatting and consistency fixes
- Allow local downloads to same downloaddir
- Fix "console" width on non real terminals (pipe)
- Adds checks for container and bootc hosts
- Update bootc hosts message to point to bootc --help
- tests: Use PGP keys without SHA-

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.21.0.bb => dnf_4.21.1.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.21.0.bb => dnf_4.21.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index 82f616a389..a85e6e3b03 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From 4e0f83e931e059ba93604617c462adcc90e5baab Mon Sep 17 00:00:00 2001
+From a8bf39b4ecdbdfd6e6934ca046239f683a9e08e1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index c14f8363..bfc07ab9 100644
+index 0eda2c8c..488a0662 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -953,7 +953,7 @@ class Cli(object):
+@@ -952,7 +952,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf_4.21.0.bb b/meta/recipes-devtools/dnf/dnf_4.21.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.21.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.21.1.bb
index 6800b5c716..09bdbd88a8 100644
--- a/meta/recipes-devtools/dnf/dnf_4.21.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.21.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "d29dfa0634235d7ad957c4746a749eb1e4a85a88"
+SRCREV = "9717c055b5ce94eba8c7144e6e4fea6ab6c97f6f"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


