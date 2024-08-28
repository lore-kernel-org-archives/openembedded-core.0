Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762E4C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 06:19:50 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.7091.1724825981901571527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 23:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yF2gaTKg;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso8271173e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 23:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724825980; x=1725430780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6FReERk9hZkGnsWn1LrWKo1UZjTJKhiKqH0lv2jkfQ=;
        b=yF2gaTKgxLQd8gSi0mmtr6eOXExcWUz7ThB5uHwD5FRXmXH1PUSDiZ3mA2hhjpyYAR
         Ayl1AvNG7UixDe07NhRyZO8sf2UKCbhG9AHQbaA9LnX3uja0fTGjgca5MU48t+wqraVa
         6zn+7JQz/sWuHYHQ+S4GR/jGJHMauooeHIpkT6UW+q5+HPQvNaR1UOxPW/A2fgVh1uJj
         lVin8n73EBEZoHmFvm/7UiHiDiLmTp/Rz6kG0Z8W6qhqkPffBvJxUhy0qWK08o8A8irD
         XhDAsuazrjnkt8jWhsbrUY4qqLGdcyWg3Tq7Y86fdNVOHmCPcg/Pn5M8WA74HsgN3Yzn
         XLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724825980; x=1725430780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6FReERk9hZkGnsWn1LrWKo1UZjTJKhiKqH0lv2jkfQ=;
        b=lX8DJJ2RzLqqpa+ce+keatTGmxgcKlnpDz6b/11YkTzhj2MPFax5+3r/8AF9V1cWtB
         B/HA1Oe6NxJ1wRHGQAG61sIimdyif9+B1E3gghheS4NJw4pS15dxI/638vuzubpEqrrZ
         z6x023F+MxlFwTiEzK/oIahd0WMzBrxigT8KHG0uPFqjFBkkQPioF2V0DN9RAhMRQtak
         92jewual3WV7LcoaIph7ggPM8eW40qQqCKUnwzKe7xmhI4zUIf22BeALR3eGJnFRCDw0
         mhtOKdC4KeGqX2iIqBRTUXlg2RM0lyXL2OCOTgqlnApRMErNgDZyW40xO4j+4TVkKEfV
         8SVw==
X-Gm-Message-State: AOJu0YwoZOzxSr6p36AWoE9SUA+RGJx07MGsFHKuLKXAMNtitsxgdASu
	1IeAmJwA7V1QkBThT8FMuc7g8IQ6DAY5jjv3/0X33zXdv64cCnhpopohElewVMneD/KYo9RW9jY
	8
X-Google-Smtp-Source: AGHT+IFf8mzfscssGxl13EBlYKlebB179Qqt8sHu7Acid4d4GAXl62SzfD1BaXAMjyz+AQzgXbA8QQ==
X-Received: by 2002:a05:6512:3d8d:b0:52c:6461:e913 with SMTP id 2adb3069b0e04-534387789bemr11198519e87.16.1724825979167;
        Tue, 27 Aug 2024 23:19:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5942bsm2048058e87.123.2024.08.27.23.19.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:19:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] linux-firmware: restore qcom/vpu-1.0/venus.mdt compatibility symlink
Date: Wed, 28 Aug 2024 09:19:37 +0300
Message-Id: <20240828061937.410739-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828061937.410739-1-dmitry.baryshkov@linaro.org>
References: <20240828061937.410739-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 06:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203868

The commit [1] has dropped the qcom/vpu-1.0/venus.mdt symlink which is
required for the kernels before 6.6. Pick up a patch restoring this
symlink.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/commit/36db650dae038be945fb04def591fc726255b09f

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...-compatibility-with-kernels-before-6.patch | 35 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20240811.bb |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch
new file mode 100644
index 000000000000..b1cb5d1f0bea
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch
@@ -0,0 +1,35 @@
+From 4728fcc52fdf311048f41766aa27cdf5a4a9e7ad Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Wed, 28 Aug 2024 09:01:14 +0300
+Subject: [PATCH] qcom: vpu: restore compatibility with kernels before 6.6
+
+Linux kernels before 6.6 used qcom/vpu-1.0/venus.mdt as a firmware
+filename for Qualcomm SM8250 devices. Commit 36db650dae03 ("qcom: update
+path for video firmware for vpu-1/2/3.0") moved the VPU firmware, added
+the venus.mbn compatibility symlink, but at the same time it dropped
+the venus.mdt symlink. Bring the historical name back to restore
+compatibility with kernels older than 6.6.
+
+Fixes: 36db650dae03 ("qcom: update path for video firmware for vpu-1/2/3.0")
+Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
+Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/20240828060831.34519-1-dmitry.baryshkov@linaro.org]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+---
+ WHENCE | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/WHENCE b/WHENCE
+index 06c3c6fff673..4d9cd340a9dd 100644
+--- a/WHENCE
++++ b/WHENCE
+@@ -5974,6 +5974,7 @@ Version: VIDEO.VE.6.0-00049-PROD-1
+ 
+ File: qcom/vpu/vpu20_p4.mbn
+ Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
++Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
+ 
+ Version: VIDEO.VPU.1.0-00087-PROD-1
+ 
+-- 
+2.45.2
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index 3128fc3a4e8e..7a9c2b2b238a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -156,7 +156,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "60b5abcc986d1660637e913a87e1413c"
+WHENCE_CHKSUM  = "5d402bd7c43dd2c2835b81bf872aa127"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,6 +237,7 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
-- 
2.39.2


