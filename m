Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE9BC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 17:25:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.29273.1704475534221705223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 09:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzFtW8Ku;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d4ab4e65aeso5404665ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704475533; x=1705080333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WN6exiAQJO7NJx9ill6FQ1GO5uhfNMCx04FpBXt5UEM=;
        b=mzFtW8KuEamr5d/phWClP36oIWcZJyV5MXVO99Re2nR3OkuFkV34V0YAMooxUsVnK/
         Uh7s0BnhA5WPR7XgWXRfpMStmEiplKb+BY845AETtySQTpkCv9ct0+c8kySwFNfXY0SM
         +FsQ/JINkyV7gU5XwGXPgiHVgdMt6/kTOobURKZesZnSg6XvmiD2nWunIbl68+9ZNnd3
         bHJwSPfRJRslmglZFnh30I/tNlur+UdyQGwG7Aw9Cmg+TH+ljB5DE157RC7I/HsuGCxM
         fbamS/TGDf8GJVqT7sXcYtgY4xGq312XFP99ojc1A95KkhXAY6UQ8dQQuR5wFou3IvSp
         2S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704475533; x=1705080333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN6exiAQJO7NJx9ill6FQ1GO5uhfNMCx04FpBXt5UEM=;
        b=HTzvAI4vnUowZ0fo3UoYF7nWRhom7DlZTJc8TQOYwqBqCejPrTDWVUP9n1FMX8lQwo
         +92NQQ82hIbwav0NyK7+WqszbbVg/tUkiZG5FIQ1YJD2otN95iMq9FEFp9EZCJpQxtrt
         cMUbXu0cjfgsvS1duzREZpkGiAdSeUqqtd0awqMrFPH6bk2exNKz5arslexgtgQ9X6DM
         K/AR+Ax5ejZ8/3cW5TGKJygWfxbKtNgL6HwG/8kSEwBfGwtyup0IWcB9NG7w0mi3AZa6
         87vIalAfBpJLhTDcCvshdWgAsC3JWp2n0DGJHP5QSoChXe3THN+gA6fDNw8ozSUhQOyD
         Oz1w==
X-Gm-Message-State: AOJu0YwNrOHBRz1OCouvLUNrjUpGnUcmCmBtM0NxNWA01qA3YXspJFVY
	7X1oPvydsE5/aFdhfzfx3PIaOAB4xiA=
X-Google-Smtp-Source: AGHT+IGHp3/c0FMrJ00s+6XqqA4eNTG5mW9B3JNBzx1BtjVLBMQ+6Z0nnJWTxFBS1TfwS+gnt+tOjA==
X-Received: by 2002:a17:902:e9c5:b0:1d4:3cff:279e with SMTP id 5-20020a170902e9c500b001d43cff279emr2581647plk.32.1704475533145;
        Fri, 05 Jan 2024 09:25:33 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:1ef8:e4e3:e071:1cf1])
        by smtp.gmail.com with ESMTPSA id u9-20020a170903124900b001d06b63bb98sm1656395plh.71.2024.01.05.09.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 09:25:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-bcrypt: upgrade 4.1.1 -> 4.1.2
Date: Fri,  5 Jan 2024 09:24:46 -0800
Message-Id: <20240105172445.1437855-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 17:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193375

* Refresh -crates.inc

https://github.com/pyca/bcrypt/compare/4.1.1...4.1.2

https://github.com/pyca/bcrypt/?tab=readme-ov-file#changelog
https://github.com/pyca/bcrypt/?tab=readme-ov-file#412

* Publish both py37 and py39 wheels. This should resolve some errors
  relating to initializing a module multiple times per process.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on core-image-ptest-python3-bcrypt on qemux86-64

 .../python/python3-bcrypt-crates.inc                 | 12 ++++++------
 ...thon3-bcrypt_4.1.1.bb => python3-bcrypt_4.1.2.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.1.1.bb => python3-bcrypt_4.1.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index b99d753a877..5db6d1e96ef 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -20,10 +20,10 @@ SRC_URI += " \
     crate://crates.io/heck/0.4.1 \
     crate://crates.io/indoc/2.0.4 \
     crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.150 \
+    crate://crates.io/libc/0.2.151 \
     crate://crates.io/lock_api/0.4.11 \
     crate://crates.io/memoffset/0.9.0 \
-    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.9 \
     crate://crates.io/pbkdf2/0.12.2 \
@@ -39,7 +39,7 @@ SRC_URI += " \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/smallvec/1.11.2 \
     crate://crates.io/subtle/2.5.0 \
-    crate://crates.io/syn/2.0.39 \
+    crate://crates.io/syn/2.0.41 \
     crate://crates.io/target-lexicon/0.12.12 \
     crate://crates.io/typenum/1.17.0 \
     crate://crates.io/unicode-ident/1.0.12 \
@@ -75,10 +75,10 @@ SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f2
 SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
 SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
+SRC_URI[libc-0.2.151.sha256sum] = "302d7ab3130588088d277783b1e2d2e10c9e9e4a16dd9050e6ec93fb3e7048f4"
 SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
 SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
@@ -94,7 +94,7 @@ SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01b
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
 SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
-SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
+SRC_URI[syn-2.0.41.sha256sum] = "44c8b28c477cc3bf0e7966561e3460130e1255f7a1cf71931075f1c5e7a7e269"
 SRC_URI[target-lexicon-0.12.12.sha256sum] = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 30063c3410f..860f2914769 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "${PYTHON_PN}-cffi-native"
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "df37f5418d4f1cdcff845f60e747a015389fa4e63703c918330865e06ad80007"
+SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
-- 
2.34.1


