Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C31DC4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 09:24:40 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.98329.1703669069687964223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 01:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DMHEgtGg;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ccaf5955aeso32456011fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 01:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703669067; x=1704273867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxcy92MxYXpURykacpoQ64DowfJ79jD6rrCLQOmhgV4=;
        b=DMHEgtGg33AjJPkdrwt9TpuaibBOapF7WFvalrQbR84RMKX3eTB1MeW/G+JZtmbO+Z
         /HfTZohiL60PxHkptGiNRrK4Hl7o0WznNckZ5R02YVICH+aUhnoBvHcOaZGCKV8jrYF0
         80aqqsghoPD/N+wUohrTl50w0z9Eq507U+ogsY2rFpAVBcNbIc18yIrLTLXYZZrD8vrY
         AsdcaHNZyMWkwpf1fGEAutw/z41vmjMPq1yKK9kuiSJ6VSLsBR4huJr41ae/oC1TxykL
         LZW51fCan/AXSd5tD02dXp8MuKM/HxrELEV6//7szS8ERSPMGNIHL+WHeUpxF2mnr0pt
         MVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703669067; x=1704273867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxcy92MxYXpURykacpoQ64DowfJ79jD6rrCLQOmhgV4=;
        b=Y+sep+UKYdLCeL6AaqU3fCLt1sommmW/YYJqDmYV8of68duRIutNa61sBnBBgjuxaf
         XMF6Y68sr8DgJT7Rmk5OdAFMzulaWRPjqL2jmSUZ/wNMLOhylUytT6b4BDSwrb4zttrP
         M2GxETto6tqlNSXBefHWWn4FYufWoSjxZO3+DFNOerE+UVUfrkb5wNYbSyHD8qdBJz8X
         o52X/brjmWqzJw7ogiZr76VWi8j9Kl7VrD8zRgBRnZ1bItfbkYr8RySiI8p1R9DfldsL
         NDeGc5gIWOz2GDTRvIS8jk3MdgNiN8BcNXmFqIruC9NVFDFuxqhHUdS3vju/q9elS2rx
         adPw==
X-Gm-Message-State: AOJu0YwM7xv+cA+qPaOSOfkg6bqyHs21DGeUPkCNNTJ/hzR+GSc67sCL
	Csh933RJQA5PJYdupez+EABjvWh+ivnTOeTjd3RpcdyCwiPXkZAe
X-Google-Smtp-Source: AGHT+IHOK7mV/gXaZcvULlhW/m7VtRyXxoi1FRgTyWrR40upfQjBBaKDkt0VIFweDhLqXrgALoyTbw==
X-Received: by 2002:a2e:b0c8:0:b0:2cc:db17:64af with SMTP id g8-20020a2eb0c8000000b002ccdb1764afmr323313ljl.93.1703669067470;
        Wed, 27 Dec 2023 01:24:27 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e18-20020a2e9852000000b002cca6703b13sm2131333ljj.99.2023.12.27.01.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:24:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 1/3] mesa: drop -Dopencl-native=true
Date: Wed, 27 Dec 2023 11:24:23 +0200
Message-Id: <20231227092425.4002461-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
References: <20231227092425.4002461-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192929

The flag -Dopencl-native=true was dropped in Mesa 22.3, remove it from
mesa.inc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5f5c8ceb4c84..efbce5caade5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -140,8 +140,7 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
+PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
-- 
2.39.2


