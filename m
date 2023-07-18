Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D312DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 19:19:55 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.4629.1689707989178746214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 12:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=1RSHIpBw;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-768054797f7so484961385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689707987; x=1690312787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MnZ4CWn8LLfiiyJy0GOyyLjWiLdIygLw/phmsQeVflU=;
        b=1RSHIpBwoZCpDJr7CBMEi6Ue7TWlbKy7c9PtLOyuG9pB5Sbe6OToZyyH8OdkEUAW/5
         155sQhIutVuDBDYWm1HgFzkEnjiUbBvCfnmPk7VnG/YHHC98BZGTt6T5dw3VrmLhK76G
         cDsNUI6/7CfxC2gDtCAozUpySNBVDIp3QYdDaw9YMxWhGj56C0RE+rOaTJ4SBHJ/PxJF
         nnTu3pn4HpUTgLafvxN0mwZNTmNh7a5oFw2Sbpv9/fGC2KMlWG/sA1DDRU4pfuGBdvjg
         eXdUzDj8yMh9NBHSHsxW5t7m7UmRbpBAZpR4+jL5SoO4GiI/Dxp4p0brCT0cF1pz/UAl
         F6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689707987; x=1690312787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnZ4CWn8LLfiiyJy0GOyyLjWiLdIygLw/phmsQeVflU=;
        b=EMSKXHQQlF1Yl3sriJSNnR+x0oIknTwiunayFL71B5hpdV3DKgh1NF0BIiB8XsSwTl
         NTvnKF1BoM5EWIax1xF2uJZ/M3uaZtbhqr+A1JJU6fPDgCxpBDEWXh96ldIXK2lSOjT8
         JnMoBFClA5yfO7tFCgmUjs6tTxh1phBh3H+zCt3TLtxLZmAwIwvg/oAgdbhZHm4axDFz
         CikgIdmqCvH+k33iovwERjeNR381MzHV4qW1GxE68Z+e5v+trF6LclL6NymLoJ34egCF
         mAzUhjbZRhODQ9E/rqgAGjbrSV3An0ot1bUOTNJmyGhI8nTHRYmbZQM96fVsGttvOsq4
         03mA==
X-Gm-Message-State: ABy/qLb6qxp9axj1QUg0Go/4RVMYe/spL/3jzekLxX2DwxcrGlsCQsYO
	LUHmVzaEA/tzryWSh8SON+GOXXRQENRFrSb0GUs=
X-Google-Smtp-Source: APBJJlE4li5SteMh3j5eeaDGcru+3KpuO+7fSce4MVzckErEgAU+AiqQ1shMGLJ9JEeq3WZSJtev7w==
X-Received: by 2002:a05:620a:2012:b0:767:f1e8:d38c with SMTP id c18-20020a05620a201200b00767f1e8d38cmr635073qka.15.1689707987628;
        Tue, 18 Jul 2023 12:19:47 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id j16-20020a05620a147000b007677f66b160sm784621qkl.124.2023.07.18.12.19.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 12:19:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] icu: upgrade 72-1 -> 73-2
Date: Tue, 18 Jul 2023 15:19:46 -0400
Message-ID: <20230718191946.3060365-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 19:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184558

Changelog: https://github.com/unicode-org/icu/releases/tag/release-73-2

ICU moved to a common LICENSE file in the project root. The only actual
change was an update to the copyright year.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-support/icu/{icu_72-1.bb => icu_73-2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_72-1.bb => icu_73-2.bb} (95%)

diff --git a/meta/recipes-support/icu/icu_72-1.bb b/meta/recipes-support/icu/icu_73-2.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_72-1.bb
rename to meta/recipes-support/icu/icu_73-2.bb
index c2eae5298f..7c59f8bb89 100644
--- a/meta/recipes-support/icu/icu_72-1.bb
+++ b/meta/recipes-support/icu/icu_73-2.bb
@@ -78,7 +78,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=a89d03060ff9c46552434dbd1fe3ed1f"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=80c2cf39ad8ae12b9b9482a1737c6650"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('-')
@@ -111,8 +111,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "a2d2d38217092a7ed56635e34467f92f976b370e20182ad325edea6681a71d68"
-SRC_URI[data.sha256sum] = "ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea"
+SRC_URI[code.sha256sum] = "818a80712ed3caacd9b652305e01afc7fa167e6f2e94996da44b90c2ab604ce1"
+SRC_URI[data.sha256sum] = "ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.41.0


