Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7AFD79751
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5011.1769846227498405900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wCTYiomA;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so22724205e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846226; x=1770451026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhJ4yY5BJPf0KFv5k+0mGLtSCNE4wpH75EyXvlNaoL8=;
        b=wCTYiomAsTX22LdAma0xE8HjMC2PsDmR+pPSyqC8aEREK5GVIjJMpP/OOvRySYtLZ/
         O6AqTR2qtSR8yUitRDIXCav9WLUdVBgHodcn/70PnnejWTr+avdnSqBpKKqMm1fnYVjO
         7swS7r+PgGIrtdMnexCrCC2b/dyk1HSgD0YS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846226; x=1770451026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XhJ4yY5BJPf0KFv5k+0mGLtSCNE4wpH75EyXvlNaoL8=;
        b=KABZnw5UakZThc9K44Rutg+trU23vq2JBzYKoXU9hz45ClxccBr/zy3vRO+q61KEUl
         RaVwyvEk/2fhwQdc6snGzay/ktlIaqJ6Rg1W+F8OBZZZAIYTT4Fn9DAkUpAE6UfZJQIG
         9oMPuQ0uSupFA/mJ6NvST69PH8okrTbJ+6E+XHpkPf0c3UJymybHQXlAuzbGTilax5lA
         P9xD5iAceE6WAJaAc9xOkeYntcKxxhmcLQQ0zTMsUlmsNisb8GCOi5CKpZHmzxmoJH8F
         p6S11kCjQ49OPgS+xxs69EubxXFQB707e3s4k13vxLhcgveDeXcD3/W3ddE+z50Wv88Q
         Zkxg==
X-Gm-Message-State: AOJu0Yz479P/gHlejrmBJ2pOgXuXeAqxZKdsm9xtb84+rOvARPMqG911
	phsV+px8uRSusslUKI728CONaP5ZQCL/blwRVW2neyNMakrWAmlhTgfXXoRmsdappSMdA3V8oEx
	XkpK0SZI=
X-Gm-Gg: AZuq6aI8ZOTlwH/DBXFubsquwirNaAAlgjvU4yMRLeM0BO/6smiwjZyJcoGoamH4cm0
	h1cQSOIDEWDwoLvCUSCkzL1auS7Wo+otJwpyGYJtWswSrgS5hyk4XQBjGyPgPd0Q3ERwGsuuxK6
	xEcjXx4C7u1jUgUp/xvbq9zeVafFhvVxTKWeBKN7XuD7n5Mq32oETFeAKrnu5Wt6XBgjnpUQeAw
	9sPT7R8vgPQHvWRrUfSH+PrSXZIajvWEYdoPFLC2IBVPZpt+c8ggGBPwJPXN8HIOyCD0yNsMhvQ
	qQlb4aSkK89Lp2nsk9mX/FKJHElPTln9dIeFVWQCi6vR7HL/tL1oHZ7QShHVaTmAHJqWq9Bh8Pm
	+u8s824c+4c+ySxNqNBzxgOW5RtX3Bg78bvyCTHSIeafZjLstSk6dFgDQDpHmm6W1jLmIOHSN9R
	NgVyHMIsh0R5cOrslPZ7aPQ4TliCJUmCynN+8wUFizV5VDPGn76kLu55rSZjvr2kiHLqRJ33FaS
	SX4O5ugQuk6B4Ou
X-Received: by 2002:a05:600c:4443:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-482db4a1030mr64423465e9.32.1769846225673;
        Fri, 30 Jan 2026 23:57:05 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 17/22] libpng: upgrade 1.6.53 -> 1.6.54
Date: Sat, 31 Jan 2026 08:56:28 +0100
Message-ID: <f05ec33d17952009ad6ac272d3aa2183074f1312.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230222

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2026-22695 and CVE-2026-22801.

License-Update: copyright years refreshed

Changelog:
Version 1.6.54 [January 12, 2026]
  Fixed CVE-2026-22695 (medium severity):
    Heap buffer over-read in `png_image_read_direct_scaled.
    (Reported and fixed by Petr Simecek.)
  Fixed CVE-2026-22801 (medium severity):
    Integer truncation causing heap buffer over-read in `png_image_write_*`.
  Implemented various improvements in oss-fuzz.
    (Contributed by Philippe Antoine.)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c18cb1d4dd0edf2e9c638c3c576cb803e1ff4c6)
[YC: Added changelog]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (94%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
similarity index 94%
rename from meta/recipes-multimedia/libpng/libpng_1.6.53.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.54.bb
index 956cd243b19..3f2b80a060f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
@@ -5,7 +5,7 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5516d77a3cf75f55a0d37254e3e65a20"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9dc350edbbbee660c7d9af79487168f2"
 DEPENDS = "zlib"
 
 LIBV = "16"
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
+SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

