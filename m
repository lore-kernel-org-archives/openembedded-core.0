Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51941C369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 19:17:03 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.16789.1746299815834653639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 12:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gv5qFyxW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso2008358f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746299813; x=1746904613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2TAkGwIsKh9f/6oLY8JwK/FzFUclaDt4FfVAossF0k=;
        b=Gv5qFyxWaXCISLRkwnQHAzTYfk6WGpUaLCULi5XdLjN3+DnesT9S2E5hl5ytswhHZn
         RH8gtXD+IKZ8QGGAh5wNx08k2jQX6xy5+ZN/Q0kOULarcssWZ04htW8rzvslNtSQyhSU
         pvJabM5ROCU3HMgJWib3m1o+V2IMwLOXlasew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746299813; x=1746904613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2TAkGwIsKh9f/6oLY8JwK/FzFUclaDt4FfVAossF0k=;
        b=I3NWlGF0yulDAYLfiifHoCcUwXxk16OMBHdCvX05u4Ofg7q+LAKmemR8t0Uh1/Qlo5
         xUx+5xh4VQOU2QEPXoV6XNYXQdtAYhPyzqlK664zyMtemQL0chrbWquC6Ghf61E8tebD
         VVVPItMuMF5D+3wniOYqJfHG1cXPsB/jOfJqXEGuGvZzYhZFdS+LNKTxXVlsJQkWWjZ4
         0ydMuY2dIojC73MNpQiSReXLoLLg8twyDGVbbLHbImrg0V0cSN6TI5xrNVsGlyn9t/Rr
         Ky75DMuobq+54fx5dFgXPFVTdoj4HD7voj2+BGogzzuPdgrcKS/ZYNe9CfS8es7/PZm5
         KcXA==
X-Gm-Message-State: AOJu0Yyx7GJaFIJ0TAhqJ/OzzkFEKXoVDD/3SyxwKY2/v0QDKtzimT4H
	xQQIl7x3tEaepUSiTntJICRDqRlrEd+Z1ln0z97lVkQm3JVzYly2wyG8sNTcOKkIQi9wrxAsuvK
	R
X-Gm-Gg: ASbGncsPlVJiJs4PI34reCdIgCDdL8MdAs1urk6GnISV+dkeGZCrvdkHbNz3OZwnqxY
	KLlw7gyb/1RGR4ulTZ/vcUDNw7IKXxAnyI4N4mFCvBIpfMu9w1M1Exlj8L+PCqANjKBAVJjL7m5
	MXACNstSlxMAL+b8qwVux/gczs5FIuCNaJh8Reqs+RmJOll4OEJp2y/STkRfiNT4ti0wrH4JUG9
	5CDB4PdqHcywL3nWQYrnJgWJDiCr4JK8hRS4hqWfHB8KGu3nk98GiNKIO907NBJdBuy2KJq3GMX
	Awu20VbOkuUhIpcHLSwUX6RoN+jAPl1hkdz31KF5tPI0wrLDiCmZZTp7+baXj4Yph7nOkg==
X-Google-Smtp-Source: AGHT+IECpttq/bXjZBm2o5TQeUfVuCeVa8wV1jDkwV+I8DBuvI/nBNbC2DG2ldIgxOavsr0f9Wxaxg==
X-Received: by 2002:a05:6000:1b8f:b0:3a0:9f24:7760 with SMTP id ffacd0b85a97d-3a09fd73890mr1130306f8f.21.1746299812752;
        Sat, 03 May 2025 12:16:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b2ef:3536:55e7:69cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d2csm5449721f8f.2.2025.05.03.12.16.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 12:16:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to improved glibc 2.38 code
Date: Sat,  3 May 2025 20:16:50 +0100
Message-ID: <20250503191650.4118979-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 19:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215938

Improve the 2.38 glibc patch to something which isn't quite so horrible
and could be merged upstream.

Rather than using internal glibc header defines, separate out the function
calls we need to isolate from header changes (strtol, strtoll, atoi, sscanf,
fscanf) into separate source files so we can carefully control the headers
used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/glibc238.patch               | 315 +++++++++++++++---
 .../pseudo/files/older-glibc-symbols.patch    |   4 +-
 2 files changed, 267 insertions(+), 52 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index dfb5c283f61..d998771237b 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -1,65 +1,280 @@
 glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
-_GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
-to turn this off within pseudo_wrappers.c. Elsewhere we can switch to _DEFAULT_SOURCE
-rather than _GNU_SOURCE.
+_GNU_SOURCE but we have to set that for other definitions. Therefore add a seperate
+wrapper function so we can control the contexts correctly.
 
 Upstream-Status: Pending
 
