Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E04BC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 20:56:46 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.5022.1708980998675264631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 12:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Sopaxd4E;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42e29149883so16114391cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 12:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708980997; x=1709585797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsrxVteMjA7OCWQDnDGci/gIJrQ3JMIVS1F4JyFK2Co=;
        b=Sopaxd4EZrgKfJT2cODMhpytf470Ug4DAO4GES528ptknOAnCtxUE9aiXjW54YeSHM
         mgFQD2vzQ5OU9iEapapy6hz3itZco0JgnEvXw8vo8izxPqTy5h4yyaSQZUf7akcNhmkj
         5SvpVmNagF1ZsRdHLBx6Evm5zw+HDDul40fdL4yDHDOs2QjZmacst/DAZDjK4UVrfa/r
         hcBS7zY4gcnCetPPJgiLqO6cgAlPboD7twBRvlZDfDNWTuqJ5XEQPBxJ4KOoX6CwOk9X
         ICG430k5eQM85kfL4OEeSWWJpK/4fxUqKTPeeWqzJo96BcIiBx79rWLKEuYPe5k/V2pN
         QvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708980997; x=1709585797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsrxVteMjA7OCWQDnDGci/gIJrQ3JMIVS1F4JyFK2Co=;
        b=NKpqASE1m/OUVxPOg187T4vKPdYbnh06HG/v4Ws+th8mHAhaLms2y0eyx0p2/UTCI1
         ETiQqT92luJcYzPNlG6j5Joxxh8qYsd/n94V/6+OyW7ia1mDmOSwjmQ9XHnTVbYhNv3e
         sDkrCEME24v8qB2WkdCZhcWpIFQ1EEkB8Ee+aCvngYY3uL+S8aauKjczxMYtWUeaXk8j
         lRTXeMKXVbkBh3rhxKaGWEfdzm2HPtpj2sJTI1R+I4Xjwgb5HbeAF5QzcXW2BGD+FBoW
         oEB+PKmarmQu81dgpDiwYUkdFl6P3FU8kSEJQy8xU08wYTvAxMDWTZXwokzVejXVaw2l
         2u2w==
X-Gm-Message-State: AOJu0YxkjXa9ZA/0+tb5QHmk8OvORmo28o+W1USlTOdY9WSLDwNxqXOo
	bayillAIQPYuW3F5hmPi8y/D1ZyEoQOeukIsTM0yFBt0x0dEoLHSU1ArCLIC7KxSl48HM+ZQFlo
	U
X-Google-Smtp-Source: AGHT+IFsFK3Lvb4LOR4fRiO0nv4upQ4JjSKB8F/904cU30ANu+DFezOicZwVx/bXJskqegz4OhBfJw==
X-Received: by 2002:a05:622a:1048:b0:42e:915c:2358 with SMTP id f8-20020a05622a104800b0042e915c2358mr2098580qte.33.1708980997442;
        Mon, 26 Feb 2024 12:56:37 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id qm12-20020a056214568c00b0068f11bec5desm3338225qvb.78.2024.02.26.12.56.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 12:56:37 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] rpm: upgrade 4.19.1 -> 4.19.1.1
Date: Mon, 26 Feb 2024 15:56:36 -0500
Message-ID: <20240226205636.2520276-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 20:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196221

