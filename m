Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 238D4731F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 04:07:21 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so299842527wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TDfkOgP92wgCmZa/psnjHuHPcWDWJdKIvQdbwj+7O88=;
	b=D4/jBuNH/A01XvM46RgBUCNUFIoB6sartbYakMIACQDRx92Le5sCDUjQxqA51AVxZ3
	9hjYUWlb5UB/2ieByEO/PCF02FWTvGhkLt9WkXolrMEcaPEXii9ypYFiUhz7STg+9CgX
	waVm5YaZIjX4Q2WRx5KIYuyN2NZiYjonBGiCj2xfVXusl+FDZv1Dgpn3SLKRKvbOppZl
	HqRhpf4ip2oq0lnHI3G5o0+3Tb+ZclMgVDra+4tmzQwlHDH8o1Xw19TCiMgipI4RcYbB
	spGMnVncGJnFaQANTG1SFEXW8L8PNZdYTF+S7ZUKvoH0uutDX0dBUUuP4c93vvjZzUU9
	KWww==
MIME-Version: 1.0
X-Received: by 10.28.195.138 with SMTP id t132mr16502190wmf.61.1452571642236; 
	Mon, 11 Jan 2016 20:07:22 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 11 Jan 2016 20:07:22 -0800 (PST)
In-Reply-To: <1452189324-9568-1-git-send-email-raj.khem@gmail.com>
References: <1452189324-9568-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 11 Jan 2016 20:07:22 -0800
Message-ID: <CAJ86T=UF1VOgFozVz9de=qsvVSpZuu-xq9b_xdht1uB1V-J83A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Upgrade to 1.0.10
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
X-List-Received-Date: Tue, 12 Jan 2016 04:07:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 7, 2016 at 9:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Drop upstreamed patches
> Seems to fix parallel build race with locales

