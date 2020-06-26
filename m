Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.139.1593192867837810084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 10:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K1QKH+eX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id t194so10112448wmt.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOQUOvt69xUBeyzxVxuLPsMuNw+PGeiyTahEHV8qVhk=;
        b=K1QKH+eXBRbdqMUntgv4S8Qy9tdCO3KmpBCzg5NlL5cNT0akUYnLjq1KOsxMwSJTXC
         RR9B4rAt+LSRdnqyu9F9Og0vjLrj0NFrtzPypZdqYiAA1vEjRUJg6XadUI+sifb3ua/I
         o2SeA/TBT5mWPEolqL9bRGpdHNykEj37X+v6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOQUOvt69xUBeyzxVxuLPsMuNw+PGeiyTahEHV8qVhk=;
        b=d0R2OYLx0MevEO1xFtv40TC3Zr/lxpxGtJzh1srNTRSX4GPwuVVDaMU0vwxehDl344
         bLKLwHk+gzZ4VjgY0io3GJXbARxOt1pqGVhkqS9ZcUvyUoErM7zoooeLAe2DibZfJR55
         Z41AfwMO6DXdobjL/DBaGj5kMn1bRsuiZGX02Wbf/N+Olnq76hAyGkkjfU9K6LtPL0Gy
         GCMi+EjvIXL6A7gAg/91w5dqFa5LGWEr0s5p71um1CAd52Bxr4fGRx1XFNjo+ZQZ1Cq1
         VJWfNuunEZGZ9ehw8EXK99bIvBMa1ER5Sh3xkeS/bGycjtL5NJnYuQP5wX+/IHBWqJkH
         2YHA==
X-Gm-Message-State: AOAM531aTcsfqiSiXo6pt0RVmc/nndXbQ3jpuLSFZVSwlUX7pZhLb1eM
	ZBWXVDdzjL84nTkdYLn/0psZoKjpbmp5Uw==
X-Google-Smtp-Source: ABdhPJywthohYgDNlpX864Mh06Yx3z4TeDW3e4IiSks/6TAOxpdrtDeCSAB5UDTTV1SmXbFULrEnww==
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr4497246wme.172.1593192865032;
        Fri, 26 Jun 2020 10:34:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 22sm1662411wmb.11.2020.06.26.10.34.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 10:34:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pseudo: Switch to oe-core branch in git repo
Date: Fri, 26 Jun 2020 18:34:21 +0100
Message-Id: <20200626173422.688384-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a significant number of outstanding patches to pseudo. Rather than
queue these up as patches, create a branch in the upstream repo and use that
until such times as we have someone with the time/skills to properly review
these for master in the pseudo repo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/0001-Add-statx.patch         | 106 --------------
 ...001-maketables-wrappers-use-Python-3.patch |  34 -----
 ...ixup-remove-files-that-do-not-exist-.patch |  49 -------
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  |  31 ----
 ...1-realpath.c-Remove-trailing-slashes.patch |  57 --------
 ...xattr-adjust-for-attr-2.4.48-release.patch |  48 ------
 .../pseudo/files/moreretries.patch            |  19 ---
 .../pseudo/files/seccomp.patch                | 137 ------------------
 .../pseudo/files/toomanyfiles.patch           |  71 ---------
 .../pseudo/files/xattr_version.patch          |  54 -------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  14 +-
 11 files changed, 2 insertions(+), 618 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch b/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
