Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD05C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:05 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.3575.1652871535527207911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rfkxfq+Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id tk15so3032160ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mk1XMAXxyf5Xn2Uwb1fHW3EGLY4EN7Q/zV1sDw2gXg8=;
        b=Rfkxfq+Z6EYUR+q5xvSweDKBFuXDbzxBAAFIp3+1UyeqOOtViGrP4Xft2E6SMu7cEQ
         7NxrDbGiMKgem3t0zgKQnLf3OFkz5b8Qe9rxR/4hQGBfvOJhgHUu/HDky9npiCjgB9mA
         N6iO/eihFfXaPZoX6INJigAX1/xBCYlgD55USU5mpOg6WwMLh8qFwBTRG3CD1DJR0MxC
         gYzOROTzGwiNBaZh4DW5cwsHwknH0euN/wFqKdGq8hvVBR86sIH3vsoxcdyCfhGXb5ps
         vxun183NbBxd9h9ux522Tvi2+3BoXLHlwh9IrTSN2HUZ5R8Tgw/rYOgpmSptVfLhM/Tf
         VauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mk1XMAXxyf5Xn2Uwb1fHW3EGLY4EN7Q/zV1sDw2gXg8=;
        b=lU4XKpfKj90VnxnN6YIcvMUq5R8GGTnAIRg1bik5Sw+ATFgJJ3ibZVO+/bAeTmbV85
         snMOWz094Wz5kfwQabzhaHqwQj8gwYiM1vY6XBUPMcMUfxBv0n0ejkAfDPRYJE7rUj3C
         D6J/RxWiHo6Iz2cJDQMe6DVicxO/OX3OG6KkrfBtRifzWi/w4DxCAhqSoxZaZr0BG47L
         Kve+jFQ6zzOWQfSu8WXQNndJk5PpoNGOrKHAXZJtzaKIMtnm1zI7Pdf8ctQj915VigFe
         h6OFDGB/ZDIWuoY0dMJzIJpi5jZbYsudLYKrWo4xbheIQ3yCOZsKhz9t8wXhw4/S6jCb
         Q2XQ==
X-Gm-Message-State: AOAM533u9s1flzUW+hbUmvmeSTHJPV3XtmL29pEZdwGxRQlOsItqN4Pd
	rn88kV6Ypkk8CTYdam3xo+A/rGHRrV8=
X-Google-Smtp-Source: 
 ABdhPJyS7tWWO9c9XH0KRVgTAvoLgBgrH/MNH5xY/2up11Os+b8xydJ3iqcptQaQlBnezMIgGiBUZw==
X-Received: by 2002:a17:907:7283:b0:6f4:ff4f:1b6e with SMTP id
 dt3-20020a170907728300b006f4ff4f1b6emr23042474ejc.344.1652871534118;
        Wed, 18 May 2022 03:58:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/49] u-boot: upgrade 2022.01 -> 2022.04
Date: Wed, 18 May 2022 12:58:01 +0200
Message-Id: <20220518105843.3299331-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165804

Change to a tools-only defconfig.

Add gnutls/util-linux dependency for mkeficapsule.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 2 +-
 meta/recipes-bsp/u-boot/u-boot-tools.inc                      | 4 ++--
 .../{u-boot-tools_2022.01.bb => u-boot-tools_2022.04.bb}      | 0
 .../u-boot/{u-boot_2022.01.bb => u-boot_2022.04.bb}           | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.01.bb => u-boot-tools_2022.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.01.bb => u-boot_2022.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d366f10398..8fc33608d0 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
+SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 7eda6a0897..a8d7fab46d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "U-Boot bootloader tools"
-DEPENDS += "openssl"
+DEPENDS += "gnutls openssl util-linux"
 
 PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
 PROVIDES:class-native = "u-boot-mkimage-native u-boot-mkenvimage-native"
@@ -38,7 +38,7 @@ do_compile () {
 	# (i.e. creating a hardlink dirties the index)
 	cd ${S}; git diff; cd ${B}
 
-	oe_runmake -C ${S} sandbox_defconfig O=${B}
+	oe_runmake -C ${S} tools-only_defconfig O=${B}
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
 	# generating it requires bin2header tool, which for target build
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2022.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.04.bb
-- 
2.30.2