So can this now be reverted?

  http://git.openembedded.org/openembedded-core/commit/?id=6bb6fd592ca9caac75504b8c339e20ab54c0cae9

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |   7 +-
>  ...ert-glibc-compat-bump-glibc-minor-version.patch |  28 -----
>  ...-Add-implementation-for-copysignl-for-ppc.patch | 125 ---------------------
>  ...stdlib-canonicalize_file_name-memory-leak.patch |  95 ----------------
>  4 files changed, 2 insertions(+), 253 deletions(-)
>  delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
>  delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
>  delete mode 100644 meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
>
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
> index b84912b..a5c4b5e 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -1,15 +1,12 @@
> -SRCREV = "d1b81113b43a6d26dec4e0e58a380895d121006e"
> +SRCREV = "0ad73077c230093ae004829da44418597f330c6a"
>
> -PV = "1.0.9+git${SRCPV}"
> +PV = "1.0.10+git${SRCPV}"
>
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
>
>  SRC_URI = "git://uclibc-ng.org/git/uclibc-ng;branch=1.0 \
>          file://0001-Disable-lrount_tes-function.patch \
> -        file://0001-Revert-glibc-compat-bump-glibc-minor-version.patch \
> -        file://0002-Add-implementation-for-copysignl-for-ppc.patch \
>          file://0003-Add-argp-implementation.patch \
> -        file://libc-stdlib-canonicalize_file_name-memory-leak.patch \
>          file://uClibc.machine \
>          file://uClibc.distro \
>          file://obstack.cfg \
> diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
> deleted file mode 100644
> index 72d0109..0000000
> --- a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From f9f566849ad0785b2fd3fd6c4c5d324f9f822aac Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 13 Dec 2015 17:25:11 +0000
> -Subject: [PATCH] Revert "glibc compat: bump glibc minor version"
> -
> -This reverts commit 4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3.
> ----
> -Upstream-Status: Inappropriate [ OE-Specific ]
> -
> - include/features.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/include/features.h b/include/features.h
> -index f6fbbf4..dcf1348 100644
> ---- a/include/features.h
> -+++ b/include/features.h
> -@@ -393,7 +393,7 @@ uClibc was built without large file support enabled.
> -    these macros to test for features in specific releases.  */
> - /* Don't do it, if you want to keep uClibc happy.  */
> - #define       __GLIBC__       2
> --#define       __GLIBC_MINOR__ 10
> -+#define       __GLIBC_MINOR__ 2
> - #endif
> -
> - #define __GLIBC_PREREQ(maj, min) \
> ---
> -2.6.4
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch b/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
> deleted file mode 100644
> index d4275c9..0000000
> --- a/meta/recipes-core/uclibc/uclibc-git/0002-Add-implementation-for-copysignl-for-ppc.patch
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -From 5d362074e5975b150a35bcfa77eab1bfa4e30de7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 16 Aug 2015 20:50:56 -0700
> -Subject: [PATCH 2/7] Add implementation for copysignl for ppc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - libc/sysdeps/linux/powerpc/Makefile.arch |  2 +-
> - libc/sysdeps/linux/powerpc/copysignl.c   | 89 ++++++++++++++++++++++++++++++++
> - 2 files changed, 90 insertions(+), 1 deletion(-)
> - create mode 100644 libc/sysdeps/linux/powerpc/copysignl.c
> -
> -diff --git a/libc/sysdeps/linux/powerpc/Makefile.arch b/libc/sysdeps/linux/powerpc/Makefile.arch
> -index 4fbcb11..7c09c87 100644
> ---- a/libc/sysdeps/linux/powerpc/Makefile.arch
> -+++ b/libc/sysdeps/linux/powerpc/Makefile.arch
> -@@ -5,7 +5,7 @@
> - # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
> - #
> -
> --CSRC-y := __syscall_error.c ioctl.c
> -+CSRC-y := __syscall_error.c ioctl.c copysignl.c
> -
> - SSRC-y := \
> -       __longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
> -diff --git a/libc/sysdeps/linux/powerpc/copysignl.c b/libc/sysdeps/linux/powerpc/copysignl.c
> -new file mode 100644
> -index 0000000..000f653
> ---- /dev/null
> -+++ b/libc/sysdeps/linux/powerpc/copysignl.c
> -@@ -0,0 +1,89 @@
> -+/* s_copysignl.c -- long double version of s_copysign.c.
> -+ * Conversion to long double by Ulrich Drepper,
> -+ * Cygnus Support, drepper@cygnus.com.
> -+ */
> -+
> -+/*
> -+ * ====================================================
> -+ * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
> -+ *
> -+ * Developed at SunPro, a Sun Microsystems, Inc. business.
> -+ * Permission to use, copy, modify, and distribute this
> -+ * software is freely granted, provided that this notice
> -+ * is preserved.
> -+ * ====================================================
> -+ */
> -+
> -+/*
> -+ * copysignl(long double x, long double y)
> -+ * copysignl(x,y) returns a value with the magnitude of x and
> -+ * with the sign bit of y.
> -+ */
> -+
> -+#include <endian.h>
> -+#include <stdint.h>
> -+
> -+#if __FLOAT_WORD_ORDER == BIG_ENDIAN
> -+
> -+typedef union
> -+{
> -+  long double value;
> -+  struct
> -+  {
> -+    int sign_exponent:16;
> -+    unsigned int empty:16;
> -+    uint32_t msw;
> -+    uint32_t lsw;
> -+  } parts;
> -+} ieee_long_double_shape_type;
> -+
> -+#endif
> -+
> -+#if __FLOAT_WORD_ORDER == LITTLE_ENDIAN
> -+
> -+typedef union
> -+{
> -+  long double value;
> -+  struct
> -+  {
> -+    uint32_t lsw;
> -+    uint32_t msw;
> -+    int sign_exponent:16;
> -+    unsigned int empty:16;
> -+  } parts;
> -+} ieee_long_double_shape_type;
> -+
> -+#endif
> -+
> -+/* Get int from the exponent of a long double.  */
> -+
> -+#define GET_LDOUBLE_EXP(exp,d)                                        \
> -+do {                                                          \
> -+  ieee_long_double_shape_type ge_u;                           \
> -+  ge_u.value = (d);                                           \
> -+  (exp) = ge_u.parts.sign_exponent;                           \
> -+} while (0)
> -+
> -+/* Set exponent of a long double from an int.  */
> -+
> -+#define SET_LDOUBLE_EXP(d,exp)                                        \
> -+do {                                                          \
> -+  ieee_long_double_shape_type se_u;                           \
> -+  se_u.value = (d);                                           \
> -+  se_u.parts.sign_exponent = (exp);                           \
> -+  (d) = se_u.value;                                           \
> -+} while (0)
> -+
> -+long double copysignl(long double x, long double y);
> -+libc_hidden_proto(copysignl);
> -+
> -+long double copysignl(long double x, long double y)
> -+{
> -+      uint32_t es1,es2;
> -+      GET_LDOUBLE_EXP(es1,x);
> -+      GET_LDOUBLE_EXP(es2,y);
> -+      SET_LDOUBLE_EXP(x,(es1&0x7fff)|(es2&0x8000));
> -+        return x;
> -+}
> -+
> -+libc_hidden_def(copysignl);
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch b/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
> deleted file mode 100644
> index 83d21e2..0000000
> --- a/meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From patchwork Wed Oct 21 06:02:30 2015
> -Content-Type: text/plain; charset="utf-8"
> -MIME-Version: 1.0
> -Content-Transfer-Encoding: 7bit
> -Subject: libc/stdlib: canonicalize_file_name() memory leak
> -From: =?utf-8?q?Wojciech_Nizi=C5=84ski?= <niziak@spox.org>
> -X-Patchwork-Id: 533608
> -Message-Id: <loom.20151021T080015-833@post.gmane.org>
> -To: uclibc@uclibc.org
> -Date: Wed, 21 Oct 2015 06:02:30 +0000 (UTC)
> -
> -System based on Buildroot 2014.11
> -    Linux 3.10.88
> -    uclibc 0.9.33.2 (also with 1.0.2)
> -    systemd 216
> -    gcc 4.8.3 (also with 4.9.2)
> -
> -Bug:
> -    After 2 days system is out of memory. PID 1 (systemd) is allocating.
> -    over 120MB od RAM..
> -    Just after reboot PID 1 is taking only about 600kB.
> -
> -How to reproduce:
> -    With every systemd service reload or restart, heap of PID 1 grows.
> -    Try with command:
> -    watch -n1 \
> -    'systemctl stop systemd-sysctl ; grep heap /proc/1/smaps -A15; free'
> -
> -Source of bug:
> -
> -    Uclibc's canonicalize_file_name() is allocating temprary buffer of.
> -    4kB (PATH_MAX), and passing it to realpath() as second argument..
> -    Function canonicalize... is not checking if realpath() fails and.
> -    memory is lost.
> -
> -    Backtrace:
> -    #0  malloc (bytes=4096) at libc/stdlib/malloc-standard/malloc.c:844
> -    #1  canonicalize_file_name.
> -        (name="/etc/systemd/system/systemd-sysctl.service.d") at.
> -        libc/stdlib/canonicalize.c:30
> -    #2  path_strv_resolve (...) at src/shared/path-util.c:275
> -
> -Solution:
> -    Do not use temporary buffer like in eglibc.
> -    Function realpath() will be responsible for allocation.
> -
> -From: Wojciech Nizinski <w.nizinski@grinn-global.com>
> -Date: Tue, 20 Oct 2015 14:08:09 +0200
> -Subject: [PATCH]libc/stdlib: canonicalize_file_name() memory leak
> -
> -Uclibc's canonicalize_file_name() is allocating temprary buffer of 4kB
> -(PATH_MAX), and passing it to realpath() as second argument. Function is
> -not checking if realpath() fails and memory is lost.
> ----
> -Upstream-Status: Submitted
> -
> - libc/stdlib/canonicalize.c | 21 +--------------------
> - 1 file changed, 1 insertion(+), 20 deletions(-)
> -
> -diff --git a/libc/stdlib/canonicalize.c b/libc/stdlib/canonicalize.c
> -index 06e710a..da09d58 100644
> ---- a/libc/stdlib/canonicalize.c
> -+++ b/libc/stdlib/canonicalize.c
> -@@ -9,30 +9,11 @@
> -  */
> -
> - #include <stdlib.h>
> --#include <limits.h>
> -
> - #ifdef __USE_GNU
> -
> --#ifndef PATH_MAX
> --# ifdef _POSIX_VERSION
> --#  define PATH_MAX _POSIX_PATH_MAX
> --# else
> --#  ifdef MAXPATHLEN
> --#   define PATH_MAX MAXPATHLEN
> --#  else
> --#   define PATH_MAX 1024
> --#  endif
> --# endif
> --#endif
> --
> - char * canonicalize_file_name (const char *name)
> - {
> --      char *buf = (char *) malloc(PATH_MAX);
> --
> --      if(unlikely(buf == NULL))
> --              return NULL;
> --
> --      *buf='\0';
> --      return realpath (name, buf);
> -+      return realpath (name, NULL);
> - }
> - #endif
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

