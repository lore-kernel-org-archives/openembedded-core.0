Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 293E478883
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="29064568"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2018 00:34:57 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 81B8658030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:57 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:58 +0200
Message-Id: <1519029438-11092-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/27] libxcb: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:56 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This enables us to remove the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

1) xcbincludedir.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../xorg-lib/libxcb/xcbincludedir.patch            | 28 ----------------------
 meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch b/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
deleted file mode 100644
index 46297c3..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-As pkg-config --variable doesn't respect the sysroot, add the pkg-config sysroot
-to the beginning of variables that are used later on the host.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 94da4f7..d29cd6a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,7 +64,7 @@ AC_SUBST(NEEDED)
- 
- # Find the xcb-proto protocol descriptions
- AC_MSG_CHECKING(XCBPROTO_XCBINCLUDEDIR)
--XCBPROTO_XCBINCLUDEDIR=`$PKG_CONFIG --variable=xcbincludedir xcb-proto`
-+XCBPROTO_XCBINCLUDEDIR=$PKG_CONFIG_SYSROOT_DIR/`$PKG_CONFIG --variable=xcbincludedir xcb-proto`
- AC_MSG_RESULT($XCBPROTO_XCBINCLUDEDIR)
- AC_SUBST(XCBPROTO_XCBINCLUDEDIR)
- 
-@@ -74,7 +74,7 @@ AC_SUBST(XCBPROTO_VERSION)
- 
- # Find the xcbgen Python package
- AC_MSG_CHECKING(XCBPROTO_XCBPYTHONDIR)
--XCBPROTO_XCBPYTHONDIR=`$PKG_CONFIG --variable=pythondir xcb-proto`
-+XCBPROTO_XCBPYTHONDIR=$PKG_CONFIG_SYSROOT_DIR/`$PKG_CONFIG --variable=pythondir xcb-proto`
- AC_MSG_RESULT($XCBPROTO_XCBPYTHONDIR)
- AC_SUBST(XCBPROTO_XCBPYTHONDIR)
- 
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
index a38bdea..e1c461e 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
@@ -10,7 +10,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
-           file://xcbincludedir.patch \
            file://disable-check.patch \
            file://gcc-mips-pr68302-mips-workaround.patch \
            file://Fix-inconsistent-use-of-tabs-vs.-space.patch \
-- 
2.4.0


