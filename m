Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E96C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 14:08:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.11421.1637676483862302884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eU/fnkUz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso2369327wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3DtpRtSU3ueygX6Htg84X5f1JGBvEb+/OePSxX3jn0=;
        b=eU/fnkUzQQet+kt/csKHmF9l8+L5zo4ZPbg4odDkO2qDKKjD7V3xSBuOXIZQNNHJq3
         wGF2aWRWYXg7bO73V/i+kxeQ/gDepO/W1VLcBEter/zSQI+gG8hVyKhktBimy6M/gjmj
         Tqd12nP+a6elBv/b5d07ukiTwR7ZSjgRkuiIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3DtpRtSU3ueygX6Htg84X5f1JGBvEb+/OePSxX3jn0=;
        b=QmVVSwkfyPRh3OPqrWhYx0A762THPBrxhrsB7jQBU6x1guHxvub6EkIn1GrbtEVIZi
         Y5rQJmdOQtCaOHopC5NHrtNiJwpAAoRS/YHMWRNLFadUhmpAyeoCN98w0y1kxUYqgchS
         K+ldAclbhGvl/xoC5JvDC+2SxeRlzMqd7dZg19Gfmr6UVrKKC+IfbDDh+e/ZcjERUXTl
         PxVnblujecaGwmxTQ6sO3e51zLGlITPgy6JgRwktjNlzwYAUhtX+rr/vNOTJqSU1TDzy
         v7uhWbj5gKmY2sA+dUkUNwJ/EZQtWSIRI9bs+Q4qp2S4m9LKOUHg+h5oYztJViigBkZz
         9PaA==
X-Gm-Message-State: AOAM533NflSYXusvy2AhUuU3B7PXDE3GOGtG0LDrzooOtGZy05eb230j
	641jR0tLzy+YxYTaEuClQvDVsxdP3M0JQw==
X-Google-Smtp-Source: 
 ABdhPJyFNXxWsoals9YNmCt6lOJSUMpPLHw7IvwQ5i6oiL83ZMDLPkKzsOAD3pPG+OzlDCyH73m4Sw==
X-Received: by 2002:a1c:a74a:: with SMTP id q71mr3518195wme.105.1637676482019;
        Tue, 23 Nov 2021 06:08:02 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id x4sm1227356wmi.3.2021.11.23.06.08.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:08:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Pass -D option to ranlib for determisim
Date: Tue, 23 Nov 2021 14:08:01 +0000
Message-Id: <20211123140801.27412-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 14:08:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158605

Add the -D option to BUILD_RANLIB so that deterministic archives
are built for native/cross output. This improves the changes of hash
equivalence matches and hence build artefact reuse.

We don't need this in the target case since we compile binutils-cross
with an option making this the default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 71c1e52ad63..fba99e8f0cd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -542,7 +542,7 @@ export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
 export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_AR = "${BUILD_PREFIX}ar"
 export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
-export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
+export BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
 export BUILD_STRIP = "${BUILD_PREFIX}strip"
 BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
 BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
-- 
2.32.0


