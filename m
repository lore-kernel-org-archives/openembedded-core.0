Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.11476.1607008140160072056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=u18dOLvi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id h7so2212520pjk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4g/2axr+cUJZjVLc1uS38SlCzdJIw7ITJ+LJcWrE6io=;
        b=u18dOLvieBrt7T8ZrHEnMEWrmeWgKCmZxBVKZEodlN0yZpIggG6Ij831J/bWFCfGcn
         MICPyLpUoG6vV5JILGfh8VSjborOTuBQtP7lsbf7OnJfkboKjhxyd2pcHuRbHT1We1zK
         ghAxyyjbVzILNBGnbEsLUmneOBYlHJ83uya5cZTSSNLq0X4wIc2Y1AxuogZfDOrQFEM2
         +3v0VXDWU/WOEuHE/SAC0TSDWcCOgGfvjJzCjFlSPk0xdXtCIg3xhHWTJv/ACQmmuZTR
         W6NW413aRgXbUHOEwAkuGcQF9SMytutUaxvkpHvjB/shOlega9nA8j0kKDTO2onmQ880
         iXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4g/2axr+cUJZjVLc1uS38SlCzdJIw7ITJ+LJcWrE6io=;
        b=X/czECKdm9bPYZLEr3ttPiga1uA4sNii/dgXGwbFuV5Rq3nV/gwBQP834YRssQ/DLi
         6ri1LOW/WIKKI1/MRxaoMgPPIS+AFGUjPpwqGFxzisq/EpTYDKJToArqcMRiCK8WHQIH
         jtWGw+FtGm7ZcJpthvOsvQnIs4etTU+LOdxlfM/9ebrJTXSL5QsfWol2ksMHSbS5ND02
         vHWxmYhHUMpHAGas8TBFAsHG8OxhpndOO0pkNqjaDrTkVu4mzJV45YYRZjXO+Iba8N4U
         JDbcooCIw7NCwJvZRFSwLf8r/ARvLiKJtXaQIsZBjWevBV9X3m0II8Ypx6J6lErWwO8p
         3c2Q==
X-Gm-Message-State: AOAM532LfVAaBx/nmmL/5NVkU74fVwQir0hpxJ02xbwhTnlhgRRgJyk5
	SF3Kt/aAeUL6CvgvGwLDuInxWPuYdJt2EeU+
X-Google-Smtp-Source: ABdhPJxUAo4nOUpqL6xexxxaCt3Tvg3Gtnqr5m7ksS6c4/ngr5WlYV2a7IkyevRrHvPV1ogJeyMh7g==
X-Received: by 2002:a17:90a:658c:: with SMTP id k12mr3420625pjj.83.1607008139046;
        Thu, 03 Dec 2020 07:08:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/28] psuedo: Add tracking of linked files for fds
Date: Thu,  3 Dec 2020 05:07:58 -1000
Message-Id: <d66597b0d2e80759572b7b261944445a82474416.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1

