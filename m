Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A056C36012
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:32 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.33401.1743020971221373086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dw30+9eR;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301493f461eso243085a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020970; x=1743625770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ww4HpLpX5Qc7NyG2CA8v4jYwrqhvFC+8mW5atIvP4z4=;
        b=Dw30+9eRjTgtBAC9Fndm2jQp5QdmYxYGXyC37gbVy8r5Qw7UaoFI4HQpy+4Zde85cu
         IrCQAznLKT1o4IWQgCKWHX+w7YtjJmKiXHKL4+v6si/ZhJWQJp1bYoy6sRj6pNnDpQLP
         dj45VoDpmQRC11hhnmdVfQSGA87gJST9AXe/T80CabtoC+9+PpnwT5B0/eutpHUasZQp
         wucZaEO1jsPUG3FJH2SIhbKLQj1RcoIHNSofPeYDMjpy0COlHYjl1QZ5XdPyqfmauUqK
         ufSXwYSKSL7bSTnLrxE+C6qRgmV8WKu2E+HMpC2l321N5ePJYeSrB0WcETAuxk8C71D0
         5xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020970; x=1743625770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ww4HpLpX5Qc7NyG2CA8v4jYwrqhvFC+8mW5atIvP4z4=;
        b=Y2Khkt9SlquTgB6/2n6d7HIRcNMpPLaxMVyaNXVLlq2RAMv6zsYU9Xyil2YogTiARe
         20fCwbS6aZN15iv0+D1XBAzvUbut8WvpTuioAV42tRBzVVFpcTOqSQGtLnfE5JvJH17D
         3bylsdostuDt/Jh69QKqqsj1sUl7JAkgKsShoNEw6XRdOpgNkWhq4YPF+GTA1rQMwpwb
         tkjxeMhSp9DSL+Nn6xdixhjf4H5HB4aEAj4KX7KIr5ucn9MjufGIRPrLgI7U/mdatRAT
         vaamsVekQOa4bCOhwSJA/WaDcQ9N8t6FfNkl4jKyfCZ2OyVUESm7aQRvQ8jkyi22ggde
         9Kbg==
X-Gm-Message-State: AOJu0Yx+ZlxxkU75tlH+QY6bV2GhiQvZfeAztRDQFlops/QS7Lq33LEb
	qP0YDlSyf3PbbAENcFHb0TZos4d1kCGwtWrZxqo7knNY73OjzMNFEA6qEifx
X-Gm-Gg: ASbGncvaOrEExvOMws5Q2Xj4kCOaGOlpAuuJzYsvNvyKrNr8hFi0nAFl/GxXaMtxC6H
	hhcMjiR+osTnjGRMSWnXlh4M04q4q1h/T2YxerEykfLvpfnQIa61ymYkHuU5y0hEidOlshTHF+x
	2fpIf/s5k+vn7g/4FGalHr932Bbb7eM65ymbKk6Iix6q6qIRTf/PnxuA40orOLgDAspZB05ZPPD
	3Mp3p+AO09Gjv2BFNWXu454UMmkPRtIiRuZyA7pUnnO6x/Uvn1fMerAVgGg0+LWG8Zzfn8LYrxD
	b/2sDI1tLCHJ3uYK6jZtlTH++80fAOaXAKavK30nAO8ibyP9xm8Sm8o6ql0DeXwhm3DfnH4m+Yx
	uCw==
X-Google-Smtp-Source: AGHT+IHVyeVnkMoSiwWvSviMYWpRmy3FXorix3xvj9DUJhLeFci8ItGao/iwGvT7FHjLvxovvzAk2Q==
X-Received: by 2002:a17:90b:534d:b0:2ee:44ec:e524 with SMTP id 98e67ed59e1d1-303a90718c9mr1507755a91.35.1743020970349;
        Wed, 26 Mar 2025 13:29:30 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:29 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 10/31] linux-firmware: RPROVIDE qcs6490 firmware packages by qcm6490 ones
Date: Wed, 26 Mar 2025 17:27:56 -0300
Message-Id: <20250326202817.64437-11-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213670

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Qualcomm QCS6490 is a modemless variant of the QCM6490 platform. These
two platforms share most of the firmware binaries (except the IPA one).
Rather than providing complete packages, include compat symlinks into
qcom-qcm6490 firmware packages and add RPROVIDES to let other layers /
configurations use qcs6490 names to install qcm6490 packages.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f02df4eeab69d3254bd7cfd3e2ced7ff0375091)
---
 ...om-Add-link-for-QCS6490-GPU-firmware.patch | 31 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20241017.bb | 12 ++++---
 2 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
new file mode 100644
index 000000000000..7a07ef97f114
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
index 97e89b52c27e..708c28b63205 100644
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


