Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51875C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 09:03:31 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.45363.1740042203005028368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 01:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=a3oaS9EP;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3092643f4aaso6158471fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740042201; x=1740647001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6SqDfzmJ5MZ8AoSdEi9tKpJeHxypsaCJaQlFGWTK/18=;
        b=a3oaS9EP38s4roAHaJjpq9+dgas1VEMt7cqX2FJSAUi6kHTAwUFFW10tgE/hfGR5WG
         ebym9InoNHx4vIbKW/d2RAkx7wfrO6aWmw+X+bayrdLrIo8Ky8m5PA3PPIAsPj+U1av/
         hj++oR87/eMKsIrJ3cgkKj3EtxEpUvDj/I8IlVITg1BSnihHDuwmoJGfYOlVJg5UiXnZ
         dQQ0KExo12xHedeM2LWP7ORxsYCGxrafK5LfngeYi7MrOtTkcSd2X1pmP8lbprIBy45K
         S1zNBV5WqRxnHmOjclOfVZi4jkvG/T2rAjdd9QfeivJiDEngG0x1KrX7nV+ePV23a6jo
         SpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740042201; x=1740647001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SqDfzmJ5MZ8AoSdEi9tKpJeHxypsaCJaQlFGWTK/18=;
        b=HgpHO9tf2iEzExaZG/4DBjQni/dJNktfe+htgCBHwc4IlzpDuikl4O+kBJ2a1qielp
         VfcOmdJjCqRPrqQ54hiiAaeF7qxFldYm8Qofp6RL8zBP8jIWUf46jQzmc9lL/KlRZtJP
         kOwM2luIuxoKwxwDOKIoDddvKdWp0nJ7KqmwzFi4cxpduO/5f53FLA6Zo0xm0OOQIOHz
         VNfZC30rNTaZu/uKe/vLL6YwOae6zuzz8yFBElGICPID4rSzbiGp/nuJeVS6+U3ultjo
         faj4+1l+n32/tOpJev5P3ww17eIAk7Yy2lx9yuvuvo1NvoKCzYK4qFtaSPqIdnItRU2x
         M3fw==
X-Gm-Message-State: AOJu0YycObftoQ4fAH6IiBaNnD3SswZ4OuCwpx+eViTn/io9+HJfcdfa
	5rjRKdWEaNS8eIDIEN1pble0tMk7+AnaibIjPaX8YXqIwQxb47SKBg8sRn7h4XQntyL5tzn/Fef
	R
X-Gm-Gg: ASbGncthFqg1lzFnzmG50VCDm6pugGFsp0hZ4p7uIZDGkdSqfMCba/Zi3IS7eUTEMpZ
	R5ODGc7coTnNnyoWopc361mANUboN1NgcRJQEd78GYylAGRZBC0CR2nC7rL+H0vEJHBu2NbNuYv
	Dec0gk0OxiLBjnRVCPeVix7H1J6k4i8tV4i2u7hxV125Zk6NJXs7dCHSCniouLh4JQ7MBCfZDqR
	QmBPAXR8ZoYlQ0h0DYSWE9AaKIM6sh7gFb0TTn9mTFwE6FuWnwkwx1q3UaFBOsW7OzXpniLQRXo
	8uPckf6ZzejL1Osg2b11mZKd09HRnHs=
X-Google-Smtp-Source: AGHT+IFGB6arMe+yakfHwoniIJIVo6io2tOzNkdXqHmMlRicgr8fdE9wN3bwCIloV9kQ0x3lOYqYcw==
X-Received: by 2002:a2e:2c11:0:b0:308:e521:591 with SMTP id 38308e7fff4ca-30a50610f18mr6727151fa.16.1740042200586;
        Thu, 20 Feb 2025 01:03:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a29425ad2sm14918191fa.63.2025.02.20.01.03.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:03:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: make linux-firmware-qcom-qcm6490-wifi provide -qcs6490-
Date: Thu, 20 Feb 2025 11:03:17 +0200
Message-Id: <20250220090317.2980020-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211746

The package linux-firmware-qcom-qcm6490-wifi also provides a symlink
qcom/qcs6490/wpss.mbn. Follow the pattern established by
linux-firmware-qcom-qcm6490-audio and -compute packages and make this
package RPROVIDE the qcs6490 name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index ec5329760acd..aec36a7a7fcc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -1944,6 +1944,7 @@ RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
+RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
-- 
2.39.5


