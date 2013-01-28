Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TzouY-00053C-SS
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 14:38:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2013 05:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="277470842"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2013 05:22:30 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 15:23:25 +0200
Message-Id: <1359379405-25448-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libevent : upgrade to 4.0.21
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
X-List-Received-Date: Mon, 28 Jan 2013 13:38:11 -0000

 - removed libevent-2.0.16_fix_for_x32.patch because the newer version
 contained the changes done by the patch.

 - LICENSE file new checksum caused by :

  old : Copyright (c) 2007-2011 Niels Provos and Nick Mathewson

  new : Copyright (c) 2007-2012 Niels Provos and Nick Mathewson

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../libevent/libevent-2.0.16_fix_for_x32.patch     |   47 --------------------
 .../{libevent_2.0.16.bb => libevent_2.0.21.bb}     |   11 +++--
 2 files changed, 5 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
 rename meta/recipes-support/libevent/{libevent_2.0.16.bb => libevent_2.0.21.bb} (61%)

diff --git a/meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch b/meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
deleted file mode 100644
index ef42863..0000000
--- a/meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: pending
-
-Pulled the patch from gentoo: from here:
-http://sources2.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libevent/files/libevent-2.0.16-sysctl.patch?revision=1.1
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/01/04
-
-From 358c745e5432f7648b6f8b3188f32b5551cbf9d6 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Thu, 8 Dec 2011 11:39:48 -0500
-Subject: [PATCH] check for sysctl before we use it
-
-Not all C libraries under Linux support the sysctl() func.
----
- arc4random.c |    2 +-
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arc4random.c b/arc4random.c
-index 4833169..ef10fa8 100644
---- a/arc4random.c
-+++ b/arc4random.c
-@@ -166,7 +166,7 @@ arc4_seed_win32(void)
- }
- #endif
- 
--#if defined(_EVENT_HAVE_SYS_SYSCTL_H)
-+#if defined(_EVENT_HAVE_SYS_SYSCTL_H) && defined(_EVENT_HAVE_SYSCTL)
- #if _EVENT_HAVE_DECL_CTL_KERN && _EVENT_HAVE_DECL_KERN_RANDOM && _EVENT_HAVE_DECL_RANDOM_UUID
- #define TRY_SEED_SYSCTL_LINUX
- static int
-diff --git a/configure.in b/configure.in
-index da08cf4..4e24444 100644
---- a/configure.in
-+++ b/configure.in
-@@ -267,7 +267,7 @@ AC_HEADER_TIME
- 
- dnl Checks for library functions.
- AC_CHECK_FUNCS([gettimeofday vasprintf fcntl clock_gettime strtok_r strsep])
--AC_CHECK_FUNCS([getnameinfo strlcpy inet_ntop inet_pton signal sigaction strtoll inet_aton pipe eventfd sendfile mmap splice arc4random arc4random_buf issetugid geteuid getegid getprotobynumber setenv unsetenv putenv])
-+AC_CHECK_FUNCS([getnameinfo strlcpy inet_ntop inet_pton signal sigaction strtoll inet_aton pipe eventfd sendfile mmap splice arc4random arc4random_buf issetugid geteuid getegid getprotobynumber setenv unsetenv putenv sysctl])
- 
- AC_CACHE_CHECK(
-     [for getaddrinfo],
--- 
-1.7.6.1
diff --git a/meta/recipes-support/libevent/libevent_2.0.16.bb b/meta/recipes-support/libevent/libevent_2.0.21.bb
similarity index 61%
rename from meta/recipes-support/libevent/libevent_2.0.16.bb
rename to meta/recipes-support/libevent/libevent_2.0.21.bb
index 1c464ef..3c53de9 100644
--- a/meta/recipes-support/libevent/libevent_2.0.16.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.21.bb
@@ -5,15 +5,14 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=50884&atid=461322"
 SECTION = "libs"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=50aad300de703db62baae12146832b45"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=45c5316ff684bcfe2f9f86d8b1279559"
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz \
-           file://libevent-2.0.16_fix_for_x32.patch"
+SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz"
 
-SRC_URI[md5sum] = "899efcffccdb3d5111419df76e7dc8df"
-SRC_URI[sha256sum] = "a578c7bcaf3bab1cc7924bd4d219f2ea621ab8c51dfc4f886e234b6ef4d38295"
+SRC_URI[md5sum] = "b2405cc9ebf264aa47ff615d9de527a2"
+SRC_URI[sha256sum] = "22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5"
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
-- 
1.7.9.5



