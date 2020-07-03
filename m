Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web12.6419.1593765799914960520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 01:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0638hCFP028824
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jul 2020 10:43:13 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.59])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 0638hCxq017209;
	Fri, 3 Jul 2020 10:43:12 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 8B81098021E;
	Fri,  3 Jul 2020 10:43:11 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>, wangmy@cn.fujitsu.com
Subject: [OE-core][PATCH v2] busybox: 1.31.1 -> 1.32.0
Date: Fri,  3 Jul 2020 10:42:15 +0200
Message-Id: <20200703084216.17911-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586907-23161-1-git-send-email-wangmy@cn.fujitsu.com>

- update to last stable version 1.32.0
- remove and refresh already merged patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...inittab_1.31.0.bb => busybox-inittab_1.32.0.bb} |   0
 .../busybox/0001-Remove-stime-function-calls.patch |  85 ---------------
 ...all-wrappers-around-clock_gettime-closes-.patch | 120 ---------------------
 ...-date-Use-64-prefix-syscall-if-we-have-to.patch |  53 ---------
 ...-time-Use-64-prefix-syscall-if-we-have-to.patch |  43 --------
 ...runsv-Use-64-prefix-syscall-if-we-have-to.patch |  46 --------
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  26 ++---
 .../{busybox_1.31.1.bb => busybox_1.32.0.bb}       |   9 +-
 8 files changed, 15 insertions(+), 367 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.31.0.bb => busybox-inittab_1.32.0.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch
 rename meta/recipes-core/busybox/{busybox_1.31.1.bb => busybox_1.32.0.bb} (79%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.31.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.31.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch b/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch
deleted file mode 100644
index 9b9432844c..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From d3539be8f27b8cbfdfee460fe08299158f08bcd9 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 19 Nov 2019 13:06:40 +0100
-Subject: [PATCH] Remove stime() function calls
-
-stime() has been deprecated in glibc 2.31 and replaced with
-clock_settime(). Let's replace the stime() function calls with
-clock_settime() in preperation.
-
-function                                             old     new   delta
-rdate_main                                           197     224     +27
-clock_settime                                          -      27     +27
-date_main                                            926     941     +15
-stime                                                 37       -     -37
-------------------------------------------------------------------------------
-(add/remove: 2/2 grow/shrink: 2/0 up/down: 69/-37)             Total: 32 bytes
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9] 
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- coreutils/date.c         | 6 +++++-
- libbb/missing_syscalls.c | 8 --------
- util-linux/rdate.c       | 8 ++++++--
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -279,6 +279,9 @@ int date_main(int argc UNUSED_PARAM, cha
- 		time(&ts.tv_sec);
- #endif
- 	}
-+#if !ENABLE_FEATURE_DATE_NANO
-+	ts.tv_nsec = 0;
-+#endif
- 	localtime_r(&ts.tv_sec, &tm_time);
- 
- 	/* If date string is given, update tm_time, and maybe set date */
-@@ -301,9 +304,10 @@ int date_main(int argc UNUSED_PARAM, cha
- 		if (date_str[0] != '@')
- 			tm_time.tm_isdst = -1;
- 		ts.tv_sec = validate_tm_time(date_str, &tm_time);
-+		ts.tv_nsec = 0;
- 
- 		/* if setting time, set it */
--		if ((opt & OPT_SET) && stime(&ts.tv_sec) < 0) {
-+		if ((opt & OPT_SET) && clock_settime(CLOCK_REALTIME, &ts) < 0) {
- 			bb_perror_msg("can't set date");
- 		}
- 	}
---- a/libbb/missing_syscalls.c
-+++ b/libbb/missing_syscalls.c
-@@ -15,14 +15,6 @@ pid_t getsid(pid_t pid)
- 	return syscall(__NR_getsid, pid);
- }
- 
--int stime(const time_t *t)
--{
--	struct timeval tv;
--	tv.tv_sec = *t;
--	tv.tv_usec = 0;
--	return settimeofday(&tv, NULL);
--}
--
- int sethostname(const char *name, size_t len)
- {
- 	return syscall(__NR_sethostname, name, len);
---- a/util-linux/rdate.c
-+++ b/util-linux/rdate.c
-@@ -95,9 +95,13 @@ int rdate_main(int argc UNUSED_PARAM, ch
- 	if (!(flags & 2)) { /* no -p (-s may be present) */
- 		if (time(NULL) == remote_time)
- 			bb_error_msg("current time matches remote time");
--		else
--			if (stime(&remote_time) < 0)
-+		else {
-+			struct timespec ts;
-+			ts.tv_sec = remote_time;
-+			ts.tv_nsec = 0;
-+			if (clock_settime(CLOCK_REALTIME, &ts) < 0)
- 				bb_perror_msg_and_die("can't set time of day");
-+		}
- 	}
- 
- 	if (flags != 1) /* not lone -s */
diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
deleted file mode 100644
index 0c7f9b8132..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From be5a505d771a77c640acc35ceaa470c80e62f954 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 24 Oct 2019 16:26:55 +0200
-Subject: [PATCH] Remove syscall wrappers around clock_gettime, closes 12091
-
-12091 "Direct use of __NR_clock_gettime is not time64-safe".
-
-function                                             old     new   delta
-runsv_main                                          1698    1712     +14
-startservice                                         378     383      +5
-get_mono                                              31      25      -6
-date_main                                            932     926      -6
-gettimeofday_ns                                       17       -     -17
-------------------------------------------------------------------------------
-(add/remove: 0/1 grow/shrink: 2/2 up/down: 19/-29)            Total: -10 bytes
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=be5a505d771a77c640acc35ceaa470c80e62f954]
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- Makefile.flags   |  6 ++++--
- coreutils/date.c | 16 +++-------------
- libbb/time.c     | 11 +----------
- runit/runsv.c    | 11 +----------
- 4 files changed, 9 insertions(+), 35 deletions(-)
-
---- a/Makefile.flags
-+++ b/Makefile.flags
-@@ -129,10 +129,12 @@ endif
- # fall back to using a temp file:
- CRYPT_AVAILABLE := $(shell echo 'int main(void){return 0;}' >crypttest.c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c >/dev/null 2>&1 && echo "y"; rm crypttest.c)
- ifeq ($(CRYPT_AVAILABLE),y)
--LDLIBS += m crypt
-+LDLIBS += m rt crypt
- else
--LDLIBS += m
-+LDLIBS += m rt
- endif
-+# libm may be needed for dc, awk, ntpd
-+# librt may be needed for clock_gettime()
- 
- # libpam may use libpthread, libdl and/or libaudit.
- # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -33,10 +33,9 @@
- //config:	Enable option (-I) to output an ISO-8601 compliant
- //config:	date/time string.
- //config:
--//config:# defaults to "no": stat's nanosecond field is a bit non-portable
- //config:config FEATURE_DATE_NANO
- //config:	bool "Support %[num]N nanosecond format specifier"
--//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
-+//config:	default n # stat's nanosecond field is a bit non-portable
- //config:	depends on DATE
- //config:	select PLATFORM_LINUX
- //config:	help
-@@ -271,17 +270,8 @@ int date_main(int argc UNUSED_PARAM, cha
- 		 */
- #endif
- 	} else {
--#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
--		/* libc has incredibly messy way of doing this,
--		 * typically requiring -lrt. We just skip all this mess */
--		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
--#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
--		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
--		 * This simplifies the code for us as we don't need to convert
--		 * between 64-bit and 32-bit. We also don't have a way to
--		 * report overflow errors here.
--		 */
--		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
-+#if ENABLE_FEATURE_DATE_NANO
-+		clock_gettime(CLOCK_REALTIME, &ts);
- #else
- 		time(&ts.tv_sec);
- #endif
---- a/libbb/time.c
-+++ b/libbb/time.c
-@@ -253,18 +253,9 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(
- #define CLOCK_MONOTONIC 1
- #endif
- 
--/* libc has incredibly messy way of doing this,
-- * typically requiring -lrt. We just skip all this mess */
- static void get_mono(struct timespec *ts)
- {
--#if defined(__NR_clock_gettime)
-- 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
--#elif __TIMESIZE == 64
--	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
--#else
--# error "We currently don't support architectures without " \
--	"the __NR_clock_gettime syscall and 32-bit time_t"
--#endif
-+	if (clock_gettime(CLOCK_MONOTONIC, ts))
- 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
- }
- unsigned long long FAST_FUNC monotonic_ns(void)
---- a/runit/runsv.c
-+++ b/runit/runsv.c
-@@ -51,18 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAG
- #if ENABLE_MONOTONIC_SYSCALL
- #include <sys/syscall.h>
- 
--/* libc has incredibly messy way of doing this,
-- * typically requiring -lrt. We just skip all this mess */
- static void gettimeofday_ns(struct timespec *ts)
- {
--#if defined(__NR_clock_gettime)
--	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
--#elif __TIMESIZE == 64
--	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
--#else
--# error "We currently don't support architectures without " \
--	"the __NR_clock_gettime syscall and 32-bit time_t"
--#endif
-+	clock_gettime(CLOCK_REALTIME, ts);
- }
- #else
- static void gettimeofday_ns(struct timespec *ts)
diff --git a/meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch b/meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
deleted file mode 100644
index 944526b7ca..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b7b7452f292f03eefafa6fd1da9bcfc933dee15a Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 18 Sep 2019 09:28:49 -0700
-Subject: [PATCH] date: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If
-the architecture doesn't have the non-suffixed syscall and is using a
-64-bit time_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
-headers.
-
-If an architecture only supports the suffixed syscalls, but is still
-using a 32-bit time_t fall back to the libc call.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=b7b7452f292f03eefafa6fd1da9bcfc933dee15a]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- coreutils/date.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
---- a/coreutils/date.c
-+++ b/coreutils/date.c
-@@ -36,7 +36,7 @@
- //config:# defaults to "no": stat's nanosecond field is a bit non-portable
- //config:config FEATURE_DATE_NANO
- //config:	bool "Support %[num]N nanosecond format specifier"
--//config:	default n  # syscall(__NR_clock_gettime)
-+//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
- //config:	depends on DATE
- //config:	select PLATFORM_LINUX
- //config:	help
-@@ -271,10 +271,17 @@ int date_main(int argc UNUSED_PARAM, cha
- 		 */
- #endif
- 	} else {
--#if ENABLE_FEATURE_DATE_NANO
-+#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
- 		/* libc has incredibly messy way of doing this,
- 		 * typically requiring -lrt. We just skip all this mess */
- 		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
-+#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
-+		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
-+		 * This simplifies the code for us as we don't need to convert
-+		 * between 64-bit and 32-bit. We also don't have a way to
-+		 * report overflow errors here.
-+		 */
-+		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
- #else
- 		time(&ts.tv_sec);
- #endif
diff --git a/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch b/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
deleted file mode 100644
index 58a6c0d8a0..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 902d3992922fc8db8495d5fb30a4581711b60c62 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 18 Sep 2019 09:28:50 -0700
-Subject: [PATCH] time: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If
-the architecture doesn't have the non-suffixed syscall and is using a
-64-bit time_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
-headers.
-
-If an architecture only supports the suffixed syscalls, but is still
-using a 32-bit time_t report a compilation error. This avoids us have to
-deal with converting between 64-bit and 32-bit values. There are
-currently no architectures where this is the case.
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=902d3992922fc8db8495d5fb30a4581711b60c62]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- libbb/time.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/libbb/time.c
-+++ b/libbb/time.c
-@@ -257,7 +257,14 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(
-  * typically requiring -lrt. We just skip all this mess */
- static void get_mono(struct timespec *ts)
- {
--	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
-+#if defined(__NR_clock_gettime)
-+ 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
-+#elif __TIMESIZE == 64
-+	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
-+#else
-+# error "We currently don't support architectures without " \
-+	"the __NR_clock_gettime syscall and 32-bit time_t"
-+#endif
- 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
- }
- unsigned long long FAST_FUNC monotonic_ns(void)
diff --git a/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch b/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch
deleted file mode 100644
index 4760570441..0000000000
--- a/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8c7419649d6e6fda8fa7d0e863084c78ac728628 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 28 Aug 2019 10:54:15 -0700
-Subject: [PATCH 3/3] runsv: Use 64 prefix syscall if we have to
-
-Some 32-bit architectures no longer have the 32-bit time_t syscalls.
-Instead they have suffixed syscalls that returns a 64-bit time_t. If
-the architecture doesn't have the non-suffixed syscall and is using a
-64-bit time_t let's use the suffixed syscall instead.
-
-This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
-headers.
-
-If an architecture only supports the suffixed syscalls, but is still
-using a 32-bit time_t report a compilation error. This avoids us have to
-deal with converting between 64-bit and 32-bit values. There are
-currently no architectures where this is the case.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=ad27d44ebe950335616f37e36863469dc181b455]
----
- runit/runsv.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/runit/runsv.c b/runit/runsv.c
-index ccc762d78..737909b0e 100644
---- a/runit/runsv.c
-+++ b/runit/runsv.c
-@@ -55,7 +55,14 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  * typically requiring -lrt. We just skip all this mess */
- static void gettimeofday_ns(struct timespec *ts)
- {
-+#if defined(__NR_clock_gettime)
- 	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
-+#elif __TIMESIZE == 64
-+	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
-+#else
-+# error "We currently don't support architectures without " \
-+	"the __NR_clock_gettime syscall and 32-bit time_t"
-+#endif
- }
- #else
- static void gettimeofday_ns(struct timespec *ts)
--- 
-2.22.0
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
index 2a0a40c512..35e981d6a2 100644
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
@@ -31,11 +31,11 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
  networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++------
  1 file changed, 21 insertions(+), 8 deletions(-)
 
-Index: busybox-1.31.0/networking/udhcp/dhcpc.c
+Index: busybox-1.32.0/networking/udhcp/dhcpc.c
 ===================================================================
---- busybox-1.31.0.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.31.0/networking/udhcp/dhcpc.c
-@@ -48,6 +48,8 @@
+--- busybox-1.32.0.orig/networking/udhcp/dhcpc.c
++++ busybox-1.32.0/networking/udhcp/dhcpc.c
+@@ -48,6 +48,8 @@ struct tpacket_auxdata {
  };
  #endif
  
@@ -55,7 +55,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -1124,7 +1128,8 @@
+@@ -1084,7 +1088,8 @@
  		client_data.state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -65,7 +65,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -1160,7 +1165,8 @@
+@@ -1120,7 +1125,8 @@ static void perform_release(uint32_t server_addr, uint32_t requested_ip)
   * Users requested to be notified in all cases, even if not in one
   * of the states above.
   */
@@ -75,7 +75,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  
  	change_listen_mode(LISTEN_NONE);
  	client_data.state = RELEASED;
-@@ -1278,7 +1284,7 @@
+@@ -1238,7 +1244,7 @@
  	/* Parse command line */
  	opt = getopt32long(argv, "^"
  		/* O,x: list; -T,-t,-A take numeric param */
@@ -84,7 +84,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a::")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1389,6 +1395,10 @@
+@@ -1349,6 +1355,10 @@
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -95,7 +95,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  	/* Create pidfile */
  	write_pidfile(client_data.pidfile);
  	/* Goes to stdout (unless NOMMU) and possibly syslog */
-@@ -1397,7 +1407,8 @@
+@@ -1357,7 +1367,8 @@
  	srand(monotonic_us());
  
  	client_data.state = INIT_SELECTING;
@@ -105,17 +105,17 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1570,7 +1581,8 @@
+@@ -1530,7 +1541,8 @@
  				}
  				/* Timed out, enter init state */
- 				bb_info_msg("lease lost, entering init state");
+ 				bb_simple_info_msg("lease lost, entering init state");
 -				udhcp_run_script(NULL, "deconfig");
 +				if (allow_deconfig)
 +					udhcp_run_script(NULL, "deconfig");
  				client_data.state = INIT_SELECTING;
  				client_data.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
-@@ -1762,8 +1774,10 @@
+@@ -1722,8 +1734,10 @@
  							"(got ARP reply), declining");
  						send_decline(/*xid,*/ server_addr, packet.yiaddr);
  
@@ -128,7 +128,7 @@ Index: busybox-1.31.0/networking/udhcp/dhcpc.c
  						change_listen_mode(LISTEN_RAW);
  						client_data.state = INIT_SELECTING;
  						client_data.first_secs = 0; /* make secs field count from 0 */
-@@ -1832,8 +1846,10 @@
+@@ -1792,8 +1806,10 @@
  				/* return to init state */
  				bb_info_msg("received %s", "DHCP NAK");
  				udhcp_run_script(&packet, "nak");
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.32.0.bb
similarity index 79%
rename from meta/recipes-core/busybox/busybox_1.31.1.bb
rename to meta/recipes-core/busybox/busybox_1.32.0.bb
index 2bb1d59ba7..0dfdfdb549 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
@@ -42,14 +42,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
-           file://0001-date-Use-64-prefix-syscall-if-we-have-to.patch \
-           file://0001-time-Use-64-prefix-syscall-if-we-have-to.patch \
-           file://0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch \
-           file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
-           file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "70913edaf2263a157393af07565c17f0"
-SRC_URI[tarball.sha256sum] = "d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998"
+SRC_URI[tarball.md5sum] = "9576986f1a960da471d03b72a62f13c7"
+SRC_URI[tarball.sha256sum] = "c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689"
-- 
2.11.0

