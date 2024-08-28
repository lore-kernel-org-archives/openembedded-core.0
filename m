Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD39C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 04:11:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.5728.1724818314985097879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 21:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fthSTMt9;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-202376301e6so48499765ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 21:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724818314; x=1725423114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EYDvGD/MAPRQYbln7s7pasDQfGIyEXaCWs8D3DvyLs=;
        b=fthSTMt90l75waUAozKECe4mEy6IfbrpvZ89UHo03chlDg1P65+QCeXo9KSBjEam6e
         ZpLXUmmaUCvPX2BeONc8svdIsmBgk5GGKXHOns9eKxz6zxOoq22mt9MMIzrpC3yTOxzx
         3CsB6yq7QaeiuUH155TXOkQemHrpLWdpt2EP/uhe/kFw+/sz/TsPKWlVTeFivHRQTipf
         88064rHA5PmARgx/1A4aWgt3ZnQmCl7nRvHnxYePT40EMWMZgSD/EXocz+/1fRsvVVyq
         DuevHKaF3QqFis0qlpByf7Gnk6zKXfcAKOv82cLrS6qGp2f/OwmdHsL7wkQaBs/hfOEp
         NCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724818314; x=1725423114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EYDvGD/MAPRQYbln7s7pasDQfGIyEXaCWs8D3DvyLs=;
        b=xU363AOhtECPxeTktc9imtxGaKoWjJ9UGoXJAFjZryc4TMEFeGZXt9zLREZU3JPg/A
         A6HKzqomXRBsbTQUlnwW4A10QIIacmLTqIUSISbegZmTuXox0uyL1rHTujGfcB9vB1LK
         VKziIH75kFir3gwKi7xrqc0cF4SVvG2mrWO42DsCbyJFwOM8vChRLNMPZIFZWTBd+2OR
         NYen4aBsN2QdQ0CplbW2WBBOAgFrxvyXOrEk+TSENvdBZUffeMhluh+JWX7r5xSeYdnH
         8Jt0n8NjBGx7UbG/ujrqI2++jqm3EJKmfjd5rHgPoWtPEGESnXQvUqRShmde4KA+sZEM
         ydxw==
X-Gm-Message-State: AOJu0Yz11AJoQiWPahBRx5j/5W+YMDePSSJgZZ8m6/fQ4ItPNnytKK/n
	FLODB0fXlQeLNHpM4LDqtz+wx7X3VZYqNXP/3NSn9fbcMV397uIUb/sJ9A==
X-Google-Smtp-Source: AGHT+IFJG66R1cvYRPlUKUeVAl1Ug0HLacfdzJzeqryrIAKlahEC9rwPfxN5feAnbwF646aJEAA+lQ==
X-Received: by 2002:a17:902:f691:b0:1fc:6a81:c5a1 with SMTP id d9443c01a7336-2039e44eddemr133819375ad.12.1724818313889;
        Tue, 27 Aug 2024 21:11:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbed6sm90900875ad.172.2024.08.27.21.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 21:11:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4] bluez5: Fix build with musl
