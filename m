Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.599.1631201780608912034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R3ZLv0Yn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id i3so1661605wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zX3anZPhXxUAjnoG93RyNz45YsgrWO+7rDXwD2FuCTk=;
        b=R3ZLv0YnoStG+mF74x0VDwNbGjQ5I/eb1uBqy2d/+6u8mvpPYhItwx89YQGHqMRVqu
         uppcLyTci/OtuItRHSvX+bdSpRboYRnfKNdoStgE1CIOVhJS/1tzPb6Z0a3ccwvJ1vzl
         lUyc1Uy6NamyDUVzH79cXXgneWOEnj2V53UTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zX3anZPhXxUAjnoG93RyNz45YsgrWO+7rDXwD2FuCTk=;
        b=C0vdvsOZsoz3VZNspmCoweZpoizCw8Hy469rZKBckFFxhcGUl2xmAqobqG8JJL0uyE
         NY9CFdZMev70kkExs74x8OAtMeQZHX+3HrPSSGr+uwCoV192GFG4/TiJ8nPk5vHPNgr2
         KUxOeZ/H0JV4DU3o7p1rQCWCDGJ8KkNR3Ry1lkkmXlZXoX6Zj3UpAE5VcvdafCJN3V/R
         CXaECao9VxaTwNf4y0RUXXk4L9Ku8VKqfHumycgLkeA8Kew6dlT3v9VcB12c6RXqlBag
         AI0bdfjPlCB4vn4aFkms3DQZVP3osJ4eNJc/FNKpTAuJ1coPWRtbwO8NCSujzSnjQ24m
         G0UQ==
X-Gm-Message-State: AOAM531OY1hf8ghhH9JOUYQfOp7cZwFvZCtdjR6ewYcrzLdqJv2Nlphf
	TUHPxX9UZuS6NQGiBorc5OY3/2NAJVMh8mJs
X-Google-Smtp-Source: ABdhPJxK6nNN4GzkoLXZlYUarEJqjsqMIE0cRsDdn4VFe1C7Ct9GAvCoIdZ5Pk97PzG2Kz5ErhZPZw==
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr3665419wms.162.1631201779029;
        Thu, 09 Sep 2021 08:36:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id d29sm2245173wrc.6.2021.09.09.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:36:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 6/6] ports/linux/guts: Add closefrom support for glibc 2.34
Date: Thu,  9 Sep 2021 16:36:14 +0100
Message-Id: <20210909153614.1225570-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

glibc 2.34 adds a closefrom() function call to close a range of file
descriptors. This one is problematic for us since pseudo can have its
own fds open in the close range.

To handle this we add a specific client side op, OP_CLOSEFROM, similar
to OP_CLOSE which closes the fds in the range which aren't pseudo fds.

This means manually closing some of the fds ourselves and then modifying
the call to closefrom for the rest. Not pretty but I'm struggling to see
a better way. It does mean msg/result is used in a new case to let the
caller know which fds to close as the range needs to change. This is
allowed after the previous static change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 enums/op.in                  |  1 +
 ports/linux/guts/closefrom.c | 15 +++++++++++
 ports/linux/wrapfuncs.in     |  1 +
 pseudo_client.c              | 48 ++++++++++++++++++++++++++++++++++--
 4 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 ports/linux/guts/closefrom.c

diff --git a/enums/op.in b/enums/op.in
index 61ee666..5b5e21b 100644
--- a/enums/op.in
+++ b/enums/op.in
@@ -27,3 +27,4 @@ remove-xattr, 1
 set-xattr, 0
 create-xattr, 1
 replace-xattr, 1
