Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB35AC388F3
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.7593.1649245630738259242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LaEV7zAP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245629; i=@fujitsu.com;
	bh=x8zci1Ob8MpTEe/2VbMU8Y/q0KG567U+UYzoNsb6X14=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LaEV7zAPiaqsflaItygti+c4r95CUeZwCKYLp/ANm+MnXu68CBfXni1kL6Py5fOHm
	 yl5dytGaPyKqGbvZ+ic+kGMBVsi2W/Zu8LyDN9SibALGeLGXzMHLurA1vObRt5Q+b5
	 ENGI7+PgIgau2wAZbAPhyL6gkNfM0CkWTgBZo40aldIUe6AbcfUnjcmNxxXcpqb+mL
	 7V4ZAr/V/dxz8004GcW/y514VZwN7EKs+h1VwKFOn5e76IwMBHg+x7FFMfGMys9Z78
	 WbHdzIG+Y1A6WaTj37tn4OQHM0TAjjKqy1vLX33xi21E2vJnB5+/QYBDu8de0fS54J
	 hvfpd43yXG1uw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSXdPrW+
  SwYnDchZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBd/ZK47ens/awNjP3sXIxSEk8JhR
  YufMfmYI5zyTxIuZc4EynEDObkaJ/p+xIDabgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdA
  1YuLGAtsX3GBWYQmwUofrxlMguIzSvgJHF40QkmEFtCQEFiysP3zCBjOAWcJf50JkFscpLY3f
  CXDaJcUOLkzCcsEOMlJA6+eMEM0aooMftyMwuEXSExa1Yb1Eg1iavnNjFPYBSchaR9FpL2BYx
  Mqxitkooy0zNKchMzc3QNDQx0DQ1NdYGkqYleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZgAKcUM8zawTir76feIUZJDiYlUd795b5JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4t1QB5QSLUtNTK9Iyc4DRBJOW4OBREuHVqgFK8xYXJOYWZ6ZDpE4x6nKsbTiwl1mIJS8/L1
  VKnDcTpEgApCijNA9uBCyyLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5vUCmcKTmVcCt+k
  V0BFMQEe8O+MJckRJIkJKqoGp/4SxVQZzoFRZSrEpw90317j2fmA/YtNkvlspmzs+gUX585O8
  Os3CBTuezTocUBAjsdi2boHPbPVbQqZuyzz3iRsZ6teuVmEpmTwhqJuxbrYeY+Pi73u/nuVnf
  XjvHt8hO+nj51nuvXrG0qT884+YTrhkvGcjh9aHOaqf/33WNHt8ukjkVsWyeTz8Lzx35c79kX
  /l06lPkqsNs+KeOyxlDu/urza0EFZ3WeJqsT67dq3Bo7vlgUEy66ovZ+p3T8p7svPrYUHxx5c
  6u+fXP/I6Ua8csipO5bf2yYVZoinmq+Xc1a2/PlNqSDhosv2yR/a5L/YFR/Iltqq+VE2oVTQO
  s927+WqeFPftcwzesUosxRmJhlrMRcWJAPd2tclnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1649245628!220296!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1975 invoked from network); 6 Apr 2022 11:47:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:47:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 118F5100460
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:47:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 05514100353
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:47:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:46:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libx11: upgrade 1.7.3.1 -> 1.7.5
Date: Mon, 4 Apr 2022 02:43:11 +0800
Message-ID: <1649011392-28818-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164068

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.7.3.1.bb => libx11_1.7.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.3.1.bb => libx11_1.7.5.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
index 0c3abcd896..2a6f66957c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.5.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
+SRC_URI[sha256sum] = "5a1847e2e2c248e1a203a24a1338a5586d6f48472eac58f6f08539110a965151"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.25.1