Date: Tue, 27 Aug 2024 21:10:00 -0700
Message-ID: <20240828041000.2409672-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 04:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203865

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the upstream submission and latest patch submitted upstream
v3: Make just node_name as const and keep node_dir as such
v4: Redo the patch to avoid textrel errors on ppc32/arm

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...U-basename-compatible-implementation.patch | 143 ++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d8b9f817715..e0d3e651871 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
+           file://0001-Provide-GNU-basename-compatible-implementation.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
new file mode 100644
index 00000000000..3a2a97ff020
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
@@ -0,0 +1,143 @@
+From 9000923c07a68857e8ea32a49bfca660b1d1001a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Aug 2024 09:55:03 -0700
+Subject: [PATCH BlueZ] Provide GNU basename compatible implementation
+
+Call to basename() relies on a GNU extension
+to take a const char * vs a char *. Let's define
+a trivial helper function to ensure compatibility
+with musl.
+
+Fixes Issue: https://github.com/bluez/bluez/issues/843
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-bluetooth/20240826173844.2918630-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.mesh           | 2 ++
+ Makefile.tools          | 3 ++-
+ mesh/mesh-config-json.c | 6 ++++--
+ mesh/rpl.c              | 3 ++-
+ src/shared/util.h       | 7 +++++++
+ tools/hex2hcd.c         | 3 ++-
+ 6 files changed, 19 insertions(+), 5 deletions(-)
+
+Index: bluez-5.77/mesh/mesh-config-json.c
+===================================================================
+--- bluez-5.77.orig/mesh/mesh-config-json.c
++++ bluez-5.77/mesh/mesh-config-json.c
+@@ -28,6 +28,7 @@
+ #include <ell/ell.h>
+ #include <json-c/json.h>
+ 
++#include "mesh/missing.h"
+ #include "mesh/mesh-defs.h"
+ #include "mesh/util.h"
+ #include "mesh/mesh-config.h"
+@@ -2694,7 +2695,8 @@ bool mesh_config_load_nodes(const char *
+ 
+ void mesh_config_destroy_nvm(struct mesh_config *cfg)
+ {
+-	char *node_dir, *node_name;
++	char *node_dir;
++	const char* node_name;
+ 	char uuid[33];
+ 
+ 	if (!cfg)
+Index: bluez-5.77/mesh/rpl.c
+===================================================================
+--- bluez-5.77.orig/mesh/rpl.c
++++ bluez-5.77/mesh/rpl.c
+@@ -24,6 +24,7 @@
+ 
+ #include <ell/ell.h>
+ 
++#include "mesh/missing.h"
+ #include "mesh/mesh-defs.h"
+ 
+ #include "mesh/node.h"
+Index: bluez-5.77/tools/hex2hcd.c
+===================================================================
+--- bluez-5.77.orig/tools/hex2hcd.c
++++ bluez-5.77/tools/hex2hcd.c
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
+ #include <stdbool.h>
+ #include <sys/stat.h>
++#include "tools/missing.h"
+ 
+ static ssize_t process_record(int fd, const char *line, uint16_t *upper_addr)
+ {
+Index: bluez-5.77/configure.ac
+===================================================================
+--- bluez-5.77.orig/configure.ac
++++ bluez-5.77/configure.ac
+@@ -70,7 +70,16 @@ AC_CHECK_LIB(pthread, pthread_create, du
+ AC_CHECK_LIB(dl, dlopen, dummy=yes,
+ 			AC_MSG_ERROR(dynamic linking loader is required))
+ 
+-AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
++AC_CHECK_HEADERS(string.h linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
++
++# basename may be only available in libgen.h with the POSIX behavior,
++# not desired here
++AC_CHECK_DECLS([basename], [],
++				AC_MSG_WARN([GNU basename extension not found]),
++				[#define _GNU_SOURCE 1
++				 #include <string.h>
++				 ])
++
+ 
+ PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28)
+ 
+Index: bluez-5.77/tools/missing.h
+===================================================================
+--- /dev/null
++++ bluez-5.77/tools/missing.h
+@@ -0,0 +1,21 @@
++// SPDX-License-Identifier: LGPL-2.1-or-later
++/*
++ *
++ *  BlueZ - Bluetooth protocol stack for Linux
++ *
++ *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
++ *
++ */
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++#if !HAVE_DECL_BASENAME
++#include <string.h>
++static inline const char *basename(const char *path)
++{
++  const char *base = strrchr(path, '/');
++
++  return base ? base + 1 : path;
++}
++#endif
+Index: bluez-5.77/mesh/missing.h
+===================================================================
+--- /dev/null
++++ bluez-5.77/mesh/missing.h
+@@ -0,0 +1,21 @@
++// SPDX-License-Identifier: LGPL-2.1-or-later
++/*
++ *
++ *  BlueZ - Bluetooth protocol stack for Linux
++ *
++ *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
++ *
++ */
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++#if !HAVE_DECL_BASENAME
++#include <string.h>
++static inline const char *basename(const char *path)
++{
++  const char *base = strrchr(path, '/');
++
++  return base ? base + 1 : path;
++}
++#endif

