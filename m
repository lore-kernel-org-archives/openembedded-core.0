Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.12869.1611672156848544505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=twuU88L+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id n25so11582491pgb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jEWEWGqqVgemRvAX/I6qpZXO7MHww2Ln3FQqO8f60f0=;
        b=twuU88L+0SW4//WMn557eqzEAK99ubqBZYgbvTTg/7E9pOAFhKAu3FAOgM9UhfRAbW
         FFlvq9XtthLYhDHW4FZIX8BdN47gIuWkerU9ghKyP/i/L6aVXEWGnjCYlVEYa01IUT6D
         W7J4fMKMPCqzmUgZEE49QnT6+F+I2sAWTXhjnSZjHfpfwWL1gtgxrKJT9TGImn2pr+RJ
         9poqJWAtVrJ/LzmJzJt6aNnyIJlVz1ufjXd7IJFZcOlNLannI9HVV5QnNJ9LrxMFjyrx
         pVTR+/1mXi7qxJlfR7isa6pVJF4xXno9d8qB/0SqfjwGGTr7ctZ65WBgD2FVu9PO1wTm
         pnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEWEWGqqVgemRvAX/I6qpZXO7MHww2Ln3FQqO8f60f0=;
        b=WrNoO79nhsMM4Lwa75v1SfNFKidBUIfgFKGySj8X9iLVHCs1zpqCR2UWodptb16ESU
         d95F1J8EhuDSSeydWOa4yNYtiTCkwi/3u1wCSvBRsr7D0T6Y8pT21QgDB6RUa7c3IzPK
         ewcYNHyLiKZvV4dtd/15AUGzwCWnH2hcw8yrNyuZK9sn+nR9pXBAhJVEmUmWopFIwduf
         DPXHaX+YBXnKBeY3/iq+8s4nk5K8TQd+tTRkdEQ+N6YK/IS2TzO7Kq+xmn6KCeIRi8KZ
         fwYHwyRxHgQ5mGfupdoA8OOxvpabBceguIcRMsRMuOG8Ep8LrCIH4eRgnXDdnTOr0Ll9
         Bo6Q==
X-Gm-Message-State: AOAM530k/0zihDLGpiSYsR6heAIvwicTGMbClqaNpoQjTDgjAzTMcFbn
	REkzR4/vs/ORk4HArzZyfAkjcD2do2cGAGewRjk=
X-Google-Smtp-Source: ABdhPJxn69Q0FAKneVKLFLZ7XO0LDowKaMtBO+xCrG1hkH+tiDTtbkZUUTN/FvlYEoFuAnYIRDaLzQ==
X-Received: by 2002:a63:c941:: with SMTP id y1mr5863460pgg.313.1611672155851;
        Tue, 26 Jan 2021 06:42:35 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 08/46] psuedo: Add tracking of linked files for fds
Date: Tue, 26 Jan 2021 04:41:19 -1000
Message-Id: <2579bab3048d5e995dc7e14ca9cca1975adb44ed.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Where files are link()'d and one is unlink()'d, pseudo's fd mappings
can become confused. Add a patch to try and improve this for the common
usecases we see.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ce621fa2099608ca0ccbb8420b31d71cdd7b00e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/track_link_fds.patch         | 155 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/track_link_fds.patch

