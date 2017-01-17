Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8F24E71AC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 16:20:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2017 08:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,245,1477983600"; d="scan'208";a="54043098"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 17 Jan 2017 08:20:14 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id AA7006A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 08:19:18 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 18:20:34 +0200
Message-Id: <1484670034-4647-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [morty][PATCH] busybox: refresh the flock patch
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
X-List-Received-Date: Tue, 17 Jan 2017 16:20:17 -0000

Upstream accepted the flock fix with some improvements. Backport those
changes.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...e-the-behaviour-of-c-parameter-to-match-u.patch | 77 ++++++++++------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
index 8bcbd73..78520f0 100644
--- a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
+++ b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
@@ -1,35 +1,24 @@
-From 198f18addf1d814c2fefcb492f3b9fbd221669bb Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 20 Apr 2016 18:24:45 +0300
-Subject: [PATCH] flock: update the behaviour of -c parameter to match upstream
-
-In upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
+From e1d426fd65c00a6d01a10d85edf8a294ae8a2d2b Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 24 Apr 2016 18:19:49 +0200
+Subject: [PATCH] flock: fix -c; improve error handling of fork+exec
 
 function                                             old     new   delta
-flock_main                                           286     377     +91
-.rodata                                           155849  155890     +41
+flock_main                                           254     334     +80
 
-Upstream-Status: Submitted
-[ http://lists.busybox.net/pipermail/busybox/2016-April/084142.html ]
+Upstream-Status: Backport
 
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- util-linux/flock.c | 20 ++++++++++++++------
- 1 file changed, 14 insertions(+), 6 deletions(-)
+ util-linux/flock.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/util-linux/flock.c b/util-linux/flock.c
-index 05a747f..c85a25d 100644
+index 05a747f..539a835 100644
 --- a/util-linux/flock.c
 +++ b/util-linux/flock.c
-@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int flock_main(int argc UNUSED_PARAM, char **argv)
- {
- 	int mode, opt, fd;
-+    char *cmd_args[4];
- 	enum {
- 		OPT_s = (1 << 0),
- 		OPT_x = (1 << 1),
-@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
+@@ -57,7 +57,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
  	/* If it is "flock FILE -c PROG", then -c isn't caught by getopt32:
  	 * we use "+" in order to support "flock -opt FILE PROG -with-opts",
  	 * we need to remove -c by hand.
@@ -37,35 +26,37 @@ index 05a747f..c85a25d 100644
  	 */
  	if (argv[0]
  	 && argv[0][0] == '-'
-@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 	    || (ENABLE_LONG_OPTS && strcmp(argv[0] + 1, "-command") == 0)
+@@ -66,6 +65,9 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
  	    )
  	) {
--		argv++;
-+        if (argc != optind + 3)
-+            bb_error_msg_and_die("-c requires exactly one command argument");
-+        else
-+            argv++;
+ 		argv++;
++		if (argv[1])
++			bb_error_msg_and_die("-c takes only one argument");
++		opt |= OPT_c;
  	}
  
  	if (OPT_s == LOCK_SH && OPT_x == LOCK_EX && OPT_n == LOCK_NB && OPT_u == LOCK_UN) {
-@@ -89,9 +92,14 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 			return EXIT_FAILURE;
+@@ -90,8 +92,21 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
  		bb_perror_nomsg_and_die();
  	}
--
+ 
 -	if (argv[0])
--		return spawn_and_wait(argv);
--
-+    if (argv[0]) {
-+        cmd_args[0] = getenv("SHELL");
-+        if (!cmd_args[0])
-+            cmd_args[0] = (char*)DEFAULT_SHELL;
-+        cmd_args[1] = (char*)"-c";
-+        cmd_args[2] = argv[0];
-+        cmd_args[3] = NULL;
-+        return spawn_and_wait(cmd_args);
-+    }
++	if (argv[0]) {
++		if (!(opt & OPT_c)) {
++			int rc = spawn_and_wait(argv);
++			if (rc < 0)
++				bb_simple_perror_msg(argv[0]);
++			return rc;
++		}
++		/* -c 'PROG ARGS' means "run sh -c 'PROG ARGS'" */
++		argv -= 2;
++		argv[0] = (char*)get_shell_name();
++		argv[1] = (char*)"-c";
++		/* argv[2] = "PROG ARGS"; */
++		/* argv[3] = NULL; */
+ 		return spawn_and_wait(argv);
++	}
+ 
  	return EXIT_SUCCESS;
  }
 -- 
-- 
2.4.0


