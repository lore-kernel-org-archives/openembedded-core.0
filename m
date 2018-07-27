Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 405CC74D83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:01:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R8134P012152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:01:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:01:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 16:04:34 +0800
Message-ID: <922f0cc319620f736977a01d0cfb50786f5a57fb.1532669923.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1532669923.git.Qi.Chen@windriver.com>
References: <cover.1532669923.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] shadow: upgrade 4.2.1 -> 4.6
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
X-List-Received-Date: Fri, 27 Jul 2018 08:01:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following patches are removed because problems have been fixed in this version.
  0001-shadow-CVE-2017-12424
  fix-installation-failure-with-subids-disabled.patch
  usermod-fix-compilation-failure-with-subids-disabled.patch
  CVE-2017-2616.patch
  check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
  0001-Do-not-read-login.defs-before-doing-chroot.patch

The following patches are rebased.
  0001-Disable-use-of-syslog-for-sysroot.patch
  0001-useradd-copy-extended-attributes-of-home.patch
  0001-useradd.c-create-parent-directories-when-necessary.patch
  allow-for-setting-password-in-clear-text.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Disable-use-of-syslog-for-sysroot.patch   |  21 +--
 ...o-not-read-login.defs-before-doing-chroot.patch |  46 ------
 .../shadow/files/0001-shadow-CVE-2017-12424        |  46 ------
 ...-useradd-copy-extended-attributes-of-home.patch |  28 ++--
 ...-create-parent-directories-when-necessary.patch |  83 +++++-----
 .../shadow/files/CVE-2017-2616.patch               |  64 --------
 .../allow-for-setting-password-in-clear-text.patch | 181 ++++++++++++++++-----
 ..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch |  41 -----
 ...installation-failure-with-subids-disabled.patch |  28 ----
 ...-compilation-failure-with-subids-disabled.patch |  33 ----
 ...-securetty_4.2.1.bb => shadow-securetty_4.6.bb} |   0
 ...adow-sysroot_4.2.1.bb => shadow-sysroot_4.6.bb} |   0
 meta/recipes-extended/shadow/shadow.inc            |  13 +-
 .../shadow/{shadow_4.2.1.bb => shadow_4.6.bb}      |   0
 14 files changed, 209 insertions(+), 375 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
 delete mode 100644 meta/recipes-extended/shadow/files/CVE-2017-2616.patch
 delete mode 100644 meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
 delete mode 100644 meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
 delete mode 100644 meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
 rename meta/recipes-extended/shadow/{shadow-securetty_4.2.1.bb => shadow-securetty_4.6.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow-sysroot_4.2.1.bb => shadow-sysroot_4.6.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow_4.2.1.bb => shadow_4.6.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index a6f604b..aac2d42 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -11,6 +11,7 @@ Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/groupadd.c  | 3 +++
  src/groupdel.c  | 3 +++
@@ -22,7 +23,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  7 files changed, 21 insertions(+)
 
 diff --git a/src/groupadd.c b/src/groupadd.c
-index 39b4ec0..f716f57 100644
+index 63e1c48..a596c49 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
 @@ -34,6 +34,9 @@
@@ -36,7 +37,7 @@ index 39b4ec0..f716f57 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/groupdel.c b/src/groupdel.c
-index da99347..46a679c 100644
+index 70bed01..ababd81 100644
 --- a/src/groupdel.c
 +++ b/src/groupdel.c
 @@ -34,6 +34,9 @@
@@ -50,7 +51,7 @@ index da99347..46a679c 100644
  #include <fcntl.h>
  #include <grp.h>
 diff --git a/src/groupmems.c b/src/groupmems.c
-index e4f107f..95cb073 100644
+index fc91c8b..2842514 100644
 --- a/src/groupmems.c
 +++ b/src/groupmems.c
 @@ -32,6 +32,9 @@
@@ -64,7 +65,7 @@ index e4f107f..95cb073 100644
  #include <getopt.h>
  #include <grp.h>
 diff --git a/src/groupmod.c b/src/groupmod.c
-index d9d3807..6229737 100644
+index 72daf2c..8965f9d 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
 @@ -34,6 +34,9 @@
@@ -78,7 +79,7 @@ index d9d3807..6229737 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/useradd.c b/src/useradd.c
-index e1ebf50..25679d8 100644
+index 3aaf45c..1ab9174 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
 @@ -34,6 +34,9 @@
@@ -92,7 +93,7 @@ index e1ebf50..25679d8 100644
  #include <ctype.h>
  #include <errno.h>
 diff --git a/src/userdel.c b/src/userdel.c
-index 19b12bc..a083929 100644
+index c8de1d3..24d3ea9 100644
 --- a/src/userdel.c
 +++ b/src/userdel.c
 @@ -34,6 +34,9 @@
@@ -102,11 +103,11 @@ index 19b12bc..a083929 100644
 +/* Disable use of syslog since we're running this command against a sysroot */
 +#undef USE_SYSLOG
 +
+ #include <assert.h>
  #include <errno.h>
  #include <fcntl.h>
- #include <getopt.h>
 diff --git a/src/usermod.c b/src/usermod.c
-index 685b50a..28e5cfc 100644
+index ccfbb99..24fb60d 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
 @@ -34,6 +34,9 @@
@@ -116,9 +117,9 @@ index 685b50a..28e5cfc 100644
 +/* Disable use of syslog since we're running this command against a sysroot */
 +#undef USE_SYSLOG
 +
+ #include <assert.h>
  #include <ctype.h>
  #include <errno.h>
- #include <fcntl.h>
 -- 
-2.1.0
+2.11.0
 
diff --git a/meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch b/meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
deleted file mode 100644
index 828b95a..0000000
--- a/meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 170c25c8e0b5c3dc2615d1db94c8d24a13ff99bf Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Thu, 11 Sep 2014 15:11:23 +0200
-Subject: [PATCH] Do not read login.defs before doing chroot()
-
-If "useradd --root <root> ..." was used, the login.defs file would still
-be read from /etc/login.defs instead of <root>/etc/login.defs. This was
-due to getdef_ulong() being called before process_root_flag().
-
-Upstream-Status: Submitted [http://lists.alioth.debian.org/pipermail/pkg-shadow-devel/2014-September/010446.html]
-
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- src/useradd.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/useradd.c b/src/useradd.c
-index a8a1f76..e1ebf50 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -1993,9 +1993,11 @@ int main (int argc, char **argv)
- #endif				/* USE_PAM */
- #endif				/* ACCT_TOOLS_SETUID */
- 
-+#ifdef ENABLE_SUBIDS
- 	/* Needed for userns check */
--	uid_t uid_min = (uid_t) getdef_ulong ("UID_MIN", 1000UL);
--	uid_t uid_max = (uid_t) getdef_ulong ("UID_MAX", 60000UL);
-+	uid_t uid_min;
-+	uid_t uid_max;
-+#endif
- 
- 	/*
- 	 * Get my name so that I can use it to report errors.
-@@ -2026,6 +2028,8 @@ int main (int argc, char **argv)
- 	is_shadow_grp = sgr_file_present ();
- #endif
- #ifdef ENABLE_SUBIDS
-+	uid_min = (uid_t) getdef_ulong ("UID_MIN", 1000UL);
-+	uid_max = (uid_t) getdef_ulong ("UID_MAX", 60000UL);
- 	is_sub_uid = sub_uid_file_present () && !rflg &&
- 	    (!user_id || (user_id <= uid_max && user_id >= uid_min));
- 	is_sub_gid = sub_gid_file_present () && !rflg &&
--- 
-1.9.0
-
diff --git a/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424 b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
deleted file mode 100644
index 4d3e1e0..0000000
--- a/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
+++ /dev/null
@@ -1,46 +0,0 @@
-From 954e3d2e7113e9ac06632aee3c69b8d818cc8952 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tmraz@fedoraproject.org>
-Date: Fri, 31 Mar 2017 16:25:06 +0200
-Subject: [PATCH] Fix buffer overflow if NULL line is present in db.
-
-If ptr->line == NULL for an entry, the first cycle will exit,
-but the second one will happily write past entries buffer.
-We actually do not want to exit the first cycle prematurely
-on ptr->line == NULL.
-Signed-off-by: Tomas Mraz <tmraz@fedoraproject.org>
-
-CVE: CVE-2017-12424
-Upstream-Status: Backport
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- lib/commonio.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/commonio.c b/lib/commonio.c
-index b10da06..31edbaa 100644
---- a/lib/commonio.c
-+++ b/lib/commonio.c
-@@ -751,16 +751,16 @@ commonio_sort (struct commonio_db *db, int (*cmp) (const void *, const void *))
- 	for (ptr = db->head;
- 	        (NULL != ptr)
- #if KEEP_NIS_AT_END
--	     && (NULL != ptr->line)
--	     && (   ('+' != ptr->line[0])
--	         && ('-' != ptr->line[0]))
-+	     && ((NULL == ptr->line)
-+	         || (('+' != ptr->line[0])
-+	             && ('-' != ptr->line[0])))
- #endif
- 	     ;
- 	     ptr = ptr->next) {
- 		n++;
- 	}
- #if KEEP_NIS_AT_END
--	if ((NULL != ptr) && (NULL != ptr->line)) {
-+	if (NULL != ptr) {
- 		nis = ptr;
- 	}
- #endif
--- 
-2.1.0
-
diff --git a/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
index 60a46e1..474b3a2 100644
--- a/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
+++ b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
@@ -1,47 +1,41 @@
-From acec93540eba6899661c607408498ac72ab07a47 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jos=C3=A9=20Bollo?= <jose.bollo@iot.bzh>
-Date: Tue, 7 Mar 2017 16:03:03 +0100
 Subject: [PATCH] useradd: copy extended attributes of home
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 The Home directory wasn't getting the extended attributes
 of /etc/skel. This patch fixes that issue and adds the copy
 of the extended attributes of the root of the home directory.
 
-Upstream-Status: Submitted [http://lists.alioth.debian.org/pipermail/pkg-shadow-commits/2017-March/003804.html]
+Upstream-Status: Pending
 
-Change-Id: Icd633f7c6c494efd2a30cb8f04c306f749ad0c3b
 Signed-off-by: José Bollo <jose.bollo@iot.bzh>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/useradd.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/src/useradd.c b/src/useradd.c
-index a8a1f76..8aefb9c 100644
+index e721e52..c74e491 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -52,6 +52,9 @@
- #include <sys/stat.h>
- #include <sys/types.h>
+@@ -54,6 +54,9 @@
+ #include <sys/wait.h>
  #include <time.h>
+ #include <unistd.h>
 +#ifdef WITH_ATTR
 +#include <attr/libattr.h>
 +#endif
  #include "chkname.h"
  #include "defines.h"
  #include "faillog.h"
-@@ -1915,6 +1918,9 @@ static void create_home (void)
- 		chown (user_home, user_id, user_gid);
- 		chmod (user_home,
+@@ -2042,6 +2045,9 @@ static void create_home (void)
+ 		(void) chown (prefix_user_home, user_id, user_gid);
+ 		chmod (prefix_user_home,
  		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
 +#ifdef WITH_ATTR
-+		attr_copy_file (def_template, user_home, NULL, NULL);
++	               attr_copy_file (def_template, user_home, NULL, NULL);
 +#endif
  		home_added = true;
  #ifdef WITH_AUDIT
  		audit_logger (AUDIT_ADD_USER, Prog,
 -- 
-2.9.3
+2.11.0
 
diff --git a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
index 2f084b4..7024136 100644
--- a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
+++ b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
@@ -1,17 +1,17 @@
-Upstream-Status: Inappropriate [OE specific]
+Subject: [PATCH] useradd.c: create parent directories when necessary
 
-Subject: useradd.c: create parent directories when necessary
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/useradd.c |   72 +++++++++++++++++++++++++++++++++++++++------------------
- 1 file changed, 49 insertions(+), 23 deletions(-)
+ src/useradd.c | 82 +++++++++++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 54 insertions(+), 28 deletions(-)
 
 diff --git a/src/useradd.c b/src/useradd.c
-index 4bd969d..cb5dd6c 100644
+index 7214e72..3aaf45c 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -1896,6 +1896,35 @@ static void usr_update (void)
+@@ -2021,6 +2021,35 @@ static void usr_update (void)
  }
  
  /*
@@ -47,63 +47,68 @@ index 4bd969d..cb5dd6c 100644
   * create_home - create the user's home directory
   *
   *	create_home() creates the user's home directory if it does not
-@@ -1910,39 +1939,36 @@ static void create_home (void)
+@@ -2038,42 +2067,39 @@ static void create_home (void)
  			fail_exit (E_HOMEDIR);
  		}
  #endif
 -		/* XXX - create missing parent directories.  --marekm */
--		if (mkdir (user_home, 0) != 0) {
+-		if (mkdir (prefix_user_home, 0) != 0) {
 -			fprintf (stderr,
 -			         _("%s: cannot create directory %s\n"),
--			         Prog, user_home);
--#ifdef WITH_AUDIT
+-			         Prog, prefix_user_home);
++		mkdir_p(user_home);
++	}
++	if (access (prefix_user_home, F_OK) != 0) {
+ #ifdef WITH_AUDIT
 -			audit_logger (AUDIT_ADD_USER, Prog,
 -			              "adding home directory",
 -			              user_name, (unsigned int) user_id,
 -			              SHADOW_AUDIT_FAILURE);
--#endif
--			fail_exit (E_HOMEDIR);
--		}
--		chown (user_home, user_id, user_gid);
--		chmod (user_home,
--		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
--#ifdef WITH_ATTR
--		attr_copy_file (def_template, user_home, NULL, NULL);
--#endif
--		home_added = true;
-+		mkdir_p(user_home);
-+	}
-+	if (access (user_home, F_OK) != 0) {
- #ifdef WITH_AUDIT
- 		audit_logger (AUDIT_ADD_USER, Prog,
- 		              "adding home directory",
- 		              user_name, (unsigned int) user_id,
--		              SHADOW_AUDIT_SUCCESS);
-+		              SHADOW_AUDIT_FAILURE);
++		audit_logger (AUDIT_ADD_USER, Prog,
++			      "adding home directory",
++			      user_name, (unsigned int) user_id,
++			      SHADOW_AUDIT_FAILURE);
  #endif
--#ifdef WITH_SELINUX
--		/* Reset SELinux to create files with default contexts */
--		if (reset_selinux_file_context () != 0) {
 -			fail_exit (E_HOMEDIR);
 -		}
+-		(void) chown (prefix_user_home, user_id, user_gid);
+-		chmod (prefix_user_home,
+-		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
 +		fail_exit (E_HOMEDIR);
 +	}
-+	chown (user_home, user_id, user_gid);
-+	chmod (user_home,
++	(void) chown (prefix_user_home, user_id, user_gid);
++	chmod (prefix_user_home,
 +	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
-+#ifdef WITH_ATTR
+ #ifdef WITH_ATTR
+-	               attr_copy_file (def_template, user_home, NULL, NULL);
 +	attr_copy_file (def_template, user_home, NULL, NULL);
-+#endif
+ #endif
+-		home_added = true;
 +	home_added = true;
-+#ifdef WITH_AUDIT
+ #ifdef WITH_AUDIT
+-		audit_logger (AUDIT_ADD_USER, Prog,
+-		              "adding home directory",
+-		              user_name, (unsigned int) user_id,
+-		              SHADOW_AUDIT_SUCCESS);
 +	audit_logger (AUDIT_ADD_USER, Prog,
 +		      "adding home directory",
 +		      user_name, (unsigned int) user_id,
 +		      SHADOW_AUDIT_SUCCESS);
  #endif
-+#ifdef WITH_SELINUX
+ #ifdef WITH_SELINUX
+-		/* Reset SELinux to create files with default contexts */
+-		if (reset_selinux_file_context () != 0) {
+-			fprintf (stderr,
+-			         _("%s: cannot reset SELinux file creation context\n"),
+-			         Prog);
+-			fail_exit (E_HOMEDIR);
+-		}
+-#endif
 +	/* Reset SELinux to create files with default contexts */
 +	if (reset_selinux_file_context () != 0) {
++		fprintf (stderr,
++			 _("%s: cannot reset SELinux file creation context\n"),
++			 Prog);
 +		fail_exit (E_HOMEDIR);
  	}
 +#endif
@@ -111,5 +116,5 @@ index 4bd969d..cb5dd6c 100644
  
  /*
 -- 
-1.7.9.5
+2.11.0
 
diff --git a/meta/recipes-extended/shadow/files/CVE-2017-2616.patch b/meta/recipes-extended/shadow/files/CVE-2017-2616.patch
deleted file mode 100644
index ee728f0..0000000
--- a/meta/recipes-extended/shadow/files/CVE-2017-2616.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-shadow-4.2.1: Fix CVE-2017-2616
-
-[No upstream tracking] -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=855943
-
-su: properly clear child PID
-
-If su is compiled with PAM support, it is possible for any local user
-to send SIGKILL to other processes with root privileges. There are
-only two conditions. First, the user must be able to perform su with
-a successful login. This does NOT have to be the root user, even using
-su with the same id is enough, e.g. "su $(whoami)". Second, SIGKILL
-can only be sent to processes which were executed after the su process.
-It is not possible to send SIGKILL to processes which were already
-running. I consider this as a security vulnerability, because I was
-able to write a proof of concept which unlocked a screen saver of
-another user this way.
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/08fd4b69e84364677a10e519ccb25b71710ee686]
-CVE: CVE-2017-2616
-bug: 855943
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/src/su.c b/src/su.c
-index 3704217..1efcd61 100644
---- a/src/su.c
-+++ b/src/su.c
-@@ -363,20 +363,35 @@ static void prepare_pam_close_session (void)
- 				/* wake child when resumed */
- 				kill (pid, SIGCONT);
- 				stop = false;
-+			} else {
-+				pid_child = 0;
- 			}
- 		} while (!stop);
- 	}
- 
--	if (0 != caught) {
-+	if (0 != caught && 0 != pid_child) {
- 		(void) fputs ("\n", stderr);
- 		(void) fputs (_("Session terminated, terminating shell..."),
- 		              stderr);
- 		(void) kill (-pid_child, caught);
- 
- 		(void) signal (SIGALRM, kill_child);
-+		(void) signal (SIGCHLD, catch_signals);
- 		(void) alarm (2);
- 
--		(void) wait (&status);
-+		sigemptyset (&ourset);
-+		if ((sigaddset (&ourset, SIGALRM) != 0)
-+		    || (sigprocmask (SIG_BLOCK, &ourset, NULL) != 0)) {
-+			fprintf (stderr, _("%s: signal masking malfunction\n"), Prog);
-+			kill_child (0);
-+		} else {
-+			while (0 == waitpid (pid_child, &status, WNOHANG)) {
-+				sigsuspend (&ourset);
-+			}
-+			pid_child = 0;
-+			(void) sigprocmask (SIG_UNBLOCK, &ourset, NULL);
-+		}
-+
- 		(void) fputs (_(" ...terminated.\n"), stderr);
- 	}
- 
diff --git a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
index 615c6e0..fa7eb07 100644
--- a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
+++ b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
@@ -1,21 +1,21 @@
-Upstream-Status: Inappropriate [OE specific]
+Subject: [PATCH] Allow for setting password in clear text
 
-Allow for setting password in clear text.
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/Makefile.am |    8 ++++----
- src/groupadd.c  |    8 +++++++-
- src/groupmod.c  |    8 +++++++-
- src/useradd.c   |    9 +++++++--
- src/usermod.c   |    8 +++++++-
- 5 files changed, 32 insertions(+), 9 deletions(-)
+ src/Makefile.am |  8 ++++----
+ src/groupadd.c  | 20 +++++++++++++++-----
+ src/groupmod.c  | 20 +++++++++++++++-----
+ src/useradd.c   | 21 +++++++++++++++------
+ src/usermod.c   | 20 +++++++++++++++-----
+ 5 files changed, 64 insertions(+), 25 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 25e288d..856b087 100644
+index 3c98a8d..b8093d5 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -88,10 +88,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBSELINUX) $(LIBCRYPT)
+@@ -93,10 +93,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBSELINUX) $(LIBCRYPT)
  chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
  chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT)
  gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
