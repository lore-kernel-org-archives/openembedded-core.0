Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0708C7728E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:55 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82462075pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XV0b6Y0a7DLt9duZeYvG8r2Y4eAomK5dQL55I8s3wQQ=;
	b=QJ8t0sLypx00y3nIUtTc3h5Bv7K69Ffy1i+6doCqvbZf23iOnL+V7vErqaElwHxZfR
	KlLoGwGBXHI/Qeiyq4a939DVFHAPQCr7qSoLhMDe7eRNFBm8j7OuFFR0979wkDfaOz1h
	DnNxmtXajmcVKBG+YbfekOfFXug4DBjwQLBlcEXyLx7VwlEixcjgAwHPie6b3iwugTPM
	Si14Qqgdq+rhDhJlf61TEWCxZDj53ldxn1ZAjNPZH2rOfUawG2QcZcFy5Ddd8MtpIZGs
	L8EzPsOWuLqNBaAYS0b0rJqodgbtUxInuKcDkb9WiVQ6BRrcsbWNWmovzrPghDiwUB6o
	wtaQ==
X-Received: by 10.66.122.105 with SMTP id lr9mr17895779pab.8.1447371655472;
	Thu, 12 Nov 2015 15:40:55 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:54 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:33 -0700
Message-Id: <36a4020afc01b3c43075a13a8116cc7fe2d9de0f.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/7] sysprof: use packageconfig for the gui
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

This makes the gtk dependencies optional.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../sysprof/files/gui-argument.patch               | 35 ++++++++++++++++++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  9 ++++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch

diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch b/meta/recipes-kernel/sysprof/files/gui-argument.patch
new file mode 100644
index 0000000..d4744e3
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/gui-argument.patch
@@ -0,0 +1,35 @@
+Add the ability to explicitly enable/diable GUI support
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
+
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -62,12 +62,24 @@ KMICRO=`uname -r | cut -d"." -f 3 | cut
+ # Pkgconfig dependencies
+ 
+ core_dep="glib-2.0 >= 2.6.0"
+-gui_dep="gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
+ 
+ PKG_CHECK_MODULES(CORE_DEP, $core_dep, [], AC_MSG_ERROR([sysprof dependencies not satisfied]))
+ 
+-build_gui=yes
+-PKG_CHECK_MODULES(GUI_DEP, $gui_dep, [], build_gui=no)
++gui_dep="gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
++
++AC_ARG_ENABLE([gui],
++  [AS_HELP_STRING([--disable-gui],
++    [Disable GUI functionality (requires gtk+, gdk-pixbuf, pangoft2, libglade) @<:@default=auto@:>@])],
++  [],
++  [enable_gui=auto])
++
++build_gui=no
++AS_IF([test "x$enable_gui" != xno],
++  [PKG_CHECK_MODULES(GUI_DEP, $gui_dep, build_gui=yes,
++    [if test "x$enable_gui" != xauto; then
++       AC_MSG_FAILURE(
++         [--enable-gui was given, but gui dependencies were not satisfied])
++     fi])])
+ 
+ AM_CONDITIONAL([BUILD_GUI], [test "$build_gui" = yes])
+ 
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 7d87efe..d331a23 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -2,13 +2,14 @@ SUMMARY = "System-wide Performance Profiler for Linux"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ libglade"
+DEPENDS = "glib-2.0"
 
 SRCREV = "cd44ee6644c3641507fb53b8a2a69137f2971219"
 PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof \
            file://define-NT_GNU_BUILD_ID.patch \
+           file://gui-argument.patch \
           "
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
@@ -19,8 +20,10 @@ SRC_URI_append_mips64n32 = " file://rmb-mips.patch"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+inherit autotools pkgconfig
+
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK2DISTROFEATURES}', 'gui', '', d)}"
+PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ libglade"
 
 # We do not yet work for aarch64.
 #
-- 
2.2.1


