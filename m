Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.687.1632260602896364851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 14:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pGBF+8Sz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u15so801703wru.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N552tvDW8v8nEuA3S09PiJ8aQwhCXHltvQ0kcN91LZk=;
        b=pGBF+8Sz/505xtxbGO9RJb+JVPOBOxpEtnvWOz3wMjxNOXqpTUGHsCGc47INJdjY5I
         y4OemEURmqnyPk4o0i/Mg8Ey8BqBWxjmAr08+s27FHz5hQ5/+hvDtUIoEuI0UsOcmkHo
         P82M+u4Y22+0UFwZX4F2a0CNrIUGoeav40CBN29Wk4rBW6lkr6W7sepToXe307UiUdno
         Xo+X+FWSCqyzb4YM4toghrzIJVPRYWtKH9c64Y1TYcHeJAVbdWEIWf80W4uXpCPF2s4H
         T7OQK7tifyzKAGMeFii8sVrQiE1wJtSTXK/Nx13OaIafBq/WyGSuh/px9/d9ZIzFBHeu
         D16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N552tvDW8v8nEuA3S09PiJ8aQwhCXHltvQ0kcN91LZk=;
        b=DsbPhBwWaVPIRKm5+a9xxRq2fdbhozR+8fY7BffmpHYZelcphUECosq4vq+l53yvq3
         F3es59vlfh4XNOQEZV9HeqrABSPSCik/Q8PKyiDiK9X81NaxyIQy3gSPLtAEISCd454t
         gMzRy0JqrxlqkEiZNamElyxC29N9zT87tLV6qc2wkrgMmfWYrcCN+0J1rHHtKqBHjWcn
         u/y0pcJiSDu/iHOeJhYD5bJrUX6A4lPYCzHt80B5nvKu/tu9pFML3Rn1YFilrYlIsve2
         gGnS2YHRyde804ezSj3OYnR1EQYn3LGuyfSn79JcW+uHFPlVW9RZ0AwzKZmsw/SzQRkW
         844w==
X-Gm-Message-State: AOAM531qTJRs2LvnW5ynAZDh7/PQrZNlGYHvYML+zsN0G4qKYWFeVOCm
	V20wpsA3zLbI1wbUZmgt1MTVQTwhKjk=
X-Google-Smtp-Source: ABdhPJy4mKwVyA89XgnqO1GKofmCBqUvOj7wKh79ECEF1GrQ7X8kS+eKw28jLVMpXpGDFUJQ7YY6BA==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id n14mr6912199wmq.63.1632260600994;
        Tue, 21 Sep 2021 14:43:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id q7sm224829wru.56.2021.09.21.14.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:43:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Adrian Bunk <bunk@stusta.de>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Ross Burton <ross.burton@intel.com>,
	Jussi Kukkonen <jussi.kukkonen@intel.com>
Subject: [RFC PATCH] librsvg: update 2.40.21 -> 2.52.0 (transition to rust!)
Date: Tue, 21 Sep 2021 23:43:18 +0200
Message-Id: <20210921214318.1494652-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

After some poking and hacking I have arrived to the settings that work.
Please refer to the commit for details.

Some of these issues may re-occur in other components; in that case
we need to come up with more generic solutions or upstream fixes.

So far, it's a learning exercise for everybody in getting to know the rust =
toolchain.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-Bsymbolic-fixes-configure-on-macOS.patch | 35 -----------
 ...-rust-target-to-cargo-also-when-not-.patch | 47 +++++++++++++++
 .../0001-Remove-non-reproducible-SRCDIR.patch | 30 ----------
 ...lib.rs-do-not-probe-into-harcoded-li.patch | 53 ++++++++++++++++
 .../librsvg/librsvg/gtk-option.patch          | 60 -------------------
 .../{librsvg_2.40.21.bb =3D> librsvg_2.52.0.bb} | 42 +++++++++----
 6 files changed, 130 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsy=
