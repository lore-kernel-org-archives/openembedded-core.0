Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id C35017844A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 16:41:18 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y192so10695712pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aNxgzWJaeqt5aA7ZOTMR/eZ2hmuIJe4x+6BEVptgeGw=;
	b=UoFDRMJV94X98fQCayAcMwzCSvB0diTbXpureMbHBb/tdr7T4toRxae4ew+QX5ySe8
	xgh5ZirTnWo6GP08TA99463/Jz/UNsZdTI5czzLIcg1DLmpuar+wp8Eiwo71BZSA1TaL
	ajjh8RB40SXfCPzIgR38Qr2nG4sOVn6vmzGuW36uZa5t7G8f9BiZ0YnW86Cd0TIW1yCp
	hOW8Ku7LYb3S7gEGv+xR9+UA3V8Jt3HEDpjrJ2GuXS00x/idfaQR8NHY++NVXGOrs8lS
	0bP44m2P+KBJv/N+DIpiiA1G464+kEwsMUU6RzLdOnwj23OvMB1fnUUzrB7Zw1a7fhDR
	EOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aNxgzWJaeqt5aA7ZOTMR/eZ2hmuIJe4x+6BEVptgeGw=;
	b=RoXTLxThERHnJAFUcvSe3kQf48jqMx0It48xfaPkZkX269PlL6OTVg3+iOpM2Aliek
	xvwrpwAEzQhR5ai+6DVrxAUiD0ooHcJH/N6nIy5nyg8t5HUoJwSCeYemNIeFAWb4NLBS
	fHAFSwEuSedwqJT0peO8W4TIRc5g9q2WxyYUzcAp9w8LSVsZZC55CRA6iAKCmVqT1V+B
	kgrbJClRyPBy4aoA8tbtEHYzNsApLFP7cy+ZtbptA1bDSyRNaOHnu8UDUxAAk05S7TUb
	ZiK8hbz0bHWZJIL9kAw1pTCn6quNOLK8GhaulxnBMLAL9ICXEK/AoPLjhsakj76INIc/
	+AsA==
X-Gm-Message-State: AHYfb5jS4dYMRl7AOR6d7FyHvv+jYh9QGpmDPisDxkh9sO5vGQDPuI3c
	0M5Z3+F0HZeK30gL
X-Received: by 10.101.73.72 with SMTP id q8mr5635427pgs.219.1502988079744;
	Thu, 17 Aug 2017 09:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	f15sm6201616pgu.90.2017.08.17.09.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 09:41:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 09:41:08 -0700
Message-Id: <20170817164108.43467-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] systemd-boot: Move adjacent to systemd
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
X-List-Received-Date: Thu, 17 Aug 2017 16:41:18 -0000

We always forget to upgrade it when systemd is upgraded, keeping it
next to systemd will be an easy reminder to upgrade this recipe along
with systemd

Define EFI_CC, so far it has been using detection mechanism which
worked with gcc but falls back to native gcc when using non-gcc compiler
as default system compiler e.g. clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pper-instead-of-looking-for-relative-opti.patch | 40 ----------------------
 .../systemd/systemd-boot_234.bb}                   |  6 ++--
 2 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
 rename meta/{recipes-bsp/systemd-boot/systemd-boot_232.bb => recipes-core/systemd/systemd-boot_234.bb} (85%)

diff --git a/meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
deleted file mode 100644
index bc92db7468..0000000000
--- a/meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a3482c91642cf568b3ac27fa6c0cb3c6b30669b7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Nov 2016 19:32:14 -0800
-Subject: [PATCH 07/19] use lnr wrapper instead of looking for --relative
- option for ln
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am  | 2 +-
- configure.ac | 2 --
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -320,7 +320,7 @@ define install-relative-aliases
- 	while [ -n "$$1" ]; do \
- 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
- 		rm -f $(DESTDIR)$$dir/$$2 && \
--		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
-+		lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
- 		shift 2 || exit $$?; \
- 	done
- endef
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr
- AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
- AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
- 
--AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
--
- M4_DEFINES=
- 
- AC_CHECK_TOOL(OBJCOPY, objcopy)
diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb b/meta/recipes-core/systemd/systemd-boot_234.bb
similarity index 85%
rename from meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
rename to meta/recipes-core/systemd/systemd-boot_234.bb
index 0471ce246b..ed55e537eb 100644
--- a/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
+++ b/meta/recipes-core/systemd/systemd-boot_234.bb
@@ -1,12 +1,14 @@
-require recipes-core/systemd/systemd.inc
+require systemd.inc
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 
-SRC_URI += "file://0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
+SRC_URI += "file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
 
 inherit autotools pkgconfig gettext
 inherit deploy
 
+export EFI_CC="${CC}"
 # Man pages are packaged through the main systemd recipe
 EXTRA_OECONF = " --enable-gnuefi \
                  --with-efi-includedir=${STAGING_INCDIR} \
-- 
2.14.1


