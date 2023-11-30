Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9816C07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.5153.1701377883187780122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=popOBRlb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cde4aeea29so1183801b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377882; x=1701982682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSKHBupi9ByocfX5O00GdeaOMBAxWuM9HZ0IgwD96mQ=;
        b=popOBRlblVTfgRcbxr0DssCA6yne4ETZsJ7Z2UcHKl+KN0UslEyjMfiAt1etB+iG7A
         UdCdG6WZqnEI4jSc9pK03uDLFUO4qT3UaEbWijkE7tB8xOxNmgfcNRxDYH/TRQhj6aHi
         J/W65ipDhcY2XQVG78uCyoQrQyAdl1vwo8CzqiqcRWzHjHtk6YAszfNEohyS/kBPI5oH
         Sdg3QGfQsQucz2jorgX1QBqCSu2yS/FrbaxGjfMWVO9aOWgYzA5t61Y5rgvJRSWo7XEa
         gkHbNs62xiaxm1iRkbFvCrT4b9LQSnieOF7XPPM7QSbJ1/5Bg5N4JwmZ7sFS5LmtTa9i
         ychA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377882; x=1701982682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSKHBupi9ByocfX5O00GdeaOMBAxWuM9HZ0IgwD96mQ=;
        b=NT9RkT06bZLWpHIfMK1MykgqPkw9doV5xUvHVa8W12frf9+CGsX48u3wf7401HxXJH
         h0BKzzW+SDaB9zmikjG/6zZA8eC2De2d7GHDzTXb/1/7A6NFwCPO1z00TSRdvna6gLWl
         bXbEC1AZqpwWOdSamcJzWxHIfoP1lPX623AF28UaKmjVO+qeH3bdY20t1YLL9sDG7xcx
         JZVJ+OfVnNy33/BsGrdUkHKuZCqG4DmZVMDgZxYKyTzJl1M4MW4i+PwwWoWWn/zXun3S
         Hy78O8qO0X3ADk5UzOA9lpoaL/74jM7KA72VZq6XppO/0Y5O6yz8Kvl8H3jV9ygdpvrz
         qk+Q==
X-Gm-Message-State: AOJu0YwIzqj33MnxhYpLqEGx/dbHFIyoUUra21OjIQVTuzFrOEKb6JgK
	POY3HEu8pmQSPQoizX2co/6jbNB7EiOekMzVjw0RTg==
X-Google-Smtp-Source: AGHT+IEjHJxjsYRHsLZMJp7CXD2V593aaa5xUqNgscizHgkMvmBTaoMEMmqTmdRaFpIHEZ9HGDfhZw==
X-Received: by 2002:a05:6a20:144e:b0:18a:d766:cae1 with SMTP id a14-20020a056a20144e00b0018ad766cae1mr21111620pzi.54.1701377882413;
        Thu, 30 Nov 2023 12:58:02 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 13/25] linux-firmware: add notice file to sdm845 modem firmware
Date: Thu, 30 Nov 2023 10:57:21 -1000
Message-Id: <c7ece930e7232a4b76e793850ab7502020edc24b.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191531

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Follow the upstream change (which moved wlanmdsp and notice files from
ath10k to sdm845 dir) and include notice file into the sdm845 modem
firmware package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e03d1b9cc06ae23a8abc8a30b1c09bd997465400)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 895d36cc02..2d446848fd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1359,7 +1359,7 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
-- 
2.34.1


