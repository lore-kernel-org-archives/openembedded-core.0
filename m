Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3BDC433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.22330.1638602011276481769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hr6UX/xn;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id d9so10559749wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plvvz4znAH4nOFiP9AiWLHht12Y/QWjJ+dNHTLJCnGM=;
        b=Hr6UX/xnuExpjfDqHY2UmOeuZcck3JTGgNKKxcxUpxTo7Z7ND20hrVHujkjAuLiwWw
         JPtMYrPsYNqxbdOz3SYEXuImOmZuP0AckEU3au6FVQCGT5qn63SPo2SkjkEgC1VjZ3TO
         TXpsjvgNxSTWpj2QoGizoEd7l5rHSmi0/qyy+ytVAOvY5pYe/vu/lim7bKSmOluw1L7R
         dmOh/Abm84/I/mF7G5hZ7knAM7lJ8AEteeutTsrL5jrneYr8gwmaKckvAaLYPgQOfhaD
         1oWC2Wk7n2lDcA/bVJhYQU/iRYwQ7YyL+q1/AS8G/P4R0/jkJr1htCYX0ibn/QMcbfB2
         lTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plvvz4znAH4nOFiP9AiWLHht12Y/QWjJ+dNHTLJCnGM=;
        b=T3lJKPdh9WOPBdEnlAlzf1mgAxACGOxF6w3FswJOQtUHlSPzj6B0f0Ze2/eeOZzcN5
         TWTSg17fGejFheo373AnHx22nILwJpGBWhLmFsJkvKa4sPhjcGIi6YSHTLllDt8NTWda
         mYnFX7ZHIwkfLT0FZ0oQivaFMFLDXw66J7TTAX/vTkrHj9diE+COxsaqgm97yLhVZNgc
         4KTrRxSffa0OarhE2CpJxtsBMmHwbFnel6iqKWooru+0mVjPX+6dxnRHuC5Ul+8Sw6GK
         H1CMl3zrFRqv21nN1bO0W1wjqh6A37YslcDgAnNgKpRkma00Ux7uz6Tp4te1y4bPIAd1
         WUrw==
X-Gm-Message-State: AOAM532N2XweTztjQc34yRr6rF1pM0waJZDwZP/23coBej6Y6SOXun18
	69OLf23J43CwJmkXC3Milhd/YN9IcGl3/A==
X-Google-Smtp-Source: 
 ABdhPJyia1df5MQ+IRPpi2pBD/Sfwt7RTp5G1GEFGSvu+dzFDB3rGM5jYOD31o1lFvNGXowd2ISuyw==
X-Received: by 2002:adf:a48e:: with SMTP id
 g14mr27099729wrb.474.1638602009765;
        Fri, 03 Dec 2021 23:13:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/26] meson: configure and use generic exe_wrapper
Date: Sat,  4 Dec 2021 08:13:00 +0100
Message-Id: <20211204071323.2480163-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159150

This replaces the specific gtkdoc wrapper setting
(which was rejected by upstream in https://github.com/mesonbuild/meson/pull/9627)
with a generic, officially supported and documented exe_wrapper,
which is enabled subject to qemu usermode support
(just as is done for g-i and gtk-doc with autotools).

gtk-doc support is adjusted so that this wrapper is passed to
meson's gtk-doc module, which passes it to gtk-doc.

The adjusted patch is re-submitted upstream.

The side effect of this is that meson is now able to run
target binaries in a generic way when it wants to, so this
may affect cross-builds - hopefully in a positive way.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/meson.bbclass                    | 30 +++++++++++++++++--
 ...sues-that-arise-when-cross-compiling.patch | 27 +++++++++++------
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index a7981e481f..ffec5f3269 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,7 +1,12 @@
-inherit python3native meson-routines
+inherit python3native meson-routines qemu
 
 DEPENDS:append = " meson-native ninja-native"
 
+EXEWRAPPER_ENABLED:class-native = "False"
+EXEWRAPPER_ENABLED:class-nativesdk = "False"
+EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
+DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
+
 # As Meson enforces out-of-tree builds we can just use cleandirs
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
@@ -36,6 +41,9 @@ MESON_CROSS_FILE = ""
 MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
+# Needed to set up qemu wrapper below
+export STAGING_DIR_HOST
+
 def rust_tool(d, target_var):
     rustc = d.getVar('RUSTC')
     if not rustc:
@@ -62,6 +70,7 @@ cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
 ${@rust_tool(d, "HOST_SYS")}
+${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
 
 [built-in options]
 c_args = ${@meson_array('CFLAGS', d)}
@@ -71,7 +80,6 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 
 [properties]
 needs_exe_wrapper = true
-gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'
@@ -106,6 +114,24 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
 EOF
 }
 
+do_write_config:append:class-target() {
+    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
+    # can run target helper binaries through that.
+    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    cat > ${WORKDIR}/meson-qemuwrapper << EOF
+#!/bin/sh
+# Use a modules directory which doesn't exist so we don't load random things
+# which may then get deleted (or their dependencies) and potentially segfault
+export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
+
+# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
+unset LD_LIBRARY_PATH
+
+$qemu_binary "\$@"
+EOF
+    chmod +x ${WORKDIR}/meson-qemuwrapper
+}
+
 # Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES = "meson.build"
 
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index ab4d5969d9..b098c4a123 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -1,29 +1,38 @@
-From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
+From bbdd6679e49bcba5ec022b240ac234a87b451e41 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
-Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
+Subject: [PATCH] gtkdoc: add support for a binary wrapper
 
 Make it possible to specify a wrapper for executing binaries
+in cross-compiling scenarios.
 (usually, some kind of target hardware emulator, such as qemu)
 
 Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/9627]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/gnome.py | 4 ++++
- 1 file changed, 4 insertions(+)
+ mesonbuild/modules/gnome.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index dc2979e..c9ff9bd 100644
+index 1c6952d..5a6ff94 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
+@@ -35,7 +35,7 @@ from ..mesonlib import (
+ from ..dependencies import Dependency, PkgConfigDependency, InternalDependency
+ from ..interpreterbase import noPosargs, noKwargs, permittedKwargs, FeatureNew, FeatureNewKwargs, FeatureDeprecatedKwargs, FeatureDeprecated
+ from ..interpreterbase import typed_kwargs, KwargInfo, ContainerTypeInfo
+-from ..programs import ExternalProgram, OverrideProgram
++from ..programs import ExternalProgram, OverrideProgram, EmptyExternalProgram
+ from ..build import CustomTarget, CustomTargetIndex, GeneratedList
+ 
+ if T.TYPE_CHECKING:
+@@ -1103,6 +1103,9 @@ class GnomeModule(ExtensionModule):
              args.append(f'--{program_name}={path}')
          if namespace:
              args.append('--namespace=' + namespace)
-+        gtkdoc_exe_wrapper = state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
-+        if gtkdoc_exe_wrapper is not None:
-+            args.append('--run=' + gtkdoc_exe_wrapper)
++        if state.environment.need_exe_wrapper() and not isinstance(state.environment.get_exe_wrapper(), EmptyExternalProgram):
++            args.append('--run=' + ' '.join(state.environment.get_exe_wrapper().get_command()))
 +
          args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
          args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
-- 
2.20.1


