Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.13079.1611672151834007194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ckZ7dCM7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id o16so1940114pgg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LZ3E5ooj3uu9pWubFuOVPvNrJvnOvH1UOPntAgZjeII=;
        b=ckZ7dCM7PeRW1/GQBybkPeUcLVwp+w1mTzTPRiITua3QwQsOMVEF9qLnXdVRHpDStK
         o/zeygIrpg9S4sFlL9cg4lYLdl7T81jMxmbY+F6ct01j0TuJJHwox7cECOH/Hhmsef6q
         RkaYRAJhxBjOdHa1H95pJXEqW2PEtYk2d4+WUSEQ/coOy/o0dU3qJ/4PDc4HGUYAbf3i
         rn7/2QpbEA0/HwS8UZ8uFu7KUIBi8uGWH0Kpzk8FqCK/NxtAYkZ6Kib7NhOV3JeDvzL2
         CU7PI4vYTY7IDqy/5gFVHQr8pJcLEr3VpSKb6wXiEOVwnE/D54YM6AnXvzLKYLlZcQKw
         4dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LZ3E5ooj3uu9pWubFuOVPvNrJvnOvH1UOPntAgZjeII=;
        b=UoMCQ9o9cRmMO2M3cGAeMP8nOonFQjEw3r1dv+Yhbh+WRhq7knBe0LwhEQgbWsjYNQ
         Zc6qgPV5l7Hl5FCWIaDDDaap3yClEICsv7ddNECmKoNKHGXVIX1NIm99zCj3R7uZRVXD
         4hh7j/vTaG0rxAbFyYL+UzZ4qokLUBPzgdaLWFVY4kNXJYMutiwRS/nhcv9peK6MHCZL
         tDPdKQRF/OIKn387UjvbOS1r997fHCRcSjG4FdYMunZKx7JgPfqV0ukrI7dOsc4YkZX4
         woEAivG3KC1VlBj+qn0oSiwm874zsb/h64nBiZBX9fEUbsv89BB1jD/8LbfuOEnKMOP7
         bRLw==
X-Gm-Message-State: AOAM530LSQgaITNs+rxRl8kL6pUq4rSNC6RQfxSxA2EzM6pf8mryNKUQ
	0UjSjHFSe6KdQN8OJAIQ88btMwNGQtyx7Vaij6M=
X-Google-Smtp-Source: ABdhPJwSS5qJ5KgSQGcqwxxqhPwYf31DT2vqW7bJ7SHgkbUspcaltlWQhC3lj1HxGNL/K1W6K5lmmA==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr5886652pgt.242.1611672150580;
        Tue, 26 Jan 2021 06:42:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 06/46] pseudo: Add support for ignoring paths from the pseudo DB
Date: Tue, 26 Jan 2021 04:41:17 -1000
Message-Id: <483c95943a0699243a2f8b17fab39fac317e0466.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add PSEUDO_IGNORE_PATHS, a comma separated list of path prefixes, where
any files underneath are not handled by pseudo. This allows files to
be left out of the pseudo datanase where we know we don't need the
fake root emulation. This is particularly useful if we know these files
can be deleted outside of pseudo context.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8defb687a2c0ffac232c4d0d63a590871c453a2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/add_ignore_paths.patch       | 298 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 2 files changed, 299 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/add_ignore_paths.patch

