Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8BA7FF47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z3so2572489wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WJlOcZ8adWfKCEc7vmqt2nK0hhkXfiqND3fmA07hMLE=;
	b=sg2pmIRXKcveFx9hc+pHTqaJsejzb0F4Rb7jO1RpqPUFKLII1mOAk5Di5QVtaxTdzQ
	NWqtEsfRBodzTbieg3n9xtxyWrQ58zQQE35wYATXWo1qNIsjsuy+/e4cdAv38Wwkg01l
	xotlJg7VcnYcHfGpc/3s/eKGXDbWNNNakkCn4q71fSGr55tP4IrN8Gcuxk9T2W6imjnz
	fJSiDRg6cSiDUJCzvKXLTvQnTPUxokNiKFmKs0Uq8dBmyOVoAET6MKYraNNZTm3jHH07
	CmDq91w5Y5111syu1AVgtJvxXqBTqlw1cTmHzMbuF6fo9Zx6od4qMa6eefRs0cBw6jO6
	Fm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WJlOcZ8adWfKCEc7vmqt2nK0hhkXfiqND3fmA07hMLE=;
	b=Ugb+UstkVzuigmcj4qIZp6iX3i76Bo9QGSWM47xpI00Dov6GV/Bv2nx7qwRIZfBdUx
	a/1c+Bn3whtLpkqZsYMAkwt3HY3+XHM0vOUhw7/UCv4bMVfAkbMlPAG6HSjsqO9j0N68
	G5zgoTf3X/VlgOv32EREyAZEjOd/BZAT5aQwLxpV2O2dtipIOuzJSYIxXDUmLKs/D+Hn
	+2pS/7CfdlP/gFy0KPrzVQHEzwVdmTFGvLMvhnRhOMUWn0Wqmz6e5GTQRymzJg2UaMhU
	LVk8vzfOW10Ki9SbX9yMGcp6iGSGPHz13oAYrt2nj7EfpUXG+kKtSgYf8mEqgLxj2hrF
	2UWg==
X-Gm-Message-State: APjAAAWz96PP5ZQ7hC43+wj35TW7LT6esFir3LMPPra7SPL9o1bahhWI
	alIZX3d4ijpmFHgI2WkiKTvviEOtJXY=
X-Google-Smtp-Source: APXvYqxf/+B90FUtK3/WCHScoaYD4DnbeLNwj5wnOkHf6eFzA//uKidG8QCMGWYObfENVImeN53HDA==
X-Received: by 2002:adf:f78d:: with SMTP id q13mr3255197wrp.365.1576679892874; 
	Wed, 18 Dec 2019 06:38:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:43 +0100
Message-Id: <20191218143758.129308-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/25] shadow: update 4.6 -> 4.8
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:14 -0000

Drop two backports.

Remove 0001-useradd.c-create-parent-directories-when-necessary.patch
as upstream has addressed the issue:
https://github.com/shadow-maint/shadow/commit/b3b6d9d77c1d18b98670b97157777bb74092cd69

Rebase the rest of the paches.

Add a patch to remove the check for validity of login shells
which does not work in our environment.

