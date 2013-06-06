Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A9B2C6A4D2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 03:05:56 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so571231pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 20:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8MnS/aYNe01vgN+Atq8jB901rQTW/PCcqSLyz2AhINk=;
	b=cjQTE5cXntIqrpg+neLo9AoiUqxvPPQhvLBs7KCV0cU6V3yTSfAJr+E0XjfUJcJF/k
	2vFqd88MNrrh3GNdsCuPJVEimwPZriFRCgnklDX7MZORdCVcUERCngU0PpirE5mH0yJ5
	YmaLNbnnvaqdiuAbniJX9aw/KnKyOoNRhWXDWYW2M4JKDU9o6TlAGOTxm2k8sYbSjtRX
	N956aWqxOPpef+i+uL6pEfS33uIrcbaqhIk9IXlj7MB4DBvcTtW8Yo82/4kWYdUe5Frp
	bKKNKvAbwYBUr3MatxwzvVrty3FhpMvkYx9bkxjokxnBalEVOUW9T+EBS2kBLvAGyzo6
	cc1w==
X-Received: by 10.66.197.202 with SMTP id iw10mr36575953pac.178.1370487957870; 
	Wed, 05 Jun 2013 20:05:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id l4sm70674559pbo.6.2013.06.05.20.05.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 20:05:56 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2013 13:19:23 +1000
Message-Id: <1370488763-20641-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] qt4: fix QMAKE_QT_CONFIG being overwritten with empty value
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jun 2013 03:05:56 -0000

QMAKE_QT_CONFIG is set by the linux-oe-g++ mkspec but it is overwritten
with an empty value read from .qmake.cache. Avoid this by first checking
if the value from .qmake.cache is not empty before assigning it to
QMAKE_QT_CONFIG.

This allows variables from qconfig.pri such as QT_ARCH, QT_CONFIG,
QT_VERSION, etc. to be queried by qmake projects.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |  1 +
 ...verwrite-QMAKE_QT_CONFIG-with-empty-value.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-4.8.4.inc
index ce12b1e..e87dacc 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -25,6 +25,7 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0023-qtnetwork-blacklist-two-more-certificates.patch \
            file://0024-Change-all-shmget-calls-to-user-only-memory.patch \
            file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
+           file://0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch
new file mode 100644
index 0000000..a37e35f
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch
@@ -0,0 +1,39 @@
+From 1c75ea0332054c420efd676c147e45eee43e0118 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Thu, 6 Jun 2013 12:42:13 +1000
+Subject: [PATCH] Don't overwrite QMAKE_QT_CONFIG with empty value
+
+If the mkspec sets QMAKE_QT_CONFIG, QMAKE_QT_CONFIG may be overwritten
+with an empty value from .qmake.cache. Avoid this by first checking
+if the value from .qmake.cache is not empty before assigning it to
+QMAKE_QT_CONFIG.
+
+Upstream-Status: Submitted
+https://codereview.qt-project.org/#change,58109
+
+Change-Id: I95fa630139b8798156a2fb15d0dde630a0a53a0a
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ mkspecs/features/qt_config.prf | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/qt_config.prf b/mkspecs/features/qt_config.prf
+index fc14cdd..e059b7e 100644
+--- a/mkspecs/features/qt_config.prf
++++ b/mkspecs/features/qt_config.prf
+@@ -1,7 +1,11 @@
+ # This file is loaded by the mkspecs, before .qmake.cache has been loaded.
+ # Consequently, we have to do some stunts to get values out of the cache.
+ 
+-exists($$_QMAKE_CACHE_):QMAKE_QT_CONFIG = $$fromfile($$_QMAKE_CACHE_, QMAKE_QT_CONFIG)
++exists($$_QMAKE_CACHE_) {
++   qdd = $$fromfile($$_QMAKE_CACHE_, QMAKE_QT_CONFIG)
++   !isEmpty(qdd): QMAKE_QT_CONFIG = $$qdd
++   unset(qdd)
++}
+ isEmpty(QMAKE_QT_CONFIG)|!exists($$QMAKE_QT_CONFIG) {
+    qdd = $$QT_BUILD_TREE
+    isEmpty(qdd):exists($$_QMAKE_CACHE_): qdd = $$fromfile($$_QMAKE_CACHE_, QT_BUILD_TREE)
+-- 
+1.8.2.3
+
-- 
1.8.2.3