diff --git a/meta/recipes-devtools/pseudo/files/add_ignore_paths.patch b/meta/recipes-devtools/pseudo/files/add_ignore_paths.patch
new file mode 100644
index 0000000000..eddfdb8674
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/add_ignore_paths.patch
@@ -0,0 +1,298 @@
+Currently, pseudo considers any path accessed whist its running to be
+a valid entry to track in its database. The way OpenEmbedded uses pseudo,
+there are paths we care about accesses to from a pseudo perspective and paths
+which we simply don't care about.
+
+This patch adds a PSEUDO_IGNORE_PATHS environment variable which is a comma
+separated list of path prefixes to ignore accesses to.
+
+To do this, we add some functions which can check a path argument or a file
+descriptor argument and use these in the pseudo wrappers where path or fd
+arguments are present. Where paths are being ignored, we skip straight to
+the underlying real function.
+
+Psuedo needs to keep track of the open fd mappings to files so we still need
+to allow those cases into the pseudo_op function. Specficially this means
+OP_CLOSE, OP_OPEN, OP_DUP and OP_CHDIR.
+
+Apart from OP_OPEN which could call the server, the other operations are client
+side only so passed through. We 'tag' the functions using these operations so
+that the path ignore code isn't triggered. For OP_OPEN we exit early and skip
+the server op. We also have a catch all in client_op to ensure any operatings
+we didn't manage to skip early still get skipped correctly.
+
+OP_CHROOT is a special case. Where ignored path prefixes are used as a chroot,
+for the lifetime of the chroot, the path is effectively dropped from the
+PSEUDO_IGNORE_PATHS list. Whilst slightly counter intuaitive, this turned out
+to be the most effective way to do things due to commands like useradd and
+their use of chroots.
+
+For sqlite3 and appropriate path filtering in OE, this took the database from
+45,000 entries to about 180. For dbus this was 88,000 down to 760. Given the
+number of client to server trips these numbers of paths involves, the win
+is seemingly worthwhile.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -1482,6 +1482,43 @@ base_path(int dirfd, const char *path, i
+ 	return newpath;
+ }
+ 
++int pseudo_client_ignore_fd(int fd) {
++	if (fd >= 0 && fd <= nfds)
++		return pseudo_client_ignore_path(fd_path(fd));
++	return 0;
++}
++
++int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
++	char *env;
++	if (path) {
++		if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
++			return 0;
++		env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
++		if (env) {
++			char *p = env;
++        	        while (*p) {
++				char *next = strchr(p, ',');
++				if (!next)
++				    next = strchr(p, '\0');
++				if ((next - p) && !strncmp(path, p, next - p)) {
++		 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
++					return 1;
++				}
++				if (next && *next != '\0')
++					p = next+1;
++				else
++					break;
++			}
++			free(env);
++		}
++	}
++	return 0;
++}
++
++int pseudo_client_ignore_path(const char *path) {
++	return pseudo_client_ignore_path_chroot(path, 1);
++}
++
+ pseudo_msg_t *
+ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...) {
+ 	pseudo_msg_t *result = 0;
+@@ -1522,6 +1559,16 @@ pseudo_client_op(pseudo_op_t op, int acc
+ 		}
+ 	}
+ 
++	if (op != OP_CHROOT && op != OP_CHDIR && op != OP_CLOSE && op != OP_DUP
++			&& pseudo_client_ignore_path_chroot(path, 0)) {
++		if (op == OP_OPEN) {
++			pseudo_client_path(fd, path);
++		}
++		/* reenable wrappers */
++		pseudo_magic();
++		return result;
++	}
++
+ #ifdef PSEUDO_XATTRDB
+ 	if (buf) {
+ 		struct stat64 bufcopy = *buf;
+Index: git/pseudo_util.c
+===================================================================
+--- git.orig/pseudo_util.c
++++ git/pseudo_util.c
+@@ -43,6 +43,7 @@ static struct pseudo_variables pseudo_en
+ 	{ "PSEUDO_BINDIR", 13, NULL },
+ 	{ "PSEUDO_LIBDIR", 13, NULL },
+ 	{ "PSEUDO_LOCALSTATEDIR", 20, NULL },
++	{ "PSEUDO_IGNORE_PATHS", 19, NULL },
+ 	{ "PSEUDO_PASSWD", 13, NULL },
+ 	{ "PSEUDO_CHROOT", 13, NULL },
+ 	{ "PSEUDO_UIDS", 11, NULL },
+Index: git/pseudo_client.h
+===================================================================
+--- git.orig/pseudo_client.h
++++ git/pseudo_client.h
+@@ -7,6 +7,8 @@
+  *
+  */
+ extern pseudo_msg_t *pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path, const PSEUDO_STATBUF *buf, ...);
++extern int pseudo_client_ignore_path(const char *path);
++extern int pseudo_client_ignore_fd(int fd);
+ #if PSEUDO_STATBUF_64
+ #define base_lstat real_lstat64
+ #define base_fstat real_fstat64
+Index: git/ports/linux/wrapfuncs.in
+===================================================================
+--- git.orig/ports/linux/wrapfuncs.in
++++ git/ports/linux/wrapfuncs.in
+@@ -1,23 +1,23 @@
+-int open(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
++int open(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
+ char *get_current_dir_name(void);
+ int __xstat(int ver, const char *path, struct stat *buf);
+ int __lxstat(int ver, const char *path, struct stat *buf); /* flags=AT_SYMLINK_NOFOLLOW */
+ int __fxstat(int ver, int fd, struct stat *buf);
+ int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
+ int __fxstatat(int ver, int dirfd, const char *path, struct stat *buf, int flags);
+-int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
+-int __openat_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW */
++int openat(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
++int __openat_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
+ int mknod(const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknod */
+ int mknodat(int dirfd, const char *path, mode_t mode, dev_t dev); /* real_func=pseudo_mknodat */
+ int __xmknod(int ver, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
+ int __xmknodat(int ver, int dirfd, const char *path, mode_t mode, dev_t *dev); /* flags=AT_SYMLINK_NOFOLLOW */
+-int fcntl(int fd, int cmd, ...{struct flock *lock});
++int fcntl(int fd, int cmd, ...{struct flock *lock});  /* noignore_path=1 */
+ # just so we know the inums of symlinks
+ char *canonicalize_file_name(const char *filename);
+ int eaccess(const char *path, int mode);
+-int open64(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
+-int openat64(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW */
+-int __openat64_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW */
++int open64(const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
++int openat64(int dirfd, const char *path, int flags, ...{mode_t mode}); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
++int __openat64_2(int dirfd, const char *path, int flags); /* flags=flags&O_NOFOLLOW, noignore_path=1 */
+ int creat64(const char *path, mode_t mode);
+ int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
+ int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
+@@ -29,9 +29,9 @@ int __xstat64(int ver, const char *path,
+ int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
+ int __fxstat64(int ver, int fd, struct stat64 *buf);
+ int __fxstatat64(int ver, int dirfd, const char *path, struct stat64 *buf, int flags);
+-FILE *fopen64(const char *path, const char *mode);
+-int nftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int, struct FTW *), int nopenfd, int flag);
+-FILE *freopen64(const char *path, const char *mode, FILE *stream);
++FILE *fopen64(const char *path, const char *mode); /* noignore_path=1 */
++int nftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int, struct FTW *), int nopenfd, int flag); /* noignore_path=1 */
++FILE *freopen64(const char *path, const char *mode, FILE *stream);  /* noignore_path=1 */
+ int ftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int), int nopenfd);
+ int glob64(const char *pattern, int flags, int (*errfunc)(const char *, int), glob64_t *pglob);
+ int scandir64(const char *path, struct dirent64 ***namelist, int (*filter)(const struct dirent64 *), int (*compar)());
+Index: git/templates/wrapfuncs.c
+===================================================================
+--- git.orig/templates/wrapfuncs.c
++++ git/templates/wrapfuncs.c
+@@ -60,9 +60,15 @@ ${maybe_async_skip}
+ 		${rc_assign} (*real_${name})(${call_args});
+ 	} else {
+ 		${fix_paths}
+-		/* exec*() use this to restore the sig mask */
+-		pseudo_saved_sigmask = saved;
+-		${rc_assign} wrap_$name(${call_args});
++		if (${ignore_paths}) {
++			/* call the real syscall */
++			pseudo_debug(PDBGF_SYSCALL, "${name} ignored path, calling real syscall.\n");
++			${rc_assign} (*real_${name})(${call_args});
++		} else {
++			/* exec*() use this to restore the sig mask */
++			pseudo_saved_sigmask = saved;
++			${rc_assign} wrap_$name(${call_args});
++		}
+ 	}
+ 	${variadic_end}
+ 	save_errno = errno;
+Index: git/ports/unix/wrapfuncs.in
+===================================================================
+--- git.orig/ports/unix/wrapfuncs.in
++++ git/ports/unix/wrapfuncs.in
+@@ -1,14 +1,14 @@
+ int creat(const char *path, mode_t mode);
+ char *getcwd(char *buf, size_t size);
+ char *getwd(char *buf);
+-int close(int fd);
++int close(int fd);  /* noignore_path=1 */
+ int fchmod(int fd, mode_t mode);
+ int fchown(int fd, uid_t owner, gid_t group);
+ int lchown(const char *path, uid_t owner, gid_t group); /* flags=AT_SYMLINK_NOFOLLOW */
+-int dup2(int oldfd, int newfd);
+-int dup(int fd);
+-int chdir(const char *path);
+-int fchdir(int dirfd);
++int dup2(int oldfd, int newfd); /* noignore_path=1 */
++int dup(int fd); /* noignore_path=1 */
++int chdir(const char *path); /* noignore_path=1 */
++int fchdir(int dirfd); /* noignore_path=1 */
+ int access(const char *path, int mode);
+ FTS *fts_open(char * const *path_argv, int options, int (*compar)(const FTSENT **, const FTSENT **)); /* inode64=1 */
+ int ftw(const char *path, int (*fn)(const char *, const struct stat *, int), int nopenfd);
+@@ -20,18 +20,18 @@ char *mktemp(char *template);
+ long pathconf(const char *path, int name);
+ char *realpath(const char *name, char *resolved_name); /* version="GLIBC_2.3" */
+ int remove(const char *path); /* flags=AT_SYMLINK_NOFOLLOW */
+-DIR *opendir(const char *path);
+-int closedir(DIR *dirp);
++DIR *opendir(const char *path); /* noignore_path=1 */
++int closedir(DIR *dirp); /* noignore_path=1 */
+ char *tempnam(const char *template, const char *pfx);
+ char *tmpnam(char *s);
+ int truncate(const char *path, off_t length);
+ int utime(const char *path, const struct utimbuf *buf);
+ int utimes(const char *path, const struct timeval *times);
+ # needed because libc stdio does horrible things with inline asm syscalls
+-FILE *fopen(const char *path, const char *mode);
+-int fclose(FILE *fp);
+-FILE *freopen(const char *path, const char *mode, FILE *stream);
+-int chroot(const char *path);
++FILE *fopen(const char *path, const char *mode); /* noignore_path=1 */
++int fclose(FILE *fp);  /* noignore_path=1 */
++FILE *freopen(const char *path, const char *mode, FILE *stream); /* noignore_path=1 */
++int chroot(const char *path); /* noignore_path=1 */
+ int acct(const char *path);
+ int chmod(const char *path, mode_t mode);
+ int chown(const char *path, uid_t owner, gid_t group);
+Index: git/makewrappers
+===================================================================
+--- git.orig/makewrappers
++++ git/makewrappers
+@@ -228,6 +228,8 @@ class Function:
+         self.real_func = None
+         self.paths_to_munge = []
+         self.specific_dirfds = {}
++        self.fd_arg = False
++        self.noignore_path = False
+         self.hand_wrapped = None
+         self.async_skip = None
+         # used for the copyright date when creating stub functions
+@@ -267,6 +269,11 @@ class Function:
+                 self.flags = '(flags & AT_SYMLINK_NOFOLLOW)'
+             elif arg.name.endswith('path'):
+                 self.paths_to_munge.append(arg.name)
++            elif arg.name == 'fd':
++                self.fd_arg = "fd"
++            elif arg.name == 'filedes':
++                self.fd_arg = "filedes"
++
+     
+         # pick default values
+         if self.type == 'void':
+@@ -361,6 +368,25 @@ class Function:
+                 (path, prefix, self.dirfd, path, self.flags))
+         return "\n\t\t".join(fix_paths)
+ 
++    def ignore_paths(self):
++        if self.noignore_path:
++            return "0"
++
++        mainpath = None
++        if "oldpath" in self.paths_to_munge:
++            mainpath = "oldpath"
++        elif "newpath" in self.paths_to_munge:
++            mainpath = "newpath"
++        elif "path" in self.paths_to_munge:
++            mainpath = "path"
++
++        if mainpath:
++            return "pseudo_client_ignore_path(%s)" % mainpath
++        if self.fd_arg:
++            return "pseudo_client_ignore_fd(%s)" % self.fd_arg
++
++        return "0"
++
+     def real_predecl(self):
+         if self.real_func:
+             return self.decl().replace(self.name, self.real_func, 1) + ";"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7eb72f0eab..57c32d0cfc 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://delete_mismatches.patch \
+           file://add_ignore_paths.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

