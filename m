Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DA4D5E391
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:39:16 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24246.1765895955330671693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=12Lvby+x;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a2ad13c24so27830876d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765895954; x=1766500754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyWXMV6/6RqD3Pmclc4y8XHDVu5BposNaOvgIDX8Ft4=;
        b=12Lvby+xX1ejgfoszeDmmGZe5BBOq8XBVvB+m/8EIKqZ+bvshCZpTKUZalr8x/LGQG
         3bwQt6jeZxVaKuU3IwKSeEcyPyZqF+q7q3amQAIv48y/Q4aexOehrXdiu6D6oVzznx36
         G0KAzPdtbsr8d6maTrjNEgI5ux7gqztdZK/jpwUZqQN8X1sA2sXWhTweTsGoXB6AlaEV
         FVNtMn4LqVOYKdfgPUkFr4EYNynOYytrfCCM++XLIglt82rlZLPei9xDG+GLQW59qpzW
         P1Ifn1j0ln0a6feeyDyZLPbOKKDpaWv/Kmn6IqFlgAIrPOF2YFjLAcPEPMFyu7zJFFNv
         R8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895954; x=1766500754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyWXMV6/6RqD3Pmclc4y8XHDVu5BposNaOvgIDX8Ft4=;
        b=sHg31gNuqRVLyo4xoS9uzujWAAgcCKh2gtXkls2KBUkJpWSDgvgqFDQ7aX7q8V7IpY
         s0fKVxL5+M9Ms6v3ABBJA5/C/ojDYVTtAZie7fOvo7qFKxVx3ScUf939HL/uIN8LLEWM
         Ot4PI279CsAd8GFxvX9B2ZP3K4OoccOHkrQmgGU2krhFTWGJTzsKZHvi8qdVu+EAwJ8g
         kuytRST5VRi74Z9X+98W2QSFO2muYTmVA9Sr9gTMsRM7Tr+R+xRge6LM+gdUtu2fmT6x
         tWzXYPcPOHBKgLWJMNDvpp9MZSgs8Ggl5o3RxbfNKZQM8jFoq9vA7HedVaRUyt/FzJSr
         lptw==
X-Gm-Message-State: AOJu0YwAPejb8GkAHWJ9w9sHTJ6xlR4dUhUQOka9F86EcrrM3o/IerIE
	QEWK0ft8X5Ydkuf2ZRiU0RiywE5nbTrSDQhH2IA5sJaRypweUyZzhtMAv0O0Y3v8Ws7eKm1kUuK
	3vFnsJyw=
X-Gm-Gg: AY/fxX4wkVpnUCyDnZk/m7FssLX7W/VMwhRCZ8J3uWRkEvR4NcUU3oQIF/SkvBelxR5
	nxj5QQMeJ+hDXwUnas8nXdhx4bCHXbYCQaJRtWbyfluP+G5mJ3w+/vQHVfBMMlswhp/vmQtVihV
	wYrcuIBMYrtzS3c6dvW63+Br5a0TiJKXAmI2N2cd84ViH6dUUqX+xgOCl6YuJ/5Vy32C6R3xKww
	Usee6FtHAbFzgssaSaTrlA4fs5wHYt3lqP3zUr6NuIgtLVKCubiGTvkZ2dAFKOL8dMpRghA9hWR
	hrrVZ+O4hfyIe0SftUIk/kyf9mbw+aIywmUOuhkhryLu5XBH8/zxL7Ebrl4+FLWyHlfA6FnxxJp
	pQwvQW56DiSkQpGryswtX5BVgkSmD7k+shvVZppvOVH7j1urlF5bK98sOc2jny8XbDSaUilOJNU
	uRt55b5D4NS46qd0M=
X-Google-Smtp-Source: AGHT+IHEbAgAAvYagH4V1AbPJKNF8iIShW1mbLLE/a4GSjQ75wTUgR7SG2kF78ZIkAzV2ezJumpFpg==
X-Received: by 2002:a05:6214:390c:b0:88a:2e39:957e with SMTP id 6a1803df08f44-88a2e39986dmr117128386d6.57.1765895953530;
        Tue, 16 Dec 2025 06:39:13 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993c659d3sm76533166d6.24.2025.12.16.06.39.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:39:12 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] rpm: handle CMake Python paths in EXTRA_OECMAKE
Date: Tue, 16 Dec 2025 09:38:59 -0500
Message-ID: <20251216143901.2542490-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216143901.2542490-1-tgamblin@baylibre.com>
References: <20251216143901.2542490-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227959

With the Python 3.14.0 upgrade, rpm is finding the wrong paths with
CMake, leading to a QA issue for files that we have listed in FILES
already:

|ERROR: QA Issue: rpm: Files/directories were installed but not shipped in any package:
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm-4.20.1-py3.14.egg-info
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/_rpm.so
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/transaction.py
|  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/__init__.py
|Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
|rpm: 4 installed and not shipped files. [installed-vs-shipped]

Add a patch to make it possible to override Python3_SITEARCH in rpm's
python/CMakeLists.txt by setting PYTHON_INSTALL_DIR in EXTRA_OECMAKE.

