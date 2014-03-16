Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id B33F66F5DE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:05 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so4334780pbc.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uip9Ikzvz1hZsI/d3EBED4wnwrkJCZHr999bkieN598=;
	b=wTUqtyfZZ9YeQkufJF02PLa4o9KnYIKBtT+MnBRS9wsGngPcYyiyBnFYXOv5j0Jx40
	nxeHOJvgAvlqpBGXZQEc78n9xHZHUWN3seN5TSaUz+s75Y+jX8XaubjtGwt21qT4X8sK
	k2bZ8nW2lLJRFbt5HYdT1mfYi+fTwYHRtVZYef7WXJSCFm3rjig63zuigF+QpVqh7gHn
	d9vjolDl7MGlt2bDA970pGw/adbClfGYDd/4BZqtml9qDIyi4ZvBWFvrRadIVjk1+i55
	XxnZuwqSH1kEaXju9uoLfg8V5Yq+UQJ5ak3hVlfy1EF9mdVWZq5rdxyV6VGKrU3ifsaj
	y+8g==
X-Received: by 10.66.145.230 with SMTP id sx6mr18618496pab.47.1394948466514;
	Sat, 15 Mar 2014 22:41:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:26 -0700
Message-Id: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] uclibc: Implement clock_adjtime()
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:05 -0000

systemd needs it
Also update to latest master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  3 +-
 .../0004-Add-clock_adjtime-syscall.patch           | 73 ++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 3c8e47c..0649aca 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,4 +1,4 @@
-SRCREV="19f21a1d974d802f05c43e4cabd6ed6891a8ae50"
+SRCREV="5eddde8f094ef52dca06695cc598e3b2556dcccb"
 
 PV = "0.9.33+git${SRCPV}"
 
@@ -24,5 +24,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0001-Add-eventfd_read-and-eventfd_write.patch \
 	file://0002-wire-setns-syscall.patch \
 	file://0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch \
+        file://0004-Add-clock_adjtime-syscall.patch \ 
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch b/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
new file mode 100644
index 0000000..3062ae4
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
@@ -0,0 +1,73 @@
+From 8e19e651145554fbcb90179f3dfbc7ea8a07c900 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Mar 2014 09:32:20 -0700
+Subject: [PATCH 4/4] Add clock_adjtime syscall
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/sys/timex.h                       |  5 ++++-
+ libc/sysdeps/linux/common/Makefile.in     |  2 +-
+ libc/sysdeps/linux/common/clock_adjtime.c | 15 +++++++++++++++
+ 3 files changed, 20 insertions(+), 2 deletions(-)
+ create mode 100644 libc/sysdeps/linux/common/clock_adjtime.c
+
+diff --git a/include/sys/timex.h b/include/sys/timex.h
+index 621afce..9082a28 100644
+--- a/include/sys/timex.h
++++ b/include/sys/timex.h
+@@ -20,6 +20,7 @@
+ 
+ #include <features.h>
+ #include <sys/time.h>
++#include <time.h>
+ 
+ /* These definitions from linux/timex.h as of 2.2.0.  */
+ 
+@@ -125,7 +126,9 @@ libc_hidden_proto(adjtimex)
+ extern int ntp_gettime (struct ntptimeval *__ntv) __THROW;
+ extern int ntp_adjtime (struct timex *__tntx) __THROW;
+ #endif
+-
++#if defined __UCLIBC_HAS_REALTIME__
++extern int clock_adjtime (clockid_t __clock_id, struct timex *__ntx) __THROW;
++#endif
+ __END_DECLS
+ 
+ #endif /* sys/timex.h */
+diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
+index 10d9884..bb985b6 100644
+--- a/libc/sysdeps/linux/common/Makefile.in
++++ b/libc/sysdeps/linux/common/Makefile.in
+@@ -84,7 +84,7 @@ CSRC-$(ARCH_USE_MMU) += msync.c
+ CSRC-$(UCLIBC_BSD_SPECIFIC) += mincore.c setdomainname.c
+ CSRC-$(UCLIBC_NTP_LEGACY) += ntp_gettime.c
+ # aio_cancel|aio_error|aio_fsync|aio_read|aio_return|aio_suspend|aio_write|clock_getres|clock_gettime|clock_settime|clock_settime|fdatasync|lio_listio|mlockall|munlockall|mlock|munlock|mq_close|mq_getattr|mq_notify|mq_open|mq_receive|mq_timedreceive|mq_send|mq_timedsend|mq_setattr|mq_unlink|nanosleep|sched_getparam|sched_get_priority_max|sched_get_priority_min|sched_getscheduler|sched_rr_get_interval|sched_setparam|sched_setscheduler|sem_close|sem_destroy|sem_getvalue|sem_init|sem_open|sem_post|sem_trywait|sem_wait|sem_unlink|sem_wait|shm_open|shm_unlink|sigqueue|sigtimedwait|sigwaitinfo|timer_create|timer_delete|timer_getoverrun|timer_gettime|timer_settime
+-CSRC-$(UCLIBC_HAS_REALTIME) += clock_getres.c clock_gettime.c clock_settime.c \
++CSRC-$(UCLIBC_HAS_REALTIME) += clock_adjtime.c clock_getres.c clock_gettime.c clock_settime.c \
+ 	fdatasync.c mlockall.c mlock.c munlockall.c munlock.c \
+ 	nanosleep.c __rt_sigtimedwait.c __rt_sigwaitinfo.c sched_getparam.c \
+ 	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
+diff --git a/libc/sysdeps/linux/common/clock_adjtime.c b/libc/sysdeps/linux/common/clock_adjtime.c
+new file mode 100644
+index 0000000..968ec27
+--- /dev/null
++++ b/libc/sysdeps/linux/common/clock_adjtime.c
+@@ -0,0 +1,15 @@
++/*
++ * clock_adjtime() for uClibc
++ *
++ * Copyright (C) 2005 by Peter Kjellerstedt <pkj@axis.com>
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <sys/timex.h>
++
++#ifdef __NR_clock_adjtime
++_syscall2(int, clock_adjtime, clockid_t, clock_id, struct timex*, ntx)
++#endif
+-- 
+1.9.0
+
-- 
1.9.0


