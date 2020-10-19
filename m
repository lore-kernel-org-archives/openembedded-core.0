Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.7976.1603148853997662750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 16:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fVvUNQkb;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id ce10so1396412ejc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 16:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcYlmvJiSDgQ+V7DJ+pl9Zxwn4AnYPTeA3ciiF8ezb8=;
        b=fVvUNQkbJCC2Mlw3vb8yRBGDuyQFiYhbMj1Tg4zQ1MM3bMjAjQUYv0SID+vn47oxZ7
         /efR2lDSLuDLDE9Cq4xDnXKweIF+2deCWuulfP4EpUOO53S4LOqWK5QuK5t58FJ8yBFy
         8HaJemJHCoRR4j1bnE89Q7IWBwZNle9+9PzSR7GVX/Kkh5fLMjCKc3fOPcbjoNOOmaHL
         3nS40NFqrtv6Ab7rfkwYiv3sXRtwLQ1ITMbfXhqkpl9Yua67A9c8M7BSLKKO/0Fjqg5+
         VbaCLjhaJst9oALKPRd+CZAfROmNijaKuZ4w9J2iPcLOcjKZXetsX1BH6VAXF5olXYS7
         nRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcYlmvJiSDgQ+V7DJ+pl9Zxwn4AnYPTeA3ciiF8ezb8=;
        b=lpmw7OeFPiDIZ9Pp/DpvAD1/7tOqL+HZVadPAfmd//19GUNfIEgCKAtNSuB28yTu30
         ioTPZSvdn4cU5GKhHdyARSwzdi41qfS/djE+jTlz0qMg94cqYBNvvDnLEMsUyBZ1bzvY
         jRHEXrgt+LQYcH5gdYhO1l7eT4T+Uj9REGIiLS7hPIbRyJV0vBXwWHpR8TgF50yAPy9B
         dU8iJ7egF5u1QNwgs1lV8YyOAhfMHh03Qzw8UXfERCkd/RRpSW7jOZwZRkC+MJ39wj7n
         SpCU4N4Urdh0Hl+jR6CLGyrh5ty8G/xD31bef4DgrLvzoFUtr0iIXA6YzHNPsxsZJao9
         Epcg==
X-Gm-Message-State: AOAM530H+ejkz4QCxHiN2FSC+CJxzTG7GigkovXN1/IbzwFB2Z0cyjoD
	pLHNZSLTrVZQCPZt+b8Pn3eaYG3RO2c=
X-Google-Smtp-Source: ABdhPJxeE+xA83lDTIOSAonahaNsuBe/UZGNWKkUHB6R+ayB+1s/HRcjQ9iqtIk1tdtNuga6yxXM7Q==
X-Received: by 2002:a17:906:375a:: with SMTP id e26mr156629ejc.463.1603148852141;
        Mon, 19 Oct 2020 16:07:32 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id k9sm1765183ejv.113.2020.10.19.16.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 16:07:31 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][PATCH v2 2/2] linux-firmware: package nvidia firmware
Date: Tue, 20 Oct 2020 01:06:08 +0200
Message-Id: <20201019230608.47668-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019230608.47668-1-max.krummenacher@toradex.com>
References: <20201019230608.47668-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add packages for the firmware required by the Nvidia chipsets.
Split it in Tegra K1, all other Tegras and desktop GPU packages.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../linux-firmware/linux-firmware_20200817.bb | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 3d6644e504..0abd28c9fa 100644
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
+FILES_${PN}-nvidia-gpu = "${nonarch_base_libdir}/firmware/nvidia"
+FILES_${PN}-nvidia-tegra = " \
+  ${nonarch_base_libdir}/firmware/nvidia/tegra* \
+  ${nonarch_base_libdir}/firmware/nvidia/gm20b \
+  ${nonarch_base_libdir}/firmware/nvidia/gp10b \
+"
+FILES_${PN}-nvidia-tegra-k1 = " \
+  ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
+  ${nonarch_base_libdir}/firmware/nvidia/gk20a \
+"
+FILES_${PN}-nvidia-license = "${nonarch_base_libdir}/firmware/LICENCE.nvidia"
+
+RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
+RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
-- 
2.20.1

