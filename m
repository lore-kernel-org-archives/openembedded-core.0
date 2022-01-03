Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E757DC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:36 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.30348.1641226776499608428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id q14so30839822qtx.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=soFJY7wB6jmBqFQNCfyHgOlc2oHYNMGHzhvmqlIeusU=;
        b=MgaEHo4MGCqGDpYzJFFTM/nihZHtZGO1Wz3Uy3Xioy3tw+Ny2t5lQexKhNsbHQMfyx
         SgOw1HvubjkFwcPoErbxV8SbzMAIadsTMGztmQy+v+B0NOSuaO8i0gZ1qgLVa2NFlags
         w7xiACMxTX6x7fh2SuNrdRXuXWz8xmN3e/sHzXr8DmMZknNMQiIMBWpVJZrLc2NLQ6wG
         B68KRpu0/U4GXLyeRMbHQl3YvJfgV9MQbR4SvgSntk/JR3xAl9KDhckJFKmDjp0e/PXf
         h6rBucalkEW+Sjcj473bZGP0P9rx4pn2SdK1t9pKWVtcq0wBCV3hNg0+nbr9TnBZROHJ
         XauQ==
X-Gm-Message-State: AOAM530TUSPGSZ+0tbom8Bh9zoAx5IG29Yqa1SowKJYuYl+Nto7BNofI
	4Ezi3EFa2cp8wQFBN9sBYDktIPdNgFR0dBDW
X-Google-Smtp-Source: 
 ABdhPJy5LXBRyRsGTzRHmZqCK6VEAFzP5euLJ9pgjBun8+mNTjj31EmL42hqTUjY2rYcDLLbxQsFrg==
X-Received: by 2002:a05:622a:44a:: with SMTP id
 o10mr41473391qtx.212.1641226775268;
        Mon, 03 Jan 2022 08:19:35 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 h9sm28900672qkp.106.2022.01.03.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:34 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/24] libxcrypt-compat: upgrade 4.4.26 -> 4.4.27
Date: Mon,  3 Jan 2022 13:18:40 -0300
Message-Id: <20220103161854.301148-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160127

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libxcrypt/files/fix_cflags_handling.patch |  11 +-
 .../libxcrypt/libxcrypt-compat_4.4.26.bb      |  18 ---
 .../libxcrypt/libxcrypt-compat_4.4.27.bb      | 103 ++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   4 +-
 4 files changed, 111 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 0772998c72..d979796226 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,7 +1,8 @@
-From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
+From 7b2a0cdc281d94a5782c37ef87040c341447b4b4 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
+Organization: O.S. Systems Software LTDA.
 
 If you pass CFLAGS with a leading space, " " gets passed to popen and convinces
 gcc to try and open a file called " ". This results in a confusing error message
@@ -15,13 +16,13 @@ Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
- build-aux/compute-symver-floor | 2 ++
+ build-aux/scripts/compute-symver-floor | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-floor
+diff --git a/build-aux/scripts/compute-symver-floor b/build-aux/scripts/compute-symver-floor
 index 4ec82e1..8117342 100644
