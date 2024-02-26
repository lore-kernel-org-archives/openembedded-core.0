Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728FEC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 20:48:06 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.4751.1708980484036686426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 12:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=gfCAEEK9;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-68fb71fc886so15427246d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708980483; x=1709585283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOPtPEzLOXN0Cz/fiLTv3Z0B2cDMEQZ9Uqs3vr0oFfw=;
        b=gfCAEEK9x9kpcoPwcTfRZqsPfrUChoiYZ7B7BxlTj/Xt85IKNv2HLMroxXJt+o6PZH
         Jdckw8K25cNwtE0GNDY/RWK8muA8cuT2eOwL7OheeOicpeBQgplqWg6n+c3TiDk+Vgll
         N+KXFgnqG9uC2zOTpb2iDqLpmQY7zDoeioKiupFfcEkG8jZimttOx6pNmlPaYpWKwfis
         /aa1dYcOAS12Y1CjVGeWCTWKYEcPSo3R7XGdYANqJBHj9fvhu+f6tApbXOZUgHoaoZ40
         1JZfM267PV7ssAxNZYz0Upk9dXvtWJCrbTYyMbdrLO/hZq7ivDvqrtgbQ25yMA10V1BO
         wEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708980483; x=1709585283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOPtPEzLOXN0Cz/fiLTv3Z0B2cDMEQZ9Uqs3vr0oFfw=;
        b=P30/KVPb/CVcj0WkKih8euiM7Ya9u52+6nlPVH4XNOIsflUbQ7uP7WkopV95z/aLeL
         GIbXgws1KkqxcQgsNzy6aJ3llOUqpgy8SpZyYJmMoNkZM+IMKwKwUi0Dc+4Gm/yvifT7
         S7dngYTeLL+j/qwv2lHx4a4IAKWW4l0tW/SbNAFoklHLby39T06RvOo7GqGdHKpO+qb6
         HDcSHsuSwP/C0O39mWdM4S7wwi6AhKpNCjcA+kXpWbG98B4n4GgvwGS2md/Wve92m8W+
         f3NT6S3pmc2Iu41lTQgawPLbxmvl0ri4bDFsg1zAQ1OSvLlz5ATuU48smpUpO0tOHR/i
         qpDg==
X-Gm-Message-State: AOJu0YwNhuWroI/xplSFfDl6y49DBIlE1q8kUa98mhTiwu1HAUecZzOO
	GiEE9+JSZ9JVB7J1Cp/6pvHEbyD05MWTfYSyMem3cwfluxqZVEidDiPUm1tkV3m//ko8G7G2iQY
	c
X-Google-Smtp-Source: AGHT+IFe1tvZTcRxdFZUmV+8fvAihPPBSx23w7jh/TVjUli1dWGrSEBGmwqyyIshT77oSyMuWpet+Q==
X-Received: by 2002:a05:6214:2527:b0:68f:f634:f1ed with SMTP id gg7-20020a056214252700b0068ff634f1edmr309970qvb.55.1708980482637;
        Mon, 26 Feb 2024 12:48:02 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id b10-20020a0c9b0a000000b0068fbe6d38f6sm3413142qve.54.2024.02.26.12.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 12:48:02 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] rpm: upgrade 4.19.1 -> 4.19.1.1
Date: Mon, 26 Feb 2024 15:48:01 -0500
Message-ID: <20240226204801.2519944-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 20:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196219

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
 ...code-lib-rpm-as-the-installation-path-for.patch | 14 ++++++++++----
 .../rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb}         |  7 +++----
 2 files changed, 13 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb} (96%)

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


