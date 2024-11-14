Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9017DD637D4
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 17:04:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.43.1731603892198327492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 09:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X9UGvPZk;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so9200191fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 09:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731603890; x=1732208690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I840g7/ZBqDaJH/8K4gH7XEPdgiNACi1XgAydVwRMZM=;
        b=X9UGvPZkoFQH4ZZujck/YqrbRhgtNAVV5DhNPvW+GCdftixOD6VKl8HdhczOagOR5/
         5+pYMr7gMcYHodkg9aEmCpFvI0Q4zZkdPHAE3XJ455mfyd2yr51i4G3xrWcchVQjrImn
         LlOSamWZj573jlqPxsMYRAN+qSfO/Lj4ku0df2wKW0jGDHbYgqMjN76jWwnuzUX2Ld4s
         ugLI1ghushi/6wP+iCr+31wxjAbU/Q16emc4SUMeM77iIDW/PB40RnNm+HB6LMhIaj8G
         CvnxMu7mhIjbPLu4NxZkHqelD6pXSpYzVInovdZUHsO3pxY8rq6BR4EWmNxvTvlecn0m
         mGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731603890; x=1732208690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I840g7/ZBqDaJH/8K4gH7XEPdgiNACi1XgAydVwRMZM=;
        b=JlX/XOggKqUtoXBbL5OY3WcZ1fWAcdw9739+sKkcbuX26IIsRcl1ucALeEjPDXL+LM
         xUQBZyxOLlEtswFy9Nc2MYxIFm2bT3tmLemA1ysno8mPAaXOZn0qEPs/i/MDc/Vqc+oo
         Y1MIkEdRZZiZv6alL6j18PHfwor5+LEA2SCBxN4fyzj8AJ336eECAqOF7ZvRZiOk3i4X
         0Mv9TcMj5EKgWlUxzrisUjOkMeRiq5Cf4tHxH5HwaOsFWLsTiUzkPgHDFjsKh4f+L+xg
         MNvvSJA4Jt3qo2juw2JShiWWmieoKHJL6BmU1XjdDDmCS4WAx+EIIqkHvA/nV9ZW+E4n
         SkcQ==
X-Gm-Message-State: AOJu0Yy+vXPa4bzvVztvxStb2JPVgF5pqaeW6zO5rSTTeTwopwTlU7uu
	QIMRlNTS6lAb/ifzCRD1DaZj/xN7vmWZ0GPoOsUDHzgnwjv/dltQMT3NFc73qAonPo+4eZFsxsM
	9
X-Google-Smtp-Source: AGHT+IGBKleI+O1DtNtdQE6QdTZR32XchjUSXkR/uh3NzfHBDfmT5DEah/yN1haZ0Khg1UWfiFZwRw==
X-Received: by 2002:a2e:be20:0:b0:2f5:11f6:1b24 with SMTP id 38308e7fff4ca-2ff201b3185mr127543691fa.18.1731603889757;
        Thu, 14 Nov 2024 09:04:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff5977e038sm2336891fa.47.2024.11.14.09.04.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 09:04:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-firmware: package Qualcomm X1 Elite audio DSP firmware
Date: Thu, 14 Nov 2024 19:04:44 +0200
Message-Id: <20241114170445.3092435-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114170445.3092435-1-dmitry.baryshkov@linaro.org>
References: <20241114170445.3092435-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 17:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207174

Package ADSP firmware usable on Qualcomm X1 Elite CRD and QCP platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20241110.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index 6475277a079a..daebdca13273 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -424,7 +424,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
-             ${PN}-qcom-x1e80100-adreno \
+             ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1472,6 +1472,7 @@ LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1532,6 +1533,7 @@ FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmwa
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
+FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1589,6 +1591,7 @@ RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.5