Changelog (see also http://rpm.org/wiki/Releases/4.19.1.1):
- Packaging: Don’t warn about missing user/group on skipped files Regression (#2814)
- Packaging: Make user/group lookup caching thread-safe Regression (#2843)
- Lua interface: Fix regression in Lua scriptlet runaway child detection Regression (#2818)
- Build: CMakeLists.txt: restore readline support as an explicit option Regression (#2852)
- Build: Fix unconditional uses of Linux-specific extensions Regression (#2812)
- Build: Add missing include for check_symbol_exists (#2831)
- Build: Don’t use _nl_msg_cat_cntr if it’s not available (#2856)

The following patches were removed as they're included in the release:

- 0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
- 0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
- 0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch

The following patch was adjusted to apply on 4.19.1.1:
- 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch

The new version introduces a buildpath QA issue:

WARNING: rpm-1_4.19.1.1-r0 do_package_qa: QA Issue: File
/usr/lib/cmake/rpm/rpm-targets.cmake in package rpm-dev contains
reference to TMPDIR [buildpaths]

This has been dealt with by adding a new sed call in do_install:append.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 actually removes the files for patches that were applied upstream,
whereas v1 only removed them from the recipe.

 ...estore-readline-support-as-an-explic.patch | 42 --------------
 ...lib-rpm-as-the-installation-path-for.patch | 14 +++--
 ...l-dependency-on-non-POSIX-GLOB_ONLYD.patch | 56 -------------------
 ...txt-do-not-install-non-existent-docs.patch | 26 ---------
 .../rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb}    |  7 +--
 5 files changed, 13 insertions(+), 132 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
 rename meta/recipes-devtools/rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb} (96%)

diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
deleted file mode 100644
index db83b176b41..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3c2e529c6cc1bae4bc94cbed7358c6e0cdd2de02 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 16 Jan 2024 13:43:36 +0100
-Subject: [PATCH] CMakeLists.txt: restore readline support as an explicit
- option
-
-This was lost in autotools -> cmake transition. The particular
-reason to make it explicit is that readline is gpl version 3
-licensed, and in some builds components under that license
-need to be excluded.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2852]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0a474106e..89e27417f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -31,6 +31,7 @@ option(WITH_AUDIT "Build with audit support" ON)
- option(WITH_FSVERITY "Build with fsverity support" OFF)
- option(WITH_IMAEVM "Build with IMA support" OFF)
- option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
-+option(WITH_READLINE "Build with readline support" ON)
- 
- set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
- set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
-@@ -193,7 +194,11 @@ find_package(BZip2)
- find_package(Iconv)
- 
- pkg_check_modules(POPT REQUIRED IMPORTED_TARGET popt)
--pkg_check_modules(READLINE IMPORTED_TARGET readline)
-+
-+if (WITH_READLINE)
-+    pkg_check_modules(READLINE REQUIRED IMPORTED_TARGET readline)
-+endif()
-+
- pkg_check_modules(ZSTD IMPORTED_TARGET libzstd>=1.3.8)
- pkg_check_modules(LIBELF IMPORTED_TARGET libelf)
- pkg_check_modules(LIBDW IMPORTED_TARGET libdw)
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index b056d19741a..fc7e9501b90 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 7948f21e08bc7552b281ed0098a9c8099d2370cb Mon Sep 17 00:00:00 2001
+From 5661e6a0a9c0576fc259d4859a14928dbc514b8d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -7,18 +7,21 @@ Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
 Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
+Update patch to apply on top of 4.19.1.1.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  CMakeLists.txt | 2 +-
  macros.in      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2767915fb..7f0630453 100644
+index 7808115c1..4a383ceba 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,7 +32,7 @@ option(WITH_FSVERITY "Build with fsverity support" OFF)
- option(WITH_IMAEVM "Build with IMA support" OFF)
+@@ -33,7 +33,7 @@ option(WITH_IMAEVM "Build with IMA support" OFF)
  option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
+ option(WITH_READLINE "Build with readline support" ON)
  
 -set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/lib/rpm" CACHE PATH "rpm home")
 +set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
@@ -38,3 +41,6 @@ index b49ffaad4..3acbe78f6 100644
  %_includedir		%{_prefix}/include
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
+-- 
+2.43.2
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch b/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
deleted file mode 100644
index 8e73e077049..00000000000
--- a/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1b3a182f38895de5ea8dda5a77867345845fb967 Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Mon, 18 Dec 2023 12:25:04 +0200
-Subject: [PATCH] Fix unconditional dependency on non-POSIX GLOB_ONLYDIR flag
-
-This regressed when we axed our internal glob copy in commit
-66fa46c006bae0f28d93238b8f7f1c923645eee5. Luckily GLOB_ONLYDIR is only
-an optimization so we can just skip it if not available.
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/57f3711846f44da0f37cbc5dd66e8fba80a3bee1]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- CMakeLists.txt  | 1 +
- config.h.in     | 1 +
- rpmio/rpmglob.c | 2 ++
- 3 files changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d0ea565f3..0a474106e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -351,6 +351,7 @@ if (LIBDW_FOUND)
- 	set(HAVE_LIBDW 1)
- endif()
- 
-+check_symbol_exists(GLOB_ONLYDIR "glob.h" HAVE_GLOB_ONLYDIR)
- check_symbol_exists(major "sys/sysmacros.h" MAJOR_IN_SYSMACROS)
- if (NOT MAJOR_IN_SYSMACROS)
- 	check_symbol_exists(major "sys/mkdev.h" MAJOR_IN_MKDEV)
-diff --git a/config.h.in b/config.h.in
-index cb97827d0..ab1757a9a 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -100,6 +100,7 @@
- #cmakedefine HAVE_ZSTD @HAVE_ZSTD@
- #cmakedefine HAVE___PROGNAME @HAVE___PROGNAME@
- #cmakedefine HAVE___SECURE_GETENV @HAVE___SECURE_GETENV@
-+#cmakedefine HAVE_GLOB_ONLYDIR @HAVE_GLOB_ONLYDIR@
- #cmakedefine MAJOR_IN_MKDEV @MAJOR_IN_MKDEV@
- #cmakedefine MAJOR_IN_SYSMACROS @MAJOR_IN_SYSMACROS@
- #cmakedefine RUNDIR @rundir@
-diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
-index 8276eddb4..243568766 100644
---- a/rpmio/rpmglob.c
-+++ b/rpmio/rpmglob.c
-@@ -84,8 +84,10 @@ int rpmGlobPath(const char * pattern, rpmglobFlags flags,
-     gflags |= GLOB_BRACE;
-     if (home != NULL && strlen(home) > 0) 
- 	gflags |= GLOB_TILDE;
-+#if HAVE_GLOB_ONLYDIR
-     if (dir_only)
- 	gflags |= GLOB_ONLYDIR;
-+#endif
-     if (flags & RPMGLOB_NOCHECK)
- 	gflags |= GLOB_NOCHECK;
- 
diff --git a/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch b/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
deleted file mode 100644
index e7f0adc70c9..00000000000
--- a/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4e388caabf0906f09d697b8d08623a022f7270b2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 29 Nov 2023 14:09:06 +0100
-Subject: [PATCH] docs/CMakeLists.txt: do not install non-existent docs/html
-
-Building html would require doxygen-native.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- docs/CMakeLists.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt
-index 52dce7b4e..c01ff7757 100644
---- a/docs/CMakeLists.txt
-+++ b/docs/CMakeLists.txt
-@@ -18,7 +18,6 @@ if (DOXYGEN_FOUND)
- elseif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/html/index.html)
- 	set(doxsrc ${CMAKE_CURRENT_SOURCE_DIR})
- endif()
--install(DIRECTORY ${doxsrc}/html/ DESTINATION ${CMAKE_INSTALL_DOCDIR}/API)
- 
- install(FILES
- 	README.md
diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
similarity index 96%
rename from meta/recipes-devtools/rpm/rpm_4.19.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index 1f8611a29cb..b017cf6fe23 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -37,14 +37,11 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protoc
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
-           file://0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
-           file://0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch \
-           file://0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch \
            "
 
 PE = "1"
-SRCREV = "98b301ebb44fb5cabb56fc24bc3aaa437c47c038"
+SRCREV = "13b4521341781293c41ac898aa9c2d2f6bc1f21d"
 
 S = "${WORKDIR}/git"
 
@@ -136,6 +133,8 @@ do_install:append () {
             -e 's:${STAGING_DIR_NATIVE}/::g' \
 	    ${D}/${libdir}/rpm/macros
 
+	sed -i -e 's:${RECIPE_SYSROOT}::g' \
+	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
 }
 
 FILES:${PN} += "${libdir}/rpm-plugins/*.so \
-- 
2.43.2


