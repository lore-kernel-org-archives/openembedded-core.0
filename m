Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.34856.1595241016378652717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 03:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1jxT3m-0002Xc-Ml; Mon, 20 Jul 2020 12:30:14 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1jxT3m-0006Os-6h; Mon, 20 Jul 2020 12:30:14 +0200
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com,
	anuj.mittal@intel.com
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [zeus][PATCH] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
Date: Mon, 20 Jul 2020 12:30:11 +0200
Message-Id: <20200720103011.24554-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

Since 010202076760 ("meson.bbclass: avoid unexpected operating-system
names"), meson is no longer used with a cross file that appends the used
libc to the operating system name, e.g. linux-gnueabi.

Prior to that commit, the host_system == 'linux' checks in glib's meson
failed, which led to glib being compiled without libmount, mkostemp and
selinux even if explicitly requested.

As the aforementioned commit affects all recipes built by glib, it might
not be a candidate for backporting to current stable branches. To fix
just the glib issue, instances of host_system == 'linux' are patched
locally.

The patch is marked as Upstream-Status: Inappropriate as it is rendered
unnecessary for OE releases newer than Dunfell.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 ...ot-hardcode-linux-as-the-host-system.patch | 49 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
new file mode 100644
index 000000000000..9c311f1c900b
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
@@ -0,0 +1,49 @@
+From d5e82cd0b6076f33b86e0285ef1c0dba8a14112e Mon Sep 17 00:00:00 2001
+From: Ahmad Fatoum <a.fatoum@pengutronix.de>
+Date: Thu, 9 Jul 2020 13:00:16 +0200
+Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
+
+OE build system can set this to other values that include 'linux',
+e.g. 'linux-gnueabi'. This led to glib always being built without
+libmount, mkostemp and selinux support.
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
+---
+ meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index dd95c750b5ea..8bcacaf3c7e1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -604,7 +604,7 @@ else
+ endif
+ message('Checking whether to use statfs or statvfs .. ' + stat_func_to_use)
+ 
+-if host_system == 'linux'
++if host_system.contains('linux')
+   if cc.has_function('mkostemp',
+                      prefix: '''#define _GNU_SOURCE
+                                 #include <stdlib.h>''')
+@@ -1810,7 +1810,7 @@ glib_conf.set_quoted('GLIB_LOCALE_DIR', join_paths(glib_datadir, 'locale'))
+ # libmount is only used by gio, but we need to fetch the libs to generate the
+ # pkg-config file below
+ libmount_dep = []
+-if host_system == 'linux' and get_option('libmount')
++if host_system.contains('linux') and get_option('libmount')
+   libmount_dep = [dependency('mount', version : '>=2.23', required : true)]
+   glib_conf.set('HAVE_LIBMOUNT', 1)
+ endif
+@@ -1820,7 +1820,7 @@ if host_system == 'windows'
+ endif
+ 
+ selinux_dep = []
+-if host_system == 'linux'
++if host_system.contains('linux')
+   selinux_dep = dependency('libselinux', required: get_option('selinux'))
+ 
+   glib_conf.set('HAVE_SELINUX', selinux_dep.found())
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
index 5be81a8f31a1..af8ded76d552 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
            file://CVE-2020-6750.patch \
+           file://0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.27.0

