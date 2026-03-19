Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E321088E5E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 01:27:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1722.1773883624194582905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 18:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZllvkVG8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773883624; x=1805419624;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ilHaCGwGn3Ic5ybU9n4Tt+djAQ/YxVlPOgYsyr1y9CE=;
  b=ZllvkVG8wcofE7te5wy5nxjAbfWqHRU9wl6ofnH4S79/gnQzrc8Dto+u
   n50f/UtkdVbGj3HyIkVLeb4cPmQXKlk3PbL5UAUBYKQ+MrZocAXa4JDSp
   iK5uV273TzF9Knn0drYCxHoSFy33mwT1rvd/pvAx+gXHvUwQ/A8SxWJlp
   l+uXqz0b1Tq7qK6NdLMlrDYWnXiFOpavQ2mgdJdi446t+oZrdPXKoXvdd
   bUH3Hhov/iwE8WY8L4rLECGOiA0stygoZC8fXMapK9LAcnRR5m23Y04MK
   v3BWkJIB4V8mM4AnExCK9O0cNxqdfeRjnsXRVugprFr4oEW1kQ8c/KoQG
   w==;
X-CSE-ConnectionGUID: BRm/ONZ1RvOPl/c2CzSOlQ==
X-CSE-MsgGUID: GHWfTj3QRJOL4l/Iy438Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233823207"
X-IronPort-AV: E=Sophos;i="6.23,128,1770562800"; 
   d="scan'208";a="233823207"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:27:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 03DA7C023F4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:18:20 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AC5A51401243
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:18:19 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 88F52404680
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:18:17 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libsolv: upgrade 0.7.35-> 0.7.36
Date: Thu, 19 Mar 2026 09:18:14 +0800
Message-ID: <20260319011815.13998-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233454

1.Changelog
  Version 0.7.36
  - selected bug fixes:
    * respect the "default" attribute in environment optionlist in
      the comps parser
    * support suse namespace deps in boolean dependencies
  - new features:
    * support for the Elbrus2000 (e2k) architecture
    * support language() suse namespace rewriting

2.Remove 0001-utils-Conside-musl-when-wrapping-qsort_r.patch
 as it is not compatible with 0.7.36

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...s-Conside-musl-when-wrapping-qsort_r.patch | 31 -------------------
 .../{libsolv_0.7.35.bb => libsolv_0.7.36.bb}  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.35.bb => libsolv_0.7.36.bb} (92%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
deleted file mode 100644
index d6e983dec8..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Oct 2021 22:28:45 -0700
-Subject: [PATCH] utils: Conside musl when wrapping qsort_r
-
-musl now has implemented qsort_r, the signature however matches glibc
-and not BSD, current check makes it such that it falls into BSD case
-when building for musl, which clearly is wrong, therefore instead of
-just checking for glibc check for linux to decide which qsort_r
-signature to use. This covers both glibc and musl
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util.c b/src/util.c
-index 72426e09..8f29bc5a 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -159,7 +159,7 @@ solv_setcloexec(int fd, int state)
- 
-    see also: http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html
-  */
--#if (defined(__GLIBC__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
-+#if (defined(__linux__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
- 
- void
- solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
similarity index 92%
rename from meta/recipes-extended/libsolv/libsolv_0.7.35.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index ef348de904..f22230599b 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
-           file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
            file://run-ptest \
 "
 
-SRCREV = "fb4b4340d46108cb365113e432642d6024886c7a"
+SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


