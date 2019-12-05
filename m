Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 913C27F838
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j42so4140114wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FG01Y+DTFMZDWpTL3LkU0IZyH4JXm5RhGGlmt+rfohk=;
	b=k9+ahJawZ+Hksx1ZjjrVAizyLOkY31NN/maMRQGfcPwxySL0MxSgf/LGcONeMLErQD
	i3qpoQRdmm8/9Kwg4QS7oUoQZLqcKhA9YTKfO3SUa/9RlA5pqRQD4mg4cngHkluo7k7e
	nzS2T50ZX9B/oNkbg4YwNEGpJzPFR/YBd0b45F0hNCVDzv17j8G05TiRBV+aP1joLhQX
	S0gP37XbUVAhVHWv3J0QXCnDjicm90xF0qUE06gartzV2MRaL4pacL6H75usPS+RSD5I
	3APD2wCVLlWBP+Fh/0bP+0dDHKBfRy0fpgiLtv236gopNInOKmhL0Iis2suZ4fgACGBG
	gtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FG01Y+DTFMZDWpTL3LkU0IZyH4JXm5RhGGlmt+rfohk=;
	b=dE03VJI1m+h3GN3AFQaGvF26Vh4QIHXKF8VfhDNOA9Nn7irufL4Dj+Kgh/cMu8XUeA
	cW52hSeZ/g+UAy3KynIVxV56+SaHS9cwoJj+jRIhrvjvqs3lfQsg1vehARGs9KfPkV5E
	NWeInJ9o5j2A8UTY6CsabrwLZBqyHHHW2AZEMUGBmtbD85CerMst3B6W9hs5j1MllHfN
	D2npgnGbk+zSTMYvYvIIq8l8CQOjVnovIeQuDUEROxo+1zTvRP+7AMSK88xMST8td3oa
	ohFf70paw7c0TAOCAIIASfJjlXk0OSUQqPKljJOYSNT3LnPrDqhEEtf9k+98ze69+HQZ
	AU3w==
X-Gm-Message-State: APjAAAWBAbstgibsHHTHC3oeJGgl4I7PCzuzmH7mMPczUSpdWPOmz1O2
	HAeKTwlM2gRORJpxrELMSlnsP30V
X-Google-Smtp-Source: APXvYqwS5bSDA0/ja3libwbqNDNAI1TFOru3d5R6+zTNo0BE9dHHfsnSzmrVLE7C2B6q+b0bTixPVQ==
X-Received: by 2002:adf:f847:: with SMTP id d7mr11245560wrq.35.1575560656704; 
	Thu, 05 Dec 2019 07:44:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:48 +0100
Message-Id: <20191205154357.121346-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/24] sysklogd: update to 2.0.3
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:17 -0000

Drop all patches as they are no longer necessary with autotools,
fix problems that are addressed upstream, or (in case of no-vectorization.patch)
don't apply to the old version either, which means no one is using that hw target
anymore.

Remove custom systemd configs (provided by upstream), and custom
syslog config (also provided by upstream but not installed by default).

Adjust parselogs to not error out on not being able to find
System.map file during boot (that is packaged into kernel-dev
and is not normally installed).

