Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3069661046
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:00:04 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so5232410pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dje59wtt1Uv0F46mFyVOfXHK3Rl1+4FjfP0ZEBBIDPo=;
	b=BXA1XI3COZ497SgcOz7Qej0YzdRoxK4tXiBM03ZAdKgo2Ad+dFjICt5GRVCyOW4mhO
	0HI0PqLfsPbl9AidEAmkI2VxsSmFW+gG1v/m2iAA60GzhabX52jG1ZPsZStFV2fRy6BJ
	bkRrfCCspheWcb9U9+SXl1SxmH9Uwo80UNE88Vx9XZcOjcwjbWzNq7GkCjp+POcPJ4Cr
	Sknk2V8PSkGL1VwXHQCWTkawPkGr1qNBti808Z9uENDkuP2gZaVG3FoOfN82akI+FhY9
	RVF8X9zMu6S9xLfDhyeSqxN2spfI9gFwgKYBs+El0EULv4xV/mXRqCAH0i+KME+TvRiT
	z/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dje59wtt1Uv0F46mFyVOfXHK3Rl1+4FjfP0ZEBBIDPo=;
	b=OKVSCv3BmfQZrS4d9j3l811jvH91z1etM+iLGWTvuXhbKVVGzlUkZOlwPy66m8xCD6
	IDN/8TekhcM8mOQl81lCNQBfzglsu6Q0E8CpTbj3wRnaiSBJU96SECd9G7pf1I1L606q
	lUJZQf6Xd/UO2cgKXHyyfbcYoQMzzisBR0N5oq2qEgLOGAtZr9J3y/JPCq6e2ZP5MxM7
	aFoV1fLdbB68Octe9mk6Au+2+oENCkgwbVJWDo4eCiB3VrPhcc3O+ic76Ed8z7SK0nx6
	CZ6EQ3u0dQVxiktdM56X6ijNkYo7d9XMFm0fHN2BNxAsqmJc0/rdNOUseauIwISFRbl4
	4auw==
X-Gm-Message-State: APjAAAX4v+CtX7YELlfcy+he0/S5Dd9HVMNtugjDyGI2BNpx7ivp+Oql
	NZWvhgrorBZhfOiWi7dM/8NiKSuApfQ=
X-Google-Smtp-Source: APXvYqw4sotje3ZTJemzwWtwwqWK9azOsHIuFApge5K87hu+eGhwaLAeYO1cN61Yv/P8OQGiigIJTw==
X-Received: by 2002:a63:c846:: with SMTP id l6mr4755250pgi.144.1581703204289; 
	Fri, 14 Feb 2020 10:00:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id u2sm7720954pgj.7.2020.02.14.10.00.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 10:00:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 10:00:07 -0800
Message-Id: <20200214180007.4107836-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] busybox: Backport patches to support removal of __NR_clock_gettime
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
X-List-Received-Date: Fri, 14 Feb 2020 18:00:04 -0000
Content-Transfer-Encoding: 8bit

This helps compiling with musl on 32bit arches now that musl has
switched to 64bit time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: backport another similar patch for runsv
    refresh without meta-riscv patches

 ...rappers-around-clock_gettime-closes-.patch | 120 ++++++++++++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  53 ++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  43 +++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  46 +++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   4 +
 5 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