Disable sssd cache support as that needs Fedora-specific tooling.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch |  18 ++-
 ...eck-for-validity-of-shell-executable.patch |  29 +++++
 ...chg-shadow-field-reproducible-re.-71.patch |  89 --------------
 ...ure.ac-fix-configure-error-with-dash.patch |  36 ------
 ...te-parent-directories-when-necessary.patch | 116 ------------------
 ...-for-setting-password-in-clear-text.patch} | 101 +++++++--------
 ...nexpected-open-failure-in-chroot-env.patch |  15 ++-
 .../files/shadow-relaxed-usernames.patch      |  51 +++++---
 meta/recipes-extended/shadow/shadow.inc       |  11 +-
 .../shadow/{shadow_4.6.bb => shadow_4.8.bb}   |   0
 10 files changed, 133 insertions(+), 333 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
 rename meta/recipes-extended/shadow/files/{allow-for-setting-password-in-clear-text.patch => 0002-Allow-for-setting-password-in-clear-text.patch} (81%)
 rename meta/recipes-extended/shadow/{shadow_4.6.bb => shadow_4.8.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index aac2d42b12a..ab317b9aa03 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,4 +1,4 @@
-From 8cf3454d567f77233023be49a39a33e9f0836f89 Mon Sep 17 00:00:00 2001
+From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Thu, 14 Apr 2016 12:28:57 +0200
 Subject: [PATCH] Disable use of syslog for sysroot
@@ -12,6 +12,7 @@ Upstream-Status: Inappropriate [disable feature]
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/groupadd.c  | 3 +++
  src/groupdel.c  | 3 +++
@@ -23,7 +24,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  7 files changed, 21 insertions(+)
 
 diff --git a/src/groupadd.c b/src/groupadd.c
-index 63e1c48..a596c49 100644
+index 2dd8eec..e9c4bb7 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
 @@ -34,6 +34,9 @@
@@ -37,7 +38,7 @@ index 63e1c48..a596c49 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/groupdel.c b/src/groupdel.c
-index 70bed01..ababd81 100644
+index f941a84..5a70056 100644
 --- a/src/groupdel.c
 +++ b/src/groupdel.c
 @@ -34,6 +34,9 @@
@@ -65,7 +66,7 @@ index fc91c8b..2842514 100644
  #include <getopt.h>
  #include <grp.h>
 diff --git a/src/groupmod.c b/src/groupmod.c
-index 72daf2c..8965f9d 100644
+index 1dca5fc..bc14438 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
 @@ -34,6 +34,9 @@
@@ -79,7 +80,7 @@ index 72daf2c..8965f9d 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/useradd.c b/src/useradd.c
-index 3aaf45c..1ab9174 100644
+index 4af0f7c..1b7bf06 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
 @@ -34,6 +34,9 @@
@@ -93,7 +94,7 @@ index 3aaf45c..1ab9174 100644
  #include <ctype.h>
  #include <errno.h>
 diff --git a/src/userdel.c b/src/userdel.c
-index c8de1d3..24d3ea9 100644
+index cc951e5..153e0be 100644
 --- a/src/userdel.c
 +++ b/src/userdel.c
 @@ -34,6 +34,9 @@
@@ -107,7 +108,7 @@ index c8de1d3..24d3ea9 100644
  #include <errno.h>
  #include <fcntl.h>
 diff --git a/src/usermod.c b/src/usermod.c
-index ccfbb99..24fb60d 100644
+index 05b9871..21c6da9 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
 @@ -34,6 +34,9 @@
@@ -120,6 +121,3 @@ index ccfbb99..24fb60d 100644
  #include <assert.h>
  #include <ctype.h>
  #include <errno.h>
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch b/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
new file mode 100644
index 00000000000..2d15ff0673a
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Do-not-check-for-validity-of-shell-executable.patch
@@ -0,0 +1,29 @@
+From 0d0aded7307a9f4ee0d299951512acd18b3e029e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 4 Dec 2019 19:28:48 +0100
+Subject: [PATCH] Do not check for validity of shell executable.
+
+This kind of check fails when building a rootfs.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/useradd.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/useradd.c b/src/useradd.c
+index 4af0f7c..898fe02 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -1328,10 +1328,7 @@ static void process_flags (int argc, char **argv)
+ 				if (   ( !VALID (optarg) )
+ 				    || (   ('\0' != optarg[0])
+ 				        && ('/'  != optarg[0])
+-				        && ('*'  != optarg[0]) )
+-				    || (stat(optarg, &st) != 0)
+-				    || (S_ISDIR(st.st_mode))
+-				    || (access(optarg, X_OK) != 0)) {
++				        && ('*'  != optarg[0]) )) {
+ 					fprintf (stderr,
+ 					         _("%s: invalid shell '%s'\n"),
+ 					         Prog, optarg);
diff --git a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch b/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
deleted file mode 100644
index de0ba3ebb42..00000000000
--- a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From fe34a2a0e44bc80ff213bfd185046a5f10c94997 Mon Sep 17 00:00:00 2001
-From: Chris Lamb <chris@chris-lamb.co.uk>
-Date: Wed, 2 Jan 2019 18:06:16 +0000
-Subject: [PATCH 1/2] Make the sp_lstchg shadow field reproducible (re. #71)
-
-From <https://github.com/shadow-maint/shadow/pull/71>:
-
-```
-The third field in the /etc/shadow file (sp_lstchg) contains the date of
-the last password change expressed as the number of days since Jan 1, 1970.
-As this is a relative time, creating a user today will result in:
-
-username:17238:0:99999:7:::
-whilst creating the same user tomorrow will result in:
-
-username:17239:0:99999:7:::
-This has an impact for the Reproducible Builds[0] project where we aim to
-be independent of as many elements the build environment as possible,
-including the current date.
-
-This patch changes the behaviour to use the SOURCE_DATE_EPOCH[1]
-environment variable (instead of Jan 1, 1970) if valid.
-```
-
-This updated PR adds some missing calls to gettime (). This was originally
-filed by Johannes Schauer in Debian as #917773 [2].
-
-[0] https://reproducible-builds.org/
-[1] https://reproducible-builds.org/specs/source-date-epoch/
-[2] https://bugs.debian.org/917773
-
-Upstream-Status: Backport
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- libmisc/pwd2spwd.c | 3 +--
- src/pwck.c         | 2 +-
- src/pwconv.c       | 2 +-
- 3 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/libmisc/pwd2spwd.c b/libmisc/pwd2spwd.c
-index c1b9b29ac873..6799dd50d490 100644
---- a/libmisc/pwd2spwd.c
-+++ b/libmisc/pwd2spwd.c
-@@ -40,7 +40,6 @@
- #include "prototypes.h"
- #include "defines.h"
- #include <pwd.h>
--extern time_t time (time_t *);
- 
- /*
-  * pwd_to_spwd - create entries for new spwd structure
-@@ -66,7 +65,7 @@ struct spwd *pwd_to_spwd (const struct passwd *pw)
- 		 */
- 		sp.sp_min = 0;
- 		sp.sp_max = (10000L * DAY) / SCALE;
--		sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
-+		sp.sp_lstchg = (long) gettime () / SCALE;
- 		if (0 == sp.sp_lstchg) {
- 			/* Better disable aging than requiring a password
- 			 * change */
-diff --git a/src/pwck.c b/src/pwck.c
-index 0ffb711efb13..f70071b12500 100644
---- a/src/pwck.c
-+++ b/src/pwck.c
-@@ -609,7 +609,7 @@ static void check_pw_file (int *errors, bool *changed)
- 					sp.sp_inact  = -1;
- 					sp.sp_expire = -1;
- 					sp.sp_flag   = SHADOW_SP_FLAG_UNSET;
--					sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
-+					sp.sp_lstchg = (long) gettime () / SCALE;
- 					if (0 == sp.sp_lstchg) {
- 						/* Better disable aging than
- 						 * requiring a password change
-diff --git a/src/pwconv.c b/src/pwconv.c
-index 9c69fa131d8e..f932f266c59c 100644
---- a/src/pwconv.c
-+++ b/src/pwconv.c
-@@ -267,7 +267,7 @@ int main (int argc, char **argv)
- 			spent.sp_flag   = SHADOW_SP_FLAG_UNSET;
- 		}
- 		spent.sp_pwdp = pw->pw_passwd;
--		spent.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
-+		spent.sp_lstchg = (long) gettime () / SCALE;
- 		if (0 == spent.sp_lstchg) {
- 			/* Better disable aging than requiring a password
- 			 * change */
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch b/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
deleted file mode 100644
index a74cbb0c0e7..00000000000
--- a/meta/recipes-extended/shadow/files/0001-configure.ac-fix-configure-error-with-dash.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3c52a84ff8775590e7e9da9c0d4408c23494305e Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 17 Jun 2019 15:36:34 +0800
-Subject: [PATCH] configure.ac: fix configure error with dash
-
-A configure error occurs when /bin/sh -> dash:
-  checking for is_selinux_enabled in -lselinux... yes
-  checking for semanage_connect in -lsemanage... yes
-  configure: 16322: test: yesyes: unexpected operator
-
-Use "=" instead of "==" since dash doesn't support this operator.
-
-Upstream-Status: Backport
-[https://github.com/shadow-maint/shadow/commit/3c52a84ff8775590e7e9da9c0d4408c23494305e]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6762556..1907afb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -500,7 +500,7 @@ if test "$with_selinux" != "no"; then
- 			AC_MSG_ERROR([libsemanage not found])
- 		fi
- 
--		if test "$selinux_lib$semanage_lib" == "yesyes" ; then
-+		if test "$selinux_lib$semanage_lib" = "yesyes" ; then
- 			AC_DEFINE(WITH_SELINUX, 1,
- 			          [Build shadow with SELinux support])
- 			LIBSELINUX="-lselinux"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
deleted file mode 100644
index faa6f68ebe2..00000000000
--- a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-Subject: [PATCH] useradd.c: create parent directories when necessary
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/useradd.c | 80 +++++++++++++++++++++++++++++++++++++++--------------------
- 1 file changed, 53 insertions(+), 27 deletions(-)
-
-diff --git a/src/useradd.c b/src/useradd.c
-index 00a3c30..9ecbb58 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -2021,6 +2021,35 @@ static void usr_update (void)
- }
- 
- /*
-+ * mkdir_p - create directories, including parent directories when needed
-+ *
-+ * similar to `mkdir -p'
-+ */
-+void mkdir_p(const char *path) {
-+	int len = strlen(path);
-+	char newdir[len + 1];
-+	mode_t mode = 0755;
-+	int i = 0;
-+
-+	if (path[i] == '\0') {
-+		return;
-+	}
-+
-+	/* skip the leading '/' */
-+	i++;
-+
-+	while(path[i] != '\0') {
-+		if (path[i] == '/') {
-+			strncpy(newdir, path, i);
-+			newdir[i] = '\0';
-+			mkdir(newdir, mode);
-+		}
-+		i++;
-+	}
-+	mkdir(path, mode);
-+}
-+
-+/*
-  * create_home - create the user's home directory
-  *
-  *	create_home() creates the user's home directory if it does not
-@@ -2038,39 +2067,36 @@ static void create_home (void)
- 			fail_exit (E_HOMEDIR);
- 		}
- #endif
--		/* XXX - create missing parent directories.  --marekm */
--		if (mkdir (prefix_user_home, 0) != 0) {
--			fprintf (stderr,
--			         _("%s: cannot create directory %s\n"),
--			         Prog, prefix_user_home);
-+		mkdir_p(user_home);
-+	}
-+	if (access (prefix_user_home, F_OK) != 0) {
- #ifdef WITH_AUDIT
--			audit_logger (AUDIT_ADD_USER, Prog,
--			              "adding home directory",
--			              user_name, (unsigned int) user_id,
--			              SHADOW_AUDIT_FAILURE);
-+		audit_logger (AUDIT_ADD_USER, Prog,
-+			      "adding home directory",
-+			      user_name, (unsigned int) user_id,
-+			      SHADOW_AUDIT_FAILURE);
- #endif
--			fail_exit (E_HOMEDIR);
--		}
--		(void) chown (prefix_user_home, user_id, user_gid);
--		chmod (prefix_user_home,
--		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
--		home_added = true;
-+		fail_exit (E_HOMEDIR);
-+	}
-+	(void) chown (prefix_user_home, user_id, user_gid);
-+	chmod (prefix_user_home,
-+	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
-+	home_added = true;
- #ifdef WITH_AUDIT
--		audit_logger (AUDIT_ADD_USER, Prog,
--		              "adding home directory",
--		              user_name, (unsigned int) user_id,
--		              SHADOW_AUDIT_SUCCESS);
-+	audit_logger (AUDIT_ADD_USER, Prog,
-+		      "adding home directory",
-+		      user_name, (unsigned int) user_id,
-+		      SHADOW_AUDIT_SUCCESS);
- #endif
- #ifdef WITH_SELINUX
--		/* Reset SELinux to create files with default contexts */
--		if (reset_selinux_file_context () != 0) {
--			fprintf (stderr,
--			         _("%s: cannot reset SELinux file creation context\n"),
--			         Prog);
--			fail_exit (E_HOMEDIR);
--		}
--#endif
-+	/* Reset SELinux to create files with default contexts */
-+	if (reset_selinux_file_context () != 0) {
-+		fprintf (stderr,
-+			 _("%s: cannot reset SELinux file creation context\n"),
-+			 Prog);
-+		fail_exit (E_HOMEDIR);
- 	}
-+#endif
- }
- 
- /*
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
similarity index 81%
rename from meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
rename to meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
index fa7eb07aa51..c6332e4f766 100644
--- a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
+++ b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
@@ -1,8 +1,12 @@
+From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sat, 16 Nov 2013 15:27:47 +0800
 Subject: [PATCH] Allow for setting password in clear text
 
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/Makefile.am |  8 ++++----
  src/groupadd.c  | 20 +++++++++++++++-----
@@ -12,39 +16,39 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  5 files changed, 64 insertions(+), 25 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 3c98a8d..b8093d5 100644
+index f31fd7a..4a317a3 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -93,10 +93,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBSELINUX) $(LIBCRYPT)
- chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
- chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT)
- gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
--groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
-+groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
- groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
- groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX)
--groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
-+groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
- grpck_LDADD    = $(LDADD) $(LIBSELINUX)
- grpconv_LDADD  = $(LDADD) $(LIBSELINUX)
- grpunconv_LDADD = $(LDADD) $(LIBSELINUX)
-@@ -117,9 +117,9 @@ su_SOURCES     = \
+@@ -103,10 +103,10 @@ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT_NOPAM)
+ chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
+ expiry_LDADD = $(LDADD) $(LIBECONF)
+ gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
+-groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
++groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
+ groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
+ groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
+-groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
++groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
+ grpck_LDADD    = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
+ grpconv_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
+ grpunconv_LDADD = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
+@@ -127,9 +127,9 @@ su_SOURCES     = \
  	suauth.c
- su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
- sulogin_LDADD  = $(LDADD) $(LIBCRYPT)
--useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
-+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
- userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE)
--usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
-+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
- vipw_LDADD     = $(LDADD) $(LIBSELINUX)
+ su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD) $(LIBECONF)
+ sulogin_LDADD  = $(LDADD) $(LIBCRYPT) $(LIBECONF)
+-useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
++useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
+ userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBECONF)
+-usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
++usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
+ vipw_LDADD     = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
  
  install-am: all-am
 diff --git a/src/groupadd.c b/src/groupadd.c
-index b57006c..63e1c48 100644
+index e9c4bb7..d572c00 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
-@@ -123,9 +123,10 @@ static /*@noreturn@*/void usage (int status)
+@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
  	                "                                (non-unique) GID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), usageout);
@@ -56,7 +60,7 @@ index b57006c..63e1c48 100644
  	(void) fputs ("\n", usageout);
  	exit (status);
  }
-@@ -387,13 +388,14 @@ static void process_flags (int argc, char **argv)
+@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
  		{"key",        required_argument, NULL, 'K'},
  		{"non-unique", no_argument,       NULL, 'o'},
  		{"password",   required_argument, NULL, 'p'},
@@ -73,7 +77,7 @@ index b57006c..63e1c48 100644
  		                 long_options, NULL)) != -1) {
  		switch (c) {
  		case 'f':
-@@ -445,12 +447,20 @@ static void process_flags (int argc, char **argv)
+@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
  			pflg = true;
  			group_passwd = optarg;
  			break;
@@ -95,7 +99,7 @@ index b57006c..63e1c48 100644
  			break;
  		default:
  			usage (E_USAGE);
-@@ -584,7 +594,7 @@ int main (int argc, char **argv)
+@@ -588,7 +598,7 @@ int main (int argc, char **argv)
  	(void) textdomain (PACKAGE);
  
  	process_root_flag ("-R", argc, argv);
@@ -105,10 +109,10 @@ index b57006c..63e1c48 100644
  	OPENLOG ("groupadd");
  #ifdef WITH_AUDIT
 diff --git a/src/groupmod.c b/src/groupmod.c
-index b293b98..72daf2c 100644
+index bc14438..25ccb44 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
-@@ -134,8 +134,9 @@ static void usage (int status)
+@@ -138,8 +138,9 @@ static void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
  	                "                                PASSWORD\n"), usageout);
