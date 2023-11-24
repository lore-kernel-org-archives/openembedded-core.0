Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D26C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.134527.1700829116820827542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=R6M2BGfW;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c87adce180so22660451fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829115; x=1701433915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ruu5sQWabHAlZDicYQgQPE24oML4AIz/BIb0vDsbmAs=;
        b=R6M2BGfW4ryBgJ1dix2wMjHgg3NAC9WuEU5WemxQDnIqH6klZb3SJNN2pb6tVQZYma
         Qy7yEG3vCQwQLg5ed1zuFUrEdftsKq088XgbVONnMH8Ank7QzRlaAWgFGwkQ3neKs2Ol
         ubWxHU/QsDAMJQCK38G/MvMojVNqJLzEDYWZbHm9N9cFUHFPTnp7ceQzn4X1LTU1xBUf
         Pb1IHxS3oCoFi5Fegvv/c+TjbvH7qygBxWbKTowMLGb9nQefjAKZNOH3ohU6vXdpQo3V
         clwMB7wdh4ozI1lePzKL+MpEC5rzCzX6P5PO8FltQwpSdJBE3j2af9ojJDODPGjzMYEB
         tGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829115; x=1701433915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ruu5sQWabHAlZDicYQgQPE24oML4AIz/BIb0vDsbmAs=;
        b=fInYvMvhCI91SIsUhDPHf9EWyaK+aJFYTI3aJMrDhDbBx4q1yiuK1ltIpc2v3/iiMo
         Fkzfqmi+AS0UdzVk08pqRRMRNKhYbx2RAFGBjEttdbkjodNE+8Gol2bDUir4VJD681+U
         IYk64Rg8ApOKUAeDoKPGbOz67E0DWu4wFFiJm2H4Glp5NH7lEIjbi2Phi4ystfsmHQm1
         LjhIRuhWA5y7huOXDJhqDWfpbRAAg+SWVLoQ5d2/uosaz7duuAjoVrXQFAT7zy0E98Lc
         +waWFB4gk0YMPs33lRhuP8WwdaI2TguX4QP0BVXk5YA3VaWeQOvIfbQMs1x/3glLob6l
         h/2A==
X-Gm-Message-State: AOJu0YyIPoDvlrPP0A2Je50gCqCb8Ysd/eG7EgjtSo+B5W0s4wyCHL27
	e2sHOv7ec0WM4XpoX+Itmq7zSre8DQXvTw3isrw=
X-Google-Smtp-Source: AGHT+IFvRYQCIrrjauj6lUp7oG3LmUbxJgvatu4NGKGyL+7KQxpSvlfCOCxwulCIj7r4UqCTBU3tIA==
X-Received: by 2002:a2e:8e86:0:b0:2c8:34e7:b8ea with SMTP id z6-20020a2e8e86000000b002c834e7b8eamr1870111ljk.53.1700829114765;
        Fri, 24 Nov 2023 04:31:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 04/10] linux-firmware: add missing depenencies on license packages
Date: Fri, 24 Nov 2023 15:31:45 +0300
Message-Id: <20231124123151.1091665-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191187

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Several Adreno packages lack dependency on the package with the license
file. Add corresponding RDEPENDS.

Fixes: bf00a042d2fa ("linux-firmware: split platform-specific Adreno shaders to separate packages")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b9f7fef59cca72c3cd0aedd040a15e77ad5a2b2)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index fd38253dfd29..895d36cc02cf 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1380,16 +1380,19 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
-- 
2.39.2


