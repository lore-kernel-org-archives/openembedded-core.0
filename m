Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2B460169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 22:14:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2014 14:04:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,510,1413270000"; d="scan'208";a="618197678"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO [10.255.13.114])
	([10.255.13.114])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2014 14:06:02 -0800
Message-ID: <547F8949.904@linux.intel.com>
Date: Wed, 03 Dec 2014 14:06:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
	<8785120ab079655700a9f551e0cb80bee72ed563.1416590209.git.sgw@linux.intel.com>
In-Reply-To: <8785120ab079655700a9f551e0cb80bee72ed563.1416590209.git.sgw@linux.intel.com>
Subject: Re: [PATCH 6/7] pseudo: remove older version and patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Dec 2014 22:14:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Armin

This is also ready for backport to dizzy, as it's been merged in master

The resolvconf and lzo (still pending) should be back ported as well.

Thanks

Sau!

On 11/21/2014 09:20 AM, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../0001-pseudo_has_unload-add-function.patch      | 190 ---------------
>   .../pseudo-1.5.1-install-directory-mode.patch      |  18 --
>   .../pseudo/files/pseudo-fchmodat-permissions.patch | 264 ---------------------
>   .../pseudo/files/shutdownping.patch                |  53 -----
>   meta/recipes-devtools/pseudo/files/symver.patch    |  26 --
>   meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |  20 --
>   6 files changed, 571 deletions(-)
>   delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/files/shutdownping.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/files/symver.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
> deleted file mode 100644
> index b5c81c9..0000000
> --- a/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
> +++ /dev/null
> @@ -1,190 +0,0 @@
> -From be97cb958f2934fa398fc8e344b25b84ebd4e90c Mon Sep 17 00:00:00 2001
> -From: "Peter A. Bigot" <pab@pabigot.com>
> -Date: Sun, 25 Aug 2013 19:22:09 -0500
> -Subject: [PATCH] pseudo_has_unload: add function
> -
> -Various wrappers checked for a non-null pseudo_get_value("PSEUDO_UNLOAD") to
> -determine whether the environment should include the pseudo variables.  None
> -of those checks freed the returned value when it was not null.  The new
> -check function does.
> -
> -The new check function also sees whether PSEUDO_UNLOAD was defined in the
> -environment that should be used in the wrapped system call.  This allows
> -pkg_postinst scripts to strip out the LD_PRELOAD setting, for example before
> -invoking qemu to execute commands in an environment that does not have
> -libpseudo.so.
> -
> -[YOCTO #4843]
> -
> -Upstream-Status: Pending
> -Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ----
> - ports/common/guts/execv.c              |    2 +-
> - ports/common/guts/execve.c             |    2 +-
> - ports/common/guts/execvp.c             |    2 +-
> - ports/common/guts/fork.c               |    2 +-
> - ports/linux/newclone/pseudo_wrappers.c |    2 +-
> - ports/linux/oldclone/pseudo_wrappers.c |    2 +-
> - ports/unix/guts/popen.c                |    2 +-
> - ports/unix/guts/system.c               |    2 +-
> - pseudo.h                               |    1 +
> - pseudo_util.c                          |   27 +++++++++++++++++++++++++++
> - 10 files changed, 36 insertions(+), 8 deletions(-)
> -
> -diff --git a/ports/common/guts/execv.c b/ports/common/guts/execv.c
> -index 763e1f9..3e1f820 100644
> ---- a/ports/common/guts/execv.c
> -+++ b/ports/common/guts/execv.c
> -@@ -19,7 +19,7 @@
> - 	}
> -
> - 	pseudo_setupenv();
> --	if (pseudo_get_value("PSEUDO_UNLOAD"))
> -+	if (pseudo_has_unload(NULL))
> - 		pseudo_dropenv();
> -
> - 	/* if exec() fails, we may end up taking signals unexpectedly...
> -diff --git a/ports/common/guts/execve.c b/ports/common/guts/execve.c
> -index a003657..ff6a44e 100644
> ---- a/ports/common/guts/execve.c
> -+++ b/ports/common/guts/execve.c
> -@@ -20,7 +20,7 @@
> -         }
> -
> - 	new_environ = pseudo_setupenvp(envp);
> --	if (pseudo_get_value("PSEUDO_UNLOAD"))
> -+	if (pseudo_has_unload(new_environ))
> - 		new_environ = pseudo_dropenvp(new_environ);
> -
> - 	/* if exec() fails, we may end up taking signals unexpectedly...
> -diff --git a/ports/common/guts/execvp.c b/ports/common/guts/execvp.c
> -index 5e75be7..04253c3 100644
> ---- a/ports/common/guts/execvp.c
> -+++ b/ports/common/guts/execvp.c
> -@@ -20,7 +20,7 @@
> -         }
> -
> - 	pseudo_setupenv();
> --	if (pseudo_get_value("PSEUDO_UNLOAD"))
> -+	if (pseudo_has_unload(NULL))
> - 		pseudo_dropenv();
> -
> - 	/* if exec() fails, we may end up taking signals unexpectedly...
> -diff --git a/ports/common/guts/fork.c b/ports/common/guts/fork.c
> -index df8abd7..bebe3b0 100644
> ---- a/ports/common/guts/fork.c
> -+++ b/ports/common/guts/fork.c
> -@@ -12,7 +12,7 @@
> - 	 */
> - 	if (rc == 0) {
> - 		pseudo_setupenv();
> --		if (!pseudo_get_value("PSEUDO_UNLOAD")) {
> -+		if (!pseudo_has_unload(NULL)) {
> - 			pseudo_reinit_libpseudo();
> - 		} else {
> - 			pseudo_dropenv();
> -diff --git a/ports/linux/newclone/pseudo_wrappers.c b/ports/linux/newclone/pseudo_wrappers.c
> -index 9dbac42..257e8bb 100644
> ---- a/ports/linux/newclone/pseudo_wrappers.c
> -+++ b/ports/linux/newclone/pseudo_wrappers.c
> -@@ -28,7 +28,7 @@ int wrap_clone_child(void *args) {
> -
> - 	if (!(flags & CLONE_VM)) {
> - 		pseudo_setupenv();
> --		if (!pseudo_get_value("PSEUDO_UNLOAD")) {
> -+		if (!pseudo_has_unload(NULL)) {
> - 			pseudo_reinit_libpseudo();
> - 		} else {
> - 			pseudo_dropenv();
> -diff --git a/ports/linux/oldclone/pseudo_wrappers.c b/ports/linux/oldclone/pseudo_wrappers.c
> -index c0ce5dd..598d966 100644
> ---- a/ports/linux/oldclone/pseudo_wrappers.c
> -+++ b/ports/linux/oldclone/pseudo_wrappers.c
> -@@ -22,7 +22,7 @@ int wrap_clone_child(void *args) {
> -
> - 	if (!(flags & CLONE_VM)) {
> - 		pseudo_setupenv();
> --		if (!pseudo_get_value("PSEUDO_UNLOAD")) {
> -+		if (!pseudo_has_unload(NULL)) {
> - 			pseudo_reinit_libpseudo();
> - 		} else {
> - 			pseudo_dropenv();
> -diff --git a/ports/unix/guts/popen.c b/ports/unix/guts/popen.c
> -index 0ca16b0..5d44c0e 100644
> ---- a/ports/unix/guts/popen.c
> -+++ b/ports/unix/guts/popen.c
> -@@ -9,7 +9,7 @@
> - 	 * in ways that avoid our usual enforcement of the environment.
> - 	 */
> - 	pseudo_setupenv();
> --	if (pseudo_get_value("PSEUDO_UNLOAD"))
> -+	if (pseudo_has_unload(NULL))
> - 		pseudo_dropenv();
> -
> - 	rc = real_popen(command, mode);
> -diff --git a/ports/unix/guts/system.c b/ports/unix/guts/system.c
> -index 028b372..6351592 100644
> ---- a/ports/unix/guts/system.c
> -+++ b/ports/unix/guts/system.c
> -@@ -9,7 +9,7 @@
> - 		return 1;
> -
> - 	pseudo_setupenv();
> --	if (pseudo_get_value("PSEUDO_UNLOAD"))
> -+	if (pseudo_has_unload(NULL))
> - 		pseudo_dropenv();
> -
> - 	rc = real_system(command);
> -diff --git a/pseudo.h b/pseudo.h
> -index 56760a4..f600793 100644
> ---- a/pseudo.h
> -+++ b/pseudo.h
> -@@ -28,6 +28,7 @@ extern void pseudo_init_client(void);
> - void pseudo_dump_env(char **envp);
> - int pseudo_set_value(const char *key, const char *value);
> - char *pseudo_get_value(const char *key);
> -+int pseudo_has_unload(char * const *envp);
> -
> - #include "pseudo_tables.h"
> -
> -diff --git a/pseudo_util.c b/pseudo_util.c
> -index 8d0969e..16c70e0 100644
> ---- a/pseudo_util.c
> -+++ b/pseudo_util.c
> -@@ -95,6 +95,33 @@ dump_env(char **envp) {
> - }
> - #endif
> -
> -+int
> -+pseudo_has_unload(char * const *envp) {
> -+	static const char unload[] = "PSEUDO_UNLOAD";
> -+	static size_t unload_len = strlen(unload);
> -+	size_t i = 0;
> -+
> -+	/* Is it in the caller environment? */
> -+	if (NULL != getenv(unload))
> -+		return 1;
> -+
> -+	/* Is it in the environment cache? */
> -+	if (pseudo_util_initted == -1)
> -+		pseudo_init_util();
> -+	while (pseudo_env[i].key && strcmp(pseudo_env[i].key, unload))
> -+	       ++i;
> -+	if (pseudo_env[i].key && pseudo_env[i].value)
> -+		return 1;
> -+
> -+	/* Is it in the operational environment? */
> -+	while (envp && *envp) {
> -+		if ((!strncmp(*envp, unload, unload_len)) && ('=' == (*envp)[unload_len]))
> -+			return 1;
> -+		++envp;
> -+	}
> -+	return 0;
> -+}
> -+
> - /* Caller must free memory! */
> - char *
> - pseudo_get_value(const char *key) {
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
> deleted file mode 100644
> index e8eaf13..0000000
> --- a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Upstream-Status: Backport
> -
> -when install command sets the created directory mode, pseudo will change
> -the mode of the directory to 0700 incorrectly.
> -
> -Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> ---- a/ports/unix/guts/mkdirat.c
> -+++ b/ports/unix/guts/mkdirat.c
> -@@ -25,6 +25,7 @@
> - 		stat_rc = base_fstatat(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> - #endif
> - 		if (stat_rc != -1) {
> -+			buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, mode);
> - 			pseudo_client_op(OP_MKDIR, 0, -1, dirfd, path, &buf);
> - 		} else {
> - 			pseudo_debug(1, "mkdir of %s succeeded, but stat failed: %s\n",
> diff --git a/meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch b/meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
> deleted file mode 100644
> index 7b1f82d..0000000
> --- a/meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
> +++ /dev/null
> @@ -1,264 +0,0 @@
> -commit 7e67d082737b3df4788caf85fedd607b3acd9786
> -Author: Peter Seebach <peter.seebach@windriver.com>
> -Date:   Fri May 16 15:53:06 2014 -0500
> -
> -    permissions updates: improve fchmodat, mask out write bits
> -
> -    Upstream-Status: Backport of several patches from 1.6 branch,
> -    combined.
> -
> -    Backport from pseudo 1.6 of improvements to fchmodat (handle
> -    AT_SYMLINK_NOFOLLOW by rejecting it if the host system does,
> -    to make GNU tar happier), also mask out write bits from filesystem
> -    modes to avoid security problems.
> -
> -    Also start tracking umask so we can use the right modes for
> -    open, mkdir, and mknod.
> -
> -    The 1.6 patches are:
> -
> -    87c53ea58befef48677846693aab445df1850e16
> -    3c716e0bab4f0cfe4be84caa9ce5fd5e3f5e2a23
> -    c98e4f43b5d6499748a5057134408f4ba4854fb4
> -    2f71a021b725c1aa415439209a89327f0b997d02
> -    14925786b55202d8147b0af719038e8a23ef73c0
> -
> -diff --git a/ChangeLog.txt b/ChangeLog.txt
> -index 113f675..cc966ce 100644
> ---- a/ChangeLog.txt
> -+++ b/ChangeLog.txt
> -@@ -1,3 +1,18 @@
> -+2014-05-27:
> -+	* (seebs) start noticing umask, mask it out from open or mkdir
> -+	  calls rather than relying on underlying open/mkdir to do it.
> -+
> -+2014-05-16:
> -+	* (seebs) fchmodat: don't drop flags, report failures, to improve
> -+	  compatibility/consistency. Cache the knowledge that
> -+	  AT_SYMLINK_NOFOLLOW gets ENOTSUP.
> -+	* (seebs) mask out group/other write bits in real filesystem to
> -+	  reduce risks when assembling a rootfs including world-writeable
> -+	  directories.
> -+
> -+2014-05-15:
> -+	* (seebs) drop flags when calling fchmodat() to appease GNU tar.
> -+
> - 2013-02-27:
> - 	* (seebs) Oh, hey, what if I took out my debug messages?
> - 	* (seebs) update docs a bit to reduce bitrot
> -diff --git a/makewrappers b/makewrappers
> -index e87cc56..0127766 100755
> ---- a/makewrappers
> -+++ b/makewrappers
> -@@ -204,6 +204,7 @@ class Function:
> -             'uid_t': '0',
> -             'int': '-1',
> -             'long': '-1',
> -+            'mode_t': '0',
> -             'ssize_t': '-1'
> -         }
> -
> -diff --git a/ports/darwin/guts/open.c b/ports/darwin/guts/open.c
> -index c66cc15..520bb70 100644
> ---- a/ports/darwin/guts/open.c
> -+++ b/ports/darwin/guts/open.c
> -@@ -9,6 +9,9 @@
> - 	struct stat buf = { };
> - 	int existed = 1;
> - 	int save_errno;
> -+
> -+	/* mask out mode bits appropriately */
> -+	mode = mode & ~pseudo_umask;
> - #ifdef PSEUDO_FORCE_ASYNCH
> -         flags &= ~O_SYNC;
> - #endif
> -diff --git a/ports/linux/guts/__xmknodat.c b/ports/linux/guts/__xmknodat.c
> -index 59b4f2f..0888b8a 100644
> ---- a/ports/linux/guts/__xmknodat.c
> -+++ b/ports/linux/guts/__xmknodat.c
> -@@ -9,6 +9,9 @@
> -  	pseudo_msg_t *msg;
> - 	struct stat64 buf;
> -
> -+	/* mask out mode bits appropriately */
> -+	mode = mode & ~pseudo_umask;
> -+
> - 	/* we don't use underlying call, so _ver is irrelevant to us */
> - 	(void) ver;
> -
> -diff --git a/ports/linux/guts/openat.c b/ports/linux/guts/openat.c
> -index 8460073..4053549 100644
> ---- a/ports/linux/guts/openat.c
> -+++ b/ports/linux/guts/openat.c
> -@@ -10,6 +10,9 @@
> - 	int existed = 1;
> - 	int save_errno;
> -
> -+	/* mask out mode bits appropriately */
> -+	mode = mode & ~pseudo_umask;
> -+
> - #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> - 	if (dirfd != AT_FDCWD) {
> - 		errno = ENOSYS;
> -diff --git a/ports/unix/guts/fchmodat.c b/ports/unix/guts/fchmodat.c
> -index 59a92ce..69a953c 100644
> ---- a/ports/unix/guts/fchmodat.c
> -+++ b/ports/unix/guts/fchmodat.c
> -@@ -8,6 +8,7 @@
> -  */
> - 	PSEUDO_STATBUF buf;
> - 	int save_errno = errno;
> -+	static int picky_fchmodat = 0;
> -
> - #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> - 	if (dirfd != AT_FDCWD) {
> -@@ -15,6 +16,16 @@
> - 		return -1;
> - 	}
> - 	if (flags & AT_SYMLINK_NOFOLLOW) {
> -+		/* Linux, as of this writing, will always reject this.
> -+		 * GNU tar relies on getting the rejection. To cut down
> -+		 * on traffic, we check for the failure, and if we saw
> -+		 * a failure previously, we reject it right away and tell
> -+		 * the caller to retry.
> -+		 */
> -+		if (picky_fchmodat) {
> -+			errno = ENOTSUP;
> -+			return -1;
> -+		}
> - 		rc = base_lstat(path, &buf);
> - 	} else {
> - 		rc = base_stat(path, &buf);
> -@@ -50,13 +61,22 @@
> -
> - 	/* user bits added so "root" can always access files. */
> - #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> --	/* note:  if path was a symlink, and AT_NOFOLLOW_SYMLINKS was
> -+	/* note:  if path was a symlink, and AT_SYMLINK_NOFOLLOW was
> - 	 * specified, we already bailed previously. */
> - 	real_chmod(path, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)));
> - #else
> --	real_fchmodat(dirfd, path, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)), flags);
> -+	rc = real_fchmodat(dirfd, path, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)), flags);
> -+	/* AT_SYMLINK_NOFOLLOW isn't supported by fchmodat. GNU tar
> -+	 * tries to use it anyway, figuring it can just retry if that
> -+	 * fails. So we want to report that *particular* failure instead
> -+	 * of doing the fallback.
> -+	 */
> -+	if (rc == -1 && errno == ENOTSUP && (flags & AT_SYMLINK_NOFOLLOW)) {
> -+		picky_fchmodat = 1;
> -+		return -1;
> -+	}
> - #endif
> --	/* we ignore a failure from underlying fchmod, because pseudo
> -+	/* we otherwise ignore failures from underlying fchmod, because pseudo
> - 	 * may believe you are permitted to change modes that the filesystem
> - 	 * doesn't. Note that we also don't need to know whether the
> -          * file might be a (pseudo) block device or some such; pseudo
> -diff --git a/ports/unix/guts/mkdirat.c b/ports/unix/guts/mkdirat.c
> -index e846b70..e0b6af9 100644
> ---- a/ports/unix/guts/mkdirat.c
> -+++ b/ports/unix/guts/mkdirat.c
> -@@ -6,11 +6,14 @@
> -  * wrap_mkdirat(int dirfd, const char *path, mode_t mode) {
> -  *	int rc = -1;
> -  */
> -+	/* mask out mode bits appropriately */
> -+	mode = mode & ~pseudo_umask;
> - #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> - 	if (dirfd != AT_FDCWD) {
> - 		errno = ENOSYS;
> - 		return -1;
> - 	}
> -+
> - 	rc = real_mkdir(path, PSEUDO_FS_MODE(mode, 1));
> - #else
> - 	rc = real_mkdirat(dirfd, path, PSEUDO_FS_MODE(mode, 1));
> -diff --git a/ports/unix/guts/mknodat.c b/ports/unix/guts/mknodat.c
> -index 6fd5b42..5d8d47c 100644
> ---- a/ports/unix/guts/mknodat.c
> -+++ b/ports/unix/guts/mknodat.c
> -@@ -10,6 +10,9 @@
> - 	PSEUDO_STATBUF buf;
> -         int save_errno = errno;
> -
> -+	/* mask out mode bits appropriately */
> -+	mode = mode & ~pseudo_umask;
> -+
> - #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> - 	if (dirfd != AT_FDCWD) {
> - 		errno = ENOSYS;
> -diff --git a/ports/unix/guts/umask.c b/ports/unix/guts/umask.c
> -new file mode 100644
> -index 0000000..6b060d3
> ---- /dev/null
> -+++ b/ports/unix/guts/umask.c
> -@@ -0,0 +1,14 @@
> -+/*
> -+ * Copyright (c) 2014 Wind River Systems; see
> -+ * guts/COPYRIGHT for information.
> -+ *
> -+ * mode_t umask(mode_t mask)
> -+ *	mode_t rc = 0;
> -+ */
> -+
> -+	pseudo_umask = mask;
> -+	rc = real_umask(mask);
> -+
> -+/*	return rc;
> -+ * }
> -+ */
> -diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
> -index 8460a65..e0e9739 100644
> ---- a/ports/unix/wrapfuncs.in
> -+++ b/ports/unix/wrapfuncs.in
> -@@ -67,3 +67,4 @@ void sync(void); /* async_skip= */
> - int syncfs(int fd); /* async_skip=0 */
> - int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags); /* async_skip=0 */
> - int msync(void *addr, size_t length, int flags); /* async_skip=0 */
> -+mode_t umask(mode_t mask);
> -diff --git a/pseudo_client.c b/pseudo_client.c
> -index b6d11a6..535c810 100644
> ---- a/pseudo_client.c
> -+++ b/pseudo_client.c
> -@@ -71,6 +71,8 @@ int pseudo_disabled = 0;
> - int pseudo_allow_fsync = 0;
> - static int pseudo_local_only = 0;
> -
> -+int pseudo_umask = 022;
> -+
> - static char **fd_paths = NULL;
> - static int nfds = 0;
> - static int messages = 0;
> -@@ -219,6 +221,9 @@ pseudo_init_client(void) {
> - 	if (!pseudo_disabled && !pseudo_inited) {
> - 		char *pseudo_path = 0;
> -
> -+		pseudo_umask = umask(022);
> -+		umask(pseudo_umask);
> -+
> - 		pseudo_path = pseudo_prefix_path(NULL);
> - 		if (pseudo_prefix_dir_fd == -1) {
> - 			if (pseudo_path) {
> -diff --git a/pseudo_client.h b/pseudo_client.h
> -index f36a772..5bf820e 100644
> ---- a/pseudo_client.h
> -+++ b/pseudo_client.h
> -@@ -72,6 +72,8 @@ extern char *pseudo_passwd;
> - extern size_t pseudo_chroot_len;
> - extern int pseudo_nosymlinkexp;
> -
> -+extern int pseudo_umask;
> -+
> - /* Root can read and write files, and enter directories which have no
> -  * read, write, or execute permissions.  (But can't execute files without
> -  * execute permissions!)
> -@@ -85,6 +87,6 @@ extern int pseudo_nosymlinkexp;
> -  * None of this will behave very sensibly if umask has 0700 bits in it;
> -  * this is a known limitation.
> -  */
> --#define PSEUDO_FS_MODE(mode, isdir) ((mode) | S_IRUSR | S_IWUSR | ((isdir) ? S_IXUSR : 0))
> --#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0700) | ((user_mode & 0700)))
> -+#define PSEUDO_FS_MODE(mode, isdir) (((mode) | S_IRUSR | S_IWUSR | ((isdir) ? S_IXUSR : 0)) & ~(S_IWGRP | S_IWOTH))
> -+#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0722) | ((user_mode & 0722)))
> -
> diff --git a/meta/recipes-devtools/pseudo/files/shutdownping.patch b/meta/recipes-devtools/pseudo/files/shutdownping.patch
> deleted file mode 100644
> index 8af8e0b..0000000
> --- a/meta/recipes-devtools/pseudo/files/shutdownping.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -There is a potential issue with the fastop code in pseudo since a process may
> -exit and allow some other function to run before the server has processed
> -the commands run by the process. Issues have been see with unpredictable
> -file permissions.
> -
> -To avoid this, we ping the server before exitting which guarantees it has
> -processed the current command queue.
> -
> -Debugged-by: RP
> -Fix written by peter.seebach@windriver.com
> -
> -Upstream-Status: Submitted
> -
> -[YOCTO #5132]
> -
> -diff --git a/pseudo_client.c b/pseudo_client.c
> -index f58ce4c..20943b6 100644
> ---- a/pseudo_client.c
> -+++ b/pseudo_client.c
> -@@ -75,6 +75,9 @@ static int nfds = 0;
> - static int messages = 0;
> - static struct timeval message_time = { .tv_sec = 0 };
> - static int pseudo_inited = 0;
> -+
> -+static int sent_messages = 0;
> -+
> - int pseudo_nosymlinkexp = 0;
> -
> - /* note: these are int, not uid_t/gid_t, so I can use 'em with scanf */
> -@@ -711,6 +714,11 @@ client_ping(void) {
> - 	return 0;
> - }
> -
> -+static void
> -+void_client_ping(void) {
> -+	client_ping();
> -+}
> -+
> - int
> - pseudo_fd(int fd, int how) {
> - 	int newfd;
> -@@ -1043,6 +1051,11 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
> - 	/* disable wrappers */
> - 	pseudo_antimagic();
> -
> -+	if (!sent_messages) {
> -+		sent_messages = 1;
> -+		atexit(void_client_ping);
> -+	}
> -+
> - 	if (op == OP_RENAME) {
> - 		va_list ap;
> - 		va_start(ap, buf);
> diff --git a/meta/recipes-devtools/pseudo/files/symver.patch b/meta/recipes-devtools/pseudo/files/symver.patch
> deleted file mode 100644
> index 8d1b377..0000000
> --- a/meta/recipes-devtools/pseudo/files/symver.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -When running as pseudo-nativesdk, we might need to run host binaries
> -linked against the host libc. Having a 2.14 libc dependency from memcpy is
> -problematic so instruct the linker to use older symbols.
> -
> -Upstream-Status: Pending
> -
> -RP 2012/4/22
> -
> -Index: pseudo-1.3/pseudo.h
> -===================================================================
> ---- pseudo-1.3.orig/pseudo.h	2012-04-22 12:17:59.078909060 +0000
> -+++ pseudo-1.3/pseudo.h	2012-04-22 12:32:42.954888587 +0000
> -@@ -29,6 +29,13 @@
> - int pseudo_set_value(const char *key, const char *value);
> - char *pseudo_get_value(const char *key);
> -
> -+#ifdef __amd64__
> -+#define GLIBC_COMPAT_SYMBOL(SYM) __asm__(".symver " #SYM "," #SYM "@GLIBC_2.2.5")
> -+#else
> -+#define GLIBC_COMPAT_SYMBOL(SYM) __asm__(".symver " #SYM "," #SYM "@GLIBC_2.0")
> -+#endif
> -+GLIBC_COMPAT_SYMBOL(memcpy);
> -+
> - #include "pseudo_tables.h"
> -
> - extern void pseudo_debug_verbose(void);
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> deleted file mode 100644
> index 8d562ec..0000000
> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -require pseudo.inc
> -
> -PR = "r5"
> -
> -SRC_URI = " \
> -    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
> -    file://0001-pseudo_has_unload-add-function.patch \
> -    file://shutdownping.patch \
> -    file://pseudo-1.5.1-install-directory-mode.patch \
> -    file://pseudo-fchmodat-permissions.patch \
> -"
> -
> -SRC_URI_append_class-nativesdk = " file://symver.patch"
> -
> -SRC_URI_append_class-native = " file://symver.patch"
> -
> -SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
> -SRC_URI[sha256sum] = "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a8947d2ff6c1d3d52"
> -
> -PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
>