@@ -119,7 +123,7 @@ index b293b98..72daf2c 100644
  	(void) fputs ("\n", usageout);
  	exit (status);
  }
-@@ -383,11 +384,12 @@ static void process_flags (int argc, char **argv)
+@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
  		{"new-name",   required_argument, NULL, 'n'},
  		{"non-unique", no_argument,       NULL, 'o'},
  		{"password",   required_argument, NULL, 'p'},
@@ -134,7 +138,7 @@ index b293b98..72daf2c 100644
  		                 long_options, NULL)) != -1) {
  		switch (c) {
  		case 'g':
-@@ -414,9 +416,17 @@ static void process_flags (int argc, char **argv)
+@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
  			group_passwd = optarg;
  			pflg = true;
  			break;
@@ -153,7 +157,7 @@ index b293b98..72daf2c 100644
  			break;
  		default:
  			usage (E_USAGE);
-@@ -757,7 +767,7 @@ int main (int argc, char **argv)
+@@ -761,7 +771,7 @@ int main (int argc, char **argv)
  	(void) textdomain (PACKAGE);
  
  	process_root_flag ("-R", argc, argv);
@@ -163,10 +167,10 @@ index b293b98..72daf2c 100644
  	OPENLOG ("groupmod");
  #ifdef WITH_AUDIT
 diff --git a/src/useradd.c b/src/useradd.c
-index c74e491..7214e72 100644
+index 1b7bf06..44f09e2 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -829,9 +829,10 @@ static void usage (int status)
+@@ -853,9 +853,10 @@ static void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
  	                "                                (non-unique) UID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
@@ -178,7 +182,7 @@ index c74e491..7214e72 100644
  	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
  	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), usageout);
  	(void) fputs (_("  -U, --user-group              create a group with the same name as the user\n"), usageout);
