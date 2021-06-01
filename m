Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.86.1622564515230200875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 09:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C318E101E
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 386623F719
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] Remove Clutter and Cogl
Date: Tue,  1 Jun 2021 17:21:44 +0100
Message-Id: <20210601162144.2379642-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601162144.2379642-1-ross.burton@arm.com>
References: <20210601162144.2379642-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Clutter and Cogl are not used by anything in oe-core, and in Gnome are
legacy components so are only used by a few applications.  The recipes
have already been moved to meta-gnome so they can now be removed from
oe-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/clutter.bbclass                  |  18 ---
 meta/conf/distro/include/distro_alias.inc     |  11 --
 meta/conf/distro/include/maintainers.inc      |   5 -
 .../distro/include/ptest-packagelists.inc     |   2 -
 meta/recipes-graphics/clutter/clutter-1.0.inc |  49 ------
 ...ypes-as-it-is-build-configuration-sp.patch | 143 ------------------
 .../clutter-1.0/install-examples.patch        |  19 ---
 .../run-installed-tests-with-tap-output.patch |  30 ----
 .../clutter/clutter-1.0/run-ptest             |   3 -
 .../clutter/clutter-1.0_1.26.4.bb             |  10 --
 .../clutter/clutter-gst-3.0.inc               |  23 ---
 ...binary-needed-for-core-image-clutter.patch |  33 ----
 .../clutter/clutter-gst-3.0_3.0.27.bb         |   7 -
 .../clutter/clutter-gtk-1.0.inc               |  23 ---
 ...iable-for-enabling-disabling-introsp.patch |  37 -----
 .../clutter/clutter-gtk-1.0_1.8.4.bb          |   7 -
 meta/recipes-graphics/cogl/cogl-1.0.inc       |  84 ----------
 ...figure.ac-don-t-require-eglmesaext.h.patch |  92 -----------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb |   6 -
 .../images/core-image-clutter.bb              |  15 --
 .../packagegroup-core-clutter.bb              |  22 ---
 21 files changed, 639 deletions(-)
 delete mode 100644 meta/classes/clutter.bbclass
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/0001-Remove=
-clutter.types-as-it-is-build-configuration-sp.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/install-exa=
mples.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/run-install=
ed-tests-with-tap-output.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/run-ptest
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/0001-In=
stall-example-binary-needed-for-core-image-clutter.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.=
bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Ad=
d-a-config-variable-for-enabling-disabling-introsp.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.b=
b
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0.inc
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac=
-don-t-require-eglmesaext.h.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
 delete mode 100644 meta/recipes-graphics/images/core-image-clutter.bb
 delete mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core=
-clutter.bb

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
deleted file mode 100644
index 24b53a13e4..0000000000
--- a/meta/classes/clutter.bbclass
+++ /dev/null
@@ -1,18 +0,0 @@
-def get_minor_dir(v):
-    import re
-    m =3D re.match(r"^([0-9]+)\.([0-9]+)", v)
-    return "%s.%s" % (m.group(1), m.group(2))
-
-def get_real_name(n):
-    import re
-    m =3D re.match(r"^([a-z]+(-[a-z]+)?)(-[0-9]+\.[0-9]+)?", n)
-    return "%s" % (m.group(1))
-
-VERMINOR =3D "${@get_minor_dir("${PV}")}"
-REALNAME =3D "${@get_real_name("${BPN}")}"
-
-SRC_URI =3D "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.t=
ar.xz;name=3Darchive"
-S =3D "${WORKDIR}/${REALNAME}-${PV}"
-
-CLUTTERBASEBUILDCLASS ??=3D "autotools"
-inherit ${CLUTTERBASEBUILDCLASS} pkgconfig gtk-doc gettext
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro=
/include/distro_alias.inc
index b4dfcfc5f5..001d269346 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -26,21 +26,11 @@ DISTRO_PN_ALIAS_pn-builder =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-buildtools-tarball =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-cdrtools =3D "OpenSUSE=3Dcdrtools OSPDT"
 DISTRO_PN_ALIAS_pn-chkconfig-alternatives =3D "Mandriva=3Dchkconfig Debi=
