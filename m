Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.18342.1597161748569461439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 09:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07BG2RSo023103
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 09:02:27 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 11 Aug 2020
 09:02:08 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][V2][PATCH 1/1] gcr: make sure gcr-oids.h is generated
Date: Tue, 11 Aug 2020 09:02:08 -0700
Message-ID: <20200811160208.125626-1-joe.slater@windriver.com>
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
index 0000000000..9692ea3642
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
+Upstream-Status:  Backport [https://github.com/GNOME/gcr.git]
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

