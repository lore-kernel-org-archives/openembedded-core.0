Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AF8CF537C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.7692.1729686910509523239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dU6t0QDi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c803787abso6817145ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686910; x=1730291710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtrULeQroEuACwwf56DGu5hcL0075ceXtBiNejTGOaY=;
        b=dU6t0QDikabcX8DPg2XxH5OkUoTKDAauDe5cL9G7dXAV2QLFopjnf9EUY6u1dO1+BB
         XL3Hq9V5US+bqaGYi4FvT7pis4tE/KXxuW+nw9ePJ0gRF5rQTsRHH2Ky5d4yOgHryFvd
         7seQqioFgSz34SA4k8g+wV09orrbN/jC18SAlg+7qwQNxt8L7cIAgnNasE1seHyAhImi
         9GDCXQUb1+AiS5t2xEpQKbLjiRUt8XscYJmg00E9uR6fIlO1PbiBXN63aoVEgeteCAaB
         G5hGmhZKi7Kp7ikk5QUOEUR568kvDw3r86hEgZBQMJbe8T7pWWbHDgNOpoQu4zxMu4Re
         W96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686910; x=1730291710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtrULeQroEuACwwf56DGu5hcL0075ceXtBiNejTGOaY=;
        b=ITcHxZP22702XMACXD8OJB0Lq07WrxRjLUgePHsQCiPxkdo7BRAwd5oguaqdAwJ6ah
         R8yAmy/NoJW2/VOb/ISuo7lTECDCBeieoDYHEkcgVLaiT4ds4JToSJHQu0Tw9atNNWH7
         v4UcSkoOTBFpU0MuU2sAnksbpdPi5CC04cNo6f8cGxJ7NHOqzugd775A8gHeDI/RxPDi
         dZgudOapaAiVOGyoXxmYBFh2069Y7R7MfIpehv13lWHdslZGwcQ3xOH9qfLqXaP80E3C
         AP5O6GL/S7W7Pki6QcaSTOyUzAwo5j3ptEkQneSrYCiTmVRpft+AfdGAdKjhcgWtzzvm
         G2gA==
X-Gm-Message-State: AOJu0YzgEzK7Xc0rP46GLi66+MtRB5KNrQe4yAZI15JkQ493ceFQVqKZ
	ySgQ3qw4JAvGugVGoLwlH2CVi1MwzIKZc8QoFiV8w8EXAWXWJ4RjLkSHg/1A6NsmXByYF79o4Rf
	e
X-Google-Smtp-Source: AGHT+IHtr2wZXvtN/cADtBitCn5rPufrfWRF6sSiYkCHzV/8cDF2HS0bGq10OAKTr25ekbb6fE6zqw==
X-Received: by 2002:a17:902:f548:b0:20c:6bff:fcb1 with SMTP id d9443c01a7336-20fa9e9660cmr34301325ad.1.1729686909734;
        Wed, 23 Oct 2024 05:35:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 16/27] bluez: Fix mesh builds on musl
Date: Wed, 23 Oct 2024 05:34:24 -0700
Message-Id: <bab3e883cb770ef9fc28c002a98efd0ca5cbf60d.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206227

From: Khem Raj <raj.khem@gmail.com>

When mesh is enabled on musl the build fails with conflicting basename
calls.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2db90c6508e350d35782db973291bbf5ffdfd3a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ove-local-basename-into-utility-file.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eda0f8d6c7..b3bcd278e6 100644
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
index 0000000000..33c12fc3a8
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
-- 
2.34.1


