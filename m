Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web09.10068.1603100333323955284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 02:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zxip2VhI;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id d81so9627992wmc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28MZTI9d/x75FpBv7/RHzTk8Wmvw8IWiWjj3iGO1PhY=;
        b=Zxip2VhIyoEAjqDttvqMaxDYA3T0HBedKoJZW5K6IwJLYeQyccD8b+u726az5Jung2
         KRaimUdqBLKKdl7fzvKJdFrnbff5c+4y5UgIxICl5DudWIXEFpVoI6IOdfY5Horj/3Q7
         gHu/YQyJTYytWW3XLgVe6GdAo4dIV4Zqyxj5JqQpHJyvHGrd44kX69wFulttvS3sCzQm
         uIc7gdlkaPgvnvzxB35fN772l7S2rhAhQAfhLkpdb2ZZsOEIU9GWLquWLgxQZ4kRuSWV
         f/bi0AcsxpLE1sEC4s16SRwn8QDCtAFymiUhpf44Q0XdK4nynH3n7aWiwPsK3nD1x044
         tMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28MZTI9d/x75FpBv7/RHzTk8Wmvw8IWiWjj3iGO1PhY=;
        b=MaDXYEFNFTGMIhQTFYtpgXAdcfAvZyMtF3ioHKUKZGCGX/xtoQ1v8bDlUJoy7MqE3q
         zES/OqIGVQ95GzwEfXt7oYq3B17mYEr3PU0eZgzRpcSY+TTD1yGi27AuGUyuSE3SrT7a
         Ax+p6XL/UkV2bm0DR8ACJb/8PJtgB81gmeKzlQVYg0mfFZ5BFVAWWlIwaDkLY2vixYWF
         WC1CVzHrhMryOQYJ4zh75MllAo6Z6FaDOyo5i4/3DyqqPx5bR8sMT+OpZHUS06Etiv4c
         FMVgnl3/0d5uVewOaZZFItkdtC5ua9nX4x10VocrzSEZtexHQwF50eKZGnsxV7sVcWJ+
         mW1A==
X-Gm-Message-State: AOAM531FdKoyOH7HK383/bN4aGkk9570VehfFYZu91AFOQnv+uL3/Jjc
	U9A6jSUAUDWVxBi76J5z0ze+ucPvL6U=
X-Google-Smtp-Source: ABdhPJwmoZt5oyXgauW4Rq0cQqbzlnULpfihFLeUTgYs0GaK4/J6b8O4EPb9POc5TgwYIKe6VOOMLg==
X-Received: by 2002:a1c:4909:: with SMTP id w9mr17601715wma.133.1603100331461;
        Mon, 19 Oct 2020 02:38:51 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id v11sm14700081wml.26.2020.10.19.02.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 02:38:50 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH 2/2] linux-firmware: package nvidia firmware
Date: Mon, 19 Oct 2020 11:38:01 +0200
Message-Id: <20201019093801.55488-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019093801.55488-1-max.krummenacher@toradex.com>
References: <20201019093801.55488-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add packages for the firmware required by the Nvidia chipsets.
Split it in Tegra K1, all other Tegras and desktop GPU packages.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../linux-firmware/linux-firmware_20200817.bb | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 3d6644e504..5bb27c51c7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -288,6 +288,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-liquidio \
+             ${PN}-nvidia-license \
+             ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
+             ${PN}-nvidia-gpu \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
@@ -478,6 +481,27 @@ FILES_${PN}-netronome = " \
 
 RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
 
+# For Nvidia
+LICENSE_${PN}-nvidia-gpu = "Firmware-nvidia"
+LICENSE_${PN}-nvidia-tegra = "Firmware-nvidia"
+LICENSE_${PN}-nvidia-tegra-k1 = "Firmware-nvidia"
+LICENSE_${PN}-nvidia-license = "Firmware-nvidia"
+
+FILES_${PN}-nvidia-gpu = "/lib/firmware/nvidia"
+FILES_${PN}-nvidia-tegra = " \
+  ${nonarch_base_libdir}/firmware/nvidia/tegra* \
+  ${nonarch_base_libdir}/firmware/nvidia/gm20b \
+  ${nonarch_base_libdir}/firmware/nvidia/gp10b \
+"
+FILES_${PN}-nvidia-tegra-k1 = " \
+  ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
+  ${nonarch_base_libdir}/firmware/nvidia/gk20a \
+"
+FILES_${PN}-nvidia-license = "/lib/firmware/LICENCE.nvidia"
+
+RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
+RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
-- 
2.20.1

