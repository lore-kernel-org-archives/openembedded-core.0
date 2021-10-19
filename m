Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C094C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.11504.1634657667048759748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TBT5lVSd;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g2so12483473wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yFYvq91dBB8mLxv5yppAOywYlOcWUlHizEOppQBdpXw=;
        b=TBT5lVSdvcGis62u7R3nBZzIjnrcwTRtSrtwV3BMRCX7kFiyXQ4beZBvcE4uKCjoDy
         zqramrqXmI/28sE/h0z+pywzbSt/yu0vpSxlcz0bwvbcdm4/Lc8DGSi9m8Lnh4TeIxS5
         sNrZkxxaTOBKHhO75L7PHs46h68AdZmn56hA43eVAQQhnY21+qMpDnT8GA7oWklhFf//
         OewW1dmN4dwqA7DUylAi/XKbpRsnBgVryvTU6upJRm1SGJyF9WiLeJf3cnM04vVSxHah
         LwO6FrOvHYXsnWG51sI1aWPl/nJ7Nrwrj5R/C1BrhAlVlDh4jjFQ+Rtn+SNhrrxa/2/Z
         2ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yFYvq91dBB8mLxv5yppAOywYlOcWUlHizEOppQBdpXw=;
        b=WUbOiVUYUfcbS+zOshlenkUsawajKEjCrhFwwxdB+8qVJnog4+uKmhvTlfVpJB2fxY
         EhVPCsPA9FFfSxxyKtOgMfPv0DNFhjacFL+lCzFddoU+a3sInJ2Ty3qY6JEL4UQv6T83
         sWvyHc5xZBtIIpcdrjolAY5czDa0VPjHOHSOLuSyz7SDu2uEdRb70PQ5sV5geoc18h3E
         0vvdxB9dDEaRHDpdE6YKPqr92pZ/xFaKvbWIYZpJWYFEEqbYrXA4KAodHoxy3VZgmTWR
         G3GHyJOWAcbs77tijzjG7EIP5KjosXPzcLH57SqHKPjkIiLvGoIzSFf8kfL2e+o5ruvL
         7hdg==
X-Gm-Message-State: AOAM5328TwZDj0SNFYjtYkEsKdsT5aFv8PI9eSdNyLK4M+kXSP9GtPvu
	KST9YW+HmvqIu9gZLl9XyMZO+qNHKVQ=
X-Google-Smtp-Source: 
 ABdhPJwUv3xkH9JgsLebJDb8GbLwbjryVPgMK7ErVC3rlVnRK1HzjFuLdMpHJHYy82YJ0uBkn7KSiw==
X-Received: by 2002:a1c:208:: with SMTP id 8mr6946658wmc.114.1634657665401;
        Tue, 19 Oct 2021 08:34:25 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH 03/65] kea: update 1.8.2 -> 2.0.0
Date: Tue, 19 Oct 2021 17:33:17 +0200
Message-Id: <20211019153419.3319802-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157122

Remove 0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
as code removed upstream.

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-add-missing-headers-in-timer_mgr.cc.patch | 29 ----------
 ...01-ax_cpp11.m4-Include-memory-header.patch | 24 ---------
 .../kea/files/0001-include-limits.h.patch     | 35 ------------
 ...e-var-lib-kea-and-var-run-kea-folder.patch | 39 --------------
 ...er_unittest_support.cc-do-not-write-.patch |  7 +--
 .../kea/files/fix-multilib-conflict.patch     | 54 ++++++++++---------
 .../kea/files/fix_pid_keactrl.patch           | 27 ++++++----
 .../kea/{kea_1.8.2.bb => kea_2.0.0.bb}        |  8 +--
 8 files changed, 51 insertions(+), 172 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
 rename meta/recipes-connectivity/kea/{kea_1.8.2.bb => kea_2.0.0.bb} (87%)

