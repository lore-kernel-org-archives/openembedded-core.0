Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2839.1597097152794591239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 15:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07AM5Uan029504
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2020 15:05:41 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 10 Aug 2020
 15:05:20 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] gcr: make sure gcr-oids.h is generated
Date: Mon, 10 Aug 2020 15:05:20 -0700
Message-ID: <20200810220520.157259-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport, without modification, a patch from mainline after
gcr-3-36 branch created.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...-meson-Make-sure-gcr-oids.h-is-built.patch | 36 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.36.0.bb          |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch b/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
new file mode 100644
index 0000000000..3c8902d05e
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
@@ -0,0 +1,36 @@
+From 9fca6ae0aa7355c27d0922c561b9fbe18dde5b3d Mon Sep 17 00:00:00 2001
+From: Niels De Graef <nielsdegraef@gmail.com>
+Date: Fri, 19 Jun 2020 22:37:31 +0200
+Subject: [PATCH 1/1] meson: Make sure gcr-oids.h is built
+
+Fixes https://gitlab.gnome.org/GNOME/gcr/-/issues/48
+---
+ gcr/meson.build | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+--- end of original header ---
+
+Upstream-Status:  backport [https://github.com/GNOME/gcr.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+diff --git a/gcr/meson.build b/gcr/meson.build
+index 199452f..06c3a63 100644
+--- a/gcr/meson.build
++++ b/gcr/meson.build
+@@ -178,7 +178,10 @@ endif
+ gcr_base_dep = declare_dependency(
+   link_with: gcr_base_lib,
+   include_directories: include_directories('..'),
+-  sources: gcr_enums_gen[1], # Make sure gcr-enum-types-base.h can be included
++  sources: [
++    gcr_enums_gen[1],
++    gcr_oids[1],
++  ],
+ )
+ 
+ if get_option('introspection')
+-- 
+2.7.4
+
diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
index d5a88dfb35..ff455a68ec 100644
--- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
@@ -18,6 +18,8 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " file://0001-meson.build-correctly-set-internal-vapi-dependencies.patch"
+SRC_URI += " file://0001-meson-Make-sure-gcr-oids.h-is-built.patch"
+
 SRC_URI[archive.md5sum] = "adc65563b6b458507b9a578a8b68fb61"
 SRC_URI[archive.sha256sum] = "aaf9bed017a2263c6145c89a1a84178f9f40f238426463e4ae486694ef5f6601"
 
-- 
2.17.1

