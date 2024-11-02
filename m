Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F1CE6F09C
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:23:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.8386.1730506986228941191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IdNNEn5H;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e690479cso2653571e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506984; x=1731111784; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV62BYCQSZwzq13pYR8capOPXJ/ZoQrbQ+YeC/c+aRc=;
        b=IdNNEn5H75WsMYDqbnPlf2264mNueh9hazGAV4UtW9m5rnLNT7I/FnFDCEFHYK8IrW
         cQU9QaBn6P62J/uNEZRjuZ9dGFlVESCdY+o4WKh490BBpnnSKfEVERLlKsrg8PVdB4Sq
         VSyCqP6/pLvbbDhHdZeFIVLku/djKYZvbv7jCYIJKpSPY86KBiQoVkN8sT2IMLVYL3rs
         cLKdYyvGCiYhlQMzMAFE8LwR05sB+3mVKgzuw8cARgKOeA6gnEGcsfGS3sqtOL3ulEww
         i3UWFB6vNyjJVLMx3xHkBwgJiACodAu1okNJE4BeMdMOadl/rd1igZJCZQd09+WV0Apc
         s45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506984; x=1731111784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV62BYCQSZwzq13pYR8capOPXJ/ZoQrbQ+YeC/c+aRc=;
        b=tpzHiQkLSds+byorhh4V+5ykyeE5IS12zXxK6L1zX5NXfTXP/+cDym0m2qEjOCDzQc
         HejBmH3Q/zRIjUaLELPsaV24qhD0X5yI3qvPGrwRv+fl6lfi72d/G3IeFj497eTy4b1G
         5dwohbIlyoH5N8F+uD2VkLf1yqAM0SBHTSZO+KC0cioDSTNfpv/Cc3zsE23KYQPwIGkc
         Gf0SqQkvL+F7fIvRHuc19JHO9++PqQTS+uGsiwE98yPkOB0q34PSVgS+cO0oLEboqgcW
         DEDU6H/7C/CY2Vo8PfuSE76fx/mkn4qDi7ydtDlI7R4FJgY14joAKtUuN8g03cWdr9SX
         8sxA==
X-Gm-Message-State: AOJu0YyVLOYqNI2YOWF3WLR8uirEWH54LAtkc/ZmPOq57KQsL/fNXKVW
	y5FIB5AeV9GwPLR+hc8a0UYzxj/DU25t1nZCVGbbaneEwFv3BL7Bj2alJGSlyl4=
X-Google-Smtp-Source: AGHT+IG8dBGYfbxgwdGTxpFth+X2lxfOqxmhzHSlwQvkTCzlFGAP9o/O5QabVlIdQmA8hLYg6fnC5w==
X-Received: by 2002:a05:6512:1046:b0:53a:1a:cb58 with SMTP id 2adb3069b0e04-53d65e11ad3mr2323188e87.44.1730506984261;
        Fri, 01 Nov 2024 17:23:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 02:22:52 +0200
Subject: [PATCH 6/6] linux-firmware: RPROVIDE qcs6490 firmware packages by
 qcm6490 ones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-fix-qcm6490-firmware-v1-6-3465b5c9136d@linaro.org>
References: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
In-Reply-To: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5445;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mTciez//H/m9Ufa0DqmG9NI4mIYXZbRga44Tnsy+Img=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pqwa2ueznFisZ3m0VunJA+onV6c9Z/xvXpjUd70o+rL
 N4n89Sjk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATOcDK/ot5s5SA0Pm1b68t
 /bGS71oGl4BloM6/3i+fNrreiLZgV0uIm+h+MUvzRd+qrdZ+9zs107WSrE4EtlxxuuTTJvXtgxh
 vM9MGzg+podE7zyqwa0sqqEQWsp/wKKnT2yXkbaAkHpU3YXJuw3Su4ikNu6snP2BdtHb/uqXHsr
 WruNZY5W0J8zykH6f9zrXM7wqTaJuzuNmqV8tkoky4/upza+wP3lL37unBr30f7pRoaOzf6DRB6
 X3/7Tyh1f+swqR/3/iyI0b1s4bpjQx3jwX6CZ/OlWlFb+0I1Vif2PDqGwtvRMT9Dg7Jval7dsYc
 jGo4kOWVZmSUlr/nn0PdbMvbZ89mrl4WpuW3zjw8JOMJAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206648

Qualcomm QCS6490 is a modemless variant of the QCM6490 platform. These
two platforms share most of the firmware binaries (except the IPA one).
Rather than providing complete packages, include compat symlinks into
qcom-qcm6490 firmware packages and add RPROVIDES to let other layers /
configurations use qcs6490 names to install qcm6490 packages.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...01-qcom-Add-link-for-QCS6490-GPU-firmware.patch | 31 ++++++++++++++++++++++
 .../linux-firmware/linux-firmware_20241017.bb      | 12 ++++++---
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
new file mode 100644
index 0000000000000000000000000000000000000000..7a07ef97f114101b34115ffc255cd36a1581a877
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
@@ -0,0 +1,31 @@
+From 62fa39d0b4384be8f14d837ea79183ad93d0996c Mon Sep 17 00:00:00 2001
+From: Akhil P Oommen <quic_akhilpo@quicinc.com>
+Date: Fri, 1 Nov 2024 21:52:24 +0530
+Subject: [PATCH] qcom: Add link for QCS6490 GPU firmware
+
+Create a symlink between qcom/qcm6490/a660_zap.mbn and
+qcom/qcs6490/a660_zap.mbn.
+
+Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
+Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/ctvtlkh4t54wdtwcw3jnbyi7xwks534k5ksvjtv6pt2zrr72wn@h5k6vfk7bzqe]
+---
+ WHENCE | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/WHENCE b/WHENCE
+index bdee94fe33fc..b7ef9bdd5b59 100644
+--- a/WHENCE
++++ b/WHENCE
+@@ -6145,6 +6145,7 @@ File: qcom/sm8250/a650_zap.mbn
+ File: qcom/a660_gmu.bin
+ File: qcom/a660_sqe.fw
+ File: qcom/qcm6490/a660_zap.mbn
++Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
+ File: qcom/a702_sqe.fw
+ File: qcom/leia_pfp_470.fw
+ File: qcom/leia_pm4_470.fw
+-- 
+2.39.5
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 97e89b52c27e144f74f8eac22851a6c0bc7c929b..708c28b6320591bb361c0e08ae47a1a3040a5f6c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "f82849fb6325a8a14e21a4feacc5ebb0"
+WHENCE_CHKSUM  = "7dde9aa13fc4707189ecd7d35ee94d92"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -240,6 +240,7 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -1504,9 +1505,9 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
-FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
-FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/battmgr.jsn"
-FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
+FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/a660_zap.mbn*"
+FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn"
+FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
@@ -1559,8 +1560,11 @@ RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-license"
+RPROVIDES:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-qcs6490-adreno"
 RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
+RPROVIDES:${PN}-qcom-qcm6490-audio = "${PN}-qcom-qcs6490-audio"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
+RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"

-- 
2.39.5


