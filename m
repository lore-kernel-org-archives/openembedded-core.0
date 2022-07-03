Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE729C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 22:27:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.66108.1656887235993998102
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 15:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.198, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 14A2AC0003;
	Sun,  3 Jul 2022 22:27:12 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 7.84.0
Date: Sun,  3 Jul 2022 15:26:25 -0700
Message-Id: <20220703222625.3842461-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 150
X-GND-Status: SPAM
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 22:27:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167592

This is a feature and bugfix update. Release notes are available at:
https://curl.se/changes.html#7_84_0

Backport a patch fixing a compile issue where sched.h was not included
on certain platforms.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/{curl_7.83.1.bb => curl_7.84.0.bb}   |  7 ++--
 ...ude-sched.h-if-available-to-fix-buil.patch | 33 +++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} (94%)
 create mode 100644 meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch

diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-support/curl/curl_7.84.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.83.1.bb
rename to meta/recipes-support/curl/curl_7.84.0.bb
index 1d9de29a65..74a19d20c9 100644
--- a/meta/recipes-support/curl/curl_7.83.1.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -9,8 +9,11 @@ SECTION = "console/network"
 LICENSE = "MIT-open-group"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
-SRC_URI = "https://curl.se/download/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
+SRC_URI = " \
+    https://curl.se/download/${BP}.tar.xz \
+    file://0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch \
+"
+SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
diff --git a/meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch b/meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch
new file mode 100644
index 0000000000..771bdb2b96
--- /dev/null
+++ b/meta/recipes-support/curl/files/0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch
@@ -0,0 +1,33 @@
+From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 27 Jun 2022 08:46:21 +0200
+Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
+
+Patched-by: Harry Sintonen
+
+Closes #9054
+
+Upstream-Status: Backport [e2e7f54b7bea521fa8373095d0f43261a720cda0]
+
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/easy_lock.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/easy_lock.h b/lib/easy_lock.h
+index 819f50ce8..1f54289ce 100644
+--- a/lib/easy_lock.h
++++ b/lib/easy_lock.h
+@@ -36,6 +36,9 @@
+ 
+ #elif defined (HAVE_ATOMIC)
+ #include <stdatomic.h>
++#if defined(HAVE_SCHED_YIELD)
++#include <sched.h>
++#endif
+ 
+ #define curl_simple_lock atomic_bool
+ #define CURL_SIMPLE_LOCK_INIT false
+-- 
+2.35.1
+
-- 
2.35.1


