Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B41ACD11DD
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7947.1711413465753686993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fj6xuUHd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413466; x=1742949466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SOTxkzg04KyluvF0JXars7z2OVb+3wHISrng3kb9HRo=;
  b=fj6xuUHdTSPaU5PTmlvj5ZB/dTLpnZOWrhUg1J2xkfD7uPfj9g6RNBo+
   Py3pRft3cr8tx4ThX1rd3ghcM5+hCGxi+z1wmx6f0sP0bBkjuoiYghahr
   KgwgczLM8ZtKG7M8TP/SoKkt13HhFejVV2mb61bMy0qkZaGCzgHxDRzOJ
   H+gmGtIv8mNqKz8OCsguSPe1uUukQ1cYI0FVbBY82ahugOhSLJZ+vmzNP
   AOoU+ptfTUlJVSZz2Ryg5J1N6jEnXj09XOl2iQlj4mpXBILotzFK3QNwC
   Z6CEPhTun8tfJmsYLcHb9MmuQCil4ivCV0ceqyefHmbuJDkn/4OA3Id5X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153607429"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153607429"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 418B1E0AA5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78139D52F3
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0057E20097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A02481A006D;
	Tue, 26 Mar 2024 08:37:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 34/34] wget: upgrade 1.21.4 -> 1.24.5
Date: Tue, 26 Mar 2024 08:34:52 +0800
Message-Id: <1711413292-3025-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--3.069800-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga14YeSlHZYFohxq
	dt22rdOgB4nXQQumWv1vKglGGSwJlME/2QXpIuHm1l+BjLM8lspd5/m3qrxFzI5V1ACIyZtn1Ie
	ckOrbKEyTsxSf4WC6F9eBVsqgQQZWZIYmUMMQjm9+IrMF/hh/2NhQO8CvZj/XtDgmvV2H8PlR7G
	A0OjF0li2NCpupBQ0yivFp0d/OglZtF6/n498MP/LeH1FBnhK0wTlc9CcHMZe+kux37vSFMWZ4I
	sTaK7XgL74HSlXXEsW1Yo1HZ6kAVpH0YXYnbGozFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzqDgn
	aYNdtikNzqw4HQGBV1l0UPq6ApTuNr8un0xShQ+t+x8h8Wa5ZY4KLDzOqD0/1kYE6gMOEIjXjiX
	iRN3kPVqhx0/7HDW5iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197523

From: Wang Mingyu <wangmy@fujitsu.com>

0002-improve-reproducibility.patch
refreshed for 1.24.5

Changelog:
============
** Fix how subdomain matches are checked for HSTS.
   Fixes a minor issue where cookies may be leaked to the wrong domain
** Wget will now also parse the srcset attribute in <source> HTML tags
** Support reading fetchmail style "user" and "passwd" fields from netrc
** In some cases, prevent the confusing "Cannot write to... (success)" error messages
** Support extremely fast download speeds (TB/s).
   Previously this would cause Wget to crash when printing the speed
** Improve portability on OpenBSD to run the test suite
** Ensure that CSS URLs are corectly quoted (Bug: 64082)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wget/wget/0002-improve-reproducibility.patch         | 9 +++------
 .../wget/{wget_1.21.4.bb => wget_1.24.5.bb}              | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.4.bb => wget_1.24.5.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 050fc2c7e1..5438bafdcb 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 7f1357529d23b356b45fbb0dd7388588162e4cb8 Mon Sep 17 00:00:00 2001
+From b86e57b68363d108fe77c6fd588a275d2696cabe Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 10 Jan 2018 14:43:20 +0800
 Subject: [PATCH] src/Makefile.am: improve reproducibility
@@ -44,10 +44,10 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 28c0be2..44084a3 100644
+index 18ec622..38d252d 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -87,9 +87,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
+@@ -108,9 +108,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
  	echo '#include "version.h"' >> $@
  	echo 'const char *version_string = "@VERSION@";' >> $@
  	echo 'const char *compilation_string = "'$(COMPILE)'";' \
@@ -61,6 +61,3 @@ index 28c0be2..44084a3 100644
  	    | $(ESCAPEQUOTE) >> $@
  
  css.c: $(srcdir)/css.l
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.24.5.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.21.4.bb
rename to meta/recipes-extended/wget/wget_1.24.5.bb
index 1d31b0116d..64e6ee80af 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.24.5.bb
@@ -2,6 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
+SRC_URI[sha256sum] = "fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
 
 require wget.inc
-- 
2.34.1


