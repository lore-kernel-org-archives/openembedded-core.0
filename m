Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8554F73166
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 11:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EC60D2E08D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GvPuEbugiAkB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id BE9CD2E0FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A8F70103B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9DA2A14A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 9BEFEFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3EBaean019350
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:36:40 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3EBae3b019349
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2016 13:36:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 13:36:39 +0200
Message-Id: <8ec5bf2cd65cc748fc508a4e6cac72593cfa8e77.1460633745.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1460633745.git.pkj@axis.com>
References: <cover.1460633745.git.pkj@axis.com>
In-Reply-To: <cover.1460633745.git.pkj@axis.com>
References: <cover.1460633745.git.pkj@axis.com>
Subject: [PATCH 1/1] shadow: Disable syslog for more commands
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
X-List-Received-Date: Thu, 14 Apr 2016 11:36:42 -0000

When building shadow-native, syslog was disabled for useradd and
groupadd. This disables it also for groupdel, groupmems, groupmod,
userdel and usermod (i.e., the use of syslog is now disabled for all
commands supported by useradd_base.bbclass).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0001-Disable-use-of-syslog-for-sysroot.patch   | 124 +++++++++++++++++++++
 .../shadow/files/disable-syslog.patch              |  34 ------
 meta/recipes-extended/shadow/shadow.inc            |   4 +-
 3 files changed, 126 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/disable-syslog.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
new file mode 100644
index 0000000..a6f604b
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -0,0 +1,124 @@
+From 8cf3454d567f77233023be49a39a33e9f0836f89 Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Thu, 14 Apr 2016 12:28:57 +0200
+Subject: [PATCH] Disable use of syslog for sysroot
+
+Disable use of syslog to prevent sysroot user and group additions from
+writing entries to the host's syslog. This patch should only be used
+with the shadow-native recipe.
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ src/groupadd.c  | 3 +++
+ src/groupdel.c  | 3 +++
+ src/groupmems.c | 3 +++
+ src/groupmod.c  | 3 +++
+ src/useradd.c   | 3 +++
+ src/userdel.c   | 3 +++
+ src/usermod.c   | 3 +++
+ 7 files changed, 21 insertions(+)
+
+diff --git a/src/groupadd.c b/src/groupadd.c
+index 39b4ec0..f716f57 100644
+--- a/src/groupadd.c
++++ b/src/groupadd.c
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id$"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <getopt.h>
+diff --git a/src/groupdel.c b/src/groupdel.c
+index da99347..46a679c 100644
+--- a/src/groupdel.c
++++ b/src/groupdel.c
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id$"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <grp.h>
+diff --git a/src/groupmems.c b/src/groupmems.c
+index e4f107f..95cb073 100644
+--- a/src/groupmems.c
++++ b/src/groupmems.c
+@@ -32,6 +32,9 @@
+ 
+ #include <config.h>
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <fcntl.h>
+ #include <getopt.h>
+ #include <grp.h>
+diff --git a/src/groupmod.c b/src/groupmod.c
+index d9d3807..6229737 100644
+--- a/src/groupmod.c
++++ b/src/groupmod.c
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id$"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <ctype.h>
+ #include <fcntl.h>
+ #include <getopt.h>
+diff --git a/src/useradd.c b/src/useradd.c
+index e1ebf50..25679d8 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id$"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <assert.h>
+ #include <ctype.h>
+ #include <errno.h>
+diff --git a/src/userdel.c b/src/userdel.c
+index 19b12bc..a083929 100644
+--- a/src/userdel.c
++++ b/src/userdel.c
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id$"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <getopt.h>
+diff --git a/src/usermod.c b/src/usermod.c
+index 685b50a..28e5cfc 100644
+--- a/src/usermod.c
++++ b/src/usermod.c
+@@ -34,6 +34,9 @@
+ 
+ #ident "$Id$"
+ 
++/* Disable use of syslog since we're running this command against a sysroot */
++#undef USE_SYSLOG
++
+ #include <ctype.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-- 
+2.1.0
+
diff --git a/meta/recipes-extended/shadow/files/disable-syslog.patch b/meta/recipes-extended/shadow/files/disable-syslog.patch
deleted file mode 100644
index 1943fd6..0000000
--- a/meta/recipes-extended/shadow/files/disable-syslog.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Disable use of syslog to prevent sysroot user and group additions from
-writing entries to the host's syslog. This patch should only be used
-with the shadow-native recipe.
-
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3/src/groupadd.c
---- shadow-4.1.4.3.orig//src/groupadd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3/src/groupadd.c	2012-04-05 10:05:59.440001758 -0700
-@@ -34,6 +34,9 @@
- 
- #ident "$Id: groupadd.c 3015 2009-06-05 22:16:56Z nekral-guest $"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <ctype.h>
- #include <fcntl.h>
- #include <getopt.h>
-diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3/src/useradd.c
---- shadow-4.1.4.3.orig//src/useradd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3/src/useradd.c	2012-04-05 10:06:25.076001315 -0700
-@@ -34,6 +34,9 @@
- 
- #ident "$Id: useradd.c 3015 2009-06-05 22:16:56Z nekral-guest $"
- 
-+/* Disable use of syslog since we're running this command against a sysroot */
-+#undef USE_SYSLOG
-+
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4313ffe..d024b01 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -25,13 +25,13 @@ SRC_URI_append_class-target = " \
            "
 
 SRC_URI_append_class-native = " \
-           file://disable-syslog.patch \
+           file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://allow-for-setting-password-in-clear-text.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://0001-useradd.c-create-parent-directories-when-necessary.patch \
            "
 SRC_URI_append_class-nativesdk = " \
-           file://disable-syslog.patch \
+           file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
 SRC_URI[md5sum] = "2bfafe7d4962682d31b5eba65dba4fc8"
-- 
2.1.0


