Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.337.1611586317189274928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1Pfao2gV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id md11so8558933pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jEWEWGqqVgemRvAX/I6qpZXO7MHww2Ln3FQqO8f60f0=;
        b=1Pfao2gV+JSa/Gl+LoxO+yTcr+acC6UCe0jKZHzHf6OATW2fKKtddx3irtxN2l8EpA
         XDACxypDNNZNzOX31wucmt9qT1ARuds8ykNgg9f/1Kk/S5YTVDFAp/Zmv63/U1BTHwwi
         P5bd3T6MlYTJKOxFvcOWvNfVGPqhO65Fj5MceGDgICZOaky+OtHKYOXriQWs04YgEy+w
         t2vlhuoMhbtViggnncydbrrjoQrvzShiVxNOIohHjGmm2X3WVJzCFvOE6zSZoowGOQKi
         YUQw0k7ZlGpdW9llzvZthpf50OGgx3AMDd0Xx17Y2uQ9r1jNX1QR/oktscYsQbpjjKJw
         RDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEWEWGqqVgemRvAX/I6qpZXO7MHww2Ln3FQqO8f60f0=;
        b=ouibxN6WET61HM4iufGjh7CSk2Zu3FqUpDzGVfJJAMG5lYSz0RfOZX6JVavorNtLQE
         XC7Rm76Yw8jbUF+iPZUiz8z/km1gVzoPVrJ1i0/Gxa/jI5pmo90WkWocJr2+F//R1n6e
         uaoaCDtAbGuLfuHykMVU5EE1wpf+CwppfQNHToGWcEBL1qBkeO2aYO60BIGEmR4YuvXt
         ylTvOuApWpR4PR5Ns06FoBadGuNmT47/jnTs+QS14gVl6ppYP1KM0XE1dHL3+2W9j6lo
         rRAUPim3/MnDLOUScOCnPFROcHk+PIzzzDgjPfDlVlUAGDh5OzszMk1z/2Z8ueBXcLOv
         2qyQ==
X-Gm-Message-State: AOAM532WdogmXkE2NBpui3PtGj00ESJOn6kquyzjXdJ5H+FiT8oAhbAW
	IX7Lpu1if1dNCTfhapnRaFjfyVta4d6PTSspX+E=
X-Google-Smtp-Source: ABdhPJx+mzzkhMIs33uIGgIUazipOVOKx2vrWzWPiPrc2rvoL/ThlM99+JuRo4sNqz7wLYfNmPsCzQ==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ed0 with SMTP id n14-20020a170902e54eb02900de8c702ed0mr1035918plf.3.1611586316225;
        Mon, 25 Jan 2021 06:51:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/47] psuedo: Add tracking of linked files for fds
Date: Mon, 25 Jan 2021 04:50:40 -1000
Message-Id: <2579bab3048d5e995dc7e14ca9cca1975adb44ed.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