@@ -28,9 +28,9 @@ index 25e288d..856b087 100644
  grpck_LDADD    = $(LDADD) $(LIBSELINUX)
  grpconv_LDADD  = $(LDADD) $(LIBSELINUX)
  grpunconv_LDADD = $(LDADD) $(LIBSELINUX)
-@@ -111,9 +111,9 @@ su_SOURCES     = \
+@@ -117,9 +117,9 @@ su_SOURCES     = \
  	suauth.c
- su_LDADD       = $(LDADD) $(LIBPAM) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
+ su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
  sulogin_LDADD  = $(LDADD) $(LIBCRYPT)
 -useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
 +useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
@@ -41,33 +41,39 @@ index 25e288d..856b087 100644
  
  install-am: all-am
 diff --git a/src/groupadd.c b/src/groupadd.c
-index f716f57..4e28c26 100644
+index b57006c..63e1c48 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
-@@ -124,6 +124,7 @@ static /*@noreturn@*/void usage (int status)
+@@ -123,9 +123,10 @@ static /*@noreturn@*/void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
  	                "                                (non-unique) GID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), usageout);
 +	(void) fputs (_("  -P, --clear-password PASSWORD use this clear password for the new group\n"), usageout);
  	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
  	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
+-	(void) fputs (_("  -P, --prefix PREFIX_DIR       directory prefix\n"), usageout);
++	(void) fputs (_("  -A, --prefix PREFIX_DIR       directory prefix\n"), usageout);
  	(void) fputs ("\n", usageout);