an=3Dchkconfig"
-DISTRO_PN_ALIAS_pn-clutter =3D "Fedora=3Dclutter OpenSuse=3Dclutter Ubun=
tu=3Dclutter-1.0 Mandriva=3Dclutter Debian=3Dclutter"
-DISTRO_PN_ALIAS_pn-clutter-1.8 =3D "Fedora=3Dclutter OpenSuse=3Dclutter =
Ubuntu=3Dclutter-1.0 Mandriva=3Dclutter Debian=3Dclutter"
-DISTRO_PN_ALIAS_pn-clutter-gst-1.0 =3D "Debian=3Dclutter-gst Ubuntu=3Dcl=
utter-gst Fedora=3Dclutter-gst"
-DISTRO_PN_ALIAS_pn-clutter-gst-1.8 =3D "Fedora=3Dclutter-gst Debian=3Dli=
bclutter-gst"
-DISTRO_PN_ALIAS_pn-clutter-gst-3.0 =3D "Ubuntu=3Dlibclutter-gst Debian=3D=
libclutter-gst"
-DISTRO_PN_ALIAS_pn-clutter-gtk-1.0 =3D "Debian=3Dclutter-gtk Ubuntu=3Dcl=
utter-gtk Fedora=3Dclutter-gtk"
-DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 =3D "Fedora=3Dclutter-gtk OpenSuSE=3D=
clutter-gtk Ubuntu=3Dclutter-gtk-0.10 Mandriva=3Dclutter-gtk Debian=3Dclu=
tter-gtk"
-DISTRO_PN_ALIAS_pn-cogl-1.0 =3D "Debian=3Dcogl Ubuntu=3Dcogl Fedora=3Dco=
gl"
-DISTRO_PN_ALIAS_pn-cogl =3D "Fedora=3Dcogl OpenSuse=3Dcogl Ubuntu=3Dcogl=
 Mandriva=3Dcogl Debian=3Dcogl"
 DISTRO_PN_ALIAS_pn-connman =3D "Meego=3Dconnman"
 DISTRO_PN_ALIAS_pn-connman-conf =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-connman-gnome =3D "Intel"
 DISTRO_PN_ALIAS_pn-console-tools =3D "Debian=3Dconsole-tools Ubuntu=3Dco=
nsole-tools"
 DISTRO_PN_ALIAS_pn-core-image-base =3D "OE-Core"
-DISTRO_PN_ALIAS_pn-core-image-clutter =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-full-cmdline =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-kernel-dev =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-minimal =3D "OE-Core"
@@ -248,7 +238,6 @@ DISTRO_PN_ALIAS_pn-packagegroup-base =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-boot =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-buildessential =3D "OE-Core"
-DISTRO_PN_ALIAS_pn-packagegroup-core-clutter =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-device-devel =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-eclipse-debug =3D "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-full-cmdline =3D "OE-Core"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index fa7eb9da0a..d5fa5a3667 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -93,12 +93,8 @@ RECIPE_MAINTAINER_pn-cantarell-fonts =3D "Alexander Ka=
navin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER_pn-ccache =3D "Robert Yang <liezhi.yang@windriver.com>=
"
 RECIPE_MAINTAINER_pn-cdrtools-native =3D "Yi Zhao <yi.zhao@windriver.com=
>"
 RECIPE_MAINTAINER_pn-chrpath =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-clutter-1.0 =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-clutter-gst-3.0 =3D "Ross Burton <ross.burton@arm.c=
om>"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.0 =3D "Ross Burton <ross.burton@arm.c=
om>"
 RECIPE_MAINTAINER_pn-cmake =3D "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER_pn-cmake-native =3D "Pascal Bach <pascal.bach@siemens.=
com>"
-RECIPE_MAINTAINER_pn-cogl-1.0 =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-connman =3D "Changhyeok Bae <changhyeok.bae@gmail.c=
om>"
 RECIPE_MAINTAINER_pn-connman-conf =3D "Ross Burton <ross.burton@arm.com>=
"
 RECIPE_MAINTAINER_pn-connman-gnome =3D "Ross Burton <ross.burton@arm.com=
>"
@@ -117,7 +113,6 @@ RECIPE_MAINTAINER_pn-core-image-sato =3D "Richard Pur=
die <richard.purdie@linuxfoun
 RECIPE_MAINTAINER_pn-core-image-sato-sdk =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-testmaster-initramfs =3D "Richard Purdie=
 <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-testmaster =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-core-image-clutter =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-weston =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-weston-sdk =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-x11 =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index aef70343f6..d489ad8200 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -88,7 +88,6 @@ PTESTS_SLOW_remove_riscv64 =3D "valgrind-ptest"
 PTESTS_PROBLEMS_append_riscv64 =3D "valgrind-ptest"
=20
 #    ruby-ptest \ # Timeout
-#    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
 #    lz4-ptest \ # Needs a rewrite
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #    bash-ptest \ # Test outcomes are non-deterministic by design
@@ -102,7 +101,6 @@ PTESTS_PROBLEMS_append_riscv64 =3D "valgrind-ptest"
=20
 PTESTS_PROBLEMS =3D "\
     ruby-ptest \
-    clutter-1.0-ptest \
     lz4-ptest \
     rt-tests-ptest \
     bash-ptest \
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes=
-graphics/clutter/clutter-1.0.inc
deleted file mode 100644
index 80472178be..0000000000
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY =3D "Graphics library for creating hardware-accelerated user int=
erfaces"
-DESCRIPTION =3D "Clutter is an Open GL based interactive canvas library,=
 \
-designed for creating fast, mainly 2D single window applications such as=
 media \
