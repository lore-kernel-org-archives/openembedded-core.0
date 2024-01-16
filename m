Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AF4C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 21:42:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.31178.1705441362536692391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 13:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2lMWvGc;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so3737848a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705441361; x=1706046161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQmNmPpgAtWPOpnb6XY3BaoPcDTClgi7d2foYFpwbV4=;
        b=k2lMWvGcUq3b2P9t7kSjHIanu2NipPgwv13lnngkzy1+CfzUtrZCcly6uh15LR3Ht7
         as2jKpOjD7AlOGXt+BHTsJtrN+C0vKpPU3sYQvXovNOBKenWCUY10rE4KFxzSgowfMWx
         OLpXyYPxJy5fyYLfUYu6thnEs5sfwVS5Ni3Q+nJ5PMcTP5r2yXrs4c/K6MZBZNG9ENhe
         AcM73QTFZzrsdlheJbkIqwCLHubAP5Lci7uxSNmy/Ev1UiTxO8XfysxdGbH6Uha2RCJ/
         SgU0fyAhXS/XVP/lEMX3ebn3a90isJLusw+PiJI5QOwzO/MbAofsBgJsDHM+1FVTEPfe
         ViLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705441361; x=1706046161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQmNmPpgAtWPOpnb6XY3BaoPcDTClgi7d2foYFpwbV4=;
        b=rexJzkxdDwdi8am7eguMaOUI/+YmAQ9EgwECEG3iQhl6PkUtK81KP5kbhz+zeWZkAR
         ez/PQIhpmn/0FVh9cMvbq8HqwtL25yZ1D0XFuwI7jxBx4Atstagbva/RchCmmX2vd7aG
         znu0a/CK+tC6N0hir4t8NZMjbl9c42BKUb/dZhFEU62kw6BPXUF2mBvhP5huvszJ07Nn
         a1bIuBN2XKBzUGBhrrH0Yd8cVuFFPzeMjS/Cv40p6uImnlGxPhOXxaGiV546+KSTbXvz
         GEzsGUr7JSNDSq2HT4rTSvE76H7LPdhqdayf9e11agppXjWMuT8YXFKBNa24/HBUi6mV
         drcg==
X-Gm-Message-State: AOJu0YwUf1FydMGCtfayMgZYC6iAKgfIzbAjXyd0SVdxYCZtlRfdh+8N
	qBOrN8h/1xMZnKqM2Nqd9BSnrls2mW2xHA==
X-Google-Smtp-Source: AGHT+IFo5NpDjBNC0vMnRHVANVnaXXOAB/39RcbqVb8vkG1YG4n62dSbIxGuejXStDSyYOtjNFr15Q==
X-Received: by 2002:a17:90b:3891:b0:28d:d412:6012 with SMTP id mu17-20020a17090b389100b0028dd4126012mr4010549pjb.96.1705441361471;
        Tue, 16 Jan 2024 13:42:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b80b])
        by smtp.gmail.com with ESMTPSA id sy16-20020a17090b2d1000b0028c940cdad8sm14859573pjb.5.2024.01.16.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 13:42:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libgudev: Pass export-dynamic to linker directly.
Date: Tue, 16 Jan 2024 13:42:38 -0800
Message-ID: <20240116214238.3416255-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 21:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193876

New clang 18+ errors out on this while older clang does not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Pass-export-dynamic-option-to-linker.patch | 38 +++++++++++++++++++
 meta/recipes-gnome/libgudev/libgudev_238.bb   |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-gnome/libgudev/libgudev/0001-meson-Pass-export-dynamic-option-to-linker.patch

diff --git a/meta/recipes-gnome/libgudev/libgudev/0001-meson-Pass-export-dynamic-option-to-linker.patch b/meta/recipes-gnome/libgudev/libgudev/0001-meson-Pass-export-dynamic-option-to-linker.patch
new file mode 100644
index 00000000000..8a06d244e4c
--- /dev/null
+++ b/meta/recipes-gnome/libgudev/libgudev/0001-meson-Pass-export-dynamic-option-to-linker.patch
@@ -0,0 +1,38 @@
+From dc4fcfb1e1e2326a412b252314af3e9424a31457 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 Jan 2024 12:02:46 -0800
+Subject: [PATCH] meson: Pass --export-dynamic option to linker
+
+Bypass the compiler driver trying to comprehend and translate it for
+linker, since its not clear what the right behavior should be, gcc seems
+to translate it into --export-dynamic but clang 18+ rejects it
+
+| x86_64-yoe-linux-clang: error: unknown argument: '-export-dynamic'
+
+also see [1]
+
+This makes it work as intended across gcc and clang
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libgudev/-/merge_requests/30]
+[1] https://discourse.llvm.org/t/clang-option-export-dynamic-parse-to-e-xport-dynamic-error/72454
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gudev/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gudev/meson.build b/gudev/meson.build
+index e904203..3ed580b 100644
+--- a/gudev/meson.build
++++ b/gudev/meson.build
+@@ -33,7 +33,7 @@ libgudev_c_args = [
+ ]
+ 
+ libgudev_link_args = [
+-  '-export-dynamic',
++  '-Wl,--export-dynamic',
+   '-Wl,--version-script,@0@/libgudev-1.0.sym'.format(top_srcdir),
+ ]
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-gnome/libgudev/libgudev_238.bb b/meta/recipes-gnome/libgudev/libgudev_238.bb
index 5923544ecad..f197f6421db 100644
--- a/meta/recipes-gnome/libgudev/libgudev_238.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_238.bb
@@ -16,6 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit gnomebase gobject-introspection gtk-doc
 
+SRC_URI += "file://0001-meson-Pass-export-dynamic-option-to-linker.patch"
+
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
-- 
2.43.0


