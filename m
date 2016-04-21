Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 38D316FFE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 09:24:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 21 Apr 2016 02:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="89201748"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2016 02:24:27 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 325DE6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 03:12:03 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 12:24:07 +0300
Message-Id: <1461230647-19298-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] busybox: update flock behavior to match upstream
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
X-List-Received-Date: Thu, 21 Apr 2016 09:24:29 -0000

In "util-linux" implementation of flock, -c 'PROG ARGS' means run
"sh -c 'PROG ARGS'". At present, busybox implementation doesn't follow it.
That causes errors like the one listed below:

smart install /media/cronie-1.5.0-r0.core2_64.rpm
Updating cache...
  <snip>
  Output from cronie-1.5.0-r0@core2_64:
  Running groupadd commands...
  NOTE: cronie: Performing groupadd with [ --system crontab]
  ERROR: cronie: groupadd command did not succeed.
  error: %pre(cronie-1.5.0-r0.core2_64) scriptlet failed, exit status 1
  error:   install: %pre scriptlet failed (2), skipping
  cronie-1.5.0-r0.core2_64

This is because we use flock command in preinstall scripts in packages
which create new groups/users.

[YOCTO #9496]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...e-the-behaviour-of-c-parameter-to-match-u.patch | 73 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
new file mode 100644
index 0000000..8bcbd73
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
@@ -0,0 +1,73 @@
+From 198f18addf1d814c2fefcb492f3b9fbd221669bb Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Wed, 20 Apr 2016 18:24:45 +0300
+Subject: [PATCH] flock: update the behaviour of -c parameter to match upstream
+
+In upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
+
+function                                             old     new   delta
+flock_main                                           286     377     +91
+.rodata                                           155849  155890     +41
+
+Upstream-Status: Submitted
+[ http://lists.busybox.net/pipermail/busybox/2016-April/084142.html ]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ util-linux/flock.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/util-linux/flock.c b/util-linux/flock.c
+index 05a747f..c85a25d 100644
+--- a/util-linux/flock.c
++++ b/util-linux/flock.c
+@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int flock_main(int argc UNUSED_PARAM, char **argv)
+ {
+ 	int mode, opt, fd;
++    char *cmd_args[4];
+ 	enum {
+ 		OPT_s = (1 << 0),
+ 		OPT_x = (1 << 1),
+@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
+ 	/* If it is "flock FILE -c PROG", then -c isn't caught by getopt32:
+ 	 * we use "+" in order to support "flock -opt FILE PROG -with-opts",
+ 	 * we need to remove -c by hand.
+-	 * TODO: in upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
+ 	 */
+ 	if (argv[0]
+ 	 && argv[0][0] == '-'
+@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
+ 	    || (ENABLE_LONG_OPTS && strcmp(argv[0] + 1, "-command") == 0)
+ 	    )
+ 	) {
+-		argv++;
++        if (argc != optind + 3)
++            bb_error_msg_and_die("-c requires exactly one command argument");
++        else
++            argv++;
+ 	}
+ 
+ 	if (OPT_s == LOCK_SH && OPT_x == LOCK_EX && OPT_n == LOCK_NB && OPT_u == LOCK_UN) {
+@@ -89,9 +92,14 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
+ 			return EXIT_FAILURE;
+ 		bb_perror_nomsg_and_die();
+ 	}
+-
+-	if (argv[0])
+-		return spawn_and_wait(argv);
+-
++    if (argv[0]) {
++        cmd_args[0] = getenv("SHELL");
++        if (!cmd_args[0])
++            cmd_args[0] = (char*)DEFAULT_SHELL;
++        cmd_args[1] = (char*)"-c";
++        cmd_args[2] = argv[0];
++        cmd_args[3] = NULL;
++        return spawn_and_wait(cmd_args);
++    }
+ 	return EXIT_SUCCESS;
+ }
+-- 
+2.4.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index bdaa5a5..f699f99 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-1.24.1-unzip.patch \
            file://busybox-1.24.1-unzip-regression.patch \
            file://busybox-1.24.1-truncate-open-mode.patch \
+           file://0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.4.0


