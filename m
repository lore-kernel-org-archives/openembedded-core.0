Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qbgx4-0003Pl-Dp
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 00:40:14 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B0E3930505;
	Tue, 28 Jun 2011 18:36:27 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 15:36:18 -0700
Message-Id: <ef57f9bd8c49d62485143af9010fc8ea482d61e9.1309300395.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309300395.git.scott.a.garman@intel.com>
References: <cover.1309300395.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1309300395.git.scott.a.garman@intel.com>
References: <cover.1309300395.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B0E3930505.2DB76
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/1] shadow-native: fix creation of home directories
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
X-List-Received-Date: Tue, 28 Jun 2011 22:40:14 -0000

Pseudo was recently changed so that when system() calls are
made after a chroot(), the host binaries can no longer be found,
breaking the system("mkdir -p") approach when useradd creates
home directories.

Instead, use mkdir(2) to create home directories with a helper
function to ensure parent directories get created.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../shadow/files/add_root_cmd_options.patch        |  125 +++++++++++++++----
 1 files changed, 98 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
index db969bb..c5f2bec 100644
--- a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
+++ b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
@@ -27,7 +27,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
 --- shadow-4.1.4.3.orig//src/gpasswd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/gpasswd.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/gpasswd.c	2011-06-28 15:12:03.539504372 -0700
 @@ -63,6 +63,7 @@
   * (/etc/gshadow present) */
  static bool is_shadowgrp;
@@ -146,7 +146,7 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
  #endif
 diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3//src/groupadd.c
 --- shadow-4.1.4.3.orig//src/groupadd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/groupadd.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/groupadd.c	2011-06-28 15:12:03.539504372 -0700
 @@ -76,6 +76,7 @@
  static gid_t group_id;
  static /*@null@*/char *group_passwd;
@@ -209,7 +209,7 @@ diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3//src/groupadd.c
  			break;
 diff -urN shadow-4.1.4.3.orig//src/groupdel.c shadow-4.1.4.3//src/groupdel.c
 --- shadow-4.1.4.3.orig//src/groupdel.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/groupdel.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/groupdel.c	2011-06-28 15:12:03.539504372 -0700
 @@ -36,6 +36,7 @@
  
  #include <ctype.h>
@@ -341,7 +341,7 @@ diff -urN shadow-4.1.4.3.orig//src/groupdel.c shadow-4.1.4.3//src/groupdel.c
  	{
 diff -urN shadow-4.1.4.3.orig//src/groupmod.c shadow-4.1.4.3//src/groupmod.c
 --- shadow-4.1.4.3.orig//src/groupmod.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/groupmod.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/groupmod.c	2011-06-28 15:12:03.539504372 -0700
 @@ -79,6 +79,7 @@
  static char *group_passwd;
  static gid_t group_id;
@@ -402,7 +402,7 @@ diff -urN shadow-4.1.4.3.orig//src/groupmod.c shadow-4.1.4.3//src/groupmod.c
  		}
 diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
 --- shadow-4.1.4.3.orig//src/grpconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/grpconv.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/grpconv.c	2011-06-28 15:12:03.539504372 -0700
 @@ -39,6 +39,7 @@
  
  #include <errno.h>
@@ -528,7 +528,7 @@ diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
  		         _("%s: cannot lock %s; try again later.\n"),
 diff -urN shadow-4.1.4.3.orig//src/grpunconv.c shadow-4.1.4.3//src/grpunconv.c
 --- shadow-4.1.4.3.orig//src/grpunconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/grpunconv.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/grpunconv.c	2011-06-28 15:12:03.539504372 -0700
 @@ -43,6 +43,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -654,7 +654,7 @@ diff -urN shadow-4.1.4.3.orig//src/grpunconv.c shadow-4.1.4.3//src/grpunconv.c
  	}
 diff -urN shadow-4.1.4.3.orig//src/passwd.c shadow-4.1.4.3//src/passwd.c
 --- shadow-4.1.4.3.orig//src/passwd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/passwd.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/passwd.c	2011-06-28 15:12:03.539504372 -0700
 @@ -75,6 +75,7 @@
  static char *name;		/* The name of user whose password is being changed */
  static char *myname;		/* The current user's name */
@@ -719,7 +719,7 @@ diff -urN shadow-4.1.4.3.orig//src/passwd.c shadow-4.1.4.3//src/passwd.c
  				/* only "files" supported for now */
 diff -urN shadow-4.1.4.3.orig//src/pwconv.c shadow-4.1.4.3//src/pwconv.c
 --- shadow-4.1.4.3.orig//src/pwconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/pwconv.c	2011-05-28 17:09:52.346013331 -0700
++++ shadow-4.1.4.3//src/pwconv.c	2011-06-28 15:12:03.539504372 -0700
 @@ -59,6 +59,7 @@
  
  #include <errno.h>
@@ -848,7 +848,7 @@ diff -urN shadow-4.1.4.3.orig//src/pwconv.c shadow-4.1.4.3//src/pwconv.c
  		         _("%s: cannot lock %s; try again later.\n"),
 diff -urN shadow-4.1.4.3.orig//src/pwunconv.c shadow-4.1.4.3//src/pwunconv.c
 --- shadow-4.1.4.3.orig//src/pwunconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/pwunconv.c	2011-05-28 17:09:52.356013600 -0700
++++ shadow-4.1.4.3//src/pwunconv.c	2011-06-28 15:12:03.539504372 -0700
 @@ -35,6 +35,7 @@
  #ident "$Id: pwunconv.c 2852 2009-04-30 21:44:35Z nekral-guest $"
  