-@@ -1104,9 +1105,10 @@ static void process_flags (int argc, char **argv)
+@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
  			{"no-user-group",  no_argument,       NULL, 'N'},
  			{"non-unique",     no_argument,       NULL, 'o'},
  			{"password",       required_argument, NULL, 'p'},
@@ -190,7 +194,7 @@ index c74e491..7214e72 100644
  			{"shell",          required_argument, NULL, 's'},
  			{"uid",            required_argument, NULL, 'u'},
  			{"user-group",     no_argument,       NULL, 'U'},
-@@ -1117,9 +1119,9 @@ static void process_flags (int argc, char **argv)
+@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
  		};
  		while ((c = getopt_long (argc, argv,
  #ifdef WITH_SELINUX
@@ -202,7 +206,7 @@ index c74e491..7214e72 100644
  #endif				/* !WITH_SELINUX */
  		                         long_options, NULL)) != -1) {
  			switch (c) {
-@@ -1285,12 +1287,19 @@ static void process_flags (int argc, char **argv)
+@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **argv)
  				}
  				user_pass = optarg;
  				break;
@@ -223,7 +227,7 @@ index c74e491..7214e72 100644
  				break;
  			case 's':
  				if (   ( !VALID (optarg) )
-@@ -2148,7 +2157,7 @@ int main (int argc, char **argv)
+@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
  
  	process_root_flag ("-R", argc, argv);
  
@@ -233,10 +237,10 @@ index c74e491..7214e72 100644
  	OPENLOG ("useradd");
  #ifdef WITH_AUDIT
 diff --git a/src/usermod.c b/src/usermod.c
-index e571426..ccfbb99 100644
+index 21c6da9..cffdb3e 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
-@@ -424,8 +424,9 @@ static /*@noreturn@*/void usage (int status)
+@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
  	                "                                new location (use only with -d)\n"), usageout);
  	(void) fputs (_("  -o, --non-unique              allow using duplicate (non-unique) UID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       use encrypted password for the new password\n"), usageout);
