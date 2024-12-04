Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E91E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8145.1733294974127466441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QA9NqQb8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so59294665e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294972; x=1733899772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MmhF2Dr1jLqWUo6oeknSEtTpXJlrMIZEXDbyGaPfUI=;
        b=QA9NqQb8pczyCDHyrEgJwcXHMevNdHgMNAjtBvil5Vpthmiy4YJMKWA22cqJDI70kH
         1hj5D2pOZk+T6XZfF/BUefRSjVcl1ECiKvUnTIE64iWofq37JV8oi4wbj0d1kbt4FlOy
         oM7rzIvgaBNgEqTGypHdpCTiJvQ8OFcpxp4uKoIa7q+YHUzrkGv27Qs2JcpEvZYH9jn/
         br7HGgrdHUuY+fa4G9HTC/2WgyL4+aNOFgJdwONpqJ2Dtno/KK6dnDk9jOrngh89KXcB
         2Mu979IR3dNG4ubBurIGKqvBnkTh/q/NPxO9VOQnQjhtXRpwVQWfvGXpxLgpixf5YMQ2
         f14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294972; x=1733899772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MmhF2Dr1jLqWUo6oeknSEtTpXJlrMIZEXDbyGaPfUI=;
        b=sT8baAsmVL2SrX2lbHvKR5+z5/VXmRlum6TC6EqOo3r0W7yO5ArRPaYi6uB2u0R8zJ
         eAytuD5oan7gkFrb6p9U3GLM9u/Ot6sRBoC13b4LxzsSIAEM/BP+0xOGkr6eof6Fu5N7
         rhXZnixYbXOv35hwNdqo7nhJJehDOzK6NULvJrO7q3svZeobh6Y1IQpKTC1aMg9T7GZ5
         A8L8vUCvUool80Ho/pdjMCmKHuc8Dwkmf/KnZki1aNRP6uWFTdM3A1VY/B4oZiPDk/NS
         r8Gq1D0WqEAdEqFyOVIDP03Kxr2E2yB7K9HBtYfoIQYHsqc3WaEn0yWm1YsK54T0ITr2
         e3gQ==
X-Gm-Message-State: AOJu0YyXgMcfTO7R0ZSa0GepZUYSFvjPeuP+mO7u6ZakfTyzbui+lzvx
	0x3pHu273mej/drlRj+vQEmWmmyb8oG+e6Jnkr77Tnvb84/1M7UWvzUiXg==
X-Gm-Gg: ASbGnctXp2DUE67idy9gSfm5l4giPkF0vjhss9UzF+o+D/SdsZu8nvpStAoFBme0loB
	c3pFg9sSvIobMLuoyX/nQ+5tMmcriilBa3C8fuDsYOy9bSufgRP0VNZUXZIBYGc8s/9D8wCq0J2
	fIvIZmi7mQSJp0R4HpvXzfMf7Rflbfj1KVcfLvTnQIdNdmi/DSb38fXiJpi/PrVUy7uya86a8TT
	peGT6s1dKkQI25+RU1zjS34ZLivYuQObS+XHu51ItbWfSkZoQR/gkhvV0Jd/djcnOOtqNEer5R0
	Wu5FFL16/O4=
X-Google-Smtp-Source: AGHT+IGcB1EBvYGtZKtsQZNzaTirrq6E5ei5EHgLV+e46zI2+nfqt2TbQ9lipYVWEiojjXB99pttew==
X-Received: by 2002:a05:6000:4602:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-385fd3f26a5mr4531419f8f.34.1733294972339;
        Tue, 03 Dec 2024 22:49:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/37] meson.bbclass: enable qemu exe wrapper in nativesdk
Date: Wed,  4 Dec 2024 07:48:47 +0100
Message-Id: <20241204064920.817016-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208233

From: Alexander Kanavin <alex@linutronix.de>

nativesdk builds are cross-builds like target ones, and
so meson expectations regarding ability to run binaries are the same:
either provide the wrapper, or disable the build time options that
need executing target binaries during build time (if such options
are made available by upstream).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/meson.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 03fa2c06eb4..b343480f9a7 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -9,7 +9,6 @@ inherit python3native meson-routines qemu
 DEPENDS:append = " meson-native ninja-native"
 
 EXEWRAPPER_ENABLED:class-native = "False"
-EXEWRAPPER_ENABLED:class-nativesdk = "False"
 EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
 DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
 
@@ -127,7 +126,7 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
 EOF
 }
 
-do_write_config:append:class-target() {
+write_qemuwrapper() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
     qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
@@ -145,6 +144,14 @@ EOF
     chmod +x ${WORKDIR}/meson-qemuwrapper
 }
 
+do_write_config:append:class-target() {
+    write_qemuwrapper
+}
+
+do_write_config:append:class-nativesdk() {
+    write_qemuwrapper
+}
+
 # Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES = "meson.build"
 
-- 
2.39.5


