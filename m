Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE31C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.55650.1722258784864849466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uMk3MmkD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cb6662ba3aso2107169a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258784; x=1722863584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oEQ7Ysdr79/3BcFGxfnoNt06Pi9sg0XFZQNpA3YHsc=;
        b=uMk3MmkDwlIxO2cRt6jA31ZupEc1XD780HJ4AroW7ASrcnEFGvTfe6hw9UyKO+c4uv
         V9WyiXQ2HR3jTp/SzDaL6NSwUHmvU6m4D6W23kRu48huM8RQZKhxqA2QNj6s6/N33taB
         fALnVC7MQ6+mLU3wPCncIrjGuIml30O29hi3ZbdZCc4ZO3xTN7WCe05st4yYWFqSnbjC
         2btIdoAdhA6cmJoOdgzpOEADBieW7Aq5YePeZUxllmj8KH+izEfbOFBTeVAH98xQmWiX
         S43AX1DLX9W9fDHryGkYOt+rHYTSc6Z8bzM7PMvCh1t3/3yuO7Vp5V1ZsRIELXXH9TDy
         ivxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258784; x=1722863584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oEQ7Ysdr79/3BcFGxfnoNt06Pi9sg0XFZQNpA3YHsc=;
        b=E0lfn7VrLjcjvIpc8kiZQ5NlNUNYSxM4+KDSKOgU585ijDWQP2YAuKO1VitHzLbayn
         9KPRbS3oBMWmnD5xdzZFTrMJ/7ejEnuGdUwgko589AN9/w3aUwazAuXt2oQAw3ZPx72L
         LFvSSvbQhHAS6DPDh9f1dNG1wmmsnQ9sU2qdg1uGrDM1p8hdHcH2FUhPvSzVCw7+I2+6
         /1wMtgZbOTqL9tYBiMa0AK06RxqJMc3RDKKcbdAgW44/mD2p8XYIqA1LSHN99LCx6iOb
         gaxHyeLCkHOrB8AJi/JdSNlxaosBTVt20hTKmTycYvcohkOjKjMzxnq+XDCFyYEcIll2
         d0tA==
X-Gm-Message-State: AOJu0YzlIPPU1oAgpPct1MmVrMjJQgaD0Ns45g+ddpiOvtMjbINL3Zzr
	njMXUNvPbG1iYHDowhTyVdVx6jw1Qf930AbcOb+DJVkF2aa5CAmiOwsGhMP2Cc+qSxxa2ABllyp
	7X4CTrg==
X-Google-Smtp-Source: AGHT+IHq6Qjh9FoXMMSrGjzcwQrD1fqZhpUivGpN7J7l/n13dbIWA5wu61oGCL0g+EYvcu0PbF58hw==
X-Received: by 2002:a17:90b:4a52:b0:2ab:8324:1b47 with SMTP id 98e67ed59e1d1-2cf7cf877ecmr12608345a91.15.1722258783940;
        Mon, 29 Jul 2024 06:13:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/37] weston: upgrade 13.0.0 -> 13.0.1
Date: Mon, 29 Jul 2024 06:12:16 -0700
Message-Id: <785dc256112029fcc95bcb003ab0436bee6079d1.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202620

From: Denys Dmytriyenko <denis@denix.org>

Weston 13.0.1, a bug fix release for 13.0.0 has been released.

Full changelog:
https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.html

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a43f4f98aeba01f05157f7784e366a964d2f766f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...tools-Include-libgen.h-for-basename-signat.patch | 13 +++++--------
 .../wayland/{weston_13.0.0.bb => weston_13.0.1.bb}  |  2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.0.bb => weston_13.0.1.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index 1d281fa832..fbec9f9d4e 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From 2b53236ac637dfa7fb0f438f7391a73f6ef92a06 Mon Sep 17 00:00:00 2001
+From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-drm/libbacklight.c
-index ca7f2d68..74690fa7 100644
+index ca7f2d6..74690fa 100644
 --- a/libweston/backend-drm/libbacklight.c
 +++ b/libweston/backend-drm/libbacklight.c
 @@ -41,6 +41,7 @@
@@ -30,19 +30,16 @@ index ca7f2d68..74690fa7 100644
 +#include <libgen.h>
  #include <string.h>
  #include <errno.h>
-
+ 
 diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_impl.c
-index 18f03015..9b460fa0 100644
+index 18f0301..9b460fa 100644
 --- a/tools/zunitc/src/zunitc_impl.c
 +++ b/tools/zunitc/src/zunitc_impl.c
 @@ -27,6 +27,7 @@
-
+ 
  #include <errno.h>
  #include <fcntl.h>
 +#include <libgen.h>
  #include <stdarg.h>
  #include <stdbool.h>
  #include <stdio.h>
---
-2.43.0
-
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipes-graphics/wayland/weston_13.0.1.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.0.bb
rename to meta/recipes-graphics/wayland/weston_13.0.1.bb
index b728bd0ef3..dd9517a4dd 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
+SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


