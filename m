Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U6uAg-0005vV-2F
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 03:40:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1H2O1CG027717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 18:24:01 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 16 Feb 2013 18:23:58 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 20:23:53 -0600
Message-ID: <1361067834-23267-3-git-send-email-peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
References: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] allow pseudo to force asynchronous behavior
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 02:40:24 -0000
X-List-Received-Date: Sun, 17 Feb 2013 02:40:24 -0000
X-List-Received-Date: Sun, 17 Feb 2013 02:40:24 -0000
Content-Type: text/plain

The openembedded build, at least with RPM or SMART, is heavily affected
by the cost of calling fsync or fdatasync on package databases all the
time. Gosh, wouldn't it be nice if we could suppress that without making
dozens of highly intrusive and risky changes into RPM, various database
packages, and so on?

Yes, yes it would. If only there were a program which could intercept
system calls and change their behavior!

Enter --enable-force-async. There are now wrappers for fsync, fdatasync,
and a few related functions. If --enable-force-async is set, these wrappers
instantly return 0, even if PSEUDO_DISABLED is set. And with any luck,
bitbake will now perform a bit better.

Credit for this insight goes to Richard Purdie. I've reimplemented
this to add the configure option, and make the fsync suppression work
even when PSEUDO_DISABLED is set.
---
 ChangeLog.txt                     |    5 +++++
 Makefile.in                       |    3 ++-
 configure                         |   19 +++++++++++++++++++
 guts/COPYRIGHT                    |    2 +-
 makewrappers                      |   13 ++++++++++++-
 ports/darwin/guts/open.c          |    5 ++++-
 ports/linux/guts/openat.c         |   21 ++++++++++++++++++++-
 ports/unix/guts/fdatasync.c       |   16 ++++++++++++++++
 ports/unix/guts/fsync.c           |   16 ++++++++++++++++
 ports/unix/guts/msync.c           |   16 ++++++++++++++++
 ports/unix/guts/sync.c            |   16 ++++++++++++++++
 ports/unix/guts/sync_file_range.c |   13 +++++++++++++
 ports/unix/guts/syncfs.c          |   13 +++++++++++++
 ports/unix/wrapfuncs.in           |    9 +++++++++
 templates/wrapfuncs.c             |    2 ++
 15 files changed, 164 insertions(+), 5 deletions(-)
 create mode 100644 ports/unix/guts/fdatasync.c
 create mode 100644 ports/unix/guts/fsync.c
 create mode 100644 ports/unix/guts/msync.c
 create mode 100644 ports/unix/guts/sync.c
 create mode 100644 ports/unix/guts/sync_file_range.c
 create mode 100644 ports/unix/guts/syncfs.c

diff --git a/ChangeLog.txt b/ChangeLog.txt
index ed9e5fa..3dbf183 100644
--- a/ChangeLog.txt
+++ b/ChangeLog.txt
@@ -1,3 +1,8 @@
+2013-02-16:
+	* (seebs) Add wrapper setting which automatically returns a fixed
+	  value from some wrappers. Add fixed-value wrappers for all the
+	  *sync() functions. These are all contingent on --enable-force-async.
+
 2013-02-15:
 	* (seebs) Add support for in-memory DB. This, plus upcoming
 	  fsync-related changes, are expected to be big enough to justify
diff --git a/Makefile.in b/Makefile.in
index 094deba..8046bda 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -24,6 +24,7 @@ SUFFIX=@SUFFIX@
 SQLITE=@SQLITE@
 SQLITE_LIB=@SQLITE_LIB@
 SQLITE_MEMORY=@SQLITE_MEMORY@
+FORCE_ASYNC=@FORCE_ASYNC@
 BITS=@BITS@
 ARCH_FLAGS=@ARCH_FLAGS@
 MARK64=@MARK64@
