Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C669FC001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:38 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.821.1689374012344152903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cGvQNaCD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-55b66ca1c80so1447985a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374011; x=1691966011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oAtWenu4+JL1A0IMT9zDc7wIYYQxFJ++r4fRAopCao=;
        b=cGvQNaCDwEppkZtHfug/ox5d/yrl0JkhyswanvyUMNazVBJPu9dz3qUNDKbEVaH97L
         fgCcJgkzwdrK6r9STnNsFBRf09umM3OdRIFatpF48V7QY66kE1RZcyNLpZsSYvGhtjrC
         LF9ZbC1S5Lrid9jXEWznL6xReA1QiGBcCFjI+iT0shfKI4p7RXphFFBCjBjWuAVmjAn1
         z9Iq2qemAYcK+AULl8rr8F+u0/ab+YvZOi85/k7OxoiWDKujR3LKAu3H6SK6Qs/eaSzt
         Om+2eOreRpwrq3a/0yFVVnaAmxn6oOxTL7Hu/9VEk+H8yr+A9EYlkpFocv3Bn3epUdfc
         EMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374011; x=1691966011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oAtWenu4+JL1A0IMT9zDc7wIYYQxFJ++r4fRAopCao=;
        b=BjYTVO3LOAOGUYImWbF15GxoqYS9G4ZC5fDOvD+bk67K7nTpcwIUzYFTVZMujw9tjC
         DW5TyPWUqSb/Zlc2PDxWo9HiXSDclGuRjji0HxChB0pm1x1shay2Dowt4pKF3C6BiMcN
         Oe+5k/zzwD45UZ6bwmBxbpRysAaSnH9Zeji4hXL48vsWKNKtP5/wJK//97F6elF1Cz8k
         2ZYjJoIWXuuC3YdFCeqjugF2hj1vSDgTIrdQyw8yrwGuF4F+trJm/yF+/JH5IF9w3rRa
         MMpdSJQGCabHjJASB6lfJXbPm9PTg/VQlLCj+h74DyU/lsNogWc3CnFM7nx4uwkRFEw+
         NMTQ==
X-Gm-Message-State: ABy/qLaG0/Bvjkd4uuQ/hcqTqH9F2lEPhLETXISlOlw+9b7vdfPkbC8S
	U3RxLwJ+GatNyvo11C9cUjSWnZmeTKNxJzmbCHE=
X-Google-Smtp-Source: APBJJlGy+X7m92ynkm9jdkVvL1bEjF53m7uN+NLaTkTi34AmgjKhEsiYcyDYaU9SdEgTCuAq42KuVA==
X-Received: by 2002:a17:902:ecc1:b0:1bb:2093:efb1 with SMTP id a1-20020a170902ecc100b001bb2093efb1mr148849plh.27.1689374011376;
        Fri, 14 Jul 2023 15:33:31 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/26] libx11: upgrade 1.8.5 -> 1.8.6
Date: Fri, 14 Jul 2023 12:32:44 -1000
Message-Id: <5d6169ec81cc260fccb3b65082100e0ef6102046.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184292

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
InitExt.c: Add bounds checks for extension request, event, & error codes
Fixes CVE-2023-3138

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49b74259b196454d22fcca8b8ecc1c0d41487285)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libx11_1.8.5.bb => libx11_1.8.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.5.bb => libx11_1.8.6.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
index cf2e29471a..1cfa56b21e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561"
+SRC_URI[sha256sum] = "59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9"
 
 inherit gettext
 
-- 
2.34.1


