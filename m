Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id AB2717F022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:27:02 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q10so16938652pff.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=/KwXwlhsXlOle41zJH/kd12lDPOiy7K69IxQev6rvgA=;
	b=PSwjGOPF3ATkHywteEecv2gP6lkP2OCBJw2vHoQAncvZ4Bm+BcH48kYS7lHd+Rv4C7
	hFlxUq1RvnxYtCnRmaIcYccKxzgxauGWlshc53VbR4Yovguxpt9CYfdIiFBIqBu1JorI
	LkLp+rHoJDHtYmmRpUk3CP+jG5m4Bi91b4EBXjm0jLH06SyaPDbbcwist2UAJRS2PQyc
	8n+c61Pi1Cpv6S6G9XInC+9DOb/bAEOV+s1M+J7PJzyDJApouOMglvw2Ci/+tvj1+Vdk
	mnLEi2m/0Ug0GuhjrGVBrHudRb/9OQTQgiaZlzAqrxKnbtM6bgyMp4SMUJtaiZgRX1aH
	M9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=/KwXwlhsXlOle41zJH/kd12lDPOiy7K69IxQev6rvgA=;
	b=Jgzemhvyw569QDpo4fGVB6dXH/hgTrdDbKhP/9OhTa0ZXdWi18wJ3nXQ9S0WxT0Nrl
	qjQsl8fXw3596rPdT/Ib3q+YPM6o4i+bfxKOWklym9mpQAMxR9nZyjWuoOTWrku3ecAZ
	GPsyf5jkN7ufevjQJa+xF/5CRv7y//FpszWx0UjH4Vp6Atw1AFJkiPQv/8DSItSMxLzJ
	tS6S4x22G/AdWlsUy4Syn3+24QhZ/jHtsKpefhgSmdKwyOGHrsxUW8ZkC1u/B0DSv6f4
	SK4RIcn+mg0ZiKee+BjAOp9e0M3/Te+vxHKB5QNTke8O18Iy63oG4HfYQnedb68s8EGO
	S2VA==
X-Gm-Message-State: APjAAAUlpZXbPVJ/8vMVAQw8WVLqO5MpuMyNcgavLs9LDY4NI2i0ORkE
	uG8jWCNstNgh7TlzRbEdkJa5wvtrcAo=
X-Google-Smtp-Source: APXvYqzlVOsF80azdId+5WqMcnuxX8vaaXJ9ZVkLdXlyJsv4wY1WNHRHJJzv/0sz5faqirVPD6tOgg==
X-Received: by 2002:a17:90a:cf8f:: with SMTP id
	i15mr24832694pju.110.1563780423355; 
	Mon, 22 Jul 2019 00:27:03 -0700 (PDT)
Received: from apollo (c-73-71-176-3.hsd1.ca.comcast.net. [73.71.176.3])
	by smtp.gmail.com with ESMTPSA id
	e189sm9374887pgc.15.2019.07.22.00.27.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 00:27:03 -0700 (PDT)
Date: Mon, 22 Jul 2019 00:26:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190722072654.eks3gy2e66wzhhun@apollo>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Subject: [PATCH 3/3] sysvinit: Include sys/sysmacros.h for major/minor definitions on musl too
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
X-List-Received-Date: Mon, 22 Jul 2019 07:27:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes musl issue

implicit declaration of function 'minor' is invalid in C99 [-Wimplicit-function-declaration]
which eventually ends up with a linker error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...acros.h-for-major-minor-defines-in-g.patch | 99 ++++++++-----------
 1 file changed, 39 insertions(+), 60 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
index 2575b59b5e..e13ac9d06b 100644
--- a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
@@ -1,71 +1,50 @@
-From 29c7a529d3bb0c1e20239f885e74c5036f1a908c Mon Sep 17 00:00:00 2001
+From 3c29a86f351ea4827dc445bb8e6cb774543c9be6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Aug 2018 15:38:58 -0700
-Subject: [PATCH] include sys/sysmacros.h for major/minor defines in glibc
+Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
 ---
- src/bootlogd.c |   3 +++
- src/bootlogd.o | Bin 58448 -> 60376 bytes
- src/dowall.c   |   3 +++
- src/shutdown.c |   4 +++-
- 4 files changed, 9 insertions(+), 1 deletion(-)
+ src/bootlogd.c   | 1 +
+ src/mountpoint.c | 1 +
+ src/shutdown.c   | 1 +
+ 3 files changed, 3 insertions(+)
 
-Index: sysvinit-2.88dsf/src/bootlogd.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/bootlogd.c
-+++ sysvinit-2.88dsf/src/bootlogd.c
-@@ -53,6 +53,9 @@
- #ifdef __linux__
- #include <sys/mount.h>
- #endif
-+#ifdef __GLIBC__
-+#include <sys/sysmacros.h>
-+#endif
- 
- char *Version = "@(#) bootlogd 2.86 03-Jun-2004 miquels@cistron.nl";
- 
-Index: sysvinit-2.88dsf/src/dowall.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/dowall.c
-+++ sysvinit-2.88dsf/src/dowall.c
-@@ -37,6 +37,9 @@
- #include <signal.h>
- #include <setjmp.h>
- #include <paths.h>
-+#ifdef __GLIBC__
+diff --git a/src/bootlogd.c b/src/bootlogd.c
+index 570d382..68d62f3 100644
+--- a/src/bootlogd.c
++++ b/src/bootlogd.c
+@@ -35,6 +35,7 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
 +#include <sys/sysmacros.h>
-+#endif
+ #include <sys/ioctl.h>
+ #include <sys/utsname.h>
+ #include <time.h>
+diff --git a/src/mountpoint.c b/src/mountpoint.c
+index 9e3dd9c..91f74ed 100644
+--- a/src/mountpoint.c
++++ b/src/mountpoint.c
+@@ -25,6 +25,7 @@
  
- #ifndef _PATH_DEV
- # define _PATH_DEV	"/dev/"
-Index: sysvinit-2.88dsf/src/shutdown.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/shutdown.c
-+++ sysvinit-2.88dsf/src/shutdown.c
-@@ -57,7 +57,9 @@
- #include "reboot.h"
- #include "initreq.h"
- #include "init.h"
--
-+#ifdef __GLIBC__
+ #include <sys/types.h>
+ #include <sys/stat.h>
 +#include <sys/sysmacros.h>
-+#endif
- 
- char *Version = "@(#) shutdown 2.86-1 31-Jul-2004 miquels@cistron.nl";
- 
-Index: sysvinit-2.88dsf/src/mountpoint.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/mountpoint.c
-+++ sysvinit-2.88dsf/src/mountpoint.c
-@@ -32,6 +32,9 @@
- #include <stdarg.h>
- #include <getopt.h>
- #include <stdio.h>
-+#ifdef __GLIBC__
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 7e997da..17de58d 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -40,6 +40,7 @@
+ #endif
+ #include <sys/types.h>
+ #include <sys/stat.h>
 +#include <sys/sysmacros.h>
-+#endif
- 
- int dostat(char *path, struct stat *st, int do_lstat, int quiet)
- {
+ #include <sys/wait.h>
+ #include <time.h>
+ #include <string.h>
-- 
2.22.0