Build looks OK, as does reproducibility:

|2025-12-12 12:29:00,504 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/tgamblin/workspace/yocto/openembedded-core/build-st/conf/local.conf
|2025-12-12 12:29:00,504 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
|2025-12-12 12:29:00,504 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
|2025-12-12 12:30:41,633 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
|2025-12-12 12:35:08,628 - oe-selftest - INFO - Building reproducibleB-extended (sstate NOT allowed)...
|2025-12-12 12:54:33,755 - oe-selftest - INFO - Checking deb packages for differences...
|2025-12-12 12:54:34,147 - oe-selftest - INFO - Reproducibility summary for deb: same=937 different=0 different_excluded=0 missing=0 total=937
|unused_exclusions=[]
|2025-12-12 12:54:34,148 - oe-selftest - INFO - Checking ipk packages for differences...
|2025-12-12 12:54:34,427 - oe-selftest - INFO - Reproducibility summary for ipk: same=937 different=0 different_excluded=0 missing=0 total=937
|unused_exclusions=[]
|2025-12-12 12:54:34,427 - oe-selftest - INFO - Checking rpm packages for differences...
|2025-12-12 12:54:34,655 - oe-selftest - INFO - Reproducibility summary for rpm: same=937 different=0 different_excluded=0 missing=0 total=937
|unused_exclusions=[]
|2025-12-12 12:54:34,656 - oe-selftest - INFO -  ... ok
|2025-12-12 12:56:15,651 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-12-12 12:56:15,651 - oe-selftest - INFO - Ran 1 test in 1635.716s
|2025-12-12 12:56:15,651 - oe-selftest - INFO - OK
|2025-12-12 12:56:18,842 - oe-selftest - INFO - RESULTS:
|2025-12-12 12:56:18,842 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1534.15s)
|2025-12-12 12:56:20,706 - oe-selftest - INFO - SUMMARY:
|2025-12-12 12:56:20,706 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1635.716s
|2025-12-12 12:56:20,706 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...s.txt-allow-overriding-Python-instal.patch | 53 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-python-CMakeLists.txt-allow-overriding-Python-instal.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-python-CMakeLists.txt-allow-overriding-Python-instal.patch b/meta/recipes-devtools/rpm/files/0001-python-CMakeLists.txt-allow-overriding-Python-instal.patch
new file mode 100644
index 0000000000..bd04c49261
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-python-CMakeLists.txt-allow-overriding-Python-instal.patch
@@ -0,0 +1,53 @@
+From a5c21ca9c925aac2ea43a443a31e390a6dfe5e40 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 12 Dec 2025 10:59:24 -0500
+Subject: [PATCH] python/CMakeLists.txt: allow overriding Python install dir
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/4072]
+
+Allow optionally overriding the PYTHON_INSTALL_DIR variable instead of
+relying solely on the value of Python3_SITEARCH. This is useful for
+cross-compilation scenarios as of Python 3.14 (which has stricter
+sysconfig settings), e.g. with Yocto builds, where Python files get
+installed to native instead of target paths. In such cases the
+FindPython3 function may find the native version and use those sysconfig
+values, which is incorrect.
+
+If PYTHON_INSTALL_DIR is not set, we continue using the computed value
+of Python3_SITEARCH.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ python/CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index 21f89edfd..4eca82129 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -23,13 +23,19 @@ target_compile_definitions(_rpm PRIVATE Py_LIMITED_API=0x030A0000)
+ 
+ target_link_libraries(_rpm PRIVATE librpmio librpm librpmbuild librpmsign)
+ 
++# Allow overriding of Python installation directory for cross-compilation
++# scenarios
++if(NOT DEFINED PYTHON_INSTALL_DIR)
++	set(PYTHON_INSTALL_DIR ${Python3_SITEARCH})
++endif()
++
+ install(TARGETS _rpm
+-	DESTINATION ${Python3_SITEARCH}/rpm)
++	DESTINATION ${PYTHON_INSTALL_DIR}/rpm)
+ install(FILES rpm/transaction.py rpm/__init__.py
+-	DESTINATION ${Python3_SITEARCH}/rpm)
++	DESTINATION ${PYTHON_INSTALL_DIR}/rpm)
+ install(DIRECTORY examples TYPE DOC)
+ 
+ set(egginfo ${PROJECT_NAME}-${PROJECT_VERSION}-py${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}.egg-info)
+ configure_file(rpm.egg-info.in ${egginfo} @ONLY)
+ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${egginfo}
+-	DESTINATION ${Python3_SITEARCH})
++	DESTINATION ${PYTHON_INSTALL_DIR})
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index ba967ec1fa..803fa272dc 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
            file://0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch \
+	   file://0001-python-CMakeLists.txt-allow-overriding-Python-instal.patch \
            "
 
 PE = "1"
@@ -47,7 +48,7 @@ SRCREV = "c8dc5ea575a2e9c1488036d12f4b75f6a5a49120"
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
-EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
+EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
 EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.52.0


