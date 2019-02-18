Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1549A7C85D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 12:41:14 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g11-v6so14258161ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GrA70DTgU+6kGwmdArZIGDpp6uWJhzQkm+w2bYvJ+Eg=;
	b=MhpGPF/kjAz8d86rScJb+r+lxLyUo7hO4ZB4DYWyzxJLeMfKxEt3YA/FGSA+svFf69
	i+xMxoj9qoW5dfhg/PfY3ccB2HMBmT1I9hFPIEidsb5f65SjY2BPaTnSLABaHQ1cN5vn
	UD92HGo38p7qLyluXzMz4GcUkNCioMSusVKjRnbAi2q+jTKck8V0YEl9VZLDcmmLT5m5
	rqsVuIUQXFmCm0BKLYSUJwm1/+L6Py48Jnx76dAiZoJx9kuxRFBTrSWqTkWJH75/00Fh
	gbjrz7L5HDbdAK7D3JyeNuEEmhy4rhlfMj1R4bjh+NGMEyG8S1rnQ/V8pRCvrqziBeS+
	dEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GrA70DTgU+6kGwmdArZIGDpp6uWJhzQkm+w2bYvJ+Eg=;
	b=eeBvo/fvFigqxsD0r0ow12c/S583DTVAyGNiusGG4jTZQRS+qEEf8kwYmKeRUFCQnT
	7Dbfs0mHBFr2yJ2e6IOmEXpdWeE7ce2VtIzAUz8zGY2PiSaDuCb04Wt+aVuLYu67XXhA
	HqQ5zGPteW5EJBGJPhHio4ruhcu14Mu22fJthdwOygyd1wL1XJY0qQL3FwFSafPKHdBl
	x2hcfjbzrTuHcxoxYT334VlB8jE/7eIADrFA2OiNSG7TCzjudoql2WwXUeQcr7W8HPnp
	N9qo49txNitWd5c6od0XGTfluMElYkLT120V3qwKC19HxufWNmSVTB8WdokroPX+kXWg
	cdLw==
X-Gm-Message-State: AHQUAuaHdKP4fQhdnBBXMhjjP3CoQQfDD7HO6jOHpTzwGxBkvqTeb7pv
	6tQY2mpbfuyginCCgw86awmGgPHo
X-Google-Smtp-Source: AHgI3IZQIIuoCUIKIigxufSf2REkW0/RAaDJndBth/8esWGH1b1YDcrTi2wxx8T1lui/xeApnTR1Sg==
X-Received: by 2002:a2e:9b95:: with SMTP id z21mr13681506lji.155.1550493675170;
	Mon, 18 Feb 2019 04:41:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h3sm3733898lfj.25.2019.02.18.04.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 04:41:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 13:41:01 +0100
Message-Id: <20190218124108.7846-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/8] clutter-gtk-1.0: convert to meson
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
X-List-Received-Date: Mon, 18 Feb 2019 12:41:15 -0000

This required adding an option to control gobject introspection
via a custom patch, and tweaking clutter.bbclass to not enforce
autotools.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/clutter.bbclass                  |  3 +-
 .../clutter/clutter-gtk-1.0.inc               | 20 +++++++++-
 ...iable-for-enabling-disabling-introsp.patch | 37 +++++++++++++++++++
 .../clutter/clutter-gtk-1.0_1.8.4.bb          |  1 +
 4 files changed, 58 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-config-variable-for-enabling-disabling-introsp.patch

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
index 5edab0e55d6..24b53a13e40 100644
--- a/meta/classes/clutter.bbclass
+++ b/meta/classes/clutter.bbclass
@@ -14,4 +14,5 @@ REALNAME = "${@get_real_name("${BPN}")}"
 SRC_URI = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
 S = "${WORKDIR}/${REALNAME}-${PV}"
 
-inherit autotools pkgconfig gtk-doc gettext
+CLUTTERBASEBUILDCLASS ??= "autotools"
+inherit ${CLUTTERBASEBUILDCLASS} pkgconfig gtk-doc gettext
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 05c4e5f5caa..4e82f566057 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -2,7 +2,9 @@ SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-inherit clutter distro_features_check upstream-version-is-even gobject-introspection
+CLUTTERBASEBUILDCLASS = "meson"
+inherit clutter distro_features_check upstream-version-is-even gobject-introspection gtk-doc
+
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 # depends on gtk+3
@@ -10,6 +12,20 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 DEPENDS = "clutter-1.0 gtk+3"
 PACKAGES  =+ "${PN}-examples"
-AUTOTOOLS_AUXDIR = "${S}/build"
+
+GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
+GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
+
+GI_ENABLE_FLAG = "-Denable_gi=true"
+GI_DISABLE_FLAG = "-Denable_gi=false"
+
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+
 
 
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-config-variable-for-enabling-disabling-introsp.patch b/meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-config-variable-for-enabling-disabling-introsp.patch
new file mode 100644
index 00000000000..e21c6fd9036
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-config-variable-for-enabling-disabling-introsp.patch
@@ -0,0 +1,37 @@
+From 7233883c6bd4e80c0e91b29b5c76fe798023e9fe Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 11 Feb 2019 16:41:13 +0100
+Subject: [PATCH] Add a config variable for enabling/disabling introspection
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ clutter-gtk/meson.build | 2 +-
+ meson_options.txt       | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/clutter-gtk/meson.build b/clutter-gtk/meson.build
+index 5d6847d..5d934b6 100644
+--- a/clutter-gtk/meson.build
++++ b/clutter-gtk/meson.build
+@@ -49,7 +49,7 @@ clutter_gtk_dep = declare_dependency(link_with: clutter_gtk,
+                                      dependencies: [ mathlib_dep, clutter_dep, gtk_dep ],
+                                      include_directories: include_directories('.'))
+ 
+-if not meson.is_cross_build()
++if get_option('enable_gi')
+   gnome.generate_gir(clutter_gtk,
+                      sources: clutter_gtk_headers + clutter_gtk_sources,
+                      namespace: 'GtkClutter',
+diff --git a/meson_options.txt b/meson_options.txt
+index aaf59f1..b7e51c3 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,3 +2,7 @@ option('enable_docs',
+        type: 'boolean',
+        value: false,
+        description: 'Enable generating the API reference (depends on GTK-Doc)')
++option('enable_gi',
++       type: 'boolean',
++       value: false,
++       description: 'Enable gobject introspection')
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
index f0300c7164c..53948c89442 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
@@ -2,5 +2,6 @@ require clutter-gtk-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
+SRC_URI += " file://0001-Add-a-config-variable-for-enabling-disabling-introsp.patch"
 SRC_URI[archive.md5sum] = "b363ac9878e2337be887b8ee9e1da00e"
 SRC_URI[archive.sha256sum] = "521493ec038973c77edcb8bc5eac23eed41645117894aaee7300b2487cb42b06"
-- 
2.17.1


