Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.15923.1592942976844887327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 13:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05NK9Fgc024785
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 13:09:26 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 23 Jun 2020
 13:09:05 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] gcr: ensure gcr-oids.h is generated before use
Date: Tue, 23 Jun 2020 13:09:05 -0700
Message-ID: <20200623200905.185825-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Add it to the list of sources needed before library
building in the ui directory.  It is already in
the list for the gcr directory.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-gnome/gcr/gcr/gcr-oids.patch | 28 ++++++++++++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.36.0.bb      |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr/gcr-oids.patch

diff --git a/meta/recipes-gnome/gcr/gcr/gcr-oids.patch b/meta/recipes-gnome/gcr/gcr/gcr-oids.patch
new file mode 100644
index 0000000..7c99951
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/gcr-oids.patch
@@ -0,0 +1,28 @@
+gcr: add two generated files to gcr_ui_sources
+
+gcr-oids.h is needed by several sources in the ui directory but is not in the
+list of sources needed before compile time.  In a highly parallel build environment
+this can cause errors like --
+
+In file included from ../gcr-3.36.0/ui/gcr-certificate-request-renderer.c:20:
+./gcr/gcr-oids.h:5: error: unterminated #ifndef
+    5 | #ifndef GCR_OIDS_
+      | 
+
+We add gcr_oids, which generates the file, to the sources needed.
+
+Upstream-Status:  Pending
+
+Signed-off-by:  Joe Slater <joe.slater@windriver.com>
+
+
+--- a/ui/meson.build
++++ b/ui/meson.build
+@@ -75,6 +75,7 @@ gcr_ui_sources = [
+   gcr_ui_private_sources,
+   gcr_ui_public_sources,
+   gcr_ui_enums_gen,
++  gcr_oids,
+ ]
+ 
+ gcr_ui_deps = [
diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
index d5a88df..4986c5c 100644
--- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
@@ -18,6 +18,8 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " file://0001-meson.build-correctly-set-internal-vapi-dependencies.patch"
+SRC_URI += " file://gcr-oids.patch"
+
 SRC_URI[archive.md5sum] = "adc65563b6b458507b9a578a8b68fb61"
 SRC_URI[archive.sha256sum] = "aaf9bed017a2263c6145c89a1a84178f9f40f238426463e4ae486694ef5f6601"
 
-- 
2.7.4