-box UIs, presentations, kiosk style applications and so on."
-HOMEPAGE =3D "http://www.clutter-project.org/"
-LICENSE =3D "LGPLv2.1+"
-
-inherit clutter ptest-gnome features_check upstream-version-is-even gobj=
ect-introspection
-# depends on cogl-1.0 which needs opengl
-REQUIRED_DISTRO_FEATURES ?=3D "opengl"
-
-DEPENDS =3D "pango glib-2.0 json-glib atk udev cogl-1.0"
-PACKAGE_BEFORE_PN +=3D "${PN}-examples"
-AUTOTOOLS_AUXDIR =3D "${S}/build-aux"
-
-EDEPENDS_X11 =3D "virtual/libx11 libxi libxfixes"
-EDEPENDS_GLX =3D "virtual/libgl"
-EDEPENDS_EGL =3D "virtual/egl"
-EDEPENDS_WAYLAND =3D "wayland libxkbcommon gdk-pixbuf"
-
-EDEPENDS_EVDEV =3D "libxkbcommon"
-ERDEPENDS_EVDEV =3D "xkeyboard-config"
-
-# Disable pretty much everything, override in platform specific set up
-EXTRA_OECONF +=3D "--disable-quartz-backend	\
-	     	 --disable-win32-backend	\
-	     	 --disable-cex100-backend	\
-	     	 --disable-tslib-input		\
-	    	"
-
-PACKAGECONFIG[gdk] =3D "--enable-gdk-backend,--disable-gdk-backend,gtk+3=
"
-PACKAGECONFIG[x11] =3D "--enable-x11-backend,--disable-x11-backend,${EDE=
PENDS_X11}"
-PACKAGECONFIG[glx] =3D ",,${EDEPENDS_X11} ${EDEPENDS_GLX}"
-PACKAGECONFIG[egl] =3D "--enable-egl-backend,--disable-egl-backend,${EDE=
PENDS_EGL}"
-PACKAGECONFIG[evdev] =3D "--enable-evdev-input,--disable-evdev-input,${E=
DEPENDS_EVDEV},${ERDEPENDS_EVDEV}"
-PACKAGECONFIG[wayland] =3D "--enable-wayland-backend,--disable-wayland-b=
ackend,${EDEPENDS_WAYLAND}"
-PACKAGECONFIG[wayland-compositor] =3D "--enable-wayland-compositor,--dis=
able-wayland-compositor,wayland"
-
-# Default configuration, distros might want to override
-PACKAGECONFIG ??=3D "egl gdk \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} =
\
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x=
11', '', d)}"
-
-FILES_${PN}-examples =3D "${libdir}/clutter/examples"
-
-do_configure_prepend() {
-	# see https://bugzilla.gnome.org/show_bug.cgi?id=3D661128 for this
-	touch -t 200001010000 ${S}/po/clutter-1.0.pot
-}
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutte=
r.types-as-it-is-build-configuration-sp.patch b/meta/recipes-graphics/clu=
tter/clutter-1.0/0001-Remove-clutter.types-as-it-is-build-configuration-s=
p.patch
deleted file mode 100644
index 7b3c1980b6..0000000000
--- a/meta/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutter.types=
-as-it-is-build-configuration-sp.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 3a0404dfbc65c6a864e01d1200a48074e19d5def Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 2 Sep 2016 14:28:38 +0300
-Subject: [PATCH] Remove clutter.types as it is build configuration-speci=
fic.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- doc/reference/clutter.types | 122 -------------------------------------=
-------
- 1 file changed, 122 deletions(-)
- delete mode 100644 doc/reference/clutter.types
-
-diff --git a/doc/reference/clutter.types b/doc/reference/clutter.types
-deleted file mode 100644
-index 0037acc..0000000
---- a/doc/reference/clutter.types
-+++ /dev/null
-@@ -1,122 +0,0 @@
--cally_actor_get_type
--cally_clone_get_type
--cally_group_get_type
--cally_rectangle_get_type
--cally_root_get_type
--cally_stage_get_type
--cally_text_get_type
--cally_texture_get_type
--cally_util_get_type
--clutter_action_get_type
--clutter_actor_box_get_type
--clutter_actor_get_type
--clutter_actor_meta_get_type
--clutter_align_constraint_get_type
--clutter_alpha_get_type
--clutter_animatable_get_type
--clutter_animation_get_type
--clutter_animator_get_type
--clutter_animator_key_get_type
--clutter_backend_get_type
--clutter_behaviour_depth_get_type
--clutter_behaviour_ellipse_get_type
--clutter_behaviour_get_type
--clutter_behaviour_opacity_get_type
--clutter_behaviour_path_get_type
--clutter_behaviour_rotate_get_type
--clutter_behaviour_scale_get_type
--clutter_bin_layout_get_type
--clutter_bind_constraint_get_type
--clutter_binding_pool_get_type
--clutter_blur_effect_get_type
--clutter_box_get_type
--clutter_box_layout_get_type
--clutter_brightness_contrast_effect_get_type
--clutter_cairo_texture_get_type
--clutter_canvas_get_type
--clutter_child_meta_get_type
--clutter_click_action_get_type
--clutter_clip_node_get_type
--clutter_clone_get_type
--clutter_color_get_type
--clutter_color_node_get_type
--clutter_colorize_effect_get_type
--clutter_constraint_get_type
--clutter_container_get_type
--clutter_content_get_type
--clutter_deform_effect_get_type
--clutter_desaturate_effect_get_type
--clutter_device_manager_get_type
--clutter_drag_action_get_type
--clutter_drop_action_get_type
--clutter_effect_get_type
--clutter_event_get_type
--clutter_event_sequence_get_type
--clutter_fixed_layout_get_type
--clutter_flow_layout_get_type
--clutter_fog_get_type
--clutter_geometry_get_type
--clutter_gesture_action_get_type
--clutter_glx_texture_pixmap_get_type
--clutter_grid_layout_get_type
--clutter_group_get_type
--clutter_image_get_type
--clutter_input_device_get_type
--clutter_interval_get_type
--clutter_keyframe_transition_get_type
--clutter_knot_get_type
--clutter_layout_manager_get_type
--clutter_layout_meta_get_type
--clutter_list_model_get_type
--clutter_margin_get_type
--clutter_media_get_type
--clutter_model_get_type
--clutter_model_iter_get_type
--clutter_offscreen_effect_get_type
--clutter_page_turn_effect_get_type
--clutter_paint_node_get_type
--clutter_paint_volume_get_type
--clutter_pan_action_get_type
--clutter_param_color_get_type
--clutter_param_fixed_get_type
--clutter_param_units_get_type
--clutter_path_constraint_get_type
--clutter_path_get_type
--clutter_path_node_get_type
--clutter_perspective_get_type
--clutter_pipeline_node_get_type
--clutter_point_get_type
--clutter_property_transition_get_type
--clutter_rect_get_type
--clutter_rectangle_get_type
--clutter_rotate_action_get_type
--clutter_score_get_type
--clutter_script_get_type
--clutter_scriptable_get_type
--clutter_scroll_actor_get_type
--clutter_settings_get_type
--clutter_shader_effect_get_type
--clutter_shader_float_get_type
--clutter_shader_get_type
--clutter_shader_int_get_type
--clutter_shader_matrix_get_type
--clutter_size_get_type
--clutter_snap_constraint_get_type
--clutter_stage_get_type
--clutter_stage_manager_get_type
--clutter_state_get_type
--clutter_state_key_get_type
--clutter_swipe_action_get_type
--clutter_table_layout_get_type
--clutter_tap_action_get_type
--clutter_text_buffer_get_type
--clutter_text_get_type
--clutter_text_node_get_type
--clutter_texture_get_type
--clutter_texture_node_get_type
--clutter_timeline_get_type
--clutter_transition_get_type
--clutter_transition_group_get_type
--clutter_units_get_type
--clutter_vertex_get_type
--clutter_zoom_action_get_type
---=20
-2.9.3
-
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.p=
atch b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
deleted file mode 100644
index ce9ab3a248..0000000000
--- a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Install the examples to $libdir/clutter/.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Inappropriate
-
-Index: clutter-1.26.2/examples/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- clutter-1.26.2.orig/examples/Makefile.am
-+++ clutter-1.26.2/examples/Makefile.am
-@@ -33,7 +33,8 @@ AM_CPPFLAGS =3D \
- 	-I$(top_srcdir)/clutter \
- 	-I$(top_builddir)/clutter
-=20
--noinst_PROGRAMS =3D $(all_examples)
-+exampledir =3D $(pkglibdir)/examples
-+example_PROGRAMS =3D $(all_examples)
-=20
- EXTRA_DIST =3D redhand.png
-=20
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-test=
s-with-tap-output.patch b/meta/recipes-graphics/clutter/clutter-1.0/run-i=
nstalled-tests-with-tap-output.patch
deleted file mode 100644
index fef82eaf92..0000000000
--- a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-=
tap-output.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d6ceb5a44b28e0e50ede22b84984d8516897de4b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 27 Apr 2015 20:12:33 +0300
-Subject: [PATCH] Run installed tests with tap output
-
-Configure output from installed-tests to be TAP compliant such that
-gnome-desktop-testing-runner properly interprets the results.
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <TicoTimo@gmail.com>
-
----
- build-aux/autotools/glib-tap.mk | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/build-aux/autotools/glib-tap.mk b/build-aux/autotools/glib-=
tap.mk
-index a4f0dad..51cfa31 100644
---- a/build-aux/autotools/glib-tap.mk
-+++ b/build-aux/autotools/glib-tap.mk
-@@ -127,7 +127,8 @@ installed_test_meta_DATA =3D $(installed_testcases:=3D=
.test)
- %.test: %$(EXEEXT) Makefile
- 	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
- 	echo 'Type=3Dsession' >> $@.tmp; \
--	echo 'Exec=3Denv G_ENABLE_DIAGNOSTIC=3D0 CLUTTER_ENABLE_DIAGNOSTIC=3D0=
 $(installed_testdir)/$<' >> $@.tmp; \
-+	echo 'Exec=3Denv G_ENABLE_DIAGNOSTIC=3D0 CLUTTER_ENABLE_DIAGNOSTIC=3D0=
 $(installed_testdir)/$< --tap' >> $@.tmp; \
-+	echo 'Output=3DTAP' >> $@.tmp; \
- 	mv $@.tmp $@)
-=20
- CLEANFILES +=3D $(installed_test_meta_DATA)
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-ptest b/meta/r=
ecipes-graphics/clutter/clutter-1.0/run-ptest
deleted file mode 100644
index 98877e5226..0000000000
--- a/meta/recipes-graphics/clutter/clutter-1.0/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#! /bin/sh
-
-gnome-desktop-testing-runner clutter
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.26.4.bb b/meta/r=
ecipes-graphics/clutter/clutter-1.0_1.26.4.bb
deleted file mode 100644
index ee549fbdd5..0000000000
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter-1.0.inc
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
-
-SRC_URI[archive.md5sum] =3D "624dd776a5159de0267587b1df6b97b2"
-SRC_URI[archive.sha256sum] =3D "8b48fac159843f556d0a6be3dbfc6b083fc6d9c5=
8a20a49a6b4919ab4263c4e6"
-SRC_URI +=3D "file://install-examples.patch \
-            file://run-installed-tests-with-tap-output.patch \
-            file://0001-Remove-clutter.types-as-it-is-build-configuratio=
n-sp.patch \
-            file://run-ptest"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/rec=
ipes-graphics/clutter/clutter-gst-3.0.inc
deleted file mode 100644
index 73315c97ec..0000000000
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "GStreamer integration library for Clutter"
-DESCRIPTION =3D "Clutter-Gst is an integration library for using GStream=
er with Clutter. \
-It provides a GStreamer sink to upload frames to GL and an actor that \
-implements the ClutterGstPlayer interface using playbin."
-HOMEPAGE =3D "http://www.clutter-project.org/"
-BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/clutter-gst/-/issues"
-LICENSE =3D "LGPLv2+"
-
-inherit clutter features_check upstream-version-is-even gobject-introspe=
ction
-# depends on clutter-1.0 which depends on cogl-1.0
-REQUIRED_DISTRO_FEATURES ?=3D "opengl"
-
-export GST_PLUGIN_SCANNER_1_0=3D"${S}/gst-plugin-scanner-dummy"
-
-SRC_URI +=3D "file://0001-Install-example-binary-needed-for-core-image-c=
lutter.patch"
-
-DEPENDS =3D "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-=
1.0 libgudev"
-RDEPENDS_${PN} +=3D "gstreamer1.0-meta-base"
-PACKAGES  =3D+ "${PN}-examples"
-
-FILES_${PN}          +=3D "${libdir}/gstreamer-1.0/lib*.so"
-FILES_${PN}-dev      +=3D "${libdir}/gstreamer-1.0/*.la"
-FILES_${PN}-examples  =3D "${bindir}/video-player ${bindir}/video-sink"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0/0001-Install-e=
xample-binary-needed-for-core-image-clutter.patch b/meta/recipes-graphics=
/clutter/clutter-gst-3.0/0001-Install-example-binary-needed-for-core-imag=
e-clutter.patch
deleted file mode 100644
index 0b26b990d7..0000000000
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0/0001-Install-example-=
binary-needed-for-core-image-clutter.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d77c711277bf075ce0545c19b322f040c49c778a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 30 Apr 2015 12:19:13 +0300
-Subject: [PATCH] Install example binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Imported from clutter-gst-1.8 package, git://git.openembedded.org/openem=
bedded,
-commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated for clutter-gst=
 3.0
