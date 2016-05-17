Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70AF076536
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 12:19:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 17 May 2016 05:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,324,1459839600"; d="scan'208";a="968683257"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2016 05:18:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 15:18:55 +0300
Message-Id: <844df63d8b30dbda86f842be7b16496d2f9130e0.1463486899.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <257b5f2c23a52732f6a790690bc47403af894e6c.1463486899.git.jussi.kukkonen@intel.com>
References: <1463470541.4578.7.camel@linuxfoundation.org>
	<257b5f2c23a52732f6a790690bc47403af894e6c.1463486899.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463486899.git.jussi.kukkonen@intel.com>
References: <cover.1463486899.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] pkgconfig: Update AM_GLIB_GNU_GETTEXT macro
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
X-List-Received-Date: Tue, 17 May 2016 12:19:01 -0000

This fixes
  error: m4_copy: won't overwrite defined macro: glib_DEFUN
with glib-2.0 >= 2.48.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 41 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
new file mode 100644
index 0000000..80310cd
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
@@ -0,0 +1,41 @@
+From e404e27de77d8b993c4cc87013d707200b3a5547 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 17 May 2016 13:26:27 +0300
+Subject: [PATCH] glib-gettext.m4: Update AM_GLIB_GNU_GETTEXT to match glib
+
+This avoids
+  error: m4_copy: won't overwrite defined macro: glib_DEFUN
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Pending
+
+---
+ glib/m4macros/glib-gettext.m4 | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/glib/m4macros/glib-gettext.m4 b/glib/m4macros/glib-gettext.m4
+index 5217fd8..155b1d8 100644
+--- a/glib/m4macros/glib-gettext.m4
++++ b/glib/m4macros/glib-gettext.m4
+@@ -313,7 +313,7 @@ msgstr ""
+ # on various variables needed by the Makefile.in.in installed by 
+ # glib-gettextize.
+ dnl
+-glib_DEFUN([GLIB_GNU_GETTEXT],
++AU_DEFUN([GLIB_GNU_GETTEXT],
+   [AC_REQUIRE([AC_PROG_CC])dnl
+    
+    GLIB_LC_MESSAGES
+@@ -383,7 +383,8 @@ glib_DEFUN([GLIB_GNU_GETTEXT],
+    rm -f po/POTFILES
+    sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(.*\) \\\\/\1/" \
+ 	< $srcdir/po/POTFILES.in > po/POTFILES
+-  ])
++  ],
++  [[$0: This macro is deprecated. You should use upstream gettext instead.]])
+ 
+ # AM_GLIB_DEFINE_LOCALEDIR(VARIABLE)
+ # -------------------------------
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 86503b5..ff8254c 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
            file://0001-gdate-Move-warning-pragma-outside-of-function.patch \
+           file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.1.4