@@ -38,7 +39,7 @@ LOCALSTATEDIR=$(PREFIX)/$(LOCALSTATE)
 
 CFLAGS_BASE=-pipe -std=gnu99 -Wall -W -Wextra
 CFLAGS_CODE=-fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE $(ARCH_FLAGS)
-CFLAGS_DEFS=-DPSEUDO_PREFIX='"$(PREFIX)"' -DPSEUDO_SUFFIX='"$(SUFFIX)"' -DPSEUDO_BINDIR='"$(BIN)"' -DPSEUDO_LIBDIR='"$(LIB)"' -DPSEUDO_LOCALSTATEDIR='"$(LOCALSTATE)"' -DPSEUDO_VERSION='"$(VERSION)"' $(SQLITE_MEMORY)
+CFLAGS_DEFS=-DPSEUDO_PREFIX='"$(PREFIX)"' -DPSEUDO_SUFFIX='"$(SUFFIX)"' -DPSEUDO_BINDIR='"$(BIN)"' -DPSEUDO_LIBDIR='"$(LIB)"' -DPSEUDO_LOCALSTATEDIR='"$(LOCALSTATE)"' -DPSEUDO_VERSION='"$(VERSION)"' $(SQLITE_MEMORY) $(FORCE_ASYNC)
 CFLAGS_DEBUG=-O2 -g
 CFLAGS_SQL=-L$(SQLITE)/$(SQLITE_LIB) -I$(SQLITE)/include $(RPATH)
 CFLAGS_PSEUDO=$(CFLAGS_BASE) $(CFLAGS_CODE) $(CFLAGS_DEFS) \
diff --git a/configure b/configure
index 44bee74..d88a930 100755
--- a/configure
+++ b/configure
@@ -26,6 +26,7 @@ opt_bits=
 opt_sqlite=/usr
 opt_rpath=
 opt_memory=
+opt_async=
 
 compile_x86_32=-m32
 compile_x86_64=-m64
@@ -37,6 +38,7 @@ usage()
     echo >&2 "           [--libdir=...]"
     echo >&2 "           [--suffix=...]"
     echo >&2 "           [--enable-memory-db]"
+    echo >&2 "           [--enable-force-async]"
     echo >&2 "           [--with-sqlite=...]"
     echo >&2 "           [--with-sqlite-lib=...]"
     echo >&2 "           [--enable-static-sqlite]"
@@ -71,6 +73,12 @@ do
         sqlite_ldarg='$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a'
         use_maybe_rpath=false
         ;;
+    --enable-force-async=no | --disable-force-async)
+        opt_async=false
+        ;;
+    --enable-force-async=yes | --enable-force-async)
+        opt_async=true
+	;;
     --enable-memory-db=no)
         opt_memory=false
         ;;
@@ -178,6 +186,16 @@ if [ "${SQLITE3_VERSION}" -lt "03006000" ]; then
     exit 1
 fi
 
+if [ -z "$opt_async" ]; then
+    opt_async=false
+fi
+
+if $opt_async; then
+    FORCE_ASYNC="-DPSEUDO_FORCE_ASYNC"
+else
+    FORCE_ASYNC=""
+fi
+
 if [ -z "$opt_memory" ]; then
     if [ "${SQLITE3_VERSION}" -lt "03007000" ]; then
         echo "Disabling in-memory database by default (sqlite too old)."
@@ -211,6 +229,7 @@ sed -e '
   s,@SQLITE_LDARG@,'"$sqlite_ldarg"',g
   s,@SQLITE_LIB@,'"$opt_sqlite_lib"',g
   s,@SQLITE_MEMORY@,'"$SQLITE_MEMORY"',g
+  s,@FORCE_ASYNC@,'"$FORCE_ASYNC"',g
   s!@RPATH@!'"$opt_rpath"'!g
   s,@MARK64@,'"$opt_mark64"',g
   s,@ARCH@,'"$opt_arch"',g
