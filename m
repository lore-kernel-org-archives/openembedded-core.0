Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D45C77B6C
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:54:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5878.1681365275094410933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dBs3LrDv;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id i8so4959104plt.10
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681365274; x=1683957274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sop0z7Jsw/6bBzokQbQSJvIlu5uV+Kr11/ib4t6Ga9k=;
        b=dBs3LrDvvYmm2+EZOMY3u/FpGu54SfuYQzO8fCOypdPqQkJVvyZnVdoxK8s1Aj6PXR
         D6aoFUJIZrgwdPUqKUJ7w0gLxJhkiTeos3DTkpObZ+znTMEMZipU9vm6SHxs2t+HT9Jf
         VlP32O5ZHB7ZQSauQLvwf9Jl9sTnHiyAIg5a0GAVIhqGSPbOUCSA7YnGG+11alVRlNam
         YfOXLYT0NAArZC8DY4vRYvtcw6qfWozYFC14XHJSK72NvZ+GZdpmt9xxpn3v2L2smD0g
         BIg/gh2srI0O7Ka/b9hQ6/YXfFxBI1/PyyBea4ngKheSvGc6VNKiehnZzZohlvEQfSCV
         Cl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681365274; x=1683957274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sop0z7Jsw/6bBzokQbQSJvIlu5uV+Kr11/ib4t6Ga9k=;
        b=Uyrg0phVZyLPyLtjamlOyAZhrh3L4LFJYbpssqWaLRGdHMY78DkLe+8LiP801Y3J06
         wL6IRW5RsIKasE327viE/qI7DBPapSxAZC4717VJAIZ3jXCn7J2GHZuxQt+xp+Fv3zKh
         fOkaHCJfDfCNJW2HsUdChrXTESEMKMQQkfjuIhro0BD8t+jqcSbw2szgDzo1W5wZUWVU
         vlHiRACkFhrU/popu1ivxcbRsOCXJRhJ/6kGWMw+RYUwR5iAGzj9E7zRLLEQfFPAxxbv
         ZGsFjeaKW4eu8m+FbCXkFo2ilZA41O3nZqZd/4UREPfENcG7+KmWukzPrCmXVIZ23pJ9
         puOA==
X-Gm-Message-State: AAQBX9dD0nAhz6IDb56O/UWN+lt4BaDAwtV6sBQ8Wif3lGl+ZiAW2R+c
	tXAHLicOWbj37AdPqbslX98jSbYlI5I=
X-Google-Smtp-Source: AKy350ZeQnWZTCWbt8IWc98yOIxG8Bg48TRXrIWRRqTemMrgLhztBQTPF04jq8y+squ5SM+xv9/0GA==
X-Received: by 2002:a17:903:110d:b0:19f:35df:5d60 with SMTP id n13-20020a170903110d00b0019f35df5d60mr1549714plh.22.1681365274267;
        Wed, 12 Apr 2023 22:54:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id on1-20020a17090b1d0100b00244b13111e6sm2410781pjb.38.2023.04.12.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 22:54:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] musl-locales: Add Canadian French (fr_CA) locale support
Date: Wed, 12 Apr 2023 22:54:31 -0700
Message-Id: <20230413055432.1977413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 05:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179957

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-locales_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index 92532237e0..6ffac4fade 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
 SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main"
 
 PV = "1.0+git${SRCPV}"
-SRCREV = "cac3dcdccd1d0c08d17f4919d862737d64b76f79"
+SRCREV = "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"
 
 S = "${WORKDIR}/git"
 
@@ -35,6 +35,7 @@ LICENSE:locale-base-en-gb = "MIT"
 LICENSE:locale-base-en-us = "MIT"
 LICENSE:locale-base-es-es = "MIT"
 LICENSE:locale-base-fi-fi = "MIT"
+LICENSE:locale-base-fr-ca = "MIT"
 LICENSE:locale-base-fr-fr = "MIT"
 LICENSE:locale-base-it-it = "MIT"
 LICENSE:locale-base-nb-no = "MIT"
@@ -52,6 +53,7 @@ PACKAGES =+ "locale-base-cs-cz \
              locale-base-en-us \
              locale-base-es-es \
              locale-base-fi-fi \
+             locale-base-fr-ca \
              locale-base-fr-fr \
              locale-base-it-it \
              locale-base-nb-no \
@@ -69,6 +71,7 @@ FILES:locale-base-en-gb += "${datadir}/i18n/locales/musl/en_GB.UTF-8"
 FILES:locale-base-en-us += "${datadir}/i18n/locales/musl/en_US.UTF-8"
 FILES:locale-base-es-es += "${datadir}/i18n/locales/musl/es_ES.UTF-8"
 FILES:locale-base-fi-fi += "${datadir}/i18n/locales/musl/fi_FI.UTF-8"
+FILES:locale-base-fr-ca += "${datadir}/i18n/locales/musl/fr_CA.UTF-8"
 FILES:locale-base-fr-fr += "${datadir}/i18n/locales/musl/fr_FR.UTF-8"
 FILES:locale-base-it-it += "${datadir}/i18n/locales/musl/it_IT.UTF-8"
 FILES:locale-base-nb-no += "${datadir}/i18n/locales/musl/nb_NO.UTF-8"
-- 
2.40.0


