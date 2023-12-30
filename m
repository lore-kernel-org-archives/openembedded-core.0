Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C301C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:14:57 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.190640.1703963688283559489
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dQbJkDmV;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ccea11b6bbso18389271fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703963686; x=1704568486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxcy92MxYXpURykacpoQ64DowfJ79jD6rrCLQOmhgV4=;
        b=dQbJkDmVAM+n9LxWuC9H+WVfOMGN1Md+Lw9Wh/wMSllxnGsu/MEPPDM5kKCR+jgdgB
         eWfXN+ucsWKzexA0A803PMn7oT2DwJRDuWt8oUj+leClXfW6eSLLfOBrSqhYrOAxeMx8
         yFzcJyVh6weL05Tso78SaUIY2L1hnqEGEudZ2N5x3WVbRI5MMTyBSjB855Vug6nBsBjH
         9f6f1ZBaqjzjZC1qzKMpOHnQhYxEbcAvgLXQH39Az/yqnNGhGUnKCFfx99nr4k7oJakc
         XYIHEOJVabavcujpSV6hMZJymtU1t3AxCSSVo5ga+8uF7PDGDRrH45yU4wSkkftmO2ke
         AjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703963686; x=1704568486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxcy92MxYXpURykacpoQ64DowfJ79jD6rrCLQOmhgV4=;
        b=pUfmmA3KNXf1C2EqkK4Jo5zPIIr/cXdYadyn/DevJvE+fLDBSp9pOc7JckOmsXne6q
         TL5BRe4rLjKEisL/olPfvkgcVLBfWd7wgeHgMC33t21KW6kyynyCcXV68qSI1hF+oKHi
         rk/i7ZqlWEjFgQoyVap5PKO50JkMF98fFgI/fl3UZQtTxcRVzBDbkttD9sNVcPztmRFD
         JhixmcjDzeMPINJovD0bBPLYyZqelojcqnJo6tLO8trVWZ9wt2vYOZhgVnJJTV6edgsX
         /0Zs3Sp23tQwC4DnFsP9L8V2TJMC60qviCq89agbdNxbRWpu3ZQJZtcfEHyWdO4bc82G
         svcQ==
X-Gm-Message-State: AOJu0YwtqdZbw8PSU0OVYlafsBXSsz9M3aZ0DKXQYwMf18Fag1isejGZ
	y+uXeMm2CrIJmibA0lLW+yidFoWd+xvw+hZEmcWIxMNK7met7w==
X-Google-Smtp-Source: AGHT+IGjnshqTa9gcml56yYsbMv3SevrrPHDnhvHMtdqKi58YHUHg0/TkJM2tMRXu2ffeRN8CbGlzQ==
X-Received: by 2002:a2e:a211:0:b0:2cc:7c20:161f with SMTP id h17-20020a2ea211000000b002cc7c20161fmr8220259ljm.2.1703963686322;
        Sat, 30 Dec 2023 11:14:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a2ebcc4000000b002ccd60a6fd4sm1948165ljp.32.2023.12.30.11.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:14:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v5 1/3] mesa: drop -Dopencl-native=true
Date: Sat, 30 Dec 2023 21:14:42 +0200
Message-Id: <20231230191444.1204808-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 19:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193079

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


