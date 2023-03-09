Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFA3C74A4B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.16121.1678375207572494913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nfTGfPLT;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so3698970wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbIJboBoexUI2aLca4uHCfMAztqctQQmqDeU/bH4vl4=;
        b=nfTGfPLTdQC34/6YQf0+B3MUq/rL28XkxRIwV7GfTfUR12xsijX0KrEX9CRS//1NKI
         jqtMjh4tHJ1gHriBbU9XteFzszTcOL/oRrt1vDGg4j9UfU7UOGcJj24lPgxONnXkaGV9
         sS25IK+lmHCZvNnTXI5vweaRJ0smzg6L9WQL+PV9nzfsBoQxqOffemHEkHE0JgF4zmeP
         B+fMC5eTpy+n9JIsFpJCdXynX0LRm/f9iOJ/PR2dcogqdHQpeuDe38PvBRO6vd/HadWL
         a8RnO2NUFjcFsCDBP34j897yeTNvb9B1ogOMcn3wtLXWwnMY0Q+JT+zwD1ulzANRgy02
         Xf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbIJboBoexUI2aLca4uHCfMAztqctQQmqDeU/bH4vl4=;
        b=f4Zp6qUt56zM/PWiJbUzprMGzr8C2tJNS6YLJg7x30y8GbI4htRLJ7TjZfqbG8UDO0
         g6qmbppHVgdDXL9Uzz6RprVyXpJhRozGJ+ryqlttTpvhLSZCtIJz6WIUMTppSpSUaH0V
         yzitAmEireDsPfqqdKMVLDneDDaKxWNHYEjbWAoxH3a/ZDucYtmy8F/iXH2zSaGW+B+V
         QP4MFLHMrchv6h377oUmgTceDxUIdTISOSA2ZqOezJ8QnNFsVC1tEXr5qQMBcyFzeZuy
         uUkDGx1R1Qp6zscRw//1Nmu7Xi9YiWRayZgesNVE9TxpkbYVCNcKSma0bpvwOWNKGy9F
         2DMw==
X-Gm-Message-State: AO0yUKX4Tre4xfJBJMsZMGYHy3xEIIlv+fiCIwKfX2sVF4N2R93kAaDl
	6hBkL7yEhsjuRYTXBf33NhsXZVqHg98=
X-Google-Smtp-Source: AK7set8+FkhNRyGD1EdgSVsfxsgi+sLl7RWPLcGE+GSUYj4oQFwW4AIvB0Pht26RPglxMwgxQkPpXw==
X-Received: by 2002:a05:600c:548c:b0:3ea:bc08:b55e with SMTP id iv12-20020a05600c548c00b003eabc08b55emr18402629wmb.25.1678375205785;
        Thu, 09 Mar 2023 07:20:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/26] procps: update 3.3.17 -> 4.0.3
Date: Thu,  9 Mar 2023 16:19:35 +0100
Message-Id: <20230309151958.3619193-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178228

Drop patches as upstream refactored the code.

Add a compatibility patch to igt-gpu-tools.

Add a musl compatibility patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../procps/0001-src-w.c-use-utmp.h-only.patch |  65 +++
 .../procps/0001-w.c-correct-musl-builds.patch |  44 --
 ...02-proc-escape.c-add-missing-include.patch |  23 -
 .../{procps_3.3.17.bb => procps_4.0.3.bb}     |   9 +-
 .../0001-Support-procps-4.x.patch             | 502 ++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |   4 +-
 6 files changed, 572 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch
 delete mode 100644 meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
 delete mode 100644 meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
 rename meta/recipes-extended/procps/{procps_3.3.17.bb => procps_4.0.3.bb} (90%)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-Support-procps-4.x.patch

