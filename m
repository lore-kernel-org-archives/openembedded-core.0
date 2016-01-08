Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F37177011
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:49 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id b35so218714261qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uFWixOwWqrY/65FqrMYqhG6psdL6ALSitfeyp2PDiNU=;
	b=dhvM8kpxGTFkGb4+gjCVB1tTDH799kVPOWqq8/rvQGoU+FMp9IXQzTIkB3zzdXnJjW
	D6sZtwLE6k3W0mLP73Ol8V3qhu5f+EK7ijJjLtaetA0l03V9P/dZ652gp8tH80S0ypDT
	7opKFFaki35RDYUc0pL7u/BMHAW1R4fbPeHc3qcQFWAUVbstSP6b68v4vwWguv6Igz4M
	bdUGxlJGhX9RG8zlhLIBopCY2HTwmtoEC+9bg65x/sosas7swBqD+xR1aKpqnWEzTOPi
	625m+/WUeZxwFSzttxHjpmAexbTW6+YDwYWI3JgXrTdCeo7AB+Z4NgwPs2/ljxgPh3AY
	SF3Q==
X-Received: by 10.140.230.134 with SMTP id a128mr151066881qhc.33.1452248390657;
	Fri, 08 Jan 2016 02:19:50 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:03 +0000
Message-Id: <5ade24fb410ab12416e08d7335e79d7b9481e0ff.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 35/53] sysklogd: untangle header inclusion maze
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:50 -0000

wait is not union per posix it is int
remove assumption about glibc is linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sysklogd/files/0001-Fix-build-with-musl.patch  | 132 +++++++++++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc        |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch b/meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000..9567946
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
@@ -0,0 +1,132 @@
+From f0af5bcfd753691652eac35efbcb208c933253f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 05:11:53 +0000
+Subject: [PATCH] Fix build with musl
+
+Explicitly include fcntl.h since with glibc is comes in as indirect
+include but not with musl
+
+linux/time.h inclusion is not required on musl so using !__GLIBC__ is
+not right for musl here
+
+wait type is glibc specific
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ klogd.c    | 10 +---------
+ ksym_mod.c |  5 +----
+ pidfile.c  |  1 +
+ syslog.c   |  3 ++-
+ syslogd.c  |  4 +---
+ 5 files changed, 6 insertions(+), 17 deletions(-)
+
+diff --git a/klogd.c b/klogd.c
+index 6cc80ed..9219671 100644
+--- a/klogd.c
++++ b/klogd.c
+@@ -260,11 +260,8 @@
+ #include <unistd.h>
+ #include <signal.h>
+ #include <errno.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+-#if !defined(__GLIBC__)
+-#include <linux/time.h>
+-#endif /* __GLIBC__ */
+ #include <stdarg.h>
+ #include <paths.h>
+ #include <stdlib.h>
+@@ -277,13 +274,8 @@
+ 
+ #define __LIBRARY__
+ #include <linux/unistd.h>
+-#if !defined(__GLIBC__)
+-# define __NR_ksyslog __NR_syslog
+-_syscall3(int,ksyslog,int, type, char *, buf, int, len);
+-#else
+ #include <sys/klog.h>
+ #define ksyslog klogctl
+-#endif
+ 
+ #define LOG_BUFFER_SIZE 4096
+ #define LOG_LINE_LENGTH 1000
+diff --git a/ksym_mod.c b/ksym_mod.c
+index 68cd6b6..6e26da1 100644
+--- a/ksym_mod.c
++++ b/ksym_mod.c
+@@ -113,12 +113,9 @@
+ #include <unistd.h>
+ #include <signal.h>
+ #include <errno.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include "module.h"
+-#if !defined(__GLIBC__)
+-#include <linux/time.h>
+-#endif /* __GLIBC__ */
+ #include <stdarg.h>
+ #include <paths.h>
+ #include <linux/version.h>
+diff --git a/pidfile.c b/pidfile.c
+index e0959a0..6daa2e0 100644
+--- a/pidfile.c
++++ b/pidfile.c
+@@ -31,6 +31,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <signal.h>
++#include <fcntl.h>
+ 
+ /* read_pid
+  *
+diff --git a/syslog.c b/syslog.c
+index bdb3ff2..ef7b34e 100644
+--- a/syslog.c
++++ b/syslog.c
+@@ -55,7 +55,7 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/file.h>
+-#include <sys/signal.h>
++//#include <sys/signal.h>
+ #include <sys/syslog.h>
+ #if 0
+ #include "syslog.h"
+@@ -72,6 +72,7 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
+ #include <stdarg.h>
+ #include <paths.h>
+ #include <stdio.h>
++#include <fcntl.h>
+ 
+ #define	_PATH_LOGNAME	"/dev/log"
+ 
+diff --git a/syslogd.c b/syslogd.c
+index ea73ea5..1ca0595 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -818,9 +818,7 @@ void doexit(int sig);
+ void init();
+ void cfline(char *line, register struct filed *f);
+ int decode(char *name, struct code *codetab);
+-#if defined(__GLIBC__)
+ #define dprintf mydprintf
+-#endif /* __GLIBC__ */
+ static void dprintf(char *, ...);
+ static void allocate_log(void);
+ void sighup_handler();
+@@ -2094,7 +2092,7 @@ void reapchild()
+ 	(void) signal(SIGCHLD, reapchild);	/* reset signal handler -ASP */
+ 	wait ((int *)0);
+ #else
+-	union wait status;
++	int status;
+ 
+ 	while (wait3(&status, WNOHANG, (struct rusage *) NULL) > 0)
+ 		;
+-- 
+2.5.1
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 85b3cdc..f789c54 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -15,6 +15,7 @@ inherit update-rc.d update-alternatives
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
+           file://0001-Fix-build-with-musl.patch \
            file://sysklogd \
            file://syslog.conf \
            "
-- 
2.7.0


