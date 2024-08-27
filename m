Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45D9C54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 16:26:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.1301.1724775968593029372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 09:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ma1WkNUt;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201f7fb09f6so48192195ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775968; x=1725380768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UlDT50qS67obn+U+NBuEWoblNwul8Eo/OQexFOk2xnU=;
        b=ma1WkNUtArA0JFaJdufng1EaARfLazzMvPSfGrvaVR+NdoWU1Nat7syPY414exB8bB
         OMmlXoEpu19zIOwv0zhI1fNYax81iJm0FMP9Jxg2WIU24ZmR2mbHH/clBKkLwSItroDt
         mp3yXqgLQBRCm3VJ4yPZ863FPRouGkd6EFK2OQadLQ6TgzDRkxCoVKr2p78+dXD0uriE
         vAkgEUX7zBueC388YsjK9T11tJe2iSH38TcaFzetUzCS3xnEqz0C+pPLuN3YdczKqBwQ
         ttTR3VSlvRsjQNmyLciPpIMv6b4RjZ+MX6vYfGySGyRnZM/l08CoSVRElDtUsPN/ikMK
         mqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775968; x=1725380768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlDT50qS67obn+U+NBuEWoblNwul8Eo/OQexFOk2xnU=;
        b=mT6MtZH2UgYc/UX4Tus1UUvILxAIzHBFL6msGXfUWuJS+Xba3K+6yRwl5CB6JNWlll
         YHDTnkkmqtPylnbP7dNdai7hk97o2AesGjZJWofdKLISfcBVoDfifhbo4peQDbRXzOhF
         Np+8kfDnig/k7KWc1m2wkPwEXx6F5b8s5XBy3XxIsLXZeoD6B34F/SUHZMQalWlhLG+K
         ogxSxQy7YGgKgMxA+REOB0Nt5zRCnJsD3k2QlbAM2TIIQ2D7f6w8EdvfuXS71Qmoj00M
         N9qV/hzn0UjWHI3JhIRiRAartvsLUGVjaGoZIzNDN8B/C7cXuaFw44Jh3uGIhwny5SYH
         KDow==
X-Gm-Message-State: AOJu0YyFrB7JbDYMlo6kS83fRUG0MixOST5iGsFg0SPmLIUJtZHpb2/a
	Tnnj99TKGzbxcWrI68FmcKWLV1WZECjqTZ5EPGqql5Qz2gHL1FbXxC7g0Q==
X-Google-Smtp-Source: AGHT+IHnFbkYEVYHT3e8H43hhzfewmL5igmh2GvP1IEntKq53ZMcB4jJ5FHWaz2RobY+l4CBKdwAZQ==
X-Received: by 2002:a17:902:f544:b0:202:32f7:230d with SMTP id d9443c01a7336-2039e50d1cdmr176072175ad.40.1724775967535;
        Tue, 27 Aug 2024 09:26:07 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fc70f0sm85039895ad.299.2024.08.27.09.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:26:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] bluez5: Fix build with musl
