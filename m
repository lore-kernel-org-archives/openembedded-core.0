Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69244C4708E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:12 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.44794.1669904887208809688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fHllXkZx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so4308509pjt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wthRAa93hvYf8cpUJgFFoE9aQ11V/eVxwEaLlVsnro=;
        b=fHllXkZxLgc4ed+oFk+934MMPflFS2eaHuiEzttllMpnrxLn22L+bCIWag0L84PM16
         8lnHRyyzm9KNLaIh4wq/a4uPRRzn36KGFX5A24YzoD5ia8TevsA3l9SLzV/jEBDSsOUD
         jkuhcq5V5acjq3rLKvGR7TtxGin7HfWzYmdqxRdCIfeJ5PmFNu6gHUj1tir8QV9jATIq
         DwroFyvzIxHHzewwLK0l6EAjx4c3PungNv2ti0XoqQyft17HmV1WsCYFRd/ita4PtX7d
         vscPe1B0z8G+PYQz/u4DKjA+ZyDIsPuTl+X6FvJDSzVHXRdyEjmiTyO6oC1uWkPALkh9
         oQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wthRAa93hvYf8cpUJgFFoE9aQ11V/eVxwEaLlVsnro=;
        b=q1R0rQjgZu0vsKiafH+lX6Tn2zRmTxQUBbHSIbPABwcDTX/INR/WkL75JXjonGbbSr
         B6MlF//uHjScqRupAjG0m5CZTIPNOusrOfvDgn5BBzKcS0gcwlqcPJCa6qT9bBMQ0zgE
         O1Zb5XiQxff2bEf0ryaG4h3eWDjUWI0tT4AassNdWSd7vkZRlzvVMwp1onUdN9RvEeez
         7GBENbg5jvwnSxzhsPEvqLK/9THGvAOZV8Esn47JYpslDaELnVuIJZCJGHe6CQCVxB3f
         65XOjTVxzanfQlrYA/t3XLqUyiSS4DxxJULjBVVZg5Og2OVDL4P2YHAnz1lSG1ONpnAp
         5Uzg==
X-Gm-Message-State: ANoB5pmE/q2eSX6P1W/iDC52cOXoC10+9mhAJ/5eQY4Uqh6r37SBK2VP
	ime/ANnUg9fVKHtHRfDR6wY6dB+T/PC855yzxWo=
X-Google-Smtp-Source: AA0mqf5u59ooOVd6ckIYaanKTYIUTaLQ1wMNAgC03KvSRePknhv+89gO/53AMMD+C095gBhFe94zfg==
X-Received: by 2002:a17:902:7006:b0:181:b55a:f987 with SMTP id y6-20020a170902700600b00181b55af987mr48516156plk.67.1669904886198;
        Thu, 01 Dec 2022 06:28:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.28.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:28:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/23] linux-firmware: add new fw file to ${PN}-qcom-adreno-a530
Date: Thu,  1 Dec 2022 04:27:13 -1000
Message-Id: <6c477dffa8c83418d6e5c9635370e37d512885c3.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174105

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Extend the linux-firmware-qcom-adreno-a530 package with the squashed
Adreno 530 zap shader.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 920bf119f35824a3531801f5e41158a8ad1bca4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
index dc977c2bb7..b05b960ebd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221109.bb
@@ -993,7 +993,7 @@ FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
-FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
+FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/a530*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
-- 
2.25.1


