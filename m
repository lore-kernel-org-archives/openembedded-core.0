Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.5875.1609856674101181354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0lfI3TKH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id j13so1780480pjz.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=w6KPxvxRJruJ+/fvfDKr4mptkF3nDwpf3dg0Dusudmo=;
        b=0lfI3TKHVDxDQTTG1InyZTpt6ubKDuu4agTOP+d82IFFv+teFQ2uN+K8xxZMGVmdP+
         ssETJWNW6I5t5Wdx/5p0wLKX+3J2d5091a0BXO8cR/KFVCcELTvM3fCG9S5dZQl2cp2Z
         4lrqr0CGT9TkzQJkg6Th5eTRfjnH4rZwkRymyEDxeVQrFOb8oGwBans5ctzrG5iFm/tC
         FTx6pZMgnnUlDpMEihK8+ThVu2drMbiwl7/Wy0HIyuuSJ9oFT89MZcrjqw/IV5BIjqk0
         bwfSfG+xNL2e7hYFV3nh2kiWzZTtZYgwB0ENeygJhdxuMnduhJsZD2LIexsF5DeXQZFh
         75OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=w6KPxvxRJruJ+/fvfDKr4mptkF3nDwpf3dg0Dusudmo=;
        b=XwEW2no4mB+AyZoHQZvU087mBa4xY/tzCZVYmo7yIpaXvVJytquFPCjtS/vXuqO9LH
         t6taw3s42MYPLXCy9xjEQs3n4iDTHRlyJ0bH8qG5xBQR2VMNZPLkhsCpmfMml9K4mT5V
         mpyxxp9m3H4g36CV6Ph3KpPwv4e8mCIJIvDvL7Uow53UkhSP61dJlTxnc+HGPBqvKdvL
         akcv+6buqj4pLdp6N4fkeBKjA2xrF7WcxJA/8hryP+s5x60PmP0ZQF6ekjGTguPFZC1A
         2hsoNT0vZIlnWEU9z5lFjjknaLnjPvlA7sSBypBbsWVIYAaAwc7RBDMEaBFP47t3v+MK
         3Q4A==
X-Gm-Message-State: AOAM533z6wSot+PpWmw9ek5uCzg/JRRee/WJfn8iamMGQj6Ls7bt88a/
	Em1JKWVyCdgCjCowBseJ8I43xxiA0J+Iv7dJNNs=
X-Google-Smtp-Source: ABdhPJxEvyelnInqYNZ64+Ki/AEqLwkJFuFCJs8o9sSf9Th4ql7PRIAaV4362bs8tnjsupkbKbOq5A==
X-Received: by 2002:a17:902:7e85:b029:da:726a:3a4f with SMTP id z5-20020a1709027e85b02900da726a3a4fmr56494247pla.65.1609856673268;
        Tue, 05 Jan 2021 06:24:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/30] ncurses: remove config.cache
Date: Tue,  5 Jan 2021 04:23:30 -1000
Message-Id: <d095c3f88e8a3c64e4db07c010d6cf2de373ce7f.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Ross Burton <ross.burton@intel.com>

Instead of having a config.cache that overrides the system site files,
simply set the values in CACHED_CONFIGUREVARS. We can also drop the
mkstemp check as the configure.ac assumes it works, leaving just
nanosleep.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c30c90e3adfa91407c37838c971e251f8482e2b8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ncurses/files/config.cache | 4 ----
 meta/recipes-core/ncurses/ncurses.inc        | 3 ++-
 meta/recipes-core/ncurses/ncurses_6.2.bb     | 3 +--
 3 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/config.cache

diff --git a/meta/recipes-core/ncurses/files/config.cache b/meta/recipes-core/ncurses/files/config.cache
deleted file mode 100644
index 6a9217d5bb..0000000000
--- a/meta/recipes-core/ncurses/files/config.cache
+++ /dev/null
@@ -1,4 +0,0 @@
-#! /bin/sh
-
-cf_cv_func_nanosleep=yes
-cf_cv_func_mkstemp=yes
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8c68f61d99..630c5f26d6 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -16,7 +16,8 @@ inherit autotools binconfig-disabled multilib_header pkgconfig
 SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https"
 
 EXTRA_AUTORECONF = "-I m4"
-CONFIG_SITE =+ "${WORKDIR}/config.cache"
+
+CACHED_CONFIGUREVARS = "cf_cv_func_nanosleep=yes"
 
 EXTRASITECONFIG = "CFLAGS='${CFLAGS} -I${SYSROOT_DESTDIR}${includedir}'"
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 723e685a9b..5c02db8541 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -2,12 +2,11 @@ require ncurses.inc
 
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
-           file://config.cache \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
 S = "${WORKDIR}/git"
-EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
+EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-- 
2.17.1

