Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj4mb-0004Lc-Bq
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:04:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 23:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93004490"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 23:56:44 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 23:56:30 -0800
Message-Id: <ea47caba6a6a4015ba9d9d7d7bae85ea6e754489.1325836241.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/25] libevent: fix compilation for x32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 08:04:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Pull a patch from gentoo to avoid sysctl syscall which is not
defined for x32.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libevent/libevent-2.0.16_fix_for_x32.patch     |   47 ++++++++++++++++++++
 meta/recipes-support/libevent/libevent_2.0.16.bb   |    5 +-
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch

diff --git a/meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch b/meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
new file mode 100644
index 0000000..ef42863
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
@@ -0,0 +1,47 @@
+Upstream-Status: pending
+
+Pulled the patch from gentoo: from here:
+http://sources2.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libevent/files/libevent-2.0.16-sysctl.patch?revision=1.1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/01/04
+
+From 358c745e5432f7648b6f8b3188f32b5551cbf9d6 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 8 Dec 2011 11:39:48 -0500
+Subject: [PATCH] check for sysctl before we use it
+
+Not all C libraries under Linux support the sysctl() func.
+---
+ arc4random.c |    2 +-
+ configure.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arc4random.c b/arc4random.c
+index 4833169..ef10fa8 100644
+--- a/arc4random.c
++++ b/arc4random.c
+@@ -166,7 +166,7 @@ arc4_seed_win32(void)
+ }
+ #endif
+ 
+-#if defined(_EVENT_HAVE_SYS_SYSCTL_H)
++#if defined(_EVENT_HAVE_SYS_SYSCTL_H) && defined(_EVENT_HAVE_SYSCTL)
+ #if _EVENT_HAVE_DECL_CTL_KERN && _EVENT_HAVE_DECL_KERN_RANDOM && _EVENT_HAVE_DECL_RANDOM_UUID
+ #define TRY_SEED_SYSCTL_LINUX
+ static int
+diff --git a/configure.in b/configure.in
+index da08cf4..4e24444 100644
+--- a/configure.in
++++ b/configure.in
+@@ -267,7 +267,7 @@ AC_HEADER_TIME
+ 
+ dnl Checks for library functions.
+ AC_CHECK_FUNCS([gettimeofday vasprintf fcntl clock_gettime strtok_r strsep])
+-AC_CHECK_FUNCS([getnameinfo strlcpy inet_ntop inet_pton signal sigaction strtoll inet_aton pipe eventfd sendfile mmap splice arc4random arc4random_buf issetugid geteuid getegid getprotobynumber setenv unsetenv putenv])
++AC_CHECK_FUNCS([getnameinfo strlcpy inet_ntop inet_pton signal sigaction strtoll inet_aton pipe eventfd sendfile mmap splice arc4random arc4random_buf issetugid geteuid getegid getprotobynumber setenv unsetenv putenv sysctl])
+ 
+ AC_CACHE_CHECK(
+     [for getaddrinfo],
+-- 
+1.7.6.1
diff --git a/meta/recipes-support/libevent/libevent_2.0.16.bb b/meta/recipes-support/libevent/libevent_2.0.16.bb
index 6da3d94..38d42f0 100644
--- a/meta/recipes-support/libevent/libevent_2.0.16.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.16.bb
@@ -7,9 +7,10 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=50aad300de703db62baae12146832b45"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz"
+SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz \
+           file://libevent-2.0.16_fix_for_x32.patch"
 
 SRC_URI[md5sum] = "899efcffccdb3d5111419df76e7dc8df"
 SRC_URI[sha256sum] = "a578c7bcaf3bab1cc7924bd4d219f2ea621ab8c51dfc4f886e234b6ef4d38295"
-- 
1.7.6.4



