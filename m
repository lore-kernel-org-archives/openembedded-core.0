Received: from ford.bithub.de (ford.bithub.de [159.69.22.172])
 by mx.groups.io with SMTP id smtpd.web10.1438.1621279513466992702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 12:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@bithub.de header.s=ford header.b=QYMtWsDo;
 spf=pass (domain: bithub.de, ip: 159.69.22.172, mailfrom: philip@bithub.de)
Received: from t420.fritz.box (x4db3605d.dyn.telefonica.de [77.179.96.93])
	by ford.bithub.de (Postfix) with ESMTPSA id B1F111FC83;
	Mon, 17 May 2021 21:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bithub.de; s=ford;
	t=1621279511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=geZNxN+CpRtg6b2ltFrSSY3g0JSWJxycNzrhTZUnG0k=;
	b=QYMtWsDoez0R41FeRRFJ/iWpe9yA2vqCOLL3p89fGDrl++Jbmdi8HWyTkSEdXk2eg4i97N
	ELx+dziL9zAN6q40enY2byguuToCZZjMz7EAOMvcUPRytYT0piNWFuwNINc80CevSd0isc
	uuZUd7diWEx8uq0KO8tBW52lqWkSslquymA8jnsqaNmn5BEJVxG5hg8plZdhjTCOMQmwIc
	5LxvP9jpSt+BP9Izk9n9zoZTVkUldPUL52jB+nacsIgVbcvzO5/7hwldYsZFo8yg6hhzem
	U5w+oECF/npC97bDKLEQenu+8psNFsGjAH6rk/oOHXKGTnvQOT//uspD5IaraA==
From: "Philip Lorenz" <philip@bithub.de>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip@bithub.de>
Subject: [pseudo][PATCH] makewrappers: Handle parameters marked as nonnull
Date: Mon, 17 May 2021 21:25:06 +0200
Message-Id: <20210517192506.48088-1-philip@bithub.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable

Commit 60e25a36558f1f07dcce1a044fe976b475bec42b started dereferencing
the "path" parameter which for some functions is annotated with the
"nonnull" attribute. While the commit explicitly checks for NULL
pointers before dereferencing it, GCC (at optimization level 1 and
above) removes the check due to the "nonnull" attribute being set for
some parameters in the glibc headers (e.g. statx()).

However, the statx() man page explicitly allows calling with NULL
pointers (in which case the EFAULT is returned) and this behaviour is
used in the wild (e.g. in Rust) to determine whether the statx() system
call is supported.

Disabling the optimization is not possible ([1]) so prevent the compiler
optimization by referencing the parameter in a noop inline assembly
instruction instead.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100404

Signed-off-by: Philip Lorenz <philip@bithub.de>
---
 Makefile.in        |  2 ++
 makewrappers       |  6 +++++-
 test/test-fstat.c  | 29 +++++++++++++++++++++++++++++
 test/test-fstat.sh |  8 ++++++++
 4 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 test/test-fstat.c
 create mode 100755 test/test-fstat.sh

diff --git a/Makefile.in b/Makefile.in
index cf13010..10441ef 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -77,6 +77,8 @@ all: $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) $(=
PSEUDO_PROFILE)
 test: all | $(BIN) $(LIB) $(LOCALSTATE)
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-rename-fstat test/test-re=
name-fstat.c
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-statx test/test-statx.c
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-fstat test/test-fstat.c
 	@./run_tests.sh -v
=20
 install-lib: $(LIBPSEUDO)
diff --git a/makewrappers b/makewrappers
index 818834e..cf5ad60 100755
--- a/makewrappers
+++ b/makewrappers
@@ -375,8 +375,12 @@ class Function:
             if self.dirfd !=3D "AT_FDCWD" and "flags" in self.flags \
                     and "AT_SYMLINK_NOFOLLOW" in self.flags:
                 fix_paths.append(
+                    # Reference the variable inside a noop inline-asm to=
 stop
+                    # the compiler from eliminating the null pointer che=
ck
+                    # on parameters marked nonnull
+                    "asm(\"\" : \"+r\"(%s));"
                     "if (%s && !*%s && (flags & AT_EMPTY_PATH))\n"
-                    "\t\t\tflags |=3D AT_SYMLINK_NOFOLLOW;" % (path, pat=
h))
+                    "\t\t\tflags |=3D AT_SYMLINK_NOFOLLOW;" % (path, pat=
h, path))
             fix_paths.append(
                 "%s =3D pseudo_root_path(__func__, __LINE__, %s%s, %s, %=
s);" %
                 (path, prefix, self.dirfd, path, self.flags))
diff --git a/test/test-fstat.c b/test/test-fstat.c
new file mode 100644
index 0000000..78f7013
--- /dev/null
+++ b/test/test-fstat.c
@@ -0,0 +1,29 @@
+/*
+ * Test that stat'ing a file descriptor of a symlink does not dereferenc=
e the symlink
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ */
+#define _GNU_SOURCE
+
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include <stdio.h>
+
+int main(void) {
+    struct stat buf;
+    int fd =3D open("symlink", O_NOFOLLOW | O_PATH);
+    if (fd =3D=3D -1) {
+        perror("open symlink");
+        return 1;
+    }
+    if (fstatat(fd, "", &buf, AT_EMPTY_PATH) =3D=3D -1) {
+        perror("stat symlink");
+        return 1;
+    }
+    if (S_ISLNK(buf.st_mode) !=3D 1) {
+        fprintf(stderr, "path is not a symlink\n");
+        return 1;
+    }
+    return 0;
+}
diff --git a/test/test-fstat.sh b/test/test-fstat.sh
new file mode 100755
index 0000000..88eab8b
--- /dev/null
+++ b/test/test-fstat.sh
@@ -0,0 +1,8 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+ln -s . symlink
+trap "rm symlink" 0
+./test/test-fstat
--=20
2.31.1

