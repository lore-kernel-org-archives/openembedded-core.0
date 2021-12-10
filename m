Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB23FC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7713.1639146169147209103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C683013D5
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71E1B3F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 04/10] gtk+3: remove obsolete support for renamed libtool
Date: Fri, 10 Dec 2021 14:22:36 +0000
Message-Id: <20211210142242.2698587-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159531

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc             |  3 --
 .../gtk+/gtk+3/0001-Hardcoded-libtool.patch   | 47 -------------------
 meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb      |  1 -
 3 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.=
patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
index 47cdb83dce6..4de4dcf5324 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -27,9 +27,6 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 export PKG_CONFIG_FOR_BUILD =3D "${STAGING_BINDIR_NATIVE}/pkg-config-nat=
ive"
=20
 do_configure:prepend() {
-    # Do this because the configure script is running ./libtool directly
-    rm -f libtool
-    ln -s ${TARGET_PREFIX}libtool libtool
     #delete a file that will get confused with generated one in ${B}
     rm -f ${S}/gtk/gtktypefuncs.c
=20
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch b=
/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
deleted file mode 100644
index c210bbc7d5f..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0ecaa5bab162abf0cb2057d77beeb7b89d5873b4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 21 Jun 2016 14:53:56 +0300
-Subject: [PATCH 1/4] Hardcoded libtool
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6628e21..f43ac09 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -617,7 +617,7 @@ AC_MSG_CHECKING([whether to write dependencies into =
.pc files])
- case $enable_explicit_deps in
-   auto)
-     export SED
--    deplibs_check_method=3D`(./libtool --config; echo 'eval echo \"$dep=
libs_check_method\"') | sh`
-+    deplibs_check_method=3D`(./$host_alias-libtool --config; echo 'eval=
 echo \"$deplibs_check_method\"') | sh`
-     if test "x$deplibs_check_method" !=3D xpass_all || test "x$enable_s=
tatic" =3D xyes ; then
-       enable_explicit_deps=3Dyes
-     else
-@@ -895,7 +895,7 @@ else
-     dnl Now we check to see if our libtool supports shared lib deps
-     dnl (in a rather ugly way even)
-     if $dynworks; then
--        module_libtool_config=3D"${CONFIG_SHELL-/bin/sh} ./libtool --co=
nfig"
-+        module_libtool_config=3D"${CONFIG_SHELL-/bin/sh} ./$host_alias-=
libtool --config"
-         module_deplibs_check=3D`$module_libtool_config | \
-             grep '^[[a-z_]]*check[[a-z_]]*_method=3D[['\''"]]' | \
-             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -1649,7 +1649,7 @@ AC_SUBST(GTK_PRINT_BACKENDS)
- # We are using gmodule-no-export now, but I'm leaving the stripping
- # code in place for now, since pango and atk still require gmodule.
- export SED
--export_dynamic=3D`(./libtool --config; echo eval echo \\$export_dynamic=
_flag_spec) | sh`
-+export_dynamic=3D`(./$host_alias-libtool --config; echo eval echo \\$ex=
port_dynamic_flag_spec) | sh`
- if test -n "$export_dynamic"; then
-   GDK_DEP_LIBS=3D`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
-   GTK_DEP_LIBS=3D`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
---=20
-2.12.0
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.30.bb
index 7e7566f9af9..3de5b588eba 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
@@ -3,7 +3,6 @@ require gtk+3.inc
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+=
-${PV}.tar.xz \
-           file://0001-Hardcoded-libtool.patch \
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
--=20
2.25.1


