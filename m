Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57E9473695
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 12:18:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 17 May 2016 05:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,324,1459839600"; d="scan'208";a="968683232"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2016 05:18:58 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 15:18:54 +0300
Message-Id: <257b5f2c23a52732f6a790690bc47403af894e6c.1463486899.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463470541.4578.7.camel@linuxfoundation.org>
References: <1463470541.4578.7.camel@linuxfoundation.org>
In-Reply-To: <cover.1463486899.git.jussi.kukkonen@intel.com>
References: <cover.1463486899.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] gnome-doc-utils: Update AM_GLIB_GNU_GETTEXT macro
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
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 40 ++++++++++++++++++++++
 .../recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
new file mode 100644
index 0000000..4cfcabd
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
@@ -0,0 +1,40 @@
+From 426e38468463a4abb495cf6a269b9635b2107519 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 17 May 2016 13:51:24 +0300
+Subject: [PATCH] glib-gettext.m4: Update AM_GLIB_GNU_GETTEXT to match glib
+
+This avoids
+  error: m4_copy: won't overwrite defined macro: glib_DEFUN
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Inappropriate [No upstream]
+---
+ m4/glib-gettext.m4 | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/m4/glib-gettext.m4 b/m4/glib-gettext.m4
+index 81f8fd2..e2b142b 100644
+--- a/m4/glib-gettext.m4
++++ b/m4/glib-gettext.m4
+@@ -310,7 +310,7 @@ msgstr ""
+ # on various variables needed by the Makefile.in.in installed by
+ # glib-gettextize.
+ dnl
+-glib_DEFUN([GLIB_GNU_GETTEXT],
++AU_DEFUN([GLIB_GNU_GETTEXT],
+   [AC_REQUIRE([AC_PROG_CC])dnl
+    AC_REQUIRE([AC_HEADER_STDC])dnl
+ 
+@@ -381,7 +381,8 @@ glib_DEFUN([GLIB_GNU_GETTEXT],
+    rm -f po/POTFILES
+    sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(.*\) \\\\/\1/" \
+ 	< $srcdir/po/POTFILES.in > po/POTFILES
+-  ])
++  ]
++  [[$0: This macro is deprecated. You should use upstream gettext instead.]])
+ 
+ # AX_GLIB_DEFINE_LOCALEDIR(VARIABLE)
+ # -------------------------------
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
index 78cc005..ed01ea7 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI += "file://xsltproc_nonet.patch \
             file://use-usr-bin-env-for-python-in-xml2po.patch \
             file://sysrooted-pkg-config.patch \
+            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
            "
 
 SRC_URI[archive.md5sum] = "3c64ad7bacd617b04999e4a168afaac5"
-- 
2.1.4


