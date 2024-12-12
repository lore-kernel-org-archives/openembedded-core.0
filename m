Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BA9E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 21:34:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.2426.1734039282294267357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 13:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gGbxs1dT;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2164b1f05caso10932395ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 13:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734039281; x=1734644081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5Joz5RDuBJBPAQiLtFlPxrWAyWu8THQ6uAr/NC5kQE=;
        b=gGbxs1dT3nuDDWHWXDLwJRZerM/i0lm3Sh/JT9+kGVz+ql1P6247WXdc7LS2vgKQJu
         ueSKvsJ0J+1IzXgUCdVaEm8x4dO1eyycZeKD17c8NQfuRsZjNT2KSR+MiM0CedD7513r
         hcaavM5ZSOzSxScw0+iGjSkobpVqFDf4IGpzhn4hXJDwCC0BXflS4osK04GOt3+0rtHV
         MyGPZ/bJk5XqUgxMQLE2KWLK6ypA7p5MJtMliwpDr+x8Y8hQsoXVWhce51Af4TDO6+Xl
         ybepcyPq29yYw9/RtnMlKBfn2NfNb6s7z284ny6yAlcAPC59avguBeBD/I6O5eTrAMSG
         Yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734039281; x=1734644081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5Joz5RDuBJBPAQiLtFlPxrWAyWu8THQ6uAr/NC5kQE=;
        b=Mv0CxDnEbhR/8mggzREYhyqXwcTQ5EHZaB+FH6pCGJ2v0dbAxL2iueabZ//qAxNxrt
         TD+Rny8FZOW1AE5oOXEvOT1BtrjzvXSuqTL+ye9BRS0H5sRGlGcE1LbsM67ZlpL4t73t
         ui5IgE1A4q35ca1W4lRykzayT/08nsQMa2I8Ti4Ef1N9o6U2LIQ2/eJ8iOFbwaRwwY+B
         ttpP+ZdZE8yVVZd4x6djfTOjKiGTY1FEjSLZck8QvyFM5gBMLVRz+6ry1g9QvqNQEPHc
         /BNaDFG63SeL5v+qZFhPY/7qeIciy/s7LwRTYOF51+c9/lCJ87Pc1xZElEMrTHRmn+bv
         5RWA==
X-Gm-Message-State: AOJu0Yx9GYNlJ7DEIvm7+AvcXueJMHw1XO/QnMn+R3nnX1qEHWVN3NbQ
	hedarrYMFWh1InsCJYR5V1oIZYtlCoEkxYueSermiSXBAFEqM8FzyYGi/Q==
X-Gm-Gg: ASbGnctdHmAfmftLiUp0yIuve+l1mgNF6KbiE25XUsifjTH/mfWhDS47mEsFay2eHNO
	TrZOQAhbFXpXgj+EkCYy2mEKCobRR0qNEEBvabKh8cXrB7bHxf6zIXIYteETFffDpjG42TnOGap
	lMcUQUt8JlyFijIsFtMn7W6mEv0a5/Lg6E/MNAbK9Bj537PfyPKLc90wFTBHWQwiWQU6YwRIsEz
	6o029loVSb5GlKkq2YGHN+GvR5bi8cVU4J+Gq1j1cUX6X2gSv6vfM2tX6rHIr1BJUTeD2Ba/8gS
	Dpw=
X-Google-Smtp-Source: AGHT+IFMuIHguS8aIX2xquQPlvq/+18jbVpF5ajLE6HSjBT9HlftOsQf7kuevRVycGsPxVylBbCk3A==
X-Received: by 2002:a17:902:f687:b0:216:4dfe:3ebd with SMTP id d9443c01a7336-21892a5bc80mr2482495ad.50.1734039281463;
        Thu, 12 Dec 2024 13:34:41 -0800 (PST)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2165f86a041sm66434985ad.53.2024.12.12.13.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:34:40 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] libxkbcommon: remove locale dependecy
Date: Thu, 12 Dec 2024 18:34:29 -0300
Message-Id: <20241212213429.250224-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 21:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208667

From: Hiago De Franco <hiago.franco@toradex.com>

The error described does not occur in all cases where libxkbcommon is
used. As example, a Qt application that depends on libxkbcommon might
not require any locales to be installed.

Remove it from RDEPENDS, as libxkbcommon does not seen to have any hard
dependency on libx11-compose-data or libx11-locale. This change can help
save space in the rootfs.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
index 40cf616f0bd2..c832dceb09c3 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
@@ -31,10 +31,6 @@ python populate_packages:prepend () {
     do_split_packages(d, d.expand('${libdir}'), r'^(lib.*)\.so\.*', '%s', '%s library', extra_depends='', allow_links=True)
 }
 
-# Fix a following runtime error:
-# xkbcommon: ERROR: couldn't find a Compose file for locale "C"
-RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"
-
 BBCLASSEXTEND += "native"
 
 CVE_PRODUCT += "xkbcommon:libxkbcommon"
-- 
2.39.5


