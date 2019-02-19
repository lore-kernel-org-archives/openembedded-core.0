Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31AE27C771
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:58:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d17so7659124wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GrA70DTgU+6kGwmdArZIGDpp6uWJhzQkm+w2bYvJ+Eg=;
	b=Ad+38dAHqgEaq3nuNbqiJyU3qswhalAeFsvZ7CfJ1upuVtpNmhYDVnxJ1oNbWAeg84
	AF7wzleh+7IZIefYC5WUMm2GtttmzH8XMaPnEUH8jkEChYNTw4b63rEEI2GgYIJ3J8wc
	66oJUJaiPoT2OHk1wZVUrkpZM12dIUeE7KdoQE5T1EsTuGQEtnOGxkhKUDfmT94s0jNI
	BQ+l6ktc688OJupkBuMs5iQ8ga53lkeFa7lMiQHsp8yOTVMIGWXSzM+2vMukQn4oFx5u
	PUtUciLjVMEkuf2t1drZhz7jkMv/5rPsoz0zrwXrHfvvjmHOH4RHmdTDYD+yd7VC93BC
	8JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GrA70DTgU+6kGwmdArZIGDpp6uWJhzQkm+w2bYvJ+Eg=;
	b=cYNc7vJlkXm/Z9mleruOevgl7NuTyrvk7eoLliY/hi1DyAEms83iN5CpeN8VJjahC1
	uLjHd0p5AaHio3mC3iuCuO7AUu3KHys62+KyeunKJOeALSu2eMCzJHESU7QvdKp4ysO4
	LJWvHfcN7WbQ5xQwJ2sOQuNmwuAK7cJ/S/SRpnCx55WUPcrTbC7WUdG4Kp138NMLt4qM
	TTcTuHFQp0bi+5OvSjDclB7GuhMci8OpVkXPryZes5H+9kd1BVfllcfb5D+48ydGRMKp
	YwEqIBuB2O3gImJq9KW+H6oVlJJ7uNpyFcFYhhQJ0q5jedy5BD7M4tWa2p2V5kq4Twdd
	yq7A==
X-Gm-Message-State: AHQUAubcdcM9bOS++HzgG/WR7ItDqVthY8IqUxA3s6Ckb7vCbK2mf+tZ
	fe3Lyu5b0zmHjWigJiQFgq2Vq7le
X-Google-Smtp-Source: AHgI3Ib9JUgPRhzSaDmZa9okNPFN+i3KF5De5dnuZbHg7uEuo22TISHJH0DUPWQaoSAKC7TilIlq+w==
X-Received: by 2002:adf:c54d:: with SMTP id s13mr19912766wrf.169.1550584702467;
	Tue, 19 Feb 2019 05:58:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q24sm1959656wmq.16.2019.02.19.05.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:58:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:58:08 +0100
Message-Id: <20190219135815.18177-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Tue, 19 Feb 2019 13:58:22 -0000

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