@@ -970,7 +970,7 @@ diff -urN shadow-4.1.4.3.orig//src/pwunconv.c shadow-4.1.4.3//src/pwunconv.c
  		exit (0);
 diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
 --- shadow-4.1.4.3.orig//src/useradd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/useradd.c	2011-05-28 17:10:25.446909971 -0700
++++ shadow-4.1.4.3//src/useradd.c	2011-06-28 15:12:14.608787030 -0700
 @@ -112,6 +112,7 @@
  #ifdef WITH_SELINUX
  static const char *user_selinux = "";
@@ -1085,26 +1085,97 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  			case 'r':
  				rflg = true;
  				break;
-@@ -1748,8 +1808,16 @@
+@@ -1735,6 +1795,36 @@
+ 	}
+ }
+ #endif
++
++/*
++ * mkdir_p - create directories, including parent directories when needed
++ *
++ * similar to mkdir -p
++ */
++void mkdir_p(const char *path) {
++	int len = strlen(path);
++	char newdir[len + 1];
++	mode_t mode = 0755;
++	int i = 0;
++
++	if (path[i] == '\0') {
++		return;
++	}
++
++	/* skip the leading '/' */
++	i++;
++
++	while(path[i] != '\0') {
++		if (path[i] == '/') {
++			strncpy(newdir, path, i);
++			newdir[i] = '\0';
++			mkdir(newdir, mode);
++		}
++		i++;
++	}
++	mkdir(path, mode);
++}
++
+ /*
+  * create_home - create the user's home directory
+  *
+@@ -1748,34 +1838,31 @@
  #ifdef WITH_SELINUX
  		selinux_file_context (user_home);
  #endif
 -		/* XXX - create missing parent directories.  --marekm */
 -		if (mkdir (user_home, 0) != 0) {
-+		/* shell out to invoke mkdir -p 
-+		 * creating a subshell under pseudo's chroot() breaks the jail
-+		 * (bug in pseudo), so make sure we include the full host path
-+		 * to the sysroot when the --root option is in use.
-+		 */
-+		int sysroot_path_len = strlen(newroot);
-+		int home_path_len = strlen(user_home);
-+		char cmd[sysroot_path_len + home_path_len + 10];
-+		sprintf(cmd, "mkdir -p %s%s", newroot, user_home);
-+		if (system (cmd) != 0) {
- 			fprintf (stderr,
- 			         _("%s: cannot create directory %s\n"),
- 			         Prog, user_home);
-@@ -1861,6 +1929,7 @@
+-			fprintf (stderr,
+-			         _("%s: cannot create directory %s\n"),
+-			         Prog, user_home);
+-#ifdef WITH_AUDIT
+-			audit_logger (AUDIT_ADD_USER, Prog,
+-			              "adding home directory",
+-			              user_name, (unsigned int) user_id,
+-			              SHADOW_AUDIT_FAILURE);
+-#endif
+-			fail_exit (E_HOMEDIR);
+-		}
+-		chown (user_home, user_id, user_gid);
+-		chmod (user_home,
+-		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
+-		home_added = true;
++		mkdir_p(user_home);
++	}
++	if (access (user_home, F_OK) != 0) {
+ #ifdef WITH_AUDIT
+ 		audit_logger (AUDIT_ADD_USER, Prog,
+ 		              "adding home directory",
+ 		              user_name, (unsigned int) user_id,
+-		              SHADOW_AUDIT_SUCCESS);
++		              SHADOW_AUDIT_FAILURE);
++#endif
++		fail_exit (E_HOMEDIR);
++	}
++	chown (user_home, user_id, user_gid);
++	chmod (user_home,
++	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
++	home_added = true;
++#ifdef WITH_AUDIT
++	audit_logger (AUDIT_ADD_USER, Prog,
++	              "adding home directory",
++	              user_name, (unsigned int) user_id,
++	              SHADOW_AUDIT_SUCCESS);
+ #endif
+ #ifdef WITH_SELINUX
+-		/* Reset SELinux to create files with default contexts */
+-		setfscreatecon (NULL);
++	/* Reset SELinux to create files with default contexts */
++	setfscreatecon (NULL);
+ #endif
+-	}
+ }
+ 
+ /*
+@@ -1861,6 +1948,7 @@
  	 */
  	user_groups[0] = (char *) 0;
  
@@ -1114,7 +1185,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  #ifdef SHADOWGRP
 diff -urN shadow-4.1.4.3.orig//src/userdel.c shadow-4.1.4.3//src/userdel.c
 --- shadow-4.1.4.3.orig//src/userdel.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/userdel.c	2011-05-28 17:09:52.356013600 -0700
++++ shadow-4.1.4.3//src/userdel.c	2011-06-28 15:12:03.549503721 -0700
 @@ -79,6 +79,7 @@
  static char *user_name;
  static uid_t user_id;
@@ -1169,7 +1240,7 @@ diff -urN shadow-4.1.4.3.orig//src/userdel.c shadow-4.1.4.3//src/userdel.c
  				break;
 diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
 --- shadow-4.1.4.3.orig//src/usermod.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/usermod.c	2011-05-28 17:09:52.356013600 -0700
++++ shadow-4.1.4.3//src/usermod.c	2011-06-28 15:12:03.549503721 -0700
 @@ -110,6 +110,7 @@
  static long user_newinactive;
  static long sys_ngroups;
-- 
1.7.1



