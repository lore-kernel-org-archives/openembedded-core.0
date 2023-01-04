Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBC3C63705
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9379.1672830371113999238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VdobysKF;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id w1so20447602wrt.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ykd9WAsb9ZQPNDeyRDCaA7k536HHu3zTyT/6hZPfKqE=;
        b=VdobysKFfw/teY398MYNZint2O+lkveYzw/X6Xl/j6odp2xDhW1CWtfgGX97zvc9Ml
         s9J+ppkDb0PJgKA2cqxvyowo8aFdePza8dYfdqXxUbJ9TKrntfvbBO7GC1VH50W/1Z+C
         OSsxyfLB3kffG36INTDZ6XhaYMKRS5Vdt/u64oJKXN7Qtj/7t3b5r9n7g9NXL9XdFkSb
         DGv4QvMf7PiklvtaMc0pJFQVTmk/7orokar/SgUSaop3U3H8sauwhfY7aTitq4d3w/ac
         g/gQm5mt2rGCN8Yl/ah9zmh+PcjC0VyMxn6e3dDy3bsDExSm2dq6MoEk2VbPeBkTou3y
         e3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ykd9WAsb9ZQPNDeyRDCaA7k536HHu3zTyT/6hZPfKqE=;
        b=RJw4jT9OXBAxTB/ATR8LXIRSTl3b0ygBO5vTvXpHnLBT1+5TSMPgP3ZgvOVpC0vALx
         YsmopamExLfhOaB6AIAcY5m9Hq7sw0GmpcRM8xBiLT0wOOEnNCEyzCGZr3SmvDsMi1Ax
         P/DVlZmibBcV5f7TMHuTegbIbzpyLoss9we2jINxoIxrs/Xt02qDWrWu007VQ5TrVTTB
         wiQn6AEMTttxtwKJqdUtW2T0l5TsL+nLAdsxpuTGlU8AdNTTSAReBF2/Fvgl1fRdCjvY
         esxu5LyGRtntDTBTkp3gSBQO42bLnmdsoglf2a5aLZSr75Px7CWBvRq2A90OpDQ0zr3f
         KavQ==
X-Gm-Message-State: AFqh2kq77xucYPZh51bPF4Qpc3yTugsNGxIz0sBZ66hRL3GMdxC3JqB2
	HCTi2UkDtzLPjiXJYRS+If6SLsJAgrY=
X-Google-Smtp-Source: AMrXdXvDfgbDvc0h0t99s6EHAMC+Nth2dveD+XGeonbAx1Km2qvhI/0rLfSGQ6kOKKNoAFindH3kXA==
X-Received: by 2002:a05:6000:242:b0:27f:aa94:a9fc with SMTP id m2-20020a056000024200b0027faa94a9fcmr19283171wrz.44.1672830375858;
        Wed, 04 Jan 2023 03:06:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/77] python3-zipp: upgrade 3.10.0 -> 3.11.0
Date: Wed,  4 Jan 2023 12:05:01 +0100
Message-Id: <20230104110548.2537259-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175414

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-zipp_3.10.0.bb => python3-zipp_3.11.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.10.0.bb => python3-zipp_3.11.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.10.0.bb b/meta/recipes-devtools/python/python3-zipp_3.11.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.10.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.11.0.bb
index 56d8e706c8..70ebafc168 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "7a7262fd930bd3e36c50b9a64897aec3fafff3dfdeec9623ae22b40e93f99bb8"
+SRC_URI[sha256sum] = "a7a22e05929290a67401440b39690ae6563279bced5f314609d9d03798f56766"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2


