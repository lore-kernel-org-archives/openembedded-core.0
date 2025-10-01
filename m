Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4791DCCD183
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.1063.1759352495321839545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=moFr6wQg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202510012101330670c6717d00020779-ifwg75@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202510012101330670c6717d00020779
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FiB92lGkSteAEjO/pXuNZjqU32g5S1uyMjZ6CtlU/NA=;
 b=moFr6wQgxI1P3dM7CuJ2TJVziohfKfpRApzp4Q40GOTFSA+YzzbqtSy4GhD0uAKz0xwzwm
 SbSy7RxMXlUQ6+Rj1MLMBBs1ht3UH7WspDexhWXthUcd1RoZ2xiu4EcaL8oh5kTb8fwxBPn7
 aJR1NTcY1L5D2GbcIPpjI/oHIP+zLBzJVhXwdlYehdGdge5+DAl+QqnN3UerS4g0FG4BnsxU
 16VVzMQyzpdC8NOjL0+6deim01W5HMbwxucbbV5kqATo1LIjs5yFcpABbwQn2PYxpkkO5wyx
 Vim90GeH/pFSZfxJ7H8DUMLAgT3B3ZYw9Hhqjth5gWBYS/qiFwbuYL3A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap][PATCH 6/6] expect: fix native build with GCC 15
Date: Wed,  1 Oct 2025 22:58:38 +0200
Message-ID: <20251001210111.1444441-7-adrian.freihofer@siemens.com>
In-Reply-To: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
References: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224324

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This does not work for native builds:
  CFLAGS += "-std=gnu17"
The line from native.bbclass gets priority:
  CFLAGS = "${BUILD_CFLAGS}"

From bitbake-getvar -r expect-native CFLAGS
  ...
  append ...poky/meta/recipes-devtools/expect/expect_5.45.4.bb:44
     "-std=gnu17"
  set ...poky/meta/classes-recipe/native.bbclass:44
     "${BUILD_CFLAGS}"
  ...

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index a89b48ef1c..f1d30d8217 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -41,7 +41,7 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-CFLAGS += "-std=gnu17"
+CFLAGS:append = " -std=gnu17"
 
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
-- 
2.51.0


