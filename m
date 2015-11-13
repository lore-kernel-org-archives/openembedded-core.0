Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8527727C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686878"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:04 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:57 +0200
Message-Id: <80cc3d9db9fee48837ea71f4f4efaa5f95842782.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 12/19] xserver-xorg: Upgrade 1.17.2 -> 1.18.0
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:04 -0000

* Remove glibc-guard patch: xserver no longer uses termio.h on linux
  in any case.
* Remove "--enable-glx-tls": this hasn't done anything since glapi
  was separated from glx
* Note that xserver no longer installs evdev configuration
  (evdev and/or libinput should do it instead)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  2 +-
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch | 31 ----------------------
 ...erver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} |  6 ++---
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 9881c94..c1d87a7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -133,7 +133,7 @@ PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86dripro
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 # DRI3 requires xshmfence to also be enabled
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
-PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,glproto virtual/libgl virtual/libx11"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
deleted file mode 100644
index 21e4ed4..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f242740f6488a25e6ca84968b0e2319a9a3975b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 20:52:50 -0700
-Subject: [PATCH] use __GLIBC__ guard for glibc specific code
-
-Using __linux__ is a tad bit wrong assumption since
-linux != glibc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hw/xfree86/os-support/xf86_OSlib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/xfree86/os-support/xf86_OSlib.h b/hw/xfree86/os-support/xf86_OSlib.h
-index eb0a338..c366ffc 100644
---- a/hw/xfree86/os-support/xf86_OSlib.h
-+++ b/hw/xfree86/os-support/xf86_OSlib.h
-@@ -178,7 +178,7 @@
- #include <sys/types.h>
- #include <assert.h>
- 
--#ifdef __linux__
-+#ifdef __GLIBC__
- #include <termio.h>
- #else                           /* __GLIBC__ */
- #include <termios.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
index 3039d30..6c48bb9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
@@ -1,9 +1,7 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
-           "
-SRC_URI[md5sum] = "397e405566651150490ff493e463f1ad"
-SRC_URI[sha256sum] = "f61120612728f2c5034671d0ca3e2273438c60aba93b3dda4a8aa40e6a257993"
+SRC_URI[md5sum] = "3c1c1057d3ad27380d8dd87ffcc182cd"
+SRC_URI[sha256sum] = "195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


