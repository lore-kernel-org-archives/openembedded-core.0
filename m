Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42321C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 21:00:00 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6830.1789333194397397935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mqzfdJp7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260913205952b9b637371e00020706-dm_x6g@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260913205952b9b637371e00020706
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T2AalIS7mFTEqoVFCUWfhkoCLE+L0RmdCXCSnxnRJqw=;
 b=mqzfdJp7dNZAN6bJBntR60a4zQ0iHoTfPYFk2GsHx7519zW48UkxHAA4ivXecWpz0tchsh
 t1Ajxv0nmfCku15pug9v7awApFltI6qURslT1QWXIB39DlVOH6vAtYe+MfMHA5T6vjZZm3S/
 rpoLIvPJSEOdZYcsLjoiBW7TzqdRA4+KAhRrC4zQl0kra6gF2mTeU2STye4IY75F+AiFVINX
 Vi+Krq749X5qh2CKO0Pp3gRcK5OMqHr95L4jTlxl22JiB/FYOVLo8caiehiL0O3aY6gxvkz7
 wrlbaycbkolDXWk3XCHvv1g5EY6cWXs1vjT6SY7/xaZLMxUYO69YIIAQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/3] recipes: add tag to remaining git SRC_URI entries
Date: Sun, 13 Sep 2026 22:59:10 +0200
Message-ID: <20260913205911.3638917-2-peter.marko@siemens.com>
In-Reply-To: <20260913205911.3638917-1-peter.marko@siemens.com>
References: <20260913205911.3638917-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 21:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245741

From: Peter Marko <peter.marko@siemens.com>

This leaves only 3 recipes detected by following query:

grep -rI 'git://' meta/recipes* | grep -v ';tag=' | \
  grep -v '\(devupstream\|MIRRORS\)' | sed s/:.*// | sort -u | \
  xargs grep -c '\(+git\|UPSTREAM_CHECK_COMMITS\)' | grep :0$ | \
  sed s/:0$//

meta/recipes-core/glibc/cross-localedef-native_2.44.bb
 -> this gets +git into PV from glibc-version.inc
meta/recipes-core/images/build-appliance-image_15.0.0.bb
 -> not sure what to do with this
meta/recipes-extended/bzip2/bzip2_1.0.8.bb
 -> this is untagged for test repository, not main repository

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb        | 2 +-
 meta/recipes-core/fts/fts_1.2.7.bb                             | 2 +-
 meta/recipes-core/musl/gcompat_git.bb                          | 2 +-
 meta/recipes-core/musl/libucontext_1.3.2.bb                    | 2 +-
 meta/recipes-core/musl/musl-obstack.bb                         | 2 +-
 meta/recipes-core/ncurses/ncurses.inc                          | 3 ++-
 meta/recipes-devtools/binutils/binutils-2.47.inc               | 3 ++-
 meta/recipes-devtools/file/file_5.48.bb                        | 3 ++-
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb             | 2 +-
 meta/recipes-gnome/libportal/libportal_0.10.0.bb               | 2 +-
 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb               | 2 +-
 meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb             | 2 +-
 meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb             | 2 +-
 meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb         | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb     | 2 +-
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb    | 2 +-
 meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb  | 2 +-
 18 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
index 1ef29f9c2e..de9a1d46c7 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS:${PN} = "bash sed util-linux-flock"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable;tag=debian/${PV} \
            file://99_resolvconf \
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index 699dc5ddd3..6bb595c2a2 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
-SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https;tag=v${PV}"
 
 inherit autotools pkgconfig
 #
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index 6f9710e71a..656790298c 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://git.adelielinux.org/adelie/gcompat"
 LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=802b1aed7330d90086be4de63a3188e3"
 
-SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current \
+SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current;tag=${PV} \
            file://0001-Add-fcntl64-wrapper.patch \
            "
 SRC_URI:append:powerpc = "\
diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
index c5b802207b..2d4505b68f 100644
--- a/meta/recipes-core/musl/libucontext_1.3.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 DEPENDS = ""
 
 SRCREV = "a0323579ac50b9a9d4033754d089f1fed0f59a00"
-SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
+SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https;tag=${BPN}-${PV} \
            "
 
 COMPATIBLE_HOST = ".*-musl.*"
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index d8a5ae8d82..36f7c0fede 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 PV = "1.2.3"
 SRCREV = "f4385255be1615688c6a5f042277304d7ab288b1"
-SRC_URI = "git://github.com/void-linux/musl-obstack;branch=master;protocol=https"
+SRC_URI = "git://github.com/void-linux/musl-obstack;branch=master;protocol=https;tag=v${PV}"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 89668be363..102ed0e5a2 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,8 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"
+GIT_TAG = "v${@d.getVar('PV').replace('.', '_').replace('+', '_')}"
+SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master;tag=${GIT_TAG}"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipes-devtools/binutils/binutils-2.47.inc
index ccaf12142a..485da4a13c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -20,8 +20,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2026-4647] = "fixed-version: fixed-version: Fixed from version 2.47"
 