-@@ -387,12 +388,13 @@ static void process_flags (int argc, char **argv)
+ 	exit (status);
+ }
+@@ -387,13 +388,14 @@ static void process_flags (int argc, char **argv)
  		{"key",        required_argument, NULL, 'K'},
  		{"non-unique", no_argument,       NULL, 'o'},
  		{"password",   required_argument, NULL, 'p'},
 +		{"clear-password", required_argument, NULL, 'P'},
  		{"system",     no_argument,       NULL, 'r'},
  		{"root",       required_argument, NULL, 'R'},
+-		{"prefix",     required_argument, NULL, 'P'},
++		{"prefix",     required_argument, NULL, 'A'},
  		{NULL, 0, NULL, '\0'}
  	};
  
--	while ((c = getopt_long (argc, argv, "fg:hK:op:rR:",
-+	while ((c = getopt_long (argc, argv, "fg:hK:op:P:rR:",
+-	while ((c = getopt_long (argc, argv, "fg:hK:op:rR:P:",
++	while ((c = getopt_long (argc, argv, "fg:hK:op:P:rR:A:",
  		                 long_options, NULL)) != -1) {
  		switch (c) {
  		case 'f':
-@@ -444,6 +446,10 @@ static void process_flags (int argc, char **argv)
+@@ -445,12 +447,20 @@ static void process_flags (int argc, char **argv)
  			pflg = true;
  			group_passwd = optarg;
  			break;
@@ -78,32 +84,57 @@ index f716f57..4e28c26 100644
  		case 'r':
  			rflg = true;
  			break;
+ 		case 'R': /* no-op, handled in process_root_flag () */
+ 			break;
+-		case 'P': /* no-op, handled in process_prefix_flag () */
++		case 'A': /* no-op, handled in process_prefix_flag () */
++			fprintf (stderr,
++				 _("%s: -A is deliberately not supported \n"),
++				 Prog);
++			exit (E_BAD_ARG);
+ 			break;
+ 		default:
+ 			usage (E_USAGE);
+@@ -584,7 +594,7 @@ int main (int argc, char **argv)
+ 	(void) textdomain (PACKAGE);
+ 
+ 	process_root_flag ("-R", argc, argv);
+-	prefix = process_prefix_flag ("-P", argc, argv);
++	prefix = process_prefix_flag ("-A", argc, argv);
+ 
+ 	OPENLOG ("groupadd");
+ #ifdef WITH_AUDIT
 diff --git a/src/groupmod.c b/src/groupmod.c
-index d9d3807..68f49d1 100644
+index b293b98..72daf2c 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
-@@ -127,6 +127,7 @@ static void usage (int status)
+@@ -134,8 +134,9 @@ static void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
  	                "                                PASSWORD\n"), usageout);
 +	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this clear PASSWORD\n"), usageout);
  	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
+-	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
++	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
  	(void) fputs ("\n", usageout);
  	exit (status);
-@@ -375,10 +376,11 @@ static void process_flags (int argc, char **argv)
+ }
+@@ -383,11 +384,12 @@ static void process_flags (int argc, char **argv)
  		{"new-name",   required_argument, NULL, 'n'},
  		{"non-unique", no_argument,       NULL, 'o'},
  		{"password",   required_argument, NULL, 'p'},
 +		{"clear-password", required_argument, NULL, 'P'},
  		{"root",       required_argument, NULL, 'R'},
+-		{"prefix",     required_argument, NULL, 'P'},
++		{"prefix",     required_argument, NULL, 'A'},
  		{NULL, 0, NULL, '\0'}
  	};
--	while ((c = getopt_long (argc, argv, "g:hn:op:R:",
-+	while ((c = getopt_long (argc, argv, "g:hn:op:P:R:",
+-	while ((c = getopt_long (argc, argv, "g:hn:op:R:P:",
++	while ((c = getopt_long (argc, argv, "g:hn:op:P:R:A:",
  		                 long_options, NULL)) != -1) {
  		switch (c) {
  		case 'g':
-@@ -405,6 +407,10 @@ static void process_flags (int argc, char **argv)
+@@ -414,9 +416,17 @@ static void process_flags (int argc, char **argv)
  			group_passwd = optarg;
  			pflg = true;
  			break;
@@ -113,40 +144,65 @@ index d9d3807..68f49d1 100644
 +			break;
  		case 'R': /* no-op, handled in process_root_flag () */
  			break;
+-		case 'P': /* no-op, handled in process_prefix_flag () */
++		case 'A': /* no-op, handled in process_prefix_flag () */
++			fprintf (stderr,
++				 _("%s: -A is deliberately not supported \n"),
++				 Prog);
++			exit (E_BAD_ARG);
+ 			break;
  		default:
+ 			usage (E_USAGE);
+@@ -757,7 +767,7 @@ int main (int argc, char **argv)
+ 	(void) textdomain (PACKAGE);
+ 
+ 	process_root_flag ("-R", argc, argv);
+-	prefix = process_prefix_flag ("-P", argc, argv);
++	prefix = process_prefix_flag ("-A", argc, argv);
+ 
+ 	OPENLOG ("groupmod");
+ #ifdef WITH_AUDIT
 diff --git a/src/useradd.c b/src/useradd.c
-index b3bd451..4416f90 100644
+index c74e491..7214e72 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -776,6 +776,7 @@ static void usage (int status)
+@@ -829,9 +829,10 @@ static void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
  	                "                                (non-unique) UID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
 +	(void) fputs (_("  -P, --clear-password PASSWORD clear password of the new account\n"), usageout);
  	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
  	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
+-	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
++	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
  	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
-@@ -1050,6 +1051,7 @@ static void process_flags (int argc, char **argv)
+ 	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), usageout);
+ 	(void) fputs (_("  -U, --user-group              create a group with the same name as the user\n"), usageout);
+@@ -1104,9 +1105,10 @@ static void process_flags (int argc, char **argv)
  			{"no-user-group",  no_argument,       NULL, 'N'},
  			{"non-unique",     no_argument,       NULL, 'o'},
  			{"password",       required_argument, NULL, 'p'},
 +			{"clear-password", required_argument, NULL, 'P'},
  			{"system",         no_argument,       NULL, 'r'},
  			{"root",           required_argument, NULL, 'R'},
+-			{"prefix",         required_argument, NULL, 'P'},
++			{"prefix",         required_argument, NULL, 'A'},
  			{"shell",          required_argument, NULL, 's'},
-@@ -1062,9 +1064,9 @@ static void process_flags (int argc, char **argv)
+ 			{"uid",            required_argument, NULL, 'u'},
+ 			{"user-group",     no_argument,       NULL, 'U'},
+@@ -1117,9 +1119,9 @@ static void process_flags (int argc, char **argv)
  		};
  		while ((c = getopt_long (argc, argv,
  #ifdef WITH_SELINUX
--		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:s:u:UZ:",
-+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:s:u:UZ:",
+-		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:UZ:",
++		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:UZ:",
  #else				/* !WITH_SELINUX */
--		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:s:u:U",
-+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:s:u:U",
+-		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U",
++		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:U",
  #endif				/* !WITH_SELINUX */
  		                         long_options, NULL)) != -1) {
  			switch (c) {
-@@ -1230,6 +1232,9 @@ static void process_flags (int argc, char **argv)
+@@ -1285,12 +1287,19 @@ static void process_flags (int argc, char **argv)
  				}
  				user_pass = optarg;
  				break;
@@ -156,36 +212,62 @@ index b3bd451..4416f90 100644
  			case 'r':
  				rflg = true;
  				break;
+ 			case 'R': /* no-op, handled in process_root_flag () */
+ 				break;
+-			case 'P': /* no-op, handled in process_prefix_flag () */
++			case 'A': /* no-op, handled in process_prefix_flag () */
++				fprintf (stderr,
++					 _("%s: -A is deliberately not supported \n"),
++					 Prog);
++				exit (E_BAD_ARG);
+ 				break;
+ 			case 's':
+ 				if (   ( !VALID (optarg) )
+@@ -2148,7 +2157,7 @@ int main (int argc, char **argv)
+ 
+ 	process_root_flag ("-R", argc, argv);
+ 
+-	prefix = process_prefix_flag("-P", argc, argv);
++	prefix = process_prefix_flag("-A", argc, argv);
+ 
+ 	OPENLOG ("useradd");
+ #ifdef WITH_AUDIT
 diff --git a/src/usermod.c b/src/usermod.c
-index e7d4351..b79f7a3 100644
+index e571426..ccfbb99 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
-@@ -419,6 +419,7 @@ static /*@noreturn@*/void usage (int status)
+@@ -424,8 +424,9 @@ static /*@noreturn@*/void usage (int status)
  	                "                                new location (use only with -d)\n"), usageout);
  	(void) fputs (_("  -o, --non-unique              allow using duplicate (non-unique) UID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       use encrypted password for the new password\n"), usageout);
 +	(void) fputs (_("  -P, --clear-password PASSWORD use clear password for the new password\n"), usageout);
  	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
+-	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
++	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
  	(void) fputs (_("  -s, --shell SHELL             new login shell for the user account\n"), usageout);
  	(void) fputs (_("  -u, --uid UID                 new UID for the user account\n"), usageout);
-@@ -996,6 +997,7 @@ static void process_flags (int argc, char **argv)
+ 	(void) fputs (_("  -U, --unlock                  unlock the user account\n"), usageout);
+@@ -1002,8 +1003,9 @@ static void process_flags (int argc, char **argv)
  			{"move-home",    no_argument,       NULL, 'm'},
  			{"non-unique",   no_argument,       NULL, 'o'},
  			{"password",     required_argument, NULL, 'p'},
 +			{"clear-password", required_argument, NULL, 'P'},
  			{"root",         required_argument, NULL, 'R'},
+-			{"prefix",       required_argument, NULL, 'P'},
++			{"prefix",       required_argument, NULL, 'A'},
  			{"shell",        required_argument, NULL, 's'},
  			{"uid",          required_argument, NULL, 'u'},
-@@ -1012,7 +1014,7 @@ static void process_flags (int argc, char **argv)
+ 			{"unlock",       no_argument,       NULL, 'U'},
+@@ -1019,7 +1021,7 @@ static void process_flags (int argc, char **argv)
  			{NULL, 0, NULL, '\0'}
  		};
  		while ((c = getopt_long (argc, argv,
--		                         "ac:d:e:f:g:G:hl:Lmop:R:s:u:U"
-+		                         "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:U"
+-		                         "ac:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
++		                         "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
  #ifdef ENABLE_SUBIDS
  		                         "v:w:V:W:"
  #endif				/* ENABLE_SUBIDS */
-@@ -1112,6 +1114,10 @@ static void process_flags (int argc, char **argv)
+@@ -1119,9 +1121,17 @@ static void process_flags (int argc, char **argv)
  				user_pass = optarg;
  				pflg = true;
  				break;
@@ -195,7 +277,24 @@ index e7d4351..b79f7a3 100644
 +				break;
  			case 'R': /* no-op, handled in process_root_flag () */
  				break;
+-			case 'P': /* no-op, handled in process_prefix_flag () */
++			case 'A': /* no-op, handled in process_prefix_flag () */
++				fprintf (stderr,
++					 _("%s: -A is deliberately not supported \n"),
++					 Prog);
++				exit (E_BAD_ARG);
+ 				break;
  			case 's':
+ 				if (!VALID (optarg)) {
+@@ -2098,7 +2108,7 @@ int main (int argc, char **argv)
+ 	(void) textdomain (PACKAGE);
+ 
+ 	process_root_flag ("-R", argc, argv);
+-	prefix = process_prefix_flag ("-P", argc, argv);
++	prefix = process_prefix_flag ("-A", argc, argv);
+ 
+ 	OPENLOG ("usermod");
+ #ifdef WITH_AUDIT
 -- 
-1.7.9.5
+2.11.0
 
diff --git a/meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch b/meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
deleted file mode 100644
index 185590c..0000000
--- a/meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2cb54158b80cdbd97ca3b36df83f9255e923ae3f Mon Sep 17 00:00:00 2001
-From: James Le Cuirot <chewi@aura-online.co.uk>
-Date: Sat, 23 Aug 2014 09:46:39 +0100
-Subject: [PATCH] Check size of uid_t and gid_t using AC_CHECK_SIZEOF
-
-This built-in check is simpler than the previous method and, most
-importantly, works when cross-compiling.
-
-Upstream-Status: Accepted
-[https://github.com/shadow-maint/shadow/commit/2cb54158b80cdbd97ca3b36df83f9255e923ae3f]
-
-Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
----
- configure.in | 14 ++++----------
- 1 file changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 1a3f841..4a4d6d0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -335,16 +335,10 @@ if test "$enable_subids" != "no"; then
- 	dnl
- 	dnl FIXME: check if 32 bit UIDs/GIDs are supported by libc
- 	dnl
--	AC_RUN_IFELSE([AC_LANG_SOURCE([
--#include <sys/types.h>
--int main(void) {
--	uid_t u;
--	gid_t g;
--	return (sizeof u < 4) || (sizeof g < 4);
--}
--	])], [id32bit="yes"], [id32bit="no"])
--
--	if test "x$id32bit" = "xyes"; then
-+	AC_CHECK_SIZEOF([uid_t],, [#include "sys/types.h"])
-+	AC_CHECK_SIZEOF([gid_t],, [#include "sys/types.h"])
-+
-+	if test "$ac_cv_sizeof_uid_t" -ge 4 && test "$ac_cv_sizeof_gid_t" -ge 4; then
- 		AC_DEFINE(ENABLE_SUBIDS, 1, [Define to support the subordinate IDs.])
- 		enable_subids="yes"
- 	else
diff --git a/meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch b/meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
deleted file mode 100644
index 02cb91a..0000000
--- a/meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Subject: fix installation failure with subids disabled
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/Makefile.am |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 25e288d..076f8ef 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -52,7 +52,10 @@ usbin_PROGRAMS = \
- noinst_PROGRAMS = id sulogin
- 
- suidbins       = su
--suidubins      = chage chfn chsh expiry gpasswd newgrp passwd newuidmap newgidmap
-+suidubins      = chage chfn chsh expiry gpasswd newgrp passwd
-+if ENABLE_SUBIDS
-+suidubins += newgidmap newuidmap
-+endif
- if ACCT_TOOLS_SETUID
- 	suidubins += chage chgpasswd chpasswd groupadd groupdel groupmod newusers useradd userdel usermod
- endif
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch b/meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
deleted file mode 100644
index 37dc153..0000000
--- a/meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-usermod: fix compilation failure with subids disabled
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/usermod.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/usermod.c b/src/usermod.c
-index e7d4351..685b50a 100644
---- a/src/usermod.c
-+++ b/src/usermod.c
-@@ -1360,7 +1360,7 @@ static void process_flags (int argc, char **argv)
- 		         Prog, (unsigned long) user_newid);
- 		exit (E_UID_IN_USE);
- 	}
--
-+#ifdef ENABLE_SUBIDS
- 	if (   (vflg || Vflg)
- 	    && !is_sub_uid) {
- 		fprintf (stderr,
-@@ -1376,6 +1376,7 @@ static void process_flags (int argc, char **argv)
- 		         Prog, sub_gid_dbname (), "-w", "-W");
- 		exit (E_USAGE);
- 	}
-+#endif
- }
- 
- /*
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb
rename to meta/recipes-extended/shadow/shadow-securetty_4.6.bb
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb
rename to meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 6efe4a9..0fa80a2 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -9,16 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
 DEPENDS = "virtual/crypt"
 
 UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
-
-SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.xz \
+SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
-           file://usermod-fix-compilation-failure-with-subids-disabled.patch \
-           file://fix-installation-failure-with-subids-disabled.patch \
-           file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
-           file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
-           file://0001-shadow-CVE-2017-12424 \
-           file://CVE-2017-2616.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
@@ -38,8 +31,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
-SRC_URI[md5sum] = "2bfafe7d4962682d31b5eba65dba4fc8"
-SRC_URI[sha256sum] = "3b0893d1476766868cd88920f4f1231c4795652aa407569faff802bcda0f3d41"
+SRC_URI[md5sum] = "36feb15665338ae3de414f2a88e434db"
+SRC_URI[sha256sum] = "4668f99bd087399c4a586084dc3b046b75f560720d83e92fd23bf7a89dda4d31"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.2.1.bb b/meta/recipes-extended/shadow/shadow_4.6.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.2.1.bb
rename to meta/recipes-extended/shadow/shadow_4.6.bb
-- 
1.9.1


