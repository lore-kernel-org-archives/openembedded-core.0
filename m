Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88E3C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 10:16:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.19408.1706091367083573936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 02:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fXVxJCQW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso51551265e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 02:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706091365; x=1706696165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ss8lSFc05oCec9ee/PwdYrmVjGFDdJ59KQdbkHtpZk=;
        b=fXVxJCQWauDL6w2wiwv275tIqQuLaOn5yxQCFrdP7h1sqfZV0JngXRDyAttskViy0B
         VSsS5rlHSdNAdIwfQwUMkMUACm3z8105mgUewjvCreCPmrZWHmRUcab1LGyWATPvmknF
         jCE2t1ihmc32Uhbj3F5QYmALv/t6kaACwOVc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091365; x=1706696165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ss8lSFc05oCec9ee/PwdYrmVjGFDdJ59KQdbkHtpZk=;
        b=wHdiMYpMkm8s5i4Po68St0giNgx1fvZCXfgoaNQIpqwQkplZzhx2Am5msQ1eIlbAGq
         JJxUP7DNntykYRJm2Ys+UJN7+dZ7Bqw+ftTOmuLKrmP0cbENvROzKLZlPdMACLNIavKw
         JZ7BmMKD3P0sub1CL8cWQqX80oCJk4wgsAP3b9MD2g4+rgzTHDHqwHmcnB3j8263Kj89
         3cwAsNHJa5mKnCGwyaZpCQZSjxpH7I/r5yh7E/7odb7DnxkXrBES4xQMf//wGft+T1K8
         WL6SICG6+hdkqNELcbS0HZ5Sf10tHD8bK4DovHiMWfNk2a3sgKyGCfkOSzWg/T5kyhF7
         N0lA==
X-Gm-Message-State: AOJu0YxrG2zvMrTlr373a26baWgrD6ibTn56w479j36r1p5Di3ELi00Y
	uxg8h/nLZhiCACzdwMO/4Ws+cOYFquH5E3xYwEd1f+2u/bfGG1BKPS8VvwDfVXAT63IdKhdQFGU
	V
X-Google-Smtp-Source: AGHT+IFRlQwlulhgotlkDuvnnGcce2sxnP1ATDPiJFarvycub/GVZGOIR6hTZb+HEpYgsCwf0uJZow==
X-Received: by 2002:a05:600c:3515:b0:40e:6703:af8a with SMTP id h21-20020a05600c351500b0040e6703af8amr1017620wmq.41.1706091364308;
        Wed, 24 Jan 2024 02:16:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:27a9:6a99:2170:a4d6])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b0040e39cbf2a4sm49626252wmo.42.2024.01.24.02.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:16:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 8.1.2 -> 8.2.0
Date: Wed, 24 Jan 2024 10:16:03 +0000
Message-Id: <20240124101603.717964-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 10:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194267

We can drop the mips workaround patch since there were fixes in 8.2.0.

The build system changed and we should drop cross.patch and replace it with
explicit settings for cross-prefix, and host-cc. To make that work we need
to indicate we don't use a cross pkg-config.

PIE isn't availale for mingw so tweak PACKAGECONFIG accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...u-native_8.1.2.bb => qemu-native_8.2.0.bb} |  0
 ...e_8.1.2.bb => qemu-system-native_8.2.0.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           | 13 ++++---
 meta/recipes-devtools/qemu/qemu/cross.patch   | 38 -------------------
 .../qemu/qemu/fixedmeson.patch                | 12 +++---
 meta/recipes-devtools/qemu/qemu/fixmips.patch | 18 ---------
 meta/recipes-devtools/qemu/qemu/no-pip.patch  | 16 ++++----
 .../qemu/{qemu_8.1.2.bb => qemu_8.2.0.bb}     |  0
 9 files changed, 22 insertions(+), 77 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.2.bb => qemu-native_8.2.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.2.bb => qemu-system-native_8.2.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/cross.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fixmips.patch
 rename meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.2.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 3720a4c5b86..a12b202e432 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.41%"
 GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.38%"
 LINUXLIBCVERSION ?= "6.6%"
-QEMUVERSION ?= "8.1%"
+QEMUVERSION ?= "8.2%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "17.%"
 RUSTVERSION ?= "1.74%"
diff --git a/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-native_8.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4ebf17e6c00..ccb28804029 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,7 +32,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://fixedmeson.patch \
-           file://fixmips.patch \
            file://0001-vfio-Include-libgen.h-for-basename-API.patch \
            file://no-pip.patch \
            file://qemu-guest-agent.init \
@@ -41,10 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
-
-SRC_URI:append:class-target = " file://cross.patch"
-SRC_URI:append:class-nativesdk = " file://cross.patch"
+SRC_URI[sha256sum] = "bf00d2fa12010df8b0ade93371def58e632cb32a6bfdc5f5a0ff8e6a1fb1bf32"
 
 CVE_STATUS[CVE-2017-5957] = "cpe-incorrect: Applies against virglrender < 0.6.0 and not qemu itself"
 
@@ -117,9 +113,13 @@ EXTRA_OECONF = " \
     --extra-ldflags='${LDFLAGS}' \
     --disable-download \
     --disable-docs \
+    --host-cc=${BUILD_CC} \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
+EXTRA_OECONF:append:class-target = " --cross-prefix=${HOST_PREFIX}"
+EXTRA_OECONF:append:class-nativesdk = " --cross-prefix=${HOST_PREFIX}"
+
 B = "${WORKDIR}/build"
 
 #EXTRA_OECONF:append = " --python=${HOSTTOOLS_DIR}/python3"
