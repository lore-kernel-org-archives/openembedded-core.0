Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53276C25B7D
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.11789.1713948185480832297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lb0pVB4E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948186; x=1745484186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OsDuFzrYQcqj8VAqd/aLUulrzw5ZSTvsevgo/kjHmok=;
  b=Lb0pVB4ExhALCOIplmWABDnmh2Bg2KMIUHLGr4fUQQVYekcSYqRZRsvG
   uuWCMkJnYWhobJd3WLPqvQNl1SYV7pEZ0Piiz7fj1kKzcBeNKPqmXDm99
   H+7zCNammaDR7tVRFfvXFRtSzuIXTm7AfDiXkC3gmWoEISBH3zPg0p+0h
   MYUSTwGBP7eJv5/cc0HmxuYQBtUuFN1u0XkCtxNwzOIVbfM6WNOSfprUy
   iEEELx0KRTRLXW7sHp4/cFS8tG6ItKqp4s1iOhaxwLyPBMCPGbqtlmcSL
   M9r7H3UFEDhSVaF0vHU3uCNR8e0/1fTpMIMGmndku0v+C3xfmngInM8QW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156433045"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156433045"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A5DF6C2ABD
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3F62D7B8F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 697B5202CE12E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 144641A000A;
	Wed, 24 Apr 2024 16:43:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/38] ninja: upgrade 1.11.1 -> 1.12.0
Date: Wed, 24 Apr 2024 16:42:11 +0800
Message-Id: <1713948152-13501-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--1.854400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr9qZsX+XDJhBs+HFD7B2Y6Y93
	WUsgC0Xim9n8ths9wkR5I/z8imOZAHGiddM5dnwLLTHwnYOikQ1MkOX0UoduuTBwx50fHFEC0yO
	PBv1B9XaUdUf9QcMH0eaffHI8kAmikZmKVOLxy1I7Cl8sx4HBG8BDOqHwPghjPrhvTq+YBF/X7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUZd6ttoxCf9Op5PNIHXxwBOQ+w
	876l7eDaqWHIWTsS2TcLrOf5OhtxUeJ3PpLzACpA2ijKdoQHmcBXt4Uxsf3Rqy1WBt33xcN7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198662

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Critical path scheduler which orders the jobs by their runtime history
-This may break your build if you haven't specified your dependencies correctly.
-Resiliency against inputs changing during the build
-Reliable ETA and progress percentage in status
-Support for path lengths over 260 characters on Windoiws
-ARM binaries are now available for Windows and Linux, too
-Several bugfixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/ninja/{ninja_1.11.1.bb => ninja_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb => ninja_1.12.0.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
index 8e297ec4d4..ef7f80d0ae 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
+SRCREV = "65d0dfcbbea6b8ca7d8a3a0f673ecb522379e43c"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.34.1


