Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1R8go5-0000ga-Fg
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 01:11:21 +0200
Received: by wwf27 with SMTP id 27so6418094wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Z6RJ4ir8JdMh4s9NXBN4J1DINk2TDiW4XU2D7X6/tVk=;
	b=R32mbPe1HxCM96qUZ4upb96L8+SevCNBQK9ADFJ9qUxaUNnY+xztnjcJY2VFOGgqv6
	VYHylisRTuMqK2nfGsljorEJthPGSugEfFYISD4rqYkAzqCOQFqXjfXtmdnXm8Pv1ynL
	ZFMdsPzmcDce30Q1K8fDcxyFLiyUn/UGoTgL8=
Received: by 10.227.19.143 with SMTP id a15mr9006760wbb.1.1317164755386;
	Tue, 27 Sep 2011 16:05:55 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id fd4sm37903271wbb.21.2011.09.27.16.05.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Sep 2011 16:05:55 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 01:00:24 +0100
Message-Id: <1317168025-27827-2-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1317168025-27827-1-git-send-email-julian.pidancet@gmail.com>
References: <1317168025-27827-1-git-send-email-julian.pidancet@gmail.com>
Cc: scott.a.garman@intel.com, julian.pidancet@gmail.com
Subject: [PATCH 1/2] Fix the --root option in shadow-native programs.
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
X-List-Received-Date: Tue, 27 Sep 2011 23:11:21 -0000

The add_root_cmd_options.patch that we apply to shadow-native allow the
various programs from the shadow utility package to chroot() so they can
be used to modify etc/passwd and etc/group if they are located in a
sysroot.

Some of the shadow programs (gpasswd, useradd and usermod) need to parse
the command line in two passes. But we can't use getopt_long() twice
because getopt_long() reorders the command line arguments, and
consequently corrupts the option parsing during the second pass.

This patch fixes this issue by replacing the first pass by a very simple
manual walk of the command line to handle the --root argument.

This change is a patch of another patch, I apologize if it is
difficult to read. But IMHO it wouldn't make sense to put the patch for
this issue in another separated file.

The --root options in groupadd and useradd are needed to make the
useradd class work, and this issue was preventing to use useradd and
groupadd long options while using the class.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 .../shadow/files/add_root_cmd_options.patch        |  204 ++++++++++----------
 1 files changed, 101 insertions(+), 103 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
index c5f2bec..bfb8898 100644
--- a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
+++ b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
@@ -25,9 +25,9 @@ Workaround is specific to our build system.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
---- shadow-4.1.4.3.orig//src/gpasswd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/gpasswd.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/gpasswd.c shadow-4.1.4.3/src/gpasswd.c
+--- shadow-4.1.4.3.orig/src/gpasswd.c	2011-09-27 23:03:21.635000089 +0100
++++ shadow-4.1.4.3/src/gpasswd.c	2011-09-27 23:38:53.241000101 +0100
 @@ -63,6 +63,7 @@
   * (/etc/gshadow present) */
  static bool is_shadowgrp;
@@ -52,7 +52,7 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
  	           "  -r, --remove-password         remove the GROUP's password\n"
  	           "  -R, --restrict                restrict access to GROUP to its members\n"
  	           "  -M, --members USER,...        set the list of members of GROUP\n"
-@@ -226,6 +229,55 @@
+@@ -226,6 +229,57 @@
  }
  
  /*
@@ -68,23 +68,26 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
 +	/*
 +	 * Parse the command line options.
 +	 */
-+	int flag;
-+	int option_index = 0;
-+	static struct option long_options[] = {
-+		{"root", required_argument, NULL, 'Q'},
-+		{NULL, 0, NULL, '\0'}
-+	};
++	int i;
++        char *root;
 +
