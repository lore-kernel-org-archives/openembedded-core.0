Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60294C4167D
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.7373.1651727158306038902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CxgWQTFL;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g23so3887368edy.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zpwl5Hid9CGQ1ZnOln/rmrV81IIrU8CNkLgQA0Ogdr0=;
        b=CxgWQTFLqmvH7yfVurtnqKc3+6ULRG8zxjfBMms/YFzRKd+gtm8V8jMJRLTX+VUXPE
         +2jhESDD5O/pqwmBQ+0pYASAX1z9DCetcFi3BVxThsVkLZe/L5+gRR8GqPQODBJd7+I1
         mBQtrFpk3xs/ePA85AsH+H3+QJJhLDtBaNz45cX5O/iht3/NDJrqWB/J6WirMemej+T4
         70NjqgLZHhXlEWSvPoLCpjvI7svg1nZVmHrZLmxHjP1OokoqK0LTxiz+LPjywpwgP+DY
         pf/OwAB7n/mJik8YZ8fKeREDBCSgnLwxLh++/PhSH2ao+89+cgUJU33lyuSfZ1noNUeO
         5zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zpwl5Hid9CGQ1ZnOln/rmrV81IIrU8CNkLgQA0Ogdr0=;
        b=LaWy4kYtfTAme0EaIRK3ivaJ/XWRCzVHD0lXppzTddfGNIR66nHWuJydUyGlQIhinl
         L0OcIe+OarUUVE1+uOtzyb0oY6zl29d3Fk8+NL8U+Jj/R32UVWup//vDWhFpJULjBYhS
         GTbdrAdP7zaK5i+sS9P0VNZRHzRX3l1PrHhXzwIp2AWIP4yfJpRcza4L7g67cwWU0x2j
         Wpc8Nm/Gu84qizLf5GrUFtsSjhpRTNw5BOBp7c5MlH5mMfuG0/K4hVDGkLdSZ70qtSYh
         I2SB5HtL5qCdhbJ2XIXm28MOl2gH3CNpffG4ISWXz0b2IiMDhQ/LNiaBMwy5r9MDcZkf
         rCZg==
X-Gm-Message-State: AOAM531iFXooUxzTSPoFAo9Y8m9N9J3f1ETbzsHAMYafJC5ZYYrhruQ0
	5QPxpXKTP+DPIcICVIY0+sPYruNhC9Y=
X-Google-Smtp-Source: 
 ABdhPJwZeOQozbXAfoACo34CNWU17EDPPoU9Xk/TBAQFIkZwF6p08CgKR3b6gtuMfY3WTeRw5xIUsQ==
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr26946910edz.195.1651727156872;
        Wed, 04 May 2022 22:05:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/61] at-spi2-core: upgrade 2.44.0 -> 2.44.1
Date: Thu,  5 May 2022 07:04:56 +0200
Message-Id: <20220505050544.651895-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165242

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-core_2.44.0.bb => at-spi2-core_2.44.1.bb} |  6 +--
 ...6a4c4491eea57d7b713bb4440f541584204b.patch | 40 -------------------
 2 files changed, 2 insertions(+), 44 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.44.0.bb => at-spi2-core_2.44.1.bb} (89%)
 delete mode 100644 meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch

diff --git a/meta/recipes-support/atk/at-spi2-core_2.44.0.bb b/meta/recipes-support/atk/at-spi2-core_2.44.1.bb
similarity index 89%
rename from meta/recipes-support/atk/at-spi2-core_2.44.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.44.1.bb
index e276eb7b8e..95a6c619f0 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.44.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.44.1.bb
@@ -9,11 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://08036a4c4491eea57d7b713bb4440f541584204b.patch \
-          "
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7eee3cf285b089060fd6b6e51b3eb2cacf752cca3a082c7f4c2c5ab841e51353"
+SRC_URI[sha256sum] = "4beb23270ba6cf7caf20b597354d75194d89afb69d2efcf15f4271688ba6f746"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
diff --git a/meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch b/meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch
deleted file mode 100644
index 0f002256c9..0000000000
--- a/meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 08036a4c4491eea57d7b713bb4440f541584204b Mon Sep 17 00:00:00 2001
-From: Mike Gorse <mgorse@suse.com>
-Date: Mon, 21 Mar 2022 10:19:03 -0500
-Subject: [PATCH] Fix build with X11 disabled
-
-Closes #51
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- registryd/deviceeventcontroller.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/registryd/deviceeventcontroller.c b/registryd/deviceeventcontroller.c
-index 8a321adc..3068ec4b 100644
---- a/registryd/deviceeventcontroller.c
-+++ b/registryd/deviceeventcontroller.c
-@@ -1720,16 +1720,16 @@ spi_dec_synth_keysym (SpiDEController *controller, long keysym)
- 	if (synth_mods != modifiers) {
- 		lock_mods = synth_mods & ~modifiers;
- 		spi_dec_plat_lock_modifiers (controller, lock_mods);
--		if (modifiers & LockMask)
--			spi_dec_plat_unlock_modifiers (controller, LockMask);
-+		if (modifiers & SPI_KEYMASK_SHIFTLOCK)
-+			spi_dec_plat_unlock_modifiers (controller, SPI_KEYMASK_SHIFTLOCK);
- 	}
- 	spi_dec_plat_synth_keycode_press (controller, key_synth_code);
- 	spi_dec_plat_synth_keycode_release (controller, key_synth_code);
- 
- 	if (synth_mods != modifiers) {
- 		spi_dec_plat_unlock_modifiers (controller, lock_mods);
--		if (modifiers & LockMask)
--			spi_dec_plat_lock_modifiers (controller, LockMask);
-+		if (modifiers & SPI_KEYMASK_SHIFTLOCK)
-+			spi_dec_plat_lock_modifiers (controller, SPI_KEYMASK_SHIFTLOCK);
- 	}
- 	return TRUE;
- }
--- 
-GitLab
-
-- 
2.30.2


