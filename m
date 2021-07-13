Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2077.1626168758139188160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 02:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16D9WaFJ015495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 02:32:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 02:32:36 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 13 Jul 2021 02:32:36 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][hardknott][PATCH] gobject-introspection: fix default search path for girdir
Date: Tue, 13 Jul 2021 02:32:36 -0700
Message-ID: <20210713093236.37506-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When running g-ir-scanner, we get the following error:

  Couldn't find include 'GObject-2.0.gir' (search path:
  '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0',
  '/usr/share/gir-1.0', '/usr/share/gir-1.0']')

This is because g-ir-tool-template.in is not setting girdir correctly.
It's using the prefix instead of the actual girdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++++
 .../gobject-introspection_1.66.1.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
new file mode 100644
index 0000000000..c0d263946b
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
@@ -0,0 +1,33 @@
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 13 Jul 2021 02:05:11 -0700
+Subject: [PATCH] g-ir-tool-template.in: fix girdir path
+
+In case gir_dir_prefix is set, it's possible that g-ir-scanner
+cannot find the .gir files. This is because that the girdir
+is set to gir_dir_prefix, which is wrong. It's not a prefix,
+it the actual gir dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tools/g-ir-tool-template.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
+index 6e98f52e..62c07c31 100755
+--- a/tools/g-ir-tool-template.in
++++ b/tools/g-ir-tool-template.in
+@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] = datadir
+ 
+ # Respect gir_dir_prefix
+ girdir = ''
+-girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@'))
++girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@', 'gir-1.0'))
+ builtins.__dict__['GIRDIR'] = [girdir]
+ 
+ # Again, relative paths first so that the installation prefix is relocatable
+-- 
+2.30.2
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index ebac8d3a43..45440cea1d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            file://0001-meson.build-exclude-girepo_dep-if-introspection-data.patch \
+           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
            "
 
 SRC_URI[sha256sum] = "dd44a55ee5f426ea22b6b89624708f9e8d53f5cc94e5485c15c87cb30e06161d"
-- 
2.30.2

