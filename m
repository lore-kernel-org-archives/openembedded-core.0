Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02444CA5FBA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:29:28 +0000 (UTC)
Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11160.1790767758106736445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pOx/9zGd;
 spf=pass (domain: gmail.com, ip: 74.125.228.37, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d7111700so244401a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767757; x=1791372557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiAfy+OAT2woSPxg41pSFZhMVq51P3bQ2IkcJ7kqTjQ=;
        b=pOx/9zGdw2/PmMyPILkLDg/+hs612Ql0IV0kQgecYixdvfv3x9TS20Ug8FsqFrE+7X
         z+agmrlCC9rfdc1hD80OmLFRbTbrtFLar6SPsgCkTmylBVVYhqLf9qOVcPvYLOEgjfK5
         xmHvPZPIrq/whhXTohfia4JA5AgT33R/BW8IN76upiwHB0r9noBTZTrH8xEw4q66THvK
         l/g/BvXy/2PvO+MLK3/JZeMEeEKYElpAgeHRhUViZIsfbrAD/A2nBfq4g7CXbUH5mBZh
         oGE7a0vlqrCKGU2CQrlJ5n3k0oZiftxCnvFVIw/lGRpHOBzbGkVqV4/8SWRuzgWIUPLv
         69Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767757; x=1791372557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiAfy+OAT2woSPxg41pSFZhMVq51P3bQ2IkcJ7kqTjQ=;
        b=Ri/Ahl04rKGQKAx+dq2lJN74j7w6tpHiK4IZNsxBFaXUM48l2yt8uduFEbKGpCx00H
         Y7Oqbaz10VTiU7dcvSYcVfXIKRbYBgsQlTadnrrHDruDr8CwimOAQR4wHYA2m2gttPkX
         v0tVDC4Pb1Di3xFDBRdJoxKkhishx+VKUtnMclTNzODjTdt98/PhxwCF9+ulIvYyuVCw
         3LGgS3cn/zUyZGchxssFiHz+9I4L1KrQapMK5m5H6I8WINj10bPdeRmlioZ+fGh16OYB
         zCF123s2SdES8zSlXimSfi2eQ11z9ioGK38HUiSQTdpOmtBroWPxJ3hs2iVJJnGwaogs
         ncHQ==
X-Gm-Message-State: AFuF++mmHZH0TpDKyeHwZAh7MkvYNKq+Zx44EOUFHMCb1E5t2XrsNtvX
	ppNNosnCZc6WKE3NFT+rYfF79qiFO1EPQ6HFsi1izDSsNdQPF3HuR/8uU0A74Q==
X-Gm-Gg: AYBFou1fYq26eaRlwm5m/wP+4K/9UI0GlkTE5Oo9REjBkTOSCMADuvJI3fLRflC6kqH
	k4A2K3jIkJQnWVhD4Vx2HEZEteWqN7u0EMs++S7MC87W5ty7CYt7TbsmIrUVgZ6KOKNc7aC0Hc5
	5r6WNyroeX26z9yvTlNtql0tf7tAhgnITJTB48QbTYCIwRR44ZkvapXw3sPRxGOJXb8lOxksgzv
	dS04rn3jF/GkET/Fgc8xwxQlILsJNsxLMvLqba12RP8vIiCp3/EzYnixHchV28G+RSCttkSzG9E
	cbc1cpPc74nPdNX5+LiFekyQC/Tj1gfPozU9UTlRwwfobTCI2wUEA2hvP8Bu06i2uxwxp/jltfX
	5JZRSL2yn6u+9k4pztBvpA6jNNIdvrK7TzG2V8QYksROSCAoG+EO6764zkjo6Ud/Ueu7NilhG5z
	zCqkKjqIudA4rij8DuLlNgUdAoB/t1VeU6b4wEbSmly3iLTmiJrOH5muuWb/u9ZVL4cH0I5y2Rd
	lbBwQhth3mTmIue5Q6nI3I=
X-Received: by 2002:a05:6a20:9c17:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3de9e017390mr1177425637.10.1790767757338;
        Wed, 30 Sep 2026 04:29:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da14e8c5sm739797a12.12.2026.09.30.04.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:29:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/3] igt-gpu-tools: upgrade 2.5 -> 2.6
Date: Thu,  1 Oct 2026 00:29:06 +1300
Message-ID: <20260930112906.4053964-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930112906.4053964-1-ankur.tyagi85@gmail.com>
References: <20260930112906.4053964-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246958

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version[1]

Changelog:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/v2.6/NEWS?ref_type=tags

[1]https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/573a2c9824ce7893a32b8ce6022d21d7b5434842

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...do-not-hardcode-the-build-directory-.patch | 46 -------------------
 ...-gpu-tools_2.5.bb => igt-gpu-tools_2.6.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.5.bb => igt-gpu-tools_2.6.bb} (93%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
deleted file mode 100644
index 3cf6263290..0000000000
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5681532ed4e1b656219bf887bbeadbe3ee6d277d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 18 Dec 2025 15:45:11 +0100
-Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
- installable library
-
-This breaks reproducibility, and is not otherwise appropriate, as the
-original directory may not exist. If there's a use case for referring to
-it, the location should be passed in with a command line switch or
-environment variable.
-
-imgdir is set elsewhere in meson.build to:
-
-imgdir = join_paths(build_root, 'data')
-
-and them IGT_IMGDIR is used thusly in lib/igt_core.h:
-
-/**
- * igt_fopen_data:
- * @filename: filename to open.
- *
- * Open a datafile for test, first try from installation directory,
- * then from build directory, and finally from current directory.
- */
-#define igt_fopen_data(filename) \
-        __igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
-
-Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/meson.build b/lib/meson.build
-index d1289a5e0..a8c15be8e 100644
---- a/lib/meson.build
-+++ b/lib/meson.build
-@@ -309,7 +309,7 @@ foreach f: lib_sources
- 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
- 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
- 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
--            '-DIGT_IMGDIR="@0@"'.format(imgdir),
-+            '-DIGT_IMGDIR="/this/is/a/bogus/dir"',
- 	])
- 
-     lib_intermediates += lib
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
similarity index 93%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
index f03bf46630..d76c2355a1 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "a8e2cbd2854d7980a9eccecc6e0c801d0824b88f"
+SRCREV = "916c79cfb7675ca01607dcd821f8c49d4f633a6f"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
-           file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"

