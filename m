Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D76C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 20:22:53 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.533.1704745371392101348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 12:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bE66TPZ1;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-204df0830ccso2156134fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704745370; x=1705350170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJLZNWLEu6aYoADVabe8MNzsoZm76v140sf/fv2Z7xs=;
        b=bE66TPZ1JGFubvryRLRRXJuTxoXQ5XMkHMj+GIgrgPDy7TA3PvQMXYUNHRAeWKEZtm
         BpLHTeVp0XUMdMn4x66d6/yF9Zn05cBAbrnUoPRP9Hxx8gTkccgd8QbgltbuA3AJE9P9
         a+G9OTEjv1LI7nlhRXB6eEngho371UU9r0AQ9J4CFo0oVr9hL7r2acBHi3uIaNafrPUm
         l8BYMHSs8FkL48bPRDHwUaCDVJyJfPGjZy0ZKo7lT8ViZsJsR1qA709Ax4l8LoeKdpLq
         YvhVaxdPB5U3eldTqyZToQmdprvBWJ+IsOfkxvT8AVvn8fZ9GlYJVWqL1Qrf50Lo3mnT
         w0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704745370; x=1705350170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJLZNWLEu6aYoADVabe8MNzsoZm76v140sf/fv2Z7xs=;
        b=fUCwco70UFEPtyF1z70qSsJUUVfDSLUgjO005Znr/C4oZ+QeOO7NuRnBtvHUtBHTxP
         ywMGm4QS3WJgmJAvuemsWTzW4WAQJb7Hgtso8BsaRn/zbY2WJuJr1U4/LW/jYsXmre86
         A7m44SbY+ju382cC4dBiEfwjpFHoj8pveSWBy3uc33Tbs0BMvlvyWzCZLxjf8JZrY9Gl
         NYItQUKmgKTk17HV4HY66ZCVQxDekQQdo6fXB7lXVAI84p4ZbaIKTgYdqQTay02ka8Mv
         z7AtFS/N6atZI5RGuKEd5ndbIloFnO7Emrmaokq6liu6K7otm+0C3aSN5bBDrvkX+vyB
         pWJw==
X-Gm-Message-State: AOJu0Yy34e5hPwVOouzjA0G6U7hxvngAh+WxLqmwUFcRGLbeIYSh5k71
	EpYLc21Fg3XPg8ELgughSa77SxrP9NQ=
X-Google-Smtp-Source: AGHT+IG8nDaHvUGm7QcZdEJ4PDfnLq9qRn24NsIQGJDGbDzdQ5CDQ+sT+i9dHahS3134Ja8Y/EdQMA==
X-Received: by 2002:a05:6871:a68f:b0:203:f0a4:b730 with SMTP id wh15-20020a056871a68f00b00203f0a4b730mr5998045oab.61.1704745370013;
        Mon, 08 Jan 2024 12:22:50 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::24d0])
        by smtp.gmail.com with ESMTPSA id lx6-20020a05687150c600b00205ff4f9ad1sm125068oac.53.2024.01.08.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:22:49 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] syslinux: Allow mtools to be optional
Date: Mon,  8 Jan 2024 13:22:47 -0700
Message-Id: <20240108202247.767072-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 20:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193430

Adds a PACKAGECONFIG to syslinux to determine if the mtools version of
the utilities is installed or not. The difference between the two
versions is that the mtools version can be used by any user with write
permission, while the non-mtools can only be used by root.

The syslinux-nomtools package is removed, as it was empty and doesn't
appear to be used anyway

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../syslinux/syslinux_6.04-pre2.bb              | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 1931bfb3c05..332655bdf98 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -63,6 +63,10 @@ EXTRA_OEMAKE = " \
 	RANLIB="${RANLIB}" \
 "
 
+# mtools allows non-root users to install syslinux
+PACKAGECONFIG ??= "mtools"
+PACKAGECONFIG[mtools] = ",,,"
+
 #
 # Tasks for native/nativesdk which just build the installer.
 #
@@ -77,10 +81,15 @@ do_compile() {
 do_install() {
 	install -d ${D}${bindir}
 	install \
-		${B}/bios/mtools/syslinux \
 		${B}/bios/extlinux/extlinux \
 		${B}/bios/utils/isohybrid \
 		${D}${bindir}
+
+	if ${@bb.utils.contains("PACKAGECONFIG", "mtools", "true", "false", d)}; then
+		install ${B}/bios/mtools/syslinux ${D}${bindir}
+	else
+		install ${B}/bios/linux/syslinux ${D}${bindir}
+	fi
 }
 
 #
@@ -104,14 +113,12 @@ do_install:class-target() {
 	install -m 644 ${S}/bios/core/ldlinux.bss ${D}${datadir}/syslinux/
 }
 
-PACKAGES += "${PN}-nomtools ${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
+PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
 
-RDEPENDS:${PN} += "mtools"
-RDEPENDS:${PN}-nomtools += "libext2fs"
+RDEPENDS:${PN} += "${@bb.utils.contains("PACKAGECONFIG", "mtools", "mtools", "", d)}"
 RDEPENDS:${PN}-misc += "perl"
 
 FILES:${PN} = "${bindir}/syslinux"
-FILES:${PN}-nomtools = "${bindir}/syslinux-nomtools"
 FILES:${PN}-extlinux = "${sbindir}/extlinux"
 FILES:${PN}-mbr = "${datadir}/${BPN}/mbr.bin"
 FILES:${PN}-chain = "${datadir}/${BPN}/chain.c32"
-- 
2.34.1


