Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C94C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 07:37:46 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web08.5552.1651045063087560678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 00:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Vdewt1IF;
 spf=pass (domain: linaro.org, ip: 209.85.208.172,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id bn33so1508842ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbhJI1s/8/mORVwD+Esg95+Uc0EPkg0JWTr7SRs0V6E=;
        b=Vdewt1IFvRuC35V1C9YRI9GjNp7jcWnw8Vp2JqB95XpszARvReV5trP2Lv0tKKw5v1
         zttkrDzsprA9eu36kAXSH4kmi14GbH652H3UpJrQLtCSYEFnkhHLUavRsCnFdv0biZy2
         azCIkdb+d4jXLhFHI4noNBBnN1/FmhemnGMo0dG+QYCEZgro2KivxCdcisp/d0zfURp/
         +esaEJ8sPksV1Z/zhkpaEAPOzWyWnIVXVxa7tFmKGg2vCqXWnaNn//C28mMmTdM8HgwT
         tlFnRX6h+Hi+AnGiTsSy69VNsJCdAn2VOZiWuTl+ZStzjWwLEl8FbzrIc2Is2CbkzbKw
         NaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbhJI1s/8/mORVwD+Esg95+Uc0EPkg0JWTr7SRs0V6E=;
        b=nN0mEZYEtgahYI7P+Fgcoy2WNMTNB6sC/K+4EuOOyCB0HvVAo9uekU9qcaN/noTPhK
         jSSenXjB1L4IsFXrIRjb8+Wx6L3nyrkXBm81qo5cd5ldaZOP2k8/iiakFHr5FhpaoG7D
         b431o860hmPBW7nBXYr1loc+fuWR50K+EeQM7GNtXPFul2oPTlk9v3/7GPFijAD483qc
         UhnBHxKdcydujf3RrBZ8TrCtlYnfrobsxvsBnTns8aYWq8bRPgXc+8aP6xNnj41f67mi
         sepk9uIkL2aUI2rPxBh6ZAd+Mx+jVzk2hcMCzoO37LuB55Ce9jlT7+vUCD3rjpgJ0fEa
         KnaQ==
X-Gm-Message-State: AOAM532DWYYFAzxhlE/ZbRcTVwal/MnRUFYG2pfxpol9qCR9cXCiSYkL
	VshKzSEiJADDCyrSsBykhYlDI0S//k7YWw==
X-Google-Smtp-Source: 
 ABdhPJxh3SG07ekyMKV2xuzF3JJYK4v6FpYLBXQw6alJeVRZ256sD/ANAd6PYpib+5BiW7lW0Sgqkg==
X-Received: by 2002:a05:651c:12c7:b0:23e:b8f9:15b2 with SMTP id
 7-20020a05651c12c700b0023eb8f915b2mr17667335lje.382.1651045060778;
        Wed, 27 Apr 2022 00:37:40 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a196f05000000b00472035deb89sm1113840lfc.1.2022.04.27.00.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 00:37:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image.bbclass: allow overriding dependency on
 virtual/kernel:do_deploy
Date: Wed, 27 Apr 2022 10:37:39 +0300
Message-Id: <20220427073739.4015660-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 07:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164891

Since the commit fe26b2379ecd ("image.bbclass: Depend on
virtual/kernel:do_deploy"), the image.bbclass made building images
depend on virtual/kernel. For some images, including small initramfs,
this is not the case. Allow overriding this dependency in case
developers knows what they are doing.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/classes/image.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7f1f6f80a464..47776db2b0e6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,7 +132,12 @@ def rootfs_variables(d):
 
 do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
-do_build[depends] += "virtual/kernel:do_deploy"
+# This is needed to have kernel image in DEPLOY_DIR.
+# This follow many common usecases and user expectations.
+# But if you are building an image which doesn't need the kernel image at all,
+# you can unset this variable manually.
+KERNELDEPLOYDEPEND ?= "virtual/kernel:do_deploy"
+do_build[depends] += "${KERNELDEPMODDEPEND}"
 
 
 python () {
-- 
2.30.2


