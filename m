Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C345C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 17:18:03 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.57534.1724692675865996435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 10:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lh3/tFrj;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc47abc040so39080495ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724692675; x=1725297475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibkZhG6FvQ222ibnG2afAD4hkZ+/eOFAtT6ER6e6Vj8=;
        b=Lh3/tFrjJrko+lL8F1pfwP+veqamblUi4XrvtzE9Du50l90Og712er/AVQOFbqSsDE
         NbxGRCJZIka184N4dS2LMQ0tFCiKcDVTZkd+5lq7SPjs9qWJpZrPm6r71j3g3To+SssH
         Rz5FWIwfPgy+FHkE4gqVSeKP7hu6qkcvRVIgrgaZng/yS+YBrM8e3JapUlsMFsNfHvz3
         TM6Ld9tG2L8WpxqoMs0DglDu9zk7+uWuVXaO1eLtCymc18VI0nTWrC0oQ5/4ZultaqQN
         I/qvYz/ua3lqdqvKHliBN2klH7FYn+BupS4pBZehRpN0nokv6x2wOjPt/1FJWmn7qJ+u
         5gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724692675; x=1725297475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibkZhG6FvQ222ibnG2afAD4hkZ+/eOFAtT6ER6e6Vj8=;
        b=dGG4S6d92Uo2/Lk8OANAKqgGjZEEDnvebYsmoAq9oJ6eHtjUQH6LyAMtnhin3IhoJF
         mOF32YpZSlZxyMyCymFoiKZRA41IsIOZ9ES6OHzvU1QPNUhT47EBHaJJr1q9Hz7LADjT
         Lt2t9Slgz/62n47p5ol/SRxZTESm172n1b4XewtzHD26n9ZKizKJgxhWoIh2xoZe1fh9
         //LkREyySOxQXQnXVtzAFtLQ8oaD8pFDMh8Cnt0aSaT3apQOqyoe6Z812helJcpYb+i1
         adJGXu/F1TygX1lQD10H/zuTElk9caeoYFrHeoZ380dop+Fjq20DOY45iRAgs+/mi9aa
         TpPg==
X-Gm-Message-State: AOJu0Ywe+YY2Hv2R9N988ho6cSZGy4S074QQX9tfuBCcfB4e4y9fI973
	tooX4CMIWpgdBtzhuaGdJF9E0jKpJDcoBrUbUi6Tl8hpBOfGEHcw+YwGDA==
X-Google-Smtp-Source: AGHT+IEVIeIN4xunAUXAcqSTpBdRpKjGGpKwi82U2VtBg+OlIG8N0T5vyUA00Z53FxTpaRaB0OTrBw==
X-Received: by 2002:a17:903:2292:b0:203:a046:c528 with SMTP id d9443c01a7336-203a046c5famr115790415ad.6.1724692674944;
        Mon, 26 Aug 2024 10:17:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557eeccsm69968205ad.84.2024.08.26.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:17:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] bluez5: Fix build with musl
Date: Mon, 26 Aug 2024 10:17:49 -0700
Message-ID: <20240826171752.2886654-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 17:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203761

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...U-basename-compatible-implementation.patch | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
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
index 00000000000..f6feaffa6b6
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
@@ -0,0 +1,97 @@
+From 721e23d609f27adc958daeb178ce7f6a0cebf91b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Aug 2024 09:55:03 -0700
+Subject: [PATCH] Provide GNU basename compatible implementation
+
+Call to basename() relies on a GNU extension
+to take a const char * vs a char *. Let's define
+a trivial helper function to ensure compatibility
+with musl.
+
+Fixes Issue: https://github.com/bluez/bluez/issues/843
+
+Upstream-Status: Submitted [https://github.com/bluez/bluez/pull/936]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.tools          | 3 ++-
+ mesh/mesh-config-json.c | 2 +-
+ mesh/rpl.c              | 2 +-
+ src/shared/util.h       | 6 ++++++
+ tools/hex2hcd.c         | 3 ++-
+ 5 files changed, 12 insertions(+), 4 deletions(-)
+
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
+index c198627c6..3da825d19 100644
+--- a/mesh/mesh-config-json.c
++++ b/mesh/mesh-config-json.c
+@@ -2706,7 +2706,7 @@ void mesh_config_destroy_nvm(struct mesh_config *cfg)
+ 	if (!hex2str(cfg->uuid, 16, uuid, sizeof(uuid)))
+ 		return;
+ 
+-	node_name = basename(node_dir);
++	node_name = bluez_basename(node_dir);
+ 
+ 	/* Make sure path name of node follows expected guidelines */
+ 	if (strcmp(node_name, uuid))
+diff --git a/mesh/rpl.c b/mesh/rpl.c
+index fb225dddd..6b279a72e 100644
+--- a/mesh/rpl.c
++++ b/mesh/rpl.c
+@@ -146,7 +146,7 @@ static void get_entries(const char *iv_path, struct l_queue *rpl_list)
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
+index e6dca5a81..3cb6473c8 100644
+--- a/tools/hex2hcd.c
++++ b/tools/hex2hcd.c
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
+ #include <stdbool.h>
+ #include <sys/stat.h>
++#include <shared/util.h>
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

