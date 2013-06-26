Return-Path: <Mikhail_Durnev@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7016A8EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:55:00 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Urfsq-0007nG-Pu from Mikhail_Durnev@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Jun 2013 19:55:00 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 25 Jun 2013 19:55:00 -0700
Received: from sb-u1004lts-64bit.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.2.247.3; Tue, 25 Jun 2013 19:55:00 -0700
From: <mikhail_durnev@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2013 21:54:35 -0500
Message-ID: <1372215276-9080-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Jun 2013 02:55:00.0461 (UTC)
	FILETIME=[8CA331D0:01CE7218]
Subject: [PATCH 1/2] shadow-native: Add --root option in groupmems
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
X-List-Received-Date: Wed, 26 Jun 2013 02:55:00 -0000
Content-Type: text/plain

From: Mikhail Durnev <mikhail_durnev@mentor.com>

    Patch add_root_cmd_groupmems.patch that we apply to shadow-native
    allows program groupmems from the shadow utility package to chroot()
    so it can be used to modify etc/passwd and etc/group if they are
    located in a sysroot.

    The --root option in groupmems is needed for class useradd.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
---
 .../shadow/files/add_root_cmd_groupmems.patch      |   75 ++++++++++++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch

diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch b/meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
new file mode 100644
index 0000000..4044496
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
@@ -0,0 +1,75 @@
+Add a --root command option to groupmems utility.
+
+This option allows the utility to be chrooted when run under pseudo.
+
+Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
+
+diff -Naur old/src/groupmems.c new/src/groupmems.c
+--- old/src/groupmems.c	2011-02-13 11:58:16.000000000 -0600
++++ new/src/groupmems.c	2013-05-30 04:45:38.000000000 -0500
+@@ -60,6 +60,7 @@
+ #define EXIT_MEMBER_EXISTS	7	/* member of group already exists */
+ #define EXIT_INVALID_USER	8	/* specified user does not exist */
+ #define EXIT_INVALID_GROUP	9	/* specified group does not exist */
++#define EXIT_BAD_ARG		10	/* invalid argument to option */
+
+ /*
+  * Global variables
+@@ -79,6 +80,7 @@
+ static bool is_shadowgrp;
+ static bool sgr_locked = false;
+ #endif
++static const char *newroot = "";
+
+ /* local function prototypes */
+ static char *whoami (void);
+@@ -368,6 +370,7 @@
+	                "Options:\n"
+	                "  -g, --group groupname         change groupname instead of the user's group\n"
+	                "                                (root only)\n"
++	                "  -R, --root CHROOT_DIR         directory to chroot into\n"
+	                "\n"
+	                "Actions:\n"
+	                "  -a, --add username            add username to the members of the group\n"
+@@ -391,10 +394,11 @@
+		{"group", required_argument, NULL, 'g'},
+		{"list", no_argument, NULL, 'l'},
+		{"purge", no_argument, NULL, 'p'},
++		{"root", required_argument, NULL, 'R'},
+		{NULL, 0, NULL, '\0'}
+	};
+
+-	while ((arg = getopt_long (argc, argv, "a:d:g:lp", long_options,
++	while ((arg = getopt_long (argc, argv, "a:d:g:lpR:", long_options,
+	                           &option_index)) != EOF) {
+		switch (arg) {
+		case 'a':
+@@ -416,6 +420,28 @@
+			purge = true;
+			++exclusive;
+			break;
++		case 'R':
++			if ('/' != optarg[0]) {
++				fprintf (stderr,
++					 _("%s: invalid chroot path '%s'\n"),
++					Prog, optarg);
++				exit (EXIT_BAD_ARG);
++			}
++			newroot = optarg;
++
++			if (access (newroot, F_OK) != 0) {
++				fprintf(stderr,
++					_("%s: chroot directory %s does not exist\n"),
++					Prog, newroot);
++				exit (EXIT_BAD_ARG);
++			}
++			if ( chroot(newroot) != 0 ) {
++				fprintf(stderr,
++					_("%s: unable to chroot to directory %s\n"),
++					Prog, newroot);
++				exit (EXIT_BAD_ARG);
++			}
++			break;
+		default:
+			usage ();
+		}
diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 2c4edbe..1ed5d4e 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://disable-syslog.patch \
            file://useradd.patch \
            file://shadow_fix_for_automake-1.12.patch \
+           file://add_root_cmd_groupmems.patch \
            "
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
-- 
1.7.9.5