@@ -247,7 +251,7 @@ index e571426..ccfbb99 100644
  	(void) fputs (_("  -s, --shell SHELL             new login shell for the user account\n"), usageout);
  	(void) fputs (_("  -u, --uid UID                 new UID for the user account\n"), usageout);
  	(void) fputs (_("  -U, --unlock                  unlock the user account\n"), usageout);
-@@ -1002,8 +1003,9 @@ static void process_flags (int argc, char **argv)
+@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
  			{"move-home",    no_argument,       NULL, 'm'},
  			{"non-unique",   no_argument,       NULL, 'o'},
  			{"password",     required_argument, NULL, 'p'},
@@ -258,16 +262,16 @@ index e571426..ccfbb99 100644
  			{"shell",        required_argument, NULL, 's'},
  			{"uid",          required_argument, NULL, 'u'},
  			{"unlock",       no_argument,       NULL, 'U'},
-@@ -1019,7 +1021,7 @@ static void process_flags (int argc, char **argv)
+@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
  			{NULL, 0, NULL, '\0'}
  		};
  		while ((c = getopt_long (argc, argv,
--		                         "ac:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
-+		                         "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
+-		                         "abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
++		                         "abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
  #ifdef ENABLE_SUBIDS
  		                         "v:w:V:W:"
  #endif				/* ENABLE_SUBIDS */
-@@ -1119,9 +1121,17 @@ static void process_flags (int argc, char **argv)
+@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
  				user_pass = optarg;
  				pflg = true;
  				break;
@@ -286,7 +290,7 @@ index e571426..ccfbb99 100644
  				break;
  			case 's':
  				if (!VALID (optarg)) {
-@@ -2098,7 +2108,7 @@ int main (int argc, char **argv)
+@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
  	(void) textdomain (PACKAGE);
  
  	process_root_flag ("-R", argc, argv);
@@ -295,6 +299,3 @@ index e571426..ccfbb99 100644
  
  	OPENLOG ("usermod");
  #ifdef WITH_AUDIT
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 4fa3d184edf..98252163692 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,3 +1,8 @@
+From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 17 Jul 2014 15:53:34 +0800
+Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
+
 Upstream-Status: Inappropriate [OE specific]
 
 commonio.c: fix unexpected open failure in chroot environment
@@ -10,15 +15,16 @@ Note that this patch doesn't change the logic in the code, it just expands
 the codes.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
- lib/commonio.c |   16 ++++++++++++----
+ lib/commonio.c | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index cc536bf..51cafd9 100644
+index 16fa7e7..d6bc297 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -613,10 +613,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
@@ -41,6 +47,3 @@ index cc536bf..51cafd9 100644
  	db->fp = NULL;
  	if (fd >= 0) {
  #ifdef WITH_TCB
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
index 1af04d5fe89..cc833362e9a 100644
--- a/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
+++ b/meta/recipes-extended/shadow/files/shadow-relaxed-usernames.patch
@@ -1,26 +1,37 @@
+From ca472d6866e545aaa70a70020e3226f236a8aafc Mon Sep 17 00:00:00 2001
+From: Shan Hai <shan.hai@windriver.com>
+Date: Tue, 13 Sep 2016 13:45:46 +0800
+Subject: [PATCH] shadow: use relaxed usernames
 
 The groupadd from shadow does not allow upper case group names, the
 same is true for the upstream shadow. But distributions like
 Debian/Ubuntu/CentOS has their own way to cope with this problem,
 this patch is picked up from CentOS release 7.0 to relax the usernames
 restrictions to allow the upper case group names, and the relaxation is
-POSIX compliant because POSIX indicate that usernames are composed of 
+POSIX compliant because POSIX indicate that usernames are composed of
 characters from the portable filename character set [A-Za-z0-9._-].
 
 Upstream-Status: Pending
 
-Signed-off-by: Shan Hai <shan.hai@windriver.com> 
+Signed-off-by: Shan Hai <shan.hai@windriver.com>
 
-diff -urpN a/libmisc/chkname.c b/libmisc/chkname.c
-index 5089112..f40a0da 100644
+---
+ libmisc/chkname.c  | 30 ++++++++++++++++++------------
+ man/groupadd.8.xml |  6 ------
+ man/useradd.8.xml  |  8 +-------
+ 3 files changed, 19 insertions(+), 25 deletions(-)
+
+diff --git a/libmisc/chkname.c b/libmisc/chkname.c
+index 90f185c..65762b4 100644
 --- a/libmisc/chkname.c
 +++ b/libmisc/chkname.c
-@@ -49,21 +49,28 @@
- static bool is_valid_name (const char *name)
- {
+@@ -55,22 +55,28 @@ static bool is_valid_name (const char *name)
+ 	}
+ 
  	/*
 -	 * User/group names must match [a-z_][a-z0-9_-]*[$]
 -	 */
+-
 -	if (('\0' == *name) ||
 -	    !((('a' <= *name) && ('z' >= *name)) || ('_' == *name))) {
 +         * User/group names must match gnu e-regex:
@@ -55,28 +66,28 @@ index 5089112..f40a0da 100644
  			return false;
  		}
  	}
-diff -urpN a/man/groupadd.8.xml b/man/groupadd.8.xml
-index 230fd0c..94f7807 100644
+diff --git a/man/groupadd.8.xml b/man/groupadd.8.xml
+index 1e58f09..d804b61 100644
 --- a/man/groupadd.8.xml
 +++ b/man/groupadd.8.xml
-@@ -222,12 +222,6 @@
+@@ -272,12 +272,6 @@
+ 
     <refsect1 id='caveats'>
       <title>CAVEATS</title>
-      <para>
+-     <para>
 -       Groupnames must start with a lower case letter or an underscore,
 -       followed by lower case letters, digits, underscores, or dashes.
 -       They can end with a dollar sign.
 -       In regular expression terms: [a-z_][a-z0-9_-]*[$]?
 -     </para>
--     <para>
+      <para>
         Groupnames may only be up to &GROUP_NAME_MAX_LENGTH; characters long.
       </para>
-      <para>
-diff -urpN a/man/useradd.8.xml b/man/useradd.8.xml
-index 5dec989..fe623b9 100644
+diff --git a/man/useradd.8.xml b/man/useradd.8.xml
+index a16d730..c0bd777 100644
 --- a/man/useradd.8.xml
 +++ b/man/useradd.8.xml
-@@ -336,7 +336,7 @@
+@@ -366,7 +366,7 @@
  	</term>
  	<listitem>
  	  <para>
@@ -85,16 +96,16 @@ index 5dec989..fe623b9 100644
  	    wide setting from <filename>/etc/login.defs</filename>
  	    (<option>CREATE_HOME</option>) is set to
  	    <replaceable>yes</replaceable>.
-@@ -607,12 +607,6 @@
+@@ -660,12 +660,6 @@
+       the user account creation request.
      </para>
  
-     <para>
+-    <para>
 -      Usernames must start with a lower case letter or an underscore,
 -      followed by lower case letters, digits, underscores, or dashes.
 -      They can end with a dollar sign.
 -      In regular expression terms: [a-z_][a-z0-9_-]*[$]?
 -    </para>
--    <para>
+     <para>
        Usernames may only be up to 32 characters long.
      </para>
-   </refsect1>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 770c239e96d..267d2324c5f 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -11,8 +11,6 @@ DEPENDS = "virtual/crypt"
 UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
-           file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
-           file://0001-configure.ac-fix-configure-error-with-dash.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
            "
@@ -24,16 +22,16 @@ SRC_URI_append_class-target = " \
 
 SRC_URI_append_class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
-           file://allow-for-setting-password-in-clear-text.patch \
+           file://0002-Allow-for-setting-password-in-clear-text.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
-           file://0001-useradd.c-create-parent-directories-when-necessary.patch \
+           file://0001-Do-not-check-for-validity-of-shell-executable.patch \
            "
 SRC_URI_append_class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
-SRC_URI[md5sum] = "36feb15665338ae3de414f2a88e434db"
-SRC_URI[sha256sum] = "4668f99bd087399c4a586084dc3b046b75f560720d83e92fd23bf7a89dda4d31"
+SRC_URI[md5sum] = "017ac773ba370bc28e157cee30dad71a"
+SRC_URI[sha256sum] = "82016d65317555fc8ce9e669eb187984d8d4b1f8ecda0769f4bc5412aed326e4"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
@@ -53,6 +51,7 @@ EXTRA_OECONF += "--without-audit \
                  --without-selinux \
                  --with-group-name-max-length=24 \
                  --enable-subordinate-ids=yes \
+                 --without-sssd \
                  ${NSCDOPT}"
 
 NSCDOPT = ""
diff --git a/meta/recipes-extended/shadow/shadow_4.6.bb b/meta/recipes-extended/shadow/shadow_4.8.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.6.bb
rename to meta/recipes-extended/shadow/shadow_4.8.bb
-- 
2.17.1


