Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 07A5C731AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:28 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id uo6so404040903pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uFWixOwWqrY/65FqrMYqhG6psdL6ALSitfeyp2PDiNU=;
	b=oHfTVXlnlcVRmlpm8wwWARiH2kHA411lzydPaSg1+c1Uu2IifgLAyrqQucypq3tjht
	yT3mpRYB9Du4iikNdY8NyTZ73HRR3/ybmPwh+2faT001PWhRwSqw2kRskqtB0dhmD0QO
	foqpOIQB3x0CTGUMznwx9zYoQASSiWL4VMvxYIERsHftPVr4k5jYnGhjTAXotNvFYyTl
	4G45sVmCH8/CJ89+rHYw3ISEDCjENAXAJPrNVp7rJwG6hFPFx8g/fHBcFe5DlbpfG6u1
	NKtFDYFBHF1o7ESnBzTQK0tQhJ0033Gi8LvV4bZeExZ5mb3KpSWcXJYSysCieMm5SmZG
	QWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uFWixOwWqrY/65FqrMYqhG6psdL6ALSitfeyp2PDiNU=;
	b=KdER8X0+l+/nW3xQnrugdPh8WsrI8qlu8flkLqrxy4uBV7nCHdSrc1TeEUwCeCAxnI
	MJ15BU67P0UNEZZT6lZiIQd8DvnznJcnIGkB9sZ/MDlahZ+Trk/HMQD5iSrsZCCaJ05W
	x3Dt18R6jE9QEcP6mlcC9iAN4xb45lEmiJPY9i2tuBhY7jf+7Sz3ClwmbpCoN4LLRrhc
	fmHLU08HEqLjnojp1inWJJx/RYdkl/soz+j65IUqSpFOgKQOZ/LqiIBBuD2skQwqmKGr
	L0TIP1dfD7Oiq54igZJ0hn2DnLQ5Fj9SBkO9j+VrnA82X73+OSRzaAKVCEyTNxlJeHq1
	iNOw==
X-Gm-Message-State: ALoCoQk6pKp7+CjXAIi1+MJ6q4680HNgjZFYLUUlKk1NFWSgZVIzX+9de7STc90oUb08ZHsmzRBh+rMQHUvrlns8rC6r2O3VRw==
X-Received: by 10.66.124.232 with SMTP id ml8mr27983621pab.98.1453030649696;
	Sun, 17 Jan 2016 03:37:29 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:05 -0800
Message-Id: <50cb143fdb04b78510ac5f567cc79dafbe8130ab.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 32/73] sysklogd: untangle header inclusion maze
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:29 -0000

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


