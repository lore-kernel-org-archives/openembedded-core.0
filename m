Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F25A57F844
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:19:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y5so212970wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7F/VC6oStNAj8ttZ9y3q9i0TjT1wCLHrP3qejbjOh3I=;
	b=SRCOx+/FjYbsXgcno12eCQVI1x1oUbtyVHp91j/rCYFUirhK8euFeehLcNURxc0cd8
	ymxk2ICP4TBQDb6LQQE93M+I1CLmdwyNeYw/1LzS82Ikx6kKwYtO0tfkQGt+Lh81n4GE
	I6KQoh1ppOTq3CtJKUiNSM92sap5lQanz1ICKc4yzcUhzMrif8KiWuZLdlHZ70yKLEDK
	SAGHqT6hFNUTC6wtLDqEGZBLs9wL66Uf0czMFZ0ys2gsTtAmrqIFY+T9Ieo0bWK2bqyC
	pWGc+lAK1EzbtiunCg+gy27qSv2nNVDLugIKJycfArGM4GdMLNGsqWynQ9mIZVc4fe84
	VF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7F/VC6oStNAj8ttZ9y3q9i0TjT1wCLHrP3qejbjOh3I=;
	b=iot/q3Uc3K7fQl6fIhSGvj0RXgFlu5rVhDAg2Y3KDZ4qBkrkPv4Uy86c0VwOaOCBb1
	DyEkgetUyd/QUbbezTKSqdS1UL7IlRattCBmlL6Yab6VMDL2fp2aT2On+ZbD+6FGq0/9
	uF1Sqb06Z7t5lA8oXnwBARPXivtzkX2av2ToQ7BCeKioRfKfWkhLLnCDjc4VtpzpTXkO
	7S0SJUC4JDEVC/inmZAhaWtfM61lPS/CTWGd12boY6UzDJFUHwksqUPGQ761lGC7gYJ3
	EokPIp+XT6bHFi0IyEOC1+4p3VLywN02xAc5ZsX2MkQJ6Cea5Kb+rTrRn3FAp4rtRdDn
	xAdw==
X-Gm-Message-State: APjAAAWW7ZDtQaP5bYdI81tM79Z9p6QwTT/ohQq3T0SnCyFTM5GMe/oY
	qfJ+xLFLd4ubrjFmaz7S0N5Z2uFskSQ=
X-Google-Smtp-Source: APXvYqy29sEgG0i89l4HtFU/SI3u6uLi2PQN3ZUIzJLkQgH0Cwotw1Eb6EW1WzKrCk3NUx+XKkclVA==
X-Received: by 2002:a05:600c:20e:: with SMTP id
	14mr4076752wmi.107.1574266787284; 
	Wed, 20 Nov 2019 08:19:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c24sm36465909wrb.27.2019.11.20.08.19.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 08:19:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 16:19:41 +0000
Message-Id: <20191120161941.13360-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] rpm: use libgcrypt instead of NSS for cryptography
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
X-List-Received-Date: Wed, 20 Nov 2019 16:19:47 -0000
Content-Transfer-Encoding: 8bit

RPM 4.15 by default will use libgcrypt instead of NSS for cryptography
functions, but as we didn't have libgcrypt in DEPENDS it kept using NSS.

As RPM is the sole user of NSS/NSPR in oe-core, moving to libgcrypt can make a
noticable difference to build time.  For example, building rpm (and packaging it
as RPMs) from scratch is five minutes faster with libgcrypt.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../rpm/files/gcrypt-use-pkgconfig.patch      | 51 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  5 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch

diff --git a/meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch b/meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch
new file mode 100644
index 00000000000..8c72d2310b6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/gcrypt-use-pkgconfig.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/942]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 3f6cda568853bf7878df704adc75d4a78d75346c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 20 Nov 2019 13:06:51 +0000
+Subject: [PATCH] configure.ac: prefer pkg-config to find libgcrypt
+
+libgcrypt from 1.8.5 provides a pkg-config file as well as the traditional
+libgcrypt-config script.  As pkg-config is more resiliant in the face of
+complicated build environments (for example cross-compilation and sysroots)
+prefer the pkg-config file, falling back to libgcrypt-config if that doesn't
+exist.
+---
+ configure.ac | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0a3a9bbf4..6a3ea3615 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -395,14 +395,21 @@ AC_SUBST(WITH_OPENSSL_LIB)
+ WITH_LIBGCRYPT_INCLUDE=
+ WITH_LIBGCRYPT_LIB=
+ if test "$with_crypto" = libgcrypt ; then
+-AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
+-if test notfound != "$LIBGCRYPT_CONFIG" ; then
+-WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
+-WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
+-fi
+-if test -z "$WITH_LIBGCRYPT_LIB" ; then
+-AC_MSG_ERROR([libgcrypt not found])
+-fi
++  # libgcrypt 1.8.5 onwards ships a pkg-config file so prefer that
++  PKG_CHECK_MODULES([LIBGCRYPT], [libgcrypt], [have_libgcrypt=yes], [have_libgcrypt=no])
++  if test "$have_libgcrypt" = "yes"; then
++    WITH_LIBGCRYPT_INCLUDE="$LIBGCRYPT_CFLAGS"
++    WITH_LIBGCRYPT_LIB="$LIBGCRYPT_LIBS"
++  else
++    AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
++      if test notfound != "$LIBGCRYPT_CONFIG" ; then
++        WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
++        WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
++     fi
++     if test -z "$WITH_LIBGCRYPT_LIB" ; then
++       AC_MSG_ERROR([libgcrypt not found])
++    fi
++  fi
+ fi
+ 
+ AM_CONDITIONAL([WITH_LIBGCRYPT],[test "$with_crypto" = libgcrypt])
diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 4fa2d764fb9..f033cf33144 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
+           file://gcrypt-use-pkgconfig.patch \
            "
 
 PE = "1"
@@ -45,7 +46,7 @@ SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS = "libarchive libgcrypt db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
 inherit autotools gettext pkgconfig python3native
@@ -54,7 +55,7 @@ export PYTHON_ABI
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
 
-EXTRA_OECONF_append = " --without-lua --enable-python"
+EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=libgcrypt"
 EXTRA_OECONF_append_libc-musl = " --disable-nls"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.20.1


