Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9666B6EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:28:13 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so680253pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WO95dgLHFC0DFTQoe7oj/SmOLeBcCrH+jPpRJJ3n1cg=;
	b=tH3t0ymUrUId/ulnUfyrS/tiE0nKOMk49/Ec8/hqSP1w9dhrAuL+vjc3sKg0bMxqQJ
	XsUTUncAQ6VY1MHZ8cuTVnt4OZoMHUkbDCw8RE6SozMrnvMnQZ5I4OyDVxegt2PdzOCz
	/rahdsoo8eAhYgBdbhQld/dup8GV5i5gkUNBkZs9XFsvb7eV7J9rgZz+G397xCuQ1IpE
	Ba9z3LApqYXjuCGNwPjGy5bf5x0fHO1hP0IF9olQVQm+WbiMRu7s+AkDNYu5K5HcH7NO
	LvoKMUvnG5v7uQtDK2SRRVc2iimfOEg7l5m8M2iE5fAcQONJ3ar3gmQd16+RXi4F5H9J
	ZTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WO95dgLHFC0DFTQoe7oj/SmOLeBcCrH+jPpRJJ3n1cg=;
	b=bUBg4ASqcYDXVsGgovim7GIovjSyfJYDnPMxNPmXgvNU1OzXDUIctJclC4kZwIuXYM
	9ZU/hmTZjB6jY/3rryhvemCOlc5B7jjqt2OIHyB+Nx69jHRiKX8IG4cLqaWsfF4aoIlR
	YwaUNfjJcfQVFL64ev+UxFWhyglzH1O4fpcBNjrPv/AoL0g72Wt2ZTVNrEXIvD4thasl
	9KfIcK8psmL7l4lUObGsU5DSMSs8zHnlrB36rDdI9vGe9HHsSW73dNLWkHTlwwNh5eCb
	vjXGTgnMeCS/3vDdO30JpCnh9guRU+xjYIBawssYUfhDnUYQDn+MlgJFtFKSIQlX4mMD
	FwJA==
X-Gm-Message-State: AKaTC02mdPghJaLOmuLGIODQgOHaflLJxD8nDJTyy8kuklpPvmdH/6yaNW72sp0HZ8UIEQ==
X-Received: by 10.84.217.222 with SMTP id d30mr4654807plj.92.1479893293903;
	Wed, 23 Nov 2016 01:28:13 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c22sm33216727pgn.12.2016.11.23.01.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:28:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:28:07 -0800
Message-Id: <20161123092807.28693-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092807.28693-1-raj.khem@gmail.com>
References: <20161123092807.28693-1-raj.khem@gmail.com>
Subject: [PATCH V3 2/2] systemd: Upgrade to 232
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
X-List-Received-Date: Wed, 23 Nov 2016 09:28:13 -0000

* Drop support for rcS.d SysV init scripts.
  These are prone to cause dependency loops, and almost all packages with
  rcS scripts now ship a native systemd service.

* Drop mount propagation patch, it only happens with libseccomp, OE doesnt
  enable it

* kdbus option has disappeared from configure

* Ignore dev-so for PN now since systemd introduced private .so see
  https://github.com/systemd/systemd/issues/3810

