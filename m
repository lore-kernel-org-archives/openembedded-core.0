Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE52C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.14880.1709739743020702155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DLo/hsgH;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so298769766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739741; x=1710344541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRltliwzQRiByQ217R8SZqIyIlTKBPy4HdYKB7cX0Bs=;
        b=DLo/hsgHzGQO47GRux4MbuRjLXUx6CeqWsOkUkeTId5rsfAF88XvEEipzPzn6bCFz4
         gO7qlG7VAOJ0+NUJngalEj7Pjq70DgPzSWIc04fLCQoaRSRQbaW+F0atZIQJMNYbnZ/B
         x2ll4LZle7aYS3SBOpZpScYOro09bRzA53szjK2HWg7feRWFjZxPG7PVdXsEJRhpXOg6
         UQzwiCn7qjYPhxPC3x3AwjzJHHgedd39UDvt8qfC1+pwSGagIwSl/Npa3kDm4ziLrf2m
         RUn3ZbrXJtuRtCojR90IOfsyoKxtFDlDE0ju4QdXe7kr31hSR9pYlZh3m2k9qEY01DnY
         Fvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739741; x=1710344541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRltliwzQRiByQ217R8SZqIyIlTKBPy4HdYKB7cX0Bs=;
        b=EDiMwXsgCYdXO2cSO3oTx1yAw0bpX8oIx1cTwPQrJOeozexI3O+iHR+H5+1hRPSggE
         M7uHnVmN1GBNsc/z4+2wczLgqqEn06wcJM/iUWJF2PP8zU9mEzRCJwnQlc2mPkQRQVJa
         ihdwRDo1o2Ik+Wl6TeP9uCvqHqcHyXbU/OglJehzfzp60L0yZddwGIuwnarhgvn2SZ7A
         LyAaRTzlKro9VlAd00aelEyXFHSeL/hPABxClrtCvnOyhthWpsVFLD6DymbhqdsSzqf/
         668Hsb+Jo1x90E9z32rxjjg4/HNimthatRd3ETgX2VcgmX+yk6p369ty+SRkqZjtn+se
         9lhg==
X-Gm-Message-State: AOJu0YydCTHMCdnU+Eh35bhi9ADkKpdMxLHerV6g44y8PnkNYUSisBuY
	pTI+eP1hAj+E88Ba0aFev+RrTjNgk1lYL+HpTNx5c1livs9VywhOoeLAXWIl
X-Google-Smtp-Source: AGHT+IHUDlJlULpNfGOoKS3VFuo4oCqRQDBDkMtzqLeHNBL6d747ClTqMss+vOY4iORcaHDIQvy2Gw==
X-Received: by 2002:a17:906:f91a:b0:a44:752:ad4e with SMTP id lc26-20020a170906f91a00b00a440752ad4emr11280555ejb.75.1709739741184;
        Wed, 06 Mar 2024 07:42:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/47] python3-wcwidth: upgrade 0.2.12 -> 0.2.13
Date: Wed,  6 Mar 2024 16:41:42 +0100
Message-Id: <20240306154151.3741709-38-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196721

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-wcwidth_0.2.12.bb => python3-wcwidth_0.2.13.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.12.bb => python3-wcwidth_0.2.13.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
index 6ce5e70c2a6..4a9bf753233 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "f01c104efdf57971bcb756f054dd58ddec5204dd15fa31d6503ea57947d97c02"
+SRC_URI[sha256sum] = "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
 
 inherit pypi setuptools3 ptest
 
@@ -18,8 +18,10 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
+      install -d ${D}${PTEST_PATH}/tests 
       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+      install -d ${D}${PTEST_PATH}/bin
+      cp -rf ${S}/bin/* ${D}${PTEST_PATH}/bin/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


