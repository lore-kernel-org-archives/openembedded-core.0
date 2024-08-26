Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBB9C5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 17:43:33 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.59049.1724694205500028871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 10:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbWwNKXo;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-201ee6b084bso38524545ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724694205; x=1725299005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJfzSKbPxrk5+x7mgEBglqr38hwxBCs7ZE6Iv+ACn1A=;
        b=nbWwNKXo2L7s6h+2Hz/0Xj5mVpe+2lDiwPSzjmeOgwy0bbwkFOpAPqTL+VtpBEQiv3
         rPHv6OFd/74bScVAL9cJkWwozaPlokHcKNekIW47oPqERxUTau1PJs3eJJNCKJBetGgE
         GJuyYE6uTUiQJ6eGUXcKq2XladQC0J3kCUzC42298B/buHLuttHDnjXbpMokTWHovwyL
         bLrmFZIoPGylxHPPMU04f3lNssn7bi2srZnTeCH8MaNOoUikHgq0bAzS6T/1tGLZJjTb
         7tIMmJXxUmzvM8dDNUpP0bxDaD6L8lHOxZf/2lKtkuyjXwfGihZFRGBJ4ef3nTtEEZIh
         zBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724694205; x=1725299005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJfzSKbPxrk5+x7mgEBglqr38hwxBCs7ZE6Iv+ACn1A=;
        b=bV3B8ZUzpliZvdB3yYvcFUjLSYwqCRPGAUO2/gQWUPyCFbZF1TDW1ScsmPZZiExmlZ
         tb7R1v2hJ43oIkEuSEbLYxpiuBsdOoSnku8QCtqE/oiG2mgUnEzXMiUc2qRKd32/CTOX
         NB5Ff6osdaFuwXRATSA020rW4r6Yao/xW9hwE8sjCLgwJp0s8nYRSgv5dVAFt0zXxclu
         98WuFjh1UBzrslvsGCoO+gHNb4OOv+BOjFt4od3NtiB/LKHwdw3cGIrOoEik5axXIwya
         nkxpor0u1azl4nHYuqk4ipSc4M9HoK8K5A2LBfk8VTKE9s9sCHRj60rih/15kqhgPqDJ
         D85g==
X-Gm-Message-State: AOJu0YyrChs949iFL7K9V5VdyB37eWyYLb9g05gTscSaiDz7Q5KDQsnS
	Kvk6PZrA+AXX6+yyZJ91J61GbL7KR7EtUv14XubI6qDGHnyY54+Nq5tJew==
X-Google-Smtp-Source: AGHT+IFH04a0FFDgdGPANMM1j/UMuWKFaKLWBwO951gSTjoRv7rsX6vG8/fxWAeShEA4mRelC8oPYA==
X-Received: by 2002:a17:902:d481:b0:203:a150:e5f5 with SMTP id d9443c01a7336-204ddfe728cmr4345845ad.0.1724694204486;
        Mon, 26 Aug 2024 10:43:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm56933625ad.31.2024.08.26.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:43:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/4] bluez5: Fix build with musl
Date: Mon, 26 Aug 2024 10:43:19 -0700
Message-ID: <20240826174322.2938481-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 17:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203766

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the upstream submission and latest patch submitted upstream

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...U-basename-compatible-implementation.patch | 136 ++++++++++++++++++
 2 files changed, 137 insertions(+)
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
index 00000000000..293675ee0a2
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
@@ -0,0 +1,136 @@
+From 4ea6d5f344574b876bbf029501301131e623e992 Mon Sep 17 00:00:00 2001
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
+ mesh/mesh-config-json.c | 5 +++--
+ mesh/rpl.c              | 3 ++-
+ src/shared/util.h       | 6 ++++++
+ tools/hex2hcd.c         | 3 ++-
+ 6 files changed, 17 insertions(+), 5 deletions(-)
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
+index c198627c6..8f89a1498 100644
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
+@@ -2694,7 +2695,7 @@ bool mesh_config_load_nodes(const char *cfgdir_name, mesh_config_node_func_t cb,
+ 
+ void mesh_config_destroy_nvm(struct mesh_config *cfg)
+ {
+-	char *node_dir, *node_name;
++	const char *node_dir, *node_name;
+ 	char uuid[33];
+ 
+ 	if (!cfg)
+@@ -2706,7 +2707,7 @@ void mesh_config_destroy_nvm(struct mesh_config *cfg)
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
+index f2ca4f29f..0f0f67718 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -296,3 +296,9 @@ static inline void put_be64(uint64_t val, void *dst)
+ {
+ 	put_unaligned(cpu_to_be64(val), (uint64_t *) dst);
+ }
++
++static inline const char *bluez_basename(const char *path)
++{
++	const char *base = strrchr(path, '/');
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

