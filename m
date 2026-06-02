Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16620CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 19:13:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2985.1780427599054267313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 12:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bQdVL7qt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee6d32402so3150442f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427597; x=1781032397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Gje6ycEW99hpIB5epELPRIsuKMKMvlkQ21jjpLntF4=;
        b=bQdVL7qtYiyrJTkogKIls9v99FuSf57ZTkmKWxALNbeeOTAvMSks9ncTYh1BweohWK
         27H7b14t7pZha8cFBrZ+RT93O2UA/D3ADCknQtgJWyiVfYPOeJneXbJqFetdEdtJ1MsD
         3UYCfla/WSbtAap4pVviztOGXsY1O40OT+FZCl/I8ejpZMBBX3qIaHv8+R/k3fMGcj6Z
         a5yo06HfzpP7r9vgpoby82PJmkXbgmX2VVJMftGjz8b2ktKEyfWlSuFZQTGXWjkZeo54
         6huzey4b02vEyG8HCpWLC7hPgN6LiTfF1rPTBDZ8mSbHH4/Kzy51k3mIDzX6Qy1gOWL2
         ULJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427597; x=1781032397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gje6ycEW99hpIB5epELPRIsuKMKMvlkQ21jjpLntF4=;
        b=n9LDwDnkU5qCanJHyuXpBtf6hJ8a6S6f1VznOje3r5A7sQ3yvT5GFJDAuop/8VTeP4
         f6MD42ceOCXj2GpOVOkMXq7M+CKKggqH+H2jOdu3PqfxACk27MfnwJUZ3RaoyugqQqXZ
         f9UKoah5E8ml3y7+ExbR1FcO0QtGXn4WR2UapRkC9yziYYz6XRs9lQe895g2i7ZTqvEM
         r3eWymm018Z5eB0RiC56cBkC46It3oMRdCyvdA7vSKpUgbxQa/AQ/3Rc241P65ounUrM
         6EPJcmd3p9qsJb5x6h4h6ZiN6yKH9SMads60kvHDAnrg81iNRFg7z2WiIiDTOTSCpxI0
         4LOw==
X-Gm-Message-State: AOJu0YzOeOjw0ne2a3F1wekU29XdQpZdFD5abhU4HXtfgmFKzpHNCtW6
	b/74sYibDEzo6PMraFgq1vtizZN/MpOyhVjsrJomTMehevfO/FyizSzv0tb3NA==
X-Gm-Gg: Acq92OEz0fGqdSpkyB9bUWsGChggGjj+2BvfEuOFT4NEVSB3NX1mBCajdHgktjxrk8X
	/qq9ErCiGx+cQD3+vIvjsribYUQ+5Ba8HilU9Q8biEzjBrs++PUIAdvtnE8Wp3gGl3TLAHj7Jlf
	GhP3X4gvG78cJoJ7oySop3noL7PVGS5pZDT9SPnT3DZ4HdnWC0Rm4x3MmzaFscf3Ub4XaCkHeEm
	C7Vut+qOmimmi38GFyVGq5+mZpHkr+2myIERU3KaURtLW4hKj+uNj6LYKnm7O6tDnkE/SMUN/oA
	RNzE1NJvHxkg4TdNQAtu7C/F6TNoo5mIVzhcqxpGFfXdGFmuqmGn2aibKTtycxLmTNcdeA7JIfE
	QYOzjgyP/hYT1hRvEooDOeU2xArXE83SyzGIs2qZq1GJaHD7hM54f88zGvJa/oPXj1ji7mhFUJN
	Q92O03e6N6Wt1pS5hoe0AesSlBqRi4knY6EMb0+FTIK922gX42ZhCss3S6Pr/AX8VVA9RRDQ==
X-Received: by 2002:a5d:54d2:0:b0:45e:ed7e:f8f8 with SMTP id ffacd0b85a97d-4601f4d815fmr807868f8f.8.1780427597213;
        Tue, 02 Jun 2026 12:13:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm1282853f8f.25.2026.06.02.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:13:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] qemu: disable SDL UI frontend
Date: Tue,  2 Jun 2026 21:13:11 +0200
Message-ID: <20260602191312.3257535-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 19:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238068

From: Alexander Kanavin <alex@linutronix.de>

For rationale please see
https://lists.openembedded.org/g/openembedded-architecture/message/2374

SDL-based UI is of limited use in typical scenarios, and can be
replaced by qemu's own vnc server.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu_11.0.0.bb               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
index 7947499c5f..258945c512 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native python3-qemu-q
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman sdl \
+PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu_11.0.0.bb b/meta/recipes-devtools/qemu/qemu_11.0.0.bb
index 5d544d8d13..cb3ce6a85c 100644
--- a/meta/recipes-devtools/qemu/qemu_11.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_11.0.0.bb
@@ -16,12 +16,12 @@ EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCU
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm pie slirp \
+    fdt kvm pie slirp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie slirp \
+PACKAGECONFIG:class-nativesdk ??= "fdt kvm pie slirp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 # ppc32 hosts are no longer supported in qemu
-- 
2.47.3


