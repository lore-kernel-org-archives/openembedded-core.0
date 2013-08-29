Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF116BECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:29:14 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id xa7so683752pbc.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t6vYYFL3M1tjJZhcLKHZmXtb4Dzu+ALGsFwCOml+65k=;
	b=QYVtYiguocepNp8rqpM5nS2nYr9da4txIYKeM0dJu6FnkE2QiLEBpEigzpBQRC1tBE
	aYO/bTlaYnf+CAEk4+QSWm8euplkErUmaaRtDtJtLtB0Zt8DHifWHqkmalS9G5MbWb+M
	xxS3BOUwiGSaEVmpmT5feLfIZhQwHZvwT70dgd0u18h14GM0oibCl1GHP/hC8Sz6oeAs
	bwo1KFsquu8APX5ouPFiZOR65pnNe/5Y+ZFPmyWJTbzGdhKa5HmEEVravT7tVUMM8xEU
	VnTWh4LGJwAHu1Q2wOQJIFRl+eNCrlGf54uzJVODxOx9Fe33yrmWEWqd/iXpVjNL4rNT
	MQhQ==
X-Received: by 10.68.223.161 with SMTP id qv1mr4741994pbc.79.1377793755478;
	Thu, 29 Aug 2013 09:29:15 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id oj6sm41942127pab.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:29:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 09:28:56 -0700
Message-Id: <1377793736-7995-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1377793736-7995-1-git-send-email-kergoth@gmail.com>
References: <1377793736-7995-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] gtk+3: pull forward the gtk+2 hardcoded libtool patch
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
X-List-Received-Date: Thu, 29 Aug 2013 16:29:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without this, it tries to run ./libtool, not the sys-prefixed libtool, which
fails, resulting in dynamic modules being disabled, which in turn results in
compiling the immodules directly into the gtk+3 library.

I tried switching it to using $LIBTOOL rather than hardcoding the path, as
LT_INIT sets LIBTOOL, but it didn't work, I didn't have time to dig further,
and this gets the job done for now.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../gtk+/gtk+3/hardcoded_libtool.patch             | 35 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
new file mode 100644
index 0000000..3b4beeb
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+Index: gtk+-3.8.2/configure.ac
+===================================================================
+--- gtk+-3.8.2.orig/configure.ac
++++ gtk+-3.8.2/configure.ac
+@@ -531,7 +531,7 @@ AC_MSG_CHECKING([Whether to write depend
+ case $enable_explicit_deps in
+   auto)
+     export SED
+-    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
++    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
+     if test "x$deplibs_check_method" != xpass_all || test "x$enable_static" = xyes ; then
+       enable_explicit_deps=yes
+     else
+@@ -793,7 +793,7 @@ else
+     dnl Now we check to see if our libtool supports shared lib deps
+     dnl (in a rather ugly way even)
+     if $dynworks; then
+-        module_libtool_config="${CONFIG_SHELL-/bin/sh} ./libtool --config"
++        module_libtool_config="${CONFIG_SHELL-/bin/sh} ./$host_alias-libtool --config"
+         module_deplibs_check=`$module_libtool_config | \
+             grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
+             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
+@@ -1528,7 +1528,7 @@ fi
+ # We are using gmodule-no-export now, but I'm leaving the stripping
+ # code in place for now, since pango and atk still require gmodule.
+ export SED
+-export_dynamic=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
++export_dynamic=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
+ if test -n "$export_dynamic"; then
+   GDK_DEP_LIBS=`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
+   GTK_DEP_LIBS=`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index d92d8f3..5db3745 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -3,6 +3,7 @@ require gtk+3.inc
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
+           file://hardcoded_libtool.patch \
            file://no-x11-in-wayland.patch \
            file://wayland-attach.patch"
 
-- 
1.8.3.4


