Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE91C54732
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.70886.1724736256529299791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgSyUefX;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so516300566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736255; x=1725341055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI8XJ/q5KQQeR0PZ2BzC7GtEhYU7dNdVSd+pBXAdxiA=;
        b=FgSyUefXUoII7gelNWyW3xWhRzc55DHTwj2GxAFBT6x7NqzM9bMNkm34TaEbX8zQE5
         S2XGKdoT8Pq0+mH8WQO9lPu9w++BdremcYUb/lwpQzdOyQrcV0kTImQs0KaPsfeZ1Jgk
         iXxwC17XmcXxJD2ah4Wrb+oHJv/HN4yYLUmjuefhHC7JIaOWzRlxmI2XYusxTvtPbSvM
         gtvI11OSCypn7IhHbcWsAmDKQjy9CHV9BDA9mspLP7asU+KBgmHe/DF8MKIMX2weHsih
         k8YyI8OdUYRJtZxnBGObsYkpjD3uhWwfuWN8GLWv42w1SPC8PFdFXFQ/UHZCDVB9HPw8
         7C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736255; x=1725341055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RI8XJ/q5KQQeR0PZ2BzC7GtEhYU7dNdVSd+pBXAdxiA=;
        b=H9/GCO6XmVt6sf6cskIpebMlQc5K7jbKcSIw9ByREp7M4KsKuK9aRlYQHWTelyH4Xe
         VJ1us3DR+uMO1ECpNDr7Mpx02tH8aTInxSw3jVLEQUpKIfp8F7TDg8pUxxMWHX4KrXJc
         QkODOMvgvbiqqLcmfZnkLUp+WtrXJIIxmCfVHbFcIOpAJok0EcgRto8eiJFzac2HPNFO
         9yoYDW5c0pYtaMzjKVxpA7Gf772GfnxxjXRj2CZXsaudhasGxuRDAWFziC9Lkgyhp8FE
         qnTaCK7Pj0DayxdRF8/L6Fmc+9+MF7C/FVvzA+JqC74zEsZ1kL22nL53YN42rO3A4GGW
         6A9g==
X-Gm-Message-State: AOJu0YzZPnuai5tqO+OQfi7jvESS62RDVGqsK3fngg1FY9IGdWpvKdMP
	VmPCDawhezE5N5leqyfVwTHYn95N5pbRAmFkovVZ5XT+xNO0QywBlG21tw==
X-Google-Smtp-Source: AGHT+IGWgIbHSCC0iWMaPi6Hox9qavtJDTWluWvb8ICuFI2hrVI22Sw6PokiUP/rp7Iu35ZICQ+dZw==
X-Received: by 2002:a17:907:ea5:b0:a86:8f66:e5cf with SMTP id a640c23a62f3a-a86e397e579mr107673966b.2.1724736254658;
        Mon, 26 Aug 2024 22:24:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/34] waffle: upgrade 1.8.0 -> 1.8.1
Date: Tue, 27 Aug 2024 07:23:49 +0200
Message-Id: <20240827052354.1319810-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203805

From: Alexander Kanavin <alex@linutronix.de>

Drop the patch: the build is correctly using everything from sysroots
now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-make-core-protocol-into-the-library.patch | 40 -------------------
 .../{waffle_1.8.0.bb => waffle_1.8.1.bb}      |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
 rename meta/recipes-graphics/waffle/{waffle_1.8.0.bb => waffle_1.8.1.bb} (93%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
deleted file mode 100644
index 31ac3e0dd19..00000000000
--- a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 79b9e4338f803d79449e53a40b1ecc0a5a5889e4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 26 Oct 2021 08:52:17 +0200
-Subject: [PATCH] waffle: do not make core protocol into the library
-
-None of the consumers (which is just piglit) use it, and
-this avoids host contamination from pkg-config suggesting
-wayland.xml from the host.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/waffle/meson.build | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/src/waffle/meson.build b/src/waffle/meson.build
-index 1cc99f6..022745a 100644
---- a/src/waffle/meson.build
-+++ b/src/waffle/meson.build
-@@ -89,12 +89,6 @@ if build_surfaceless
- endif
- 
- if build_wayland
--  wl_core_proto_c = custom_target(
--    'wl-core-proto.c',
--    input: wayland_core_xml,
--    output: 'wl-core-proto.c',
--    command: [prog_wayland_scanner, 'private-code', '@INPUT@', '@OUTPUT@'],
--  )
-   wl_xdg_shell_proto_c = custom_target(
-     'wl-xdg-shell-proto.c',
-     input: wayland_xdg_shell_xml,
-@@ -115,7 +109,6 @@ if build_wayland
-     'wayland/wayland_wrapper.c',
-   )
-   files_libwaffle += [
--    wl_core_proto_c,
-     wl_xdg_shell_proto_c,
-     wl_xdg_shell_proto_h,
-   ]
diff --git a/meta/recipes-graphics/waffle/waffle_1.8.0.bb b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
similarity index 93%
rename from meta/recipes-graphics/waffle/waffle_1.8.0.bb
rename to meta/recipes-graphics/waffle/waffle_1.8.1.bb
index ad8649b40ef..684124bc4d2 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
@@ -9,10 +9,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=master \
-           file://0001-waffle-do-not-make-core-protocol-into-the-library.patch \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.8 \
            "
-SRCREV = "580b912a30085528886603942c100c7b309b3bdb"
+SRCREV = "49abc7cb5f73cc6852136c91da49ea3a338960e4"
 S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
-- 
2.39.2


