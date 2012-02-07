Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvS-0004HU-9T
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206454"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:50 -0800
Message-Id: <f6056cf0e7c76f2f3df650b088ce84df41ec14ca.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/35] pseudo: Wrap renameat and opendir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 22:54:17 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo/opendir.patch  |   94 ++++++++
 meta/recipes-devtools/pseudo/pseudo/renameat.patch |  229 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.2.bb         |    6 +-
 3 files changed, 327 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.patch

diff --git a/meta/recipes-devtools/pseudo/pseudo/opendir.patch b/meta/recipes-devtools/pseudo/pseudo/opendir.patch
new file mode 100644
index 0000000..bc6cec8
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo/opendir.patch
@@ -0,0 +1,94 @@
+commit 162f2692c399b93311652201a940fdaf9c9e6924
+Author: Peter Seebach <peter.seebach@windriver.com>
+Date:   Thu Feb 2 11:45:42 2012 -0600
+
+    Make opendir/closedir stash and forget directory names.
+    
+    The dirfd(DIR *) interface allows you to get the fd for a DIR *,
+    meaning you can use it with openat(), meaning you can need its
+    path.  This causes a segfault.  Also gonna fix the base_path
+    code not to segfault in that case, but first fix the underlying
+    problem.
+
+Upstream-Status: Backport
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 4de488c..9625b38 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,7 @@
++2012-02-02:
++	* (seebs) stash dir name for DIR * from opendir using dirfd.
++	* (seebs) add closedir.
++
+ 2011-11-02:
+ 	* (seebs) Call this 1.2 because the UNLOAD change is moderately
+ 	  significant, and so's the clone change.
+diff --git a/ports/unix/guts/closedir.c b/ports/unix/guts/closedir.c
+new file mode 100644
+index 0000000..1085361
+--- /dev/null
++++ b/ports/unix/guts/closedir.c
+@@ -0,0 +1,20 @@
++/*
++ * Copyright (c) 2012 Wind River Systems; see
++ * guts/COPYRIGHT for information.
++ *
++ * static int
++ * wrap_closedir(DIR *dirp) {
++ *	int rc = -1;
++ */
++	if (!dirp) {
++		errno = EFAULT;
++		return -1;
++	}
++
++	int fd = dirfd(dirp);
++	pseudo_client_op(OP_CLOSE, 0, fd, -1, 0, 0);
++	rc = real_closedir(dirp);
++
++/*	return rc;
++ * }
++ */
+diff --git a/ports/unix/guts/opendir.c b/ports/unix/guts/opendir.c
+index 8eaa71f..e69717e 100644
+--- a/ports/unix/guts/opendir.c
++++ b/ports/unix/guts/opendir.c
+@@ -6,8 +6,25 @@
+  * wrap_opendir(const char *path) {
+  *	DIR * rc = NULL;
+  */
++ 	struct stat buf;
++	int save_errno;
+ 
+ 	rc = real_opendir(path);
++	if (rc) {
++		int fd;
++		save_errno = errno;
++		fd = dirfd(rc);
++		if (real_fstat(fd, &buf) == -1) {
++			pseudo_debug(1, "diropen (fd %d) succeeded, but fstat failed (%s).\n",
++				fd, strerror(errno));
++			pseudo_client_op_plain(OP_OPEN, PSA_READ, fd, -1, path, 0);
++		} else {
++			pseudo_client_op_plain(OP_OPEN, PSA_READ, fd, -1, path, &buf);
++		}
++
++
++		errno = save_errno;
++	}
+ 
+ /*	return rc;
+  * }
+diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
+index e06e404..32250c4 100644
+--- a/ports/unix/wrapfuncs.in
++++ b/ports/unix/wrapfuncs.in
+@@ -21,6 +21,7 @@ long pathconf(const char *path, int name);
+ char *realpath(const char *name, char *resolved_name); /* version="GLIBC_2.3" */
+ int remove(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
+ DIR *opendir(const char *path);
++int closedir(DIR *dirp);
+ char *tempnam(const char *template, const char *pfx);
+ char *tmpnam(char *s);
+ int truncate(const char *path, off_t length);
diff --git a/meta/recipes-devtools/pseudo/pseudo/renameat.patch b/meta/recipes-devtools/pseudo/pseudo/renameat.patch
new file mode 100644
index 0000000..a2b2cbc
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo/renameat.patch
@@ -0,0 +1,229 @@
+commit 795f2b44b7f692151556782f142a4a6e7d45d892
+Author: Peter Seebach <peter.seebach@windriver.com>
+Date:   Thu Feb 2 15:49:21 2012 -0600
+
+    Implement renameat()
+    
+    After three long years, someone tried to use this.  This was impossibly
+    hard back when pseudo was written, because there was only one dirfd
+    provided for.  Thing is, now, the canonicalization happens in wrapfuncs,
+    so a small tweak to makewrappers to recognize that oldpath should use
+    olddirfd if it exists is enough to get us fully canonicalized paths
+    when needed.
+    
+    Also fix the crash if base_path gets called with an fd for which we have
+    no path.
+
+Upstream-Status: Backport
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 9625b38..25bd463 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,6 +1,9 @@
+ 2012-02-02:
+ 	* (seebs) stash dir name for DIR * from opendir using dirfd.
+ 	* (seebs) add closedir.
++	* (seebs) add initial pass at renameat()
++	* (seebs) in base_path, don't try to strlen the result if
++	  fd_path() returns NULL.
+ 
+ 2011-11-02:
+ 	* (seebs) Call this 1.2 because the UNLOAD change is moderately
+diff --git a/makewrappers b/makewrappers
+index 20bbf2b..bf344d6 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -211,12 +211,13 @@ class Function:
+         self.flags = '0'
+         self.port = port
+         self.directory = ''
+-	self.version = 'NULL'
++        self.version = 'NULL'
+         # On Darwin, some functions are SECRETLY converted to foo$INODE64
+         # when called.  So we have to look those up for real_*
+         self.inode64 = None
+         self.real_func = None
+         self.paths_to_munge = []
++        self.dirfds = {}
+         self.hand_wrapped = None
+         # used for the copyright date when creating stub functions
+         self.date = datetime.date.today().year
+@@ -239,6 +240,7 @@ class Function:
+         # * If the arg has a name ending in 'path', we will canonicalize it.
+         # * If the arg is named 'dirfd' or 'flags', it becomes the default
+         #   values for the dirfd and flags arguments when canonicalizing.
++        # * If the name ends in dirfd, we do the same fancy stuff.
+         # * Note that the "comments" field (/* ... */ after the decl) can
+         #   override the dirfd/flags values.
+         self.args = ArgumentList(bits.group(2))
+@@ -246,7 +248,9 @@ class Function:
+             # ignore varargs, they never get these special treatments
+             if arg.vararg:
+                 pass
+-            elif arg.name == 'dirfd':
++            elif arg.name[-5:] == 'dirfd':
++                if len(arg.name) > 5:
++                    self.dirfds[arg.name[:-5]] = True
+                 self.dirfd = 'dirfd'
+             elif arg.name == 'flags':
+                 self.flags = 'flags'
+@@ -325,9 +329,13 @@ class Function:
+         """create/allocate canonical paths"""
+         alloc_paths = []
+         for path in self.paths_to_munge:
++            prefix = path[:-4]
++	    if not prefix in self.dirfds:
++                prefix = ''
++            print "for path %s: prefix <%s>" % ( path, prefix )
+             alloc_paths.append(
+-                "%s = pseudo_root_path(__func__, __LINE__, %s, %s, %s);" %
+-                (path, self.dirfd, path, self.flags))
++                "%s = pseudo_root_path(__func__, __LINE__, %s%s, %s, %s);" %
++                (path, prefix, self.dirfd, path, self.flags))
+         return "\n\t\t\t".join(alloc_paths)
+ 
+     def free_paths(self):
+diff --git a/ports/unix/guts/renameat.c b/ports/unix/guts/renameat.c
+index c8203b7..f13cd1e 100644
+--- a/ports/unix/guts/renameat.c
++++ b/ports/unix/guts/renameat.c
+@@ -1,15 +1,111 @@
+ /* 
+- * Copyright (c) 2008-2010 Wind River Systems; see
++ * Copyright (c) 2008-2012 Wind River Systems; see
+  * guts/COPYRIGHT for information.
+  *
+  * static int
+  * wrap_renameat(int olddirfd, const char *oldpath, int newdirfd, const char *newpath) {
+  *	int rc = -1;
+  */
++ 	pseudo_msg_t *msg;
++ 	struct stat oldbuf, newbuf;
++	int oldrc, newrc;
++	int save_errno;
++	int old_db_entry = 0;
+ 
+-	pseudo_diag("help! unimplemented renameat [%s -> %s].\n", oldpath, newpath);
++	pseudo_debug(2, "renameat: %d,%s->%d,%s\n",
++		olddirfd, oldpath ? oldpath : "<nil>",
++		newdirfd, newpath ? newpath : "<nil>");
++
++#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
++	if (olddirfd != AT_FDCWD || newdirfd != AT_FDCWD) {
++		errno = ENOSYS;
++		return -1;
++	}
++#endif
++
++	if (!oldpath || !newpath) {
++		errno = EFAULT;
++		return -1;
++	}
++
++	save_errno = errno;
++
++#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
++	newrc = real_lstat(newpath, &newbuf);
++	oldrc = real_lstat(oldpath, &oldbuf);
++#else
++	oldrc = real___fxstatat(_STAT_VER, olddirfd, oldpath, &oldbuf, AT_SYMLINK_NOFOLLOW);
++	newrc = real___fxstatat(_STAT_VER, newdirfd, newpath, &newbuf, AT_SYMLINK_NOFOLLOW);
++#endif
++
++	errno = save_errno;
++
++	/* newpath must be removed. */
++	/* as with unlink, we have to mark that the file may get deleted */
++	msg = pseudo_client_op_plain(OP_MAY_UNLINK, 0, -1, newdirfd, newpath, newrc ? NULL : &newbuf);
++	if (msg && msg->result == RESULT_SUCCEED)
++		old_db_entry = 1;
+ 	rc = real_renameat(olddirfd, oldpath, newdirfd, newpath);
++	save_errno = errno;
++	if (old_db_entry) {
++		if (rc == -1) {
++			/* since we failed, that wasn't really unlinked -- put
++			 * it back.
++			 */
++			pseudo_client_op_plain(OP_CANCEL_UNLINK, 0, -1, newdirfd, newpath, &newbuf);
++		} else {
++			/* confirm that the file was removed */
++			pseudo_client_op_plain(OP_DID_UNLINK, 0, -1, newdirfd, newpath, &newbuf);
++		}
++	}
++	if (rc == -1) {
++		/* and we're done. */
++		errno = save_errno;
++		return rc;
++	}
++	save_errno = errno;
++	/* nothing to do for a "rename" of a link to itself */
++	if (newrc != -1 && oldrc != -1 &&
++	    newbuf.st_dev == oldbuf.st_dev &&
++	    newbuf.st_ino == oldbuf.st_ino) {
++		return rc;
++        }
++
++	/* rename(3) is not mv(1).  rename(file, dir) fails; you must provide
++	 * the corrected path yourself.  You can rename over a directory only
++	 * if the source is a directory.  Symlinks are simply removed.
++	 *
++	 * If we got here, the real rename call succeeded.  That means newpath
++	 * has been unlinked and oldpath has been linked to it.
++	 *
++	 * There are a ton of special cases to error check.  I don't check
++	 * for any of them, because in every such case, the underlying rename
++	 * failed, and there is nothing to do.
++	 * The only tricky part is that, because we used to ignore symlinks,
++	 * we may have to rename or remove directory trees even though in
++	 * theory rename can never destroy a directory tree.
++	 */
++	if (!old_db_entry) {
++		/* create an entry under the old name, which will then be
++		 * renamed; this way, children would get renamed too, if there
++		 * were any.
++		 */
++		if (newrc == 0) {
++			if (newbuf.st_dev != oldbuf.st_dev) {
++				oldbuf.st_dev = newbuf.st_dev;
++				oldbuf.st_ino = newbuf.st_ino;
++			}
++		}
++		pseudo_debug(1, "creating new '%s' [%llu] to rename\n",
++			oldpath, (unsigned long long) oldbuf.st_ino);
++		pseudo_client_op_plain(OP_LINK, 0, -1, olddirfd, oldpath, &oldbuf);
++	}
++	/* special case: use 'fd' for olddirfd, because
++	 * we know it has no other meaning for RENAME
++	 */
++	pseudo_client_op_plain(OP_RENAME, 0, olddirfd, newdirfd, newpath, &oldbuf, oldpath);
+ 
++	errno = save_errno;
+ /*	return rc;
+  * }
+  */
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 48607c2..4a30420 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -988,6 +988,8 @@ base_path(int dirfd, const char *path, int leave_last) {
+ 		if (dirfd != -1 && dirfd != AT_FDCWD) {
+ 			if (dirfd >= 0) {
+ 				basepath = fd_path(dirfd);
++			}
++			if (basepath) {
+ 				baselen = strlen(basepath);
+ 			} else {
+ 				pseudo_diag("got *at() syscall for unknown directory, fd %d\n", dirfd);
+@@ -1128,7 +1130,10 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 	if (path) {
+ 		pseudo_debug(2, " %s", path);
+ 	}
+-	if (fd != -1) {
++	/* for OP_RENAME in renameat, "fd" is also used for the
++	 * second dirfd.
++	 */
++	if (fd != -1 && op != OP_RENAME) {
+ 		pseudo_debug(2, " [fd %d]", fd);
+ 	}
+ 	if (buf) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
index f2ebc22..04bcbce 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
@@ -1,10 +1,12 @@
 require pseudo.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://oe-config.patch \
-           file://static_sqlite.patch"
+           file://static_sqlite.patch \
+           file://opendir.patch \
+           file://renameat.patch"
 
 SRC_URI[md5sum] = "a2819084bab7e991f06626d02cf55048"
 SRC_URI[sha256sum] = "4749a22df687f44d24c26e97170d4781a1bd52d5ee092364a40877e4d96ff058"
-- 
1.7.6.5