@@ -133,6 +133,7 @@ do_configure:prepend:class-native() {
 }
 
 do_configure() {
+    export PKG_CONFIG=pkg-config
     ${S}/configure ${EXTRA_OECONF}
 }
 do_configure[cleandirs] += "${B}"
@@ -176,7 +177,7 @@ do_install:append() {
 
 # Disable kvm/virgl/mesa on targets that do not support it
 PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
-PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
+PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+ pie"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
deleted file mode 100644
index 112eb92593a..00000000000
--- a/meta/recipes-devtools/qemu/qemu/cross.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 76c3fc4c87231bed32974ebbbdb5079cff45a6b7 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 5 Jan 2021 23:00:14 +0000
-Subject: [PATCH 12/12] qemu: Upgrade 5.1.0->5.2.0
-
-We need to be able to trigger configure's cross code but we don't want
-to set cross_prefix as it does other things we don't want. Patch things
-so we can do what we need in the target config case.
-
-Upstream-Status: Inappropriate [may be rewritten in a way upstream may accept?]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
----
- configure | 4 ----
- 1 file changed, 4 deletions(-)
-
-Index: qemu-8.0.0/configure
-===================================================================
---- qemu-8.0.0.orig/configure
-+++ qemu-8.0.0/configure
-@@ -2590,7 +2590,6 @@ if test "$skip_meson" = no; then
-   echo "widl = [$(meson_quote $widl)]" >> $cross
-   echo "windres = [$(meson_quote $windres)]" >> $cross
-   echo "windmc = [$(meson_quote $windmc)]" >> $cross
--  if test "$cross_compile" = "yes"; then
-     cross_arg="--cross-file config-meson.cross"
-     echo "[host_machine]" >> $cross
-     echo "system = '$targetos'" >> $cross
-@@ -2608,9 +2607,6 @@ if test "$skip_meson" = no; then
-     else
-         echo "endian = 'little'" >> $cross
-     fi
--  else
--    cross_arg="--native-file config-meson.cross"
--  fi
-   mv $cross config-meson.cross
- 
-   rm -rf meson-private meson-info meson-logs
diff --git a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch b/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
index 0cbaea07ca6..9047f66dc3b 100644
--- a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
+++ b/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
@@ -1,12 +1,12 @@
 Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
 
-Index: qemu-8.1.0/configure
+Index: qemu-8.2.0/configure
 ===================================================================
---- qemu-8.1.0.orig/configure
-+++ qemu-8.1.0/configure
-@@ -1032,12 +1032,7 @@ then
-     exit 1
- fi
+--- qemu-8.2.0.orig/configure
++++ qemu-8.2.0/configure
+@@ -955,12 +955,7 @@ fi
+ $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
+      ${source_path}/pythondeps.toml meson || exit 1
  
 -# At this point, we expect Meson to be installed and available.
 -# We expect mkvenv or pip to have created pyvenv/bin/meson for us.
diff --git a/meta/recipes-devtools/qemu/qemu/fixmips.patch b/meta/recipes-devtools/qemu/qemu/fixmips.patch
deleted file mode 100644
index 01546d1030f..00000000000
--- a/meta/recipes-devtools/qemu/qemu/fixmips.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Patch to fix mips boot hangs where virtio appears broken. Patch under discussion upstream. 
-Regression is introduced by other fixes to 8.1.0 to get x86 boots working.
-
-Upstream-Status: Pending [https://lore.kernel.org/qemu-devel/6c956b90-5a13-db96-9c02-9834a512fe6f@linaro.org/]
-
-Index: qemu-8.1.0/softmmu/physmem.c
-===================================================================
---- qemu-8.1.0.orig/softmmu/physmem.c
-+++ qemu-8.1.0/softmmu/physmem.c
-@@ -2517,7 +2517,7 @@ static void tcg_commit(MemoryListener *l
-      * That said, the listener is also called during realize, before
-      * all of the tcg machinery for run-on is initialized: thus halt_cond.
-      */
--    if (cpu->halt_cond) {
-+    if (cpu->halt_cond && !qemu_cpu_is_self(cpu)) {
-         async_run_on_cpu(cpu, tcg_commit_cpu, RUN_ON_CPU_HOST_PTR(cpuas));
-     } else {
-         tcg_commit_cpu(cpu, RUN_ON_CPU_HOST_PTR(cpuas));
diff --git a/meta/recipes-devtools/qemu/qemu/no-pip.patch b/meta/recipes-devtools/qemu/qemu/no-pip.patch
index f52b4e4b83a..92b2edbe9f5 100644
--- a/meta/recipes-devtools/qemu/qemu/no-pip.patch
+++ b/meta/recipes-devtools/qemu/qemu/no-pip.patch
@@ -22,11 +22,11 @@ as it stands is a workaround.
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-diff --git a/configure b/configure
-index 133f4e3235..e4c144b4e2 100755
---- a/configure
-+++ b/configure
-@@ -1009,7 +1009,7 @@ python="$(command -v "$python")"
+Index: qemu-8.2.0/configure
+===================================================================
+--- qemu-8.2.0.orig/configure
++++ qemu-8.2.0/configure
+@@ -937,7 +937,7 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
@@ -35,11 +35,11 @@ index 133f4e3235..e4c144b4e2 100755
  if test "$?" -ne 0 ; then
      error_exit "python venv creation failed"
  fi
-@@ -1017,6 +1017,7 @@ fi
+@@ -945,6 +945,7 @@ fi
  # Suppress writing compiled files
  python="$python -B"
  mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
 +mkvenv=true
  
- mkvenv_flags=""
- if test "$download" = "enabled" ; then
+ # Finish preparing the virtual environment using vendored .whl files
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.2.bb b/meta/recipes-devtools/qemu/qemu_8.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.0.bb
-- 
2.40.1