License-Update: various tweaks; the license terms are the same.
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py      |   3 +-
 .../files/0001-Fix-build-with-musl.patch      | 132 ------------------
 ...t-causes-a-segmentation-fault-under-.patch |  28 ----
 ...or-respecting-flags-from-environment.patch |  35 -----
 .../sysklogd/files/klogd.service              |  13 --
 .../sysklogd/files/no-strip-install.patch     |  17 ---
 .../sysklogd/files/no-vectorization.patch     |  20 ---
 meta/recipes-extended/sysklogd/files/sysklogd |   4 +-
 .../sysklogd/files/syslog.conf                |  71 ----------
 .../sysklogd/files/syslogd.service            |  14 --
 .../sysklogd/files/tmpfiles.sysklogd.conf     |   1 -
 meta/recipes-extended/sysklogd/sysklogd.inc   |  46 ++----
 .../sysklogd/sysklogd_1.5.1.bb                |   3 -
 .../sysklogd/sysklogd_2.0.3.bb                |   3 +
 14 files changed, 19 insertions(+), 371 deletions(-)
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 delete mode 100644 meta/recipes-extended/sysklogd/files/no-strip-install.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/no-vectorization.patch
 delete mode 100644 meta/recipes-extended/sysklogd/files/syslog.conf
 delete mode 100644 meta/recipes-extended/sysklogd/files/syslogd.service
 delete mode 100644 meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
 delete mode 100644 meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
 create mode 100644 meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 15343d7abbe..b7c7b30adf5 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -55,7 +55,8 @@ common_errors = [
     "Failed to read /var/lib/nfs/statd/state: Success",
     "error retry time-out =",
     "logind: cannot setup systemd-logind helper (-61), using legacy fallback",
-    "Error changing net interface name 'eth0' to "
+    "Error changing net interface name 'eth0' to ",
+    "Cannot find a map file"
     ]
 
 video_related = [
diff --git a/meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch b/meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
deleted file mode 100644
index 9567946c0cb..00000000000
--- a/meta/recipes-extended/sysklogd/files/0001-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From f0af5bcfd753691652eac35efbcb208c933253f1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Aug 2015 05:11:53 +0000
-Subject: [PATCH] Fix build with musl
-
-Explicitly include fcntl.h since with glibc is comes in as indirect
-include but not with musl
-
-linux/time.h inclusion is not required on musl so using !__GLIBC__ is
-not right for musl here
-
-wait type is glibc specific
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- klogd.c    | 10 +---------
- ksym_mod.c |  5 +----
- pidfile.c  |  1 +
- syslog.c   |  3 ++-
- syslogd.c  |  4 +---
- 5 files changed, 6 insertions(+), 17 deletions(-)
-
-diff --git a/klogd.c b/klogd.c
-index 6cc80ed..9219671 100644
---- a/klogd.c
-+++ b/klogd.c
-@@ -260,11 +260,8 @@
- #include <unistd.h>
- #include <signal.h>
- #include <errno.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #include <sys/stat.h>
--#if !defined(__GLIBC__)
--#include <linux/time.h>
--#endif /* __GLIBC__ */
- #include <stdarg.h>
- #include <paths.h>
- #include <stdlib.h>
-@@ -277,13 +274,8 @@
- 
- #define __LIBRARY__
- #include <linux/unistd.h>
--#if !defined(__GLIBC__)
--# define __NR_ksyslog __NR_syslog
--_syscall3(int,ksyslog,int, type, char *, buf, int, len);
--#else
- #include <sys/klog.h>
- #define ksyslog klogctl
--#endif
- 
- #define LOG_BUFFER_SIZE 4096
- #define LOG_LINE_LENGTH 1000
-diff --git a/ksym_mod.c b/ksym_mod.c
-index 68cd6b6..6e26da1 100644
---- a/ksym_mod.c
-+++ b/ksym_mod.c
-@@ -113,12 +113,9 @@
- #include <unistd.h>
- #include <signal.h>
- #include <errno.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #include <sys/stat.h>
- #include "module.h"
--#if !defined(__GLIBC__)
--#include <linux/time.h>
--#endif /* __GLIBC__ */
- #include <stdarg.h>
- #include <paths.h>
- #include <linux/version.h>
-diff --git a/pidfile.c b/pidfile.c
-index e0959a0..6daa2e0 100644
---- a/pidfile.c
-+++ b/pidfile.c
-@@ -31,6 +31,7 @@
- #include <string.h>
- #include <errno.h>
- #include <signal.h>
-+#include <fcntl.h>
- 
- /* read_pid
-  *
-diff --git a/syslog.c b/syslog.c
-index bdb3ff2..ef7b34e 100644
---- a/syslog.c
-+++ b/syslog.c
-@@ -55,7 +55,7 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <sys/file.h>
--#include <sys/signal.h>
-+//#include <sys/signal.h>
- #include <sys/syslog.h>
- #if 0
- #include "syslog.h"
-@@ -72,6 +72,7 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
- #include <stdarg.h>
- #include <paths.h>
- #include <stdio.h>
-+#include <fcntl.h>
- 
- #define	_PATH_LOGNAME	"/dev/log"
- 
-diff --git a/syslogd.c b/syslogd.c
-index ea73ea5..1ca0595 100644
---- a/syslogd.c
-+++ b/syslogd.c
-@@ -818,9 +818,7 @@ void doexit(int sig);
- void init();
- void cfline(char *line, register struct filed *f);
- int decode(char *name, struct code *codetab);
--#if defined(__GLIBC__)
- #define dprintf mydprintf
--#endif /* __GLIBC__ */
- static void dprintf(char *, ...);
- static void allocate_log(void);
- void sighup_handler();
-@@ -2094,7 +2092,7 @@ void reapchild()
- 	(void) signal(SIGCHLD, reapchild);	/* reset signal handler -ASP */
- 	wait ((int *)0);
- #else
--	union wait status;
-+	int status;
- 
- 	while (wait3(&status, WNOHANG, (struct rusage *) NULL) > 0)
- 		;
--- 
-2.5.1
-
diff --git a/meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch b/meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
deleted file mode 100644
index 56431af8456..00000000000
--- a/meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cb72b3e172c238b4b5ae5935dc6be54f5034fcf1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Jun 2017 18:20:06 -0700
-Subject: [PATCH 1/2] fix problems that causes a segmentation fault under some
- conditions
-
-Upstream-Status: Inappropriate [ no upstream ]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ksym_mod.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ksym_mod.c b/ksym_mod.c
-index 6e26da1..a3daa7d 100644
---- a/ksym_mod.c
-+++ b/ksym_mod.c
-@@ -186,7 +186,6 @@ extern int InitMsyms()
- 		else
- 			Syslog(LOG_ERR, "Error loading kernel symbols " \
- 			       "- %s\n", strerror(errno));
--		fclose(ksyms);
- 		return(0);
- 	}
- 
--- 
-2.13.2
-
diff --git a/meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch b/meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
deleted file mode 100644
index ebbdef303bc..00000000000
--- a/meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b22f244732cd0f475af2f82fc7eecec49f90623b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Jul 2017 00:01:50 -0700
-Subject: [PATCH 2/2] Make way for respecting flags from environment
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 5af1689..af699d2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -17,14 +17,12 @@
- #   along with this program; if not, write to the Free Software
- #   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- 
--CC= gcc
- #SKFLAGS= -g -DSYSV -Wall
- #LDFLAGS= -g
--SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce
-+SKFLAGS = $(CFLAGS) $(CPPFLAGS) -DSYSV -Wall -fno-strength-reduce
- # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
- # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
- # $(shell getconf LFS_SKFLAGS)
--LDFLAGS= -s
- 
- # Look where your install program is.
- INSTALL = /usr/bin/install
--- 
-2.13.2
-
diff --git a/meta/recipes-extended/sysklogd/files/klogd.service b/meta/recipes-extended/sysklogd/files/klogd.service
deleted file mode 100644
index 0c888c497dd..00000000000
--- a/meta/recipes-extended/sysklogd/files/klogd.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Kernel Logging Service
-After=syslogd.service
-
-[Service]
-Type=forking
-ExecStart=/sbin/klogd
-PIDFile=/var/run/klogd.pid
-StandardOutput=null
-Restart=on-failure
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-extended/sysklogd/files/no-strip-install.patch b/meta/recipes-extended/sysklogd/files/no-strip-install.patch
deleted file mode 100644
index d426c83bf25..00000000000
--- a/meta/recipes-extended/sysklogd/files/no-strip-install.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: sysklogd-1.5.1/Makefile
-===================================================================
---- sysklogd-1.5.1.orig/Makefile
-+++ sysklogd-1.5.1/Makefile
-@@ -127,8 +127,8 @@ clobber: clean
- 	rm -f syslogd klogd ksym syslog_tst oops_test TAGS tsyslogd tklogd
- 
- install_exec: syslogd klogd
--	${INSTALL} -m 500 -s syslogd ${BINDIR}/syslogd
--	${INSTALL} -m 500 -s klogd ${BINDIR}/klogd
-+	${INSTALL} -m 500 syslogd ${BINDIR}/syslogd
-+	${INSTALL} -m 500 klogd ${BINDIR}/klogd
- 
- install_man:
- 	${INSTALL} -o ${MAN_USER} -g ${MAN_GROUP} -m ${MAN_PERMS} sysklogd.8 ${MANDIR}/man8/sysklogd.8
diff --git a/meta/recipes-extended/sysklogd/files/no-vectorization.patch b/meta/recipes-extended/sysklogd/files/no-vectorization.patch
deleted file mode 100644
index c1cc042c9cf..00000000000
--- a/meta/recipes-extended/sysklogd/files/no-vectorization.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate
-
-The compiler should not be generating vectorized instructions on this target.
-This is a work around until I can determine why this is occuring on this
-particular recipe
-
-Index: sysklogd-1.5/Makefile
-===================================================================
---- sysklogd-1.5.orig/Makefile
-+++ sysklogd-1.5/Makefile
-@@ -20,7 +20,8 @@
- CC= gcc
- #SKFLAGS= -g -DSYSV -Wall
- #LDFLAGS= -g
--SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce
-+SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce \
-+	-fno-tree-vectorize
- # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
- # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
- # $(shell getconf LFS_SKFLAGS)
diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/files/sysklogd
index 73424840ba3..4a4ca8a78ed 100755
--- a/meta/recipes-extended/sysklogd/files/sysklogd
+++ b/meta/recipes-extended/sysklogd/files/sysklogd
@@ -19,8 +19,8 @@ PATH=/bin:/usr/bin:/sbin:/usr/sbin
 
 pidfile_syslogd=/var/run/syslogd.pid
 pidfile_klogd=/var/run/klogd.pid