deleted file mode 100644
index f01e699de7b..00000000000
--- a/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 4e41a05de1f34ba00a68ca4f20fb49c4d1cbd2d0 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 6 Nov 2019 12:17:46 +0000
-Subject: [PATCH] Add statx glibc/syscall support
-
-Modern distros (e.g. fedora30) are starting to use the new statx() syscall through
-the newly exposed glibc wrapper function in software like coreutils (e.g. the ls
-command). Add support to intercept this to pseudo.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [Emailed to seebs]
----
- ports/linux/guts/statx.c | 48 ++++++++++++++++++++++++++++++++++++++++
- ports/linux/portdefs.h   |  1 +
- ports/linux/wrapfuncs.in |  1 +
- 3 files changed, 50 insertions(+)
- create mode 100644 ports/linux/guts/statx.c
-
-diff --git a/ports/linux/statx/guts/statx.c b/ports/linux/statx/guts/statx.c
-new file mode 100644
-index 0000000..a3259c4
---- /dev/null
-+++ b/ports/linux/statx/guts/statx.c
-@@ -0,0 +1,42 @@
-+/*
-+ * Copyright (c) 2019 Linux Foundation
-+ * Author: Richard Purdie
-+ *
-+ * SPDX-License-Identifier: LGPL-2.1-only
-+ *
-+ * int
-+ * statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) {
-+ *	int rc = -1;
-+ */
-+	pseudo_msg_t *msg;
-+	PSEUDO_STATBUF buf;
-+	int save_errno;
-+
-+	rc = real_statx(dirfd, pathname, flags, mask, statxbuf);
-+	save_errno = errno;
-+	if (rc == -1) {
-+		return rc;
-+	}
-+
-+	buf.st_uid = statxbuf->stx_uid;
-+	buf.st_gid = statxbuf->stx_gid;
-+	buf.st_dev = makedev(statxbuf->stx_dev_major, statxbuf->stx_dev_minor);
-+	buf.st_ino = statxbuf->stx_ino;
-+	buf.st_mode = statxbuf->stx_mode;
-+	buf.st_rdev = makedev(statxbuf->stx_rdev_major, statxbuf->stx_rdev_minor);
-+	buf.st_nlink = statxbuf->stx_nlink;
-+	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, pathname, &buf);
-+	if (msg && msg->result == RESULT_SUCCEED) {
-+		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
-+		statxbuf->stx_uid = msg->uid;
-+		statxbuf->stx_gid = msg->gid;
-+		statxbuf->stx_mode = msg->mode;
-+		statxbuf->stx_rdev_major = major(msg->rdev);
-+		statxbuf->stx_rdev_minor = minor(msg->rdev);
-+	} else {
-+		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
-+	}
-+	errno = save_errno;
-+/*	return rc;
-+ * }
-+ */
-diff --git a/ports/linux/statx/portdefs.h b/ports/linux/statx/portdefs.h
-new file mode 100644
-index 0000000..bf934dc
---- /dev/null
-+++ b/ports/linux/statx/portdefs.h
-@@ -0,0 +1,6 @@
-+/*
-+ * SPDX-License-Identifier: LGPL-2.1-only
-+ *
-+ */
-+#include <sys/stat.h>
-+#include <sys/sysmacros.h>
-diff --git a/ports/linux/statx/wrapfuncs.in b/ports/linux/statx/wrapfuncs.in
-new file mode 100644
-index 0000000..c9cd4c3
---- /dev/null
-+++ b/ports/linux/statx/wrapfuncs.in
-@@ -0,0 +1 @@
-+int statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
-diff --git a/ports/linux/subports b/ports/linux/subports
-index a29044a..49081bf 100755
---- a/ports/linux/subports
-+++ b/ports/linux/subports
-@@ -54,3 +54,13 @@ else
- fi
- rm -f dummy.c dummy.o
- 
-+cat > dummy.c <<EOF
-+#define _GNU_SOURCE
-+#include <sys/stat.h>
-+struct statx x;
-+EOF
-+if ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
-+	echo "linux/statx"
-+fi
-+rm -f dummy.c dummy.o
-+
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch b/meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
deleted file mode 100644
index b2dbdad2780..00000000000
--- a/meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dbd34b1b2af8fbf44a0d5c37abe3448405819823 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 28 Aug 2019 19:20:29 +0200
-Subject: [PATCH] maketables/wrappers: use Python 3
-
-Changelog indicates they should be compatible.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- maketables   | 2 +-
- makewrappers | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/maketables b/maketables
-index a211772..52285e2 100755
---- a/maketables
-+++ b/maketables
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (c) 2008-2010, 2013 Wind River Systems, Inc.
- #
-diff --git a/makewrappers b/makewrappers
-index e84607d..b34f7eb 100755
---- a/makewrappers
-+++ b/makewrappers
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (c) 2008-2011,2013 Wind River Systems, Inc.
- #
diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
deleted file mode 100644
index 9c49e33b021..00000000000
--- a/meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b0902e36108b49e6bc88d6b251cc2f8cffcd5a13 Mon Sep 17 00:00:00 2001
-From: Ricardo Ribalda <ricardo@ribalda.com>
-Date: Sun, 5 Apr 2020 11:40:30 +0000
-Subject: [PATCH] pseudo: On a DB fixup remove files that do not exist anymore
-
-If the user decides to fix a database, remove the files that do not
-exist anymore.
-If only DB test is selected do not change the behaviour (return error).
-
-Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
-Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/137045]
----
- pseudo.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/pseudo.c b/pseudo.c
-index 0f5850e..98e5b0c 100644
---- a/pseudo.c
-+++ b/pseudo.c
-@@ -1087,9 +1087,15 @@ pseudo_db_check(int fix) {
- 			int fixup_needed = 0;
- 			pseudo_debug(PDBGF_DB, "Checking <%s>\n", m->path);
- 			if (lstat(m->path, &buf)) {
--				errors = EXIT_FAILURE;
--				pseudo_diag("can't stat <%s>\n", m->path);
--				continue;
-+				if (!fix) {
-+					pseudo_diag("can't stat <%s>\n", m->path);
-+					errors = EXIT_FAILURE;
-+					continue;
-+				} else {
-+					pseudo_debug(PDBGF_DB, "can't stat <%s>\n", m->path);
-+					fixup_needed = 2;
-+					goto do_fixup;
-+				}
- 			}
- 			/* can't check for device type mismatches, uid/gid, or
- 			 * permissions, because those are the very things we
-@@ -1125,6 +1131,7 @@ pseudo_db_check(int fix) {
- 					S_ISDIR(m->mode));
- 				fixup_needed = 2;
- 			}
-+			do_fixup:
- 			if (fixup_needed) {
- 				/* in fixup mode, either delete (mismatches) or
- 				 * correct (dev/ino).
--- 
-2.21.1
-
diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
deleted file mode 100644
index 33d4ef3b2fa..00000000000
--- a/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a491aececfedf7313d29b80d626e0964fb533548 Mon Sep 17 00:00:00 2001
-From: Jacob Kroon <jacob.kroon@gmail.com>
-Date: Sun, 3 May 2020 06:24:03 +0200
-Subject: [PATCH] pseudo_ipc.h: Fix enum typedef
-
-'pseudo_access_t' is a type, so use typedef.
-
-Fixes building pseudo with gcc 10 where -fno-common is the default.
-
-Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
-Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/137758]
----
- pseudo_ipc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pseudo_ipc.h b/pseudo_ipc.h
-index caeae5c..d945257 100644
---- a/pseudo_ipc.h
-+++ b/pseudo_ipc.h
-@@ -29,7 +29,7 @@ typedef struct {
- 	char path[];
- } pseudo_msg_t;
- 
--enum {
-+typedef enum {
- 	PSA_EXEC = 1,
- 	PSA_WRITE = (PSA_EXEC << 1),
- 	PSA_READ = (PSA_WRITE << 1),
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch b/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
deleted file mode 100644
index 17829ef3ac8..00000000000
--- a/meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 86c9a5610e3333ad6aaadb1ac1e8b5a2c948d119 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 25 Nov 2019 18:46:45 +0800
-Subject: [PATCH] realpath.c: Remove trailing slashes
-
-Linux system's realpath() remove trailing slashes, but pseudo's doesn't, need
-make them identical.
-
-E.g., the following code (rel.c) prints '/tmp' with system's realpath, but
-pseudo's realpath prints '/tmp/':
-
-    #include <stdio.h>
-    #include <limits.h>
-    #include <stdlib.h>
-
-    int main() {
-        char out[PATH_MAX];
-        printf("%s\n", realpath("/tmp/", out));
-        return 0;
-    }
-
-$ bitbake base-passwd -cdevshell # For pseudo env
-$ gcc rel.c
-$ ./a.out
-/tmp/ (but should be /tmp)
-
-This patch fixes the problem.
-
-Upstream-Status: Submitted [https://lists.yoctoproject.org/g/poky/message/11879]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- ports/unix/guts/realpath.c |    9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/ports/unix/guts/realpath.c b/ports/unix/guts/realpath.c
---- a/ports/unix/guts/realpath.c
-+++ b/ports/unix/guts/realpath.c
-@@ -14,7 +14,14 @@
- 		errno = ENAMETOOLONG;
- 		return NULL;
- 	}
--	if ((len = strlen(rname)) >= pseudo_sys_path_max()) {
-+		len = strlen(rname);
-+		char *ep = rname + len - 1;
-+		while (ep > rname && *ep == '/') {
-+			--len;
-+			*(ep--) = '\0';
-+		}
-+
-+		if (len >= pseudo_sys_path_max()) {
- 		errno = ENAMETOOLONG;
- 		return NULL;
- 	}
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch b/meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
deleted file mode 100644
index 161357d5530..00000000000
--- a/meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 93d95ed2eaedcca110c214e1fe3f8896b1f6f853 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 17 Dec 2019 20:24:27 +0100
-Subject: [PATCH] xattr: adjust for attr 2.4.48 release
-
-Latest versions of attr have removed the xattr.h header,
-with the rationale that libc is providing the same wrappers.
-
-attr/attributes.h is providing the ENOATTR definition.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ports/linux/subports         | 5 +++--
- ports/linux/xattr/portdefs.h | 3 ++-
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/ports/linux/subports b/ports/linux/subports
-index 2c43ac9..740ec83 100755
---- a/ports/linux/subports
-+++ b/ports/linux/subports
-@@ -29,11 +29,12 @@ fi
- if	$port_xattr; then
- 	cat > dummy.c <<EOF
- #include <sys/types.h>
--#include <attr/xattr.h>
-+#include <sys/xattr.h>
-+#include <attr/attributes.h>
- int i;
- EOF
- 	if ! ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
--		echo >&2 "Warning: Can't compile trivial program using <attr/xattr.h>".
-+		echo >&2 "Warning: Can't compile trivial program using <attr/attributes.h>".
- 		echo >&2 "         xattr support will require that header."
- 	fi
- 	echo "linux/xattr"
-diff --git a/ports/linux/xattr/portdefs.h b/ports/linux/xattr/portdefs.h
-index 56cd3ca..068d39a 100644
---- a/ports/linux/xattr/portdefs.h
-+++ b/ports/linux/xattr/portdefs.h
-@@ -2,5 +2,6 @@
-  * SPDX-License-Identifier: LGPL-2.1-only
-  *
-  */
--#include <attr/xattr.h>
-+#include <sys/xattr.h>
-+#include <attr/attributes.h>
- #include <stdint.h>
diff --git a/meta/recipes-devtools/pseudo/files/moreretries.patch b/meta/recipes-devtools/pseudo/files/moreretries.patch
deleted file mode 100644
index adea2665b0d..00000000000
--- a/meta/recipes-devtools/pseudo/files/moreretries.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Increase the number of retries in pseudo due to occasional slow
-server shutdowns.
-
-Upstream-Status: Pending
-RP 2016/2/28
-
-Index: git/pseudo_client.c
-===================================================================
---- git.orig/pseudo_client.c
-+++ git/pseudo_client.c
-@@ -1282,7 +1282,7 @@ pseudo_client_setup(void) {
- 	}
- }
- 
--#define PSEUDO_RETRIES 20
-+#define PSEUDO_RETRIES 250
- static pseudo_msg_t *
- pseudo_client_request(pseudo_msg_t *msg, size_t len, const char *path) {
- 	pseudo_msg_t *response = 0;
diff --git a/meta/recipes-devtools/pseudo/files/seccomp.patch b/meta/recipes-devtools/pseudo/files/seccomp.patch
deleted file mode 100644
index 283f997941e..00000000000
--- a/meta/recipes-devtools/pseudo/files/seccomp.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-Pseudo changes the syscall access patterns which makes it incompatible with
-seccomp. Therefore intercept the seccomp syscall and alter it, pretending that
-seccomp was setup when in fact we do nothing. If we error as unsupported, 
-utilities like file will exit with errors so we can't just disable it.
-
-Upstream-Status: Pending
-RP 2020/4/3
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-It fails to compile pseudo-native on centos 7:
-
-| ports/linux/pseudo_wrappers.c: In function ‘prctl’:
-| ports/linux/pseudo_wrappers.c:129:14: error: ‘SECCOMP_SET_MODE_FILTER’ undeclared (first use in this function)
-|    if (cmd == SECCOMP_SET_MODE_FILTER) {
-|               ^
-
-Add macro guard for seccomp to avoid the failure.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Index: git/ports/linux/pseudo_wrappers.c
-===================================================================
---- git.orig/ports/linux/pseudo_wrappers.c
-+++ git/ports/linux/pseudo_wrappers.c
-@@ -57,6 +57,7 @@ int pseudo_capset(cap_user_header_t hdrp
- long
- syscall(long number, ...) {
- 	long rc = -1;
-+	va_list ap;
- 
- 	if (!pseudo_check_wrappers() || !real_syscall) {
- 		/* rc was initialized to the "failure" value */
-@@ -77,6 +78,20 @@ syscall(long number, ...) {
- 	(void) number;
- #endif
- 
-+#ifdef SYS_seccomp
-+	/* pseudo and seccomp are incompatible as pseudo uses different syscalls
-+	 * so pretend to enable seccomp but really do nothing */
-+	if (number == SYS_seccomp) {
-+		unsigned long cmd;
-+		va_start(ap, number);
-+		cmd = va_arg(ap, unsigned long);
-+		va_end(ap);
-+		if (cmd == SECCOMP_SET_MODE_FILTER) {
-+		    return 0;
-+		}
-+	}
-+#endif
-+
- 	/* gcc magic to attempt to just pass these args to syscall. we have to
- 	 * guess about the number of args; the docs discuss calling conventions
- 	 * up to 7, so let's try that?
-@@ -92,3 +108,44 @@ static long wrap_syscall(long nr, va_lis
- 	(void) ap;
- 	return -1;
- }
-+
-+int
-+prctl(int option, ...) {
-+	int rc = -1;
-+	va_list ap;
-+
-+	if (!pseudo_check_wrappers() || !real_prctl) {
-+		/* rc was initialized to the "failure" value */
-+		pseudo_enosys("prctl");
-+		return rc;
-+	}
-+
-+#ifdef SECCOMP_SET_MODE_FILTER
-+	/* pseudo and seccomp are incompatible as pseudo uses different syscalls
-+	 * so pretend to enable seccomp but really do nothing */
-+	if (option == PR_SET_SECCOMP) {
-+		unsigned long cmd;
-+		va_start(ap, option);
-+		cmd = va_arg(ap, unsigned long);
-+		va_end(ap);
-+		if (cmd == SECCOMP_SET_MODE_FILTER) {
-+		    return 0;
-+		}
-+	}
-+#endif
-+
-+	/* gcc magic to attempt to just pass these args to prctl. we have to
-+	 * guess about the number of args; the docs discuss calling conventions
-+	 * up to 5, so let's try that?
-+	 */
-+	void *res = __builtin_apply((void (*)()) real_prctl, __builtin_apply_args(), sizeof(long) * 5);
-+	__builtin_return(res);
-+}
-+
-+/* unused.
-+ */
-+static int wrap_prctl(int option, va_list ap) {
-+	(void) option;
-+	(void) ap;
-+	return -1;
-+}
-Index: git/ports/linux/guts/prctl.c
-===================================================================
---- /dev/null
-+++ git/ports/linux/guts/prctl.c
-@@ -0,0 +1,15 @@
-+/*
-+ * Copyright (c) 2020 Richard Purdie
-+ *
-+ * SPDX-License-Identifier: LGPL-2.1-only
-+ *
-+ * int prctl(int option, ...)
-+ *	int rc = -1;
-+ */
-+
-+	/* we should never get here, prctl is hand-wrapped */
-+	rc = -1;
-+
-+/*	return rc;
-+ * }
-+ */
-Index: git/ports/linux/portdefs.h
-===================================================================
---- git.orig/ports/linux/portdefs.h
-+++ git/ports/linux/portdefs.h
-@@ -32,3 +32,5 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
- 
- #include <linux/capability.h>
- #include <sys/syscall.h>
-+#include <sys/prctl.h>
-+#include <linux/seccomp.h>
-Index: git/ports/linux/wrapfuncs.in
-===================================================================
---- git.orig/ports/linux/wrapfuncs.in
-+++ git/ports/linux/wrapfuncs.in
-@@ -56,3 +56,4 @@ int getgrent_r(struct group *gbuf, char
- int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=pseudo_capset */
- long syscall(long nr, ...); /* hand_wrapped=1 */
- int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags); /* flags=AT_SYMLINK_NOFOLLOW */
-+int prctl(int option, ...); /* hand_wrapped=1 */
diff --git a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
deleted file mode 100644
index bda7e4b2026..00000000000
--- a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From b0b25fbc041a148d1de09f5a6503cd95973ec77c Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 25 Apr 2017 15:25:54 +0100
-Subject: [PATCH 3/3] pseudo: Handle too many files deadlock
-
-Currently if we max out the maximum number of files, pseudo can deadlock, unable to
-accept new connections yet unable to move forward and unblock the other processes
-waiting either.
-
-Rather than hang, when this happens, close out inactive connections, allowing us
-to accept the new ones. The disconnected clients will simply reconnect. There is
-a small risk of data loss here sadly but its better than hanging.
-
-RP
-2017/4/25
-
-Upstream-Status: Submitted [Peter is aware of the issue]
-
----
- pseudo_server.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/pseudo_server.c b/pseudo_server.c
-index dac3258..15a3e8f 100644
---- a/pseudo_server.c
-+++ b/pseudo_server.c
-@@ -802,6 +802,7 @@ pseudo_server_loop(void) {
- 	struct sigaction eat_usr2 = {
- 		.sa_handler = set_do_list_clients
- 	};
-+	int hitmaxfiles;
- 
- 	clients = malloc(16 * sizeof(*clients));
- 
-@@ -820,6 +821,7 @@ pseudo_server_loop(void) {
- 	active_clients = 1;
- 	max_clients = 16;
- 	highest_client = 0;
-+	hitmaxfiles = 0;
- 
- 	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
- 	if (listen_fd < 0) {
-@@ -878,10 +880,15 @@ pseudo_server_loop(void) {
- 					} else {
- 						serve_client(i);
- 					}
-+				} else if (hitmaxfiles) {
-+					/* Only close one per loop iteration in the interests of caution */
-+					close_client(i);
-+					hitmaxfiles = 0;
- 				}
- 				if (die_forcefully)
- 					break;
- 			}
-+			hitmaxfiles = 0;
- 			if (!die_forcefully && 
- 			    (FD_ISSET(clients[0].fd, &events) ||
- 			     FD_ISSET(clients[0].fd, &reads))) {
-@@ -903,6 +910,9 @@ pseudo_server_loop(void) {
- 					 */
- 					pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
- 					die_peacefully = 0;
-+				} else if (errno == EMFILE) {
-+					hitmaxfiles = 1;
-+					pseudo_debug(PDBGF_SERVER, "Hit max open files, dropping a client.\n");
- 				}
- 			}
- 			pseudo_debug(PDBGF_SERVER, "server loop complete [%d clients left]\n", active_clients);
--- 
-2.15.1
-
diff --git a/meta/recipes-devtools/pseudo/files/xattr_version.patch b/meta/recipes-devtools/pseudo/files/xattr_version.patch
deleted file mode 100644
index a8b14bdd699..00000000000
--- a/meta/recipes-devtools/pseudo/files/xattr_version.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-On a tumbleweed system, "install X Y" was showing the error:
-
-pseudo: ENOSYS for 'fsetxattr'.
-
-which was being caused by dlsym() for that function returning NULL. This
-appears to be due to it finding an unresolved symbol in libacl for this 
-symbol in libattr. It hasn't been resolved so its NULL. dlerror() returns
-nothing since this is a valid symbol entry, its just not the one we want.
-
-We can add the glibc version string for the symbol we actually want so we get
-that version rather than the libattr/libacl one.
-
-To quote libattr:
-"""
- These dumb wrappers are for backwards compatibility only.
- Actual syscall wrappers are long gone to libc.
-"""
-and they are simply wrappers around the libc version so our attaching
-to the libc versions should intercept any accesses via these too.
-
-RP 2020/06/22
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
-Upstream-Status: Pending [discussed with seebs on irc and appears the correct fix]
-
-
-Index: git/ports/linux/xattr/wrapfuncs.in
-===================================================================
---- git.orig/ports/linux/xattr/wrapfuncs.in
-+++ git/ports/linux/xattr/wrapfuncs.in
-@@ -1,12 +1,12 @@
--ssize_t getxattr(const char *path, const char *name, void *value, size_t size); /* flags=0 */
--ssize_t lgetxattr(const char *path, const char *name, void *value, size_t size); /* flags=AT_SYMLINK_NOFOLLOW */
--ssize_t fgetxattr(int filedes, const char *name, void *value, size_t size);
--int setxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=0 */
--int lsetxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=AT_SYMLINK_NOFOLLOW */
--int fsetxattr(int filedes, const char *name, const void *value, size_t size, int xflags);
--ssize_t listxattr(const char *path, char *list, size_t size); /* flags=0 */
--ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=AT_SYMLINK_NOFOLLOW */
--ssize_t flistxattr(int filedes, char *list, size_t size);
--int removexattr(const char *path, const char *name); /* flags=0 */
--int lremovexattr(const char *path, const char *name); /* flags=AT_SYMLINK_NOFOLLOW */
--int fremovexattr(int filedes, const char *name);
-+ssize_t getxattr(const char *path, const char *name, void *value, size_t size); /* flags=0, version="GLIBC_2.3" */ 
-+ssize_t lgetxattr(const char *path, const char *name, void *value, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
-+ssize_t fgetxattr(int filedes, const char *name, void *value, size_t size); /* version="GLIBC_2.3" */
-+int setxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=0, version="GLIBC_2.3" */
-+int lsetxattr(const char *path, const char *name, const void *value, size_t size, int xflags); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
-+int fsetxattr(int filedes, const char *name, const void *value, size_t size, int xflags); /* version="GLIBC_2.3" */
-+ssize_t listxattr(const char *path, char *list, size_t size); /* flags=0, version="GLIBC_2.3" */
-+ssize_t llistxattr(const char *path, char *list, size_t size); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
-+ssize_t flistxattr(int filedes, char *list, size_t size); /* version="GLIBC_2.3" */
-+int removexattr(const char *path, const char *name); /* flags=0, version="GLIBC_2.3" */
-+int lremovexattr(const char *path, const char *name); /* flags=AT_SYMLINK_NOFOLLOW, version="GLIBC_2.3" */
-+int fremovexattr(int filedes, const char *name); /* version="GLIBC_2.3" */
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 419bac19fec..ead5dcfb144 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,22 +1,12 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
-           file://moreretries.patch \
-           file://toomanyfiles.patch \
-           file://0001-maketables-wrappers-use-Python-3.patch \
-           file://0001-Add-statx.patch \
-           file://0001-realpath.c-Remove-trailing-slashes.patch \
-           file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
-           file://seccomp.patch \
-           file://0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch \
-           file://0001-pseudo_ipc.h-Fix-enum-typedef.patch \
-           file://xattr_version.patch \
            "
 
-SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
+SRCREV = "b94fa2fc81cde25865ee223ca437d07377229a53"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