-Index: git/pseudo_wrappers.c
+Index: git/Makefile.in
 ===================================================================
---- git.orig/pseudo_wrappers.c
-+++ git/pseudo_wrappers.c
-@@ -6,6 +6,18 @@
-  * SPDX-License-Identifier: LGPL-2.1-only
-  *
-  */
-+/* glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
-+ * _GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
-+ * to turn this off.
+--- git.orig/Makefile.in
++++ git/Makefile.in
+@@ -57,7 +57,7 @@ SOURCES=$(wildcard *.c)
+ OBJS=$(subst .c,.o,$(SOURCES))
+ TESTS=$(patsubst %.c,%,$(wildcard test/*.c))
+ 
+-SHOBJS=pseudo_tables.o pseudo_util.o
++SHOBJS=pseudo_tables.o pseudo_util.o strtol.o
+ DBOBJS=pseudo_db.o
+ WRAPOBJS=pseudo_wrappers.o
+ 
+@@ -100,15 +100,15 @@ $(BIN) $(LIB):
+ 
+ pseudo: $(PSEUDO)
+ 
+-$(PSEUDO): pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_server.o pseudo_ipc.o | $(BIN)
++$(PSEUDO): pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_server.o pseudo_ipc.o | $(BIN)
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDO) \
+-		pseudo.o pseudo_server.o pseudo_client.o pseudo_ipc.o \
++		pseudo.o pseudo_server.o pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
+ 		$(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ pseudolog: $(PSEUDOLOG)
+ 
+-$(PSEUDOLOG): pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_ipc.o | $(BIN)
+-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) pseudolog.o pseudo_client.o pseudo_ipc.o \
++$(PSEUDOLOG): pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o | $(BIN)
++	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) pseudolog.o pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
+ 		$(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ pseudodb: $(PSEUDODB)
+@@ -119,9 +119,9 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOB
+ 
+ libpseudo: $(LIBPSEUDO)
+ 
+-$(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS) | $(LIB)
++$(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
+-		pseudo_client.o pseudo_ipc.o \
++		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
+ 		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
+ 
+ # *everything* now relies on stuff that's generated in the
+@@ -135,6 +135,8 @@ pseudo_client.o pseudo_server.o pseudo_i
+ 
+ pseudo_client.o: pseudo_client.h
+ 
++pseudo_client_scanf.o: pseudo_client.h
++
+ pseudo_server.o: pseudo_server.h
+ 
+ tables: enums/*.in maketables templatefile.py $(TABLES)
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -212,7 +212,7 @@ main(int argc, char *argv[]) {
+ 			opt_S = 1;
+ 			break;
+ 		case 't': /* timeout */
+-			pseudo_server_timeout = strtol(optarg, &s, 10);
++			pseudo_server_timeout = pseudo_strtol_wrapper(optarg, &s, 10);
+ 			if (*s && !isspace(*s)) {
+ 				pseudo_diag("Timeout must be an integer value.\n");
+ 				usage(EXIT_FAILURE);
+Index: git/pseudo.h
+===================================================================
+--- git.orig/pseudo.h
++++ git/pseudo.h
+@@ -85,6 +85,10 @@ extern int pseudo_etc_file(const char *f
+ extern void pseudo_stat32_from64(struct stat *, const struct stat64 *);
+ extern void pseudo_stat64_from32(struct stat64 *, const struct stat *);
+ 
++extern long pseudo_strtol_wrapper(const char *, char **, int);
++extern long long pseudo_strtoll_wrapper(const char *, char **, int);
++extern int pseudo_atoi_wrapper(const char *);
++
+ extern char *pseudo_version;
+ 
+ #ifndef PSEUDO_BINDIR
+Index: git/pseudolog.c
+===================================================================
+--- git.orig/pseudolog.c
++++ git/pseudolog.c
+@@ -452,7 +452,7 @@ plog_trait(int opt, char *string) {
+ 	case PSQF_GID:
+ 	case PSQF_INODE:
+ 	case PSQF_UID:
+-		new_trait->data.ivalue = strtoll(string, &endptr, 0);
++		new_trait->data.ivalue = pseudo_strtoll_wrapper(string, &endptr, 0);
+ 		if (*endptr) {
+ 			pseudo_diag("Unexpected garbage after number (%llu): '%s'\n",
+ 				new_trait->data.ivalue, endptr);
+@@ -462,7 +462,7 @@ plog_trait(int opt, char *string) {
+ 		break;
+ 	case PSQF_MODE:
+ 	case PSQF_PERM:
+-		new_trait->data.ivalue = strtoll(string, &endptr, 8);
++		new_trait->data.ivalue = pseudo_strtoll_wrapper(string, &endptr, 8);
+ 		if (!*endptr) {
+ 			break;
+ 		}
+Index: git/strtol.c
+===================================================================
+--- /dev/null
++++ git/strtol.c
+@@ -0,0 +1,26 @@
++#include <stdio.h>
++#include <stdlib.h>
++#include "pseudo.h"
++
++/*
++ * glibc 2.38 would include  __isoc23_strtol and similar symbols if _GNU_SOURCE
++ * is used. We have to set that for other definitions so delcare this wrapper
++ * in a context where we don't have that set.
++ *
++ * We need to wrap strtol, strtoll, atoi, fscanf and sscanf.
 + */
-+#include <features.h>
-+#undef __GLIBC_USE_ISOC2X
-+#undef __GLIBC_USE_C2X_STRTOL
-+#define __GLIBC_USE_C2X_STRTOL 0
-+#undef __GLIBC_USE_ISOC23
-+#undef __GLIBC_USE_C23_STRTOL
-+#define __GLIBC_USE_C23_STRTOL 0
 +
- #include <assert.h>
- #include <stdlib.h>
- #include <limits.h>
++int pseudo_atoi_wrapper(const char *nptr)
++{
++	return atoi(nptr);
++}
++
++long pseudo_strtol_wrapper(const char *nptr, char **endptr, int base)
++{
++	return strtol(nptr, endptr, base);
++}
++
++long long pseudo_strtoll_wrapper(const char *nptr, char **endptr, int base)
++{
++	return strtoll(nptr, endptr, base);
++}
 Index: git/pseudo_util.c
 ===================================================================
 --- git.orig/pseudo_util.c
 +++ git/pseudo_util.c
-@@ -8,6 +8,17 @@
-  */
- /* we need access to RTLD_NEXT for a horrible workaround */
- #define _GNU_SOURCE
-+/* glibc 2.38 would include  __isoc23_strtol and similar symbols. This is trggerd by
-+ * _GNU_SOURCE but we have to set that for other definitions. Therefore play with defines
-+ * to turn this off.
-+ */
-+#include <features.h>
-+#undef __GLIBC_USE_ISOC2X
-+#undef __GLIBC_USE_C2X_STRTOL
-+#define __GLIBC_USE_C2X_STRTOL 0
-+#undef __GLIBC_USE_ISOC23
-+#undef __GLIBC_USE_C23_STRTOL
-+#define __GLIBC_USE_C23_STRTOL 0
- 
- #include <ctype.h>
- #include <errno.h>
+@@ -229,7 +229,7 @@ pseudo_init_util(void) {
+ 	env = pseudo_get_value("PSEUDO_DEBUG");
+ 	if (env) {
+ 		int i;
+-		int level = atoi(env);
++		int level = pseudo_atoi_wrapper(env);
+ 		if (level > 0) {
+ 			for (i = 0; i < level; ++i) {
+ 				pseudo_debug_verbose();
+Index: git/ports/unix/guts/linkat.c
+===================================================================
+--- git.orig/ports/unix/guts/linkat.c
++++ git/ports/unix/guts/linkat.c
+@@ -55,7 +55,7 @@
+ 		errno = ENOSYS;
+ 		return -1;
+ #endif
+-		tmpfile_fd = atoi(oldpath + 14);
++		tmpfile_fd = pseudo_atoi_wrapper(oldpath + 14);
+ 		// call actual link
+ 		rc = real_linkat(AT_FDCWD, oldpath, AT_FDCWD, newpath, AT_SYMLINK_FOLLOW);
+ 	} else
 Index: git/pseudo_client.c
 ===================================================================
 --- git.orig/pseudo_client.c
 +++ git/pseudo_client.c
-@@ -6,7 +6,7 @@
-  * SPDX-License-Identifier: LGPL-2.1-only
-  *
-  */
--#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <stdio.h>
- #include <signal.h>
+@@ -614,7 +614,7 @@ pseudo_init_client(void) {
+ 			 * at all.
+ 			 */
+ 			if (*env) {
+-				pseudo_nosymlinkexp = strtol(env, &endptr, 10);
++				pseudo_nosymlinkexp = pseudo_strtol_wrapper(env, &endptr, 10);
+ 				if (*endptr)
+ 					pseudo_nosymlinkexp = 1;
+ 			} else {
+@@ -624,20 +624,9 @@ pseudo_init_client(void) {
+ 			pseudo_nosymlinkexp = 0;
+ 		}
+ 		free(env);
+-		env = pseudo_get_value("PSEUDO_UIDS");
+-		if (env)
+-			sscanf(env, "%d,%d,%d,%d",
+-				&pseudo_ruid, &pseudo_euid,
+-				&pseudo_suid, &pseudo_fuid);
+-		free(env);
+-
+-		env = pseudo_get_value("PSEUDO_GIDS");
+-		if (env)
+-			sscanf(env, "%d,%d,%d,%d",
+-				&pseudo_rgid, &pseudo_egid,
+-				&pseudo_sgid, &pseudo_fuid);
+-		free(env);
+ 
++		readenv_uids();
++		readenv_gids();
+ 		env = pseudo_get_value("PSEUDO_CHROOT");
+ 		if (env) {
+ 			pseudo_chroot = strdup(env);
+@@ -1030,7 +1019,7 @@ client_spawn_server(void) {
+ 			pseudo_pidfile = pseudo_localstatedir_path(PSEUDO_PIDFILE);
+ 			fp = fopen(pseudo_pidfile, "r");
+ 			if (fp) {
+-				if (fscanf(fp, "%d", &server_pid) != 1) {
++				if (read_pidfile(fp, &server_pid) != 1) {
+ 					pseudo_debug(PDBGF_CLIENT, "Opened server PID file, but didn't get a pid.\n");
+ 				}
+ 				fclose(fp);
+@@ -1295,7 +1284,7 @@ pseudo_client_setup(void) {
+ 	fp = fopen(pseudo_pidfile, "r");
+ 	free(pseudo_pidfile);
+ 	if (fp) {
+-		if (fscanf(fp, "%d", &server_pid) != 1) {
++		if (read_pidfile(fp, &server_pid) != 1) {
+ 			pseudo_debug(PDBGF_CLIENT, "Opened server PID file, but didn't get a pid.\n");
+ 		}
+ 		fclose(fp);
+Index: git/pseudo_client_scanf.c
+===================================================================
+--- /dev/null
++++ git/pseudo_client_scanf.c
+@@ -0,0 +1,39 @@
++#include <stdio.h>
++#include "pseudo.h"
++#include "pseudo_ipc.h"
++#include "pseudo_client.h"
++
++/*
++ * glibc 2.38 would include  __isoc23_strtol and similar symbols if _GNU_SOURCE
++ * is used. We have to set that for other definitions so delcare this wrapper
++ * in a context where we don't have that set.
++ *
++ * We need to wrap strtol, strtoll, atoi, fscanf and sscanf.
++ */
++
++void readenv_uids(void)
++{
++	char *env;
++	env = pseudo_get_value("PSEUDO_UIDS");
++	if (env)
++		sscanf(env, "%d,%d,%d,%d",
++			&pseudo_ruid, &pseudo_euid,
++			&pseudo_suid, &pseudo_fuid);
++	free(env);
++}
++
++void readenv_gids(void)
++{
++	char *env;
++	env = pseudo_get_value("PSEUDO_GIDS");
++	if (env)
++		sscanf(env, "%d,%d,%d,%d",
++			&pseudo_rgid, &pseudo_egid,
++			&pseudo_sgid, &pseudo_fuid);
++	free(env);
++}
++
++int read_pidfile(FILE *fp, int *server_pid)
++{
++	return fscanf(fp, "%d", server_pid);
++}
+Index: git/pseudo_client.h
+===================================================================
+--- git.orig/pseudo_client.h
++++ git/pseudo_client.h
+@@ -74,6 +74,10 @@ extern int pseudo_nosymlinkexp;
+ 
+ extern int pseudo_umask;
+ 
++extern void readenv_uids(void);
++extern void readenv_gids(void);
++extern int read_pidfile(FILE *, int *);
++
+ /* Root can read and write files, and enter directories which have no
+  * read, write, or execute permissions.  (But can't execute files without
+  * execute permissions!)
diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
index c453b5f7358..f42b32b8d9e 100644
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
@@ -28,10 +28,10 @@ diff --git a/Makefile.in b/Makefile.in
 @@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
  libpseudo: $(LIBPSEUDO)
  
- $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS) | $(LIB)
+ $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
 -	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
 +	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_ipc.o \
+ 		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
  		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
  
 diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c

