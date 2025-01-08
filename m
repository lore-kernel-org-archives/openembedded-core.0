Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40D5E7719F
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14677.1736325754167788598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hThyhsIF;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa69107179cso2742304066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325752; x=1736930552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbF3j3hVSgiB9kSGfLL1+//t7Y4vDl9BzIEN/hN2aUs=;
        b=hThyhsIF69vkRkw/AD22pELJ57iuGUqv3kIaW9+siqBmRLdCAuQ5+wm/P4AUK2qc8R
         TbiTMpOUY3GxWhDRlDLFnzEA8Piil5UmVLVJSjuCGtfPJKHSa9/ksgCjM/2IcGEkChhH
         2JLC138ZYC4G4g4IqWgUAzjhfuuTLrN82WMTl3gXTT0/M5yyapDdA0zzydRygDGvEBZ1
         Qt+Fi8A2Mzgu9yy/hqNRZuA0iETgpZHefzZbEoWr1gVENM8uCUXaFmaTYT4vwrDJAkog
         ckAo/2nV9bwPIe2Bno2uj5nUQNCCWeSiQcM3MZCKjeHn39HhiJEKzTY+M11dQEhFyMrB
         3P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325752; x=1736930552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbF3j3hVSgiB9kSGfLL1+//t7Y4vDl9BzIEN/hN2aUs=;
        b=rMepRKgIqhirBuhmQfDiJgDvK8tRR7hkjmGWCX4we4BpJX7xIoniRHPIgrcBHmaXmf
         QWZ+agtr/sL9CnCne+zs3SGxe98MCkN/hKAO+lDOGURkekbV8omXioE+EYGovIL1FNGj
         e7NZ9P1HI8yRyYCwK7Prilus+KXDl2Xji1G4x9wrUdvEmGM+ccjQeto2racpL4QdQnB8
         FqhOR/ohwHrZtIHBnTbGAZ7KHfoy0qrBFLPFNOSHo70Kj5C4rlGv3sL4UL8Wlyt2FPpv
         olVw0eo9FWFI7vyemSNaVfSBn/ps/6RzYZ1NPvmPctOoGoFWI3ErgXIIsPHKoqLWH4U/
         IhIA==
X-Gm-Message-State: AOJu0YwIrgxjKFIiYaXpCrr5OtW7eeeyxII1YUWleomzsdxeJOWeDqkH
	6CPaNppbBOq8anc9rjgz6q7/Apzk2iigR2en6geE3LDK0ZXNZLvA7KO4Kg==
X-Gm-Gg: ASbGnctotLscAp4bCE1ASFuOxgOu3sUajuKWs4I1IOCJ0ESqth6CTF30XiW3UdE3pZA
	5FbdqwN+3fcHL7fMfFDQnCxIqPX/dCTWtV5VrMeFLuGtujPUX3r8d3IJtUkpZQAODPxu0Oecf85
	eKPJEm+YcrfqQ3y0jqwwgCOKZ+eW72Rv5f0W+Hiq/rKkN8PRmRiFcj3otigjB4RTBWwAHqubMKK
	5fDU3UNSkKbP2hIFdzfMpKPr7ldnM7BHUXuotKu9HdO56UM8VX9FQuc6wdP8nwUl9M+Y4Oq9Pk1
	5ulQ7fzWIyZ1Zuq4Tg==
X-Google-Smtp-Source: AGHT+IGFcN+nOYTqxVn79UPZKwJGah2MuDivNxXkJb+BrjqSPt8a5vQ5EqWHJ2stvTXU0VYV1J+zCA==
X-Received: by 2002:a17:907:2d08:b0:aac:278:98fd with SMTP id a640c23a62f3a-ab2ab6a3f9dmr139670166b.17.1736325751529;
        Wed, 08 Jan 2025 00:42:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/20] sysvinit: update 3.11 -> 3.13
Date: Wed,  8 Jan 2025 09:42:09 +0100
Message-Id: <20250108084226.117178-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209526

From: Alexander Kanavin <alex@linutronix.de>

Remove patches:
install.patch
(merged upstream)

realpath.patch
0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
(musl fixes, no longer needed)

