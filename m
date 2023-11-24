Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1153DC636D0
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:31:57 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.134526.1700829115689097826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p5Mz+Azm;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c874286f4dso30063791fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829113; x=1701433913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E60dacBKDXD9mnu8v0ZQmv5y/EGzr36muhRvz3A9OFU=;
        b=p5Mz+Azm3wbqs2AXqKQfOKOBj1eYPdWIrFsBmSSxZvqVgnkHL8RUG/Zgg5x93OFo3G
         7pbK+1h+ogT6JXmR1mS3cHgBoi6sScFVnjDk3WUioBsvIsBhttGjhqAe1ntixVrN798u
         1ThPqQX9bw+z2pEtBlCnUD7jTLjxO3OS+MA2RbFZzNJCxoiw4HGAdb51oElgqKPxpTYQ
         bT+JWpFqetHbicATKGre5N3SvwEV6RlVCHKcSZ3T4a9dG4dLf4tE58HECl9hRjjyOzie
         8j8kDn6k2HDzd+jSQyV84gF6JqhzhT+6/L33lJvbvBcpuJ1/3DKLjMkSoMWBvBD3rKgt
         Df/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829113; x=1701433913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E60dacBKDXD9mnu8v0ZQmv5y/EGzr36muhRvz3A9OFU=;
        b=kFpNNYJU2tv3R6ghoHt1IZjD/11d3bpfom5dZRrq4lC7Hi8MKzGVregEs89WC/idUa
         rWCUgz4e9fc4Xw2m5zuVn4wtdgA3A8/rcKHWtznstwt8AAhGgJm4eitPGKOrPAaOUMRi
         hcetSHNoMfJFRafIYl2srzyPzkED5eIM/80bXlffwihe3PEU9yDXA3uZbdCMF2G6T2ju
         LTmusWvj2ITF1LL0YmUIdIeTK7KaEuqN7dNZr9nKE8Pl+UJWukqruqil+RFdb1c+w7S6
         cSy+nmq1AfiiCgfPCMLzEBlEcAtZdZ62ZZHYs/oMNdK9jbFZLxhKZsO9CyZxJPp11v3B
         W0Bg==
X-Gm-Message-State: AOJu0Yx2neQM1Tzd0myEC2vVcbCQLT8qgS0zaAySnlvGFJMURwMrZwai
	hRzfx5FaO6rscTid3j7YwqMO+sO+Ua26a8rP5lM=
X-Google-Smtp-Source: AGHT+IEadhdvIhC8OVsb3w3iXPwRV3oGFRE3DGzv+hcBwILO7hllQqyCQyhNhJq0f2Fp7AtbGwc0Mg==
X-Received: by 2002:a05:651c:118:b0:2c6:ef9a:f265 with SMTP id a24-20020a05651c011800b002c6ef9af265mr2065786ljb.1.1700829113634;
        Fri, 24 Nov 2023 04:31:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Krause <bst@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 02/10] linux-firmware: add new fw file to ${PN}-rtl8821
Date: Fri, 24 Nov 2023 15:31:43 +0300
Message-Id: <20231124123151.1091665-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191185

From: Bastian Krause <bst@pengutronix.de>

Extend the linux-firmware-rtl8821 package with rtw8821 firmware files for
Realtek RTL8821 variants.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 23c945938f8d8bcf5fbd6d9b840ec319aaa40c62)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 0e8005bfc90a..33be741a0a56 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -825,6 +825,7 @@ FILES:${PN}-rtl8723 = " \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin \
-- 
2.39.2