mbolic-fixes-configure-on-macOS.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pas=
s-rust-target-to-cargo-also-when-not-.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-repr=
oducible-SRCDIR.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src=
-lib.rs-do-not-probe-into-harcoded-li.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.21.bb =3D> librsvg_2.52.0.=
bb} (51%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-=
fixes-configure-on-macOS.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Au=
to-detect-Bsymbolic-fixes-configure-on-macOS.patch
deleted file mode 100644
index 954bb60880c..00000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-c=
onfigure-on-macOS.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b99891e31eb6ce550e7e1cb2ca592095b3050a93 Mon Sep 17 00:00:00 2001
-From: Brion Vibber <brion@pobox.com>
-Date: Sun, 25 Feb 2018 18:42:36 -0800
-Subject: Auto-detect -Bsymbolic, fixes configure on macOS
-
-The -Bsymbolic linker option is ELF-specific, and was breaking
-configure on macOS unless --disable-Bsymbolic was explicitly passed.
-
-Switching the behavior from requiring -Bsymbolic to be available
-by default to just warning and continuing on without.
-
-Fixes https://gitlab.gnome.org/GNOME/librsvg/issues/211
-
-Upstream-Status: Backport
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 15b26b2d..9f8dce29 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -216,7 +216,7 @@ AM_CONDITIONAL([ENABLE_PIXBUF_LOADER],[test "$enable_p=
ixbuf_loader" =3D "yes"])
- AC_ARG_ENABLE([Bsymbolic],
-   [AS_HELP_STRING([--disable-Bsymbolic],
-                   [disable linking with -Bsymbolic])],
--  [],[enable_Bsymbolic=3Dyes])
-+  [enable_Bsymbolic=3Dno],[enable_Bsymbolic=3Dauto])
-=20
- BSYMBOLIC_LDFLAG=3D
- if test "$enable_Bsymbolic" !=3D "no"; then
---=20
-2.20.1
-
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-=
target-to-cargo-also-when-not-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch
new file mode 100644
index 00000000000..d7487c234cf
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-Makefile.am-pass-rust-target-=
to-cargo-also-when-not-.patch
@@ -0,0 +1,47 @@
+From 95b2cd0169cb1b4694c2bce67169b1aa1d5e2be0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 21 Sep 2021 16:27:14 +0200
+Subject: [PATCH] Makefile.am: pass rust target to cargo also when not cross
+ compiling
+
+Otherwise oe-core's native build doesn't work either.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile.am  | 2 --
+ configure.ac | 4 +---
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e93714e..effe5d3 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -137,9 +137,7 @@ else
+ CARGO_RELEASE_ARGS=3D--release
+ endif
+=20
+-if CROSS_COMPILING
+ CARGO_TARGET_ARGS=3D--target=3D$(RUST_TARGET)
+-endif
+=20
+ CARGO_VERBOSE =3D $(cargo_verbose_$(V))
+ cargo_verbose_ =3D $(cargo_verbose_$(AM_DEFAULT_VERBOSITY))
+diff --git a/configure.ac b/configure.ac
+index 41590ca..84cd56b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -255,9 +255,7 @@ AC_ARG_VAR(RUST_TARGET, [Set rust target (default=3D$h=
ost)])
+ : ${RUST_TARGET:=3D$host}
+=20
+ AM_CONDITIONAL([CROSS_COMPILING], [test "x$cross_compiling" =3D xyes])
+-AS_IF([test "x$cross_compiling" =3D "xyes"], [
+-	RUST_TARGET_SUBDIR=3D"$RUST_TARGET/$RUST_TARGET_SUBDIR"
+-])
++RUST_TARGET_SUBDIR=3D"$RUST_TARGET/$RUST_TARGET_SUBDIR"
+ AC_SUBST([RUST_TARGET_SUBDIR])
+=20
+ dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+--=20
+2.20.1
+
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducibl=
e-SRCDIR.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reprodu=
cible-SRCDIR.patch
deleted file mode 100644
index 75fc7f9d0b9..00000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDI=
R.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Mon, 18 Nov 2019 14:46:34 -0600
-Subject: [PATCH] Remove non-reproducible SRCDIR
-
-Removes SRCDIR as the prefix for finding the test font. This wouldn't
-work anyway, since that path is not present on the target.
-
-This patch is specific to OE, since it appears that this entire method
-of testing was removed when upstream was re-written in rust
-
-Upstream-Status: Inappropriate [OE-specific, no longer present upstream]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- rsvg-cairo-draw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
-index caa9104..cfb7ed2 100644
---- a/rsvg-cairo-draw.c
-+++ b/rsvg-cairo-draw.c
-@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext *context)
- static void
- create_font_config_for_testing (RsvgCairoRender *render)
- {
--    const char *font_path =3D SRCDIR "/tests/resources/LiberationSans-Reg=
ular.ttf";
-+    const char *font_path =3D "/tests/resources/LiberationSans-Regular.tt=
f";
-=20
-     if (render->font_config_for_testing !=3D NULL)
-         return;
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs=
-do-not-probe-into-harcoded-li.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch
new file mode 100644
index 00000000000..849dd98c5f0
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not=
-probe-into-harcoded-li.patch
@@ -0,0 +1,53 @@
+From 6d1f0740b111e86e99dcaf0222f3d1d67d3bf1e6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 21 Sep 2021 16:54:23 +0200
+Subject: [PATCH] system-deps/src/lib.rs: do not probe into harcoded list of
+ targets
+
+Oe-core defines custom targets, and this probe fails.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ vendor/system-deps/.cargo-checksum.json |  2 +-
+ vendor/system-deps/src/lib.rs           | 16 +---------------
+ 2 files changed, 2 insertions(+), 16 deletions(-)
+
+diff --git a/vendor/system-deps/.cargo-checksum.json b/vendor/system-deps/=
.cargo-checksum.json
+index ecebb94..30d594e 100644
+--- a/vendor/system-deps/.cargo-checksum.json
++++ b/vendor/system-deps/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"015518f4337d80249d12c7e6c=
55e9063705a0b8805ebf46a445c89253edc5de0","src/metadata.rs":"4c8d6ac2c88646a=
5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","src/test.rs":"1ec48d1e4=
43a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","src/tests/testano=
therlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b1424eb=
3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3f8d36a2ce001928=
d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14c3d948118408f3d=
1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.0.pc":"cd39c2ef=
88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","src/tests/testli=
b.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707a52db","s=
rc/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f15315df6538610cf=
cd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f870722b3b08d2f13=
053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
+\ No newline at end of file
++{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"594e5f14180590adc9ea0a8ba=
1cc35f9a8a260322d08de3037efac3ce1dc729b","src/metadata.rs":"4c8d6ac2c88646a=
5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","src/test.rs":"1ec48d1e4=
43a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","src/tests/testano=
therlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b1424eb=
3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3f8d36a2ce001928=
d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14c3d948118408f3d=
1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.0.pc":"cd39c2ef=
88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","src/tests/testli=
b.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707a52db","s=
rc/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f15315df6538610cf=
cd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f870722b3b08d2f13=
053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
+diff --git a/vendor/system-deps/src/lib.rs b/vendor/system-deps/src/lib.rs
+index a0d4f00..a666817 100644
+--- a/vendor/system-deps/src/lib.rs
++++ b/vendor/system-deps/src/lib.rs
+@@ -725,21 +725,7 @@ impl Config {
+     }
+=20
+     fn check_cfg(&self, cfg: &cfg_expr::Expression) -> Result<bool, Error=
> {
+-        use cfg_expr::{targets::get_builtin_target_by_triple, Predicate};
+-
+-        let target =3D self
+-            .env
+-            .get("TARGET")
+-            .expect("no TARGET env variable defined");
+-        let target =3D get_builtin_target_by_triple(&target)
+-            .unwrap_or_else(|| panic!("Invalid TARGET: {}", target));
+-
+-        let res =3D cfg.eval(|pred| match pred {
+-            Predicate::Target(tp) =3D> Some(tp.matches(target)),
+-            _ =3D> None,
+-        });
+-
+-        res.ok_or_else(|| Error::UnsupportedCfg(cfg.original().to_string(=
)))
++        Ok(true)
+     }
+ }
+=20
+--=20
+2.20.1
+
diff --git a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch b/meta/rec=
ipes-gnome/librsvg/librsvg/gtk-option.patch
deleted file mode 100644
index 6c23071cd34..00000000000
--- a/meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4e0ce3f22d45033a108cbacca3e5ec6728bd44f3 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 11 Aug 2015 16:25:38 +0300
-Subject: [PATCH] configure: add option to enable/disable use of GTK+
-
-Distro packagers like predictability and automatically detected optional
-dependencies are not predicable.  Add a --with-gtk3 option (default to "au=
to")
-for forcibly controlling whether GTK+ will be used or not.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=3D7=
12693]
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e61a952..c3aae84 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -130,17 +130,22 @@ AC_CHECK_FUNCS(strtok_r)
- # GTK
- # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-=20
--PKG_CHECK_MODULES([GTK3],[gtk+-3.0 >=3D $GTK3_REQUIRED],[have_gtk_3=3Dyes=
],[have_gtk_3=3Dno])
--
- GTK3_BINARY_VERSION=3D
-=20
--if test "$have_gtk_3" =3D "yes"; then
--    GTK3_BINARY_VERSION=3D"`$PKG_CONFIG --variable=3Dgtk_binary_version g=
tk+-3.0`"
-+AC_MSG_CHECKING([whether to use GTK+ 3])
-+AC_ARG_WITH([gtk3],
-+  [AS_HELP_STRING([--without-gtk3],[Don't build GTK+3 tools (default=3Dau=
to)])],
-+  [],[PKG_CHECK_EXISTS([gtk+-3.0 >=3D $GTK3_REQUIRED],[with_gtk3=3Dyes],[=
with_gtk3=3Dno])])
-+AC_MSG_RESULT([$with_gtk3])
-+
-+if test "$with_gtk3" =3D "yes"; then
-+  PKG_CHECK_MODULES(GTK3, [gtk+-3.0 >=3D $GTK3_REQUIRED])
-+  GTK3_BINARY_VERSION=3D"`$PKG_CONFIG --variable=3Dgtk_binary_version gtk=
+-3.0`"
- fi
-=20
- AC_SUBST([GTK3_BINARY_VERSION])
-=20
--AM_CONDITIONAL([HAVE_GTK_3],[test "$have_gtk_3" =3D "yes"])
-+AM_CONDITIONAL([HAVE_GTK_3],[test "$with_gtk3" =3D "yes"])
-=20
- dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
- dnl GDK-Pixbuf SVG loader
-@@ -298,6 +303,6 @@ librsvg-$VERSION
- 	Build introspectable bindings:  ${found_introspection}
- 	Build Vala bindings:            ${enable_vala}
- 	Build GdkPixbuf loader:         ${enable_pixbuf_loader}
--        GTK+ $GTK3_REQUIRED or later:           ${have_gtk_3}
-+        GTK+ $GTK3_REQUIRED or later:           ${with_gtk_3}
- 	Build miscellaneous tools:      ${build_misc_tools}
- "
---=20
-2.1.4
-
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb b/meta/recipes-g=
nome/librsvg/librsvg_2.52.0.bb
similarity index 51%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
index 39b9aeca5d7..4e3febc6a2f 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
@@ -6,24 +6,44 @@ the screen or to generate output for printing."
 HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/librsvg"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/librsvg/issues"
=20
-RECIPE_NO_UPDATE_REASON =3D "Versions from 2.41.0 requires Rust compiler t=
o build it"
-
-LICENSE =3D "LGPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
-                    file://rsvg.h;beginline=3D3;endline=3D24;md5=3D20b4113=
c4909bbf0d67e006778302bc6"
+LICENSE =3D "LGPLv2.1+"
+LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b36=
4516c \
+                   "
=20
 SECTION =3D "x11/utils"
 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND =3D "native nativesdk"
=20
-inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-int=
rospection
+inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-int=
rospection rust
=20
-SRC_URI +=3D "file://gtk-option.patch \
-            file://0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.pat=
ch \
-            file://0001-Remove-non-reproducible-SRCDIR.patch \
+SRC_URI +=3D " file://0001-Makefile.am-pass-rust-target-to-cargo-also-when=
-not-.patch \
+             file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded=
-li.patch \
 "
=20
-SRC_URI[archive.sha256sum] =3D "f7628905f1cada84e87e2b14883ed57d8094dca328=
1d5bcb24ece4279e9a92ba"
+SRC_URI[archive.sha256sum] =3D "bd821fb3e16494b61f5185addd23b726b064f20312=
2b3ab4b3d5d7a44e6bf393"
+
+# librsvg is still autotools-based, but is calling cargo from its automake=
-driven makefiles
+# so we cannot use cargo class directly, but still need bits and pieces fr=
om it=20
+# for cargo to be happy
+BASEDEPENDS:append =3D " cargo-native"
+
+export RUST_BACKTRACE =3D "full"
+export RUSTFLAGS
+export RUST_TARGET_PATH
+
+export RUST_TARGET =3D "${HOST_SYS}"
+
+# rust-cross writes the target linker binary into target json definition w=
ithout any flags.
+# This breaks here because the linker isn't going to work without at least=
 knowing where
+# the sysroot is. So copy the json to workdir, and patch in the path to wr=
apper from rust class
+# which supplies the needed flags.
+do_compile:prepend() {
+    cp ${STAGING_LIBDIR_NATIVE}/rustlib/${HOST_SYS}.json ${WORKDIR}
+    cp ${STAGING_LIBDIR_NATIVE}/rustlib/${BUILD_SYS}.json ${WORKDIR}
+    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${WORKDIR}/=
${HOST_SYS}.json
+    RUST_TARGET_PATH=3D"${WORKDIR}"
+    export RUST_TARGET_PATH
+}
=20
 # Issue only on windows
 CVE_CHECK_WHITELIST +=3D "CVE-2018-1000041"
@@ -33,8 +53,6 @@ CACHED_CONFIGUREVARS =3D "ac_cv_path_GDK_PIXBUF_QUERYLOAD=
ERS=3D${STAGING_LIBDIR_NATI
 PACKAGECONFIG ??=3D "gdkpixbuf"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] =3D "--enable-pixbuf-loader,--disable-pixbuf-load=
er,gdk-pixbuf-native"
-# GTK+ test application (rsvg-view)
-PACKAGECONFIG[gtk] =3D "--with-gtk3,--without-gtk3,gtk+3"
=20
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux
--=20
2.20.1

