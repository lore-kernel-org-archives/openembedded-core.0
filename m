Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2587B60BD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d9so1936253plo.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Crzhqm8jofXxliThfbwvlyXhofJHhIcG9Oaqtm7FAbU=;
	b=Y4N3ilsIHoxXkKglomMW9qANl5GIVE6secP19oTaQxQG8iPKHUwn8Wh7RHfMS5ZEr1
	p00lXmKWqgxYQIck3bMzWItBm5rJJ51n8RqZIXCl54eJdYVim7tl90FgOZnhQjf/quhb
	eyXP9pDvctIQzj08TaA45xnwbR20VB2cUvL4YQeNrU8oMGE4oild87CDyeFadsRtXaJO
	wZm6mP1x9/3CvTkBfPavZur9Gte1+TqZVRQVfJoeQHVPXPwoI42FfSJgQaR4/6VZwCOA
	atZA2RsnErhEU+6dH8QgwLxQKrGp9eWtjGmIRBNQbPNuViNcG6uuLg8WqMtULxR2vAjA
	rxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Crzhqm8jofXxliThfbwvlyXhofJHhIcG9Oaqtm7FAbU=;
	b=OrTYm14+n6PbBLmVS42Rp1eYhY0PPOQqJXuAvl9c55+ptyk7l5NrNkyesTxFg0+7jj
	2ucLTJ9L2LhYoXfhBFe/6Y0hsgthokny1sJfQeJgVNKAwXrtHpv7Piuh5jjls5iRhMEc
	TRkY/tozpRBeL5lBEqzBJT/bOOXwCL5DRq/NmQC04SjKuV6FmsyqPWxckT3T3uiuXT+9
	Xey0CNXJK4159gt18/Z/EsXSPqlQ3DCjbUS6O/TMFhCPfjbOapRqJbdXN5JTvQ4WzdXk
	gMouT4tymAMxEKaaekjdA1mdZRHy47rh4EBgRRj6RaYWcxsv2d1dSR0VFY9tblICj0Fs
	otHw==
X-Gm-Message-State: APjAAAUYTm5gKV+SHb19WAzUW2iJIUEJ37gFVCS5Q9wdE9JaThN9f15h
	D17l+M4MnqibOy+239fbQoB0DCdWBTk=
X-Google-Smtp-Source: APXvYqxIB6dUC0VnFkjPHE9Uf/MoG6RkXN6IF+n3OZk7RhDcAKtF0yuPV3dnrCdpVi96TFFXn4NW9Q==
X-Received: by 2002:a17:90a:17e5:: with SMTP id
	q92mr3555217pja.28.1581575906646; 
	Wed, 12 Feb 2020 22:38:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:21 -0800
Message-Id: <0ed1fb312bbdfc1bcda92d8f153cbca0ba39fb1e.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] busybox: Backport patches to support removal of __NR_clock_gettime
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:27 -0000
Content-Transfer-Encoding: 8bit

This helps compiling with musl on 32bit arches now that musl has
switched to 64bit time_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rappers-around-clock_gettime-closes-.patch | 113 ++++++++++++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  53 ++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  43 +++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   3 +
 4 files changed, 212 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
new file mode 100644
index 0000000000..f6fbed338a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
@@ -0,0 +1,113 @@
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
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=be5a505d771a77c640acc35ceaa470c80e62f954]
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
+@@ -51,11 +51,9 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAG
+ #if ENABLE_MONOTONIC_SYSCALL
+ #include <sys/syscall.h>
+ 
+-/* libc has incredibly messy way of doing this,
+- * typically requiring -lrt. We just skip all this mess */
+ static void gettimeofday_ns(struct timespec *ts)
+ {
+-	syscall(__NR_clock_gettime, CLOCK_REALTIME, ts);
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
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 1d0102eb2b..bbc5fa1572 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -43,6 +43,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-Remove-stime-function-calls.patch \
+           file://0001-date-Use-64-prefix-syscall-if-we-have-to.patch \
+           file://0001-time-Use-64-prefix-syscall-if-we-have-to.patch \
+           file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.25.0


