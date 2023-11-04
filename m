Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFCBC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.16952.1699127829119232237
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OZY/prOP;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so45319401fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127827; x=1699732627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v33U6bdm+ANSnJCEPbzUAoTIDnUmCAbGTDmWOnfEUEg=;
        b=OZY/prOP1tmp+tGJg5PUdCDXVHryM2AYOof0i9hpU8vWECKxn2qmQ8gvxijPaYh++Y
         Wes/DeYnl2hkOM18mn5NNr91FqtsDjYCjt/7DwXg/r/uoh3BScsUZGAL5P+o4Ydy1ZlX
         hD+vsQBJ85z0dt9GMGjh1viumKI77wN88lzpr6D7CX5vwY2gTVTFtcpRKlLN2lYLsiqX
         McOGRUkTfFhVZGnyKXU7lSjIYeyfzRbKYLECs1qPAeqk/F/RKOjUgpy953ah9ellZDUE
         g3gicRhzxCdYQhdfGkzIkOvvXMQ4BR57TMWuPZ3l6cr6iqhpNuONwGSq4+AubRhgtHFc
         8pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127827; x=1699732627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v33U6bdm+ANSnJCEPbzUAoTIDnUmCAbGTDmWOnfEUEg=;
        b=pjRvSDVhgWyj6kW9sTEjvx2hNeipKfvAdPH8EBC0/N/AdV9pYtTUcoSAGl3e7t4pT2
         uCcifCBNNXwIi0ZWG4dbZNKlUhasLT/aodjakJSkKcTumqNcBa9ni0ytVAjP29Qlz588
         1NsPdtjhQ3VyOX3VKscNTisUVWfpq4QxltHV52EfLoDEXAoCGY8Y/v4W0U80tVVaM17a
         dZxBaX0rX58dVnQrwFFh55A+Mx69s86WrABSnHabBE4ryQaqXvDlEWaW4EaRiRkciVDd
         vkOqdPZobKvTapYjwVPtcs3vdu6ek06vW1PLIxnhrFNUJ3xxrMZD6RAq/sgG9cNBG4xT
         Ug6g==
X-Gm-Message-State: AOJu0YzEssNLtfnofhmpXiWoRFJYW382BmQncYOSRhKnTksGkzz1nSoO
	1lwYs2mf5TjqTlbQOOjjpV3/GuqkadDp4rlUE2o=
X-Google-Smtp-Source: AGHT+IH2C+tzjyALx3+ik/AE75Y2VjrjQAcZGH8Al0d+ir/nYsocuw0+8/mRS2vnWH/+2IMh72vBAw==
X-Received: by 2002:a05:6512:158d:b0:509:4d0f:da88 with SMTP id bp13-20020a056512158d00b005094d0fda88mr7349269lfb.0.1699127827121;
        Sat, 04 Nov 2023 12:57:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-firmware: add notice file to sdm845 modem firmware
Date: Sat,  4 Nov 2023 22:56:58 +0300
Message-Id: <20231104195703.18923-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190176

Follow the upstream change (which moved wlanmdsp and notice files from
ath10k to sdm845 dir) and include notice file into the sdm845 modem
firmware package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index a4e154d4680f..491662de37e9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1358,7 +1358,7 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
-- 
2.39.2