* Add libnss* to PACKAGES_DYNAMIC for libnss-resolve to work correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc              |   4 +-
 ....c-Change-the-default-device-timeout-to-2.patch |   8 +-
 ...r-getty-to-agetty-in-console-setup-system.patch |  10 +-
 .../systemd/0003-define-exp10-if-missing.patch     |  12 +-
 ...nv-when-secure-versions-are-not-available.patch |  21 ++--
 ...t-install-dependency-links-at-install-tim.patch |  10 +-
 ...heck-for-additional-features-that-uclibc-.patch |  10 +-
 ...pper-instead-of-looking-for-relative-opti.patch |  38 ++----
 ...wn-Use-execvpe-only-when-libc-supports-it.patch |  16 +--
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |  27 +++--
 ...0010-implment-systemd-sysv-install-for-OE.patch |   6 +-
 ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  12 +-
 .../systemd/0012-rules-whitelist-hd-devices.patch  |  21 ++--
 ...-Make-root-s-home-directory-configurable.patch} |  90 +++++---------
 ...tor-add-support-for-executing-scripts-und.patch | 133 ---------------------
 ...vert-rules-remove-firmware-loading-rules.patch} |   6 +-
 ...remove-userspace-firmware-loading-suppor.patch} |  58 +++++----
 ...0015-systemd-user-avoid-using-system-auth.patch |  35 ------
 ...patch => 0016-make-test-dir-configurable.patch} |  21 ++--
 ...=> 0017-remove-duplicate-include-uchar.h.patch} |  10 +-
 ...h => 0018-check-for-uchar.h-in-configure.patch} |  16 ++-
 ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  20 ++--
 ...sing.h-for-getting-secure_getenv-definiti.patch |  27 -----
 .../systemd/systemd/CVE-2016-7795.patch            |  69 -----------
 ...dev-re-enable-mount-propagation-for-udevd.patch |  31 -----
 .../systemd/{systemd_230.bb => systemd_232.bb}     |  24 ++--
 26 files changed, 196 insertions(+), 539 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0014-Make-root-s-home-directory-configurable.patch => 0013-Make-root-s-home-directory-configurable.patch} (66%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
 rename meta/recipes-core/systemd/systemd/{0016-Revert-rules-remove-firmware-loading-rules.patch => 0014-Revert-rules-remove-firmware-loading-rules.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (89%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
 rename meta/recipes-core/systemd/systemd/{0018-make-test-dir-configurable.patch => 0016-make-test-dir-configurable.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0019-remove-duplicate-include-uchar.h.patch => 0017-remove-duplicate-include-uchar.h.patch} (81%)
 rename meta/recipes-core/systemd/systemd/{0020-check-for-uchar.h-in-configure.patch => 0018-check-for-uchar.h-in-configure.patch} (76%)
 rename meta/recipes-core/systemd/systemd/{0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (69%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
 rename meta/recipes-core/systemd/{systemd_230.bb => systemd_232.bb} (96%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f800f42..29e0be6 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,12 +14,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "3a74d4fc90cb322a4784a3515bef7118c8f8c5ba"
+SRCREV = "a1e2ef7ec912902d8142e7cb5830cbfb47dba86c"
 
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
 
-PV = "230+git${SRCPV}"
-
 S = "${WORKDIR}/git"
 
 LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
index f7ef7a3..ee2cd6c 100644
--- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,7 +1,7 @@
-From 3bc4552117879f57522b5972b724729ca993f1ea Mon Sep 17 00:00:00 2001
+From a544d6d15f5c418084f322349aafe341128d5fca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 04:09:19 +0000
-Subject: [PATCH 01/36] core/device.c: Change the default device timeout to 240
+Subject: [PATCH 01/19] core/device.c: Change the default device timeout to 240
  sec.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/device.c b/src/core/device.c
-index d201dc5..340d62a 100644
+index c572a67..f90774e 100644
 --- a/src/core/device.c
 +++ b/src/core/device.c
 @@ -112,7 +112,7 @@ static void device_init(Unit *u) {
@@ -29,5 +29,5 @@ index d201dc5..340d62a 100644
          u->ignore_on_isolate = true;
  }
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
index 28939eb..951a28d 100644
--- a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
+++ b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
@@ -1,7 +1,7 @@
-From e5f405aba347d216e7f2b73d7dd681b13be442e3 Mon Sep 17 00:00:00 2001
+From 8736d9b9bb492f60e8f3a1a7fb5a05ba3201d86b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:29:15 +0000
-Subject: [PATCH 02/36] units: Prefer getty to agetty in console setup systemd
+Subject: [PATCH 02/19] units: Prefer getty to agetty in console setup systemd
  units
 
 Upstream-Status: Inappropriate [configuration specific]
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/units/getty@.service.m4 b/units/getty@.service.m4
-index 46164ab..bdf6ec8 100644
+index 5b82c13..e729469 100644
 --- a/units/getty@.service.m4
 +++ b/units/getty@.service.m4
-@@ -27,7 +27,7 @@ ConditionPathExists=/dev/tty0
+@@ -33,7 +33,7 @@ ConditionPathExists=/dev/tty0
  
  [Service]
  # the VT is cleared by TTYVTDisallocate
@@ -40,5 +40,5 @@ index 4522d0d..e6d499d 100644
  Restart=always
  UtmpIdentifier=%I
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
index e62d580..37c6ac5 100644
--- a/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
+++ b/meta/recipes-core/systemd/systemd/0003-define-exp10-if-missing.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 03/36] define exp10 if missing
+From b383c286f58184575216b2bf6f185ba2ad648956 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Nov 2016 19:25:45 -0800
+Subject: [PATCH 03/19] define exp10 if missing
 
 Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
 
@@ -8,16 +11,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/basic/missing.h | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index 651e414..fafa233 100644
+index 4c013be..4a3fd9c 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -1013,4 +1013,9 @@ typedef int32_t key_serial_t;
+@@ -1078,4 +1078,9 @@ typedef int32_t key_serial_t;
  
  #endif
  
@@ -28,5 +30,5 @@ index 651e414..fafa233 100644
 +
  #include "missing_syscall.h"
 -- 
-2.8.3
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
index 989a1fa..ab2cbe0 100644
--- a/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0004-Use-getenv-when-secure-versions-are-not-available.patch
@@ -1,7 +1,7 @@
-From bb8d8148b16572ae17d3c308552cf73915386b05 Mon Sep 17 00:00:00 2001
+From 5765cda4f7243e240b1e8723dc536fb20503d544 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 12 Sep 2015 19:10:04 +0000
-Subject: [PATCH 04/36] Use getenv when secure versions are not available
+Date: Wed, 9 Nov 2016 19:28:32 -0800
+Subject: [PATCH 04/19] Use getenv when secure versions are not available
 
 musl doesnt implement secure version, so we default
 to it if configure does not detect a secure imeplementation
@@ -9,19 +9,14 @@ to it if configure does not detect a secure imeplementation
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Denied
 ---
- src/basic/missing.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ src/basic/missing.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index ee7e7ea..3170429 100644
+index 4a3fd9c..4936873 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -585,12 +585,11 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
-         return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_id, flags);
- }
- #endif
--
- #ifndef HAVE_SECURE_GETENV
+@@ -529,7 +529,7 @@ struct btrfs_ioctl_quota_ctl_args {
  #  ifdef HAVE___SECURE_GETENV
  #    define secure_getenv __secure_getenv
  #  else
@@ -31,5 +26,5 @@ index ee7e7ea..3170429 100644
  #endif
  
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index f69e26e..7016e98 100644
--- a/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,7 +1,7 @@
-From 3436b12d40bf4f4ab7e3e16600e5f6c35a470da4 Mon Sep 17 00:00:00 2001
+From 74450f0dbad2f8478c26eeaa46d4e4a987858f45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:03:44 +0000
-Subject: [PATCH 05/36] binfmt: Don't install dependency links at install time
+Subject: [PATCH 05/19] binfmt: Don't install dependency links at install time
  for the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
@@ -24,10 +24,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 03341fc..629740f 100644
+index 50da458..29ed1dd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -4387,10 +4387,6 @@ INSTALL_DIRS += \
+@@ -4635,10 +4635,6 @@ INSTALL_DIRS += \
  	$(prefix)/lib/binfmt.d \
  	$(sysconfdir)/binfmt.d
  
@@ -70,5 +70,5 @@ index d53073e..8c57ee0 100644
 +[Install]
 +WantedBy=sysinit.target
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
index 0d63755..43a0d3f 100644
--- a/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
+++ b/meta/recipes-core/systemd/systemd/0006-configure-Check-for-additional-features-that-uclibc-.patch
@@ -1,7 +1,7 @@
-From bb6f1d8a000b337280541afde7cccdcfe03cdeb1 Mon Sep 17 00:00:00 2001
+From 82d837b76618a773485b96e38b7b91083a7437e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 05:05:45 +0000
-Subject: [PATCH 06/36] configure: Check for additional features that uclibc
+Subject: [PATCH 06/19] configure: Check for additional features that uclibc
  doesnt support
 
 This helps in supporting uclibc which does not have all features that
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index f51533c..0239fd0 100644
+index 7f6b3b9..7c4b5a2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -112,6 +112,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
+@@ -110,6 +110,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin]
  
  AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
  
@@ -44,5 +44,5 @@ index f51533c..0239fd0 100644
  
  AC_CHECK_TOOL(OBJCOPY, objcopy)
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
index 12f6ace..fad69a5 100644
--- a/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
+++ b/meta/recipes-core/systemd/systemd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -1,31 +1,22 @@
-From fa5e137fbd2fb081ae897575377d718ee8cb6349 Mon Sep 17 00:00:00 2001
+From a3482c91642cf568b3ac27fa6c0cb3c6b30669b7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Dec 2015 04:20:28 +0000
-Subject: [PATCH 07/36] use lnr wrapper instead of looking for --relative
+Date: Wed, 9 Nov 2016 19:32:14 -0800
+Subject: [PATCH 07/19] use lnr wrapper instead of looking for --relative
  option for ln
 
 Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile.am  | 6 +++---
+ Makefile.am  | 2 +-
  configure.ac | 2 --
- 2 files changed, 3 insertions(+), 5 deletions(-)
+ 2 files changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 629740f..82b6553 100644
+index 29ed1dd..02f4017 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -243,7 +243,7 @@ define move-to-rootlibdir
- 		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
- 		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
- 		rm -f $(DESTDIR)$(libdir)/$$libname && \
--		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
-+		lnr $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
- 		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
- 	fi
- endef
-@@ -317,7 +317,7 @@ define install-relative-aliases
+@@ -320,7 +320,7 @@ define install-relative-aliases
  	while [ -n "$$1" ]; do \
  		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
  		rm -f $(DESTDIR)$$dir/$$2 && \
@@ -34,20 +25,11 @@ index 629740f..82b6553 100644
  		shift 2 || exit $$?; \
  	done
  endef
-@@ -2781,7 +2781,7 @@ systemd_dbus1_generator_LDADD = \
- dbus1-generator-install-hook:
- 	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
- 	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
--	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
-+	$(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
- 
- dbus1-generator-uninstall-hook:
- 	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
 diff --git a/configure.ac b/configure.ac
-index 0239fd0..c5ab9d0 100644
+index 7c4b5a2..b10c952 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+@@ -108,8 +108,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
  AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
  AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
  
@@ -57,5 +39,5 @@ index 0239fd0..c5ab9d0 100644
  
  AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
index 6e6f199..586b5aa 100644
--- a/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
+++ b/meta/recipes-core/systemd/systemd/0008-nspawn-Use-execvpe-only-when-libc-supports-it.patch
@@ -1,7 +1,7 @@
-From ae999ff50efb9cc82537adef7696c6f732afcfc8 Mon Sep 17 00:00:00 2001
+From 96026a3763264eb41a2c3e374f232f6e543284a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:10:37 +0000
-Subject: [PATCH 08/36] nspawn: Use execvpe only when libc supports it
+Date: Wed, 9 Nov 2016 19:33:49 -0800
+Subject: [PATCH 08/19] nspawn: Use execvpe only when libc supports it
 
 Upstream-Status: Denied [no desire for uclibc support]
 
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 5a68fec..65e65ec 100644
+index 9b9ae90..19b47cd 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -111,6 +111,8 @@ typedef enum LinkJournal {
+@@ -123,6 +123,8 @@ typedef enum LinkJournal {
          LINK_GUEST
  } LinkJournal;
  
@@ -23,7 +23,7 @@ index 5a68fec..65e65ec 100644
  static char *arg_directory = NULL;
  static char *arg_template = NULL;
  static char *arg_chdir = NULL;
-@@ -2637,7 +2639,12 @@ static int inner_child(
+@@ -2871,7 +2873,12 @@ static int inner_child(
                  a[0] = (char*) "/sbin/init";
                  execve(a[0], a, env_use);
          } else if (!strv_isempty(arg_parameters))
@@ -35,7 +35,7 @@ index 5a68fec..65e65ec 100644
 +#endif /* HAVE_EXECVPE */
          else {
                  if (!arg_chdir)
-                         chdir(home ?: "/root");
+                         /* If we cannot change the directory, we'll end up in /, that is expected. */
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
index 116f3d4..f150bb0 100644
--- a/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
+++ b/meta/recipes-core/systemd/systemd/0009-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
@@ -1,7 +1,7 @@
-From 3498f488b27f90398d7c8d1d06aac5ab684370e8 Mon Sep 17 00:00:00 2001
+From 085c8b6f253726ad547e7be84ff3f2b99701488b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2015 00:47:53 +0000
-Subject: [PATCH 09/36] util: bypass unimplemented _SC_PHYS_PAGES system
+Date: Wed, 9 Nov 2016 19:38:07 -0800
+Subject: [PATCH 09/19] util: bypass unimplemented _SC_PHYS_PAGES system
  configuration API on uclibc
 
 Upstream-Status: Inappropriate [uclibc-specific]
@@ -12,12 +12,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 15 insertions(+)
 
 diff --git a/src/basic/util.c b/src/basic/util.c
-index ea1bed7..fdaf340 100644
+index c1b5ca1..4c62d43 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -767,10 +767,25 @@ uint64_t physical_memory(void) {
-         /* We return this as uint64_t in case we are running as 32bit
-          * process on a 64bit kernel with huge amounts of memory */
+@@ -742,6 +742,20 @@ uint64_t physical_memory(void) {
+          * In order to support containers nicely that have a configured memory limit we'll take the minimum of the
+          * physically reported amount of memory and the limit configured for the root cgroup, if there is any. */
  
 +#ifdef __UCLIBC__
 +        char line[128];
@@ -33,14 +33,17 @@ index ea1bed7..fdaf340 100644
 +        fclose(f);
 +        return (uint64_t) mem;
 +#else
-         mem = sysconf(_SC_PHYS_PAGES);
-         assert(mem > 0);
+         sc = sysconf(_SC_PHYS_PAGES);
+         assert(sc > 0);
  
-         return (uint64_t) mem * (uint64_t) page_size();
+@@ -762,6 +776,7 @@ uint64_t physical_memory(void) {
+         lim *= ps;
+ 
+         return MIN(mem, lim);
 +#endif
  }
  
- int update_reboot_param_file(const char *param) {
+ uint64_t physical_memory_scale(uint64_t v, uint64_t max) {
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
index 75fa3a5..8828d6e 100644
--- a/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0010-implment-systemd-sysv-install-for-OE.patch
@@ -1,7 +1,7 @@
-From 5f94f5ad46c1ded54c3797979d384e4c1eb77bb0 Mon Sep 17 00:00:00 2001
+From 52726be92e2b841f744a96c378cc872ae0033a2b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 10/36] implment systemd-sysv-install for OE
+Subject: [PATCH 10/19] implment systemd-sysv-install for OE
 
 Use update-rc.d for enabling/disabling and status command
 to check the status of the sysv service
@@ -39,5 +39,5 @@ index a53a3e6..5d877b0 100755
      *)
          usage ;;
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
index 34ae645..b01ae97 100644
--- a/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
+++ b/meta/recipes-core/systemd/systemd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
@@ -1,7 +1,7 @@
-From 2b2450f6b7197bff4637c0283e8784500471d083 Mon Sep 17 00:00:00 2001
+From 3f6f45578b828e414f50c6822375073e7174236a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 00:50:01 +0000
-Subject: [PATCH 11/36] nss-mymachines: Build conditionally when
+Subject: [PATCH 11/19] nss-mymachines: Build conditionally when
  HAVE_MYHOSTNAME is set
 
 Fixes build failures when building with --disable-myhostname
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 82b6553..b3f3343 100644
+index 02f4017..420e0e0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -4876,6 +4876,7 @@ SYSTEM_UNIT_ALIASES += \
+@@ -5146,6 +5146,7 @@ SYSTEM_UNIT_ALIASES += \
  BUSNAMES_TARGET_WANTS += \
  	org.freedesktop.machine1.busname
  
@@ -25,7 +25,7 @@ index 82b6553..b3f3343 100644
  libnss_mymachines_la_SOURCES = \
  	src/nss-mymachines/nss-mymachines.sym \
  	src/nss-mymachines/nss-mymachines.c
-@@ -4896,6 +4897,7 @@ lib_LTLIBRARIES += \
+@@ -5167,6 +5168,7 @@ rootlib_LTLIBRARIES += \
  	libnss_mymachines.la
  
  endif
@@ -34,5 +34,5 @@ index 82b6553..b3f3343 100644
  polkitpolicy_in_files += \
  	src/machine/org.freedesktop.machine1.policy.in
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
index 6143088..8666bdc 100644
--- a/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
+++ b/meta/recipes-core/systemd/systemd/0012-rules-whitelist-hd-devices.patch
@@ -1,7 +1,7 @@
-From 5ebc0d87565a73710dea602c00b1586d5a1364e5 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Wed, 16 Sep 2015 13:55:58 +0200
-Subject: [PATCH 12/36] rules: whitelist hd* devices
+From 8cc1ae11f54dcc38ee2168b0f99703b835dd3942 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Nov 2016 19:41:13 -0800
+Subject: [PATCH 12/19] rules: whitelist hd* devices
 
 qemu by default emulates IDE and the linux-yocto kernel(s) use
 CONFIG_IDE instead of the more modern libsata, so disks appear as
@@ -10,23 +10,24 @@ CONFIG_IDE instead of the more modern libsata, so disks appear as
 Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  rules/60-persistent-storage.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
-index 0b14bb4..1c4d97a 100644
+index c13d05c..b14fbed 100644
 --- a/rules/60-persistent-storage.rules
 +++ b/rules/60-persistent-storage.rules
-@@ -6,7 +6,7 @@
- ACTION=="remove", GOTO="persistent_storage_end"
+@@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
+ ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="persistent_storage_end"
  
  SUBSYSTEM!="block", GOTO="persistent_storage_end"
--KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"
-+KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|hd*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"
+-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*", GOTO="persistent_storage_end"
++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|hd*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*|scm*|pmem*", GOTO="persistent_storage_end"
  
  # ignore partitions that span the entire disk
  TEST=="whole_disk", GOTO="persistent_storage_end"
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
similarity index 66%
rename from meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
rename to meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
index 2eea0ff..2b33337 100644
--- a/meta/recipes-core/systemd/systemd/0014-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Make-root-s-home-directory-configurable.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 14/36] Make root's home directory configurable
+From 79e64a07840e0d97d66e46111f1c086bf83981b7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Nov 2016 20:35:30 -0800
+Subject: [PATCH 13/19] Make root's home directory configurable
 
 OpenEmbedded has a configurable home directory for root. Allow
 systemd to be built using its idea of what root's home directory
@@ -11,23 +14,20 @@ https://github.com/systemd/systemd/issues/541
 
 Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
- Makefile.am                       | 2 ++
- configure.ac                      | 7 +++++++
- src/basic/user-util.c             | 4 ++--
- src/core/namespace.c              | 2 +-
- src/nspawn/nspawn.c               | 4 ++--
- units/console-shell.service.m4.in | 4 ++--
- units/emergency.service.in        | 4 ++--
- units/rescue.service.in           | 4 ++--
- 8 files changed, 20 insertions(+), 11 deletions(-)
+ Makefile.am                | 2 ++
+ configure.ac               | 7 +++++++
+ src/basic/user-util.c      | 4 ++--
+ src/nspawn/nspawn.c        | 4 ++--
+ units/emergency.service.in | 4 ++--
+ units/rescue.service.in    | 4 ++--
+ 6 files changed, 17 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 305099a..88c1250 100644
+index 420e0e0..3010b01 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -206,6 +206,7 @@ AM_CPPFLAGS = \
+@@ -213,6 +213,7 @@ AM_CPPFLAGS = \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
@@ -35,8 +35,8 @@ index 305099a..88c1250 100644
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
  	-I $(top_builddir)/src/basic \
-@@ -5863,6 +5864,7 @@ EXTRA_DIST += \
- substitutions = \
+@@ -6057,6 +6058,7 @@ substitutions = \
+        '|rootlibdir=$(rootlibdir)|' \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
 +       '|roothomedir=$(roothomedir)|' \
@@ -44,10 +44,10 @@ index 305099a..88c1250 100644
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
 diff --git a/configure.ac b/configure.ac
-index 329861a..01764f5 100644
+index b10c952..dfc0bd3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1478,6 +1478,11 @@ AC_ARG_WITH([rootlibdir],
+@@ -1513,6 +1513,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
  AX_NORMALIZE_PATH([with_rootlibdir])
  
@@ -59,7 +59,7 @@ index 329861a..01764f5 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1562,6 +1567,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1598,6 +1603,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
@@ -67,7 +67,7 @@ index 329861a..01764f5 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1653,6 +1659,7 @@ AC_MSG_RESULT([
+@@ -1688,6 +1694,7 @@ AC_MSG_RESULT([
          includedir:                        ${includedir}
          lib dir:                           ${libdir}
          rootlib dir:                       ${with_rootlibdir}
@@ -76,10 +76,10 @@ index 329861a..01764f5 100644
          SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
          Build Python:                      ${PYTHON}
 diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index f65ca3e..da1101a 100644
+index 938533d..3f9fdc4 100644
 --- a/src/basic/user-util.c
 +++ b/src/basic/user-util.c
-@@ -123,7 +123,7 @@ int get_user_creds(
+@@ -127,7 +127,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -88,7 +88,7 @@ index f65ca3e..da1101a 100644
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -354,7 +354,7 @@ int get_home_dir(char **_h) {
+@@ -387,7 +387,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -97,24 +97,11 @@ index f65ca3e..da1101a 100644
                  if (!h)
                          return -ENOMEM;
  
-diff --git a/src/core/namespace.c b/src/core/namespace.c
-index 203d122..45c0d11 100644
---- a/src/core/namespace.c
-+++ b/src/core/namespace.c
-@@ -415,7 +415,7 @@ int setup_namespace(
-                         home_dir = strjoina("-", home_dir);
-                         run_user_dir = prefix_roota(root_directory, "/run/user");
-                         run_user_dir = strjoina("-", run_user_dir);
--                        root_dir = prefix_roota(root_directory, "/root");
-+                        root_dir = prefix_roota(root_directory, ROOTHOMEDIR);
-                         root_dir = strjoina("-", root_dir);
- 
-                         r = append_mounts(&m, STRV_MAKE(home_dir, run_user_dir, root_dir),
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 8ec0584..51df00b 100644
+index 19b47cd..e42bf19 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2739,7 +2739,7 @@ static int inner_child(
+@@ -2798,7 +2798,7 @@ static int inner_child(
          if (envp[n_env])
                  n_env++;
  
@@ -123,7 +110,7 @@ index 8ec0584..51df00b 100644
              (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
              (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
                  return log_oom();
-@@ -2816,7 +2816,7 @@ static int inner_child(
+@@ -2882,7 +2882,7 @@ static int inner_child(
          else {
                  if (!arg_chdir)
                          /* If we cannot change the directory, we'll end up in /, that is expected. */
@@ -132,23 +119,8 @@ index 8ec0584..51df00b 100644
  
                  execle("/bin/bash", "-bash", NULL, env_use);
                  execle("/bin/sh", "-sh", NULL, env_use);
-diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
-index a345ec2..3caae7d 100644
---- a/units/console-shell.service.m4.in
-+++ b/units/console-shell.service.m4.in
-@@ -15,8 +15,8 @@ After=rc-local.service
- Before=getty.target
- 
- [Service]
--Environment=HOME=/root
--WorkingDirectory=-/root
-+Environment=HOME=@roothomedir@
-+WorkingDirectory=-@roothomedir@
- ExecStart=-@SULOGIN@
- ExecStopPost=-@SYSTEMCTL@ poweroff
- Type=idle
 diff --git a/units/emergency.service.in b/units/emergency.service.in
-index 0de16f2..4826062 100644
+index da68eb8..e25f879 100644
 --- a/units/emergency.service.in
 +++ b/units/emergency.service.in
 @@ -15,8 +15,8 @@ Conflicts=syslog.socket
@@ -160,10 +132,10 @@ index 0de16f2..4826062 100644
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=-@roothomedir@
  ExecStartPre=-/bin/plymouth --wait quit
- ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
+ ExecStartPre=-/bin/echo -e 'You are in emergency mode. After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
 diff --git a/units/rescue.service.in b/units/rescue.service.in
-index 92553f6..590ae17 100644
+index 5feff69..a83439e 100644
 --- a/units/rescue.service.in
 +++ b/units/rescue.service.in
 @@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
@@ -174,9 +146,9 @@ index 92553f6..590ae17 100644
 -WorkingDirectory=-/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=-@roothomedir@
- ExecStartPre=-/bin/plymouth quit
- ExecStartPre=-/bin/echo -e 'Welcome to rescue mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
+ ExecStartPre=-/bin/plymouth --wait quit
+ ExecStartPre=-/bin/echo -e 'You are in rescue mode. After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
  ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
 -- 
-2.8.3
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
deleted file mode 100644
index ac67f65..0000000
--- a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 6736de4a3caf9a0b3c888c6cc05103ab1b86907d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2015 05:09:53 +0000
-Subject: [PATCH 13/36] sysv-generator: add support for executing scripts under
- /etc/rcS.d/
-
-To be compatible, all services translated from scripts under /etc/rcS.d would
-run before services translated from scripts under /etc/rcN.d.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sysv-generator/sysv-generator.c | 47 ++++++++++++++++++++++++++++---------
- 1 file changed, 36 insertions(+), 11 deletions(-)
-
-diff --git a/src/sysv-generator/sysv-generator.c b/src/sysv-generator/sysv-generator.c
-index b5925a4..ea06d6a 100644
---- a/src/sysv-generator/sysv-generator.c
-+++ b/src/sysv-generator/sysv-generator.c
-@@ -44,7 +44,8 @@
- 
- typedef enum RunlevelType {
-         RUNLEVEL_UP,
--        RUNLEVEL_DOWN
-+        RUNLEVEL_DOWN,
-+        RUNLEVEL_SYSINIT
- } RunlevelType;
- 
- static const struct {
-@@ -59,6 +60,9 @@ static const struct {
-         { "rc4.d",  SPECIAL_MULTI_USER_TARGET, RUNLEVEL_UP },
-         { "rc5.d",  SPECIAL_GRAPHICAL_TARGET,  RUNLEVEL_UP },
- 
-+        /* Debian style rcS.d, also adopted by OE */
-+        { "rcS.d",  SPECIAL_SYSINIT_TARGET,   RUNLEVEL_SYSINIT},
-+
-         /* Standard SysV runlevels for shutdown */
-         { "rc0.d",  SPECIAL_POWEROFF_TARGET,  RUNLEVEL_DOWN },
-         { "rc6.d",  SPECIAL_REBOOT_TARGET,    RUNLEVEL_DOWN }
-@@ -67,7 +71,7 @@ static const struct {
-            directories in this order, and we want to make sure that
-            sysv_start_priority is known when we first load the
-            unit. And that value we only know from S links. Hence
--           UP must be read before DOWN */
-+           UP/SYSINIT must be read before DOWN */
- };
- 
- static const char *arg_dest = "/tmp";
-@@ -86,6 +90,8 @@ typedef struct SysvStub {
-         bool has_lsb;
-         bool reload;
-         bool loaded;
-+        bool default_dependencies;
-+        bool from_rcsd;
- } SysvStub;
- 
- static void free_sysvstub(SysvStub *s) {
-@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
-                 if (s->has_lsb && other->has_lsb)
-                         continue;
- 
--                if (other->sysv_start_priority < s->sysv_start_priority) {
--                        r = strv_extend(&s->after, other->name);
-+                /* All scripts under /etc/rcS.d should execute before scripts under
-+                 * /etc/rcN.d */
-+                if (!other->from_rcsd && s->from_rcsd) {
-+                        r = strv_extend(&s->before, other->name);
-                         if (r < 0)
-                                 return log_oom();
- 
--                } else if (other->sysv_start_priority > s->sysv_start_priority) {
--                        r = strv_extend(&s->before, other->name);
-+                } else if (other->from_rcsd && !s->from_rcsd) {
-+                        r = strv_extend(&s->after, other->name);
-                         if (r < 0)
-                                 return log_oom();
--                } else
--                        continue;
-+                } else {
-+                        if (other->sysv_start_priority < s->sysv_start_priority) {
-+                                r = strv_extend(&s->after, other->name);
-+                                if (r < 0)
-+                                        return log_oom();
-+                        }
-+                        else if (other->sysv_start_priority > s->sysv_start_priority) {
-+                                r = strv_extend(&s->before, other->name);
-+                                if (r < 0)
-+                                        return log_oom();
-+                        }
-+                        else
-+                                continue;
-+                }
- 
-                 /* FIXME: Maybe we should compare the name here lexicographically? */
-         }
-@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
-                                 return log_oom();
- 
-                         service->sysv_start_priority = -1;
-+                        service->default_dependencies = true;
-+                        service->from_rcsd = false;
-                         service->name = name;
-                         service->path = fpath;
-                         name = fpath = NULL;
-@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
- 
-                                 if (de->d_name[0] == 'S')  {
- 
--                                        if (rcnd_table[i].type == RUNLEVEL_UP)
-+                                        if (rcnd_table[i].type == RUNLEVEL_UP || rcnd_table[i].type == RUNLEVEL_SYSINIT) {
-                                                 service->sysv_start_priority = MAX(a*10 + b, service->sysv_start_priority);
--
-+                                                service->default_dependencies = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?false:true;
-+                                                service->from_rcsd = (rcnd_table[i].type == RUNLEVEL_SYSINIT)?true:false;
-+                                        }
-                                         r = set_ensure_allocated(&runlevel_services[i], NULL);
-                                         if (r < 0) {
-                                                 log_oom();
-@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
-                                         }
- 
-                                 } else if (de->d_name[0] == 'K' &&
--                                           (rcnd_table[i].type == RUNLEVEL_DOWN)) {
-+                                           (rcnd_table[i].type == RUNLEVEL_DOWN ||
-+                                            rcnd_table[i].type == RUNLEVEL_SYSINIT)) {
- 
-                                         r = set_ensure_allocated(&shutdown_services, NULL);
-                                         if (r < 0) {
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
rename to meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
index 66905b5..ed7c68f 100644
--- a/meta/recipes-core/systemd/systemd/0016-Revert-rules-remove-firmware-loading-rules.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Revert-rules-remove-firmware-loading-rules.patch
@@ -1,7 +1,7 @@
-From 7311ecc745c17d6ed9fd9cf43039648483a87605 Mon Sep 17 00:00:00 2001
+From 0f47cfcb16e8e40a90a9221f9995f8cd8a915c22 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Thu, 19 Mar 2015 15:01:29 +1100
-Subject: [PATCH 16/36] Revert "rules: remove firmware loading rules"
+Subject: [PATCH 14/19] Revert "rules: remove firmware loading rules"
 
 This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
 Userspace firmware loading support is needed for Linux < 3.7.
@@ -24,5 +24,5 @@ index 0000000..f0ae684
 +
 +SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
rename to meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 642625f..f31d211 100644
--- a/meta/recipes-core/systemd/systemd/0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 17/36] Revert "udev: remove userspace firmware loading
+From 4d28d9a7d8d69fb429955d770e53e7a81640da24 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Nov 2016 20:45:23 -0800
+Subject: [PATCH 15/19] Revert "udev: remove userspace firmware loading
  support"
 
 This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
@@ -10,21 +13,21 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am                      |  12 +++
- README                           |   4 +-
+ README                           |   6 +-
  TODO                             |   1 +
- configure.ac                     |  22 ++++++
+ configure.ac                     |  18 +++++
  src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
  src/udev/udev-builtin.c          |   3 +
  src/udev/udev.h                  |   6 ++
  src/udev/udevd.c                 |  13 ++++
- 8 files changed, 213 insertions(+), 2 deletions(-)
+ 8 files changed, 210 insertions(+), 3 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
 diff --git a/Makefile.am b/Makefile.am
-index 305099a..e774976 100644
+index 3010b01..229492a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3706,6 +3706,18 @@ libudev_core_la_LIBADD = \
+@@ -3791,6 +3791,18 @@ libudev_core_la_LIBADD = \
  	$(BLKID_LIBS) \
  	$(KMOD_LIBS)
  
@@ -44,10 +47,17 @@ index 305099a..e774976 100644
  libudev_core_la_SOURCES += \
  	src/udev/udev-builtin-kmod.c
 diff --git a/README b/README
-index ca8993c..87f3297 100644
+index 9f5bc93..f60ae11 100644
 --- a/README
 +++ b/README
-@@ -56,8 +56,8 @@ REQUIREMENTS:
+@@ -50,14 +50,14 @@ REQUIREMENTS:
+           CONFIG_PROC_FS
+           CONFIG_FHANDLE (libudev, mount and bind mount handling)
+ 
+-        udev will fail to work with the legacy sysfs layout:
++        Udev will fail to work with the legacy sysfs layout:
+           CONFIG_SYSFS_DEPRECATED=n
+ 
          Legacy hotplug slows down the system and confuses udev:
            CONFIG_UEVENT_HELPER_PATH=""
  
@@ -59,10 +69,10 @@ index ca8993c..87f3297 100644
  
          Some udev rules and virtualization detection relies on it:
 diff --git a/TODO b/TODO
-index fac9ccf..2645582 100644
+index baaac94..1ab1691 100644
 --- a/TODO
 +++ b/TODO
-@@ -642,6 +642,7 @@ Features:
+@@ -658,6 +658,7 @@ Features:
  * initialize the hostname from the fs label of /, if /etc/hostname does not exist?
  
  * udev:
@@ -71,13 +81,13 @@ index fac9ccf..2645582 100644
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
 diff --git a/configure.ac b/configure.ac
-index 329861a..af85405 100644
+index dfc0bd3..1de0066 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1361,6 +1361,25 @@ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database
+@@ -1394,6 +1394,23 @@ AM_CONDITIONAL(HAVE_MYHOSTNAME, [test "$have_myhostname" = "yes"])
+ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database support])],
+        enable_hwdb=$enableval, enable_hwdb=yes)
  AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
- 
- # ------------------------------------------------------------------------------
 +AC_ARG_WITH(firmware-path,
 +       AS_HELP_STRING([--with-firmware-path=DIR[[[:DIR[...]]]]],
 +          [Firmware search path (default="")]),
@@ -93,19 +103,15 @@ index 329861a..af85405 100644
 +done
 +IFS=$OLD_IFS
 +AC_SUBST(FIRMWARE_PATH)
-+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is availabe]) ])
++AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
 +AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
-+
-+# ------------------------------------------------------------------------------
+ 
+ # ------------------------------------------------------------------------------
  have_manpages=no
- AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable manpages]))
- AC_PATH_PROG([XSLTPROC], [xsltproc])
-@@ -1656,6 +1675,9 @@ AC_MSG_RESULT([
+@@ -1698,6 +1715,7 @@ AC_MSG_RESULT([
          SysV init scripts:                 ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
          Build Python:                      ${PYTHON}
-+        Installation Python:               ${PYTHON_BINARY}
-+        sphinx binary:                     ${SPHINX_BUILD}
 +        firmware path:                     ${FIRMWARE_PATH}
          PAM modules dir:                   ${with_pamlibdir}
          PAM configuration dir:             ${with_pamconfdir}
@@ -309,7 +315,7 @@ index 8433e8d..d32366d 100644
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index e9dd2f4..0abc28e 100644
+index d336ee0..81e5dc5 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
 @@ -125,6 +125,9 @@ struct event {
@@ -322,7 +328,7 @@ index e9dd2f4..0abc28e 100644
  };
  
  static inline struct event *node_to_event(struct udev_list_node *node) {
-@@ -614,6 +617,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
+@@ -613,6 +616,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
          event->devnum = udev_device_get_devnum(dev);
          event->is_block = streq("block", udev_device_get_subsystem(dev));
          event->ifindex = udev_device_get_ifindex(dev);
@@ -333,7 +339,7 @@ index e9dd2f4..0abc28e 100644
  
          log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
               udev_device_get_action(dev), udev_device_get_subsystem(dev));
-@@ -699,6 +706,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
+@@ -698,6 +705,12 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
                          return true;
                  }
  
@@ -347,5 +353,5 @@ index e9dd2f4..0abc28e 100644
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
 -- 
-2.8.3
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch b/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
deleted file mode 100644
index 6e6f344..0000000
--- a/meta/recipes-core/systemd/systemd/0015-systemd-user-avoid-using-system-auth.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Subject: [PATCH 15/36] systemd-user: avoid using system-auth
-
-In OE, we don't provide system-auth, instead, we use common-* files.
-So modify systemd-user file to use common-* files.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/login/systemd-user.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/login/systemd-user.m4 b/src/login/systemd-user.m4
-index f188a8e..862d8d7 100644
---- a/src/login/systemd-user.m4
-+++ b/src/login/systemd-user.m4
-@@ -2,11 +2,11 @@
- #
- # Used by systemd --user instances.
- 
--account  include system-auth
-+account  include common-account
- 
- m4_ifdef(`HAVE_SELINUX',
- session  required pam_selinux.so close
- session  required pam_selinux.so nottys open
- )m4_dnl
- session  required pam_loginuid.so
--session  include system-auth
-+session  include common-session
--- 
-2.8.3
-
diff --git a/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch b/meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
similarity index 77%
rename from meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
rename to meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
index 5d13e4a..10d1df5 100644
--- a/meta/recipes-core/systemd/systemd/0018-make-test-dir-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0016-make-test-dir-configurable.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 18/36] make test dir configurable
+From 218bbc555a37f9373fbb7f03c744eb65109d3470 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Nov 2016 20:47:37 -0800
+Subject: [PATCH 16/19] make test dir configurable
 
 Upstream-Status: Pending
 
@@ -6,17 +9,17 @@ test maybe be run on target in cross-compile environment, and test dir
 is not the compilation dir, so make it configurable
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am  | 2 +-
  configure.ac | 7 +++++++
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index a94636a..dbd3386 100644
+index 229492a..e997d82 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -207,7 +207,7 @@ AM_CPPFLAGS = \
+@@ -214,7 +214,7 @@ AM_CPPFLAGS = \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
  	-DROOTHOMEDIR=\"$(roothomedir)\" \
@@ -26,10 +29,10 @@ index a94636a..dbd3386 100644
  	-I $(top_builddir)/src/basic \
  	-I $(top_srcdir)/src/basic \
 diff --git a/configure.ac b/configure.ac
-index 45aae8a..c53fae2 100644
+index 1de0066..b12e320 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1518,6 +1518,11 @@ AC_ARG_WITH([roothomedir],
+@@ -1535,6 +1535,11 @@ AC_ARG_WITH([roothomedir],
          [],
          [with_roothomedir=/root])
  
@@ -41,7 +44,7 @@ index 45aae8a..c53fae2 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1603,6 +1608,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
+@@ -1621,6 +1626,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
  AC_SUBST([roothomedir], [$with_roothomedir])
@@ -49,7 +52,7 @@ index 45aae8a..c53fae2 100644
  
  AC_CONFIG_FILES([
          Makefile
-@@ -1695,6 +1701,7 @@ AC_MSG_RESULT([
+@@ -1712,6 +1718,7 @@ AC_MSG_RESULT([
          lib dir:                           ${libdir}
          rootlib dir:                       ${with_rootlibdir}
          root home dir:                     ${with_roothomedir}
@@ -58,5 +61,5 @@ index 45aae8a..c53fae2 100644
          SysV rc?.d directories:            ${SYSTEM_SYSVRCND_PATH}
          Build Python:                      ${PYTHON}
 -- 
-2.8.3
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch b/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
similarity index 81%
rename from meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch
rename to meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
index 17592f8..77dbd6e 100644
--- a/meta/recipes-core/systemd/systemd/0019-remove-duplicate-include-uchar.h.patch
+++ b/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
@@ -1,14 +1,12 @@
-From 3ca534935460647fed66e31aaa90b364e29eab5c Mon Sep 17 00:00:00 2001
+From e78af874fc9f3d3af49498b8207109993d93a596 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 Feb 2016 05:59:01 +0000
-Subject: [PATCH 1/2] remove duplicate include uchar.h
+Subject: [PATCH 17/19] remove duplicate include uchar.h
 
 missing.h already includes it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  src/basic/escape.h | 1 -
  src/basic/utf8.h   | 1 -
  2 files changed, 2 deletions(-)
@@ -26,7 +24,7 @@ index deaa4de..36d437c 100644
  #include "string-util.h"
  #include "missing.h"
 diff --git a/src/basic/utf8.h b/src/basic/utf8.h
-index 12c272d..bea93a6 100644
+index f9b9c94..6ac9a3c 100644
 --- a/src/basic/utf8.h
 +++ b/src/basic/utf8.h
 @@ -22,7 +22,6 @@
@@ -38,5 +36,5 @@ index 12c272d..bea93a6 100644
  #include "macro.h"
  #include "missing.h"
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
similarity index 76%
rename from meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch
rename to meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
index a027fad..5824033 100644
--- a/meta/recipes-core/systemd/systemd/0020-check-for-uchar.h-in-configure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
@@ -1,23 +1,21 @@
-From e06eec89a22719c38e257fe07afff18e359114cb Mon Sep 17 00:00:00 2001
+From 7cc0b19d244023c7b3e557765b03b7971e047f29 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 Feb 2016 06:02:38 +0000
-Subject: [PATCH 2/2] check for uchar.h in configure
+Subject: [PATCH 18/19] check for uchar.h in configure
 
 Use ifdef to include uchar.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  configure.ac        | 1 +
  src/basic/missing.h | 2 ++
  2 files changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ecc3e6b..62f934e 100644
+index b12e320..4e6dfdf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -297,6 +297,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" = "xyes"])
+@@ -298,6 +298,7 @@ AM_CONDITIONAL([HAVE_PYTHON], [test "x$have_python" = "xyes"])
  
  # ------------------------------------------------------------------------------
  
@@ -26,10 +24,10 @@ index ecc3e6b..62f934e 100644
  AC_CHECK_HEADERS([linux/btrfs.h], [], [])
  AC_CHECK_HEADERS([linux/memfd.h], [], [])
 diff --git a/src/basic/missing.h b/src/basic/missing.h
-index f704422..a1baa95 100644
+index 4936873..ce79404 100644
 --- a/src/basic/missing.h
 +++ b/src/basic/missing.h
-@@ -34,7 +34,9 @@
+@@ -35,7 +35,9 @@
  #include <stdlib.h>
  #include <sys/resource.h>
  #include <sys/syscall.h>
@@ -40,5 +38,5 @@ index f704422..a1baa95 100644
  
  #ifdef HAVE_AUDIT
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
similarity index 69%
rename from meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
rename to meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
index 96fc3d8..66aa4ca 100644
--- a/meta/recipes-core/systemd/systemd/0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
+++ b/meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
@@ -1,23 +1,23 @@
-From 71e710a6c8a3879af7d50c4cb995e0615deba5c3 Mon Sep 17 00:00:00 2001
-From: Emil Renner Berthing <systemd@esmil.dk>
-Date: Sat, 12 Sep 2015 19:56:52 +0000
-Subject: [PATCH 29/38] socket-util: don't fail if libc doesn't support IDN
+From 289554d87e4fd96cae08c0fb449bf41d5641cd24 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Nov 2016 20:49:53 -0800
+Subject: [PATCH 19/19] socket-util: don't fail if libc doesn't support IDN
+
+Upstream-Status: Pending
 
 Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  src/basic/socket-util.c | 9 +++++++++
  1 file changed, 9 insertions(+)
 
 diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
-index 5851268..aefaca5 100644
+index 4ebf106..53b9a12 100644
 --- a/src/basic/socket-util.c
 +++ b/src/basic/socket-util.c
-@@ -44,6 +44,15 @@
- #include "string-util.h"
+@@ -47,6 +47,15 @@
  #include "user-util.h"
+ #include "utf8.h"
  #include "util.h"
 +/* Don't fail if the standard library
 + * doesn't support IDN */
@@ -32,5 +32,5 @@ index 5851268..aefaca5 100644
  int socket_address_parse(SocketAddress *a, const char *s) {
          char *e, *n;
 -- 
-1.8.3.1
+2.10.2
 
diff --git a/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch b/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
deleted file mode 100644
index 5797a29..0000000
--- a/meta/recipes-core/systemd/systemd/0021-include-missing.h-for-getting-secure_getenv-definiti.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6cedbaee7964f6a6c61b9f2c8f0b87cef9370424 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Dec 2015 22:51:55 +0000
-Subject: [PATCH 26/38] include missing.h for getting secure_getenv definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/basic/user-util.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/basic/user-util.c b/src/basic/user-util.c
-index 55672b3..22c4a23 100644
---- a/src/basic/user-util.c
-+++ b/src/basic/user-util.c
-@@ -38,6 +38,7 @@
- #include "path-util.h"
- #include "string-util.h"
- #include "user-util.h"
-+#include "missing.h"
- 
- bool uid_is_valid(uid_t uid) {
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/systemd/systemd/CVE-2016-7795.patch b/meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
deleted file mode 100644
index 5ecb9c3..0000000
--- a/meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Subject: Fix CVE-2016-7795
-
-This undoes 531ac2b. I acked that patch without looking at the code
-carefully enough. There are two problems:
-- we want to process the fds anyway
-- in principle empty notification messages are valid, and we should
-  process them as usual, including logging using log_unit_debug().
-
-Upstream-Status: Backport
-CVE: CVE-2016-7795
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/core/manager.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/core/manager.c b/src/core/manager.c
-index 7838f56..f165d08e 100644
---- a/src/core/manager.c
-+++ b/src/core/manager.c
-@@ -1589,13 +1589,12 @@ static int manager_dispatch_cgroups_agent_fd(sd_event_source *source, int fd, ui
-         return 0;
- }
- 
--static void manager_invoke_notify_message(Manager *m, Unit *u, pid_t pid, const char *buf, size_t n, FDSet *fds) {
-+static void manager_invoke_notify_message(Manager *m, Unit *u, pid_t pid, const char *buf, FDSet *fds) {
-         _cleanup_strv_free_ char **tags = NULL;
- 
-         assert(m);
-         assert(u);
-         assert(buf);
--        assert(n > 0);
- 
-         tags = strv_split(buf, "\n\r");
-         if (!tags) {
-@@ -1688,25 +1687,27 @@ static int manager_dispatch_notify_fd(sd_event_source *source, int fd, uint32_t
-                 return 0;
-         }
- 
-+        /* The message should be a string. Here we make sure it's NUL-terminated,
-+         * but only the part until first NUL will be used anyway. */
-         buf[n] = 0;
- 
-         /* Notify every unit that might be interested, but try
-          * to avoid notifying the same one multiple times. */
-         u1 = manager_get_unit_by_pid_cgroup(m, ucred->pid);
-         if (u1) {
--                manager_invoke_notify_message(m, u1, ucred->pid, buf, n, fds);
-+                manager_invoke_notify_message(m, u1, ucred->pid, buf, fds);
-                 found = true;
-         }
- 
-         u2 = hashmap_get(m->watch_pids1, PID_TO_PTR(ucred->pid));
-         if (u2 && u2 != u1) {
--                manager_invoke_notify_message(m, u2, ucred->pid, buf, n, fds);
-+                manager_invoke_notify_message(m, u2, ucred->pid, buf, fds);
-                 found = true;
-         }
- 
-         u3 = hashmap_get(m->watch_pids2, PID_TO_PTR(ucred->pid));
-         if (u3 && u3 != u2 && u3 != u1) {
--                manager_invoke_notify_message(m, u3, ucred->pid, buf, n, fds);
-+                manager_invoke_notify_message(m, u3, ucred->pid, buf, fds);
-                 found = true;
-         }
- 
--- 
-2.8.3
-
diff --git a/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch b/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
deleted file mode 100644
index 23e22d4..0000000
--- a/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Michael Biebl <biebl@debian.org>
-Date: Sat, 27 Sep 2014 04:19:24 +0200
-Subject: udev: re-enable mount propagation for udevd
-
-Upstream-Status: Backport [http://http.debian.net/debian/pool/main/s/systemd/systemd_215-17+deb8u4.debian.tar.xz]
-
-laptop-mode-tools remounts file systems from within a udev rule to apply
-certain mount options. With MountFlags=slave, those mounts then become private
-to the systemd-udevd namespace and are no longer accessible from outside the
-namespace.
-While the root cause is the broken behaviour of laptop-mode-tools, with mount
-propagation turned off, this can result in a read-only root file system.
-Therefore revert the relevant parts from commit
-c2c13f2df42e0691aecabe3979ea81cd7faa35c7 to re-enable mount propagation for
-udevd.
-
-Once affected packages have been fixed, this patch should be dropped
-again.
-
-Closes: #762018
-diff --git a/units/systemd-udevd.service.in b/units/systemd-udevd.service.in
-index e7216d6..1e9a600 100644
---- a/units/systemd-udevd.service.in
-+++ b/units/systemd-udevd.service.in
-@@ -21,6 +21,5 @@ Sockets=systemd-udevd-control.socket systemd-udevd-kernel.socket
- Restart=always
- RestartSec=0
- ExecStart=@rootlibexecdir@/systemd-udevd
--MountFlags=slave
- KillMode=mixed
- WatchdogSec=1min
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_232.bb
similarity index 96%
rename from meta/recipes-core/systemd/systemd_230.bb
rename to meta/recipes-core/systemd/systemd_232.bb
index f60dd60..def6e05 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -25,18 +25,13 @@ SRC_URI += " \
            file://0010-implment-systemd-sysv-install-for-OE.patch \
            file://0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch \
            file://0012-rules-whitelist-hd-devices.patch \
-           file://0013-sysv-generator-add-support-for-executing-scripts-und.patch \
-           file://0014-Make-root-s-home-directory-configurable.patch \
-           file://0015-systemd-user-avoid-using-system-auth.patch \
-           file://0016-Revert-rules-remove-firmware-loading-rules.patch \
-           file://0017-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
-           file://0018-make-test-dir-configurable.patch \
-           file://0019-remove-duplicate-include-uchar.h.patch \
-           file://0020-check-for-uchar.h-in-configure.patch \
-           file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
-           file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
-           file://udev-re-enable-mount-propagation-for-udevd.patch \
-           file://CVE-2016-7795.patch \
+           file://0013-Make-root-s-home-directory-configurable.patch \
+           file://0014-Revert-rules-remove-firmware-loading-rules.patch \
+           file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
+           file://0016-make-test-dir-configurable.patch \
+           file://0017-remove-duplicate-include-uchar.h.patch \
+           file://0018-check-for-uchar.h-in-configure.patch \
+           file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
@@ -61,7 +56,6 @@ PACKAGECONFIG ??= "xz \
                    timedated \
                    timesyncd \
                    localed \
-                   kdbus \
                    ima \
                    smack \
                    logind \
@@ -96,7 +90,6 @@ PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
 PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
 PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
 PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
-PACKAGECONFIG[kdbus] = "--enable-kdbus,--disable-kdbus"
 PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
 PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
 # libseccomp is found in meta-security
@@ -282,7 +275,7 @@ python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
-PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
+PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
 PACKAGES =+ "\
     ${PN}-gui \
@@ -491,6 +484,7 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-genera
                       os-release \
 "
 
+INSANE_SKIP_${PN} += "dev-so"
 INSANE_SKIP_${PN}-doc += " libdir"
 
 PACKAGES =+ "udev udev-hwdb"
-- 
2.10.2