pidof-add-m-option.patch
(not a backport, not used in core, and isn't carried by either debian or fedora)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...acros.h-for-major-minor-defines-in-g.patch |  50 -----
 .../sysvinit/sysvinit/crypt-lib.patch         |  27 ++-
 .../sysvinit/sysvinit/install.patch           |  79 -------
 .../sysvinit/pidof-add-m-option.patch         | 193 ------------------
 .../sysvinit/sysvinit/realpath.patch          |  61 ------
 .../{sysvinit_3.11.bb => sysvinit_3.13.bb}    |   6 +-
 6 files changed, 13 insertions(+), 403 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/install.patch
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch
 rename meta/recipes-core/sysvinit/{sysvinit_3.11.bb => sysvinit_3.13.bb} (93%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
deleted file mode 100644
index 60fbd87534b..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c710a3accd1fabdb671274e1a458405282d51e0c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Aug 2018 15:38:58 -0700
-Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- src/bootlogd.c   | 1 +
- src/mountpoint.c | 1 +
- src/shutdown.c   | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/bootlogd.c b/src/bootlogd.c
-index 787db87..8b07903 100644
---- a/src/bootlogd.c
-+++ b/src/bootlogd.c
-@@ -29,6 +29,7 @@
- #include <sys/types.h>
- #include <sys/time.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/ioctl.h>
- #include <sys/utsname.h>
- #include <time.h>
-diff --git a/src/mountpoint.c b/src/mountpoint.c
-index 5f20522..94df7a1 100644
---- a/src/mountpoint.c
-+++ b/src/mountpoint.c
-@@ -25,6 +25,7 @@
- 
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <unistd.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/shutdown.c b/src/shutdown.c
-index b744a2c..40b7faf 100644
---- a/src/shutdown.c
-+++ b/src/shutdown.c
-@@ -40,6 +40,7 @@
- #endif
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/wait.h>
- #ifdef __linux__
- #include <sys/sysmacros.h>   /* brought in my LFS patch */
diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index 24c81822187..ece870c2693 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,33 +1,33 @@
-From 49250c8e0ef563aafd5bbea62612f3d15fdee3af Mon Sep 17 00:00:00 2001
+From 19a8777c81bc451d65a4071528e4715e19941e0a Mon Sep 17 00:00:00 2001
 From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
 Date: Wed, 14 Jul 2010 14:35:52 -0400
 Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
 
-Upstream-Status: Inappropriate [configuration]
+The src Makefile was checking for libcrypt.a on the host, not in the
+build environment.  This patch checks for $LCRYPT in the environment
+and uses it if it's there.
+jdike@linux.intel.com
 
-# The src Makefile was checking for libcrypt.a on the host, not in the
-# build environment.  This patch checks for $LCRYPT in the environment
-# and uses it if it's there.
-# - jdike@linux.intel.com
+Upstream-Status: Inappropriate [configuration]
 ---
  src/Makefile | 12 ++----------
  1 file changed, 2 insertions(+), 10 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 0210171..f696247 100644
+index 4ce4889..1611c1c 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -101,16 +101,8 @@ endif
- 
- ROOT	?= $(DESTDIR)
+@@ -97,16 +97,8 @@ else
+   SULOGINLIBS	=
+ endif
  
 -# Additional libs for GNU libc.
--ifneq ($(wildcard $(ROOT)/usr/lib*/libcrypt.*),)
+-ifneq ($(wildcard $(ROOT)/$(usrdir)/lib*/libcrypt.*),)
 -  SULOGINLIBS	+= -lcrypt
 -endif
 -
 -# Additional libs for GNU libc / multiarch on Debian based systems.
--ifneq ($(wildcard $(ROOT)/usr/lib/*/libcrypt.*),)
+-ifneq ($(wildcard $(ROOT)/$(usrdir)/lib/*/libcrypt.*),)
 -ifneq ($(findstring -lcrypt, $(SULOGINLIBS)), -lcrypt)
 -  SULOGINLIBS	+= -lcrypt
 -endif
@@ -36,6 +36,3 @@ index 0210171..f696247 100644
  endif
  
  all:		$(BIN) $(SBIN) $(USRBIN)
--- 
-2.25.1
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
deleted file mode 100644
index 4289c4eddc7..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/install.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From f73a2c768687f3fed0ab570f47fa2157e5d4e586 Mon Sep 17 00:00:00 2001
-From: Qing He <qing.he@intel.com>
-Date: Fri, 18 Jun 2010 09:40:30 +0800
-Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
-
-Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/13]
----
- src/Makefile | 37 ++++++++++++++++++++++---------------
- 1 file changed, 22 insertions(+), 15 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 21cbb2e..0210171 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -80,7 +80,14 @@ else
-   INSTALL_DATA	= install -m 644
- endif
- INSTALL_DIR	= install -m 755 -d
--MANDIR		= /usr/share/man
-+
-+ROOT         ?=
-+base_bindir  ?= /bin
-+base_sbindir ?= /sbin
-+bindir       ?= /usr/bin
-+sysconfdir   ?= /etc
-+includedir   ?= /usr/include
-+mandir       ?= /usr/share/man
- 
- ifeq ($(WITH_SELINUX),yes)
-   SELINUX_DEF	=  -DWITH_SELINUX
-@@ -196,31 +203,31 @@ clobber:	cleanobjs
- distclean:	clobber
- 
- install:	all
--		$(INSTALL_DIR) $(ROOT)/bin/ $(ROOT)/sbin/
--		$(INSTALL_DIR) $(ROOT)/usr/bin/
-+		$(INSTALL_DIR) $(ROOT)$(base_bindir)/ $(ROOT)$(base_sbindir)/
-+		$(INSTALL_DIR) $(ROOT)$(bindir)/
- 		for i in $(BIN); do \
--			$(INSTALL_EXEC) $$i $(ROOT)/bin/ ; \
-+			$(INSTALL_EXEC) $$i $(ROOT)$(base_bindir)/ ; \
- 		done
- 		for i in $(SBIN); do \
--			$(INSTALL_EXEC) $$i $(ROOT)/sbin/ ; \
-+			$(INSTALL_EXEC) $$i $(ROOT)$(base_sbindir)/ ; \
- 		done
- 		for i in $(USRBIN); do \
--			$(INSTALL_EXEC) $$i $(ROOT)/usr/bin/ ; \
-+			$(INSTALL_EXEC) $$i $(ROOT)$(bindir)/ ; \
- 		done
- 		# $(INSTALL_DIR) $(ROOT)/etc/
- 		$(INSTALL_DIR) $(ROOT)/etc/inittab.d
- 		# $(INSTALL_EXEC) ../doc/initscript.sample $(ROOT)/etc/
--		ln -sf halt $(ROOT)/sbin/reboot
--		ln -sf halt $(ROOT)/sbin/poweroff
--		ln -sf init $(ROOT)/sbin/telinit
--		ln -sf ../sbin/killall5 $(ROOT)/bin/pidof
--		if [ ! -f $(ROOT)/usr/bin/lastb ]; then \
--			ln -sf last $(ROOT)/usr/bin/lastb; \
-+		ln -sf halt $(ROOT)$(base_sbindir)/reboot
-+		ln -sf halt $(ROOT)$(base_sbindir)/poweroff
-+		ln -sf init $(ROOT)$(base_sbindir)/telinit
-+		ln -sf $(base_sbindir)/killall5 $(ROOT)$(base_bindir)/pidof
-+		if [ ! -f $(ROOT)$(bindir)/lastb ]; then \
-+			ln -sf last $(ROOT)$(bindir)/lastb; \
- 		fi
--		$(INSTALL_DIR) $(ROOT)/usr/include/
--		$(INSTALL_DATA) initreq.h $(ROOT)/usr/include/
-+		$(INSTALL_DIR) $(ROOT)$(includedir)/
-+		$(INSTALL_DATA) initreq.h $(ROOT)$(includedir)/
- 		for man in $(MANPAGES) ; do \
--		    targetdir=$(ROOT)$(MANDIR)/$$(dirname $$man)/man$${man##*.}; \
-+		    targetdir=$(ROOT)$(mandir)/$$(dirname $$man)/man$${man##*.}; \
- 		    $(INSTALL_DIR) $$targetdir; \
- 		    $(INSTALL_DATA) ../man/$$man $$targetdir/$$(basename $$man); \
- 		    sed -i "1{ $(MANDB); }" $$targetdir/$$(basename $$man); \
--- 
-2.25.1
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
deleted file mode 100644
index 66da6fb4032..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 2b19b36409b8de0621b9aeb0d13748e947a5bbfb Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 24 Jul 2013 17:07:22 +0800
-Subject: [PATCH] pidof: add -m option
-
-When used with -o, will also omit any processes that have the same
-argv[0] and argv[1] as any explicitly omitted process ids. This can be
-used to avoid multiple shell scripts concurrently calling pidof returning
-each other's pids.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=883856
-
-Upstream-Status: Backport
-Imported patch from: https://bugzilla.redhat.com/attachment.cgi?id=658166
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- man/pidof.8    |  6 +++++
- src/killall5.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++---
- 2 files changed, 65 insertions(+), 3 deletions(-)
-
-diff --git a/man/pidof.8 b/man/pidof.8
-index 6866cb3..a87d878 100644
---- a/man/pidof.8
-+++ b/man/pidof.8
-@@ -25,6 +25,7 @@ pidof - find the process ID of a running program
- .RB [ \-n ]
- .RB [ \-x ]
- .RB [ \-z ]
-+.RB [ \-m ]
- .RB [ \-o
- .IR omitpid[,omitpid...] ]
- .RB [ \-o
-@@ -77,6 +78,11 @@ is shown. The default separator is a space.
- Tells \fIpidof\fP to omit processes with that process id. The special
- pid \fB%PPID\fP can be used to name the parent process of the \fBpidof\fP
- program, in other words the calling shell or shell script.
-+.IP -m
-+When used with -o, will also omit any processes that have the same
-+argv[0] and argv[1] as any explicitly omitted process ids. This can be
-+used to avoid multiple shell scripts concurrently calling pidof returning
-+each other's pids.
- .SH "EXIT STATUS"
- .TP
- .B 0
-diff --git a/src/killall5.c b/src/killall5.c
-index 6f7528a..34d656b 100644
---- a/src/killall5.c
-+++ b/src/killall5.c
-@@ -121,6 +121,7 @@ typedef struct _s_nfs
- 
- /* List of processes. */
- PROC *plist = NULL;
-+PROC *olist = NULL;
- 
- /* List of processes to omit. */
- OMIT *omit = NULL;
-@@ -356,6 +357,20 @@ static void clear_mnt(void)
- 	}
- }
- 
-+static void clear_omit(void)
-+{
-+	OMIT *o;
-+	PROC *p;
-+	for (o = omit; o; o = omit) {
-+		omit = omit->next;
-+		free(o);
-+	}
-+	for (p = olist; p; p = olist) {
-+		olist = olist->next;
-+		free(p);
-+	}
-+}
-+
- /*
-  *     Check if path is a shadow off a NFS partition.
-  */
-@@ -481,6 +496,7 @@ int readproc()
- 	DIR		*dir;
- 	FILE		*fp;
- 	PROC		*p, *n;
-+	OMIT		*o, *m;
- 	struct dirent	*d;
- 	char		path[PATH_MAX+1];
- 	char		buf[PATH_MAX+1];
-@@ -671,6 +687,17 @@ int readproc()
- 		p->next = plist;
- 		plist = p;
- 		p->pid = pid;
-+		/* Could be smarter, but it's a small list. */
-+		m = omit;
-+		for (o = omit; m; o = m) {
-+			m = o->next;
-+			if (o->pid == p->pid) {
-+				n = (PROC*)xmalloc(sizeof(PROC));
-+				*n = *p;
-+				n->next = olist;
-+				olist = n;
-+			}
-+		}
- 	}
- 	closedir(dir);
- 
-@@ -877,6 +904,26 @@ PIDQ_HEAD *pidof(char *prog)
- 	return q;
- }
- 
-+int matches(PROC *o, PROC *p)
-+{
-+	int ret = 0;
-+	char *oargv1, *pargv1;
-+	if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
-+		if (o->argv1 && p->argv1) {
-+			if ((oargv1 = canonicalize_file_name(o->argv1)) == NULL)
-+				oargv1 = strdup(o->argv1);
-+			if ((pargv1 = canonicalize_file_name(p->argv1)) == NULL)
-+				pargv1 = strdup(p->argv1);
-+			if (! strcmp(oargv1, pargv1)) {
-+				ret = 1;
-+			}
-+			free(oargv1);
-+			free(pargv1);
-+		}
-+	}
-+	return ret;
-+}
-+
- /* Give usage message and exit. */
- void usage(void)
- {
-@@ -927,6 +974,7 @@ void nsyslog(int pri, char *fmt, ...)
- #define PIDOF_OMIT	0x02
- #define PIDOF_NETFS	0x04
- #define PIDOF_QUIET     0x08
-+#define PIDOF_OMIT_OMIT_MATCHES	0x08
- 
- /*
-  *	Pidof functionality.
-@@ -944,6 +992,7 @@ int main_pidof(int argc, char **argv)
- 	char		tmp[512];
-         char            sep = ' ';
- 
-+	olist = (PROC*)0;
- 	omit = (OMIT*)0;
- 	nlist = (NFS*)0;
- 	opterr = 0;
-@@ -951,7 +1000,7 @@ int main_pidof(int argc, char **argv)
- 	if ((token = getenv("PIDOF_NETFS")) && (strcmp(token,"no") != 0))
- 		flags |= PIDOF_NETFS;
- 
--	while ((opt = getopt(argc,argv,"qhco:d:sxzn")) != EOF) switch (opt) {
-+	while ((opt = getopt(argc,argv,"qhcmo:d:sxzn")) != EOF) switch (opt) {
- 		case '?':
- 			nsyslog(LOG_ERR,"invalid options on command line!\n");
- 			closelog();
-@@ -1002,6 +1051,9 @@ int main_pidof(int argc, char **argv)
-                 case 'z':
-                         list_dz_processes = TRUE;
-                         break;
-+		case 'm':
-+			flags |= PIDOF_OMIT_OMIT_MATCHES;
-+			break;
- 		case 'n':
- 			flags |= PIDOF_NETFS;
- 			break;
-@@ -1033,10 +1085,13 @@ int main_pidof(int argc, char **argv)
- 			pid_t spid = 0;
- 			while ((p = get_next_from_pid_q(q))) {
- 				if ((flags & PIDOF_OMIT) && omit) {
--					OMIT * optr;
--					for (optr = omit; optr; optr = optr->next) {
-+					PROC * optr;
-+					for (optr = olist; optr; optr = optr->next) {
- 						if (optr->pid == p->pid)
- 							break;
-+						if (flags & PIDOF_OMIT_OMIT_MATCHES)
-+							if (matches(optr, p))
-+								break;
- 					}
- 
- 					/*
-@@ -1078,6 +1133,7 @@ int main_pidof(int argc, char **argv)
- 		printf("\n");
-         }
- 
-+	clear_omit();
- 	clear_mnt();
- 
- 	closelog();
--- 
-2.25.1
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
deleted file mode 100644
index 7a669d01111..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 50e6b3a0fc7c083e6514a55ac93e5591aaeb787d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Nov 2015 00:10:03 +0000
-Subject: [PATCH] Fix build on musl use realpath() API its available on all
- libcs
-
-realpath() API doesnt work on systems with PATH_MAX set to be unlimited e.g. GNU/Hurd
-However for Linux it should always work
-
-Upstream-Status: Inappropriate [Linux specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/killall5.c   | 4 ++--
- src/mountpoint.c | 1 +
- src/wall.c       | 1 +
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/killall5.c b/src/killall5.c
-index 34d656b..bc19d7f 100644
---- a/src/killall5.c
-+++ b/src/killall5.c
-@@ -910,9 +910,9 @@ int matches(PROC *o, PROC *p)
- 	char *oargv1, *pargv1;
- 	if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
- 		if (o->argv1 && p->argv1) {
--			if ((oargv1 = canonicalize_file_name(o->argv1)) == NULL)
-+			if ((oargv1 = realpath(o->argv1, NULL)) == NULL)
- 				oargv1 = strdup(o->argv1);
--			if ((pargv1 = canonicalize_file_name(p->argv1)) == NULL)
-+			if ((pargv1 = realpath(p->argv1, NULL)) == NULL)
- 				pargv1 = strdup(p->argv1);
- 			if (! strcmp(oargv1, pargv1)) {
- 				ret = 1;
-diff --git a/src/mountpoint.c b/src/mountpoint.c
-index 184b1f6..c55b0df 100644
---- a/src/mountpoint.c
-+++ b/src/mountpoint.c
-@@ -23,6 +23,7 @@
-  *		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#include <sys/types.h>
- #include <sys/stat.h>
- #include <unistd.h>
- #include <stdlib.h>
-diff --git a/src/wall.c b/src/wall.c
-index e527613..1d363ca 100644
---- a/src/wall.c
-+++ b/src/wall.c
-@@ -30,6 +30,7 @@
- #include <pwd.h>
- #include <syslog.h>
- #include <sys/types.h>
-+#include <time.h>
- #include "init.h"
- 
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.11.bb b/meta/recipes-core/sysvinit/sysvinit_3.13.bb
similarity index 93%
rename from meta/recipes-core/sysvinit/sysvinit_3.11.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.13.bb
index e8eab275644..d935b0edfd4 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.11.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.13.bb
@@ -11,18 +11,14 @@ RDEPENDS:${PN} = "${PN}-inittab"
 
 GITHUB_BASE_URI = "https://github.com/slicer69/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
-           file://install.patch \
            file://crypt-lib.patch \
-           file://pidof-add-m-option.patch \
-           file://realpath.patch \
-           file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
            file://rcS-default \
            file://rc \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "04f1b7d67413af1c09c41acc1e3ce946f2d0f7a1e47c9978744bc542864e13d4"
+SRC_URI[sha256sum] = "cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.39.5