---- a/build-aux/compute-symver-floor
-+++ b/build-aux/compute-symver-floor
+--- a/build-aux/scripts/compute-symver-floor
++++ b/build-aux/scripts/compute-symver-floor
 @@ -36,6 +36,8 @@ sub preprocessor_check {
          die "C compiler not available\n" unless @CC;
  
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
deleted file mode 100644
index ec9f9f4fa3..0000000000
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# This provides libcrypto.so.1 which contains obsolete APIs, needed for uninative in particular
-#
-
-require libxcrypt.inc
-
-PROVIDES = ""
-AUTO_LIBNAME_PKGS = ""
-EXCLUDE_FROM_WORLD = "1"
-
-API = "--enable-obsolete-api"
-
-do_install:append () {
-	rm -rf ${D}${includedir}
-	rm -rf ${D}${libdir}/pkgconfig
-	rm -rf ${D}${datadir}
-}
-
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
new file mode 100644
index 0000000000..fd773fc859
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
@@ -0,0 +1,103 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSING
+# +++ LICENSING
+# @@ -77,53 +77,55 @@
+#     test-badsetting.c, test-crypt-badargs.c, test-getrandom-fallbacks.c,
+#     test-getrandom-interface.c, test-symbols-compat.sh,
+#     test-symbols-renames.sh, test-symbols-static.sh,
+# -   build-aux/gen-crypt-h, build-aux/gen-crypt-symbol-vers-h,
+# -   build-aux/gen-libcrypt-map, build-aux/skip-if-exec-format-error,
+# -   build-aux/zw_alignment.m4, build-aux/zw_static_assert.m4,
+# -   build-aux/zw_endianness.m4, build-aux/zw_ld_wrap.m4
+# +   build-aux/scripts/gen-crypt-h,
+# +   build-aux/scripts/gen-crypt-symbol-vers-h,
+# +   build-aux/scripts/gen-libcrypt-map,
+# +   build-aux/scripts/skip-if-exec-format-error,
+# +   build-aux/m4/zw_alignment.m4, build-aux/m4/zw_static_assert.m4,
+# +   build-aux/m4/zw_endianness.m4, build-aux/m4/zw_ld_wrap.m4
+#  
+#   * Copyright Zack Weinberg and Free Software Foundation, Inc;
+#     GPL (v3 or later), with Autoconf exception:
+# -   build-aux/zw_automodern.m4, build-aux/zw_simple_warnings.m4
+# +   build-aux/m4/zw_automodern.m4, build-aux/m4/zw_simple_warnings.m4
+#  
+#   * Copyright <vt at altlinux.org>; 0-clause BSD:
+#     crypt-yescrypt.c, test-crypt-yescrypt.c
+#  
+#   * Copyright Kevin Cernekee; FSF All Permissive License:
+# -   build-aux/ax_check_vscript.m4
+# +   build-aux/m4/ax_check_vscript.m4
+#  
+#   * Copyright Maarten Bosmans; FSF All Permissive License:
+# -   build-aux/ax_append_compile_flags.m4
+# +   build-aux/m4/ax_append_compile_flags.m4
+#  
+#   * Copyright Guido U. Draheim, Maarten Bosmans;
+#     FSF All Permissive License:
+# -   build-aux/ax_append_flag.m4, build-aux/ax_check_compile_flag.m4
+# +   build-aux/m4/ax_append_flag.m4, build-aux/m4/ax_check_compile_flag.m4
+#  
+#   * Copyright Mike Frysinger; FSF All Permissive License:
+# -   build-aux/ax_require_defined.m4
+# +   build-aux/m4/ax_require_defined.m4
+#  
+#   * Copyright Gabriele Svelto; FSF All Permissive License:
+# -   build-aux/ax_gcc_func_attribute.m4
+# +   build-aux/m4/ax_gcc_func_attribute.m4
+#  
+#   * Copyright Scott James Remnant, Dan Nicholson;
+#     GPL (v2 or later), with Autoconf exception:
+# -   build-aux/pkg_installdir_compat.m4
+# +   build-aux/m4/pkg_installdir_compat.m4
+#  
+#   * Copyright Tim Toolan; FSF All Permissive License:
+# -   build-aux/ax_compare_version.m4
+# +   build-aux/m4/ax_compare_version.m4
+#  
+#   * Copyright Philip Withnall; FSF All Permissive License:
+# -   build-aux/ax_valgrind_check.m4
+# +   build-aux/m4/ax_valgrind_check.m4
+#  
+#   * Copyright Steven G. Johnson, Daniel Richard G.;
+#     GPL (v3 or later), with Autoconf exception:
+# -   build-aux/ax_pthread.m4
+# +   build-aux/m4/ax_pthread.m4
+#  
+#   * Copyright Francesco Salvestrini; FSF All Permissive License:
+# -   build-aux/ax_prog_python_version.m4
+# +   build-aux/m4/ax_prog_python_version.m4
+#  
+#   * Copyright Andrew Collier; FSF All Permissive License:
+# -   build-aux/ax_python_module.m4
+# +   build-aux/m4/ax_python_module.m4
+#  
+#   * Copyright holders unknown, no statement of license (all of these
+#     files are part of the testsuite and do not contribute to the
+# 
+#
+
+#
+# This provides libcrypto.so.1 which contains obsolete APIs, needed for uninative in particular
+#
+
+require libxcrypt.inc
+
+PROVIDES = ""
+AUTO_LIBNAME_PKGS = ""
+EXCLUDE_FROM_WORLD = "1"
+
+API = "--enable-obsolete-api"
+
+do_install:append () {
+	rm -rf ${D}${includedir}
+	rm -rf ${D}${libdir}/pkgconfig
+	rm -rf ${D}${datadir}
+}
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9186c45e18..725965e535 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,14 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=29c5f9af198623cdce52a77f85695164 \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "8ff7a8c5019cbd50419f7d0a8cd691eb99d6b086"
+SRCREV = "814e715dd8580ff00344112d7d8383a6a5a5b83d"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.34.0