-binpath_syslogd=/sbin/syslogd
-binpath_klogd=/sbin/klogd
+binpath_syslogd=/usr/sbin/syslogd
+binpath_klogd=/usr/sbin/klogd
 
 test -x $binpath || exit 0
 
diff --git a/meta/recipes-extended/sysklogd/files/syslog.conf b/meta/recipes-extended/sysklogd/files/syslog.conf
deleted file mode 100644
index 0849de12687..00000000000
--- a/meta/recipes-extended/sysklogd/files/syslog.conf
+++ /dev/null
@@ -1,71 +0,0 @@
-#  /etc/syslog.conf	Configuration file for syslogd.
-#
-#  Ported from debian by Yu Ke <ke.yu@intel.com>
-#
-
-#
-# First some standard logfiles.  Log by facility.
-#
-
-auth,authpriv.*			/var/log/auth.log
-*.*;auth,authpriv.none		-/var/log/syslog
-#cron.*				/var/log/cron.log
-daemon.*			-/var/log/daemon.log
-kern.*				-/var/log/kern.log
-lpr.*				-/var/log/lpr.log
-mail.*				-/var/log/mail.log
-user.*				-/var/log/user.log
-
-#
-# Logging for the mail system.  Split it up so that
-# it is easy to write scripts to parse these files.
-#
-mail.info			-/var/log/mail.info
-mail.warn			-/var/log/mail.warn
-mail.err			/var/log/mail.err
-
-# Logging for INN news system
-#
-news.crit			/var/log/news.crit
-news.err			/var/log/news.err
-news.notice			-/var/log/news.notice
-
-#
-# Some `catch-all' logfiles.
-#
-*.=debug;\
-auth,authpriv.none;\
-news.none;mail.none	-/var/log/debug
-
-*.=info;*.=notice;*.=warn;\
-auth,authpriv.none;\
-cron,daemon.none;\
-mail,news.none		-/var/log/messages
-
-#
-# Emergencies are sent to everybody logged in.
-#
-*.emerg				*
-
-#
-# I like to have messages displayed on the console, but only on a virtual
-# console I usually leave idle.
-#
-#daemon,mail.*;\
-#news.=crit;news.=err;news.=notice;\
-#*.=debug;*.=info;\
-#*.=notice;*.=warn	/dev/tty8
-
-# The named pipe /dev/xconsole is for the `xconsole' utility.  To use it,
-# you must invoke `xconsole' with the `-file' option:
-#
-#    $ xconsole -file /dev/xconsole [...]
-#
-# NOTE: adjust the list below, or you'll go crazy if you have a reasonably
-#      busy site..
-#
-daemon.*;mail.*;\
-news.err;\
-*.=debug;*.=info;\
-*.=notice;*.=warn	|/dev/xconsole
-
diff --git a/meta/recipes-extended/sysklogd/files/syslogd.service b/meta/recipes-extended/sysklogd/files/syslogd.service
deleted file mode 100644
index eeaff3d38d6..00000000000
--- a/meta/recipes-extended/sysklogd/files/syslogd.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=System Logging Service
-Requires=syslog.socket
-
-[Service]
-Type=forking
-ExecStart=/sbin/syslogd
-PIDFile=/var/run/syslogd.pid
-StandardOutput=null
-Restart=on-failure
-
-[Install]
-WantedBy=multi-user.target
-Alias=syslog.service
diff --git a/meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf b/meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
deleted file mode 100644
index f4aecd385b6..00000000000
--- a/meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
+++ /dev/null
@@ -1 +0,0 @@
-p /dev/xconsole 0640 root adm
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 749026f8533..dad62e421f6 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -6,27 +6,26 @@ SECTION = "base"
 LICENSE = "GPLv2+ & BSD"
 LICENSE_syslogd = "BSD"
 LICENSE_klogd = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://syslogd.c;beginline=2;endline=15;md5=77ffb2fec48c46d7ca0abb2d5813e7fd \
