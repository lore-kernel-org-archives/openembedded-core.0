Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.57654.1595862650879277723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=E90KwnmB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id f9so3453974pju.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8gxmV0yTgOoC8Q9WKpHO+aVIhCGwMQUCjgJ48Jjba/4=;
        b=E90KwnmB26yl59Dq50rd612ZcPeKaKyOK3O157tmgytq2P3Z9NVXLyJllEenzV/cpR
         lAkHDdCzZEw+s//ijxNhpkgSsif16DnwuUcH7WqFljjXUzeliwH6tmJHzgOiGeQkQcTw
         zCnSLDVMhcIbe1mp/YhtjXQOsHCrcj/5IYPNtSTfBw4agYBFi8uo3T0/tUpMJGLLhmkr
         oZwiNmBxYbGg/4d/b5ebdheiVvrahfVj6benVVzS20A5iMWz+ud+D9hieP3k86E+DHz5
         SznoRbXu2Zo+5yGsYC0fn4gSZd2P7fE9IHyGoY81Td72RpZ7mOoM8Ci6zH3ac5kTV3sA
         qrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8gxmV0yTgOoC8Q9WKpHO+aVIhCGwMQUCjgJ48Jjba/4=;
        b=JmYO+d1mTrIV4IOmuzNozWZwhPETaok4pv6J0P5hT7Ixl4YkjfqDmZmwNBVeId2ERt
         PxJNSuhrpEN3lAYJ0zDMbRq8yhslOPx54qX56KMNbL4VyCEQAOqwd3FBWi3EtOnDyTzM
         rNZxUJ50E8dg3y73JDFgz9/uvdQYpOv/UuCQiX/JXQTAcFV5m2D7+EwpmlbLpHsGxBav
         lcSjQ6E9RZ7796G9Po69zIOcugf45l+9nr1R9Oiieo3RgYjNT/2rTG7o7gj1vboCLBGV
         OxXHUY7+pXyw5/Upr/0YbXMbdBBe/sityaoe1ndjxEDkHhpATXl/c5KiReoMgzLzOKSp
         TJDw==
X-Gm-Message-State: AOAM533BPAIy0t5A3cFk9SJWwY+MF2oXJZf5BzM/iNmHV+9bh2S5kbIx
	SidItR3b4frTaL4eGnCi55Qv++7eJIk=
X-Google-Smtp-Source: ABdhPJx+6qFbZ6qnxfZBQHZU+dF6+Btz3qO9168VMflhej7oxifooNMwEnR0+s5u0RMJEoQrxjNUSw==
X-Received: by 2002:a17:90a:9e7:: with SMTP id 94mr6178769pjo.97.1595862649823;
        Mon, 27 Jul 2020 08:10:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/18] busybox: make hwclock compatible with glibc 2.31
Date: Mon, 27 Jul 2020 05:09:54 -1000
Message-Id: <0416291668fac03cb3dc4a90422e88b87e1207e1.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Sakib Sajal <sakib.sajal@windriver.com>

settimeofday(2) has been deprecated as of glibc 2.31
which hwclock makes use of. This patch makes hwclock
compatible with glibc v2.31
See patch for more details:
  busybox/0001-hwclock-make-glibc-2.31-compatible.patch

Fixes [YOCTO #13981]

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
index a6b47027af..7563368287 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://busybox-CVE-2018-1000500.patch \
+           file://0001-hwclock-make-glibc-2.31-compatible.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.17.1

