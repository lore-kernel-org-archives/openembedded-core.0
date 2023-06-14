Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81449C001DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.7486.1686734985700527205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TyPRFleC;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so9094053a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734984; x=1689326984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fb0upeR4qeD+L8DmwtBsR9YkMrA25YM7JwL4cIN0zE=;
        b=TyPRFleCfY6Xz7I+uzuX2zYn2dYyUD8SY3lo/a/wNlxudDQf0zJ96W+e+mFVfk+wpP
         kYoBrV+M+/uGNPd2EyRkDNLtjoF32jakblUOOj7Ntx6B75x7OZif9atHDSaeLbHNO/j5
         /USJyF7RKhkrNDKe4/ncxokFrG4YUwaNmbVQbvXMN1TU224Np+TmvQzqvrzDYIGSL0OA
         LbD25q4Di47ed1qejAXoPvOUEJSImYH9BV245GdnMV8dLFWntDSyd0VANB0UEsyqVtXn
         mMQ0L0iccrqgLtU1VR8IFmVewGClO9saIz8EzQyAq9ojKWo74BS4Jl/xLNrCrfzcX4dP
         3WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734984; x=1689326984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Fb0upeR4qeD+L8DmwtBsR9YkMrA25YM7JwL4cIN0zE=;
        b=MpH9osmkElLnXuDpPKJ2K4F63cYSk8l15UThKhhZCNrHWy/g0IdPn+3SwUd0tp58E0
         1j2fqnBGCeWhamYuUR5/5gCjS6c8CWLK9u/w+kPkaddZutSkxuusH4DXPYbL5fauMlgj
         8ITcSmWJNRZCYmmFiDk5BD+fq1mgSRLgea1ph02/Yl0RDtbggra3v0GmBPizS/lKEr2f
         xEXJAsKVjqerRjL02eZ9ibj/Kw0fHhe86Ns9vi/NzSOyKLd2ywy6LreetDSXMvEe9h9T
         ycKnNUoWLK4rZECmmwRqRAGxdM3WJ0FpSRIu+5sc6bLyn1lRZW0BKyl/y0wstatw59jC
         GAnw==
X-Gm-Message-State: AC+VfDw/2NMF7LOOF+PbvbwX9USY1co7KGyXIuInL8cO8WqQTBhRG8HF
	JxAxqWCcPZEsr0VRt9Fson4j7z+9syk=
X-Google-Smtp-Source: ACHHUZ5HmmEWFZne6rEYzi0SCsm4KOaHxlDApxuMGXdhd1LLRxg8lQyxPPf0s4JrhP+G6+rGyK45HA==
X-Received: by 2002:a17:907:981:b0:974:326b:f9d4 with SMTP id bf1-20020a170907098100b00974326bf9d4mr13151380ejc.32.1686734983880;
        Wed, 14 Jun 2023 02:29:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/55] mesa: upgrade 23.0.3 -> 23.1.1
Date: Wed, 14 Jun 2023 11:28:53 +0200
Message-Id: <20230614092918.4065570-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182775

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ld-check-for-all-linux-host_os-combinations.patch | 12 ++++++------
 .../mesa/{mesa-gl_23.0.3.bb => mesa-gl_23.1.1.bb}    |  0
 meta/recipes-graphics/mesa/mesa.inc                  |  2 +-
 .../mesa/{mesa_23.0.3.bb => mesa_23.1.1.bb}          |  0
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.3.bb => mesa-gl_23.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.3.bb => mesa_23.1.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 36c33f889bf..a555c5f865c 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From 3b4d6b89f644b43e507c08181fef06db4326f9da Mon Sep 17 00:00:00 2001
+From b251af67df5a6840d2e9cc06edae2c387f8778f1 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,19 +20,19 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 172c64a..9b5294c 100644
+index 22385d8..15f48a6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -173,7 +173,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+@@ -121,7 +121,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = with_shared_glapi and with_any_opengl
  
 -system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
 +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()) or host_machine.system().startswith('linux')
  
- with_freedreno_kgsl = get_option('freedreno-kgsl')
- if with_freedreno_kgsl
-@@ -1076,7 +1076,7 @@ if cc.has_function('reallocarray')
+ gallium_drivers = get_option('gallium-drivers')
+ if gallium_drivers.contains('auto')
+@@ -909,7 +909,7 @@ if cc.has_function('fmemopen')
  endif
  
  # TODO: this is very incomplete
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_23.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 439389fb8a9..ac42a8dd4f3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "386362a5d80df3b096636b67f340e1ce67b705b44767d5bdd11d2ed1037192d5"
+SRC_URI[sha256sum] = "a2679031ed5b73b29c4f042ac64d96f83b0cfe4858617de32e2efc196c653a40"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.0.3.bb b/meta/recipes-graphics/mesa/mesa_23.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_23.1.1.bb
-- 
2.30.2


