Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.93.1611868339603954880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 13:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fUdYz4+S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id u14so5648760wmq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XXpLX0qKHFt75xn8/Xe5Y3FcKVVdjgfVeXg7GzVxlMg=;
        b=fUdYz4+SUazSeugeuwA7tHM6h46p9bYBQ1vwyhRt0r8E44pMYUAHjkq6B1HolJQuyN
         ROBtIHlRyEIAhVGMaTi9WJxAva/iIiCjweMvCAMdnpff80J3ud1jNfSPhZ52Urv/EpsH
         wKjLrc5VBOqtnR9pXstCW+cy6dVSuXMzxF6x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XXpLX0qKHFt75xn8/Xe5Y3FcKVVdjgfVeXg7GzVxlMg=;
        b=XDLA3TQ25yvqzvG+MuTXbQdDZgyimANsRftiAzALDiA2EFpQRwObDw8v1XPB3gVwF+
         E1wzoc5clr30/+FAIr+INzCKSDRjGK+rKj1ay62/FZk47eqyscZYrbFvDI7ko0ikTits
         6KWTCn0VwwCTOc4VPCD6mImbcvkv7Bq3Y01T/KxvG99TzGL2y+bzur6FB83yDWhKRaO/
         t7x+dpMZw6dx6X3zOqJg0HSj0XSW7jZNlETsV12bMgpYyEoz3AK/V6wfEehiuqGPEIZb
         MoB3c5MelscsUksJjXGTZ8RdAlJfPA5BDODPCcfXiipzUfbcOc0o6dGM71BjIVTLeICh
         w3ow==
X-Gm-Message-State: AOAM531ZLYBO4yLzFUWV3OCa0ft1cHkh/KKPWw3eIHBEpIKLklEZBKSS
	8p8s3m4C1nFV4w/affk+Yo13bVq0Kuvgww==
X-Google-Smtp-Source: ABdhPJzfdEm10bLyQqqRJRgEHUTirAIgUug9YAxVS23UKy6Sf79DwPBtzMeZW5J0KP8hSD3YyWRKIw==
X-Received: by 2002:a05:600c:2888:: with SMTP id g8mr951234wmd.169.1611868337728;
        Thu, 28 Jan 2021 13:12:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id y24sm6885924wmi.47.2021.01.28.13.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 13:12:17 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo_client: Ensure renames update open fd file paths
Date: Thu, 28 Jan 2021 21:12:12 +0000
Message-Id: <20210128211212.1337419-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an issue in pseudo where if you open a file, rename the file,
then call fstat on the open fd, pseudo would thrown an abort. This is
because it needs to track the open fd mappings to files and it doesn't
update in the case of a rename.

Add code in pseudo to update the fd mappings in the case of a rename
call. Also add a test case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 Makefile.in               |  1 +
 pseudo_client.c           | 20 +++++++++++++++++++-
 test/test-rename-fstat.c  | 21 +++++++++++++++++++++
 test/test-rename-fstat.sh |  9 +++++++++
 4 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 test/test-rename-fstat.c
 create mode 100755 test/test-rename-fstat.sh

diff --git a/Makefile.in b/Makefile.in
index d1f77d5..6eff522 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -75,6 +75,7 @@ TABLES=table_templates/pseudo_tables.c table_templates/pseudo_tables.h
 all: $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) $(PSEUDO_PROFILE)
 
 test: all | $(BIN) $(LIB) $(LOCALSTATE)
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-rename-fstat test/test-rename-fstat.c
 	@./run_tests.sh -v
 
 install-lib: $(LIBPSEUDO)
diff --git a/pseudo_client.c b/pseudo_client.c
index f5cab7e..f846d54 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -943,6 +943,21 @@ pseudo_client_linked_paths(const char *oldpath, const char *newpath) {
 	}
 }
 
+static void
+pseudo_client_rename_path(const char *oldpath, const char *newpath) {
+	int fd;
+	for (fd = 3; fd < nfds; ++fd) {
+		if (fd_paths[fd] && !strcmp(oldpath, fd_paths[fd])) {
+                        pseudo_client_path(fd, newpath);
+		}
+	}
+	for (fd = 0; fd < linked_nfds; ++fd) {
+		if (linked_fd_paths[fd] && fd_paths[fd] && !strcmp(oldpath, linked_fd_paths[fd])) {
+			pseudo_client_path_set(fd, newpath, &linked_fd_paths, &linked_nfds);
+		}
+	}
+}
+
 static void
 pseudo_client_unlinked_path(const char *path) {
 	int fd;
@@ -1939,7 +1954,6 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 	case OP_FCHOWN:
 	case OP_FSTAT:
 	case OP_LINK:
-	case OP_RENAME:
 	case OP_STAT:
 	case OP_CANCEL_UNLINK:
 	case OP_MAY_UNLINK:
@@ -1949,6 +1963,10 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 	case OP_REMOVE_XATTR:
 		do_request = 1;
 		break;
+	case OP_RENAME:
+		pseudo_client_rename_path(path_extra_1, path);
+		do_request = 1;
+		break;
 	default:
 		pseudo_diag("error: unknown or unimplemented operator %d (%s)", op, pseudo_op_name(op));
 		break;
diff --git a/test/test-rename-fstat.c b/test/test-rename-fstat.c
new file mode 100644
index 0000000..ef1daf7
--- /dev/null
+++ b/test/test-rename-fstat.c
@@ -0,0 +1,21 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * Test we can rename a file whilst holding an open fd which we fstat after renaming
+ */
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+int main()
+{
+    struct stat buf;
+    int fd = open("test-rename-fstat1", O_RDONLY);
+    rename("test-rename-fstat1", "test-rename-fstat1");
+    fstat(fd, &buf);
+    return 0;
+}
diff --git a/test/test-rename-fstat.sh b/test/test-rename-fstat.sh
new file mode 100755
index 0000000..93b3d8a
--- /dev/null
+++ b/test/test-rename-fstat.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+rm -f test-rename-fstat1 test-rename-fstat2
+# Will abort if it fails
+./test/test-rename-fstat
+exit $?
-- 
2.27.0