+GIT_TAG = "binutils-${@d.getVar('PV').replace('.', '_')}"
 SRCREV ?= "6ce87bbc521cf46eaee9a1f7ef61cee2cdfb3e32"
-BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https;tag=${GIT_TAG}"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
      file://0004-Point-scripts-location-to-libdir.patch \
diff --git a/meta/recipes-devtools/file/file_5.48.bb b/meta/recipes-devtools/file/file_5.48.bb
index 20e167f436..827227ff39 100644
--- a/meta/recipes-devtools/file/file_5.48.bb
+++ b/meta/recipes-devtools/file/file_5.48.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
+GIT_TAG = "FILE${@d.getVar('PV').replace('.', '_')}"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https;tag=${GIT_TAG} \
            "
 
 SRCREV = "eb754ace19fed5481d8142426543100a2d6bae4e"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 4cb785aa90..3fe931adb5 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -19,7 +19,7 @@ PV = "1.4.4"
 
 SRCREV = "c65926005e50da02a4da3e26abc42eded36cd19d"
 
-SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
+SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https;tag=v${PV} \
            file://0001-Use-cross-compiled-rpcgen.patch \
            "
 
diff --git a/meta/recipes-gnome/libportal/libportal_0.10.0.bb b/meta/recipes-gnome/libportal/libportal_0.10.0.bb
index 4ba56dd44f..5f16f96b03 100644
--- a/meta/recipes-gnome/libportal/libportal_0.10.0.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.10.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://github.com/flatpak/libportal/issues"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main;tag=${PV}"
 SRCREV = "c23024018c8eb076549a1517fcb2d7f80d3e2ed5"
 
 inherit meson gi-docgen gobject-introspection vala pkgconfig
diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index e2cdd81b46..10bfb5604c 100644
--- a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
 LICENSE = "MIT AND BSD-1-Clause AND BSD-3-Clause AND GPL-3.0-or-later WITH Autoconf-exception-macro"
 LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
 
-SRC_URI = "git://gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master;tag=v${PV}"
 
 SRCREV = "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
 
diff --git a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
index cad78f67f5..d2b88783dd 100644
--- a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "Apache-2.0 WITH LLVM-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=7cc795f6cbb2d801d84336b83c8017db"
 
-SRC_URI = "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;protocol=https;branch=llvm_22"
+SRC_URI = "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;protocol=https;branch=llvm_22;tag=${PV}"
 
 SRCREV = "87f66007242ff10e9e84bf32be84f9057f6abc75"
 
diff --git a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
index 0f3d0ebe2c..e499e975fc 100644
--- a/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ b/meta/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
 SRCREV = "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https;tag=${BPN}-${PV}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[doc] = ",-Ddoc=false,asciidoc-native xmlto-native"
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
index 8704481da7..62298735ea 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
@@ -24,7 +24,7 @@ PACKAGES =+ "${PN}-tools"
 FILES:${PN}-tools = "${bindir}/*.pl"
 
 SRC_URI = "\
-    git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
+    git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https;tag=${PV} \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
 "
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index 69a8c7472f..016bf26af5 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "gtk+3 startup-notification dbus"
 SECTION = "x11/wm"
 
 SRCREV = "0fd6a0c3f3b7bbf4f4b46190d71f7aef35d6bbfd"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master;protocol=https;tag=${PV} \
            file://vfolders/ \
            "
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index 5fc6c67bfc..f384a84b60 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "libfakekey expat libxft"
 
 #SRCREV for 0.1.1
 SRCREV = "630d89068dc0a1e9199306d405cb32f892dfa4d3"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1;protocol=https;tag=${PV} \
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index f4e0000ee0..40febba4ed 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -21,7 +21,7 @@ RPROVIDES:${PN} = "matchbox-panel"
 RREPLACES:${PN} = "matchbox-panel"
 RCONFLICTS:${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master;tag=${PV} \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            file://0001-applets-clock-fix-clock-widget-width-resize.patch \
            "
diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
index 74f53de6d7..1ff7da6866 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=464f2cfb1c35a5123f9e309d7afd79f8"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/ericonr/argp-standalone;branch=master;protocol=https \
+SRC_URI = "git://github.com/ericonr/argp-standalone;branch=master;protocol=https;tag=${PV} \
            file://out_of_tree_build.patch \
           "
 SRCREV = "e5fe9ad9e83e6765cf8fa787f903d4c6792338b5"

