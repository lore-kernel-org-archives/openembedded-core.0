Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6996EC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 04:16:26 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.2062.1664511378320436164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 21:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jU2Rp5nr;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id r62so3143400pgr.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 21:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=voYj5gQrRadq1bTbfK6Gck/de1DaQZk4jYg64EV1PDY=;
        b=jU2Rp5nrx5uS6vjFHF50KzgXMoDx8+DlEguHJ+MeTY4oIQfDLzqgRe2pSmcm9zMlGM
         ZTViBvqRXQ1J2+NlgiQ243u0OLiiY5UZWQmiv1NpTFg5gXgeRQWtj5Zk/SjKmoR+iV35
         EDDPU9S11MTLrDmQYfVjawXphLgU8vJk/tNtcInTVGuBvCVtGaT+8GG2QKVSWN12Mug2
         DyYU3LrPmpaCd6gXAl32Vz/HWoGDfeJ93KR7D7gqqCFrMYsZN8cftYBsIvEys4sxplYI
         ODlF9Ty9+Equj00zbsCNTrDxWo+zF3Y1qCoCN2LBP4iM/sCmy7ht+yI0nAO2jJGHejdE
         sNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=voYj5gQrRadq1bTbfK6Gck/de1DaQZk4jYg64EV1PDY=;
        b=XhdHV7OuQzX/NfRJS9zeUvs1vlZNHXDqHDO1F5VeF/HxOKJTO1P89YNHZUV1zW27Iq
         xXshK7T1ThKH7VuYY6ctZElPxVxbxDA7VtPoWb8WTwF97MZweAnB8TF+MFzLVuk5ssPG
         cFqtPsCX1avc9rkaRLcH3PY2+sR+9k5BkkZ27rLJra2Ln8DAWSMS4Lw2C9Y+JTu1v4ks
         pNH5teEBH7vS91yYy3/ovaHlXq3IIe+bi1cmanPoN7z++KyYHXvjVYtP+NFhPyNSsL7E
         BJSSRnDgslKouaOuHVAvx212fo+sbfIzETUoRgqHCyLJiM2hOPl2v1mV5so3UUf9p8mD
         EafA==
X-Gm-Message-State: ACrzQf2LkghACvulV9kkrdkrZihKJ4Dp7Eu4xhZmmlOm7JvI/EhTMJzf
	DVOkvdBS37wta7ukl0tDrmBi1ef42vWwFQ==
X-Google-Smtp-Source: 
 AMsMyM580Qw3JkVnKEHRCDfMc0kdIHlpzKEgzkbc/KaatCB32PSFWneAQ61W1f8VAyGUGiVhoKYA1A==
X-Received: by 2002:a05:6a00:1ac6:b0:548:962b:4c50 with SMTP id
 f6-20020a056a001ac600b00548962b4c50mr6971434pfv.76.1664511377318;
        Thu, 29 Sep 2022 21:16:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090ad38f00b00209a12b3879sm547618pju.37.2022.09.29.21.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 21:16:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssl: Add missing perl module runtime dependencies for
 ptests
Date: Thu, 29 Sep 2022 21:16:14 -0700
Message-Id: <20220930041614.2704304-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 04:16:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171204

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.5.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
index 04aff04fab..119e58ed24 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
@@ -243,7 +243,16 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc = "perl"
-RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
+RDEPENDS:${PN}-ptest += "bash sed openssl-bin \
+                         perl perl-modules \
+                         perl-module-file-spec-functions \
+                         perl-module-findbin perl-module-harness perl-module-tap-base \
+                         perl-module-tap-object perl-module-tap-parser-sourcehandler-executable \
+                         perl-module-tap-formatter-file perl-module-tap-formatter-session \
+                         perl-module-tap-formatter-base perl-module-tap-parser \
+                         perl-module-tap-parser-scheduler perl-module-test-more \
+                         perl-module-pod-text perl-module-encode-encoding \
+                         "
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
-- 
2.37.3