diff --git a/guts/COPYRIGHT b/guts/COPYRIGHT
index c96e1b1..85c47c7 100644
--- a/guts/COPYRIGHT
+++ b/guts/COPYRIGHT
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2008-2010 Wind River Systems, Inc.
+ * Copyright (c) 2008-2013 Wind River Systems, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the Lesser GNU General Public License version 2.1 as
diff --git a/makewrappers b/makewrappers
index 168fd81..fb919b5 100755
--- a/makewrappers
+++ b/makewrappers
@@ -1,6 +1,6 @@
 #!/usr/bin/env python
 #
-# Copyright (c) 2008-2011 Wind River Systems, Inc.
+# Copyright (c) 2008-2011,2013 Wind River Systems, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the Lesser GNU General Public License version 2.1 as
@@ -219,6 +219,7 @@ class Function:
         self.paths_to_munge = []
         self.specific_dirfds = {}
         self.hand_wrapped = None
+        self.async_skip = None
         # used for the copyright date when creating stub functions
         self.date = datetime.date.today().year
     
@@ -300,6 +301,16 @@ class Function:
         else:
             return ""
 
+    def maybe_async_skip(self):
+        if self.async_skip:
+	    return """/* This function is not called if pseudo is configured --enable-force-async */
+#ifdef PSEUDO_FORCE_ASYNC
+	return %s;
+#endif
+""" % self.async_skip
+        else:
+	    return ""
+
     def comment(self):
         """declare self (in a comment)"""
         return self.decl(comment = True)
diff --git a/ports/darwin/guts/open.c b/ports/darwin/guts/open.c
index 1ed5882..c66cc15 100644
--- a/ports/darwin/guts/open.c
+++ b/ports/darwin/guts/open.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2011, 2012 Wind River Systems; see
+ * Copyright (c) 2011-2013 Wind River Systems; see
  * guts/COPYRIGHT for information.
  *
  * int open(const char *path, int flags, ... { int mode })
@@ -9,6 +9,9 @@
 	struct stat buf = { };
 	int existed = 1;
 	int save_errno;
