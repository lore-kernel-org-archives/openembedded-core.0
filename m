Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.626.1616693958656999373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333CB143D
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 10:39:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D10E63F718
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 10:39:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] meson: fix native/host confusion in gobject-introspection
Date: Thu, 25 Mar 2021 17:38:59 +0000
Message-Id: <20210325173901.3057180-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building G-I we want to use *native* binaries (as they need to be
executed) but the *cross* libraries, as otherwise when using the correct
pkg-config binary in native lookups Meson will end up linking native and
cross libraries together.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 .../meson/meson/gi-target-dep.patch           | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/gi-target-dep.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtool=
s/meson/meson.inc
index fc3ca85fae..e186dede92 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/mesonbuild/meson/releas=
es/download/${PV}/meson-${P
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-inst=
all.patch \
            file://0001-minstall-Correctly-set-uid-gid-of-installed-files=
.patch \
+           file://gi-target-dep.patch \
            "
 SRC_URI[sha256sum] =3D "72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723ee=
bbd6ec7f1955c8a6"
=20
diff --git a/meta/recipes-devtools/meson/meson/gi-target-dep.patch b/meta=
/recipes-devtools/meson/meson/gi-target-dep.patch
new file mode 100644
index 0000000000..25b30ca27a
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/gi-target-dep.patch
@@ -0,0 +1,41 @@
+When building gobject-introspection we want the *native* binaries (as th=
ey need
+to be executed) but *host* gobject-introspection libraries, as otherwise=
 the
+native pkg-config can be used and the build will try to link native and =
host
+binaries together.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index f9660838e..2eefc3fc7 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -84,8 +84,8 @@ class GnomeModule(ExtensionModule):
+                      mlog.bold('https://github.com/mesonbuild/meson/iss=
ues/1387'),
+                      once=3DTrue)
+=20
+-    def _get_native_dep(self, state, depname, required=3DTrue):
+-        kwargs =3D {'native': True, 'required': required}
++    def _get_dep(self, state, depname, native=3DFalse, required=3DTrue)=
:
++        kwargs =3D {'native': native, 'required': required}
+         holder =3D self.interpreter.func_dependency(state.current_node,=
 [depname], kwargs)
+         return holder.held_object
+=20
+@@ -101,7 +101,7 @@ class GnomeModule(ExtensionModule):
+             return ExternalProgram.from_entry(name, prog)
+=20
+         # Check if pkgconfig has a variable
+-        dep =3D self._get_native_dep(state, depname, required=3DFalse)
++        dep =3D self._get_dep(state, depname, native=3DTrue, required=3D=
False)
+         if dep.found() and dep.type_name =3D=3D 'pkgconfig':
+             value =3D dep.get_pkgconfig_variable(varname, {})
+             if value:
+@@ -481,7 +481,7 @@ class GnomeModule(ExtensionModule):
+=20
+     def _get_gir_dep(self, state):
+         if not self.gir_dep:
+-            self.gir_dep =3D self._get_native_dep(state, 'gobject-intro=
spection-1.0')
++            self.gir_dep =3D self._get_dep(state, 'gobject-introspectio=
n-1.0')
+             self.giscanner =3D self._get_native_binary(state, 'g-ir-sca=
nner', 'gobject-introspection-1.0', 'g_ir_scanner')
+             self.gicompiler =3D self._get_native_binary(state, 'g-ir-co=
mpiler', 'gobject-introspection-1.0', 'g_ir_compiler')
+         return self.gir_dep, self.giscanner, self.gicompiler
--=20
2.25.1

