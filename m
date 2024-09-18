Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684FCCCD1B3
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 14:12:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.16265.1726668754699643240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 07:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NQg6J/uF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20688fbaeafso62319405ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726668754; x=1727273554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBGn5aOvd+E00u7KRTEbFVw9EjkKAaTwQDGjbceYmvE=;
        b=NQg6J/uF/FyCgT1XIUucBBguPM3vTiwztBjHRleKtJIxjgx6Aw9gDNYn94Hnw8LGzJ
         LKH3cpeZBxPktpR0LbM07gPqTHwbShvmg81F3/U1X2Pw29d4kAtUefWCmrDxLRXOC7Qy
         +2r4jFB1gzgDpxJhB5X+h0Fe2rjfmPeGWaCE2qUHa3oBOCX9YjLRDXcJhKZLQRifX0rV
         LWxAa/l6p834rFykBAGGSah1I2fQUNk48Mb2zvyzc+HC0J94Ndo3ojLsJEHty05YQYQG
         Lw3cpRDPUmYXrPuB7+9NADdrQVvsQn2T4lCR0gBA+pkmtGg4Ry0EMe6zkK5WwIkQwHoK
         vHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726668754; x=1727273554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBGn5aOvd+E00u7KRTEbFVw9EjkKAaTwQDGjbceYmvE=;
        b=ihZaS0wuL0cTKx8Q3MVOmZ5Vw9L2bJu1JfWxOZFRbEiKU35cxPbT8TTXzOhR1f6Q3O
         T1CzTfktmyq+EnEJAs3H6F3z5G6dnhlR79ghV5Hd2BYzbNqjEMMh+STMSiMXPP+rnmc3
         Wt8/32YKtuORNk/es8czEDBSKxRy73EAIOdPyDR/WjJ8OoUtB5jeuFCrVIHXl5stoier
         gvYYx1BZKHXkjHywIMzYk1nULeBZwdoWCt+UTZg7fF0ptEQhvn5Z/tbfImGx+DjodjM9
         JkL5+tZ27EucicJt9BD36BPDU08gzB6GvTNxt+5mbyatmdjaluRO2RJNWCnzIPs6VBrS
         Ln0w==
X-Gm-Message-State: AOJu0YwmXB8Jd2BHAaPAUJmdiXAjsl0Yx5wF5j9d2lq6W1Dw8/jnjQ6Q
	WbLSb8utH6snGRFDazBC0fq3VJ8CnwaOMPiiQswp6FPuWm5STdl9GZJaXHtV
X-Google-Smtp-Source: AGHT+IHAfyw0SS98TkpVlgZSGSY42QMJfAt4Dz9oeCFvbfrZumqLYIigTcp6UwHDAqMyepoY2LAkjQ==
X-Received: by 2002:a17:903:41c4:b0:205:4e22:ccfc with SMTP id d9443c01a7336-20782b78bd9mr273397045ad.50.1726668753758;
        Wed, 18 Sep 2024 07:12:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c3c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079470f318sm65536485ad.235.2024.09.18.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 07:12:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] bluez: Fix mesh builds on musl
Date: Wed, 18 Sep 2024 07:12:29 -0700
Message-ID: <20240918141229.3168376-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918141229.3168376-1-raj.khem@gmail.com>
References: <20240918141229.3168376-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 14:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204645

When mesh is enabled on musl the build fails with conflicting basename
calls.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ove-local-basename-into-utility-file.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eda0f8d6c78..b3bcd278e62 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-Provide-GNU-basename-compatible-implementation.patch \
+           file://0001-mesh-Move-local-basename-into-utility-file.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch
new file mode 100644
index 00000000000..33c12fc3a87
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch
@@ -0,0 +1,114 @@
+From e64c2e70a74da452b0ee147350c4ce93e1db8d2f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Sep 2024 15:11:01 -0700
+Subject: [PATCH v2] mesh: Move local basename into utility file
+
+Defining an override via a missing.h can prove difficult when a file
+needs to use basename and dirname both the APIs and needs to include
+libgen.h for them, in such situations there will be signature clash
+for basename function.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-bluetooth/20240917031745.1641153-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+v2: Remove reference to missing.h in Makefile.mesh
+
+ Makefile.mesh           |  2 +-
+ mesh/mesh-config-json.c |  3 +--
+ mesh/missing.h          | 21 ---------------------
+ mesh/rpl.c              |  3 +--
+ mesh/util.c             | 10 ++++++++++
+ mesh/util.h             |  5 +++++
+ 6 files changed, 18 insertions(+), 26 deletions(-)
+ delete mode 100644 mesh/missing.h
+
+--- a/mesh/mesh-config-json.c
++++ b/mesh/mesh-config-json.c
+@@ -28,7 +28,6 @@
+ #include <ell/ell.h>
+ #include <json-c/json.h>
+ 
+-#include "mesh/missing.h"
+ #include "mesh/mesh-defs.h"
+ #include "mesh/util.h"
+ #include "mesh/mesh-config.h"
+@@ -2708,7 +2707,7 @@ void mesh_config_destroy_nvm(struct mesh
+ 	if (!hex2str(cfg->uuid, 16, uuid, sizeof(uuid)))
+ 		return;
+ 
+-	node_name = basename(node_dir);
++	node_name = mesh_basename(node_dir);
+ 
+ 	/* Make sure path name of node follows expected guidelines */
+ 	if (strcmp(node_name, uuid))
+--- a/mesh/missing.h
++++ /dev/null
+@@ -1,21 +0,0 @@
+-// SPDX-License-Identifier: LGPL-2.1-or-later
+-/*
+- *
+- *  BlueZ - Bluetooth protocol stack for Linux
+- *
+- *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
+- *
+- */
+-
+-#ifdef HAVE_CONFIG_H
+-#include <config.h>
+-#endif
+-#if !HAVE_DECL_BASENAME
+-#include <string.h>
+-static inline const char *basename(const char *path)
+-{
+-  const char *base = strrchr(path, '/');
+-
+-  return base ? base + 1 : path;
+-}
+-#endif
+--- a/mesh/rpl.c
++++ b/mesh/rpl.c
+@@ -24,7 +24,6 @@
+ 
+ #include <ell/ell.h>
+ 
+-#include "mesh/missing.h"
+ #include "mesh/mesh-defs.h"
+ 
+ #include "mesh/node.h"
+@@ -147,7 +146,7 @@ static void get_entries(const char *iv_p
+ 	if (!dir)
+ 		return;
+ 
+-	iv_txt = basename(iv_path);
++	iv_txt = mesh_basename(iv_path);
+ 	if (sscanf(iv_txt, "%08x", &iv_index) != 1) {
+ 		closedir(dir);
+ 		return;
+--- a/mesh/util.c
++++ b/mesh/util.c
+@@ -161,3 +161,13 @@ void enable_debug(void)
+ 	debug_enabled = true;
+ 	l_debug_enable("*");
+ }
++
++#if !HAVE_DECL_BASENAME
++#include <string.h>
++const char *mesh_basename(const char *path)
++{
++	const char *base = strrchr(path, '/');
++
++	return base ? base + 1 : path;
++}
++#endif
+--- a/mesh/util.h
++++ b/mesh/util.h
+@@ -16,3 +16,8 @@ void print_packet(const char *label, con
+ int create_dir(const char *dir_name);
+ void del_path(const char *path);
+ void enable_debug(void);
++#if !HAVE_DECL_BASENAME
++const char *mesh_basename(const char *path);
++#else
++#define mesh_basename basename
++#endif

