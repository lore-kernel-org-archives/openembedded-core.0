Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE222C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3146.1675840918269060947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SVb9TMck;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so761669wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ixmlpad5fN8kTBRohrYEszB74Skbr80pk53IYaukIYM=;
        b=SVb9TMck69IOYMM+Qfr/lwNBTN1xH6kHSQLnC3DArGWy2cqOD7KLTJgaTeF6N7EiTZ
         o7mjgE+omplj9/k+MvPVPPi3I7dkH3ogCybudHQx7SmoLhUF8YyqxE17aY2Aw86RPR/K
         5Ow3qj+JjtusC+SsnZT9g/VI/t5Lpwk+I39bMayOi0DRglwVHAdzPhKGNCzfwQijV2Uj
         Lzdz5g8hay8eIjFR8JOfg9d7TRgrILb0BCIa3nGDEYLwKhDMpFX85TZvWnADQfMa4UY0
         P6mf5eVPpKKPvn4pz1PF3+PeEzv1ZCyCyoopuJhz9sm0Hv7eR888ajJx+Z30kvZk1mfK
         xZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixmlpad5fN8kTBRohrYEszB74Skbr80pk53IYaukIYM=;
        b=SSnpZ/Lj14iBGKW8vBGfSZLne9sRtJpIiC0LrUYILgsZ2pq6eM2sBi+uRxJwi/U+6j
         Nsw/g59lPPGSZrnD9sWVMgEox3ciioU+qmzKuS7YA0YDMk0vCup+LlAeIAeiBRzbdUui
         2FB8D5HZARs5qwUnAHwYP/9AdXjRP9MOBUKY4cCGJKcuZZxnw20vQtD3XVoSYr+PBvcq
         jWblINxiITkGBDIV2K/dikd2mZo5nosJQDW4fPVLNDtTPwVnsvpGKp+psInQn6JIt/kQ
         vlykMlVmSldksEX/ypkoLbLrNRkB0QD5Yrt4DRux79L3wcTCKQlouNND1+drVZKy4/Vc
         dNpw==
X-Gm-Message-State: AO0yUKVTW/+iJLzzQnRSm2t8Uedn3FS6pT2yu7Vfs6xACVfrfj90s893
	+QANzyzon5O0gvsfi/NeB+0+OvBv1KE=
X-Google-Smtp-Source: AK7set9WF7BXOBv3X1LMJIQNxJHhUWQR2zL5iGtGbBXG0t0AFygwca8K38pNpOVbvvD7UICzAJHikQ==
X-Received: by 2002:a05:600c:44d3:b0:3e0:481:c896 with SMTP id f19-20020a05600c44d300b003e00481c896mr5472508wmo.35.1675840916807;
        Tue, 07 Feb 2023 23:21:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/52] igt-gpu-tools: upgrade 1.26 -> 1.27.1
Date: Wed,  8 Feb 2023 08:21:07 +0100
Message-Id: <20230208072143.2930292-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176856

/usr/bin/code_cov_parse_info is written in perl, so that's a new RDEPENDS.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n.build-fix-meson-0.60-compatibility.patch | 24 -------------------
 .../igt-gpu-tools/igt-gpu-tools_git.bb        | 10 ++++----
 2 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
deleted file mode 100644
index e7c782055b..0000000000
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-fix-meson-0.60-compatibility.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From b9a19aa4bdb21751c04c0e3ba8a9e2e35a10c953 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 25 Oct 2021 18:18:15 +0200
-Subject: [PATCH] lib/meson.build: fix meson 0.60 compatibility
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/963917a3565466832a3b2fc22e9285d34a0bf944]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/meson.build b/lib/meson.build
-index 9929520e..1a525587 100644
---- a/lib/meson.build
-+++ b/lib/meson.build
-@@ -152,7 +152,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
- 
- lib_intermediates = []
- foreach f: lib_sources
--    name = f.underscorify(f)
-+    name = f.underscorify()
-     lib = static_library('igt-' + name,
- 	[ f, lib_version ],
- 	include_directories: inc,
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index bb2f9564d2..fbe5e1a4e7 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -9,17 +9,15 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "203def046b466fb2da67f9f15552d84e1c0b41f2"
-PV = "1.26"
+SRCREV = "2b29e8ac07fbcfadc48b9d60e4d736a6e3b289ab"
+PV = "1.27.1"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master \
-           file://0001-lib-meson.build-fix-meson-0.60-compatibility.patch \
-           "
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
-RDEPENDS:${PN} += "bash"
+RDEPENDS:${PN} += "bash perl"
 RDEPENDS:${PN}-tests += "bash"
 
 PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
-- 
2.30.2


