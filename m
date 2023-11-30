Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99A2C46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.5273.1701377885251979741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aPK/UIbS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6cdedb683f9so857792b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377884; x=1701982684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDRlV2ZmYYXqdxogTav9VlOCAxLOUiyDOAw3pcZEz7k=;
        b=aPK/UIbSjEaw0y6HmpximXvflWWNHZXazEZ9cZb6lFeoV1a81OFla0IeAjTKUGjUvu
         vedH40pn1dMJvABiOsjCuOTrtH6h3YEnoGBdycnrxYgC9BnjQex9RqRgi8ylC40izyCZ
         v0n5Jf6xXFEe1sgWmKNVAs/pmjwxd2w7HcBGBW6ZCtfW1qL/NPJvhBHUAnKG7xQ/BKjO
         ccVpLswY56gjnOhxRMuKNd405jteLl8uj/iifwFuyxO+2bifOG294IXdn+MfGfwXQm3+
         UW+ru0dwN3sExDL7DICmFNCnp1LqZKfenxfq3En7ZnVXYCPaQRZtsQbU5RnW2q2RkpLN
         dnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377884; x=1701982684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDRlV2ZmYYXqdxogTav9VlOCAxLOUiyDOAw3pcZEz7k=;
        b=NsB3cnECYsrzUIBzhzqxjB1167EF1KMaImgjzjjqYznWKxohTc6wfxxI5vGYkASp/V
         wOM6ZZL988cEFoTz3INWmAyQtt5PPUIVLArg+YNna82EQu8dcBJtSUrTJlhe1L832Ei7
         Pq9QETVY0kJxOPwwE+eoHsoqJnROCF7Ftb8JfBWmELKDnMXSdPyvpDND0GieCneSYs66
         2pKe/Kg+jby1mMGcs9rZUtp1uipQWjimv0vxrR8QHUGPCbw2fKtheTiyxbVqh3gXER6W
         HMZbqSWbZfGqAPyQI5PnQWRh1jpJwr/J1vEaXtssO0bFS2uXfkUflurYuXHOqOasUtKp
         2t4g==
X-Gm-Message-State: AOJu0YxE2h4DdQ+DoqAvC2LeBIARF4Y9ceUhx/A+OazPC5+ATfZ1Z2Rk
	cT8QA9VQSw9FMDEDd5Q66Y5EFlycx3a+OPMdJcvzWQ==
X-Google-Smtp-Source: AGHT+IFDPul5eIwZAfZdUcwWMNKtdUoAEztVO/uQ76Qj4oPa6TCIC9aLbKLFGaJuJioK8mb8JkUmeA==
X-Received: by 2002:a05:6a00:23c1:b0:6cb:8cb8:2f79 with SMTP id g1-20020a056a0023c100b006cb8cb82f79mr24431920pfc.22.1701377883940;
        Thu, 30 Nov 2023 12:58:03 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/25] linux-firmware: add audio topology symlink to the X13's audio package
Date: Thu, 30 Nov 2023 10:57:22 -1000
Message-Id: <49c756b5752d1e0c9957deb336c86a5fb8fc8abd.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191532

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add new symlink required for the sound driver to find the audio topology
to the linux-firmware--qcom-sc8280xp-lenovo-x13s-audio package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 313135eaa236872e4aa5f698515a3363eb75601f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 2d446848fd..800c621d6d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1352,7 +1352,7 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
-- 
2.34.1


