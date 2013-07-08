Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3DA6AE6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 02:45:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r682jC7I021099
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 19:45:12 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 19:45:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 10:45:09 +0800
Message-ID: <d60185a76af5ceda9dd7b074b5846464e95586b9.1373251397.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373251397.git.jackie.huang@windriver.com>
References: <cover.1373251397.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0: add -march=i486 into CFLAGS automatically when needed.
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
X-List-Received-Date: Mon, 08 Jul 2013 02:45:11 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

glib configure will check if current gcc need -march=i486,
when gcc need -march=i486 but CFLAGS don't have,
glib configure will abort and advise the user to add -march=i486.
This will break the build process,it's not good for automatic build system.
so change this to adding -march=i486 automatically when it is needed.

Signed-off-by: Song.Li <Song.Li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../add-march-i486-into-CFLAGS-automatically.patch |   39 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb      |    1 +
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch b/meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch
new file mode 100644
index 0000000..3aac35a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch
@@ -0,0 +1,39 @@
+From 55253b55b9c65f3e0efbbe03cbab2a4c4014a16b Mon Sep 17 00:00:00 2001
+From: Song.Li <Song.Li@windriver.com>
+Date: Thu, 5 Jul 2012 15:09:41 +0800
+Subject: [PATCH] add -march=i486 into CFLAGS automatically
+
+Upstream-Status: Inappropriate [configuration]
+
+glib configure will check if current gcc need -march=i486,
+when gcc need -march=i486 but CFLAGS don't have,
+glib configure will abort and advise the user to add -march=i486 or later.
+This will break the build process,it's not good for automatic build system.
+so change this to adding -march=i485 automatically when it is needed.
+---
+ configure.ac |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+Index: glib-2.36.0/configure.ac
+===================================================================
+--- glib-2.36.0.orig/configure.ac
++++ glib-2.36.0/configure.ac
+@@ -2378,7 +2378,7 @@ dnl
+ dnl Note that the atomic ops are only available with GCC on x86 when
+ dnl using -march=i486 or higher.  If we detect that the atomic ops are
+ dnl not available but would be available given the right flags, we want
+-dnl to abort and advise the user to fix their CFLAGS.  It's better to do
++dnl to add -march=i486 automatically to fix their CFLAGS.  It's better to do
+ dnl that then to silently fall back on emulated atomic ops just because
+ dnl the user had the wrong build environment.
+
+@@ -2401,7 +2401,8 @@ AC_CACHE_CHECK([for lock-free atomic int
+         AC_TRY_COMPILE([],
+                        [volatile int atomic = 2;\
+                         __sync_bool_compare_and_swap (&atomic, 2, 3);],
+-                       [AC_MSG_ERROR([GLib must be build with -march=i486 or later.])],
++                       [AC_MSG_WARN([GLib must be build with -march=i486 or later.])
++                       SAVE_CFLAGS="${SAVE_CFLAGS} -march=i486"],
+                        [])
+         CFLAGS="${SAVE_CFLAGS}"
+       fi
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
index 935a493..d9d8932 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://glib-2.0_fix_for_x32.patch \
            file://fix-conflicting-rand.patch \
            file://Makefile-ptest.patch \
+           file://add-march-i486-into-CFLAGS-automatically.patch \
            file://run-ptest \
           "
 
-- 
1.7.4.1