-
-Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- examples/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index bfbc1b5..09655e3 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -1,6 +1,6 @@
- NULL =3D #
-=20
--noinst_PROGRAMS =3D camera-player video-player video-sink video-sink-na=
vigation video-content
-+bin_PROGRAMS =3D camera-player video-player video-sink video-sink-navig=
ation video-content
-=20
- AM_CPPFLAGS =3D -I$(top_srcdir) \
- 		$(MAINTAINER_CFLAGS) \
---=20
-2.1.4
-
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb b/me=
ta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
deleted file mode 100644
index 35382453c2..0000000000
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require clutter-gst-3.0.inc
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
-                    file://clutter-gst/clutter-gst.h;beginline=3D1;endli=
ne=3D24;md5=3D95baacba194e814c110ea3bdf25ddbf4"
-
-SRC_URI[archive.md5sum] =3D "2bf9d7ca146c9d71e86c45cd00e9a28e"
-SRC_URI[archive.sha256sum] =3D "fe69bd6c659d24ab30da3f091eb91cd1970026d4=
31179b0724f13791e8ad9f9d"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/rec=
ipes-graphics/clutter/clutter-gtk-1.0.inc
deleted file mode 100644
index 9a28b5219b..0000000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "Library for embedding a Clutter canvas in a GTK+ applicatio=
n"
-DESCRIPTION =3D "Clutter-GTK is a library providing facilities to integr=
ate Clutter into GTK+ \
-applications and vice versa. It provides a GTK+ widget, GtkClutterEmbed,=
 for embedding the \