-                    file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/syslogd.c;beginline=2;endline=15;md5=a880fecbc04503f071c494a9c0dd4f97 \
+                    file://src/klogd.c;beginline=2;endline=19;md5=4f5591d04cccbeb0352758ed4a9d7213 \
                    "
 
-inherit update-rc.d update-alternatives systemd
+inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
-           file://no-strip-install.patch \
-           file://0001-Fix-build-with-musl.patch \
-           file://0001-fix-problems-that-causes-a-segmentation-fault-under-.patch \
-           file://0002-Make-way-for-respecting-flags-from-environment.patch \
            file://sysklogd \
-           file://syslog.conf \
-           file://syslogd.service \
-           file://klogd.service \
-           file://tmpfiles.sysklogd.conf \
            "
 S = "${WORKDIR}/git"
 
-SRC_URI_append_e500v2 = " file://no-vectorization.patch"
+EXTRA_OECONF = "--with-klogd --without-logger"
+
+do_install_append () {
+       install -d ${D}${sysconfdir}
+       install -m 644 ${S}/syslog.conf ${D}${sysconfdir}/syslog.conf
+       install -d ${D}${sysconfdir}/init.d
+       install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
+}
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "syslogd.service klogd.service"
@@ -36,27 +35,6 @@ INITSCRIPT_NAME = "syslog"
 CONFFILES_${PN} = "${sysconfdir}/syslog.conf"
 RCONFLICTS_${PN} = "rsyslog busybox-syslog syslog-ng"
 
