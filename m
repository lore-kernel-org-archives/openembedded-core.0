Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09277C43219
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:31:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.15926.1667453473844998999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g8mht0Dd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453471; i=@fujitsu.com;
	bh=B8x8CEgOg9RgdhXKNGvt7Tu+hmcjwQ9VTGQ2RFdHwnw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=g8mht0DdmUMfBkBJUQC5K7bsaP0agXEVLE+dNn+rkSmxCAW4wIWWdzjuZmgPhpUWn
	 oeu454ORu0cpPUybgmp2+ygBBSbLW5UVGMKJ3DMyWvOm2OG9kU7FttS0D33/cou3QJ
	 kBUOWrJDOrIEyPnepgKocJffbT6/53GmnmrW8HyXKVEAf0Ltj5Z+iUExDKi+uRjDXw
	 /dqHM3Z05+VlAuDyRL+7nx8yyryGMWcx2zclfXTZerUvVK6hOfsl2S/IsGnOTwu5vZ
	 75XBj48O2qHLnw7XMo69gK2y6+FZS3cK8TvRVcUuCOuLelzsg1S7DuZvlisunhyp/4
	 u3QbEJvssX45Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8OxWVc+KDn
  ZYOptGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPLq272gj/CFd/XPmRrYLwi2MXIxSEkcJ9R
  YtqxOawQziUmiR2L+9ggnN2MEv+PvWXpYuTkYBOQkrhx/z9QgoNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAtUT7shawchag+LOul6wgNq+Ak8Snn3fBaiQEFCSmPHzPDGJzCjhL/GyfBWYLAdWs3L
  GGBaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjWXFqUVlqka6hqV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPCmFLMX72B8sOyP3iFGSQ4mJVHeKzuTkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8
  GoFJicLCRalpqdWpGXmACMJJi3BwaMkwnvdDyjNW1yQmFucmQ6ROsVoz3H1ypW9zBxTZ//bz8
  yxHEzO/Np2gFmIJS8/L1VKnDcSZKoASFtGaR7cUFjkX2KUlRLmZWRgYBDiKUgtys0sQZV/xSj
  OwagkzLsVZDlPZl4J3O5XQGcxAZ21rToJ5KySRISUVANTkx4b36XFnNumbF0WeqeB/cv/LXe5
  IruuWZdu5LtQsut8W0J2od8XY98e/rLj27Jzzzh5xk3IiCt7fMLD/PSZ0OUZ/wvzWxc/N7mzY
  d+fgpmvNgtXsFeveV28YmvSc9XPpy/6/mOW3vpGeVX8gerY5J15eyMmGL6vvHU3MePu1qci3w
  RET34u++7v/+PpVc8zCjtaX6tHfBZZbO0c7b+LUavc0PCw2031fK9mzTDvmd9fbYiYeu3FW0f
  VH+fUPnvtX3Lv4+WM3EnLbixLXLVtisRRba8nqstDv7yYd/611rlny2/LtVT+ZlNctIdfT9jY
  WNdNdJ3EyrP/vk+K2/ly+rXjpUv+RUfuVO3x3zxHxF+JpTgj0VCLuag4EQAo/5M8dwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1667453471!2618!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30118 invoked from network); 3 Nov 2022 05:31:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:31:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 200497C
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 13C447B
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:31:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.41 -> 4.0.42
Date: Thu, 3 Nov 2022 13:30:46 +0800
Message-ID: <1667453448-28192-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
References: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172604

From: Wang Mingyu <wangmy@fujitsu.com>

disable-hardcoded-configs.patch
refreshed for new version.

Changelog:
==========
- Added postcmd attribute in drive description to allow to
  execute "device release" code automatically at end of
  command
- Code cleanup (unneeded functions, initializations, added
  comments to unobvious code, obsolete stuff in Makefile)
- signedness cleanup about directory entries

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.41.bb => mtools_4.0.42.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.41.bb => mtools_4.0.42.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 2d42fa531a..57be935487 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From c496cad7b7a84e599f521f289648373df9fad80f Mon Sep 17 00:00:00 2001
+From 2ef9b371a5cc44e730143e694d71665831fac216 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 8c5fa83..346048b 100644
+index 2f6a297..3181ed7 100644
 --- a/config.c
 +++ b/config.c
-@@ -843,14 +843,6 @@ void read_config(void)
+@@ -844,14 +844,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.41.bb b/meta/recipes-devtools/mtools/mtools_4.0.42.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.41.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.42.bb
index 29e7427a10..85d9e451c2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.41.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.42.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "2542152264fb3eff7ed70662abf4f4eef8133bc37d0b7a686c240df2b5f80a13"
+SRC_URI[sha256sum] = "64bfdfde4d82af6b22f3c1c72c3e231cbb618f4c2309cc46f54d16d5502ccf15"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1


