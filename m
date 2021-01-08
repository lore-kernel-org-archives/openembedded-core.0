Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2639.1610072958646749346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103293823"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 10:29:16 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FF0D4CE6026
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 10:29:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 10:29:08 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] busybox: upgrade 1.32.0 ->1.33.0
Date: Fri, 8 Jan 2021 10:29:05 +0800
Message-ID: <1610072945-7114-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 2FF0D4CE6026.A2CD1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-hwclock-make-glibc-2.31-compatible.patch
removed sincie it is not available in 1.33.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...1-hwclock-make-glibc-2.31-compatible.patch | 83 -------------------
 .../{busybox_1.32.0.bb => busybox_1.33.0.bb}  |  5 +-
 2 files changed, 2 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
 rename meta/recipes-core/busybox/{busybox_1.32.0.bb => busybox_1.33.0.bb} (90%)

diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
deleted file mode 100644
index 8d1f272120..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
-From: Sakib Sajal <sakib.sajal@windriver.com>
-Date: Fri, 17 Jul 2020 17:27:21 +0000
-Subject: [PATCH] hwclock: make glibc 2.31 compatible
-
-NEWS for glibc version 2.31
-===========================
-
-Deprecated and removed features, and other changes affecting compatibility:
-
-* The settimeofday function can still be used to set a system-wide
-  time zone when the operating system supports it.  This is because
-  the Linux kernel reused the API, on some architectures, to describe
-  a system-wide time-zone-like offset between the software clock
-  maintained by the kernel, and the "RTC" clock that keeps time when
-  the system is shut down.
-
-  However, to reduce the odds of this offset being set by accident,
-  settimeofday can no longer be used to set the time and the offset
-  simultaneously.  If both of its two arguments are non-null, the call
-  will fail (setting errno to EINVAL).
-
-  Callers attempting to set this offset should also be prepared for
-  the call to fail and set errno to ENOSYS; this already happens on
-  the Hurd and on some Linux architectures.  The Linux kernel
-  maintainers are discussing a more principled replacement for the
-  reused API.  After a replacement becomes available, we will change
-  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
-  argument is not a null pointer.
-
-  settimeofday itself is obsolescent according to POSIX.  Programs
-  that set the system time should use clock_settime and/or the adjtime
-  family of functions instead.  We may cease to make settimeofday
-  available to newly linked binaries after there is a replacement for
-  Linux's time-zone-like offset API.
-
-hwclock had two calls to settimeofday, in functions to_sys_clock and
-set_system_clock_timezone, where both the arguments to settimeofday
-were valid (non-null).
-Therefore, split the call, once for timezone and once for timeval.
-
-Fixes #12756
-
-Upstream-Status: Pending
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- util-linux/hwclock.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
-index dc97d8f..cf346e8 100644
---- a/util-linux/hwclock.c
-+++ b/util-linux/hwclock.c
-@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, int utc)
- 
- 	tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
- 	tv.tv_usec = 0;
--	if (settimeofday(&tv, &tz))
--		bb_simple_perror_msg_and_die("settimeofday");
-+	if (settimeofday(NULL, &tz))
-+		bb_simple_perror_msg_and_die("settimeofday: timezone");
-+	if (settimeofday(&tv, NULL))
-+		bb_simple_perror_msg_and_die("settimeofday: timeval");
- }
- 
- static void from_sys_clock(const char **pp_rtcname, int utc)
-@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
- 	gettimeofday(&tv, NULL);
- 	if (!utc)
- 		tv.tv_sec += tz.tz_minuteswest * 60;
--	if (settimeofday(&tv, &tz))
--		bb_simple_perror_msg_and_die("settimeofday");
-+	if (settimeofday(NULL, &tz))
-+		bb_simple_perror_msg_and_die("settimeofday: timezone");
-+	if (settimeofday(&tv, NULL))
-+		bb_simple_perror_msg_and_die("settimeofday: timeval");
- }
- 
- //usage:#define hwclock_trivial_usage
--- 
-2.24.1
-
diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
similarity index 90%
rename from meta/recipes-core/busybox/busybox_1.32.0.bb
rename to meta/recipes-core/busybox/busybox_1.33.0.bb
index 3a669444dd..ec8f350955 100644
--- a/meta/recipes-core/busybox/busybox_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -44,11 +44,10 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
-           file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://rev.cfg \
            file://pgrep.cfg \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "9576986f1a960da471d03b72a62f13c7"
-SRC_URI[tarball.sha256sum] = "c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689"
+SRC_URI[tarball.md5sum] = "eb0e85d59015ddcd8d2219f42c8844ac"
+SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
-- 
2.25.1



