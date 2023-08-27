Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B087C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:57:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4882.1693166267241660599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 114181FB;
	Sun, 27 Aug 2023 12:58:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 393193F738;
	Sun, 27 Aug 2023 12:57:46 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libtraceevent: build with Meson
Date: Sun, 27 Aug 2023 20:57:44 +0100
Message-Id: <20230827195744.3451852-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186795

From: Ross Burton <ross.burton@arm.com>

After what I presume is the recent kernel upgrade, perf started to fail
to configure.  This was actually due to libtraceevent racing during its
build and failing to put one of the .o files into the .so (reminder:
Make is terrible). This doesn't cause the libtraceevent build to fail so
once the broken .so is in sstate, it causes all future perf builds to
fail.

Instead of rewriting the Makefile rules to fix this race it's easier to
switch to Meson which doesn't have this sort of problem. However the
Meson support is pretty new and has some rough edges, so we need a patch
to make it do the right thing.

I will submit the libtraceevent fixes upstream shortly.

[ YOCTO #15201 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...not-preserve-ownership-in-cp-command.patch | 40 ----------
 .../libtraceevent/libtraceevent/meson.patch   | 74 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.3.bb      | 10 +--
 3 files changed, 77 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-=
makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/meson=
.patch

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefil=
e-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/lib=
traceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-co=
mmand.patch
deleted file mode 100644
index 5e88048817e..00000000000
--- a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-no=
t-preserve-ownership-in-cp-command.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 22 Dec 2022 18:32:17 -0800
-Subject: [PATCH] makefile: Do not preserve ownership in cp command
-
-Fixes
-
-ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /u=
sr/lib/libtraceevent.a is owned by uid 1000, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-conta=
minated]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 965ff47..0e782cb 100644
---- a/Makefile
-+++ b/Makefile
-@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
- 	$(Q)$(call build_prefix,$(prefix))
-=20
- define do_make_pkgconfig_file
--	cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};	\
-+	install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};=
	\
- 	sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE}; 		\
- 	sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g" ${PKG_CONFIG_FILE}; \
- 	sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
-@@ -335,7 +335,7 @@ install: install_libs install_plugins
-=20
- install_libs: libs install_headers install_pkgconfig
- 	$(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
--		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
-+		cp --no-preserve=3Downership --recursive $(LIB_INSTALL) $(DESTDIR)$(l=
ibdir_SQ)
- 	$(Q)$(call install_ld_config)
-=20
- install_pkgconfig: $(PKG_CONFIG_FILE)
---=20
-2.39.0
-
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch =
b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
new file mode 100644
index 00000000000..38b6107136f
--- /dev/null
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
@@ -0,0 +1,74 @@
+Fixes for the Meson build of libtraceevent:
+
+- Make the plugin directory the same as the Makefiles
+- Install the plugins as modules not static and versioned shared librari=
es
+- Add an option to disable building the documentation (needs asciidoc an=
d xmlto)
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/meson.build b/meson.build
+index b61c873..4bba4d8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -25,7 +25,7 @@ htmldir =3D join_paths(prefixdir, get_option('htmldir'=
))
+ libdir =3D join_paths(prefixdir, get_option('libdir'))
+ plugindir =3D get_option('plugindir')
+ if plugindir =3D=3D ''
+-    plugindir =3D join_paths(libdir, 'libtraceevent/plugins')
++    plugindir =3D join_paths(libdir, 'traceevent/plugins')
+ endif
+=20
+ add_project_arguments(
+@@ -45,10 +45,13 @@ if cunit_dep.found()
+     subdir('utest')
+ endif
+ subdir('samples')
+-subdir('Documentation')
+=20
+-custom_target(
+-    'docs',
+-    output: 'docs',
+-    depends: [html, man],
+-    command: ['echo'])
++if get_option('docs')
++    subdir('Documentation')
++
++    custom_target(
++        'docs',
++        output: 'docs',
++        depends: [html, man],
++        command: ['echo'])
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index b2294f6..0611216 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -4,6 +4,10 @@
+=20
+ option('plugindir', type : 'string',
+        description : 'set the plugin dir')
++
++option('docs', type : 'boolean', value: true,
++       description : 'build documentation')
++
+ option('htmldir', type : 'string', value : 'share/doc/libtraceevent-doc=
',
+        description : 'directory for HTML documentation')
+ option('asciidoctor', type : 'boolean', value: false,
+diff --git a/plugins/meson.build b/plugins/meson.build
+index 74ad664..4919be4 100644
+--- a/plugins/meson.build
++++ b/plugins/meson.build
+@@ -19,11 +19,10 @@ plugins =3D [
+=20
+ pdeps =3D []
+ foreach plugin : plugins
+-    pdeps +=3D library(
++    pdeps +=3D shared_module(
+         plugin.replace('.c', ''),
+         plugin,
+         name_prefix: '',
+-        version: library_version,
+         dependencies: [libtraceevent_dep],
+         include_directories: [incdir],
+         install: true,
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb b/m=
eta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
index f9a38116695..bee7891832a 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
@@ -10,17 +10,13 @@ SECTION =3D "libs"
=20
 SRCREV =3D "dd148189b74da3e2f45c7e536319fec97cb71213"
 SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.gi=
t;branch=3D${BPN};protocol=3Dhttps \
-           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.=
patch"
+           file://meson.patch"
=20
 S =3D "${WORKDIR}/git"
=20
-export EXTRA_CFLAGS =3D "${CFLAGS}"
+inherit meson pkgconfig
=20
-inherit pkgconfig
-
-do_install() {
-    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfi=
g
-}
+EXTRA_OEMESON =3D "-Ddocs=3Dfalse"
=20
 PACKAGES +=3D "${PN}-plugins"
=20
--=20
2.34.1