diff --git a/meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch b/meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch
deleted file mode 100644
index 1cd8bc70f5..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 11981d637273778f408d15f488cc9e1d244dcae8 Mon Sep 17 00:00:00 2001
-From: Andrei Pavel <andrei@isc.org>
-Date: Thu, 29 Jul 2021 21:33:42 +0300
-Subject: [PATCH] add missing headers in timer_mgr.cc
-
-Upstream-Status: Backport [https://github.com/isc-projects/kea/commit/2bba96164f6c5c8f56de7a5dc52af73bfd51cccd]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/lib/dhcpsrv/timer_mgr.cc | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/lib/dhcpsrv/timer_mgr.cc b/src/lib/dhcpsrv/timer_mgr.cc
-index 5ec4123..5611c46 100644
---- a/src/lib/dhcpsrv/timer_mgr.cc
-+++ b/src/lib/dhcpsrv/timer_mgr.cc
-@@ -14,6 +14,13 @@
- #include <functional>
- #include <utility>
- 
-+#include <exception>
-+#include <map>
-+#include <mutex>
-+#include <ostream>
-+#include <string>
-+#include <stddef.h>
-+
- using namespace isc;
- using namespace isc::asiolink;
- 
diff --git a/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch b/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
deleted file mode 100644
index 4978cae87c..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 5314a4815006e3a42f3ce265d1597db700cdb784 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Feb 2021 23:14:20 -0800
-Subject: [PATCH] ax_cpp11.m4: Include <memory> header
-
-This is needed for std::shared_ptr
-GCC-11 throws errors if header is not included
-
-Upstream-Status: Submitted [https://github.com/isc-projects/kea/pull/120]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- m4macros/ax_cpp11.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/m4macros/ax_cpp11.m4
-+++ b/m4macros/ax_cpp11.m4
-@@ -182,6 +182,7 @@ for retry in "none" "--std=c++11" "--std
- 	AC_COMPILE_IFELSE(
- 		[AC_LANG_PROGRAM(
- 			[#include <thread>
-+			 #include <memory>
- 			 std::shared_ptr<std::thread> th;],
- 			[th.reset(new std::thread([[]]() { return; }));
- 			 th->join();])],
diff --git a/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch b/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
deleted file mode 100644
index 3856b3d523..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7bca122e15bbe98c7b8da851ef3e1cf9a714afd9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Feb 2021 23:31:15 -0800
-Subject: [PATCH] include limits.h
-
-Fixes build with gcc11
-backend_selector.cc:61:35: error: 'numeric_limits' is not a member of 'std'
-
-Upstream-Status: Submitted [https://github.com/isc-projects/kea/pull/120]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/exceptions/exceptions.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/lib/database/backend_selector.cc
-+++ b/src/lib/database/backend_selector.cc
-@@ -6,7 +6,7 @@
- 
- #include <database/backend_selector.h>
- #include <exceptions/exceptions.h>
--#include <climits>
-+#include <limits>
- #include <sstream>
- 
- using namespace isc::data;
---- a/src/lib/dhcpsrv/subnet_id.h
-+++ b/src/lib/dhcpsrv/subnet_id.h
-@@ -10,6 +10,7 @@
- #include <exceptions/exceptions.h>
- #include <stdint.h>
- #include <typeinfo>
-+#include <limits>
- 
- namespace isc {
- namespace dhcp {
diff --git a/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch b/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
deleted file mode 100644
index ab3fd83946..0000000000
--- a/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 639dc25cdabc9d1846000a542c8cc19158b69994 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 18 Sep 2020 08:18:08 +0000
-Subject: [PATCH] keactrl.in: create /var/lib/kea and /var/run/kea folder
-
-Create /var/lib/kea and /var/run/kea folder to fix below error:
- # keactrl start
- INFO/keactrl: Starting /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf
- INFO/keactrl: Starting /usr/sbin/kea-dhcp6 -c /etc/kea/kea-dhcp6.conf
- INFO/keactrl: Starting /usr/sbin/kea-ctrl-agent -c /etc/kea/kea-ctrl-agent.conf
- Unable to use interprocess sync lockfile (No such file or directory): /var/run/kea/logger_lockfile
- Service failed: Launch failed: Unable to open PID file '/var/run/kea/kea-ctrl-agent.kea-ctrl-agent.pid' for write
- [snip]
- ERROR [kea-dhcp4.dhcp4/615.140641792751488] DHCP4_CONFIG_LOAD_FAIL configuration error using file: /etc/kea/kea-dhcp4.conf, reason: Unable to open database: unable to open '/var/lib/kea/kea-leases4.csv'
- [snip]
-
-Upstream-Status: Inappropriate [config specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/bin/keactrl/keactrl.in | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 12b2b3f..47cf6f9 100644
---- a/src/bin/keactrl/keactrl.in
-+++ b/src/bin/keactrl/keactrl.in
-@@ -482,6 +482,8 @@ case ${command} in
-         # The variables (dhcp4_srv, dhcp6_serv, dhcp_ddns_srv etc) are set in the
-         # keactrl.conf file that shellcheck is unable to read.
-         # shellcheck disable=SC2154
-+        [ -d @LOCALSTATEDIR@/run/kea ] || mkdir -p @LOCALSTATEDIR@/run/kea
-+        [ -d @LOCALSTATEDIR@/lib/kea ] || mkdir -p @LOCALSTATEDIR@/lib/kea
-         run_conditional "dhcp4" "start_server ${dhcp4_srv} -c ${kea_dhcp4_config_file} ${args}" 1
-         run_conditional "dhcp6" "start_server ${dhcp6_srv} -c ${kea_dhcp6_config_file} ${args}" 1
-         # shellcheck disable=SC2154
--- 
-2.26.2
-
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 226bc5b311..94fbd12737 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 9985a03f13da4d7bb0a433f7305d2ffae3d82a27 Mon Sep 17 00:00:00 2001
+From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -8,12 +8,13 @@ This breaks reproducibility and is needed only in unit testing.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
-index 58dbef8..9a2929c 100644
+index fc01c6e..f46d17e 100644
 --- a/src/lib/log/logger_unittest_support.cc
 +++ b/src/lib/log/logger_unittest_support.cc
 @@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
@@ -24,4 +25,4 @@ index 58dbef8..9a2929c 100644
 +    //setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
  
      // Initialize logging
-     initLogger(root, isc::log::DEBUG, isc::log::MAX_DEBUG_LEVEL, localfile);
+     initLogger(root, severity, dbglevel, localfile);
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 733adf5536..8de9fce4b4 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,7 @@
-There are conflict of config files between kea and lib32-kea:
+From d027b1d85a8c1a0193b6e4a00083d3038d699a59 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 22 Sep 2020 15:02:33 +0800
+Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 
 | Error: Transaction test error:
 |  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
@@ -10,16 +13,17 @@ Because they are all commented out, replace the expanded libdir path with
 '$libdir' in the config files to avoid conflict.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
- src/bin/keactrl/kea-dhcp4.conf.pre      | 6 ++++--
- 2 files changed, 6 insertions(+), 3 deletions(-)
+ src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-index 211b7ff..d710ec7 100644
+index e6ae8b8..50a3092 100644
 --- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
 +++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-@@ -45,7 +45,8 @@
+@@ -51,7 +51,8 @@
      // Agent will fail to start.
      "hooks-libraries": [
  //  {
@@ -30,26 +34,24 @@ index 211b7ff..d710ec7 100644
  //          "param1": "foo"
  //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 5f77a32..70ae3d9 100644
+index 26bf163..49ddb0a 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
-@@ -252,7 +252,8 @@
-     //      // of all devices serviced by Kea, including their identifiers
-     //      // (like MAC address), their location in the network, times
-     //      // when they were active etc.
--    //      "library": "@libdir@/kea/hooks/libdhcp_legal_log.so"
-+    //      // Replace $libdir with real library path /usr/lib or /usr/lib64
-+    //      "library": "$libdir/kea/hooks/libdhcp_legal_log.so"
-     //      "parameters": {
-     //          "path": "/var/lib/kea",
-     //          "base-name": "kea-forensic4"
-@@ -269,7 +270,8 @@
-     //      // of specific options or perhaps even a combination of several
-     //      // options and fields to uniquely identify a client. Those scenarios
-     //      // are addressed by the Flexible Identifiers hook application.
--    //      "library": "@libdir@/kea/hooks/libdhcp_flex_id.so",
-+    //      // Replace $libdir with real library path /usr/lib or /usr/lib64
-+    //      "library": "$libdir/kea/hooks/libdhcp_flex_id.so",
-     //      "parameters": {
-     //          "identifier-expression": "substring(relay6[0].option[18],0,8)"
-     //      }
+@@ -252,7 +252,7 @@
+     //       // of all devices serviced by Kea, including their identifiers
+     //       // (like MAC address), their location in the network, times
+     //       // when they were active etc.
+-    //       "library": "@libdir@/kea/hooks/libdhcp_legal_log.so",
++    //       "library": "$libdir/kea/hooks/libdhcp_legal_log.so",
+     //       "parameters": {
+     //           "path": "/var/lib/kea",
+     //           "base-name": "kea-forensic4"
+@@ -269,7 +269,7 @@
+     //       // of specific options or perhaps even a combination of several
+     //       // options and fields to uniquely identify a client. Those scenarios
+     //       // are addressed by the Flexible Identifiers hook application.
+-    //       "library": "@libdir@/kea/hooks/libdhcp_flex_id.so",
++    //       "library": "$libdir/kea/hooks/libdhcp_flex_id.so",
+     //       "parameters": {
+     //           "identifier-expression": "relay4[2].hex"
+     //       }
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index eeeb89942b..b7c2fd4f0d 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,22 +1,29 @@
-Busybox does not support ps -p so use pgrep
+From 18f4f6206c248d6169aa67b3ecf16bf54e9292e8 Mon Sep 17 00:00:00 2001
+From: Armin kuster <akuster808@gmail.com>
+Date: Wed, 14 Oct 2020 22:48:31 -0700
+Subject: [PATCH] Busybox does not support ps -p so use pgrep
 
 Upstream-Status: Inappropriate [embedded specific]
 Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
 
-Index: kea-1.7.10/src/bin/keactrl/keactrl.in
-===================================================================
---- kea-1.7.10.orig/src/bin/keactrl/keactrl.in
-+++ kea-1.7.10/src/bin/keactrl/keactrl.in
-@@ -137,8 +137,8 @@ check_running() {
+---
+ src/bin/keactrl/keactrl.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
+index ae5bd8e..e9f9b73 100644
+--- a/src/bin/keactrl/keactrl.in
++++ b/src/bin/keactrl/keactrl.in
+@@ -151,8 +151,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
 -        # Use ps to check if PID is alive
--        ps -p ${_pid} 1>/dev/null
+-        if ps -p ${_pid} 1>/dev/null; then
 +        # Use pgrep and grep to check if PID is alive
-+        pgrep -v 1 | grep ${_pid} 1>/dev/null
-         retcode=$?
-         if [ $retcode -eq 0 ]; then
++        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
              # No error, so PID IS ALIVE
+             _running=1
+         fi
diff --git a/meta/recipes-connectivity/kea/kea_1.8.2.bb b/meta/recipes-connectivity/kea/kea_2.0.0.bb
similarity index 87%
rename from meta/recipes-connectivity/kea/kea_1.8.2.bb
rename to meta/recipes-connectivity/kea/kea_2.0.0.bb
index 04424d0d70..9f33c325bd 100644
--- a/meta/recipes-connectivity/kea/kea_1.8.2.bb
+++ b/meta/recipes-connectivity/kea/kea_2.0.0.bb
@@ -3,12 +3,11 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=07b7477a1d815a4aacab73b1531f577a"
 
 DEPENDS = "boost log4cplus openssl"
 
 SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-           file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
            file://kea-dhcp4.service \
            file://kea-dhcp6.service \
            file://kea-dhcp-ddns.service \
@@ -18,11 +17,8 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-ax_cpp11.m4-Include-memory-header.patch \
-           file://0001-include-limits.h.patch \
-           file://0001-add-missing-headers-in-timer_mgr.cc.patch \
            "
-SRC_URI[sha256sum] = "486ca7abedb9d6fdf8e4344ad8688d1171f2ef0f5506d118988aadeae80a1d39"
+SRC_URI[sha256sum] = "05854e0c3871b452edace18eccc6ab618940e0249fbe7c232a36d06ae59bf41d"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.20.1