+#ifdef PSEUDO_FORCE_ASYNCH
+        flags &= ~O_SYNC;
+#endif
 
 	/* if a creation has been requested, check whether file exists */
 	if (flags & O_CREAT) {
diff --git a/ports/linux/guts/openat.c b/ports/linux/guts/openat.c
index 14d6c2a..8460073 100644
--- a/ports/linux/guts/openat.c
+++ b/ports/linux/guts/openat.c
@@ -1,5 +1,5 @@
 /* 
- * Copyright (c) 2008-2010 Wind River Systems; see
+ * Copyright (c) 2008-2010, 2013 Wind River Systems; see
  * guts/COPYRIGHT for information.
  *
  * static int
@@ -16,6 +16,25 @@
 		return -1;
 	}
 #endif
+
+#ifdef PSEUDO_FORCE_ASYNCH
+        /* Yes, I'm aware that every Linux system I've seen has
+         * DSYNC and RSYNC being the same value as SYNC.
+         */
+
+        flags &= ~(O_SYNC
+#ifdef O_DIRECT
+                | O_DIRECT
+#endif
+#ifdef O_DSYNC
+                | O_DSYNC
+#endif
+#ifdef O_RSYNC
+                | O_RSYNC
+#endif
+        );
+#endif
+
 	/* if a creation has been requested, check whether file exists */
 	if (flags & O_CREAT) {
 		save_errno = errno;
diff --git a/ports/unix/guts/fdatasync.c b/ports/unix/guts/fdatasync.c
new file mode 100644
index 0000000..4aa77a8
--- /dev/null
+++ b/ports/unix/guts/fdatasync.c
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2013 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * int fdatasync(int fd)
+ *	int rc = -1;
+ */
+
+	/* note: wrapper will never call this if PSEUDO_FORCE_ASYNC
+	 * is defined.
+	 */
+	rc = real_fdatasync(fd);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/guts/fsync.c b/ports/unix/guts/fsync.c
new file mode 100644
index 0000000..6c87a56
--- /dev/null
+++ b/ports/unix/guts/fsync.c
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2013 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * int fsync(int fd)
+ *	int rc = -1;
+ */
+
+	/* note: wrapper will never call this if PSEUDO_FORCE_ASYNC
+	 * is defined.
+	 */
+	rc = real_fsync(fd);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/guts/msync.c b/ports/unix/guts/msync.c
new file mode 100644
index 0000000..fbc5e26
--- /dev/null
+++ b/ports/unix/guts/msync.c
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2013 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * int msync(void *addr, size_t length, int flags)
+ *	int rc = -1;
+ */
+
+	/* note: wrapper will never call this if PSEUDO_FORCE_ASYNC
+	 * is defined.
+	 */
+	rc = real_msync(addr, length, flags);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/guts/sync.c b/ports/unix/guts/sync.c
new file mode 100644
index 0000000..c5d9554
--- /dev/null
+++ b/ports/unix/guts/sync.c
@@ -0,0 +1,16 @@
+/*
+ * Copyright (c) 2013 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * void sync(void)
+ *	
+ */
+
+	/* note: wrapper will never call this if PSEUDO_FORCE_ASYNC
+	 * is defined.
+	 */
+	(void) real_sync();
+
+/*	return;
+ * }
+ */
diff --git a/ports/unix/guts/sync_file_range.c b/ports/unix/guts/sync_file_range.c
new file mode 100644
index 0000000..03cfc6c
--- /dev/null
+++ b/ports/unix/guts/sync_file_range.c
@@ -0,0 +1,13 @@
+/*
+ * Copyright (c) 2013 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags)
+ *	int rc = -1;
+ */
+
+	rc = real_sync_file_range(fd, offset, nbytes, flags);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/guts/syncfs.c b/ports/unix/guts/syncfs.c
new file mode 100644
index 0000000..2c9a685
--- /dev/null
+++ b/ports/unix/guts/syncfs.c
@@ -0,0 +1,13 @@
+/*
+ * Copyright (c) 2013 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * int syncfs(int fd)
+ *	int rc = -1;
+ */
+
+	rc = real_syncfs(fd);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
index 7e205f0..a0f191c 100644
--- a/ports/unix/wrapfuncs.in
+++ b/ports/unix/wrapfuncs.in
@@ -58,3 +58,12 @@ ssize_t readlink(const char *path, char *buf, size_t bufsiz); /* flags=AT_SYMLIN
 ssize_t readlinkat(int dirfd, const char *path, char *buf, size_t bufsiz); /* flags=AT_SYMLINK_NOFOLLOW */
 int system(const char *command);
 FILE *popen(const char *command, const char *mode); /* hand_wrapped=1 */
+# Based on experiments by Richard Purdie: Allow pseudo to eliminate
+# sync-type operations globally, mostly relevant for performance reasons
+# during filesystem assembly.
+int fsync(int fd); /* async_skip=0 */
+int fdatasync(int fd); /* async_skip=0 */
+void sync(void); /* async_skip=0 */
+int syncfs(int fd); /* async_skip=0 */
+int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags); /* async_skip=0 */
+int msync(void *addr, size_t length, int flags); /* async_skip=0 */
diff --git a/templates/wrapfuncs.c b/templates/wrapfuncs.c
index 0d0fb52..86fd557 100644
--- a/templates/wrapfuncs.c
+++ b/templates/wrapfuncs.c
@@ -23,6 +23,8 @@ ${name}(${decl_args}) {
 	${variadic_decl}
 	${rc_decl}
 
+${maybe_async_skip}
+
 	if (!pseudo_check_wrappers() || !real_$name) {
 		/* rc was initialized to the "failure" value */
 		pseudo_enosys("${name}");
-- 
1.7.9.5



