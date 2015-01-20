Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A86FC7229E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0KLLaQb012012
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 13:21:36 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 20 Jan 2015 13:21:35 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jan 2015 15:21:34 -0600
Message-ID: <b8134b991239e494b77a232bd723245d753c2734.1421788745.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1421788745.git.peter.seebach@windriver.com>
References: <cover.1421788745.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3
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
X-List-Received-Date: Tue, 20 Jan 2015 21:21:40 -0000
Content-Type: text/plain

pseudo 1.6.3 merges (with some changes) the changes from
Peter A. Bigot to make --without-fallback-passwd work. It
also adds a proposed fix for Yocto bug #7097, which has
passed the obvious tests I could think of.
---
 ...do_client.c-protect-pwd_lck-against-magic.patch |   56 ----------
 ..._util-modify-interface-to-pseudo_etc_file.patch |   70 ------------
 ...nt.c-support-multiple-directories-in-PSEU.patch |  116 --------------------
 .../pseudo/{pseudo_1.6.2.bb => pseudo_1.6.3.bb}    |    7 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 +-
 5 files changed, 4 insertions(+), 249 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.2.bb => pseudo_1.6.3.bb} (57%)

diff --git a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
deleted file mode 100644
index d0c0a27..0000000
--- a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From e11468a47369596f57c5e99bd0a3dd58b2c6d5e0 Mon Sep 17 00:00:00 2001
-From: "Peter A. Bigot" <pab@pabigot.com>
-Date: Sun, 12 Oct 2014 08:27:14 -0500
-Subject: [PATCH 1/3] pseudo_client.c: protect pwd_lck against magic
-
-While attempting to diagnose unexpected uid/gid assignment I added
---without-passwd-fallback to the pseudo build.  This caused build
-failures due to inability to lock /etc/passwd.
-
-Instrumentation revealed that attempts to create the lock file ended up
-with pseudo_etc_file() creating the correct lock name, but the
-subsequent open had an extra PSEUDO_PASSWD directory prefix causing
-it to fail.
-
-Inspection of pseudo_client shows the only other use of PSEUDO_ETC_FILE
-to be protected against magic.  Applying the same shield to the
-unprotected calls in pseudo_pwd_lck_{open,close} fixes the issue.
-
-Upstream-Status: Pending
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- pseudo_client.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/pseudo_client.c b/pseudo_client.c
-index 8deaa1b..442dd19 100644
---- a/pseudo_client.c
-+++ b/pseudo_client.c
-@@ -416,20 +416,24 @@ pseudo_pwd_lck_open(void) {
- 		}
- 	}
- 	pseudo_pwd_lck_close();
-+	pseudo_antimagic();
- 	pseudo_pwd_lck_fd = PSEUDO_ETC_FILE(".pwd.lock",
- 					pseudo_pwd_lck_name, O_RDWR | O_CREAT);
-+	pseudo_magic();
- 	return pseudo_pwd_lck_fd;
- }
- 
- int
- pseudo_pwd_lck_close(void) {
- 	if (pseudo_pwd_lck_fd != -1) {
-+		pseudo_antimagic();
- 		close(pseudo_pwd_lck_fd);
- 		if (pseudo_pwd_lck_name) {
- 			unlink(pseudo_pwd_lck_name);
- 			free(pseudo_pwd_lck_name);
- 			pseudo_pwd_lck_name = 0;
- 		}
-+		pseudo_magic();
- 		pseudo_pwd_lck_fd = -1;
- 		return 0;
- 	} else {
--- 
-1.8.5.5
-
diff --git a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
deleted file mode 100644
index c7006ef..0000000
--- a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From f05def2bbd5507084672bc9072ffe0e5101e9b47 Mon Sep 17 00:00:00 2001
-From: "Peter A. Bigot" <pab@pabigot.com>
-Date: Sun, 12 Oct 2014 11:35:57 -0500
-Subject: [PATCH 2/3] pseudo_util: modify interface to pseudo_etc_file
-
-* Make the search directory pointers const: there is no reason why this
-  function should be allowed to mutate the directories.
-
-* Change the search directory argument from an array of pointers to a
-  pointer-to-pointers to prepare for an upcoming enhancement.
-
-Upstream-Status: Pending
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- pseudo.h        | 2 +-
- pseudo_client.c | 2 +-
- pseudo_util.c   | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/pseudo.h b/pseudo.h
-index 92020e4..05813c1 100644
---- a/pseudo.h
-+++ b/pseudo.h
-@@ -86,7 +86,7 @@ extern int pseudo_logfile(char *defname);
- extern ssize_t pseudo_sys_path_max(void);
- extern ssize_t pseudo_path_max(void);
- #define PSEUDO_PWD_MAX 4096
--extern int pseudo_etc_file(const char *filename, char *realname, int flags, char *path[], int dircount);
-+extern int pseudo_etc_file(const char *filename, char *realname, int flags, const char **search_dirs, int dircount);
- extern void pseudo_stat32_from64(struct stat *, const struct stat64 *);
- extern void pseudo_stat64_from32(struct stat64 *, const struct stat *);
- 
-diff --git a/pseudo_client.c b/pseudo_client.c
-index 442dd19..7a4d7fa 100644
---- a/pseudo_client.c
-+++ b/pseudo_client.c
-@@ -93,7 +93,7 @@ gid_t pseudo_egid;
- gid_t pseudo_sgid;
- gid_t pseudo_fgid;
- 
--#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, (char *[]) { pseudo_chroot, pseudo_passwd, PSEUDO_PASSWD_FALLBACK }, PSEUDO_PASSWD_FALLBACK ? 3 : 2)
-+#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, (const char *[]) { pseudo_chroot, pseudo_passwd, PSEUDO_PASSWD_FALLBACK }, PSEUDO_PASSWD_FALLBACK ? 3 : 2)
- 
- /* helper function to make a directory, just like mkdir -p.
-  * Can't use system() because the child shell would end up trying
-diff --git a/pseudo_util.c b/pseudo_util.c
-index e4e1fc8..647d3ad 100644
---- a/pseudo_util.c
-+++ b/pseudo_util.c
-@@ -1264,7 +1264,7 @@ FILE *pseudo_host_etc_group_file = &pseudo_fake_group_file;
- #endif
- 
- int
--pseudo_etc_file(const char *file, char *realname, int flags, char *search_dirs[], int dircount) {
-+pseudo_etc_file(const char *file, char *realname, int flags, const char **search_dirs, int dircount) {
- 	char filename[pseudo_path_max()];
- 	int rc = -1;
- 
-@@ -1280,7 +1280,7 @@ pseudo_etc_file(const char *file, char *realname, int flags, char *search_dirs[]
- 		return -1;
- 	}
- 	for (i = 0; i < dircount; ++i) {
--		char *s = search_dirs[i];
-+		const char *s = search_dirs[i];
- 		if (!s)
- 			continue;
- #if PSEUDO_PORT_DARWIN
--- 
-1.8.5.5
-
diff --git a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
deleted file mode 100644
index e6c6284..0000000
--- a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 09f04dc36f21c179235109b3dcddce9dda9a8ba8 Mon Sep 17 00:00:00 2001
-From: "Peter A. Bigot" <pab@pabigot.com>
-Date: Sun, 12 Oct 2014 12:17:48 -0500
-Subject: [PATCH 3/3] pseudo_client.c: support multiple directories in
- PSEUDO_PASSWD
-
-For OpenEmbedded it is highly unlikely that using the build host passwd
-file is the right approach.  Most packages can be built with a pseudo
-that was configured --without-passwd-fallback, since
-PSEUDO_PASSWD=${STAGING_DIR_TARGET} suffices.
-
-This fails when building images, because image.bbclass (correctly)
-overrides to PSEUDO_PASSWD=${IMAGE_ROOTFS}.  However, the rootfs
-/etc/passwd is not created until the post-install phase of base-passwd,
-which is long after a passwd file is required.  For example, the smart
-RPM interface wants to look up uid 0 right away.  The right solution
-here is to look first in ${IMAGE_ROOTFS}, then fallback to
-a location holding immutable files with the minimum user/group settings
-necessary to successfully get base-passwd onto the target.
-
-Rather than rework pseudo to change PSEUDO_PASSWD_FALLBACK to be a
-run-time rather than compile-time specification, rework the handling of
-PSEUDO_PASSWD so that it is a colon-separated list of directories that
-are processed in order.
-
-Upstream-Status: Pending
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- pseudo_client.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 49 insertions(+), 1 deletion(-)
-
-diff --git a/pseudo_client.c b/pseudo_client.c
-index 7a4d7fa..b52b86a 100644
---- a/pseudo_client.c
-+++ b/pseudo_client.c
-@@ -75,6 +75,8 @@ int pseudo_umask = 022;
- 
- static char **fd_paths = NULL;
- static int nfds = 0;
-+static const char **passwd_paths = NULL;
-+static int npasswd_paths = 0;
- static int messages = 0;
- static struct timeval message_time = { .tv_sec = 0 };
- static int pseudo_inited = 0;
-@@ -93,7 +95,7 @@ gid_t pseudo_egid;
- gid_t pseudo_sgid;
- gid_t pseudo_fgid;
- 
--#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, (const char *[]) { pseudo_chroot, pseudo_passwd, PSEUDO_PASSWD_FALLBACK }, PSEUDO_PASSWD_FALLBACK ? 3 : 2)
-+#define PSEUDO_ETC_FILE(filename, realname, flags) pseudo_etc_file(filename, realname, flags, passwd_paths, npasswd_paths)
- 
- /* helper function to make a directory, just like mkdir -p.
-  * Can't use system() because the child shell would end up trying
-@@ -117,6 +119,42 @@ mkdir_p(char *path) {
- 	(void) mkdir(path, 0755);
- }
- 
-+static int
-+build_passwd_paths(const char **paths)
-+{
-+	int np = 0;
-+	
-+	if (pseudo_chroot) {
-+		if (paths) {
-+			paths[np] = pseudo_chroot;
-+		}
-+		++np;
-+	}
-+	if (pseudo_passwd) {
-+		const char *cp = pseudo_passwd;
-+		const char *next = strchr(cp, ':');
-+		while (next) {
-+			if (paths) {
-+				paths[np] = strndup(cp, next-cp);
-+			}
-+			++np;
-+			cp = next+1;
-+			next = strchr(cp, ':');
-+		}
-+		if (paths) {
-+			paths[np] = strdup(cp);
-+		}
-+		++np;
-+	}
-+	if (PSEUDO_PASSWD_FALLBACK) {
-+		if (paths) {
-+			paths[np] = PSEUDO_PASSWD_FALLBACK;
-+		}
-+		++np;
-+	}
-+	return np;
-+}
-+
- void
- pseudo_init_client(void) {
- 	char *env;
-@@ -329,6 +367,16 @@ pseudo_init_client(void) {
- 		}
- 		free(env);
- 
-+		npasswd_paths = build_passwd_paths(NULL);
-+		if (npasswd_paths) {
-+			passwd_paths = malloc(npasswd_paths * sizeof(*passwd_paths));
-+			if (!passwd_paths) {
-+				pseudo_diag("couldn't allocate space for passwd paths.\n");
-+				exit(1);
-+			}
-+			build_passwd_paths(passwd_paths);
-+		}
-+
- 		pseudo_inited = 1;
- 	}
- 	if (!pseudo_disabled)
--- 
-1.8.5.5
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.3.bb
similarity index 57%
rename from meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.6.3.bb
index 261c8d3..867c255 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.3.bb
@@ -2,15 +2,12 @@ require pseudo.inc
 
 SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
-    file://0001-pseudo_client.c-protect-pwd_lck-against-magic.patch \
-    file://0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch \
-    file://0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch \
     file://fallback-passwd \
     file://fallback-group \
 "
 
-SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
-SRC_URI[sha256sum] = "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
+SRC_URI[md5sum] = "af84506e6ecbd9e112d3573c0f2af6d4"
+SRC_URI[sha256sum] = "2f1ace3475866d26feffa706e1bdf51ce77502091dc670c1ace4dcbb0c544faa"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8c6f06a..3c501e1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "0dc29e7c67f25d0978a7da5cd8965514912c5b36"
-PV = "1.6.2+git${SRCPV}"
+SRCREV = "01fed630e636337cfb11bea72c21d45d80a2c10e"
+PV = "1.6.3+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.1