+closefrom, 0
diff --git a/ports/linux/guts/closefrom.c b/ports/linux/guts/closefrom.c
new file mode 100644
index 0000000..35df71e
--- /dev/null
+++ b/ports/linux/guts/closefrom.c
@@ -0,0 +1,15 @@
+/*
+ * Copyright (c) 2021 Richard Purdie
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * void closefrom(int fd)
+ */
+ 	pseudo_msg_t *msg;
+	/* this cleans up internal tables, and shouldn't make it to the server. Avoids pseudo's internal fds */
+	msg = pseudo_client_op(OP_CLOSEFROM, 0, fd, -1, 0, 0);
+	real_closefrom(msg->fd);
+
+/*      return;
+ * }
+ */
diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
index e978367..793f5d8 100644
--- a/ports/linux/wrapfuncs.in
+++ b/ports/linux/wrapfuncs.in
@@ -62,3 +62,4 @@ long syscall(long nr, ...); /* hand_wrapped=1 */
 int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags); /* flags=AT_SYMLINK_NOFOLLOW */
 int prctl(int option, ...); /* hand_wrapped=1 */
 int close_range(unsigned int lowfd, unsigned int maxfd, int flags);
+void closefrom(int fd);
diff --git a/pseudo_client.c b/pseudo_client.c
index 546bdb1..a03d6b1 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -983,6 +983,23 @@ pseudo_client_close(int fd) {
 	}
 }
 
+static void
+pseudo_client_closefrom(int fd) {
+	int i;
+	if (fd < 0 || fd >= nfds)
+		return;
+
+	for (i = fd; i < nfds; ++i) {
+		free(fd_paths[i]);
+		fd_paths[i] = 0;
+
+		if (i < linked_nfds) {
+			free(linked_fd_paths[i]);
+			linked_fd_paths[i] = 0;
+		}
+	}
+}
+
 /* spawn server */
 static int
 client_spawn_server(void) {
@@ -1600,6 +1617,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 	static char *alloced_path = 0;
 	static size_t alloced_len = 0;
 	int strip_slash;
+	int startfd, i;
 
 #ifdef PSEUDO_PROFILING
 	struct timeval tv1_op, tv2_op;
@@ -1627,7 +1645,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 		}
 	}
 
-	if (op != OP_CHROOT && op != OP_CHDIR && op != OP_CLOSE && op != OP_DUP
+	if (op != OP_CHROOT && op != OP_CHDIR && op != OP_CLOSE && op != OP_CLOSEFROM && op != OP_DUP
 			&& pseudo_client_ignore_path_chroot(path, 0)) {
 		if (op == OP_OPEN) {
 			/* Sanitise the path to have no trailing slash as this is convention in the database */
@@ -1900,6 +1918,32 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 	case OP_EXEC:
 		do_request = pseudo_client_logging;
 		break;
+	case OP_CLOSEFROM:
+		/* no request needed */
+		startfd = fd;
+		if (pseudo_util_debug_fd > startfd)
+			startfd = pseudo_util_debug_fd + 1;
+		if (pseudo_localstate_dir_fd > startfd)
+			startfd = pseudo_localstate_dir_fd + 1;
+		if (pseudo_pwd_fd > startfd)
+			startfd = pseudo_pwd_fd + 1;
+		if (pseudo_grp_fd > startfd)
+			startfd = pseudo_grp_fd + 1;
+		if (connect_fd > startfd)
+			startfd = connect_fd + 1;
+		for (i = fd; i < startfd; ++i) {
+			if (i == pseudo_util_debug_fd || i == pseudo_localstate_dir_fd || i == pseudo_pwd_fd ||
+					i == pseudo_grp_fd || i == connect_fd)
+				continue;
+			pseudo_client_close(i);
+			close(i);
+		}
+		pseudo_client_closefrom(startfd);
+		/* tell the caller to close from startfd instead of fd */
+		result = &msg;
+		msg.fd = startfd;
+		do_request = 0;
+		break;
 	case OP_CLOSE:
 		/* no request needed */
 		if (fd >= 0) {
@@ -1982,7 +2026,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 		break;
 	}
 	/* result can only be set when PSEUDO_XATTRDB resulted in a
-	 * successful store to or read from the local database.
+	 * successful store to or read from the local database or for OP_CLOSEFROM.
 	 */
 	if (do_request && !result) {
 #ifdef PSEUDO_PROFILING
-- 
2.32.0

