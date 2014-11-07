Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C896F60557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:52:20 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so3700969wiv.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=nZa5tG5fCaRw0mGAYj7aIHLO5RAJx2XDDYVLJf+jjso=;
	b=lHOP69r8AE+HaZ0zINnEJ56ciMjLcA+VbpseJno4tpvrOr2w/Y7YaLeKGtRxuUg0UE
	bxSYvWZGOC1wJKLHVjyz80qIfXkrZL3FC3sevVKHmpViNpGw5fqkBJL/YA3hYZ9YP7p9
	piC55gOV0xXboVgaq+4v7VDVNVYnK/pJGsAcS4Qp8xmfYdTWZV+TxQJvcWtb6zoIYlpk
	2vh/GgzSI4fItc0qha8Xr/4/TD0TqjAfl1i4sn6yIaNCU+tvL8VUhdSdcMIoitIs2KV+
	bkmhhEjQW/wHdHz/Log4nGQLnLUYIQGzpLUgU+8YjQgk9Q/I3T51VAJ7r+0OnfUkh/fo
	rCVA==
X-Received: by 10.180.93.195 with SMTP id cw3mr2414629wib.68.1415346740880;
	Thu, 06 Nov 2014 23:52:20 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id md11sm982653wic.15.2014.11.06.23.52.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Nov 2014 23:52:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 08:52:09 +0100
Message-Id: <1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] xserver-xorg: update to 1.16.1
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
X-List-Received-Date: Fri, 07 Nov 2014 07:52:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* first version supporting rootless X (not tested yet)
* modesetting working for non PCI gpus (tested on gumstix overo)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
 .../xserver-xorg/mips64-compiler.patch             | 29 ----------
 .../xorg-xserver/xserver-xorg/present-module.patch | 66 ----------------------
 ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.1.bb} |  9 +--
 4 files changed, 3 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb => xserver-xorg_1.16.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/configure.ac b/configure.ac
-index b3b752c..600500b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
- dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
- dnl compiling, assume default font path uses standard FONTROOTDIR directories.
- DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
--if test "$cross_compiling" != yes; then
--	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
--		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
--		[case $host_os in
-+		case $host_os in
- 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
--		esac])
--fi
-+		esac
- AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
- 				[ FONTPATH="$withval" ],
- 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
deleted file mode 100644
index 168368e..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
-so we end up with incompatible conversion errors
-
-This patch choses the right values for mips64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
-===================================================================
---- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
-+++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
-@@ -101,6 +101,7 @@
- #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
- #if !defined(__arm__)
- #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
-+      && !defined(__mips64) \
-       && !(defined(__alpha__) && defined(linux)) \
-       && !(defined(__ia64__) && defined(linux)) \
- 
-@@ -721,7 +722,7 @@
- }
- 
- #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#ifdef __arm32__
-+#if defined (__arm32__) || defined (__mips64)
- #define PORT_SIZE long
- #else
- #define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
deleted file mode 100644
index 13f3caf..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-[ YOCTO #6583 ]
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 746be5a03ebbda4ab411ca3efb2ed95f99e9ea46 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Wed, 28 May 2014 08:13:59 +0100
-Subject: xfree86: Report DRI3 as a built-in module
-
-This is so that drivers can do a runtime check that DRI3 is available,
-similar to existing runtime checks performed by the drivers for DRI and
-DRI2.
-
-v2: Only add DRI3 to the list if the module was actually built into the
-server (Mark Kettenis).
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Cc: Mark Kettenis <mark.kettenis@xs4all.nl>
-Signed-off-by: Keith Packard <keithp@keithp.com>
-
-diff --git a/hw/xfree86/loader/loadmod.c b/hw/xfree86/loader/loadmod.c
-index 092bf57..f92ad8d 100644
---- a/hw/xfree86/loader/loadmod.c
-+++ b/hw/xfree86/loader/loadmod.c
-@@ -838,6 +838,9 @@ static const char *compiled_in_modules[] = {
-     "extmod",
-     "dri",
-     "dri2",
-+#if DRI3
-+    "dri3",
-+#endif
-     NULL
- };
- 
--- 
-cgit v0.10.2
-
-
-From 7ca458493aa2f0aa091c989ea0768611e0730bf5 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Wed, 28 May 2014 08:14:00 +0100
-Subject: xfree86: Report Present as a built-in module
-
-This is so that drivers can do a runtime check that Present is available,
-similar to existing runtime checks performed by the drivers for DRI.
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Signed-off-by: Keith Packard <keithp@keithp.com>
-
-diff --git a/hw/xfree86/loader/loadmod.c b/hw/xfree86/loader/loadmod.c
-index f92ad8d..e1f649a 100644
---- a/hw/xfree86/loader/loadmod.c
-+++ b/hw/xfree86/loader/loadmod.c
-@@ -841,6 +841,9 @@ static const char *compiled_in_modules[] = {
- #if DRI3
-     "dri3",
- #endif
-+#if PRESENT
-+    "present",
-+#endif
-     NULL
- };
- 
--- 
-cgit v0.10.2
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.1.bb
index 3bba3ce..567b916 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.1.bb
@@ -1,16 +1,13 @@
 require xserver-xorg.inc
 
 # Misc build failure for master HEAD
-SRC_URI += "file://crosscompile.patch \
-            file://fix_open_max_preprocessor_error.patch \
-            file://mips64-compiler.patch \
+SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xorg-CVE-2013-6424.patch \
             file://xshmfence-option.patch \
-            file://present-module.patch \
            "
 
-SRC_URI[md5sum] = "e4c70262ed89764be8f8f5d699ed9227"
-SRC_URI[sha256sum] = "626db6882602ebe1ff81f7a4231c7ccc6ceb5032f2b5b3954bf749e1567221e2"
+SRC_URI[md5sum] = "b1ff364222e921d32de40c4786e8bc47"
+SRC_URI[sha256sum] = "f4677c6ec9fb7b59648321737087aeb9963b60bcea50ee3773fe46be1a37e060"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.8.3.1