diff --git a/meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch b/meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch
new file mode 100644
index 0000000000..23c91ec775
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-src-w.c-use-utmp.h-only.patch
@@ -0,0 +1,65 @@
+From c41b3be62fbb78e0939fddaebad519360cbd8702 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 6 Mar 2023 09:27:57 +0100
+Subject: [PATCH] src/w.c: use only utmpx
+
+Nowadays this works both on musl and glibc systems, however on musl
+utmp.h is also needed to avoid the following failure:
+
+| ../git/src/w.c: In function 'print_from':
+| ../git/src/w.c:73:28: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
+|    73 | #       define UT_HOSTSIZE __UT_HOSTSIZE
+|       |                            ^~~~~~~~~~~~~
+| ../git/src/w.c:233:64: note: in expansion of macro 'UT_HOSTSIZE'
+|   233 |                         print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
+|       |                                                                ^~~~~~~~~~~
+|
+
+It is caused by including utmpx.h, but not utmp.h, which (on musl)
+lacks the needed definitions.
+
+I have verified that both musl and glibc based builds continue to work.
+
+Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/171]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ src/w.c | 17 ++---------------
+ 1 file changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/src/w.c b/src/w.c
+index 5e878f04..912c5df3 100644
+--- a/src/w.c
++++ b/src/w.c
+@@ -46,11 +46,8 @@
+ #include <termios.h>
+ #include <time.h>
+ #include <unistd.h>
+-#ifdef HAVE_UTMPX_H
+-#	include <utmpx.h>
+-#else
+-#	include <utmp.h>
+-#endif
++#include <utmp.h>
++#include <utmpx.h>
+ #include <arpa/inet.h>
+ 
+ #include "c.h"
+@@ -63,17 +60,7 @@
+ static int ignoreuser = 0;	/* for '-u' */
+ static int oldstyle = 0;	/* for '-o' */
+ 
+-#ifdef HAVE_UTMPX_H
+ typedef struct utmpx utmp_t;
+-#else
+-typedef struct utmp utmp_t;
+-#endif
+-
+-#if !defined(UT_HOSTSIZE) || defined(__UT_HOSTSIZE)
+-#	define UT_HOSTSIZE __UT_HOSTSIZE
+-#	define UT_LINESIZE __UT_LINESIZE
+-#	define UT_NAMESIZE __UT_NAMESIZE
+-#endif
+ 
+ #ifdef W_SHOWFROM
+ # define FROM_STRING "on"
diff --git a/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
deleted file mode 100644
index c92ad28e4f..0000000000
--- a/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 22f8d25567b8d64bdbab0fb0b4915b4362561d9b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 24 Feb 2021 21:14:31 +0000
-Subject: [PATCH] w.c: correct musl builds
-
-No need to redefine UT_ stuff to something that does not exist.
-
-UT_ is already provided in musl but via utmp.h header, so include
-it always.
-
-Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- w.c | 9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/w.c b/w.c
-index 9d07ac9..d10639b 100644
---- a/w.c
-+++ b/w.c
-@@ -57,9 +57,8 @@
- #include <unistd.h>
- #ifdef HAVE_UTMPX_H
- #	include <utmpx.h>
--#else
--#	include <utmp.h>
- #endif
-+#include <utmp.h>
- #include <arpa/inet.h>
- 
- static int ignoreuser = 0;	/* for '-u' */
-@@ -72,12 +71,6 @@ typedef struct utmpx utmp_t;
- typedef struct utmp utmp_t;
- #endif
- 
--#if !defined(UT_HOSTSIZE) || defined(__UT_HOSTSIZE)
--#	define UT_HOSTSIZE __UT_HOSTSIZE
--#	define UT_LINESIZE __UT_LINESIZE
--#	define UT_NAMESIZE __UT_NAMESIZE
--#endif
--
- #ifdef W_SHOWFROM
- # define FROM_STRING "on"
- #else
diff --git a/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch b/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
deleted file mode 100644
index 5fa1ac9d78..0000000000
--- a/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4f964821398dff7ab21fec63da15e1e00b2e9277 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 24 Feb 2021 21:16:14 +0000
-Subject: [PATCH] proc/escape.c: add missing include
-
-Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- proc/escape.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/proc/escape.c b/proc/escape.c
-index 2e8fb7d..e1f4612 100644
---- a/proc/escape.c
-+++ b/proc/escape.c
-@@ -21,6 +21,7 @@
- #include <sys/types.h>
- #include <string.h>
- #include <limits.h>
-+#include <langinfo.h>
- #include "procps.h"
- #include "escape.h"
- #include "readproc.h"
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_4.0.3.bb
similarity index 90%
rename from meta/recipes-extended/procps/procps_3.3.17.bb
rename to meta/recipes-extended/procps/procps_4.0.3.bb
index 59ad89d326..cc3420df4e 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_4.0.3.bb
@@ -14,14 +14,9 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
-           file://0001-w.c-correct-musl-builds.patch \
-           file://0002-proc-escape.c-add-missing-include.patch \
+           file://0001-src-w.c-use-utmp.h-only.patch \
            "
-SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
-# 4.x version is an API incompatible rewrite
-# until procps consumers are transitioned to it we need to stick with 3.x
-# https://gitlab.com/procps-ng/procps/-/issues/239
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>3(\.\d+)+)"
+SRCREV = "806eb270f217ff7e1e745c7bda2b002b5be74be4"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-Support-procps-4.x.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-Support-procps-4.x.patch
new file mode 100644
index 0000000000..fe9663b6eb
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-Support-procps-4.x.patch
@@ -0,0 +1,502 @@
+From 524e58f3b2f9e4702293af66f6768755b300e8d3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 2 Mar 2023 13:59:13 +0100
+Subject: [PATCH] Support procps 4.x
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/116#note_1785522]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/igt_aux.c   | 238 ++++++++++++++++++++++++++++++++++++++++--------
+ lib/meson.build |   7 +-
+ meson.build     |  10 +-
+ 3 files changed, 215 insertions(+), 40 deletions(-)
+
+diff --git a/lib/igt_aux.c b/lib/igt_aux.c
+index 15e30440..d23c9a40 100644
+--- a/lib/igt_aux.c
++++ b/lib/igt_aux.c
+@@ -52,8 +52,16 @@
+ #include <assert.h>
+ #include <grp.h>
+ 
++#ifdef HAVE_LIBPROCPS
+ #include <proc/readproc.h>
++#endif
++#ifdef HAVE_LIBPROC2
++#include <libproc2/pids.h>
++#endif
++
+ #include <libudev.h>
++#include <linux/limits.h>
++#include <dirent.h>
+ 
+ #include "drmtest.h"
+ #include "i915_drm.h"
+@@ -1217,6 +1225,7 @@ void igt_unlock_mem(void)
+  */
+ int igt_is_process_running(const char *comm)
+ {
++#if HAVE_LIBPROCPS
+ 	PROCTAB *proc;
+ 	proc_t *proc_info;
+ 	bool found = false;
+@@ -1235,6 +1244,26 @@ int igt_is_process_running(const char *comm)
+ 
+ 	closeproc(proc);
+ 	return found;
++#endif
++#ifdef HAVE_LIBPROC2
++	enum pids_item Item[] = { PIDS_CMD };
++	struct pids_info *info = NULL;
++	struct pids_stack *stack;
++	char *pid_comm;
++	bool found = false;
++
++	if (procps_pids_new(&info, Item, 1) < 0)
++	    return false;
++	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
++	    pid_comm = PIDS_VAL(0, str, stack, info);
++	    if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
++		found = true;
++		break;
++	    }
++	}
++	procps_pids_unref(&info);
++	return found;
++#endif
+ }
+ 
+ /**
+@@ -1251,6 +1280,7 @@ int igt_is_process_running(const char *comm)
+  */
+ int igt_terminate_process(int sig, const char *comm)
+ {
++#ifdef HAVE_LIBPROCPS
+ 	PROCTAB *proc;
+ 	proc_t *proc_info;
+ 	int err = 0;
+@@ -1272,6 +1302,29 @@ int igt_terminate_process(int sig, const char *comm)
+ 
+ 	closeproc(proc);
+ 	return err;
++#endif
++#ifdef HAVE_LIBPROC2
++	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
++	struct pids_info *info = NULL;
++	struct pids_stack *stack;
++	char *pid_comm;
++	int pid;
++	int err = 0;
++
++	if (procps_pids_new(&info, Items, 2) < 0)
++		return -errno;
++	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
++		pid = PIDS_VAL(0, s_int, stack, info);
++		pid_comm = PIDS_VAL(1, str, stack, info);
++		if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
++			if (kill(pid, sig) < 0)
++				err = -errno;
++			break;
++		}
++	}
++	procps_pids_unref(&info);
++	return err;
++#endif
+ }
+ 
+ struct pinfo {
+@@ -1341,9 +1394,9 @@ igt_show_stat_header(void)
+ }
+ 
+ static void
+-igt_show_stat(proc_t *info, int *state, const char *fn)
++igt_show_stat(const pid_t tid, const char *cmd, int *state, const char *fn)
+ {
+-	struct pinfo p = { .pid = info->tid, .comm = info->cmd, .fn = fn };
++	struct pinfo p = { .pid = tid, .comm = cmd, .fn = fn };
+ 
+ 	if (!*state)
+ 		igt_show_stat_header();
+@@ -1353,7 +1406,7 @@ igt_show_stat(proc_t *info, int *state, const char *fn)
+ }
+ 
+ static void
+-__igt_lsof_fds(proc_t *proc_info, int *state, char *proc_path, const char *dir)
++__igt_lsof_fds(const pid_t tid, const char *cmd, int *state, char *proc_path, const char *dir)
+ {
+ 	struct dirent *d;
+ 	struct stat st;
+@@ -1400,7 +1453,7 @@ again:
+ 		dirn = dirname(copy_fd_lnk);
+ 
+ 		if (!strncmp(dir, dirn, strlen(dir)))
+-			igt_show_stat(proc_info, state, fd_lnk);
++			igt_show_stat(tid, cmd, state, fd_lnk);
+ 
+ 		free(copy_fd_lnk);
+ 		free(fd_lnk);
+@@ -1416,13 +1469,14 @@ again:
+ static void
+ __igt_lsof(const char *dir)
+ {
+-	PROCTAB *proc;
+-	proc_t *proc_info;
+-
+ 	char path[30];
+ 	char *name_lnk;
+ 	struct stat st;
+ 	int state = 0;
++#ifdef HAVE_LIBPROCPS
++	PROCTAB *proc;
++	proc_t *proc_info;
++
+ 
+ 	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+ 	igt_assert(proc != NULL);
+@@ -1456,6 +1510,44 @@ __igt_lsof(const char *dir)
+ 	}
+ 
+ 	closeproc(proc);
++#endif
++#ifdef HAVE_LIBPROC2
++	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
++	struct pids_info *info = NULL;
++	struct pids_stack *stack;
++
++	if (procps_pids_new(&info, Items, 2) < 0)
++		return;
++	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
++		ssize_t read;
++		int tid = PIDS_VAL(0, s_int, stack, info);
++		char *pid_comm = PIDS_VAL(1, str, stack, info);
++
++		/* check current working directory */
++		memset(path, 0, sizeof(path));
++		snprintf(path, sizeof(path), "/proc/%d/cwd", tid);
++
++		if (stat(path, &st) == -1)
++			continue;
++
++		name_lnk = malloc(st.st_size + 1);
++
++		igt_assert((read = readlink(path, name_lnk, st.st_size + 1)));
++		name_lnk[read] = '\0';
++
++		if (!strncmp(dir, name_lnk, strlen(dir)))
++			igt_show_stat(tid, pid_comm, &state, name_lnk);
++
++		/* check also fd, seems that lsof(8) doesn't look here */
++		memset(path, 0, sizeof(path));
++		snprintf(path, sizeof(path), "/proc/%d/fd", tid);
++
++		__igt_lsof_fds(tid, pid_comm, &state, path, dir);
++
++		free(name_lnk);
++	}
++	procps_pids_unref(&info);
++#endif
+ }
+ 
+ /**
+@@ -1490,7 +1582,7 @@ igt_lsof(const char *dpath)
+ 	free(sanitized);
+ }
+ 
+-static void pulseaudio_unload_module(proc_t *proc_info)
++static void pulseaudio_unload_module(const uid_t euid, const gid_t egid)
+ {
+ 	struct igt_helper_process pa_proc = {};
+ 	char xdg_dir[PATH_MAX];
+@@ -1498,14 +1590,14 @@ static void pulseaudio_unload_module(proc_t *proc_info)
+ 	struct passwd *pw;
+ 
+ 	igt_fork_helper(&pa_proc) {
+-		pw = getpwuid(proc_info->euid);
++		pw = getpwuid(euid);
+ 		homedir = pw->pw_dir;
+-		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
++		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
+ 
+ 		igt_info("Request pulseaudio to stop using audio device\n");
+ 
+-		setgid(proc_info->egid);
+-		setuid(proc_info->euid);
++		setgid(egid);
++		setuid(euid);
+ 		clearenv();
+ 		setenv("HOME", homedir, 1);
+ 		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
+@@ -1524,10 +1616,12 @@ static void pipewire_reserve_wait(void)
+ 	char xdg_dir[PATH_MAX];
+ 	const char *homedir;
+ 	struct passwd *pw;
+-	proc_t *proc_info;
+-	PROCTAB *proc;
++	int tid=0, euid, egid;
+ 
++#ifdef HAVE_LIBPROCPS
+ 	igt_fork_helper(&pw_reserve_proc) {
++		proc_t *proc_info;
++		PROCTAB *proc;
+ 		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
+ 
+ 		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+@@ -1539,21 +1633,44 @@ static void pipewire_reserve_wait(void)
+ 			freeproc(proc_info);
+ 		}
+ 		closeproc(proc);
++		tid = proc_info->tid;
++		euid = proc_info->euid;
++		egid = proc_info->egid;
++		freeproc(proc_info);
++#endif
++#ifdef HAVE_LIBPROC2
++	igt_fork(child, 1) {
++		enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID };
++		enum rel_items { EU_PID, EU_EUID, EU_EGID };
++		struct pids_info *info = NULL;
++		struct pids_stack *stack;
++
++		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
++
++		if (procps_pids_new(&info, Items, 3) < 0)
++		    return;
++		while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
++			tid = PIDS_VAL(EU_PID, s_int, stack, info);
++			if (pipewire_pulse_pid == tid)
++				break;
++		}
++		euid = PIDS_VAL(EU_EUID, s_int, stack, info);
++		egid = PIDS_VAL(EU_EGID, s_int, stack, info);
++		procps_pids_unref(&info);
++#endif
+ 
+ 		/* Sanity check: if it can't find the process, it means it has gone */
+-		if (pipewire_pulse_pid != proc_info->tid)
++		if (pipewire_pulse_pid != tid)
+ 			exit(0);
+ 
+-		pw = getpwuid(proc_info->euid);
++		pw = getpwuid(euid);
+ 		homedir = pw->pw_dir;
+-		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
+-		setgid(proc_info->egid);
+-		setuid(proc_info->euid);
++		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
++		setgid(egid);
++		setuid(euid);
+ 		clearenv();
+ 		setenv("HOME", homedir, 1);
+ 		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
+-		freeproc(proc_info);
+-
+ 		/*
+ 		 * pw-reserve will run in background. It will only exit when
+ 		 * igt_kill_children() is called later on. So, it shouldn't
+@@ -1570,9 +1687,7 @@ static void pipewire_reserve_wait(void)
+ int pipewire_pulse_start_reserve(void)
+ {
+ 	bool is_pw_reserve_running = false;
+-	proc_t *proc_info;
+ 	int attempts = 0;
+-	PROCTAB *proc;
+ 
+ 	if (!pipewire_pulse_pid)
+ 		return 0;
+@@ -1584,6 +1699,10 @@ int pipewire_pulse_start_reserve(void)
+ 	 * pipewire version 0.3.50 or upper.
+ 	 */
+ 	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
++#ifdef HAVE_LIBPROCPS
++		proc_t *proc_info;
++		PROCTAB *proc;
++
+ 		usleep(1000);
+ 		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+ 		igt_assert(proc != NULL);
+@@ -1598,6 +1717,25 @@ int pipewire_pulse_start_reserve(void)
+ 			freeproc(proc_info);
+ 		}
+ 		closeproc(proc);
++#endif
++#ifdef HAVE_LIBPROC2
++		enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
++		struct pids_info *info = NULL;
++		struct pids_stack *stack;
++
++		usleep(1000);
++
++		if (procps_pids_new(&info, Items, 2) < 0)
++			return 1;
++		while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
++			if (!strcmp(PIDS_VAL(1, str, stack, info), "pw-reserve")) {
++				is_pw_reserve_running = true;
++				pipewire_pw_reserve_pid = PIDS_VAL(0, s_int, stack, info);
++				break;
++			}
++		}
++		procps_pids_unref(&info);
++#endif
+ 		if (is_pw_reserve_running)
+ 			break;
+ 	}
+@@ -1645,7 +1783,7 @@ void pipewire_pulse_stop_reserve(void)
+  * If the check fails, it means that the process can simply be killed.
+  */
+ static int
+-__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
++__igt_lsof_audio_and_kill_proc(const pid_t tid, const char *cmd, const uid_t euid, const gid_t egid, char *proc_path)
+ {
+ 	const char *audio_dev = "/dev/snd/";
+ 	char path[PATH_MAX * 2];
+@@ -1670,10 +1808,10 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
+ 	 * 2) unload/unbind the the audio driver(s);
+ 	 * 3) stop the pw-reserve thread.
+ 	 */
+-	if (!strcmp(proc_info->cmd, "pipewire-pulse")) {
++	if (!strcmp(cmd, "pipewire-pulse")) {
+ 		igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
+-			 proc_info->tid, proc_info->cmd);
+-		pipewire_pulse_pid = proc_info->tid;
++			 tid, cmd);
++		pipewire_pulse_pid = tid;
+ 		return 0;
+ 	}
+ 	/*
+@@ -1685,9 +1823,9 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
+ 	 * will respawn them. So, just ignore here, they'll honor pw-reserve,
+ 	 * when the time comes.
+ 	 */
+-	if (!strcmp(proc_info->cmd, "pipewire-media-session"))
++	if (!strcmp(cmd, "pipewire-media-session"))
+ 		return 0;
+-	if (!strcmp(proc_info->cmd, "wireplumber"))
++	if (!strcmp(cmd, "wireplumber"))
+ 		return 0;
+ 
+ 	dp = opendir(proc_path);
+@@ -1723,22 +1861,22 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
+ 		 * enough to unbind audio modules and won't cause race issues
+ 		 * with systemd trying to reload it.
+ 		 */
+-		if (!strcmp(proc_info->cmd, "pulseaudio")) {
+-			pulseaudio_unload_module(proc_info);
++		if (!strcmp(cmd, "pulseaudio")) {
++			pulseaudio_unload_module(euid, egid);
+ 			break;
+ 		}
+ 
+ 		/* For all other processes, just kill them */
+ 		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
+-				proc_info->tid, proc_info->cmd);
++				tid, cmd);
+ 
+-		if (kill(proc_info->tid, SIGTERM) < 0) {
++		if (kill(tid, SIGTERM) < 0) {
+ 			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
+-				proc_info->cmd, proc_info->tid);
+-			if (kill(proc_info->tid, SIGABRT) < 0) {
++				cmd, tid);
++			if (kill(tid, SIGABRT) < 0) {
+ 				fail++;
+ 				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
+-					proc_info->cmd, proc_info->tid);
++					cmd, tid);
+ 			}
+ 		}
+ 
+@@ -1760,9 +1898,10 @@ int
+ igt_lsof_kill_audio_processes(void)
+ {
+ 	char path[PATH_MAX];
++	int fail = 0;
++#ifdef HAVE_LIBPROCPS
+ 	proc_t *proc_info;
+ 	PROCTAB *proc;
+-	int fail = 0;
+ 
+ 	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+ 	igt_assert(proc != NULL);
+@@ -1772,12 +1911,35 @@ igt_lsof_kill_audio_processes(void)
+ 		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)
+ 			fail++;
+ 		else
+-			fail += __igt_lsof_audio_and_kill_proc(proc_info, path);
++			fail += __igt_lsof_audio_and_kill_proc(proc_info->pid, proc_info->cmd, proc_info->euid, proc_info->egid, path);
+ 
+ 		freeproc(proc_info);
+ 	}
+ 	closeproc(proc);
++#endif
++#ifdef HAVE_LIBPROC2
++	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD, PIDS_ID_EUID, PIDS_ID_EGID };
++	enum rel_items { EU_PID, EU_CMD, EU_EUID, EU_EGID };
++	struct pids_info *info = NULL;
++	struct pids_stack *stack;
++	pid_t tid;
++
++	if (procps_pids_new(&info, Items, 4) < 0)
++		return 1;
++	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
++		tid = PIDS_VAL(EU_PID, s_int, stack, info);
+ 
++		if (snprintf(path, sizeof(path), "/proc/%d/fd", tid) < 1)
++			fail++;
++		else
++			fail += __igt_lsof_audio_and_kill_proc(tid,
++				PIDS_VAL(EU_CMD, str, stack, info),
++				PIDS_VAL(EU_EUID, s_int, stack, info),
++				PIDS_VAL(EU_EGID, s_int, stack, info),
++				path);
++	}
++	procps_pids_unref(&info);
++#endif
+ 	return fail;
+ }
+ 
+diff --git a/lib/meson.build b/lib/meson.build
+index cc784686..90591e0e 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -105,7 +105,6 @@ lib_deps = [
+ 	libdrm,
+ 	libdw,
+ 	libkmod,
+-	libprocps,
+ 	libudev,
+ 	math,
+ 	pciaccess,
+@@ -169,6 +168,12 @@ if chamelium.found()
+ 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
+ endif
+ 
++if libprocps.found()
++	lib_deps += libprocps
++else
++	lib_deps += libproc2
++endif
++
+ if get_option('srcdir') != ''
+     srcdir = join_paths(get_option('srcdir'), 'tests')
+ else
+diff --git a/meson.build b/meson.build
+index e7a68503..309b0af3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -120,7 +120,15 @@ build_info += 'With libdrm: ' + ','.join(libdrm_info)
+ 
+ pciaccess = dependency('pciaccess', version : '>=0.10')
+ libkmod = dependency('libkmod')
+-libprocps = dependency('libprocps', required : true)
++libprocps = dependency('libprocps', required : false)
++libproc2 = dependency('libproc2', required : false)
++if libprocps.found()
++  config.set('HAVE_LIBPROCPS', 1)
++elif libproc2.found()
++  config.set('HAVE_LIBPROC2', 1)
++else
++  error('Either libprocps or libproc2 is required')
++endif
+ 
+ libunwind = dependency('libunwind', required : get_option('libunwind'))
+ build_info += 'With libunwind: @0@'.format(libunwind.found())
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index fbe5e1a4e7..f4799fbc77 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -12,7 +12,9 @@ inherit meson pkgconfig
 SRCREV = "2b29e8ac07fbcfadc48b9d60e4d736a6e3b289ab"
 PV = "1.27.1"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master \
+           file://0001-Support-procps-4.x.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


