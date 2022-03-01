Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD88FC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:11:52 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.9950.1646151112517491642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lrG3w8vB;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id o8so14729450pgf.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28vVWoq7SDfsicf8xsyRZk04Hnr/LOd3oe9bKjNqomg=;
        b=lrG3w8vBAQ6ANQ9VFiWO1KspXm6Hl+rZJ6NvR5RkOqwlbt+t4s/EinbIqLl6KaMK3i
         jTAMVvlqO8YwBU/x/9NtDWPu0M6PeqRmituhVNP4PFrEI9LByVuNj5//uroqhrzBPiKh
         qKJsP18JubGfM11//viHH9C93gLz6bynnl16GvELNDfx7c0DbrjZ8GC1W3Q4NIPMHslp
         AdkSBQqxzdOtjooPbfdEN0u0ty+AaH/NySOf+QfyZLTIURQNjuKRHw/PD2rm0/90EHRD
         56Xm3OU+oW3QVB/dMj4ouhubBL2gEWhz306ryojqd8KEooxyhQICf6ls22dh7KFX0dBz
         fZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28vVWoq7SDfsicf8xsyRZk04Hnr/LOd3oe9bKjNqomg=;
        b=druhrkMqZCmt/jtmc2D4Fv8A/xXTFDyXUR6c4DzTX9Brt/C1Z82cG3A9Mr8Hge+HT6
         lrZOIR/8sEGxRLfbAy9oZSbdJymt5A4ZTj928uaflN/S0rhjJKm7j3yCl2L0x7OxMDJg
         Gaq0Xbudnix48SJaCZ7SbCVhdOJV0TMuCad7NMSxvjItjdjUgUevnDqu10rMu1+4fXwh
         8Yug6tgchB0Ez9sqQkxvbJmttHbRFIPUx/B9dwXBekFClm9JeikKhd6H38paKoVuLT4a
         GMdGjyUQi3X1gd++NpaXaLkh/sqQV+iV2MpChAQq2jBhH8jaKMXpvrB9lhjRI1YKj5fx
         kR5A==
X-Gm-Message-State: AOAM533Txk7MnxAB3frV12/v0phxm/Y3CQUGNG83B+y2hYFHIxF6WQNq
	77aK7pquRXNfkVYTQaxxWgyVEvDun+4=
X-Google-Smtp-Source: 
 ABdhPJzlgAot/Rl1s5ad3HQGeVVzmhRhhp1OCRXIZpc/uEbyjZrdPPf50QPIjhh1Afu4YYNjpQCrQg==
X-Received: by 2002:a05:6a00:1d13:b0:4e1:7958:b59d with SMTP id
 a19-20020a056a001d1300b004e17958b59dmr28029956pfx.68.1646151111613;
        Tue, 01 Mar 2022 08:11:51 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:197f:1785:dac1:56d3])
        by smtp.gmail.com with ESMTPSA id
 k17-20020aa788d1000000b004f359a0a896sm17414821pff.169.2022.03.01.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:11:51 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-tomli: inherit flit_core
Date: Tue,  1 Mar 2022 08:11:42 -0800
Message-Id: <20220301161142.1539043-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 16:11:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162564

Drop the setup.py workaround as it is no longer needed.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-tomli_2.0.1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
index c3d51282c2e..f8b423bbef2 100644
--- a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
@@ -6,15 +6,8 @@ BUGTRACKER = "https://github.com/hukkin/tomli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
-inherit pypi setuptools3
+inherit pypi flit_core
 
 SRC_URI[sha256sum] = "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
 
-do_configure:prepend() {
-cat > ${S}/setup.py <<-EOF
-from setuptools import setup
-setup(name="tomli", version="${PV}", packages=["tomli"], package_dir={'tomli': 'src/tomli'}, package_data={"": ["*"]})
-EOF
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


