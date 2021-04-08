Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58.1617899115763207829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E8A2D6E
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Apr 2021 09:25:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB3443F73D
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Apr 2021 09:25:12 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo] client: strip trailing slashes when opening an ignored path
Date: Thu,  8 Apr 2021 17:25:09 +0100
Message-Id: <20210408162509.4016524-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The pseudo client path map stores paths that have been sanitised, but
in the ignored-path (PSEUDO_IGNORE_PATHS) codepath for open() calls this
sanitising wasn't performed so it is possible for paths that end with a
trailing slash to be entered.

This then subsequently interacts badly with path manipulation, resulting
in the situation where doing:

  fd =3D open("/some/path/")
  parent_fd =3D openat(fd, "../)

results in parent_fd actually pointing at /some/path still.

Solve this by ensuring that any trailing slashes are removed from the
path when adding to the map in the ignore short-circuit.

Also add a test case for this to ensure that it doesn't regress in the
future.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 Makefile.in         |  1 +
 pseudo_client.c     | 11 ++++++++-
 test/test-openat.c  | 55 +++++++++++++++++++++++++++++++++++++++++++++
 test/test-openat.sh |  7 ++++++
 4 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 test/test-openat.c
 create mode 100755 test/test-openat.sh

diff --git a/Makefile.in b/Makefile.in
index 6eff522..cf13010 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -76,6 +76,7 @@ all: $(LIBPSEUDO) $(PSEUDO) $(PSEUDODB) $(PSEUDOLOG) $(=
PSEUDO_PROFILE)
=20
 test: all | $(BIN) $(LIB) $(LOCALSTATE)
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-rename-fstat test/test-re=
name-fstat.c
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o test/test-openat test/test-openat.c
 	@./run_tests.sh -v
=20
 install-lib: $(LIBPSEUDO)
diff --git a/pseudo_client.c b/pseudo_client.c
index f846d54..579db33 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -1629,7 +1629,16 @@ pseudo_client_op(pseudo_op_t op, int access, int f=
d, int dirfd, const char *path
 	if (op !=3D OP_CHROOT && op !=3D OP_CHDIR && op !=3D OP_CLOSE && op !=3D=
 OP_DUP
 			&& pseudo_client_ignore_path_chroot(path, 0)) {
 		if (op =3D=3D OP_OPEN) {
-			pseudo_client_path(fd, path);
+			/* Sanitise the path to have no trailing slash as this is convention =
in the database */
+			char *stripped_path;
+			pathlen =3D strlen(path);
+			if (pathlen > 2 && (path[pathlen - 1]) =3D=3D '/') {
+				stripped_path =3D strndup(path, pathlen-1);
+				pseudo_client_path(fd, stripped_path);
+				free(stripped_path);
+			} else {
+				pseudo_client_path(fd, path);
+			}
 		}
 		/* reenable wrappers */
 		pseudo_magic();
diff --git a/test/test-openat.c b/test/test-openat.c
new file mode 100644
index 0000000..b710285
--- /dev/null
+++ b/test/test-openat.c
@@ -0,0 +1,55 @@
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <limits.h>
+#include <unistd.h>
+#include <string.h>
+
+char *path_of(int fd) {
+    ssize_t len;
+    char proc[PATH_MAX], real[PATH_MAX];
+    snprintf(proc, sizeof(proc), "/proc/self/fd/%d", fd);
+    len =3D readlink(proc, real, sizeof(real));
+    real[len] =3D '\0';
+    return strdup(real);
+}
+
+/*
+* Test that recusing up the tree with openat(fd, "../") handles slashes
+* correctly and doesn't end up opening the same directory instead of goi=
ng up a
+* level.
+*/
+int main () {
+    int fd, dir_fd;
+    struct stat st;
+    ino_t ino;
+    char *path;
+
+    fd =3D openat(AT_FDCWD, ".", O_DIRECTORY, 0);
+    fstat(fd, &st);
+    ino =3D st.st_ino;
+
+    while (1) {
+        path =3D path_of(fd);
+        //puts(path);
+
+        dir_fd =3D openat(fd, "../", O_DIRECTORY, 0);
+        fstat(dir_fd, &st);
+        if (st.st_ino =3D=3D ino) {
+            if (strcmp(path, "/") =3D=3D 0) {
+                //puts("Reached top of tree");
+                return 0;
+            } else {
+                //puts("Recursion failed!");
+                return 1;
+            }
+        }
+
+        free (path);
+        ino =3D st.st_ino;
+        fd =3D dir_fd;
+    }
+    return 0;
+}
diff --git a/test/test-openat.sh b/test/test-openat.sh
new file mode 100755
index 0000000..0455586
--- /dev/null
+++ b/test/test-openat.sh
@@ -0,0 +1,7 @@
+#! /bin/sh
+
+# Test with and without paths being ignored. The bug was with paths bein=
g ignored.
+
+./test/test-openat
+
+PSEUDO_IGNORE_PATHS=3D/ ./test/test-openat
--=20
2.25.1