-a Clutter stage into any GtkContainer; and GtkClutterActor, a Clutter \
-actor for embedding any GtkWidget inside a Clutter stage."
-HOMEPAGE =3D "http://www.clutter-project.org/"
-BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/clutter/-/issues"
-LICENSE =3D "LGPLv2+"
-
-CLUTTERBASEBUILDCLASS =3D "meson"
-inherit clutter features_check upstream-version-is-even gobject-introspe=
ction gtk-doc
-
-# depends on clutter-1.0 which depends on cogl-1.0
-REQUIRED_DISTRO_FEATURES ?=3D "opengl"
-# depends on gtk+3
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-DEPENDS =3D "clutter-1.0 gtk+3"
-PACKAGES  =3D+ "${PN}-examples"
-
-GTKDOC_MESON_OPTION =3D "enable_docs"
-
-GIR_MESON_OPTION =3D 'enable_gi'
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-con=
fig-variable-for-enabling-disabling-introsp.patch b/meta/recipes-graphics=
/clutter/clutter-gtk-1.0/0001-Add-a-config-variable-for-enabling-disablin=
g-introsp.patch
deleted file mode 100644
index e21c6fd903..0000000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-config-var=
iable-for-enabling-disabling-introsp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7233883c6bd4e80c0e91b29b5c76fe798023e9fe Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 11 Feb 2019 16:41:13 +0100
-Subject: [PATCH] Add a config variable for enabling/disabling introspect=
ion
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- clutter-gtk/meson.build | 2 +-
- meson_options.txt       | 4 ++++
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/clutter-gtk/meson.build b/clutter-gtk/meson.build
-index 5d6847d..5d934b6 100644
---- a/clutter-gtk/meson.build
-+++ b/clutter-gtk/meson.build
-@@ -49,7 +49,7 @@ clutter_gtk_dep =3D declare_dependency(link_with: clut=
ter_gtk,
-                                      dependencies: [ mathlib_dep, clutt=
er_dep, gtk_dep ],
-                                      include_directories: include_direc=
tories('.'))
-=20
--if not meson.is_cross_build()
-+if get_option('enable_gi')
-   gnome.generate_gir(clutter_gtk,
-                      sources: clutter_gtk_headers + clutter_gtk_sources=
,
-                      namespace: 'GtkClutter',
-diff --git a/meson_options.txt b/meson_options.txt
-index aaf59f1..b7e51c3 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,3 +2,7 @@ option('enable_docs',
-        type: 'boolean',
-        value: false,
-        description: 'Enable generating the API reference (depends on GT=
K-Doc)')
-+option('enable_gi',
-+       type: 'boolean',
-+       value: false,
-+       description: 'Enable gobject introspection')
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb b/met=
a/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
deleted file mode 100644
index 53948c8944..0000000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34"
-
-SRC_URI +=3D " file://0001-Add-a-config-variable-for-enabling-disabling-=
introsp.patch"
-SRC_URI[archive.md5sum] =3D "b363ac9878e2337be887b8ee9e1da00e"
-SRC_URI[archive.sha256sum] =3D "521493ec038973c77edcb8bc5eac23eed4164511=
7894aaee7300b2487cb42b06"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graph=
ics/cogl/cogl-1.0.inc
deleted file mode 100644
index d581ad1c04..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ /dev/null
@@ -1,84 +0,0 @@
-SUMMARY =3D "Modern 3D graphics API with associated utility APIs"
-DESCRIPTION =3D "Cogl is a small open source library for using 3D graphi=
cs \
-hardware for rendering. The API departs from the flat state machine styl=
e of \
-OpenGL and is designed to make it easy to write orthogonal components th=
at \
-can render without stepping on each others toes."
-HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/cogl"
-LICENSE =3D "MIT"
-
-inherit clutter features_check upstream-version-is-even gobject-introspe=
ction
-# cogl-1.0 needs opengl to build
-REQUIRED_DISTRO_FEATURES ?=3D "opengl"
-
-DEPENDS =3D "glib-2.0 gdk-pixbuf"
-PACKAGES =3D+ "${PN}-examples \
-             libcogl libcogl-gles2 libcogl-pango libcogl-path \
-            "
-AUTOTOOLS_AUXDIR =3D "${S}/build"
-
-# Extra DEPENDS for PACKAGECONFIG
-EDEPENDS_GL =3D "virtual/libgl libdrm"
-EDEPENDS_GLES2 =3D "virtual/libgles2"
-EDEPENDS_KMS =3D "libdrm virtual/egl"
-EDEPENDS_EGL =3D "virtual/egl"
-EDEPENDS_X11 =3D "virtual/libx11 libxcomposite libxdamage libxfixes libx=
randr"
-EDEPENDS_WAYLAND =3D "virtual/egl virtual/libgles2 wayland"
-
-# Extra RDEPENDS for PACKAGECONFIG
-# This has to be explictly listed, because cogl dlopens the backends
-ERDEPENDS_GL    =3D "libgl"
-ERDEPENDS_GLES2 =3D "libgles2"
-
-# GLESv1 is rarely tested, so disable it
-EXTRA_OECONF +=3D "--enable-examples-install	\
-	       	 --enable-debug		 	\
-	       	 --disable-gles1		\
-	         --disable-cairo                \
-	    	"
-DEBUG_OPTIMIZATION_append =3D " -Wno-error=3Dmaybe-uninitialized"
-
-# OpenGL/GLX
-PACKAGECONFIG[glx] =3D "--enable-gl --enable-glx,--disable-gl --disable-=
glx,${EDEPENDS_GL} ${EDEPENDS_X11},${ERDEPENDS_GL}"
-
-# GLESv2
-PACKAGECONFIG[gles2] =3D "--enable-gles2,--disable-gles2,${EDEPENDS_GLES=
2}, ${ERDEPENDS_GLES2}"
-
-# EGL backends
-PACKAGECONFIG[egl-kms] =3D "--enable-kms-egl-platform,--disable-kms-egl-=
platform,${EDEPENDS_KMS}"
-PACKAGECONFIG[egl-null] =3D "--enable-null-egl-platform,--disable-null-e=
gl-platform"
-PACKAGECONFIG[egl-x11] =3D "--enable-xlib-egl-platform,--disable-xlib-eg=
l-platform,${EDEPENDS_X11} ${EDEPENDS_EGL}"
-PACKAGECONFIG[egl-wayland] =3D "--enable-wayland-egl-platform,--disable-=
wayland-egl-platform,${EDEPENDS_WAYLAND}"
-
-# Wayland (server-side)
-PACKAGECONFIG[wayland-server] =3D "--enable-wayland-egl-server,--disable=
-wayland-egl-server,${EDEPENDS_WAYLAND}"
-
-# Support rendering text directly with Pango
-PACKAGECONFIG[cogl-pango] =3D "--enable-cogl-pango,--disable-cogl-pango,=
pango"
-
-# Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate b=
y
-# default.
-PACKAGECONFIG ??=3D "cogl-pango gles2 \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'e=
gl-wayland', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx e=
gl-x11', '', d)} \
-                   "
-
-do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH=3D"${B}/cogl/.libs"
-}
-
-FILES_${PN} =3D ""
-FILES_${PN}-examples =3D "${bindir}/* ${datadir}/cogl/examples-data/*"
-FILES_libcogl =3D "${libdir}/libcogl${SOLIBS} ${libdir}/girepository-1.0=
/Cogl-*.typelib"
-FILES_libcogl-gles2 =3D "${libdir}/libcogl-gles2${SOLIBS}"
-FILES_libcogl-pango =3D "${libdir}/libcogl-pango${SOLIBS} ${libdir}/gire=
pository-1.0/CoglPango*.typelib"
-
-FILES_libcogl-path =3D "${libdir}/libcogl-path${SOLIBS}"
-
-# For backwards compatibility after Debian-renaming
-RPROVIDES_libcogl =3D "cogl-1.0"
-RCONFLICTS_libcogl =3D "cogl-1.0"
-RREPLACES_libcogl =3D "cogl-1.0"
-
-RDEPENDS_${PN}-dev =3D "libcogl"
-
-COMPATIBLE_HOST_armv4 =3D 'null'
diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-=
require-eglmesaext.h.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-con=
figure.ac-don-t-require-eglmesaext.h.patch
deleted file mode 100644
index 328984a63f..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require=
-eglmesaext.h.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From bb9765a926588ebfe1eb324fbbe8fc22d419eebe Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.krummenacher@toradex.com>
-Date: Thu, 25 Jun 2020 11:27:40 +0000
-Subject: [PATCH] configure.ac: don't require eglmesaext.h
-
-E.g. the Vivante EGL implementation does not provide eglmesaext.h.
-
-The commit moves the check for header file existence outside of the
-check for existence of a egl packageconfig and makes the existence
-of eglmesaext.h optional.
-
-fixes commit fb1acfec ("Fix building against libglvnd-provided EGL heade=
rs")
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cogl/-/merge_=
requests/28]
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
----
- configure.ac | 51 ++++++++++++++++++++++++++++++++-------------------
- 1 file changed, 32 insertions(+), 19 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b7ba95d..0d1d8de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1212,22 +1212,6 @@ AS_IF([test "x$NEED_EGL" =3D "xyes" && test "x$EG=
L_CHECKED" !=3D "xyes"],
-         PKG_CHECK_EXISTS([egl],
-           [COGL_PKG_REQUIRES=3D"$COGL_PKG_REQUIRES egl"],
-           [
--            AC_CHECK_HEADERS(
--              [EGL/egl.h],
--              [],
--              [AC_MSG_ERROR([Unable to locate required EGL headers])])
--            AC_CHECK_HEADERS(
--              [EGL/eglext.h],
--              [],
--              [AC_MSG_ERROR([Unable to locate required EGL headers])],
--              [#include <EGL/egl.h>])
--            AC_CHECK_HEADERS(
--              [EGL/eglmesaext.h],
--              [],
--              [AC_MSG_ERROR([Unable to locate required EGL headers])],
--              [#include <EGL/egl.h>
--#include <EGL/eglext.h>])
--
-             AC_CHECK_LIB(EGL, [eglInitialize],
-               [COGL_EXTRA_LDFLAGS=3D"$COGL_EXTRA_LDFLAGS -lEGL"],
-               [AC_MSG_ERROR([Unable to locate required EGL library])])
-@@ -1236,9 +1220,38 @@ AS_IF([test "x$NEED_EGL" =3D "xyes" && test "x$EG=
L_CHECKED" !=3D "xyes"],
-           ]
-           )
-=20
--        COGL_EGL_INCLUDES=3D"#include <EGL/egl.h>
--#include <EGL/eglext.h>
--#include <EGL/eglmesaext.h>"
-+dnl Test for the existence of egl headers.
-+dnl egl*.h includes eglplatform.h which on __unix__ defaults to a X11 p=
latform.
-+dnl In that case AC_CHECK_HEADERS failes if X11 headers are not availab=
le.
-+dnl Set the usual include guard define and, if the EGL implementation d=
oesn't
-+dnl use that guard fall back to USE_OZONE and EGL_NO_X11 platforms whic=
h don't
-+dnl require additional headers.
-+        AC_CHECK_HEADERS(
-+          [EGL/egl.h],
-+          [COGL_EGL_INCLUDES=3D"#include <EGL/egl.h>"],
-+          [AC_MSG_ERROR([Unable to locate required EGL headers])],
-+          [#define __egl_h_
-+ #define USE_OZONE
-+ #define EGL_NO_X11])
-+        AC_CHECK_HEADERS(
-+          [EGL/eglext.h],
-+          [COGL_EGL_INCLUDES=3D"$COGL_EGL_INCLUDES
-+#include <EGL/eglext.h>"],
-+          [AC_MSG_ERROR([Unable to locate required EGL headers])],
-+          [#define __eglext_h_
-+ #define USE_OZONE
-+ #define EGL_NO_X11
-+$COGL_EGL_INCLUDES])
-+        AC_CHECK_HEADERS(
-+          [EGL/eglmesaext.h],
-+          [COGL_EGL_INCLUDES=3D"$COGL_EGL_INCLUDES
-+#include <EGL/eglmesaext.h>"],
-+          [],
-+          [#define __eglmesaext_h_
-+#define USE_OZONE
-+#define EGL_NO_X11
-+$COGL_EGL_INCLUDES])
-+
-         AC_SUBST([COGL_EGL_INCLUDES])
-       ])
-=20
---=20
-2.20.1
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta/recipes=
-graphics/cogl/cogl-1.0_1.22.8.bb
deleted file mode 100644
index b9446fab38..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI +=3D "file://0001-configure.ac-don-t-require-eglmesaext.h.patch"
-SRC_URI[archive.sha256sum] =3D "a805b2b019184710ff53d0496f9f0ce6dcca420c=
141a0f4f6fcc02131581d759"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1b1a508d91d25ca607c83f92f3e31=
c84"
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/re=
cipes-graphics/images/core-image-clutter.bb
deleted file mode 100644
index a594461022..0000000000
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION =3D "An image with support for the Open GL-based toolkit Clu=
tter, \
-which enables development of rich and animated graphical user interfaces=
."
-
-IMAGE_FEATURES +=3D "splash package-management x11-base x11-sato ssh-ser=
ver-dropbear"
-
-LICENSE =3D "MIT"
-
-IMAGE_INSTALL =3D "\
-    ${CORE_IMAGE_BASE_INSTALL} \
-    packagegroup-core-clutter-core \
-    "
-
-inherit core-image
-
-QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", =
"-m 256", d)}'
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutte=
r.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
deleted file mode 100644
index 2e7b47dd40..0000000000
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
-
-SUMMARY =3D "Clutter package groups"
-
-PR =3D "r6"
-
-inherit packagegroup features_check
-# rdepends on clutter-*
-REQUIRED_DISTRO_FEATURES =3D "opengl"
-
-PACKAGES =3D "\
-    ${PN}-core \
-    "
-
-SUMMARY_${PN}-core =3D "Clutter graphics library"
-RDEPENDS_${PN}-core =3D "\
-    clutter-1.0 \
-    clutter-gst-3.0 \
-    clutter-gtk-1.0 \
-    "
--=20
2.25.1

