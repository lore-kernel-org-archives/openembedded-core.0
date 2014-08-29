Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E50497106F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:06:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2014 10:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="565468716"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2014 10:06:38 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 20:06:32 +0300
Message-Id: <22d5fe07fe0d4d2245931dccbb69218bca7c6954.1409331937.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
Subject: [PATCH 1/3] alsa-lib: upgrade to 1.0.28
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
X-List-Received-Date: Fri, 29 Aug 2014 17:06:39 -0000

Changelog:
http://www.alsa-project.org/main/index.php/Changes_v1.0.27.2_v1.0.28

Update-iatomic.h-functions-definitions-for-mips.patch removed,
integrated upstream.
Check-if-wordexp-function-is-supported.patch updated.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../Check-if-wordexp-function-is-supported.patch   | 31 +++++-----
 ...-iatomic.h-functions-definitions-for-mips.patch | 68 ----------------------
 .../{alsa-lib_1.0.27.2.bb => alsa-lib_1.0.28.bb}   |  7 +--
 3 files changed, 19 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.27.2.bb => alsa-lib_1.0.28.bb} (86%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
index 41b3c23..75a6eb8 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
@@ -1,6 +1,6 @@
-From 2555c5d62229cf269974f6ec6e4689ab97bbda42 Mon Sep 17 00:00:00 2001
+From e33357b59a10d44e9bec5d24100ce23ca300cc79 Mon Sep 17 00:00:00 2001
 From: "Hong H. Pham" <hong.pham@windriver.com>
-Date: Tue, 26 Feb 2013 19:40:04 -0500
+Date: Fri, 29 Aug 2014 17:13:55 +0300
 Subject: [PATCH] Check if wordexp function is supported
 
 eglibc could be configured to build without wordexp, so it is not enough
@@ -8,24 +8,25 @@ to check if wordexp.h exists (the header file could be installed, but it's
 possible that the wordexp() function is not supported).  An additional
 check if wordexp() is supported by the system C library is needed.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Hong H. Pham <hong.pham@windriver.com>
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
 ---
- configure.in   |    5 ++++-
- src/userfile.c |    2 +-
+ configure.ac   | 5 ++++-
+ src/userfile.c | 2 +-
  2 files changed, 5 insertions(+), 2 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index 4bcb0d6..ba1c2dd 100644
---- a/configure.in
-+++ b/configure.in
-@@ -333,7 +333,10 @@ arm*)
- esac
+diff --git a/configure.ac b/configure.ac
+index b8353a0..773b72f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -311,7 +311,10 @@ fi
+ AC_SUBST(ALSA_DEPLIBS)
  
- dnl Check for wordexp.h
--AC_CHECK_HEADERS([wordexp.h])
-+AC_CHECK_HEADERS([wordexp.h],
+ dnl Check for headers
+-AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h])
++AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h],
 +  dnl Make sure wordexp is supported by the C library
 +  AC_CHECK_FUNCS([wordexp])
 +)
@@ -46,5 +47,5 @@ index 3a73836..b8ce809 100644
  #include <assert.h>
  int snd_user_file(const char *file, char **result)
 -- 
-1.7.10.4
+1.9.1
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch b/meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch
deleted file mode 100644
index f1a7947..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From f21f48a70f8437a671b58fcab75e54222a9eea16 Mon Sep 17 00:00:00 2001
-From: Kai Kang <jiashuo.kang at gmail.com>
-Date: Thu, 15 Aug 2013 17:17:19 +0800
-Subject: [PATCH] Update iatomic.h functions definitions for mips
-
-Functions atomic_add(s) and atomic_sub(s) are defined with 'extern
-__inline__' that may cause compile fails when cross compile for mips.
-The error message looks like:
-
-| pcm/.libs/libpcm.a(pcm_meter.o): In function `snd_pcm_meter_update_scope':
-| .../alsa-lib-1.0.27.2/src/pcm/pcm_meter.c:139: undefined reference to `atomic_sub'
-
-Replace the 'extern __inline__' with 'static __inline__' to fix this
-issue.
-
-Signed-off-by: Kai Kang <jiashuo.kang at gmail.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- include/iatomic.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/iatomic.h b/include/iatomic.h
-index 5711fe8..2393297 100644
---- a/include/iatomic.h
-+++ b/include/iatomic.h
-@@ -720,7 +720,7 @@ typedef struct { volatile int counter; } atomic_t;
-  * Atomically adds @i to @v.  Note that the guaranteed useful range
-  * of an atomic_t is only 24 bits.
-  */
--extern __inline__ void atomic_add(int i, atomic_t * v)
-+static __inline__ void atomic_add(int i, atomic_t * v)
- {
- 	unsigned long temp;
- 
-@@ -744,7 +744,7 @@ extern __inline__ void atomic_add(int i, atomic_t * v)
-  * Atomically subtracts @i from @v.  Note that the guaranteed
-  * useful range of an atomic_t is only 24 bits.
-  */
--extern __inline__ void atomic_sub(int i, atomic_t * v)
-+static __inline__ void atomic_sub(int i, atomic_t * v)
- {
- 	unsigned long temp;
- 
-@@ -763,7 +763,7 @@ extern __inline__ void atomic_sub(int i, atomic_t * v)
- /*
-  * Same as above, but return the result value
-  */
--extern __inline__ int atomic_add_return(int i, atomic_t * v)
-+static __inline__ int atomic_add_return(int i, atomic_t * v)
- {
- 	unsigned long temp, result;
- 
-@@ -784,7 +784,7 @@ extern __inline__ int atomic_add_return(int i, atomic_t * v)
- 	return result;
- }
- 
--extern __inline__ int atomic_sub_return(int i, atomic_t * v)
-+static __inline__ int atomic_sub_return(int i, atomic_t * v)
- {
- 	unsigned long temp, result;
- 
--- 
-1.8.1.2
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
similarity index 86%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
index fc0847d..d509da2 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
@@ -14,16 +14,15 @@ BBCLASSEXTEND = "native nativesdk"
 #FIXME: remove the following
 ARM_INSTRUCTION_SET = "arm"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://fix-tstamp-declaration.patch \
-           file://Update-iatomic.h-functions-definitions-for-mips.patch \
            file://0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch \
            file://0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch \
            file://0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch \
 "
-SRC_URI[md5sum] = "69129a7c37697f81ac092335e9fa452b"
-SRC_URI[sha256sum] = "690ed393e7efd4fc7e3a2d2cda5449298ca0c895197e5914e350882012430d19"
+SRC_URI[md5sum] = "c9e21b88a2b3e6e12ea7ba0f3b271fc3"
+SRC_URI[sha256sum] = "3c074b85dde1b30e78ef4995579765833e5b693fbbd8f834c335e080cb734a6d"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


