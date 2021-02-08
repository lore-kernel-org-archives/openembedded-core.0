Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.33586.1612781986349412446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mbbtSI5t;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id y9so23847038ejp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u1qRs+MVQtLjmbLGL/vo0Zqi9cUxxAyrvvl+zhNqyls=;
        b=mbbtSI5tAK9elV48o/ZKYbpFb046uJ8jqkjHkzMx44Vzg9geYxN1E2zvoZ/Mq+7jJj
         2NkcpJKZxbUrwYsQl4eSwegrjZrYKP8X55axOTwqb/xILnHe7JgmvWTPzEVAp8yNliim
         vwNY7iT+9xCIIK7oVCZabOvEckxU76U13I3DldCAS05uX9wxXjTltc2MJy5GlkNLYazv
         ae7hxPGJE+KgUupwSN/DJfbss06PWpWrL3nMZdkaAvKz7K6iiD+xoafOUqam1mzhOzFR
         FZlOLV99Dfj4vPLIXOgUXScJ2BYH0ZdM/OX9gJymjbaDx/XSjA4K47gD9h3bNTV7rhuC
         fdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u1qRs+MVQtLjmbLGL/vo0Zqi9cUxxAyrvvl+zhNqyls=;
        b=ib8uVHEIBJDNV+DoNgFp7u631E8Sn4HTwOIyZA8JeB3wxsabjEydizDxqeGU5MhX5h
         90LY7ly81YdH4tsANLbB5Uh2MAWA2Xlo0bgJcv2eCnosAukBXEJ7J2AsPmT82M/HpQdh
         NTdrJnEBjFMs94+seCV8GfWIjvwz5F/Q83D7Z3E+KkaLzCYIZDymI2XtTTOYVMKmr/Lz
         QmHwHR+9VieEw2YiilZPbObQQi0jwG42Sl6BsC/LGVrREXJ/PsRB44jKyXpxdHDU2FJN
         JFzTq8S8hjWnnPIRMURxVCkO07oudJ13Im65ysJ12zABHUQ0FwKz9gnJjWGmBLVp7TpD
         yQLA==
X-Gm-Message-State: AOAM531pk82jI54CVuCBEisW9CAhWvKqlj2yW+5r3pEXVIKgtBsPe+3l
	SWPIdJ97zC8LbQoNEYPNEO65Q8oCb8yNLQ==
X-Google-Smtp-Source: ABdhPJx6NR7m6V0YvKrcEatJhE0qU7Kc8hjB3VI6++ObwXZn59pq4Tgg7xdcHqRwP28d3TVQFxfpSw==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr16320403ejc.408.1612781984970;
        Mon, 08 Feb 2021 02:59:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/12] tar: update 1.32 -> 1.33
Date: Mon,  8 Feb 2021 11:59:29 +0100
Message-Id: <20210208105932.347925-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop musl fix as upstream fixed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../tar/tar/musl_dirent.patch                 | 19 -------------------
 .../tar/{tar_1.32.bb => tar_1.33.bb}          |  7 ++-----
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar/musl_dirent.patch
 rename meta/recipes-extended/tar/{tar_1.32.bb => tar_1.33.bb} (88%)

diff --git a/meta/recipes-extended/tar/tar/musl_dirent.patch b/meta/recipes-extended/tar/tar/musl_dirent.patch
deleted file mode 100644
index 2d98ed1310..0000000000
--- a/meta/recipes-extended/tar/tar/musl_dirent.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-musl has valid d_ino implementation
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: tar-1.28/m4/d-ino.m4
-===================================================================
---- tar-1.28.orig/m4/d-ino.m4
-+++ tar-1.28/m4/d-ino.m4
-@@ -40,7 +40,8 @@ AC_DEFUN([gl_CHECK_TYPE_STRUCT_DIRENT_D_
-            [gl_cv_struct_dirent_d_ino=no],
-            [case "$host_os" in
-                            # Guess yes on glibc systems with Linux kernel.
--              linux*-gnu*) gl_cv_struct_dirent_d_ino="guessing yes" ;;
-+              linux*-gnu*|linux*-musl*)
-+                           gl_cv_struct_dirent_d_ino="guessing yes" ;;
-                            # Guess no on native Windows.
-               mingw*)      gl_cv_struct_dirent_d_ino="guessing no" ;;
-                            # If we don't know, assume the worst.
diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.33.bb
similarity index 88%
rename from meta/recipes-extended/tar/tar_1.32.bb
rename to meta/recipes-extended/tar/tar_1.33.bb
index ebe6cb0dbd..5e34cdf9e5 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.33.bb
@@ -6,12 +6,9 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
-           file://musl_dirent.patch \
-"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "17917356fff5cb4bd3cd5a6c3e727b05"
-SRC_URI[sha256sum] = "e4bb9e08e12e7fa9f11fef544efc85e59ba34538593d9ad38148c7ca2bfbb566"
+SRC_URI[sha256sum] = "85b6953f4bc9666eb7db61b48f150dca21b941d85090171ea8c4f89902e460af"
 
 inherit autotools gettext texinfo
 
-- 
2.29.2

