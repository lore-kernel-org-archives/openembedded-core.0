Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E592C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.1906.1645557442162102619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apqb5nqS;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id w2so853200pfu.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MbFM/lfHIRRkVJn+qCVJ397jXTQm8/CrUAmSQXaYRLw=;
        b=apqb5nqSqzzBQiTZpNk1Sm9P33/s09IXbaYfPlUShH4Vitsdwzp/QzVRQQfnYnW7s2
         lE/K9YPnr8Z2X9doqD1tGLbcCuUdbf8SHHWXyL+SSXw8xvoxU0UrAxqCDVbxGbqyAqqO
         cs+YsxCW4waYAUGBqf0+yxWovGRnjePDMFb6f52gEMOCxxGgMYle8NXNeCQlcrnuBCDm
         XswjGbnPJe6Z0skS2BrzyoNBs6TE/PV5Xlz/HNUi2q0uEIN8t3wUSt6ABi5L5dfcao80
         gf47Em5fD/8aJOfmmmMLxSBK07HVnkTDSunEYWg1O0OKTO+Ma6fQzMQMRf6nvs5XtVj5
         UxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbFM/lfHIRRkVJn+qCVJ397jXTQm8/CrUAmSQXaYRLw=;
        b=uDcmBvkQ4TNsstk+op+0Ep9Rv4mpXMVvmSiX/Xko+Bg3m6qym5+ogAq2X76vrvhocG
         DAnN6O8e1l8ePVTb7fREmvHil5ylD3i3cFPghaoyT/Lig8AD8f+wlfwOtBGJgITdybDt
         CKWSk9lk37QSa0m8szRAlfQaDOpBZTmvKsIwwiZKCmGNf21taDg9kjwD2nyGL9MKkCEY
         n/gNxa+ZXn8hHD1nz0faDNfqOMEKsQwVlvuh0DOZvA5UsjBwmtrztYBwWd/m3siYgWi/
         FB1w+hxDnsttltlYcs51pYrbZHCbSzWYCT+RTSiXlXSvYzb/rOo/CQt+l5M1y/IHg3vR
         g5GQ==
X-Gm-Message-State: AOAM5330QlfCOj38ngPp0aOeDfZVAy70mc8loaSGK5k3jzoaiKNoDuqZ
	cRhoabaayVFPt3gK16/95dl9PLWoIE/swA==
X-Google-Smtp-Source: 
 ABdhPJwZMQEEci7xYua7QRxqU2/z2gLx3JzddF7zzVRdaXpVCPUvp5uAm/HO7kErxVAfqkbsvOOK8A==
X-Received: by 2002:a63:c47:0:b0:371:3a2e:32d8 with SMTP id
 7-20020a630c47000000b003713a2e32d8mr20524174pgm.281.1645557441016;
        Tue, 22 Feb 2022 11:17:21 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 11/32] python3-setuptools-scm: inherit
 setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:37 -0800
Message-Id: 
 <6fb52bdf04598ae134319cf8904ae9a27fe097fc.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162202

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index 10dad5a37be..182ccecbbfc 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
 
 PYPI_PACKAGE = "setuptools_scm"
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
 
-- 
2.30.2


