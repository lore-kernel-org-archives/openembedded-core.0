Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A603ECE58E
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 23:45:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.10846.1725925505125706825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 16:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5Zu7uDD;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so5362794a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 16:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725925503; x=1726530303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EU8FTAKv+DlXMA/SD3HwLhBJCLZFGtsjz5xLOu1vn/Y=;
        b=i5Zu7uDD5EREkzSe+q9LtQomkzyFvAemDO1kSEkJotfSTxOKGMJiIzcd0YmY193LkY
         2nsdcDSU9o9YN7k1Fz5qIYNRZQ3TMbgzMOl0+jz1k89v6zr1vDQYGsi4huxVr6dLlOAR
         0A5xg73+UXOOyZD6pyWdqJgUK31FizPwr0DhlENB3n4D8dlfIEQi8IjuUQbBRhZySOns
         wRegKcuDjX9XHkB9eL8bHTaocZOIAySpqzzUNW6Iu6GP4g5SftJVZHWsz1nN/ODK/dWo
         pLd96YkGVgOn2A1wg/EaSsCWt3TmmMQh/pQw+lhpIAJzaZH4R+GhsVNRZ7bpn/XF8u/W
         q2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725925503; x=1726530303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU8FTAKv+DlXMA/SD3HwLhBJCLZFGtsjz5xLOu1vn/Y=;
        b=Zz+UzyrOB4onak3yP3JhFE2A2nx8XIbhZPtoMBTS6ieSjhbBkWuDsP0UWYkCMB2xTP
         K1ysH+miU0p9TrPVr/CF4Lzoyorw8e00Oi0R6gMWbIXZym2bLUjXDX2hhA7rk27ZZ/7E
         4+4QOaVVZb6Cqzl8YBOrvXTS3Ibn0uVuXqs9VfyBMz0TxKyky4oWX3R4GTGHW1SeR7lG
         JcT2/620k5l0T/KG4aDmi5rx6YvrK5PK/+sASnTDfCge73MpNYU4ohAhaB7EUJJVcMJH
         0nY3zDb25V/lKNayDvDu6bGFVkYO5JCaVphOvMbSzTjTrcucLdbs05594VQs8oPd4hWT
         Ndcw==
X-Gm-Message-State: AOJu0YwxnKXJmtYEXAUX8QNQ3yHlbiEUMF7fgDPrOv3Ya79mTiog+3if
	E2AHIdsRXIHpp5kRYUows0BIXX4uudKI52jserA9eZ6JtDnK1GGxNsZZtg==
X-Google-Smtp-Source: AGHT+IF0ex09ROhiaGWWDjGUyd42rm+LKNnBCLBJY8sllfN7bQCvDQXfmyJRpmGqMru50F5J/lWFiA==
X-Received: by 2002:a05:6402:3712:b0:5bf:50:266b with SMTP id 4fb4d7f45d1cf-5c3eac09890mr5445397a12.19.1725925501812;
        Mon, 09 Sep 2024 16:45:01 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76edasm3546070a12.77.2024.09.09.16.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 16:45:01 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.77 -> 5.78
Date: Mon,  9 Sep 2024 23:44:44 +0000
Message-ID: <20240909234444.1846114-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 23:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204325

 * Fix issue with handling notification of scanned BISes to BASS
 * Fix issue with handling checking BIS caps against peer caps.
 * Fix issue with handling MGMT Set Device Flags overwrites.
 * Fix issue with handling ASE notification order.
 * Fix issue with handling BIG Info report events.
 * Fix issue with handling PACS Server role.
 * Fix issue with registering UHID_START multiple times.
 * Fix issue with pairing method not setting auto-connect.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...U-basename-compatible-implementation.patch | 136 +++++++++---------
 .../0001-test-gatt-Fix-hung-issue.patch       |   2 +-
 ...et-for-building-tests-without-runnin.patch |   4 +-
 ...shared-util.c-include-linux-limits.h.patch |   2 +-
 .../bluez5/{bluez5_5.77.bb => bluez5_5.78.bb} |   2 +-
 5 files changed, 75 insertions(+), 71 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.77.bb => bluez5_5.78.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
index 3a2a97ff02..4f028e589b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-compatible-implementation.patch
@@ -1,7 +1,7 @@
-From 9000923c07a68857e8ea32a49bfca660b1d1001a Mon Sep 17 00:00:00 2001
+From 44e24350aae771daa93e5a85378856f91358688f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Aug 2024 09:55:03 -0700
-Subject: [PATCH BlueZ] Provide GNU basename compatible implementation
+Subject: [PATCH] Provide GNU basename compatible implementation
 
 Call to basename() relies on a GNU extension
 to take a const char * vs a char *. Let's define
