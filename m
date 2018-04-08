Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D29E75586
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2018 07:55:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w387t4YG024302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Apr 2018 00:55:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 8 Apr 2018 00:55:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 8 Apr 2018 15:56:07 +0800
Message-ID: <82965017b8a504730b53fcdc82174d0a0b0157ed.1523174112.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1523174112.git.Qi.Chen@windriver.com>
References: <cover.1523174112.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: build without dbus for rpm-native
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
X-List-Received-Date: Sun, 08 Apr 2018 07:55:04 -0000
Content-Type: text/plain

Add option for dbus in configure.ac, and explicitly build without dbus
for rpm-native.

Previously, the rpm recipe tries to prevent rpm-native from attempting
to inhibit shutdown via session dbus by appending '--disable-plugins'
to EXTRA_OECONF in case of native.

However, some layer may need some functionality via plugin support. And
when it enables it, we would meet the following warning at rootfs time.

  Unable to get systemd shutdown inhibition lock: Socket name too long

As plugins/systemd_inhibit.c is the only place that's related to this
dependency, we can be sure that dbus is really not needed for rpm-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-configure.ac-add-option-for-dbus.patch    | 42 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  6 ++--
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch
new file mode 100644
index 0000000..dc71d9b
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch
@@ -0,0 +1,42 @@
+From dfb422c744fdc1838afc40b8e1f161bb46093d92 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 8 Apr 2018 12:06:42 +0800
+Subject: [PATCH] configure.ac: add option for dbus
+
+Add option for dbus so that users could choose to build with dbus
+or with no dbus.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4db15c7909..493f393d31 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -976,12 +976,15 @@ AS_IF([test "$enable_plugins" = yes],[
+ ])
+ AM_CONDITIONAL(ENABLE_PLUGINS,[test "$enable_plugins" = yes])
+ 
+-with_dbus=no
+-AS_IF([test "$enable_plugins" != no],[
++AC_ARG_WITH([dbus], [AS_HELP_STRING([--with-dbus], [build with dbus support])],
++            [],
++            [with_dbus=yes])
++
++AS_IF([test "$with_dbus" != no],[
+   PKG_CHECK_MODULES([DBUS],
+     [dbus-1 >= 1.3],
+-    [AC_DEFINE(DBUS, 1, [Build with dbus support?]) with_dbus=yes],
+-    [with_dbus=no])
++    [AC_DEFINE(DBUS, 1, [Build with dbus support?])],
++    [AC_MSG_ERROR([dbus not present (--without-dbus to disable)])])
+   AC_SUBST(DBUS_CFLAGS)
+   AC_SUBST(DBUS_LIBS)
+ ])
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index 7b8ea46..818d3ef 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-Revert-Set-FD_CLOEXEC-on-opened-files-before-exec-fr.patch \
+           file://0001-configure.ac-add-option-for-dbus.patch \
            "
 
 PE = "1"
@@ -63,8 +64,9 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
 #
 # --localstatedir prevents rpm from writing its database to native sysroot when building images
 #
-# Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
-EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+# Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
+# Also disable plugins by default for native.
+EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.9.1


