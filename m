Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBF6C4167E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.2614.1649302943469211601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 20:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yzNXjqsZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649302941; i=@fujitsu.com;
	bh=ifAe6CHiZl05EMW9HTfT0O+q7O3ZcFVb1nMAFZ9NSqQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yzNXjqsZo8pNxkVazTjAAqknjE+YekpkwyfMDFNMbZVmc9nvorwbEmGYx6VZDvctH
	 76XdVP3IxBoSH2XqqYlhpRRzO+dFkArV2ZAqZILbP/bKImdXbB8/3QI4wGA4cP6f1m
	 eaX5kdLLAdfzMql3LsX+W5Wf6cCisz1ze3oT8ao5y87W+ha/jhLPzLMcLkqKEUsELH
	 VDOvbInNuVEaYqCHDjNFuyZURsLSaXfaOLdG9Z8OCU7XOEU9sInFjymbsXP75IZxnl
	 tV4eMWOdXRaYLHynxvbPdjd1DbKV3EYiLyD+vEThGEzzBwYpKqqwgzBx5tGbB5ElzJ
	 DoQuSyK/nR0WQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSXdOrF+
  Swde7shZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ax6w/YCl4pVBxbeY65gfG4TBcjF4eQwGNG
  iQ93vrFAOOeZJBYeXsvWxcgJ5OxmlPg72xTEZhNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAUuJ1gUTWEFsFqD4tKvPwMbwCjhKdBy8BxaXEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo3VSUWZ6RkluYmaOrqG
  Bga6hoamusYWukaGRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuck6KXl1qyiREYlCnFald2
  MO5Z9VPvEKMkB5OSKO/iGL8kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8RdFAOcGi1PTUirTMH
  GCEwKQlOHiURHibQNK8xQWJucWZ6RCpU4y6HDu3XN7LLMSSl5+XKiXO+yoCqEgApCijNA9uBC
  xaLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5u0HuZInM68EbtMroCOYgI6oO+gLckRJIkJ
  KqoFpweU7odEPVQpqnnTuYrXKW3VMi+ES78lGljnd7M1ny9QUlk+oU56jmcr8Mlu58tWsq8fZ
  XY/+fNpvo9tTOy+mSPCLqAmHL9+rZ+daqmLNkxd0VrHfNW45suVuiuZN6R1Xnn+1nDbj41XXu
  RunPtKLu2S8W+nbu8vbVtfsL3tqWi54vf9lKoPMW5PdO/Ndd0XPmv0s/s619U9uxEuI9f8/1P
  fQU3tXR4Cvz0xDxbXc6fsrRfMdUqcs8V781+8x36JD1euL1SftKVkxle/1k49NnpN3Z+9O23J
  nIafotZ3rK3uYHx1JF1N2j7t2+1hr2SF+fR25/W3SkdHvgsUfRmaxvrNhb1Y2c90sce+J9tMm
  JZbijERDLeai4kQAj7NL+lEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1649302940!64011!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22537 invoked from network); 7 Apr 2022 03:42:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2022 03:42:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 233C5100461
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 04:42:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 16318100353
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 04:42:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Apr 2022 04:41:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysvinit: upgrade 3.01 -> 3.02
Date: Mon, 4 Apr 2022 18:38:36 +0800
Message-ID: <1649068716-1231-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164097

pidof-add-m-option.patch
refreshed for new version.

Add 0001-Fixed-compile-error-on-GNU-Hurd.patch
to fix compile error on GNU Hurd due to missing MAX_PATH
definition.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-Fixed-compile-error-on-GNU-Hurd.patch | 28 +++++++++++++++++++
 .../sysvinit/pidof-add-m-option.patch         | 10 +++----
 .../{sysvinit_3.01.bb => sysvinit_3.02.bb}    |  3 +-
 3 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
 rename meta/recipes-core/sysvinit/{sysvinit_3.01.bb => sysvinit_3.02.bb} (96%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch b/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
new file mode 100644
index 0000000000..d278a32ec7
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-Fixed-compile-error-on-GNU-Hurd.patch
@@ -0,0 +1,28 @@
+From d595594506e6fd2247f7984c276f822ea626434c Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 7 Apr 2022 11:57:19 +0900
+Subject: [PATCH] Fixed compile error on GNU Hurd
+
+Fixed compile error on GNU Hurd due to missing MAX_PATH definition.
+
+Upstream-Status: Backport [https://github.com/slicer69/sysvinit/commit/14d8d25269016b26965b428a855dd084cc88994d]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/bootlogd.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/bootlogd.h b/src/bootlogd.h
+index b47bc9d..ba17f0c 100644
+--- a/src/bootlogd.h
++++ b/src/bootlogd.h
+@@ -10,3 +10,6 @@
+ #define FALSE 0
+ #endif
+ 
++#ifndef PATH_MAX
++#define PATH_MAX 2048
++#endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 4386e6f832..8ef292ed12 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,4 @@
-From 96fb53ef2ccd2580cf0aa565ef1629cb05eae50a Mon Sep 17 00:00:00 2001
+From 0e441712d0e366a0384ff3fa879f5a2d2607c24f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 24 Jul 2013 17:07:22 +0800
 Subject: [PATCH] pidof: add -m option
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 65 insertions(+), 3 deletions(-)
 
 diff --git a/man/pidof.8 b/man/pidof.8
-index 84ed1e4..ac184da 100644
+index 6866cb3..a87d878 100644
 --- a/man/pidof.8
 +++ b/man/pidof.8
-@@ -25,6 +25,7 @@ pidof -- find the process ID of a running program.
+@@ -25,6 +25,7 @@ pidof - find the process ID of a running program
  .RB [ \-n ]
  .RB [ \-x ]
  .RB [ \-z ]
@@ -32,9 +32,9 @@ index 84ed1e4..ac184da 100644
  .RB [ \-o
  .IR omitpid[,omitpid...] ]
  .RB [ \-o
-@@ -79,6 +80,11 @@ is shown. The default separator is a space.
+@@ -77,6 +78,11 @@ is shown. The default separator is a space.
  Tells \fIpidof\fP to omit processes with that process id. The special
- pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
+ pid \fB%PPID\fP can be used to name the parent process of the \fBpidof\fP
  program, in other words the calling shell or shell script.
 +.IP -m
 +When used with -o, will also omit any processes that have the same
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.01.bb b/meta/recipes-core/sysvinit/sysvinit_3.02.bb
similarity index 96%
rename from meta/recipes-core/sysvinit/sysvinit_3.01.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.02.bb
index 844f5f0175..cfe9d0b597 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.01.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.02.bb
@@ -20,8 +20,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
+           file://0001-Fixed-compile-error-on-GNU-Hurd.patch \
            "
-SRC_URI[sha256sum] = "68b11a4772cdacce5fb65a4cbead324a2ce3999d138b4ff61dc2d59e57ef5793"
+SRC_URI[sha256sum] = "4ca03ffdbefb5a99a60b94a021693686c2b498a08ff8aa4e859821fa7c39a792"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.25.1


