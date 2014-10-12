Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id DA0CD718F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:50:20 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id 2Pq71p0040BVjqb01PqN7a; Sun, 12 Oct 2014 16:50:22 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 18:49:54 -0500
Message-Id: <1413157795-1346-3-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1413157795-1346-1-git-send-email-pab@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 2/3] pseudo: support multiple search directories in PSEUDO_PASSWD
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
X-List-Received-Date: Sun, 12 Oct 2014 23:50:21 -0000

This makes it possible to use --without-passwd-fallback when building
images where the preferred passwd files are not available until after
installation has begun.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
Cc: peter.seebach@windriver.com

 ..._util-modify-interface-to-pseudo_etc_file.patch |  70 +++++++++++++
 ...nt.c-support-multiple-directories-in-PSEU.patch | 115 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       |   2 +
 3 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch

diff --git a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
new file mode 100644
index 0000000..c7006ef
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
@@ -0,0 +1,70 @@
+From f05def2bbd5507084672bc9072ffe0e5101e9b47 Mon Sep 17 00:00:00 2001
+From: "Peter A. Bigot" <pab@pabigot.com>
+Date: Sun, 12 Oct 2014 11:35:57 -0500
+Subject: [PATCH 2/3] pseudo_util: modify interface to pseudo_etc_file
+
+* Make the search directory pointers const: there is no reason why this
+  function should be allowed to mutate the directories.
+
+* Change the search directory argument from an array of pointers to a
+  pointer-to-pointers to prepare for an upcoming enhancement.
+
+Upstream-Status: Pending
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+---
+ pseudo.h        | 2 +-
+ pseudo_client.c | 2 +-
+ pseudo_util.c   | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pseudo.h b/pseudo.h
+index 92020e4..05813c1 100644
+--- a/pseudo.h
++++ b/pseudo.h
+@@ -86,7 +86,7 @@ extern int pseudo_logfile(char *defname);
+ extern ssize_t pseudo_sys_path_max(void);
+ extern ssize_t pseudo_path_max(void);
+ #define PSEUDO_PWD_MAX 4096
+-extern int pseudo_etc_file(const char *filename, char *realname, int flags, char *path[], int dircount);
++extern int pseudo_etc_file(const char *filename, char *realname, int flags, const char **search_dirs, int dircount);
+ extern void pseudo_stat32_from64(struct stat *, const struct stat64 *);
+ extern void pseudo_stat64_from32(struct stat64 *, const struct stat *);
+ 
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 442dd19..7a4d7fa 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -93,7 +93,7 @@ gid_t pseudo_egid;
+ gid_t pseudo_sgid;
+ gid_t pseudo_fgid;
+ 
+-#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, (char *[]) { pseudo_chroot, pseudo_passwd, PSEUDO_PASSWD_FALLBACK }, PSEUDO_PASSWD_FALLBACK ? 3 : 2)
++#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, (const char *[]) { pseudo_chroot, pseudo_passwd, PSEUDO_PASSWD_FALLBACK }, PSEUDO_PASSWD_FALLBACK ? 3 : 2)
+ 
+ /* helper function to make a directory, just like mkdir -p.
+  * Can't use system() because the child shell would end up trying
+diff --git a/pseudo_util.c b/pseudo_util.c
+index e4e1fc8..647d3ad 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -1264,7 +1264,7 @@ FILE *pseudo_host_etc_group_file = &pseudo_fake_group_file;
+ #endif
+ 
+ int
+-pseudo_etc_file(const char *file, char *realname, int flags, char *search_dirs[], int dircount) {
++pseudo_etc_file(const char *file, char *realname, int flags, const char **search_dirs, int dircount) {
+ 	char filename[pseudo_path_max()];
+ 	int rc = -1;
+ 
+@@ -1280,7 +1280,7 @@ pseudo_etc_file(const char *file, char *realname, int flags, char *search_dirs[]
+ 		return -1;
+ 	}
+ 	for (i = 0; i < dircount; ++i) {
+-		char *s = search_dirs[i];
++		const char *s = search_dirs[i];
+ 		if (!s)
+ 			continue;
+ #if PSEUDO_PORT_DARWIN
+-- 
+1.8.5.5
+
diff --git a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
new file mode 100644
index 0000000..ccef029
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
@@ -0,0 +1,115 @@
+From 0ba6d83d54423a97bb767a8d753e87f52052505f Mon Sep 17 00:00:00 2001
+From: "Peter A. Bigot" <pab@pabigot.com>
+Date: Sun, 12 Oct 2014 12:17:48 -0500
+Subject: [PATCH 3/3] pseudo_client.c: support multiple directories in
+ PSEUDO_PASSWD
+
+For OpenEmbedded it is highly unlikely that using the build host passwd
+file is the right approach.  Most packages can be built with a pseudo
+that was configured --without-passwd-fallback, since
+PSEUDO_PASSWD=${STAGING_DIR_TARGET} suffices.
+
+This fails when building images, because image.bbclass (correctly)
+overrides to PSEUDO_PASSWD=${IMAGE_ROOTFS}.  However, the rootfs
+/etc/passwd is not created until the post-install phase of base-passwd,
+which is long after a passwd file is required.  For example, the smart
+RPM interface wants to look up uid 0 right away.  The right solution
+here is to look first in ${IMAGE_ROOTFS}, then fallback to
+${STAGING_DIR_TARGET}.
+
+Rather than rework pseudo to change PSEUDO_PASSWD_FALLBACK to be a
+run-time rather than compile-time specification, rework the handling of
+PSEUDO_PASSWD so that it is a colon-separated list of directories that
+are processed in order.
+
+Upstream-Status: Pending
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+---
+ pseudo_client.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 7a4d7fa..b52b86a 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -75,6 +75,8 @@ int pseudo_umask = 022;
+ 
+ static char **fd_paths = NULL;
+ static int nfds = 0;
++static const char **passwd_paths = NULL;
++static int npasswd_paths = 0;
+ static int messages = 0;
+ static struct timeval message_time = { .tv_sec = 0 };
+ static int pseudo_inited = 0;
+@@ -93,7 +95,7 @@ gid_t pseudo_egid;
+ gid_t pseudo_sgid;
+ gid_t pseudo_fgid;
+ 
+-#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, (const char *[]) { pseudo_chroot, pseudo_passwd, PSEUDO_PASSWD_FALLBACK }, PSEUDO_PASSWD_FALLBACK ? 3 : 2)
++#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, passwd_paths, npasswd_paths)
+ 
+ /* helper function to make a directory, just like mkdir -p.
+  * Can't use system() because the child shell would end up trying
+@@ -117,6 +119,42 @@ mkdir_p(char *path) {
+ 	(void) mkdir(path, 0755);
+ }
+ 
++static int
++build_passwd_paths(const char **paths)
++{
++	int np = 0;
++	
++	if (pseudo_chroot) {
++		if (paths) {
++			paths[np] = pseudo_chroot;
++		}
++		++np;
++	}
++	if (pseudo_passwd) {
++		const char *cp = pseudo_passwd;
++		const char *next = strchr(cp, ':');
++		while (next) {
++			if (paths) {
++				paths[np] = strndup(cp, next-cp);
++			}
++			++np;
++			cp = next+1;
++			next = strchr(cp, ':');
++		}
++		if (paths) {
++			paths[np] = strdup(cp);
++		}
++		++np;
++	}
++	if (PSEUDO_PASSWD_FALLBACK) {
++		if (paths) {
++			paths[np] = PSEUDO_PASSWD_FALLBACK;
++		}
++		++np;
++	}
++	return np;
++}
++
+ void
+ pseudo_init_client(void) {
+ 	char *env;
+@@ -329,6 +367,16 @@ pseudo_init_client(void) {
+ 		}
+ 		free(env);
+ 
++		npasswd_paths = build_passwd_paths(NULL);
++		if (npasswd_paths) {
++			passwd_paths = malloc(npasswd_paths * sizeof(*passwd_paths));
++			if (!passwd_paths) {
++				pseudo_diag("couldn't allocate space for passwd paths.\n");
++				exit(1);
++			}
++			build_passwd_paths(passwd_paths);
++		}
++
+ 		pseudo_inited = 1;
+ 	}
+ 	if (!pseudo_disabled)
+-- 
+1.8.5.5
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
index df8ce83..78eeedf 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
@@ -3,6 +3,8 @@ require pseudo.inc
 SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-pseudo_client.c-protect-pwd_lck-against-magic.patch \
+    file://0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch \
+    file://0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch \
 "
 
 SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
-- 
1.8.5.5


