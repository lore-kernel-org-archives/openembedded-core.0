Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE38C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:35 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.14279.1664301265925241863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ipSJQRTM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id gp22so731320pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=CzNtAWoaTi7jkv9Jde2ZYQ3crzBfRb3F/PbGARRvhFQ=;
        b=ipSJQRTMB48HQ9zgjFULdpfrFT+Cg4YztwW08zGvNAQQMiT3Aaab/67gLCQoPlvID7
         cM6ecdbVgDotc2tCia4Ad+R4TV/wBMh+khwf9yhqfrCoKMCzdd6T/iwDoGMxuB46DmNL
         EAm+2BEkH3byc6h63Lvk/VMlQb0L6s88OjnC6NcFkUa1S18cQFLbLy1DgVL0C9336G72
         wHiW8sxB9vLh1LXToGK4n4YBldXe2HCun2nVsWZ3Jp7umpmlQQJjzdc3YKCpAiSABxUQ
         ssgKFn59RYl6NV5kY/ZN1x0GOGFxnc9AfJzIXIIc16+pOO3sWIQte9mQsawVWf7wKR8I
         RBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CzNtAWoaTi7jkv9Jde2ZYQ3crzBfRb3F/PbGARRvhFQ=;
        b=1m5yuFosjorjdPLAwUKv2PqTE8ZqInUwQGFdxUzLeW2+0uZodFryCJHZLHu7oV2u0o
         JOJqgfPEb7huXJh7CAX71eKnBLpg2l0vbuqEV9d0Wz6qkE0GUE3Ug1DdXm98FsvprRR9
         unr4JemqADwaY0NlwbNUIO14DlqZ+OKR/aF1OXjiu5LRXtGRRTJGE/HFh2AKcZS55tZh
         Yio+TM2405m55BbGMvfuBA/EKnMS/Ur9Hfg4Fcqqyezy9+aol+4GntTbW+KPQgYhOJrC
         AeUEBWu+YG4az3Dc2G4zCnl/w6L5ZJ536Csb7n/72vmcPGQOJi+y6wDSGUHQw3QEW/RM
         U4VQ==
X-Gm-Message-State: ACrzQf2JozlfNIp0UMsdOP8eZyJ4mMrCVopwnBAKn69cz7ryItpAvCGd
	GRnLtHsMQqK6SwJ+ZjnL2nQya1gTYJ2+R4/O
X-Google-Smtp-Source: 
 AMsMyM4kXID/D6ACrp178k/5/HLIjObZV5baqINCq6ar/iAV0jJE7+BNlZFZiY1tnsiKGQTMd4n9Kw==
X-Received: by 2002:a17:90b:4c0a:b0:202:54cc:6d5 with SMTP id
 na10-20020a17090b4c0a00b0020254cc06d5mr5708031pjb.121.1664301264928;
        Tue, 27 Sep 2022 10:54:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] linux-firmware: package new Qualcomm firmware
Date: Tue, 27 Sep 2022 07:53:59 -1000
Message-Id: 
 <6227efbf03d2e7ca773ab29177705203f2550722.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664301116.git.steve@sakoman.com>
References: <cover.1664301116.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171122

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add packages for the new Qualcomm firmware released for Lenovo X13s
laptop.

The INSANE_SKIP:${PN} has to be provided to silent following warnings:

WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af9924a3da0569e90c2d3abe030584456e66229b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220913.bb | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 52ea8259eb..2baf4bbe49 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -311,6 +311,11 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -972,6 +977,11 @@ FILES_${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${n
 FILES_${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES_${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES_${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
+FILES_${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
+FILES_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn"
+FILES_${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
+FILES_${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
+FILES_${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -992,12 +1002,21 @@ RDEPENDS_${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
+RRECOMMENDS_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS_${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS_${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS_${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+
 FILES_${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
 # For Amlogic VDEC
@@ -1077,3 +1096,6 @@ python populate_packages_prepend () {
 # Firmware files are generally not ran on the CPU, so they can be
 # allarch despite being architecture specific
 INSANE_SKIP = "arch"
+
+# Don't warn about already stripped files
+INSANE_SKIP:${PN} = "already-stripped"
-- 
2.25.1


