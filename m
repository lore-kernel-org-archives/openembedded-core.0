Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.9873.1602065694680207299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=enVg7MgM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l15so4151689wmh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=300WxQJIUhhZ/9nk5if0F0ras49PBzhX36tO4iod0mU=;
        b=enVg7MgMZBXHpsnOFozl8rAW3/Kyf/aZOUhnr3xqsTedB3EA84KPntLUZAroOViRiy
         ysb2qFOMJoiVfi9wh7K+PFlhEMDqD34cOOqM5rC6rGvxkSySC6eTQ7gBupzJAZno+Cwp
         +ryR7EMcX5Ise6Urj3E2a8hg3BONKvSEELEuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=300WxQJIUhhZ/9nk5if0F0ras49PBzhX36tO4iod0mU=;
        b=jd3kmsn7EM5JPgJnWi2zWb3M9H7muWdkh1TRx7zWe2ahlN6dWkYfVu0CDwp4dYSif+
         mqaAZIiRCAOrrFr6U0G8U3TdE3qfz5eXOYTzgFiaxv2C4Qcerp9DXJiDIPRWjboqvt8f
         Y9o38VK1kEYjR19SF2q8c9r23PslgCXlSWLRwGx/ij1K1ZmEc/kh2CWAlD0B72H8iDkj
         Via1kQIuPe9NtrejGz0MsSQ6Mlmki4r31Y/wbenJwx2XhHRF5Qwpk2HMJixvRLV29c3U
         vnCOmIrBJeOshWZD/otZ0z9dKomyJxoYPBPjgRiAT1UgK+iZZSNY9LnQ0mXde1GdYMPJ
         48kg==
X-Gm-Message-State: AOAM532AYz+KF67Nqmos41/iC3AsCZGUL3SfSd1U+zGqdjqu9MsHg8JU
	W0bL7dyqEcXWhi6QQppn+kuQHR1U4rvWZA==
X-Google-Smtp-Source: ABdhPJygYYzavFxT8MANw1dTFSIRsgqUrqhXFEeRh28fjLE/ovlCzPjzeWm4NCC6F3GU3kWX5gKFdg==
X-Received: by 2002:a1c:81ce:: with SMTP id c197mr2423434wmd.111.1602065692852;
        Wed, 07 Oct 2020 03:14:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:52 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 4/9] psuedo: Add tracking of linked files for fds
Date: Wed,  7 Oct 2020 11:14:44 +0100
Message-Id: <20201007101449.3132127-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Where files are link()'d and one is unlink()'d, pseudo's fd mappings
can become confused. Add a patch to try and improve this for the common
usecases we see.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/track_link_fds.patch         | 155 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/track_link_fds.patch

diff --git a/meta/recipes-devtools/pseudo/files/track_link_fds.patch b/meta/recipes-devtools/pseudo/files/track_link_fds.patch
new file mode 100644
index 00000000000..a3a9eb3f23f
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
index 56c9b4e2328..a5e79ec9a5c 100644
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

