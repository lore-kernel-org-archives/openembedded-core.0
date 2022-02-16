Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68100C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 03:59:57 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.7982.1644983996523770937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 19:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rr+GMGC8;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id i21so1056038pfd.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 19:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Tf8S0p/PAnBoyJ5xs3Z1VHnSEr/eLXPo4B5Srm8d8A=;
        b=Rr+GMGC8Doibtd4sNAG70jJ83252kFPr/Pt7zevzDJ06mTN6NnwIUjo/jYvjg/MlUn
         TeTvf0zD5VMlz4kqQZdLjt/a2qRjkvk52bY98GLk1YFXfFroKzzer/t7R5XjGPHAtERx
         KXVHo9t7BsNghV4Vc1bqGQFk45/A546d9NBZXqozSkLerrCuSHHZy6CPRXAhTa2Tc94S
         IUVHu5IM/vWfvBgL1uOJbV/y66ZJJK2O5MiYoIPRLnknd34yiZeEejY952mfKak86p3H
         2DaDpw0EJqUNIeyXZAvake+faCj3uivglFtKYHHNGtaHGrrgKAP3pwqwWtXhpjXBE1iz
         llpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Tf8S0p/PAnBoyJ5xs3Z1VHnSEr/eLXPo4B5Srm8d8A=;
        b=cysIoH4ay38YlwfJFUOqEocG30N/385dvI2bC0mAt5U+QMi4Yyzy+oe3pGroNHCwNj
         KsXCvfxWY91JAZgvwqUGcwuSRvtuWq2h+vNjfMs2qEFV3d1Ve69wZl83KLAcOsEluw+z
         YHCEWnSwFpeb36HEjr+1bjIjKdifR2oYviv8Y0LxCtcoh1+rSqQ9jCcCTq6WRyiXOaLc
         4XXkkav9v975NVl2dWWwD86RhzGHg5JgtLX++QJSLCHdiztdn1gmAVkUN96DtODtJNOB
         bJ6mzUkYUkLwliPoAfP6hL9dq81loCsmiLKpZNuH7b7sLdlXJkEPscXq+iH/JinBj4KX
         SPNA==
X-Gm-Message-State: AOAM532o79a6NvanYeA6bgQko0aublqWVcxHc4ihQJfoGvrCCo0bngYs
	cEI+qPU/fMChnyyo/KwS3wctreM13GOhOg==
X-Google-Smtp-Source: 
 ABdhPJwgg4iref7IR3pddWkER8BvihFxv2kViQRrl3wrkdfpOzjyD3M3qh/zSXHDAO8l3wIovRnP6A==
X-Received: by 2002:a62:6287:0:b0:4e0:cf48:e6ae with SMTP id
 w129-20020a626287000000b004e0cf48e6aemr814799pfb.30.1644983995492;
        Tue, 15 Feb 2022 19:59:55 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:c7f5:f830:27c:b9d6])
        by smtp.gmail.com with ESMTPSA id
 i17sm3921887pgv.8.2022.02.15.19.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 19:59:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for CVE-2021-4160
Date: Tue, 15 Feb 2022 19:59:01 -0800
Message-Id: <20220216035900.851949-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 03:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161766

Changes are only security and bug fixes.

https://www.openssl.org/news/cl111.txt
https://git.openssl.org/?p=openssl.git;a=log;h=refs/tags/OpenSSL_1_1_1m

CVE: CVE-2021-4160

https://nvd.nist.gov/vuln/detail/CVE-2021-4160

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
 - drop SRC_URI[md5sum] that devtool snuck in.

 .../openssl/{openssl_1.1.1l.bb => openssl_1.1.1m.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1m.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
index bf7cd6527ef..c6f8499d4f5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


