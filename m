Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EB3C64EC7
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:31:17 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2098.1676399473175128371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C5bGkq2b;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id nd22so8481561qvb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3SIeRNr/ccvA8qP/lD2lRJFg3rQvDfCVmMKncwNRHHE=;
        b=C5bGkq2bmq9jPw2IsptTBrZHlJTumLl31xmol6X3iTXVUV280iT5Vvmk53G1wXUYzT
         6fceGO1apPklAuN2or9LFGMVGX3vS99W+lROATQg/wwS8PNMVtNEIfNV8y3hi5cecQ7/
         PY6j0LPjEnvDnhylAL6ACIYsd184T0XmvU+hHokOb0RTzcaEvVz8xDMY+fxw3gmVSNnN
         s651HZiiRvfWxiHhGQVXsDvYmpSX8TzeR2YIzQnMzUvwFZufmvhC7tUaXtd1ZHj/NE48
         laeFonMP3JegEVBcrOY5gSYarOq8FHqj9dKnnCVxv/9ZobmdegY1iLyAP0tiTkN/AolV
         fTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SIeRNr/ccvA8qP/lD2lRJFg3rQvDfCVmMKncwNRHHE=;
        b=6LX8DlT07+HuQi9w/kLI9xi+9vlkz0YpQj3ei1wZk7PVPiAH3r2Wkym9C0Tri1aD88
         hmeG5+GX4gj+dqo0lG9HWR3hbSmT4wnlCSrT4BPrPwDYe9yo8XMGsWnBltHLzpWFg24P
         F/ftKlm36ZFnVlUb1goP2chG7BrfsaBN0Tr3S5++Q0MGIjPVeOnAFKPglov9dc5nLX/I
         /iMVJncEIwk/mOCIl+IqUD+ZAy7/GdqW6BD1M/61byLP3KWwrLRNM2P6dxlHoN0XspwD
         9f64PCxsSlvxd9tLn5CpLDLuKDYPW46TXjtHW0Sp0W7dIck7qvBVRZXmbsseOnZEQskJ
         82uw==
X-Gm-Message-State: AO0yUKWmqaOyEPzypmQOrnUN5wtGk/8sMEM6/YTLiaytktXUWLljmS4C
	wM2vZ22rVIeIFYrwL45caldPvPfNZ/8=
X-Google-Smtp-Source: AK7set/07c8WBVq0v1FFfWnJvPIsSb5m+gsLUdoDDh1EzVTiy1BgSO3Ajeq4bwcJogUZ/lcHOtHWrg==
X-Received: by 2002:ad4:5e8e:0:b0:56b:fb0d:d8f0 with SMTP id jl14-20020ad45e8e000000b0056bfb0dd8f0mr7557191qvb.9.1676399471563;
        Tue, 14 Feb 2023 10:31:11 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e7-20020a378207000000b0071a49ac0e05sm12184387qkd.111.2023.02.14.10.31.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:31:10 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/4] dtc: version bump and add python wrapper
Date: Tue, 14 Feb 2023 13:30:58 -0500
Message-Id: <20230214183101.33761-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177170

Bump the version of dtc from 1.6.1 to to 1.7.0.

Add support for building the python wrapper around libfdt.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...tdump-fix-Werror-int-to-pointer-cast.patch | 40 -------------------
 meta/recipes-kernel/dtc/dtc/0001-meson.patch  | 37 +++++++++++++++++
 .../dtc/{dtc_1.6.1.bb => dtc_1.7.0.bb}        | 18 +++++----
 3 files changed, 48 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.patch
 rename meta/recipes-kernel/dtc/{dtc_1.6.1.bb => dtc_1.7.0.bb} (51%)

diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
deleted file mode 100644
index 4c3e34b1ffd2..000000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Fix the build of fdtdump with mingw.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ae0ce1fa7f4d679b5f8df1fc0e797246e43547fe Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
-Date: Wed, 25 Aug 2021 16:13:50 +0400
-Subject: [PATCH] fdtdump: fix -Werror=int-to-pointer-cast
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With mingw64-gcc, the compiler complains with various warnings:
-error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
-
-Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210825121350.213551-1-marcandre.lureau@redhat.com>
-Acked-by: Rob Herring <robh@kernel.org>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
----
- fdtdump.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fdtdump.c b/fdtdump.c
-index d9fb374..483f367 100644
---- a/fdtdump.c
-+++ b/fdtdump.c
-@@ -21,7 +21,7 @@
- #define MAX_VERSION 17
- 
- #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
--#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
-+#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
- #define GET_CELL(p)	(p += 4, *((const fdt32_t *)(p-4)))
- 
- static const char *tagname(uint32_t tag)
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
new file mode 100644
index 000000000000..10c4f8706194
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
@@ -0,0 +1,37 @@
+From faa02d4a60859089017bf92e0e3f49d600c44d73 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Sun, 12 Feb 2023 14:37:04 -0500
+Subject: [PATCH] allow pylibfdt in cross
+
+Allow pylibfdt to be built even in cross-development scenarios.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ meson.build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index b23ea1b159b2..34a21a6dc783 100644
+--- a/meson.build
++++ b/meson.build
+@@ -118,11 +118,11 @@ if get_option('tools')
+   )
+ endif
+ 
+-if not meson.is_cross_build()
+-  if py.found() and swig.found()
+-    subdir('pylibfdt')
+-  endif
++if py.found() and swig.found()
++  subdir('pylibfdt')
++endif
+ 
++if not meson.is_cross_build()
+   if get_option('tools')
+     subdir('tests')
+   endif
+-- 
+2.36.0.rc2.17.g4027e30c53
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
similarity index 51%
rename from meta/recipes-kernel/dtc/dtc_1.6.1.bb
rename to meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 2a6ac089a338..445bf54f8581 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -1,15 +1,18 @@
 SUMMARY = "Device Tree Compiler"
 HOMEPAGE = "https://devicetree.org/"
-DESCRIPTION = "The Device Tree Compiler is a tool used to manipulate the Open-Firmware-like device tree used by PowerPC kernels."
+DESCRIPTION = "The Device Tree Compiler is a toolchain for working with device tree source and binary files."
+DEPENDS = "bison-native python3-setuptools-scm-native swig-native libyaml"
 SECTION = "bootloader"
 LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
+                    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
+                    file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
-           file://0001-fdtdump-fix-Werror-int-to-pointer-cast.patch"
-SRCREV = "b6910bec11614980a21e46fbccc35934b671bd81"
+           file://0001-meson.patch"
+PV = "1.7.0+git${SRCPV}"
+SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
@@ -17,14 +20,15 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
-EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
+EXTRA_OEMESON = "-Dvalgrind=disabled"
 
 PACKAGECONFIG ??= "tools"
-PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native bison-native"
+PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native"
 PACKAGECONFIG[yaml] = "-Dyaml=enabled,-Dyaml=disabled,libyaml"
 
-PACKAGES =+ "${PN}-misc"
+PACKAGES =+ "${PN}-misc ${PN}-pylibfdt"
 FILES:${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
+FILES:${PN}-pylibfdt = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-misc += "${@bb.utils.contains('PACKAGECONFIG', 'tools', 'bash diffutils', '', d)}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.36.0.rc2.17.g4027e30c53


