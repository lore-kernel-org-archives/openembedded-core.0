Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1D3ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 20:45:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4221.1661978746587105457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 13:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.200, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id BAD3120003;
	Wed, 31 Aug 2022 20:45:43 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 7.85.0
Date: Wed, 31 Aug 2022 13:45:02 -0700
Message-Id: <20220831204502.2458764-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 20:45:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170141

Release notes are available at: https://curl.se/changes.html#7_85_0

Remove backported patches as they are included in the new release.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/{curl_7.84.0.bb => curl_7.85.0.bb}   |  4 +-
 ...-to-using-atomic_int-instead-of-bool.patch | 37 -------------------
 ...ude-sched.h-if-available-to-fix-buil.patch | 33 -----------------
 3 files changed, 1 insertion(+), 73 deletions(-)
 rename meta/recipes-support/curl/{curl_7.84.0.bb => curl_7.85.0.bb} (95%)
 delete mode 100644 meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch
 delete mode 100644 meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch

diff --git a/meta/recipes-support/curl/curl_7.84.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.84.0.bb
rename to meta/recipes-support/curl/curl_7.85.0.bb
index 75417cd1bc..3b55830415 100644
--- a/meta/recipes-support/curl/curl_7.84.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -11,12 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
-    file://0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch \
-    file://0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
+SRC_URI[sha256sum] = "88b54a6d4b9a48cb4d873c7056dcba997ddd5b7be5a2d537a4acb55c20b04be6"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
diff --git a/meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch b/meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch
deleted file mode 100644
index 878839a5e3..0000000000
--- a/meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 50efb0822aa0e0ab165158dd0a26e65a2290e6d2 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Tue, 28 Jun 2022 09:00:25 +0200
-Subject: [PATCH] easy_lock: switch to using atomic_int instead of bool
-
-To work with more compilers without requiring separate libs to
-link. Like with gcc-12 for RISC-V on Linux.
-
-Reported-by: Adam Sampson
-Fixes #9055
-Closes #9061
-
-Upstream-Status: Backport [50efb0822aa0e0ab165158dd0a26e65a2290e6d2]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- lib/easy_lock.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/easy_lock.h b/lib/easy_lock.h
-index 07c85c5ff..9c11bc50c 100644
---- a/lib/easy_lock.h
-+++ b/lib/easy_lock.h
-@@ -40,8 +40,8 @@
- #include <sched.h>
- #endif
- 
--#define curl_simple_lock atomic_bool
--#define CURL_SIMPLE_LOCK_INIT false
-+#define curl_simple_lock atomic_int
-+#define CURL_SIMPLE_LOCK_INIT 0
- 
- static inline void curl_simple_lock_lock(curl_simple_lock *lock)
- {
--- 
-2.25.1
-
diff --git a/meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch b/meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch
deleted file mode 100644
index 771bdb2b96..0000000000
--- a/meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 27 Jun 2022 08:46:21 +0200
-Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
-
-Patched-by: Harry Sintonen
-
-Closes #9054
-
-Upstream-Status: Backport [e2e7f54b7bea521fa8373095d0f43261a720cda0]
-
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/easy_lock.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/easy_lock.h b/lib/easy_lock.h
-index 819f50ce8..1f54289ce 100644
---- a/lib/easy_lock.h
-+++ b/lib/easy_lock.h
-@@ -36,6 +36,9 @@
- 
- #elif defined (HAVE_ATOMIC)
- #include <stdatomic.h>
-+#if defined(HAVE_SCHED_YIELD)
-+#include <sched.h>
-+#endif
- 
- #define curl_simple_lock atomic_bool
- #define CURL_SIMPLE_LOCK_INIT false
--- 
-2.35.1
-
-- 
2.35.1