Date: Tue, 27 Aug 2024 09:26:02 -0700
Message-ID: <20240827162604.2108623-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 16:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203854

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the upstream submission and latest patch submitted upstream
v3: Make just node_name as const and keep node_dir as such

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...U-basename-compatible-implementation.patch | 138 ++++++++++++++++++
 2 files changed, 139 insertions(+)
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
index 00000000000..6d8a563e100
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
@@ -0,0 +1,138 @@
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
+diff --git a/Makefile.mesh b/Makefile.mesh
+index e4c9fa6a3..bebedaf05 100644
+--- a/Makefile.mesh
++++ b/Makefile.mesh
+@@ -47,6 +47,8 @@ mesh/main.$(OBJEXT): src/builtin.h lib/bluetooth/bluetooth.h
+ mesh_bluetooth_meshd_SOURCES = $(mesh_sources) mesh/main.c
+ mesh_bluetooth_meshd_LDADD = src/libshared-ell.la $(ell_ldadd) -ljson-c
+ 
++mesh_bluetooth_meshd_CFLAGS = -I${top_srcdir}/src
++
+ if MANPAGES
+ man_MANS += mesh/bluetooth-meshd.8
+ endif
+diff --git a/Makefile.tools b/Makefile.tools
+index 5b9034078..6fc73b8a2 100644
+--- a/Makefile.tools
++++ b/Makefile.tools
+@@ -328,7 +328,8 @@ tools_l2ping_LDADD = lib/libbluetooth-internal.la
+ tools_bluemoon_SOURCES = tools/bluemoon.c monitor/bt.h
+ tools_bluemoon_LDADD = src/libshared-mainloop.la
+ 
+-tools_hex2hcd_SOURCES = tools/hex2hcd.c
++tools_hex2hcd_SOURCES = tools/hex2hcd.c src/shared/util.h
++tools_hex2hcd_CFLAGS = -I${top_srcdir}/src
+ 
+ tools_mpris_proxy_SOURCES = tools/mpris-proxy.c
+ tools_mpris_proxy_LDADD = gdbus/libgdbus-internal.la $(GLIB_LIBS) $(DBUS_LIBS)
+diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
+index c198627c6..608384cb6 100644
+--- a/mesh/mesh-config-json.c
++++ b/mesh/mesh-config-json.c
+@@ -28,6 +28,7 @@
+ #include <ell/ell.h>
+ #include <json-c/json.h>
+ 
++#include "shared/util.h"
+ #include "mesh/mesh-defs.h"
+ #include "mesh/util.h"
+ #include "mesh/mesh-config.h"
+@@ -2694,7 +2695,8 @@ bool mesh_config_load_nodes(const char *cfgdir_name, mesh_config_node_func_t cb,
+ 
+ void mesh_config_destroy_nvm(struct mesh_config *cfg)
+ {
+-	char *node_dir, *node_name;
++	char *node_dir;
++	const char* node_name;
+ 	char uuid[33];
+ 
+ 	if (!cfg)
+@@ -2706,7 +2708,7 @@ void mesh_config_destroy_nvm(struct mesh_config *cfg)
+ 	if (!hex2str(cfg->uuid, 16, uuid, sizeof(uuid)))
+ 		return;
+ 
+-	node_name = basename(node_dir);
++	node_name = bluez_basename(node_dir);
+ 
+ 	/* Make sure path name of node follows expected guidelines */
+ 	if (strcmp(node_name, uuid))
+diff --git a/mesh/rpl.c b/mesh/rpl.c
+index fb225dddd..fb89f0afd 100644
+--- a/mesh/rpl.c
++++ b/mesh/rpl.c
+@@ -24,6 +24,7 @@
+ 
+ #include <ell/ell.h>
+ 
++#include "shared/util.h"
+ #include "mesh/mesh-defs.h"
+ 
+ #include "mesh/node.h"
+@@ -146,7 +147,7 @@ static void get_entries(const char *iv_path, struct l_queue *rpl_list)
+ 	if (!dir)
+ 		return;
+ 
+-	iv_txt = basename(iv_path);
++	iv_txt = bluez_basename(iv_path);
+ 	if (sscanf(iv_txt, "%08x", &iv_index) != 1) {
+ 		closedir(dir);
+ 		return;
+diff --git a/src/shared/util.h b/src/shared/util.h
+index f2ca4f29f..f55b3a4c3 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -296,3 +296,10 @@ static inline void put_be64(uint64_t val, void *dst)
+ {
+ 	put_unaligned(cpu_to_be64(val), (uint64_t *) dst);
+ }
++
++static inline const char *bluez_basename(const char *path)
++{
++	const char *base = strrchr(path, '/');
++
++	return base ? base + 1 : path;
++}
+diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
+index e6dca5a81..05fa69470 100644
+--- a/tools/hex2hcd.c
++++ b/tools/hex2hcd.c
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
+ #include <stdbool.h>
+ #include <sys/stat.h>
++#include "shared/util.h"
+ 
+ static ssize_t process_record(int fd, const char *line, uint16_t *upper_addr)
+ {
+@@ -302,7 +303,7 @@ static void ver_parse_entry(const char *pathname)
+ 	}
+ 
+ 	if (S_ISREG(st.st_mode)) {
+-		ver_parse_file(basename(pathname));
++		ver_parse_file(bluez_basename(pathname));
+ 		goto done;
+ 	}
+ 

