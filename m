Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.10075.1620227951929158396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kil3EQvN;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id zg3so3445429ejb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NjKjUvNNc/mMAzvuK/7rZA/+OOw9vAShiNxSwcR+y/E=;
        b=kil3EQvNW8EDvxnryHl4owMrAZYjMuELkFBayXuZXb6OzcsfP7MGT643cQIAWMllWG
         XYQtZUZqvNY7Q15L39ZTmhy+DL9Vld7TX7xAlVp76TaJoDrUfnAIu6dMe38mC78+PdiU
         cYuLN4eXe3glUrFsCGzeamYelB53qiVfppDJKGJZRP0dnjKcN8t9WIcNXoG0h1MNtmjt
         z5RO00R/+H1Bfe3d8Ej46qx6lCNg8X1tr6+2LEturnI76Vmd8en3iLBuGnw+m8Tcs49K
         2nv2qMh7ebhc0OLbk9wzl5R/nqQrj1jEiCYEoqN8/ymhK7X2TBy7nXsWXGZvmkzYraPJ
         mHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NjKjUvNNc/mMAzvuK/7rZA/+OOw9vAShiNxSwcR+y/E=;
        b=hbgUXTi98nH/aOsXjOHy1DpT7xzBRIHA0ml5dVsqTxOt1B9aM9KwJftazYKxcL5TLd
         ciitmg0n7WozP4Y41t/OvRghNX4HZIkH6BOKmZMZLgLevWp8faU7DLY9F4rnLYS51oM6
         MATm/6IbIHLRLFPzNCYU+W2AYT41Ss2yNYdCcrVppF3ZOlp7lLgV/+7TRv56cTRTLcFN
         LR72xdMiK/BSbxCHNyWketv+kYmui3+L+7Z9RT82fopPkf1g8p/t7TcvTHDnz7f8NVS3
         Acbkbg2u4Y/P3Kqgs46bL6dafItxsqkMRjR5a4pHN2I8/f30QQK5yPA4MY+nYCCKvhiW
         3Ulw==
X-Gm-Message-State: AOAM531FxKj/0p1gvcSD559xA7WKUCcHmjxqE3PWArjdTE/BBBSyETYp
	6K1uWaTt9NTrvy5mjnLRVJ0bQfwtm3N+1w==
X-Google-Smtp-Source: ABdhPJyvCrr9EZ5oJj3K3zwvbYOuTdNhtiw6SBfTKZ95Pnd1sQlGJa+9i786a4kQrcnAyYp89qcPjg==
X-Received: by 2002:a17:906:4c8e:: with SMTP id q14mr19713135eju.281.1620227950492;
        Wed, 05 May 2021 08:19:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/61] puzzes: update to latest revision
Date: Wed,  5 May 2021 17:18:07 +0200
Message-Id: <20210505151850.660512-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to cmake, drop all the unneeded cruft from the recipe.

License-Update: additional contributors
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...rmat-overflow-if-the-compiler-suppor.patch | 32 ----------------
 meta/recipes-sato/puzzles/puzzles_git.bb      | 38 +++----------------
 2 files changed, 5 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch b/meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch
deleted file mode 100644
index d40a3b1ef9..0000000000
--- a/meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 337799e40350b3db2441cc98f65ec36a74dfb356 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Apr 2017 12:18:08 -0700
-Subject: [PATCH] Use -Wno-error=format-overflow= if the compiler supports it
-
-we need this warning to be suppressed with gcc7+
-however older compilers dont support it so we need
-a way to disble it only if compiler supports it
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3a38c95..bb9035e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -42,7 +42,7 @@ fi
- if test "x$GCC" = "xyes"; then
-   AC_MSG_CHECKING([for usable gcc warning flags])
-   gccwarningflags=
--  for flag in -Wall -Werror -std=c89 -pedantic; do
-+  for flag in -Wall -Werror -std=c89 -pedantic -Wno-error=format-overflow=; do
-     ac_save_CFLAGS="$CFLAGS"
-     ac_save_LIBS="$LIBS"
-     CFLAGS="$CFLAGS$gccwarningflags $flag $GTK_CFLAGS"
--- 
-2.12.2
-
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 16a08585cc..f5e49a4ab2 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -2,17 +2,14 @@ SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=6099f4981f9461d7f411091e69a7f07a"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=93c2525113e094a4a744cf14d4de07e2"
 
-DEPENDS = "libxt"
-
-# The libxt requires x11 in DISTRO_FEATURES
+# gtk support includes a bunch of x11 headers
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
-           file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
            file://fix-ki-uninitialized.patch \
            file://0001-malloc-Check-for-excessive-values-to-malloc.patch \
@@ -20,27 +17,15 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "84cb4c6701e027090ff3fd955ce08065e20121b2"
+SRCREV = "c0da615a933a6676e2c6b957368067ca1bc10abd"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools features_check pkgconfig
-
-PACKAGECONFIG ??= "gtk3"
-PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
-PACKAGECONFIG[gtk3] = "--with-gtk=3,,gtk+3,"
-
-CFLAGS_append = " -Wno-deprecated-declarations"
-
-ASNEEDED = ""
+inherit cmake features_check pkgconfig
 
-do_configure_prepend () {
-    cd ${S}
-    ./mkfiles.pl
-    cd ${B}
-}
+DEPENDS += "gtk+3"
 
 do_install_append () {
     # net conflicts with Samba, so rename it
@@ -68,16 +53,3 @@ STOP
     done
 }
 
-PACKAGES += "${PN}-extra"
-
-FILES_${PN} = ""
-FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
-
-python __anonymous () {
-    var = d.expand("FILES_${PN}")
-    data = d.getVar(var, False)
-    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
-        data = data + " ${bindir}/%s" % name
-        data = data + " ${datadir}/applications/%s.desktop" % name
-    d.setVar(var, data)
-}
-- 
2.31.1

