Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C7C636CB
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.134326.1700829117867849828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uAnU2PnR;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso22509471fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829116; x=1701433916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZGh77/WMw+vZTq5tXjO2KL8NmTavJnE/+a3ZHh+krM=;
        b=uAnU2PnRjl6Sep/W3glzPDst4bMknD9rQBx69aozbFONt1i/0DIbttTZ9rzmsA87fX
         GQa2Mn7CttlouqYZ7a2GuD29aPaWzXelplbBbHf20MCKpi44fkxWgA3o6DGGw4+bocyO
         7f0D0PdyFHFdDOS72ZZgTLC2gjnmhO+o5zOPCP7trTaa9orx4iAO4XbWrsH/A6qF8DCw
         oVK2gA+Y3NZ/FJ+3ZD300LICJLIkcs183uoyRc7CWXAjdAouqsG0Kd84MP/Fm8FMAgct
         0u1lzpkC/upfNGvNU6WFo8+lk92Vdz9flJhct72GyX+djpBYeAUXZAyT8lgXUAauPmqa
         N9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829116; x=1701433916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZGh77/WMw+vZTq5tXjO2KL8NmTavJnE/+a3ZHh+krM=;
        b=rXPD+NSxQ6eUz6XzfI274aNGmnIcp4p1abBNAYN+p5sCehBF/Hyot84NUMIKNXZQdp
         wKeTGhFNvcU+WBZcFIKyfKOpuE+w8c7I4+/lwPWLcTGYP9ND/aeCoX6B3gAKe2se96zS
         xGKhudposoGR+/o4t7jOAlRdjxemhkj+pgsJJXeqsfx50cu9HgfcSLRbaZpWm1PpaUMP
         JjHVsr9v7+Uzr884kWK2+Ufb3pleoVKTiCotyRbSsKS7m9PJ+ciE5u+UlKQpKUSVvvYe
         eepwcOXnyT0h7IR5q34UD6nbvzvtXJSRCEre0d83ULfIpUsRK8RBLBe8JMpn7mHsOEAZ
         2qzw==
X-Gm-Message-State: AOJu0Ywmdstn2bwn/ib1V42dDQy764ktprVzGnjQbFYu9yYfeyueGGf8
	oMkQo0WrmhfL8sjrtwy2rJOfOdG9y5F1M5LZ3M4=
X-Google-Smtp-Source: AGHT+IF1NciWmkho97Osh06LqOzOCri8BRjqBK2sd8J+QOMz1sb9PAAWTkFN5GXDLnc3+7hq9BRo+w==
X-Received: by 2002:a2e:84c7:0:b0:2c8:830b:e23e with SMTP id q7-20020a2e84c7000000b002c8830be23emr1671671ljh.7.1700829115895;
        Fri, 24 Nov 2023 04:31:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 06/10] linux-firmware: add audio topology symlink to the X13's audio package
Date: Fri, 24 Nov 2023 15:31:47 +0300
Message-Id: <20231124123151.1091665-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191189

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add new symlink required for the sound driver to find the audio topology
to the linux-firmware--qcom-sc8280xp-lenovo-x13s-audio package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 313135eaa236872e4aa5f698515a3363eb75601f)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 2d446848fd6c..800c621d6dd0 100644
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
2.39.2


