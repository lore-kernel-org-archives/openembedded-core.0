Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EF2C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 08:07:35 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web11.3279.1722845249420238406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 01:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OX8yGaJH;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=94046d601=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1722845250; x=1754381250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CbkYUiwJYdb5PO+DA0FLtqqfcXIeNhioL6UaY65FKV4=;
  b=OX8yGaJHRIEUJ+yo4dSknvw3y3UNSN3T3iS3+EGBrjE/SqDoFpCTEceZ
   XdyEY0UtRIdnBPp8Sr8CBshs/wf1I3k4MquI65XEUr6v+il09G0iVDGQk
   siVd5wo1CRby60l+2f7lrqHUIe1y28uaoNWgok7ie0MIdWjMizWYY9xX/
   Y=;
X-CSE-ConnectionGUID: YdjlCjirRpGyCzyeBYN3Tg==
X-CSE-MsgGUID: W6TLSlayTtaj5vJeUi2YUg==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Aug 2024 10:07:27 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw2.muc with ESMTP/TLS;
 05 Aug 2024 10:07:19 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb2.muc with ESMTP/TLS; 05 Aug 2024 10:07:20 +0200
Received: from localhost.localdomain (10.30.85.208) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Mon, 5 Aug 2024 10:07:19 +0200
X-CSE-ConnectionGUID: he67npluQqycMEciq3mWWQ==
X-CSE-MsgGUID: lNwo2Vd7T5Wm5FdueCWaQg==
X-CSE-ConnectionGUID: cPjdwsYYSM6KW8IfKw4cHw==
X-CSE-MsgGUID: 2qCWCuqgRPaCwlajyDW4EA==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH] curl: Reenable auth support for native and nativesdk
Date: Mon, 5 Aug 2024 10:04:39 +0200
Message-ID: <20240805080439.33580-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP03G.europe.bmw.corp (2a03:1e80:a15:58f::225b) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202986

148de08220c0ad390ec533e452cbaad7a9338204 adapted the recipe to
accomodate the newly introduced configure options for the various
authentication schemes supported by curl. However, support for these was
not added for the -native and -nativesdk variants of the recipe.

Fix this and introduce a PACKAGECONFIG variable for the flags common to
all recipe variants to avoid such regressions in the future.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/recipes-support/curl/curl_8.8.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.8.0.bb b/meta/recipes-support/curl/curl_8.8.0.bb
index 2b058e4e82d..533c2ac199b 100644
--- a/meta/recipes-support/curl/curl_8.8.0.bb
+++ b/meta/recipes-support/curl/curl_8.8.0.bb
@@ -25,9 +25,10 @@ inherit autotools pkgconfig binconfig multilib_header ptest
 # Entropy source for random PACKAGECONFIG option
 RANDOM ?= "/dev/urandom"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} aws basic-auth bearer-auth digest-auth negotiate-auth libidn openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
+COMMON_PACKAGECONFIG = "basic-auth bearer-auth digest-auth negotiate-auth openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG ??= "${COMMON_PACKAGECONFIG} ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} aws libidn"
+PACKAGECONFIG:class-native = "${COMMON_PACKAGECONFIG} ipv6"
+PACKAGECONFIG:class-nativesdk = "${COMMON_PACKAGECONFIG} ipv6"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
-- 
2.46.0


