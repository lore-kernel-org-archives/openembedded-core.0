Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2503.1590052995275399197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 02:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04L9KsN6013975
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 02:23:03 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 21 May 2020 02:22:45 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libsecret: add meson option introspection
Date: Thu, 21 May 2020 17:22:41 +0800
Message-ID: <20200521092241.28336-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add meson option introspection for libsecret. For bsp which doesn't
support qemu usermode, it could disable gobject introspection build.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-meson-add-option-introspection.patch | 137 ++++++++++++++++++
 .../libsecret/libsecret_0.20.3.bb             |   2 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch

diff --git a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
new file mode 100644
index 0000000000..51ee66f42b
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
@@ -0,0 +1,137 @@
+meson: add option introspection
+
+Add an option 'introspection' for meson which could control whether
+build GIR files or not.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/53]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ libsecret/meson.build | 86 ++++++++++++++++++++++---------------------
+ meson.build           |  1 +
+ meson_options.txt     |  1 +
+ 3 files changed, 46 insertions(+), 42 deletions(-)
+
+diff --git a/libsecret/meson.build b/libsecret/meson.build
+index 759b5ef..2ee8850 100644
+--- a/libsecret/meson.build
++++ b/libsecret/meson.build
+@@ -104,50 +104,52 @@ libsecret_dep = declare_dependency(
+ )
+ 
+ # GObject Introspection
+-libsecret_gir_sources = [
+-  'secret-attributes.c',
+-  'secret-attributes.h',
+-  'secret-backend.c',
+-  'secret-backend.h',
+-  'secret-collection.c',
+-  'secret-collection.h',
+-  'secret-item.c',
+-  'secret-item.h',
+-  'secret-methods.c',
+-  'secret-password.c',
+-  'secret-password.h',
+-  'secret-paths.c',
+-  'secret-paths.h',
+-  'secret-prompt.c',
+-  'secret-prompt.h',
+-  'secret-retrievable.c',
+-  'secret-retrievable.h',
+-  'secret-schema.c',
+-  'secret-schema.h',
+-  'secret-schemas.c',
+-  'secret-schemas.h',
+-  'secret-service.c',
+-  'secret-service.h',
+-  'secret-types.h',
+-  'secret-value.c',
+-  'secret-value.h',
+-]
+-libsecret_gir_sources += version_h
+-libsecret_gir_sources += _enums_generated
+-
+-libsecret_gir = gnome.generate_gir(libsecret,
+-  sources: libsecret_gir_sources,
+-  namespace: 'Secret',
+-  nsversion: api_version_major,
+-  export_packages: 'libsecret-@0@'.format(api_version_major),
+-  includes: [ 'GObject-2.0', 'Gio-2.0' ],
+-  header: 'libsecret/secret.h',
+-  extra_args: [ '-D SECRET_COMPILATION'],
+-  install: true,
+-)
++if with_gir
++  libsecret_gir_sources = [
++    'secret-attributes.c',
++    'secret-attributes.h',
++    'secret-backend.c',
++    'secret-backend.h',
++    'secret-collection.c',
++    'secret-collection.h',
++    'secret-item.c',
++    'secret-item.h',
++    'secret-methods.c',
++    'secret-password.c',
++    'secret-password.h',
++    'secret-paths.c',
++    'secret-paths.h',
++    'secret-prompt.c',
++    'secret-prompt.h',
++    'secret-retrievable.c',
++    'secret-retrievable.h',
++    'secret-schema.c',
++    'secret-schema.h',
++    'secret-schemas.c',
++    'secret-schemas.h',
++    'secret-service.c',
++    'secret-service.h',
++    'secret-types.h',
++    'secret-value.c',
++    'secret-value.h',
++  ]
++  libsecret_gir_sources += version_h
++  libsecret_gir_sources += _enums_generated
++
++  libsecret_gir = gnome.generate_gir(libsecret,
++    sources: libsecret_gir_sources,
++    namespace: 'Secret',
++    nsversion: api_version_major,
++    export_packages: 'libsecret-@0@'.format(api_version_major),
++    includes: [ 'GObject-2.0', 'Gio-2.0' ],
++    header: 'libsecret/secret.h',
++    extra_args: [ '-D SECRET_COMPILATION'],
++    install: true,
++  )
++endif
+ 
+ # Vapi
+-if with_vapi
++if with_vapi and with_gir
+   libsecret_vapi = gnome.generate_vapi('libsecret-@0@'.format(api_version_major),
+     sources: libsecret_gir[0],
+     metadata_dirs: meson.source_root() / 'libsecret',
+diff --git a/meson.build b/meson.build
+index a26d046..d22e008 100644
+--- a/meson.build
++++ b/meson.build
+@@ -22,6 +22,7 @@ with_gcrypt = get_option('gcrypt')
+ enable_debug = get_option('debugging')
+ with_vapi = get_option('vapi')
+ with_gtkdoc = get_option('gtk_doc')
++with_gir = get_option('introspection')
+ 
+ # Some variables
+ config_h_dir = include_directories('.')
+diff --git a/meson_options.txt b/meson_options.txt
+index c1fda5d..445aeb0 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -3,3 +3,4 @@ option('gcrypt', type: 'boolean', value: true, description: 'With gcrypt and tra
+ option('debugging', type: 'boolean', value: false, description: 'Turn debugging on/off')
+ option('vapi', type: 'boolean', value: true, description: 'Create VAPI file.')
+ option('gtk_doc', type: 'boolean', value: true, description: 'Build reference documentation using gtk-doc')
++option('introspection', type: 'boolean', value: true, description: 'Create GIR file.')
+-- 
+2.17.1
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
index 8d317c8efc..9830c80448 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
@@ -13,6 +13,8 @@ inherit gnomebase gtk-doc vala gobject-introspection manpages features_check
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
+SRC_URI += "file://0001-meson-add-option-introspection.patch"
+
 SRC_URI[archive.md5sum] = "47c3fdfeb111a87b509ad271e4a6f496"
 SRC_URI[archive.sha256sum] = "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
 
-- 
2.17.1

