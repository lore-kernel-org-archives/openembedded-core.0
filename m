Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.7604.1619170990672652963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 02:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N9h90U012348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 02:43:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 23 Apr 2021 02:43:09 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Fri, 23 Apr 2021 02:43:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gcr: fix one parallel build failure
Date: Fri, 23 Apr 2021 17:43:07 +0800
Message-ID: <20210423094307.14200-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

ui/gcr-live-search.c includes gcr/gcr-marshal.h. Because missing
dependency, following error occurred intermittently during doing parallel
build:

 -o ui/libgcr-ui-3.so.1.0.0.p/gcr-live-search.c.o -c ../gcr-3.38.1/ui/gcr-live-search.c
../gcr-3.38.1/ui/gcr-live-search.c:32:10: fatal error: gcr/gcr-marshal.h: No such file or directory
   32 | #include "gcr/gcr-marshal.h"
      |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...build-fix-one-parallel-build-failure.patch | 37 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.40.0.bb          |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch

diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
new file mode 100644
index 0000000000..81c4bdbbcc
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
@@ -0,0 +1,37 @@
+From cb3708bad88e713e4ccf705cb8c14c5996cd9d06 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 23 Apr 2021 16:32:38 +0800
+Subject: [PATCH] gcr/meson.build: fix one parallel build failure
+
+ui/gcr-live-search.c includes gcr/gcr-marshal.h. Because missing
+dependency, following error occurred intermittently during doing parallel
+build:
+
+ -o ui/libgcr-ui-3.so.1.0.0.p/gcr-live-search.c.o -c ../gcr-3.38.1/ui/gcr-live-search.c
+../gcr-3.38.1/ui/gcr-live-search.c:32:10: fatal error: gcr/gcr-marshal.h: No such file or directory
+   32 | #include "gcr/gcr-marshal.h"
+      |          ^~~~~~~~~~~~~~~~~~~
+compilation terminated.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/68/diffs]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ gcr/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcr/meson.build b/gcr/meson.build
+index 06c3a63..d9d4b8f 100644
+--- a/gcr/meson.build
++++ b/gcr/meson.build
+@@ -181,6 +181,7 @@ gcr_base_dep = declare_dependency(
+   sources: [
+     gcr_enums_gen[1],
+     gcr_oids[1],
++    gcr_marshal_gen[1],
+   ],
+ )
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index 64a1195aab..14072ef589 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -17,6 +17,8 @@ GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 
+SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch"
+
 SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
-- 
2.17.1

