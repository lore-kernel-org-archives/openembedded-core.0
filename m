Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.297.1611869032657573667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 13:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b3NdQhXE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y187so5674106wmd.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOqVktjsJ94udfYiQDZsQbN5iPdzcwkGlALCfl6I6zs=;
        b=b3NdQhXE7wHBlBGBpz0VBrdqHkeP3NYc8zsn4uwnbh+zpQhT9iSFDrrWsVZKKjErKM
         uLW91xmyjNN2Dn5Y59beWNTCCzWOTUnhjcrF6DN9OLZbuAzc5MIEdaTLjdTgM4H7EaUJ
         HX2KUztoA5Gg4v8V2D/T/lwWGlZANWxWIpxSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOqVktjsJ94udfYiQDZsQbN5iPdzcwkGlALCfl6I6zs=;
        b=fMh8dfuDINTMPt6Fmwn025EiFhLIUYPctuLITTIYxvR5RtVMCFVN3akpZeg3a8w8F3
         h7xKw6bJiPfyhIstQ8DjDscLjEzQX1bJhKIXDLk0X3AjJ+wB2CAsQ7VfXFIybBpFaouX
         PJh1eTz93bBtonjObGjqS9vCE0ApK6DwMQsDAXjnz2N4BNAuQNc0nW3JUnIrJ4uVqgiH
         Y/HQOsX9wcIFeCIvMj19786IL2hGnzCcvS5dnH1YOS22lakDnnMrGo85EFcdJdeRFmcO
         p6kBqsjWhXt8R/Ovx75w5UC88K5DPbfbxQT0r/WQXdT+wuHH+tEZBFR2W2R6qib/k0yV
         pMkg==
X-Gm-Message-State: AOAM532aSazqaqttcrLBGPAXSBouJMijebrDO7k2Joqo6PSHJGwHyLgq
	Q9PmRNQlk5lWUt/uSVzicfmXLU6T5HHUGQ==
X-Google-Smtp-Source: ABdhPJzUWUyK9yXp8jKeu0eqOfj85iXUjJopbCsWQppwSuozvg08CKbNHD0DNbLmct+iT4osMtcbMw==
X-Received: by 2002:a05:600c:24b:: with SMTP id 11mr963489wmj.17.1611869030904;
        Thu, 28 Jan 2021 13:23:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id p18sm3779868wrx.84.2021.01.28.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 13:23:50 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] pseudo_client: Ensure renames update open fd file paths
Date: Thu, 28 Jan 2021 21:23:50 +0000
Message-Id: <20210128212350.1337739-1-richard.purdie@linuxfoundation.org>
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
 test/test-rename-fstat.c  | 23 +++++++++++++++++++++++
 test/test-rename-fstat.sh | 12 ++++++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
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
index 0000000..fb47c05
--- /dev/null
+++ b/test/test-rename-fstat.c
@@ -0,0 +1,23 @@
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
+    int err;
+    int fd = open("test-rename-fstat1", O_RDONLY);
+    err = rename("test-rename-fstat1", "test-rename-fstat1");
+    if (err)
+        return err;
+    return fstat(fd, &buf);
+}
diff --git a/test/test-rename-fstat.sh b/test/test-rename-fstat.sh
new file mode 100755
index 0000000..4ac89b8
--- /dev/null
+++ b/test/test-rename-fstat.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+rm -f test-rename-fstat1 test-rename-fstat2
+touch test-rename-fstat1
+# Will abort if it fails
+./test/test-rename-fstat
+ecode=$?
+rm -f test-rename-fstat1 test-rename-fstat2
+exit $ecode
-- 
2.27.0

