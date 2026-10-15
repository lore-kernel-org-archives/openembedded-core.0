Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6991CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32453.1792040657039960979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WNBWzl20;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso34996175e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040655; x=1792645455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kFxVFOhMjwr3Pa6lPFaOLqtvAhPsZZoWRpqH9R1Si98=;
        b=WNBWzl206BxwIN7C9JRSIaFvbX3AmVdBsat5MstMUgZP/ROo3D5HLTMOqywkET18Vk
         DxQtR0lpsXyGZv7OEYIfZq85Bx64A0VrSeUJPFZ3y02gC+KubWMD2Td5+3/OfdFEhLSS
         js9vEIlKxVS6GVU0psY58Pk43e79MyNLWFZu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040655; x=1792645455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kFxVFOhMjwr3Pa6lPFaOLqtvAhPsZZoWRpqH9R1Si98=;
        b=gZl/CCYq7rDdIA0WymTNRr/aIcXbuXtvCdFSwU1CAw6OOM22NJRG8WovRqqZ66cdoF
         R5+iL2rv05OMJ+4HNiA/jqxNtkprzN8ozBKgcFlT4CbkUAXKDjJx93jblCfHu/T6R2BF
         PkPtzSc1ekzl34lL3fxvDBkfjHDYZEdSwKhzab+RcqlXOoW6lMYkpnIuZOA+yvTWPCnd
         b6YI85PDc4USMJyKgUGaXM3lb8ukzCcmG/S6ZCuNQUUaRDWbo+FftDDwACWqYvmGNZaE
         JuP+UUmQXn/skx6PjHS3gnVjYyACZwauaO29rYrEFGkiCnZ/SRzp2TO24Z8f/Z1riUIn
         omoA==
X-Gm-Message-State: AFq9FYKgPsSwqDA1IaZwkA8Dd1FidWpI83fSMlFKPFgbRhmXZJwjryGj
	b494/kU6jlVzC8jc1D7L4RCQWdW4jc7QOpNPWiAZMOLbJeu9VF5mLW0KRVywNQ3GdzrvQWEaz5C
	vOpl6ZRA=
X-Gm-Gg: AYBFou1f+tZh4UeKD5uGEIugAoLJmFEyjl54utftnXXiayHiBXSYbl18o8Z4fJU2Lbb
	/Ij7MubB1EQ8MYP7D0CRe9kijANWoO+9s/I1KUJQAeBya4dXUiX6xYrt/HMVasLqCOaNvG+s9U4
	8gPpviVFMOKNJ9oe+iwuCWNfj2GRsxk5lq3AIcuWWuDlGytdxlVZTuyZDLoRGS8MwfJh8XxuTLx
	JU70/RTtTb6vLhFzj06MLddgd2/3rBWuGCZOIwryuVAATd5uBnzxrYw2hjg39TQ4Clm3r5NjA9R
	zd7IxDfpZyuiSCM0+5VUoHawWzNoY6JQ8z6b/h94uJxme4SFptazxDsPy0Y3p4esssCnHeoUgQc
	+3mUDU8JzLlOygp3jw5Vtaf21qFemtnESrQaRaYI0F8ouxlQGPaAj8eOABqeE3gnfXfXOMlGmM9
	PcuXd1nDIij1/pSujhGedgM9Kp4S5WL40xUk8cU3XnA7PvTbCgiBbxKFBD67zov01n/RukOWqyn
	rp3pCIz+bWnXum+vTthohviSYkvQ/ec7DyBFnsPOcax5j59ZEOxtvOh5CUgitrakXirWS7n8/3q
	h5rv25no
X-Received: by 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr321547885e9.22.1792040655309;
        Wed, 14 Oct 2026 22:04:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 53/55] python3-py: correct CVE_PRODUCT mapping
Date: Thu, 15 Oct 2026 07:03:16 +0200
Message-ID: <936d774b3cf1958c210d3fbb78b91fdafcf5fe15.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247851

From: Devansh Patel <devanshp@cisco.com>

The product-only "py" mapping generates a wildcard-vendor identity
instead of the exact NVD identity for the packaged pytest-dev py
source. Use "pytest:py" for its NVD dictionary CPE and configuration
matches.

This changes the generated product identity. With sbom-cve-check 1.3.3,
the current CVE report is unchanged using the pinned database snapshots;
both mappings report CVE-2020-29651 and CVE-2022-42969.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 26fa8b053b71d1f3f8da359abaef578c671c692f)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: This is a cherry-pick from meta-openembedded]
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index a75b9c2b142..906410e9bb9 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
-CVE_PRODUCT = "py"
+CVE_PRODUCT = "pytest:py"
 
 DEPENDS += "python3-setuptools-scm-native"
 

