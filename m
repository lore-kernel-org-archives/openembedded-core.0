Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E49C4450A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 17:48:12 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.763.1784396885133398570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 10:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OTFs3mgj;
 spf=pass (domain: konsulko.com, ip: 209.85.214.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce7d2adef4so79825205ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784396884; x=1785001684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwwtvUlNWFB1yUlngFz6xua+WPVuRJXwnngG4kX3GDU=;
        b=OTFs3mgj+2kXbiUWeuwQt6VS22DkBCyEhbkn3YgYkhzAPLf4QCNSnN+2JaEFyr9HpS
         L3Z2xXHf0PlHKfLagpckwUMK+VKp7F2U5RVIhniDkHRDDxZjLGDrciwhKXY2iZIle/dh
         pxc/nEl5n8/dn1kRf2ChL/3xBC5VDvX/skupQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784396884; x=1785001684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwwtvUlNWFB1yUlngFz6xua+WPVuRJXwnngG4kX3GDU=;
        b=RPJBCHHBdeDJTI3QQBTcfZKbqZKMRsQtqeVfEJhhiyCPReOM+01IbZ4BRjeE19Ejjc
         M/SjumoLq4FvF2DjYlyYDw3DCfYY/Fhu35lYD7CTKu32hgco6T0QLksWgW6J4Kd91QuP
         VbCcy6k2nNPdVFeecfDDf096EnVV/EvMqs8W/PEf3DXgIKjC6X81xFrWXsOQOp90+oia
         q/KyZzm7pN8/+VlwokRRLxrHm7pX2D2korv5etF1pw/34HuXj8V+jdKF4cHe+nbNUSCP
         VGaLvUn4CBxJvlhfUwrclsbt6pTjpDyjVn5WeCBV2UBsBFLdmh7lvoDWeVkTz2n4xMC1
         OKUA==
X-Gm-Message-State: AOJu0YxSMTEoc51ZofDhcP6YY2oDmXpusTy8nJgUM9vDUmHAVvFzJcmZ
	K4yx5mTVXecws1/0v2yI/dVBnJpvggDR+sqMg15AvABviiTNMAcTlBOTiGhy+GnwmFnj1XfwPmU
	FxITK
X-Gm-Gg: AfdE7ckRtCFj5oXVJ7waM0raKAP8GhHWmGbXvTarqnNXQudAYJI2HUbcU6kAWvI/VB1
	WK+qj/rqzEc+t+a9VjtDgnxyuTn0MEtBOnva5F+up9dhFz2U6NE3dFHhxWbAlq/IGPI/Eo7i2I0
	WlqdtUWYI/ctUYcFi1rlaBNc1wWmqXjzc4s0mcXeD8EZCm9TuIv3R2R84qW8rKt+nU18zGDHnCh
	RxOj9+OMl6XyaH6LJCIhnUr6/jA5tAemyLHLThPkVp8I2kDxYmusLj3q6PDto7eC4z1BqIAnn2j
	xE8ub39nLYANnSPF2EAvw2GQI0H61eyvZJV8BG0m3+SDHcCMM26zBgGQM6rVJsbtGRuzw72kK+F
	Ooi6WocUbNqqvQgwWAW3AIrdkv0yhXf9RgbfS+icmQ50Z/iBrq/WJEKE3WImk123KczxC16b33q
	sbSe6ItKoILcJXgZmlPo8=
X-Received: by 2002:a17:90b:1dc3:b0:384:5b5b:3465 with SMTP id 98e67ed59e1d1-38e4b5792e4mr8160628a91.29.1784396884189;
        Sat, 18 Jul 2026 10:48:04 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:ab5e:7eee:9312:fd2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b247f1bsm3091288a91.17.2026.07.18.10.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:48:03 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-websockets: upgrade 16.1 -> 16.1.1
Date: Sat, 18 Jul 2026 10:47:59 -0700
Message-ID: <20260718174759.1890722-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 17:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241267

From: Tim Orling <tim.orling@konsulko.com>

Upstream release notes:
https://websockets.readthedocs.io/en/stable/project/changelog.html

16.1.1
July 18, 2026

Bug fixes
---------
Reverted a backwards-incompatible change in decoding non-ASCII header values.

For full comparison of changes, see:
https://github.com/python-websockets/websockets/compare/16.1...16.1.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...{python3-websockets_16.1.bb => python3-websockets_16.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.bb => python3-websockets_16.1.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.bb b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_16.1.bb
rename to meta/recipes-devtools/python/python3-websockets_16.1.1.bb
index 0f819aecfd..2e2eb0c3ed 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "299468cbe42e2b9981134c7c51d99387d8a7bf562b00183b3eec53f882846dad"
+SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