-CFLAGS += "-DSYSV -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
-
-do_install () {
-	install -d ${D}${mandir}/man8 \
-			${D}${mandir}/man5 \
-			${D}${base_sbindir}
-	oe_runmake 'BINDIR=${D}${base_sbindir}' \
-			'MANDIR=${D}${mandir}' install
-	install -d ${D}${sysconfdir}
-	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
-	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
-	install -d ${D}${systemd_unitdir}/system
-	install -m 644 ${WORKDIR}/syslogd.service ${D}${systemd_unitdir}/system
-	install -m 644 ${WORKDIR}/klogd.service ${D}${systemd_unitdir}/system
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true', 'false', d)}; then
-		install -d ${D}${exec_prefix}/lib/tmpfiles.d
-		install -m 644 ${WORKDIR}/tmpfiles.sysklogd.conf ${D}${exec_prefix}/lib/tmpfiles.d/sysklogd.conf
-	fi
-}
-
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
 
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
deleted file mode 100644
index 88bcfd9e4a0..00000000000
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require sysklogd.inc
-
-SRCREV = "930a2b1c0d15b14309a49f14e3f30e905456af4d"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb b/meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb
new file mode 100644
index 00000000000..21f750fa60f
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.0.3.bb
@@ -0,0 +1,3 @@
+require sysklogd.inc
+
+SRCREV = "ad686ca86d977f9eac4cd0a0d0e9a5964a4621d3"
-- 
2.17.1


