Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.1664.1623695238884486226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e6nKaUNu;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id y15so11195316pfl.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FfbxIdx9MznLa1v1mHsMijGVZN5UmkhBroYqayxvfTg=;
        b=e6nKaUNup4N5xxxNczM4W7GAeEpm4ZwhELC9I30tR64gDBnJADtBomv6UTqjwKYGZk
         jzVrbNntdce0piYW+stB+hIEp1rCJutw8H8Uu2xzqnsO14k03P/C2Gr+DQ9T9jyCCzWR
         /Jaa1dpJ7mvoFc03oI0nQheW00VRcQqlypztVDkKMdYahKXtpyCKPFCF/IydI2aGc8b7
         ELaRS6OGh0Xx9cPRRQoGXLSZmknHSIGJKIoEb3F9+ucBa3ScmUD9HYvpprL72QvufRz0
         aJpVgWhMTR3XeEdfgWm+YJQKqOMwv5mNUdapMonnl+KQ+aIg1A3uFkBkom/ZoPK0z8GG
         NERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FfbxIdx9MznLa1v1mHsMijGVZN5UmkhBroYqayxvfTg=;
        b=jjTfGsL6D5aD4h3mqQCfETCT4q5S79jhkjHJvqUrC0ECi8wKQFOOYqxahA5WTMLOL2
         7rKR9eB6Zi198pkCRW3Iuv6jrinWBPypvCq2Yv6Db+hVmF6deXGb8voSR5OdmGOYUbAe
         RokwcSVuRyMjP036cX3Js6moFLYOyvvtfmJVVLjx15uGvMrF3Hua0KHT5psxz9xs3wPY
         a+VznpdmLyGXvOKWISD/Kjf3KzwwyfmNIM6dc3a8qaFmhCBeMtbtNKu/LEhzxrvST1LL
         Xy5ludAfxEdKHhrG8s2u2Ou11Szyy/F710SnA6XIXs1nJWw319WNSo/3MJNzIrnzkfaJ
         gk3g==
X-Gm-Message-State: AOAM531lp0GJnwwHZJ0QgI3roT2VTY1YSnaTYiy61GSOGmFnijNwUr3L
	76vluw/bZaB3ZWYUX+gm809Hpuj0pGkCfg==
X-Google-Smtp-Source: ABdhPJzBLazdEpQNfGV5w//4XejH3voNWbrSsm9xus766lZJBj61NK0gJTQRLBZysUMl3OHWU0E31w==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id y139-20020a6264910000b029028e8c906b16mr392262pfb.24.1623695237979;
        Mon, 14 Jun 2021 11:27:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id v9sm12907605pfn.22.2021.06.14.11.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 11:27:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Revert "libgcc-initial: Do not build fp128 to decimal ppc functions"
Date: Mon, 14 Jun 2021 11:27:15 -0700
Message-Id: <20210614182715.2214444-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is now fixed in gcc properly, and the patches are backported into
gcc11 branch which OE updated to recently.

https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=645bfc161987a12395869728b63ed01084d23c00
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=f1d012911bd103e9701ed378f32928a3cbcf028a

This reverts commit 7883b4c1384fe30066072f39e9a930be537bc3b4.
---
 meta/recipes-devtools/gcc/libgcc-initial.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index f7d8041226..06bf224f73 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -51,8 +51,6 @@ do_configure_prepend () {
 
 do_configure_append () {
 	sed -i -e 's#thread_header = .*#thread_header = gthr-single.h#' ${B}/${BPN}/Makefile
-	sed -i -e '/^libgcc_tm_defines = $/a fp128_dec_funcs =' ${B}/${BPN}/Makefile
-	sed -i -e '/^libgcc_tm_defines = $/a fp128_decstr_funcs =' ${B}/${BPN}/Makefile
 }
 
 do_install_append () {
-- 
2.32.0

