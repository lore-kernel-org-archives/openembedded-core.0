Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBf-0001nO-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:55 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:21 -0700
Received: by mail-wi0-f177.google.com with SMTP id hn17so923629wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0rDSD/aFz46roZc/VIKlWUg1GOYIfWxhzM7WX69vJ1I=;
	b=JLfCyritqihPKUNiEXTO05lVANJkLlT1PAiNVCUaeJP520EzLwg4ZltvjQm8AMrl7D
	NEEyqvM0gb6GMUIsWG5K+yNP9amlMAqCQOdbconj6abWzZB0SyF5JPhW1q/EHgTdVctB
	1clDql0hYLwX3ACcQd/u+AuZxJFBbxgbbp9pfG5r3N7IKXO7h1IMBwAlyKAktjtux45T
	lT87Q1/lBDc6iMFb6691V429TTixW4j+CQynY8CC6Lcgf74Jme8aCSCIBZ8LPVcrN41/
	O0NUW5h8eueRkhWj3R2hHNjtXEaIYSRIg4XRuBQDTUahWnbZJ5R7rGO6dZq2XzFQPJRU
	zVKw==
Received: by 10.216.132.156 with SMTP id o28mr9948100wei.141.1347391160968;
	Tue, 11 Sep 2012 12:19:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:06 +0100
Message-Id: <1347391088-30390-16-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQndNREQtP+W50BcQ1EtQLG7O7F8V1airz3dEScq3MadOn/1wSEX18xniLns29jZsEBPWj4k
Subject: [RFC 16/18] libx11: makekeys can be cross-compiled now, so don't hack around
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:31:56 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    5 +--
 meta/recipes-graphics/xorg-lib/libx11.inc          |   43 ++++++--------------
 .../xorg-lib/libx11/x11_disable_makekeys.patch     |   34 ----------------
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    4 +-
 4 files changed, 16 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index cb9a5ef..0a90f46 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -3,10 +3,9 @@ require libx11.inc
 DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
-SRC_URI += "file://x11_disable_makekeys.patch \
-            file://X18NCMSstubs.diff \
+SRC_URI += "file://X18NCMSstubs.diff \
             file://keysymdef_include.patch \
             file://fix-disable-xlocale.diff \
             file://fix-utf8-wrong-define.patch \
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index d56aa23..3ecd9e5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,7 +11,7 @@ inherit siteinfo
 FILESPATH = "${FILE_DIRNAME}/libx11"
 
 PE = "1"
-INC_PR = "r7"
+INC_PR = "r8"
 
 PROVIDES = "virtual/libx11"
 
@@ -22,12 +22,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 DEPENDS += "xproto xextproto xtrans libxcb kbproto inputproto"
 DEPENDS += "xproto-native"
 
-PACKAGES =+ "${PN}-xcb"
-
-FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
-FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
-FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
-
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
 
 # Let people with incredibly archaic requirements enable Xcms and BigFont, but
@@ -36,29 +30,18 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 PACKAGECONFIG[bigfont] = "--enable-xf86bigfont,--disable-xf86bigfont,xf86bigfontproto"
 
-do_compile_prepend() {
-	cd ${S}/src/util
-	mv makekeys.c.orig makekeys.c || true
-	touch makekeys-makekeys.o
-	(
-		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
-		# MIN_REHASH 10 is only in 1.0.1
-		sed -i -e 's:MIN_REHASH 10:MIN_REHASH 16:g' makekeys.c
-		sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
-		touch makekeys-makekeys.o;
-		if [ "${SITEINFO_BITS}" == "64" ]; then
-			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -I${S}/include -o makekeys
-		else
-			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -I${S}/include -o makekeys
-		fi
-	)
-	if [ "$?" != "0" ]; then
-		exit 1
-	fi
-	# mv to stop it getting rebuilt
-	mv makekeys.c makekeys.c.orig
-	cd ../../
-}
+# src/util/makekeys needs to be compiled natively, so tell it what compiler to
+# use.
+export CC_FOR_BUILD = "${BUILD_CC}"
+export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
+export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
+export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
+
+PACKAGES =+ "${PN}-xcb"
+
+FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
+FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
+FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
 # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
 # A world build should only build the correct version, not all of them.
diff --git a/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
deleted file mode 100644
index 69f9e6c..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-Index: libX11-1.5.0/src/util/Makefile.am
-===================================================================
---- libX11-1.5.0.orig/src/util/Makefile.am
-+++ libX11-1.5.0/src/util/Makefile.am
-@@ -1,27 +1,2 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--makekeys_CPPFLAGS = \
--	-I$(top_srcdir)/include
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
- 
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 5a66eb5..793496c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -5,9 +5,7 @@ PR = "${INC_PR}.1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += " file://keysymdef_include.patch \
-             file://x11_disable_makekeys.patch \
-             "
+SRC_URI += "file://keysymdef_include.patch"
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
-- 
1.7.10



