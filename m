Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BA3C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:21:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2114.1668025283227525710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PPzHL7Wl;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id p16so11625092wmc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3p08TjgEfxG0l4yiDrya7apRPbIflobJYzMcxwMJrI=;
        b=PPzHL7WlwWdWsd/XWgCQFKbHPHov7E/Y6MjBwbAbQUP/FfJmakDIp+19njzGeQSDB1
         HqMyEANx7TupLEym5mbE3STd9HuQor4/wmJPKmC4wZqldb5C2OvUgnb8+pO6Ip9Uovhk
         BSm9g2YrZXKpOitH46HbCmR7UP2OZNYm/hBUEjFpgI7WMUaBBbeyKAvhUjnhOYW1jwT2
         1hRjlMWkD+NtMFgQJlnUlSiKgw75PY/KfM6WlS7OBPm1QE8gWGKlzD+OvdzP0hskKbFS
         xfX65AmjsyeffMmPx7AKOBXxP3pE/gba1S/1Wk2HpG9efhSNITEMtv0BnmotM5QJJIWf
         a7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3p08TjgEfxG0l4yiDrya7apRPbIflobJYzMcxwMJrI=;
        b=Cws8ytWPxRfniavOM2A5rq/A4WtIZXbIvNPxFZojxaUJZ7/axugVYgoNUudoA1i/Fg
         3RUFY9WP+TEf7ezwNP8c3865ionqeWmiaufVCtKWecFCv1280nRa0iNHjQERHcg9azN7
         aq0IkL8Z/anmbe07BLYa8xuCwn4D6t4n+SZ3AbaTnYXdPXcOuhcxKnYp2ffFl/+S30sc
         PFgSMaZc+oWVqgbMtAQqUKLbdtmySF6mNuE1aSmZ7G9F7/rS3dBL2B4Wf35UEOHZX0f7
         5B5OviZqPujty2xN5ucPlhAjT4U/eiNYYmbAdv6TXkSnfaZzyrfqs25YWEJ5i2zjXXoW
         6bYA==
X-Gm-Message-State: ACrzQf2OI4C+QAuAa4VWVnuJYRTF/iJ+xsaOxgLG74aIRS1VngymRIxd
	L3lW32BPLcWgveWPUUxouF5Ehj2ATAE=
X-Google-Smtp-Source: AMsMyM6VOIvS2IDY8Htti3F3dhrVWVEF8aUjWA6n9Cp22HUsK4fm+NWQRbkSVykTROpauwXjAoDZGA==
X-Received: by 2002:a1c:7312:0:b0:3cf:6957:1639 with SMTP id d18-20020a1c7312000000b003cf69571639mr39153038wmb.108.1668025281666;
        Wed, 09 Nov 2022 12:21:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm4168055wms.3.2022.11.09.12.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:21:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 4/5] vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only that
Date: Wed,  9 Nov 2022 21:21:11 +0100
Message-Id: <20221109202112.2035727-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109202112.2035727-1-alex@linutronix.de>
References: <20221109202112.2035727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 20:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173055

Staging the whole /usr/bin is not correct, as it pulls in also
all the vala's cross binaries, which may be discovered by other recipes
and things will go wrong then.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 974baa33f5..d3daee37dc 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -42,20 +42,20 @@ EXTRA_OECONF += " --disable-valadoc"
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install:append:class-target() {
-        install -d ${D}${bindir}/
-        install ${B}/vapigen-wrapper ${D}${bindir}/
+        install -d ${D}${bindir_crossscripts}/
+        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
 }
 
 # Put vapigen wrapper into target sysroot so that it can be used when building
 # vapi files.
-SYSROOT_DIRS:append:class-target = " ${bindir}"
+SYSROOT_DIRS += "${bindir_crossscripts}"
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
         # up our wrapper.
         sed -i \
-           -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
+           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
 }
 
@@ -64,5 +64,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir}/vapigen-wrapper
+	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
 }
-- 
2.30.2


