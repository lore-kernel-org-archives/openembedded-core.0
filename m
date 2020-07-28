Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8252.1595926408928178289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RDlp2SKJcmGl/AXF26NwXn2Gr6uUgRp8VR7e+Hy0lXI49PT+0q39GLskDOVkGVqhd2IAWvCBPW
 AYKyoG+BMpNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699801"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699801"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:31 -0700
IronPort-SDR: +ceJOqPqTzQnSsjkRppm6YlwitQoP4IM7Zyp4fI25OfzOAOJOBwYDFZ0TpEoxeKYK8D3kyecNa
 HCNmKHqpULcg==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245988"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 31/32] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
Date: Tue, 28 Jul 2020 16:51:32 +0800
Message-Id: <2adcc5ade62fe10715a6c943565f71efe7627229.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ot-hardcode-linux-as-the-host-system.patch | 49 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
new file mode 100644
index 0000000000..9c311f1c90
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
index 5be81a8f31..af8ded76d5 100644
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
2.25.4

