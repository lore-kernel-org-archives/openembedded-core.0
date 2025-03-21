Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F2AC36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:00 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.21068.1742563553451455993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XXyqT1En;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ad1e75f49so1737837e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563552; x=1743168352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iToOKuBuSfo6pYT5W3DHUHLqyPFY5W8PRhcmQnKdR0=;
        b=XXyqT1Enj7Z1xnQbq7DxBUEFfViPRAyyA+KHrdPL23CpUHs4beQ3bGXua/R6/ErK1i
         5KQrr9Aninf8u8xjlgqo71jHEEex/605w3O7qXCf8S0Q3FD98TmzS1oSZ10R5oHHtLSw
         13XyDo+EzkJkdLB0o9fwxCWUCUfE+VcBQ9SvJALZ/tBJ2Z+yW1hP2zSKPgv0F1KG2HKq
         VfuaJlupuAf/MJSbtEAkYW9YcU8PolYXFYdx7+McTQ57dxp0JMjEX55euH3YAX8hPHj7
         hIwLpsDrs0T1aaPQAVj8dO31ZoWjmMDH+0ez0lsUS8sOlWSGlszyR3cDTTBE4w/IASNg
         Hkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563552; x=1743168352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iToOKuBuSfo6pYT5W3DHUHLqyPFY5W8PRhcmQnKdR0=;
        b=A3Zo2Pr5Uc7khfn1tlQCUduP4VftU5KNT9qHD3nGNZX7HWoOJC8jVjPQj+AH5tVqm1
         1Z7HSdtv6G/rPnPO08qefrStM3jSB246E8dBJ325WD06SA3410boW6t61CQEXYsManI8
         jUUTQKJA9MLpGnDmgDWj2j0Wp7A2+9GQzo3gYYzYBnmwXnt2RVFl6HlTqCdWj92ico/Q
         amvppQ0HegAyidisjpxikTkg/BTAUlLk0lHBQg31NaX5TZu/ZRv5rg37oWpesgriP1q5
         cwSwZ/KDgSBVEPu5bcGmx6JGqiH6GT4Fp+oKZbjucMCYB6pM+v5KgQfoflHyKOMFls1f
         LcRQ==
X-Gm-Message-State: AOJu0YxgsKq6dh6fazQrLwe9e+Gm69isdwUQeQHFBTTyd09ylQmmhmTw
	iRGNlqSx5kMHpDmZN9yRCnQMFwlV+8q5TXOfAQTcpYqnovRDoq8TkMLhjuSsL9TMAO/t0nJycbx
	9Xpw=
X-Gm-Gg: ASbGncswEpLbWjrQwJDejo4iumkt0fU/ocr5jUOm9t9T2UwnU2Lc/yn3WBprb0OipQG
	2gQITJViFx/OYkja7wO4HrzfR2xXt0IC+cF7KeX0CAcMDSRQG73gtEvdm0NfBkj098Oh3/gJXfV
	lDHYBQ6rNFxudbqttKTX0IlhG2qQG79HC2b+DIt4fjj47foso/Au82/mEpgVobKoxDLBx8Q9088
	XA3fcQCZxg4eSff3HSoUwbFfqk149bcdaasjz8mV1mgRJDvFW9WnDrSYa5qEh3Pu3Pa5LbZdITh
	JFbrCUeQgK65Z7OQAqEQsTcaO1iVexH6y7HET02aciLvhmOcS1nws0TYGaEjtdtM3aK87hVDnN7
	FgmPQTp8TO076hBoAwc/NJg==
X-Google-Smtp-Source: AGHT+IFrRVazdedQJ8BLHFwWopyr62JqBsgQpOHCF/LW6urKlX5NNUTLdIrc8HgYLrQLyxwKRf56ZQ==
X-Received: by 2002:a05:6512:220b:b0:549:8d07:ff13 with SMTP id 2adb3069b0e04-54ad650ca6amr1215125e87.51.1742563551548;
        Fri, 21 Mar 2025 06:25:51 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:51 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 05/11] core-image-initramfs-boot: don't install RRECOMMENDS to reduce size
Date: Fri, 21 Mar 2025 15:25:11 +0200
Message-ID: <20250321132517.670372-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213461

Disables recommends to only install important packages.
Disable machine specific additions which are meant for
full rootfs boot. For example on genericarm64, full
set of kernel modules and WiFi related firmware is
in the machine recommends and those are not needed when
booting to rootfs from an initrd. These reduce systemd
initrd size from 200Mb to 54Mb.

Since recommends are not automatically installed anymore,
explicitly add initramfs-module-rootfs, busybox-udhcpc and libkmod
to shell script based initrd. initramfs-module-rootfs is needed to
mount the rootfs. Installing busybox-udhcpc and libkmod
for backwards compatibility.

Not installing openssl-conf, openssl-ossl-module-legacy or
ldconfig packages since they don't seem essential in initrd
to mount the rootfs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/images/core-image-initramfs-boot.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index c66c28db76..99388476ac 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic initramfs to boot a fully-featured rootfs"
 DESCRIPTION = "Small initramfs that contains just udev and init, to find the real rootfs."
 LICENSE = "MIT"
 
-INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
+INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev initramfs-module-rootfs"
 
 inherit image
 
@@ -20,8 +20,17 @@ PACKAGE_INSTALL = " \
         ${VIRTUAL-RUNTIME_dev_manager} \
     ', '${INITRAMFS_SCRIPTS}', d)} \
     base-passwd \
+    busybox-udhcpc \
+    libkmod \
 "
 
+# reduce size
+NO_RECOMMENDATIONS = "1"
+
+# don't install automatically, pick manually instead
+MACHINE_EXTRA_RDEPENDS = ""
+MACHINE_EXTRA_RRECOMMENDS = ""
+
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES = ""
 IMAGE_LINGUAS = ""
-- 
2.43.0