new file mode 100644
index 0000000000..1217daa108
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
@@ -0,0 +1,120 @@
+From be5a505d771a77c640acc35ceaa470c80e62f954 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 24 Oct 2019 16:26:55 +0200
+Subject: [PATCH] Remove syscall wrappers around clock_gettime, closes 12091
+
+12091 "Direct use of __NR_clock_gettime is not time64-safe".
+
+function                                             old     new   delta
+runsv_main                                          1698    1712     +14
+startservice                                         378     383      +5
+get_mono                                              31      25      -6
+date_main                                            932     926      -6
+gettimeofday_ns                                       17       -     -17
+------------------------------------------------------------------------------
+(add/remove: 0/1 grow/shrink: 2/2 up/down: 19/-29)            Total: -10 bytes
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=be5a505d771a77c640acc35ceaa470c80e62f954]
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ Makefile.flags   |  6 ++++--
+ coreutils/date.c | 16 +++-------------
+ libbb/time.c     | 11 +----------
+ runit/runsv.c    | 11 +----------
+ 4 files changed, 9 insertions(+), 35 deletions(-)
+
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -129,10 +129,12 @@ endif
+ # fall back to using a temp file:
+ CRYPT_AVAILABLE := $(shell echo 'int main(void){return 0;}' >crypttest.c; $(CC) $(CFLAGS) -lcrypt -o /dev/null crypttest.c >/dev/null 2>&1 && echo "y"; rm crypttest.c)
+ ifeq ($(CRYPT_AVAILABLE),y)
+-LDLIBS += m crypt
++LDLIBS += m rt crypt
+ else
+-LDLIBS += m
++LDLIBS += m rt
+ endif
++# libm may be needed for dc, awk, ntpd
++# librt may be needed for clock_gettime()
+ 
+ # libpam may use libpthread, libdl and/or libaudit.
+ # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -33,10 +33,9 @@
+ //config:	Enable option (-I) to output an ISO-8601 compliant
+ //config:	date/time string.
+ //config:
+-//config:# defaults to "no": stat's nanosecond field is a bit non-portable
+ //config:config FEATURE_DATE_NANO
+ //config:	bool "Support %[num]N nanosecond format specifier"
+-//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
++//config:	default n # stat's nanosecond field is a bit non-portable
+ //config:	depends on DATE
+ //config:	select PLATFORM_LINUX
+ //config:	help
+@@ -271,17 +270,8 @@ int date_main(int argc UNUSED_PARAM, cha
+ 		 */
+ #endif
+ 	} else {
+-#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
+-		/* libc has incredibly messy way of doing this,
+-		 * typically requiring -lrt. We just skip all this mess */
+-		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
+-#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
+-		/* Let's only suppor the 64 suffix syscalls for 64-bit time_t.
+-		 * This simplifies the code for us as we don't need to convert
+-		 * between 64-bit and 32-bit. We also don't have a way to
+-		 * report overflow errors here.
+-		 */
+-		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
++#if ENABLE_FEATURE_DATE_NANO
++		clock_gettime(CLOCK_REALTIME, &ts);
+ #else
+ 		time(&ts.tv_sec);
+ #endif
+--- a/libbb/time.c
++++ b/libbb/time.c
+@@ -253,18 +253,9 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(
+ #define CLOCK_MONOTONIC 1
+ #endif
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void get_mono(struct timespec *ts)
+ {
+-#if defined(__NR_clock_gettime)
+- 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
+-#elif __TIMESIZE == 64
+-	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
+-#else
+-# error "We currently don't support architectures without " \
+-	"the __NR_clock_gettime syscall and 32-bit time_t"
+-#endif
++	if (clock_gettime(CLOCK_MONOTONIC, ts))
+ 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
+ }
+ unsigned long long FAST_FUNC monotonic_ns(void)
+--- a/runit/runsv.c
++++ b/runit/runsv.c
+@@ -51,18 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAG
+ #if ENABLE_MONOTONIC_SYSCALL
+ #include <sys/syscall.h>
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void gettimeofday_ns(struct timespec *ts)
+ {
+-#if defined(__NR_clock_gettime)
+-	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
+-#elif __TIMESIZE == 64
+-	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
+-#else
+-# error "We currently don't support architectures without " \
+-	"the __NR_clock_gettime syscall and 32-bit time_t"
+-#endif
++	clock_gettime(CLOCK_REALTIME, ts);
+ }
+ #else
+ static void gettimeofday_ns(struct timespec *ts)
diff --git a/meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch b/meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
new file mode 100644
index 0000000000..944526b7ca
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
@@ -0,0 +1,53 @@
+From b7b7452f292f03eefafa6fd1da9bcfc933dee15a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 18 Sep 2019 09:28:49 -0700
+Subject: [PATCH] date: Use 64 prefix syscall if we have to
+
+Some 32-bit architectures no longer have the 32-bit time_t syscalls.
+Instead they have suffixed syscalls that returns a 64-bit time_t. If
+the architecture doesn't have the non-suffixed syscall and is using a
+64-bit time_t let's use the suffixed syscall instead.
+
+This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
+headers.
+
+If an architecture only supports the suffixed syscalls, but is still
+using a 32-bit time_t fall back to the libc call.
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=b7b7452f292f03eefafa6fd1da9bcfc933dee15a]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ coreutils/date.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -36,7 +36,7 @@
+ //config:# defaults to "no": stat's nanosecond field is a bit non-portable
+ //config:config FEATURE_DATE_NANO
+ //config:	bool "Support %[num]N nanosecond format specifier"
+-//config:	default n  # syscall(__NR_clock_gettime)
++//config:	default n  # syscall(__NR_clock_gettime) or syscall(__NR_clock_gettime64)
+ //config:	depends on DATE
+ //config:	select PLATFORM_LINUX
+ //config:	help
+@@ -271,10 +271,17 @@ int date_main(int argc UNUSED_PARAM, cha
+ 		 */
+ #endif
+ 	} else {
+-#if ENABLE_FEATURE_DATE_NANO
++#if ENABLE_FEATURE_DATE_NANO && defined(__NR_clock_gettime)
+ 		/* libc has incredibly messy way of doing this,
+ 		 * typically requiring -lrt. We just skip all this mess */
+ 		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
++#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
++		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
++		 * This simplifies the code for us as we don't need to convert
++		 * between 64-bit and 32-bit. We also don't have a way to
++		 * report overflow errors here.
++		 */
++		syscall(__NR_clock_gettime64, CLOCK_REALTIME, &ts);
+ #else
+ 		time(&ts.tv_sec);
+ #endif
diff --git a/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch b/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
new file mode 100644
index 0000000000..58a6c0d8a0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
@@ -0,0 +1,43 @@
+From 902d3992922fc8db8495d5fb30a4581711b60c62 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 18 Sep 2019 09:28:50 -0700
+Subject: [PATCH] time: Use 64 prefix syscall if we have to
+
+Some 32-bit architectures no longer have the 32-bit time_t syscalls.
+Instead they have suffixed syscalls that returns a 64-bit time_t. If
+the architecture doesn't have the non-suffixed syscall and is using a
+64-bit time_t let's use the suffixed syscall instead.
+
+This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
+headers.
+
+If an architecture only supports the suffixed syscalls, but is still
+using a 32-bit time_t report a compilation error. This avoids us have to
+deal with converting between 64-bit and 32-bit values. There are
+currently no architectures where this is the case.
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=902d3992922fc8db8495d5fb30a4581711b60c62]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ libbb/time.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+--- a/libbb/time.c
++++ b/libbb/time.c
+@@ -257,7 +257,14 @@ char* FAST_FUNC strftime_YYYYMMDDHHMMSS(
+  * typically requiring -lrt. We just skip all this mess */
+ static void get_mono(struct timespec *ts)
+ {
+-	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
++#if defined(__NR_clock_gettime)
++ 	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, ts))
++#elif __TIMESIZE == 64
++	if (syscall(__NR_clock_gettime64, CLOCK_MONOTONIC, ts))
++#else
++# error "We currently don't support architectures without " \
++	"the __NR_clock_gettime syscall and 32-bit time_t"
++#endif
+ 		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
+ }
+ unsigned long long FAST_FUNC monotonic_ns(void)
diff --git a/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch b/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch
new file mode 100644
index 0000000000..4760570441
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch
@@ -0,0 +1,46 @@
+From 8c7419649d6e6fda8fa7d0e863084c78ac728628 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 28 Aug 2019 10:54:15 -0700
+Subject: [PATCH 3/3] runsv: Use 64 prefix syscall if we have to
+
+Some 32-bit architectures no longer have the 32-bit time_t syscalls.
+Instead they have suffixed syscalls that returns a 64-bit time_t. If
+the architecture doesn't have the non-suffixed syscall and is using a
+64-bit time_t let's use the suffixed syscall instead.
+
+This fixes build issues when building for RISC-V 32-bit with 5.1+ kernel
+headers.
+
+If an architecture only supports the suffixed syscalls, but is still
+using a 32-bit time_t report a compilation error. This avoids us have to
+deal with converting between 64-bit and 32-bit values. There are
+currently no architectures where this is the case.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=ad27d44ebe950335616f37e36863469dc181b455]
+---
+ runit/runsv.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/runit/runsv.c b/runit/runsv.c
+index ccc762d78..737909b0e 100644
+--- a/runit/runsv.c
++++ b/runit/runsv.c
+@@ -55,7 +55,14 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  * typically requiring -lrt. We just skip all this mess */
+ static void gettimeofday_ns(struct timespec *ts)
+ {
++#if defined(__NR_clock_gettime)
+ 	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
++#elif __TIMESIZE == 64
++	syscall(__NR_clock_gettime64, CLOCK_REALTIME, ts);
++#else
++# error "We currently don't support architectures without " \
++	"the __NR_clock_gettime syscall and 32-bit time_t"
++#endif
+ }
+ #else
+ static void gettimeofday_ns(struct timespec *ts)
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 1d0102eb2b..ec5b580442 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -42,6 +42,10 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
+           file://0001-date-Use-64-prefix-syscall-if-we-have-to.patch \
+           file://0001-time-Use-64-prefix-syscall-if-we-have-to.patch \
+           file://0003-runsv-Use-64-prefix-syscall-if-we-have-to.patch \
+           file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
            file://0001-Remove-stime-function-calls.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
-- 
2.25.0