diff --git a/meta/recipes-devtools/pseudo/files/track_link_fds.patch b/meta/recipes-devtools/pseudo/files/track_link_fds.patch
new file mode 100644
index 0000000000..a3a9eb3f23
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/track_link_fds.patch
@@ -0,0 +1,155 @@
+Consider what happens if a program does:
+
+fd = fopen("A")
+link("A", "B")
+unlink("A")
+fchown(fd)
+
+Assuming we can't use the database, in order to handle this correctly, 
+we need to change the open fd to point at B when A us unlinked.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/ports/unix/guts/linkat.c
+===================================================================
+--- git.orig/ports/unix/guts/linkat.c
++++ git/ports/unix/guts/linkat.c
+@@ -116,6 +116,7 @@
+ 	 * if the thing linked is a symlink.
+ 	 */
+ 	pseudo_client_op(OP_LINK, 0, -1, -1, newpath, &buf);
++	pseudo_client_linked_paths(oldpath, newpath);
+ 
+ 	errno = save_errno;
+ 
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -70,6 +70,8 @@ int pseudo_umask = 022;
+ 
+ static char **fd_paths = NULL;
+ static int nfds = 0;
++static char **linked_fd_paths = NULL;
++static int linked_nfds = 0;
+ static const char **passwd_paths = NULL;
+ static int npasswd_paths = 0;
+ #ifdef PSEUDO_PROFILING
+@@ -889,39 +891,70 @@ fd_path(int fd) {
+ }
+ 
+ static void
+-pseudo_client_path(int fd, const char *path) {
++pseudo_client_path_set(int fd, const char *path, char ***patharray, int *len) {
+ 	if (fd < 0)
+ 		return;
+ 
+-	if (fd >= nfds) {
++	if (fd >= *len) {
+ 		int i;
+ 		pseudo_debug(PDBGF_CLIENT, "expanding fds from %d to %d\n",
+-			nfds, fd + 1);
+-		fd_paths = realloc(fd_paths, (fd + 1) * sizeof(char *));
+-		for (i = nfds; i < fd + 1; ++i)
+-			fd_paths[i] = 0;
+-		nfds = fd + 1;
++			*len, fd + 1);
++		(*patharray) = realloc((*patharray), (fd + 1) * sizeof(char *));
++		for (i = *len; i < fd + 1; ++i)
++			(*patharray)[i] = 0;
++		*len = fd + 1;
+ 	} else {
+-		if (fd_paths[fd]) {
++		if ((*patharray)[fd]) {
+ 			pseudo_debug(PDBGF_CLIENT, "reopening fd %d [%s] -- didn't see close\n",
+-				fd, fd_paths[fd]);
++				fd, (*patharray)[fd]);
+ 		}
+ 		/* yes, it is safe to free null pointers. yay for C89 */
+-		free(fd_paths[fd]);
+-		fd_paths[fd] = 0;
++		free((*patharray)[fd]);
++		(*patharray)[fd] = 0;
+ 	}
+ 	if (path) {
+-		fd_paths[fd] = strdup(path);
++		(*patharray)[fd] = strdup(path);
++	}
++}
++
++static void
++pseudo_client_path(int fd, const char *path) {
++	pseudo_client_path_set(fd, path, &fd_paths, &nfds);
++}
++
++void
++pseudo_client_linked_paths(const char *oldpath, const char *newpath) {
++	int fd;
++	for (fd = 3; fd < nfds; ++fd) {
++		if (fd_paths[fd] && !strcmp(oldpath, fd_paths[fd])) {
++			pseudo_client_path_set(fd, newpath, &linked_fd_paths, &linked_nfds);
++		}
+ 	}
+ }
+ 
+ static void
++pseudo_client_unlinked_path(const char *path) {
++	int fd;
++	for (fd = 0; fd < linked_nfds; ++fd) {
++		if (linked_fd_paths[fd] && fd_paths[fd] && !strcmp(path, fd_paths[fd])) {
++			pseudo_client_path(fd, linked_fd_paths[fd]);
++		}
++	}
++}
++
++
++static void
+ pseudo_client_close(int fd) {
+ 	if (fd < 0 || fd >= nfds)
+ 		return;
+ 
+ 	free(fd_paths[fd]);
+ 	fd_paths[fd] = 0;
++
++	if (fd < linked_nfds) {
++		free(linked_fd_paths[fd]);
++		linked_fd_paths[fd] = 0;
++	}
+ }
+ 
+ /* spawn server */
+@@ -1860,6 +1893,12 @@ pseudo_client_op(pseudo_op_t op, int acc
+ 			dirfd);
+ 		pseudo_client_path(dirfd, fd_path(fd));
+ 		break;
++	case OP_UNLINK:
++	case OP_DID_UNLINK:
++		if (path)
++			pseudo_client_unlinked_path(path);
++		do_request = 1;
++		break;
+ 	/* operations for which we should use the magic uid/gid */
+ 	case OP_CHMOD:
+ 	case OP_CREAT:
+@@ -1882,8 +1921,6 @@ pseudo_client_op(pseudo_op_t op, int acc
+ 	case OP_LINK:
+ 	case OP_RENAME:
+ 	case OP_STAT:
+-	case OP_UNLINK:
+-	case OP_DID_UNLINK:
+ 	case OP_CANCEL_UNLINK:
+ 	case OP_MAY_UNLINK:
+ 	case OP_GET_XATTR:
+Index: git/pseudo_client.h
+===================================================================
+--- git.orig/pseudo_client.h
++++ git/pseudo_client.h
+@@ -9,6 +9,7 @@
+ extern pseudo_msg_t *pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...);
+ extern int pseudo_client_ignore_path(const char *path);
+ extern int pseudo_client_ignore_fd(int fd);
++extern void pseudo_client_linked_paths(const char *oldpath, const char *newpath);
+ #if PSEUDO_STATBUF_64
+ #define base_lstat real_lstat64
+ #define base_fstat real_fstat64
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 56c9b4e232..a5e79ec9a5 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -5,6 +5,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://delete_mismatches.patch \
            file://add_ignore_paths.patch \
            file://abort_on_mismatch.patch \
+           file://track_link_fds.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

