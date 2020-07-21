Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.4736.1595363961978254659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 13:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06LKdJoC002145
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 13:39:20 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 21 Jul 2020
 13:39:19 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 187181FFFE;
 Tue, 21 Jul 2020 16:39:19 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [dunfell][PATCH v2] busybox: make hwclock compatible with glibc 2.31
Date: Tue, 21 Jul 2020 16:39:12 -0400
Message-ID: <20200721203912.9200-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

settimeofday(2) has been deprecated as of glibc 2.31
which hwclock makes use of. This patch makes hwclock
compatible with glibc v2.31
See patch for more details:
  busybox/0001-hwclock-make-glibc-2.31-compatible.patch

Fixes [YOCTO #13981]

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
v2 changes:
rebased and tested against glibc
and musl.
Build and boot core-image-minimal
and ran busybox ptest
 ...1-hwclock-make-glibc-2.31-compatible.patch | 83 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
new file mode 100644
index 0000000000..0a141cebd5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
@@ -0,0 +1,83 @@
+From 19a6baf0b79346deb383bbd2b5b825d59add7d5d Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Fri, 17 Jul 2020 17:27:21 +0000
+Subject: [PATCH] hwclock: make glibc 2.31 compatible
+
+NEWS for glibc version 2.31
+===========================
+
+Deprecated and removed features, and other changes affecting compatibility:
+
+* The settimeofday function can still be used to set a system-wide
+  time zone when the operating system supports it.  This is because
+  the Linux kernel reused the API, on some architectures, to describe
+  a system-wide time-zone-like offset between the software clock
+  maintained by the kernel, and the "RTC" clock that keeps time when
+  the system is shut down.
+
+  However, to reduce the odds of this offset being set by accident,
+  settimeofday can no longer be used to set the time and the offset
+  simultaneously.  If both of its two arguments are non-null, the call
+  will fail (setting errno to EINVAL).
+
+  Callers attempting to set this offset should also be prepared for
+  the call to fail and set errno to ENOSYS; this already happens on
+  the Hurd and on some Linux architectures.  The Linux kernel
+  maintainers are discussing a more principled replacement for the
+  reused API.  After a replacement becomes available, we will change
+  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
+  argument is not a null pointer.
+
+  settimeofday itself is obsolescent according to POSIX.  Programs
+  that set the system time should use clock_settime and/or the adjtime
+  family of functions instead.  We may cease to make settimeofday
+  available to newly linked binaries after there is a replacement for
+  Linux's time-zone-like offset API.
+
+hwclock had two calls to settimeofday, in functions to_sys_clock and
+set_system_clock_timezone, where both the arguments to settimeofday
+were valid (non-null).
+Therefore, split the call, once for timezone and once for timeval.
+
+Fixes #12756
+
+Upstream-Status: Pending
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ util-linux/hwclock.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
+index 29f5102..088ab3b 100644
+--- a/util-linux/hwclock.c
++++ b/util-linux/hwclock.c
+@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, int utc)
+ 
+ 	tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
+ 	tv.tv_usec = 0;
+-	if (settimeofday(&tv, &tz))
+-		bb_perror_msg_and_die("settimeofday");
++	if (settimeofday(NULL, &tz))
++		bb_perror_msg_and_die("settimeofday: timezone");
++	if (settimeofday(&tv, NULL))
++		bb_perror_msg_and_die("settimeofday: timeval");
+ }
+ 
+ static void from_sys_clock(const char **pp_rtcname, int utc)
+@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
+ 	gettimeofday(&tv, NULL);
+ 	if (!utc)
+ 		tv.tv_sec += tz.tz_minuteswest * 60;
+-	if (settimeofday(&tv, &tz))
+-		bb_perror_msg_and_die("settimeofday");
++	if (settimeofday(NULL, &tz))
++		bb_perror_msg_and_die("settimeofday: timezone");
++	if (settimeofday(&tv, NULL))
++		bb_perror_msg_and_die("settimeofday: timeval");
+ }
+ 
+ //usage:#define hwclock_trivial_usage
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 2bb1d59ba7..aa140b0663 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
            file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
+           file://0001-hwclock-make-glibc-2.31-compatible.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.27.0