@@ -13,65 +13,21 @@ Fixes Issue: https://github.com/bluez/bluez/issues/843
 Upstream-Status: Submitted [https://lore.kernel.org/linux-bluetooth/20240826173844.2918630-1-raj.khem@gmail.com/T/#u]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile.mesh           | 2 ++
- Makefile.tools          | 3 ++-
- mesh/mesh-config-json.c | 6 ++++--
- mesh/rpl.c              | 3 ++-
- src/shared/util.h       | 7 +++++++
- tools/hex2hcd.c         | 3 ++-
- 6 files changed, 19 insertions(+), 5 deletions(-)
+ configure.ac            | 11 ++++++++++-
+ mesh/mesh-config-json.c |  4 +++-
+ mesh/missing.h          | 21 +++++++++++++++++++++
+ mesh/rpl.c              |  1 +
+ tools/hex2hcd.c         |  1 +
+ tools/missing.h         | 21 +++++++++++++++++++++
+ 6 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 mesh/missing.h
+ create mode 100644 tools/missing.h
 
-Index: bluez-5.77/mesh/mesh-config-json.c
-===================================================================
---- bluez-5.77.orig/mesh/mesh-config-json.c
-+++ bluez-5.77/mesh/mesh-config-json.c
-@@ -28,6 +28,7 @@
- #include <ell/ell.h>
- #include <json-c/json.h>
- 
-+#include "mesh/missing.h"
- #include "mesh/mesh-defs.h"
- #include "mesh/util.h"
- #include "mesh/mesh-config.h"
-@@ -2694,7 +2695,8 @@ bool mesh_config_load_nodes(const char *
- 
- void mesh_config_destroy_nvm(struct mesh_config *cfg)
- {
--	char *node_dir, *node_name;
-+	char *node_dir;
-+	const char* node_name;
- 	char uuid[33];
- 
- 	if (!cfg)
-Index: bluez-5.77/mesh/rpl.c
-===================================================================
---- bluez-5.77.orig/mesh/rpl.c
-+++ bluez-5.77/mesh/rpl.c
-@@ -24,6 +24,7 @@
- 
- #include <ell/ell.h>
- 
-+#include "mesh/missing.h"
- #include "mesh/mesh-defs.h"
- 
- #include "mesh/node.h"
-Index: bluez-5.77/tools/hex2hcd.c
-===================================================================
---- bluez-5.77.orig/tools/hex2hcd.c
-+++ bluez-5.77/tools/hex2hcd.c
-@@ -24,6 +24,7 @@
- #include <stdlib.h>
- #include <stdbool.h>
- #include <sys/stat.h>
-+#include "tools/missing.h"
- 
- static ssize_t process_record(int fd, const char *line, uint16_t *upper_addr)
- {
-Index: bluez-5.77/configure.ac
-===================================================================
---- bluez-5.77.orig/configure.ac
-+++ bluez-5.77/configure.ac
-@@ -70,7 +70,16 @@ AC_CHECK_LIB(pthread, pthread_create, du
+diff --git a/configure.ac b/configure.ac
+index a7fb51f..254f1a7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,7 +70,16 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
  AC_CHECK_LIB(dl, dlopen, dummy=yes,
  			AC_MSG_ERROR(dynamic linking loader is required))
  
@@ -89,10 +45,33 @@ Index: bluez-5.77/configure.ac
  
  PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28)
  
-Index: bluez-5.77/tools/missing.h
-===================================================================
+diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
+index c198627..e3b0a18 100644
+--- a/mesh/mesh-config-json.c
++++ b/mesh/mesh-config-json.c
+@@ -28,6 +28,7 @@
+ #include <ell/ell.h>
+ #include <json-c/json.h>
+ 
++#include "mesh/missing.h"
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
+diff --git a/mesh/missing.h b/mesh/missing.h
+new file mode 100644
+index 0000000..eaf3281
 --- /dev/null
-+++ bluez-5.77/tools/missing.h
++++ b/mesh/missing.h
 @@ -0,0 +1,21 @@
 +// SPDX-License-Identifier: LGPL-2.1-or-later
 +/*
@@ -115,10 +94,35 @@ Index: bluez-5.77/tools/missing.h
 +  return base ? base + 1 : path;
 +}
 +#endif
-Index: bluez-5.77/mesh/missing.h
-===================================================================
+diff --git a/mesh/rpl.c b/mesh/rpl.c
+index fb225dd..2fa17d7 100644
+--- a/mesh/rpl.c
++++ b/mesh/rpl.c
+@@ -24,6 +24,7 @@
+ 
+ #include <ell/ell.h>
+ 
++#include "mesh/missing.h"
+ #include "mesh/mesh-defs.h"
+ 
+ #include "mesh/node.h"
+diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
+index e6dca5a..452ab2b 100644
+--- a/tools/hex2hcd.c
++++ b/tools/hex2hcd.c
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
+ #include <stdbool.h>
+ #include <sys/stat.h>
++#include "tools/missing.h"
+ 
+ static ssize_t process_record(int fd, const char *line, uint16_t *upper_addr)
+ {
+diff --git a/tools/missing.h b/tools/missing.h
+new file mode 100644
+index 0000000..eaf3281
 --- /dev/null
-+++ bluez-5.77/mesh/missing.h
++++ b/tools/missing.h
 @@ -0,0 +1,21 @@
 +// SPDX-License-Identifier: LGPL-2.1-or-later
 +/*
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index ae113a9a6d..1b1af4ba96 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From eeb62ab04b3789a27074236cd0bed7cc64759f4d Mon Sep 17 00:00:00 2001
+From b8371d1111e21a9b3285ec0864b78e98d7acf79f Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 37253b9725..b85c050ffc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From c06fecbb009f4c42f01d86383d4571c96ba872f0 Mon Sep 17 00:00:00 2001
+From bbfecd4407b6425f409c4657ac96e67f0a995a12 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0ae7211..c8bcaca 100644
+index 68bf058..a376d10 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -713,6 +713,9 @@ endif
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index 567cf5db8c..14afdf025b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From 705235d674f574bee08ea3138208938a086e1b53 Mon Sep 17 00:00:00 2001
+From 409b2247f0003bc474a73aed78fa4c5a86bc30ec Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.77.bb b/meta/recipes-connectivity/bluez5/bluez5_5.78.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.77.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.78.bb
index 55264fd6b7..23d1ad69d8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.77.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.78.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812"
+SRC_URI[sha256sum] = "830fed1915c5d375b8de0f5e6f45fcdea0dcc5ff5ffb3d31db6ed0f00d73c5e3"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0


