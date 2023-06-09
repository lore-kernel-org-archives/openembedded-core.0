Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081C9C7EE45
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.142.1686329661318206255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0Ad90AeY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-662f0feafb2so1546736b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329660; x=1688921660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv9+NWMig/0sw9tAEh0HT7i6aVBSofgCTayHy0Kmx8s=;
        b=0Ad90AeYCy1CgSSYagUpCnLM0wCWuhbmSMy97GnYdfjmb0Yc4GqdEvFMwdCk9ySEUb
         pbD5+1KAgF8667dhE39conDGHUpL1EEbG7uM8T6/kGQbQnqatmz6egN/o9VQ5lWVivVy
         FeeCTrd32rI4R4Gq6tIL9wttkDnVpTAM5Ja7fnAkSm1hBd+4bPwikAZF8FMYvQxwz/K9
         v80l0muOXPKIWiwsKnhwIC0pJtovx/Itxa7/UCpnljwW5ty8ySd+gG39Nsg7aZNmBHgb
         4VpoY7nq0HvyxmLphAwIYgxC4q+OYR1ynwli+QLt/GY1jbDkuPaqkuFKuAHav0KQ60V3
         jnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329660; x=1688921660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv9+NWMig/0sw9tAEh0HT7i6aVBSofgCTayHy0Kmx8s=;
        b=WUubEyKJEqjF9snXa9eiF9374lEM6bOfQVvxjCcwbcgTGBINFHNrQMHebM233ThGgI
         D3CC0jPXO+M7WJMbW+EU57F3LpgInDeSnMF+xXCvT7gOPN9l9mfly7/N5Srs3/K+akxI
         brA7VQk/s/113iCDabBiJCXWXZjMwtTxBAUmFe9SnJwBbJtae/X0/SZCLBNK6a5oNfSt
         pGV3ByuLQpm5TqhZXIcaafABkv2fPwRpA15I9rUlFs6rXVeVMLyMZvTPCeRAgq20TMIs
         oKG5pHmo+yYs/glRDTdX9KKxa8FrqCEYcZsgfgg7aKxnF9+KBNc3QnersEvHuBdBH1qi
         6rUg==
X-Gm-Message-State: AC+VfDyRZweJghBUc3YN8Fv/Lvlx/E6KHpZC1zMXamygV2BKdBMwtzxA
	NAUMdov0xC2Z4sXFKREd0drRV7SlgbZtYsvBQqE=
X-Google-Smtp-Source: ACHHUZ532bvi1YGez5BxKZG6AwOm+29joICVrJgDdA5PdJ7seryoWbu4ROFPDZydNRx7PHxOcvsMbA==
X-Received: by 2002:a05:6a00:1803:b0:647:157b:cb61 with SMTP id y3-20020a056a00180300b00647157bcb61mr2659140pfa.7.1686329660326;
        Fri, 09 Jun 2023 09:54:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/30] binutils: package static libs from gprofng
Date: Fri,  9 Jun 2023 06:53:37 -1000
Message-Id: <4ed0f0cc0ecc290f1bbb8262afa62b45513e9cc6.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182576

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: binutils-2.40-r0 do_package: QA Issue: binutils: Files/directories were installed but not shipped in any package:
    /usr/lib/gprofng/libgp-collectorAPI.a
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  binutils: 1 installed and not shipped files. [installed-vs-shipped]

(From OE-Core rev: ab6ae4b715143364288ba164f8ab5c3cd7f486ae)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f72fd51e0da100e7ed90992225688bf43e2a69b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils_2.40.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 4ce1b4bec2..9fe4bf5ae3 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -67,6 +67,7 @@ FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
 FILES:${PN}-dev += "${libdir}/libgprofng.so ${libdir}/libsframe.so"
+FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.34.1