-+	while ((flag = getopt_long (argc, argv, "a:A:d:gM:Q:rR", long_options, &option_index)) != -1) {
-+		switch (flag) {
-+		case 'Q':
-+			if ('/' != optarg[0]) {
++        for (i = 0; i < argc; i++) {
++		if (!strcmp (argv[i], "--root") || !strcmp (argv[i], "-R")) {
++			if (i + 1 == argc) {
++				fprintf (stderr,
++				         _("%s: option '%s' requires an argument\n"),
++				         Prog, argv[i]);
++				exit (E_BAD_ARG);
++			}
++			root = argv[i + 1];
++
++			if ('/' != root[0]) {
 +				fprintf (stderr,
 +				         _("%s: invalid chroot path '%s'\n"),
-+				         Prog, optarg);
++				         Prog, root);
 +				exit (E_BAD_ARG);
 +			}
-+			newroot = optarg;
++			newroot = root;
 +
 +			if (access (newroot, F_OK) != 0) {
 +				fprintf(stderr,
@@ -99,7 +102,6 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
 +				exit (E_BAD_ARG);
 +			}
 +			break;
-+		/* no-op on everything else - they will be hanled by process_flags() */
 +		}
 +	}
 +}
@@ -108,7 +110,7 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
   * process_flags - process the command line options and arguments
   */
  static void process_flags (int argc, char **argv)
-@@ -235,6 +287,7 @@
+@@ -235,6 +289,7 @@
  	static struct option long_options[] = {
  		{"add", required_argument, NULL, 'a'},
  		{"delete", required_argument, NULL, 'd'},
@@ -116,7 +118,7 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
  		{"remove-password", no_argument, NULL, 'r'},
  		{"restrict", no_argument, NULL, 'R'},
  		{"administrators", required_argument, NULL, 'A'},
-@@ -242,7 +295,7 @@
+@@ -242,7 +297,7 @@
  		{NULL, 0, NULL, '\0'}
  		};
  
@@ -125,7 +127,7 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
  		switch (flag) {
  		case 'a':	/* add a user */
  			aflg = true;
-@@ -283,6 +336,9 @@
+@@ -283,6 +338,9 @@
  			}
  			Mflg = true;
  			break;
@@ -135,7 +137,7 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
  		case 'r':	/* remove group password */
  			rflg = true;
  			break;
-@@ -995,6 +1051,8 @@
+@@ -995,6 +1053,8 @@
  	setbuf (stdout, NULL);
  	setbuf (stderr, NULL);
  
@@ -144,9 +146,9 @@ diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
  #ifdef SHADOWGRP
  	is_shadowgrp = sgr_file_present ();
  #endif
-diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3//src/groupadd.c
---- shadow-4.1.4.3.orig//src/groupadd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/groupadd.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/groupadd.c shadow-4.1.4.3/src/groupadd.c
+--- shadow-4.1.4.3.orig/src/groupadd.c	2011-09-27 23:03:21.636000088 +0100
++++ shadow-4.1.4.3/src/groupadd.c	2011-09-27 23:19:25.573000078 +0100
 @@ -76,6 +76,7 @@
  static gid_t group_id;
  static /*@null@*/char *group_passwd;
@@ -207,9 +209,9 @@ diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3//src/groupadd.c
  		case 'r':
  			rflg = true;
  			break;
-diff -urN shadow-4.1.4.3.orig//src/groupdel.c shadow-4.1.4.3//src/groupdel.c
---- shadow-4.1.4.3.orig//src/groupdel.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/groupdel.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/groupdel.c shadow-4.1.4.3/src/groupdel.c
+--- shadow-4.1.4.3.orig/src/groupdel.c	2011-09-27 23:03:21.636000088 +0100
++++ shadow-4.1.4.3/src/groupdel.c	2011-09-27 23:19:25.573000078 +0100
 @@ -36,6 +36,7 @@
  
  #include <ctype.h>
@@ -339,9 +341,9 @@ diff -urN shadow-4.1.4.3.orig//src/groupdel.c shadow-4.1.4.3//src/groupdel.c
  #ifdef ACCT_TOOLS_SETUID
  #ifdef USE_PAM
  	{
-diff -urN shadow-4.1.4.3.orig//src/groupmod.c shadow-4.1.4.3//src/groupmod.c
---- shadow-4.1.4.3.orig//src/groupmod.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/groupmod.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/groupmod.c shadow-4.1.4.3/src/groupmod.c
+--- shadow-4.1.4.3.orig/src/groupmod.c	2011-09-27 23:03:21.636000088 +0100
++++ shadow-4.1.4.3/src/groupmod.c	2011-09-27 23:19:25.574000088 +0100
 @@ -79,6 +79,7 @@
  static char *group_passwd;
  static gid_t group_id;
@@ -400,9 +402,9 @@ diff -urN shadow-4.1.4.3.orig//src/groupmod.c shadow-4.1.4.3//src/groupmod.c
  		default:
  			usage ();
  		}
-diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
---- shadow-4.1.4.3.orig//src/grpconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/grpconv.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/grpconv.c shadow-4.1.4.3/src/grpconv.c
+--- shadow-4.1.4.3.orig/src/grpconv.c	2011-09-27 23:03:21.637000087 +0100
++++ shadow-4.1.4.3/src/grpconv.c	2011-09-27 23:19:25.574000088 +0100
 @@ -39,6 +39,7 @@
  
  #include <errno.h>
@@ -526,9 +528,9 @@ diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
  	if (gr_lock () == 0) {
  		fprintf (stderr,
  		         _("%s: cannot lock %s; try again later.\n"),
-diff -urN shadow-4.1.4.3.orig//src/grpunconv.c shadow-4.1.4.3//src/grpunconv.c
---- shadow-4.1.4.3.orig//src/grpunconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/grpunconv.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/grpunconv.c shadow-4.1.4.3/src/grpunconv.c
+--- shadow-4.1.4.3.orig/src/grpunconv.c	2011-09-27 23:03:21.637000087 +0100
++++ shadow-4.1.4.3/src/grpunconv.c	2011-09-27 23:19:25.575000089 +0100
 @@ -43,6 +43,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -652,9 +654,9 @@ diff -urN shadow-4.1.4.3.orig//src/grpunconv.c shadow-4.1.4.3//src/grpunconv.c
  	if (sgr_file_present () == 0) {
  		exit (0);	/* no /etc/gshadow, nothing to do */
  	}
-diff -urN shadow-4.1.4.3.orig//src/passwd.c shadow-4.1.4.3//src/passwd.c
---- shadow-4.1.4.3.orig//src/passwd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/passwd.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/passwd.c shadow-4.1.4.3/src/passwd.c
+--- shadow-4.1.4.3.orig/src/passwd.c	2011-09-27 23:03:21.638000086 +0100
++++ shadow-4.1.4.3/src/passwd.c	2011-09-27 23:19:25.575000089 +0100
 @@ -75,6 +75,7 @@
  static char *name;		/* The name of user whose password is being changed */
  static char *myname;		/* The current user's name */
@@ -717,9 +719,9 @@ diff -urN shadow-4.1.4.3.orig//src/passwd.c shadow-4.1.4.3//src/passwd.c
  			case 'r':
  				/* -r repository (files|nis|nisplus) */
  				/* only "files" supported for now */
-diff -urN shadow-4.1.4.3.orig//src/pwconv.c shadow-4.1.4.3//src/pwconv.c
---- shadow-4.1.4.3.orig//src/pwconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/pwconv.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/pwconv.c shadow-4.1.4.3/src/pwconv.c
+--- shadow-4.1.4.3.orig/src/pwconv.c	2011-09-27 23:03:21.638000086 +0100
++++ shadow-4.1.4.3/src/pwconv.c	2011-09-27 23:19:25.576000088 +0100
 @@ -59,6 +59,7 @@
  
  #include <errno.h>
@@ -846,9 +848,9 @@ diff -urN shadow-4.1.4.3.orig//src/pwconv.c shadow-4.1.4.3//src/pwconv.c
  	if (pw_lock () == 0) {
  		fprintf (stderr,
  		         _("%s: cannot lock %s; try again later.\n"),
-diff -urN shadow-4.1.4.3.orig//src/pwunconv.c shadow-4.1.4.3//src/pwunconv.c
---- shadow-4.1.4.3.orig//src/pwunconv.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/pwunconv.c	2011-06-28 15:12:03.539504372 -0700
+diff -urN shadow-4.1.4.3.orig/src/pwunconv.c shadow-4.1.4.3/src/pwunconv.c
+--- shadow-4.1.4.3.orig/src/pwunconv.c	2011-09-27 23:03:21.638000086 +0100
++++ shadow-4.1.4.3/src/pwunconv.c	2011-09-27 23:19:25.576000088 +0100
 @@ -35,6 +35,7 @@
  #ident "$Id: pwunconv.c 2852 2009-04-30 21:44:35Z nekral-guest $"
  
@@ -968,9 +970,9 @@ diff -urN shadow-4.1.4.3.orig//src/pwunconv.c shadow-4.1.4.3//src/pwunconv.c
  	if (!spw_file_present ()) {
  		/* shadow not installed, do nothing */
  		exit (0);
-diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
---- shadow-4.1.4.3.orig//src/useradd.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/useradd.c	2011-06-28 15:12:14.608787030 -0700
+diff -urN shadow-4.1.4.3.orig/src/useradd.c shadow-4.1.4.3/src/useradd.c
+--- shadow-4.1.4.3.orig/src/useradd.c	2011-09-27 23:03:21.639000086 +0100
++++ shadow-4.1.4.3/src/useradd.c	2011-09-27 23:38:54.331000076 +0100
 @@ -112,6 +112,7 @@
  #ifdef WITH_SELINUX
  static const char *user_selinux = "";
@@ -995,7 +997,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
  	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), stderr);
  	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), stderr);
-@@ -943,6 +946,59 @@
+@@ -943,6 +946,57 @@
  }
  
  /*
@@ -1011,27 +1013,26 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
 +	/*
 +	 * Parse the command line options.
 +	 */
-+	int c;
-+	static struct option long_options[] = {
-+		{"root", required_argument, NULL, 'R'},
-+		{NULL, 0, NULL, '\0'}
-+	};
-+	while ((c = getopt_long (argc, argv,
-+#ifdef WITH_SELINUX
-+	                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:UZ:",
-+#else
-+	                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:U",
-+#endif
-+	                         long_options, NULL)) != -1) {
-+		switch (c) {
-+		case 'R':
-+			if ('/' != optarg[0]) {
++	int i;
++        char *root;
++
++        for (i = 0; i < argc; i++) {
++		if (!strcmp (argv[i], "--root") || !strcmp (argv[i], "-R")) {
++			if (i + 1 == argc) {
++				fprintf (stderr,
++				         _("%s: option '%s' requires an argument\n"),
++				         Prog, argv[i]);
++				exit (E_BAD_ARG);
++			}
++			root = argv[i + 1];
++
++			if ('/' != root[0]) {
 +				fprintf (stderr,
 +				         _("%s: invalid chroot path '%s'\n"),
-+				         Prog, optarg);
++				         Prog, root);
 +				exit (E_BAD_ARG);
 +			}
-+			newroot = optarg;
++			newroot = root;
 +
 +			if (access (newroot, F_OK) != 0) {
 +				fprintf(stderr,
@@ -1046,7 +1047,6 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
 +				exit (E_BAD_ARG);
 +			}
 +			break;
-+		/* no-op on everything else - they will be hanled by process_flags() */
 +		}
 +	}
 +}
@@ -1055,7 +1055,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
   * process_flags - perform command line argument setting
   *
   *	process_flags() interprets the command line arguments and sets
-@@ -978,6 +1034,7 @@
+@@ -978,6 +1032,7 @@
  			{"no-user-group", no_argument, NULL, 'N'},
  			{"non-unique", no_argument, NULL, 'o'},
  			{"password", required_argument, NULL, 'p'},
@@ -1063,7 +1063,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  			{"system", no_argument, NULL, 'r'},
  			{"shell", required_argument, NULL, 's'},
  #ifdef WITH_SELINUX
-@@ -989,9 +1046,9 @@
+@@ -989,9 +1044,9 @@
  		};
  		while ((c = getopt_long (argc, argv,
  #ifdef WITH_SELINUX
@@ -1075,7 +1075,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  #endif
  		                         long_options, NULL)) != -1) {
  			switch (c) {
-@@ -1156,6 +1213,9 @@
+@@ -1156,6 +1211,9 @@
  				}
  				user_pass = optarg;
  				break;
@@ -1085,7 +1085,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  			case 'r':
  				rflg = true;
  				break;
-@@ -1735,6 +1795,36 @@
+@@ -1735,6 +1793,36 @@
  	}
  }
  #endif
@@ -1122,7 +1122,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  /*
   * create_home - create the user's home directory
   *
-@@ -1748,34 +1838,31 @@
+@@ -1748,34 +1836,31 @@
  #ifdef WITH_SELINUX
  		selinux_file_context (user_home);
  #endif
@@ -1175,7 +1175,7 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  }
  
  /*
-@@ -1861,6 +1948,7 @@
+@@ -1861,6 +1946,7 @@
  	 */
  	user_groups[0] = (char *) 0;
  
@@ -1183,9 +1183,9 @@ diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
  
  	is_shadow_pwd = spw_file_present ();
  #ifdef SHADOWGRP
-diff -urN shadow-4.1.4.3.orig//src/userdel.c shadow-4.1.4.3//src/userdel.c
---- shadow-4.1.4.3.orig//src/userdel.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/userdel.c	2011-06-28 15:12:03.549503721 -0700
+diff -urN shadow-4.1.4.3.orig/src/userdel.c shadow-4.1.4.3/src/userdel.c
+--- shadow-4.1.4.3.orig/src/userdel.c	2011-09-27 23:03:21.639000086 +0100
++++ shadow-4.1.4.3/src/userdel.c	2011-09-27 23:19:25.577000087 +0100
 @@ -79,6 +79,7 @@
  static char *user_name;
  static uid_t user_id;
@@ -1238,9 +1238,9 @@ diff -urN shadow-4.1.4.3.orig//src/userdel.c shadow-4.1.4.3//src/userdel.c
  			case 'r':	/* remove home dir and mailbox */
  				rflg = true;
  				break;
-diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
---- shadow-4.1.4.3.orig//src/usermod.c	2011-02-13 09:58:16.000000000 -0800
-+++ shadow-4.1.4.3//src/usermod.c	2011-06-28 15:12:03.549503721 -0700
+diff -urN shadow-4.1.4.3.orig/src/usermod.c shadow-4.1.4.3/src/usermod.c
+--- shadow-4.1.4.3.orig/src/usermod.c	2011-09-27 23:03:21.640000086 +0100
++++ shadow-4.1.4.3/src/usermod.c	2011-09-27 23:36:50.331000086 +0100
 @@ -110,6 +110,7 @@
  static long user_newinactive;
  static long sys_ngroups;
@@ -1265,7 +1265,7 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
  	         "  -s, --shell SHELL             new login shell for the user account\n"
  	         "  -u, --uid UID                 new UID for the user account\n"
  	         "  -U, --unlock                  unlock the user account\n"
-@@ -802,6 +805,60 @@
+@@ -802,6 +805,58 @@
  }
  
  /*
@@ -1281,28 +1281,27 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
 +	/*
 +	 * Parse the command line options.
 +	 */
-+	int c;
-+	static struct option long_options[] = {
-+		{"root", required_argument, NULL, 'R'},
-+		{NULL, 0, NULL, '\0'}
-+	};
-+	while ((c = getopt_long (argc, argv,
-+#ifdef WITH_SELINUX
-+                             "ac:d:e:f:g:G:hl:Lmop:R:s:u:UZ:",
-+#else
-+	                         "ac:d:e:f:g:G:hl:Lmop:R:s:u:U",
-+#endif
-+	                         long_options, NULL)) != -1) {
-+		switch (c) {
-+		case 'R':
-+			if (    (!VALID (optarg) ) 
-+				|| (   ('/' != optarg[0]) ) ) {
++	int i;
++        char *root;
++
++        for (i = 0; i < argc; i++) {
++		if (!strcmp (argv[i], "--root") || !strcmp (argv[i], "-R")) {
++			if (i + 1 == argc) {
++				fprintf (stderr,
++				         _("%s: option '%s' requires an argument\n"),
++				         Prog, argv[i]);
++				exit (E_BAD_ARG);
++			}
++			root = argv[i + 1];
++
++			if (    (!VALID (root) ) 
++				|| (   ('/' != root[0]) ) ) {
 +				fprintf (stderr,
 +				         _("%s: invalid chroot path '%s'\n"),
-+				         Prog, optarg);
++				         Prog, root);
 +				exit (E_BAD_ARG);
 +			}
-+			newroot = optarg;
++			newroot = root;
 +
 +			if (access (newroot, F_OK) != 0) {
 +				fprintf(stderr,
@@ -1317,7 +1316,6 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
 +				exit (E_BAD_ARG);
 +			}
 +			break;
-+		/* no-op on everything else - they will be hanled by process_flags() */
 +		}
 +	}
 +}
@@ -1326,7 +1324,7 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
   * process_flags - perform command line argument setting
   *
   *	process_flags() interprets the command line arguments and sets the
-@@ -895,6 +952,7 @@
+@@ -895,6 +950,7 @@
  			{"move-home", no_argument, NULL, 'm'},
  			{"non-unique", no_argument, NULL, 'o'},
  			{"password", required_argument, NULL, 'p'},
@@ -1334,7 +1332,7 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
  #ifdef WITH_SELINUX
  			{"selinux-user", required_argument, NULL, 'Z'},
  #endif
-@@ -905,9 +963,9 @@
+@@ -905,9 +961,9 @@
  		};
  		while ((c = getopt_long (argc, argv,
  #ifdef WITH_SELINUX
@@ -1346,7 +1344,7 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
  #endif
  			                 long_options, NULL)) != -1) {
  			switch (c) {
-@@ -999,6 +1057,9 @@
+@@ -999,6 +1055,9 @@
  				user_pass = optarg;
  				pflg = true;
  				break;
@@ -1356,7 +1354,7 @@ diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
  			case 's':
  				if (!VALID (optarg)) {
  					fprintf (stderr,
-@@ -1715,6 +1776,8 @@
+@@ -1715,6 +1774,8 @@
  
  	OPENLOG ("usermod");
  
-- 
1.7.3.4



