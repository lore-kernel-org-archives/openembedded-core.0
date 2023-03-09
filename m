Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC72C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.5693.1678402710729001273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C6XTc+St;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id p6so3730984plf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTBa7jYtbm2+xo0vFjcOh5csS/cbZtiVADtBra2ETEs=;
        b=C6XTc+StWnubXu28xlBWW8bQog/KgbfUI+qo8A5k1yhzCF250Zqlv43XL8k1abFFOM
         Gc2I9mDiHnxLMGGqcY9fsKEMf7WURM5TpVoDj+OXuHbhLr4Y0+ZhdvnnILHb+DrLk+Qd
         vES9nI8pUEEqMohu3tdnIRBfpy59UHtnz4bw1xxuI/e6brmcB/hzgirtyXX7+7bIaOS+
         bG/t04zqo8CJ0NIxW7mtTSUcmubMPfiVw42aAxvhWMFrqdRQaPgMEF60AeUFURxDVdFx
         ZjQ1E5jogt9HWCcUOLZ4bQAnHoz1Cnise/J+G5XH/pFOio6qfJRSTz69Wwv+jhGI3UVF
         Zshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTBa7jYtbm2+xo0vFjcOh5csS/cbZtiVADtBra2ETEs=;
        b=u1Yr6otszBy6CAjTzbBTWaOVZcVSRcj5OT5ckhXz8Js9/tUHKUDSrtsiql/g8pyPLY
         0Y93D7gqTIj8o+j+HMA15kPA/aIXGpZXyB3+06Cw0l1i8ebQecmEOtLWBhYIU3ZzOcau
         BV9q6e9OGONYYREYHNz3ZdwlqqbOuulcSCizU4TOhF3mLg/JK3jijp6oih/EqZZWSWSQ
         O3IRbI6fcFlr6/OisTo6nzdbwMvFRzfu+C5xAU+TMu0Y8mRgqKlJmLZw5iadZFxV/cYh
         SL4fibkVdTBP2iTJGzuLPdxlGbZN0OyiTk6EO4xhUnMq2HE1hmPsyCxKQleCDET4UJm8
         JObg==
X-Gm-Message-State: AO0yUKW11j3MY4cGoOdIYH2til+VVg3ZPf6s3SMgVC9J13tYqk6HyolQ
	B34+RB+Xva4rmHzQpSH7v7WUOZ+WmOOdONU3v2A=
X-Google-Smtp-Source: AK7set+Nyfr3Afyx/pJf4I9UG34xLzD7lZ+aq7UURoasyhzUnKeohFCvp8IW1SJ22+RvWwXnMbg/JA==
X-Received: by 2002:a05:6a20:440c:b0:ce:5c14:2838 with SMTP id ce12-20020a056a20440c00b000ce5c142838mr32633917pzb.54.1678402709619;
        Thu, 09 Mar 2023 14:58:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/27] iso-codes: upgrade 4.12.0 -> 4.13.0
Date: Thu,  9 Mar 2023 12:57:45 -1000
Message-Id: <903cfe3bbad1079ee89590a662350cb6edee4771.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178283

From: Wang Mingyu <wangmy@fujitsu.com>

Added
=========
- ISO 3166-1: Add missing common names for Laos, Iran, and Syria.
  Fixes #32

Changed
===========
- Translation updates for ISO 3166-1
  - Kazakh from Debian BTS. Closes: #1025423
  - Catalan from Debian BTS. Closes: #1026972
- Translation updates for ISO 3166-2
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Fixed
==========
- ISO 3166-3: Fix withdrawal dates of AN, CS and YU. Fixes #28

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f2c8b9c9a97ba5ec9c5da94da84ebe216650d6cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
index ea7c43cdae..f3ead5e8c1 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "5e4dddbd1f8902ab0252ccbb19b783cc0359505a"
+SRCREV = "ab6b01d5b56af7da9f0d2d1619a3cf84e43ed76a"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


