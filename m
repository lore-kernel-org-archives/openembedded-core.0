Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6626CF3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 07:37:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAG7bfvj013469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:37:41 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 23:37:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Nov 2013 15:37:52 +0800
Message-ID: <32366c714bd0a6237ccb4eb7f39ac06105dcb0ef.1384587416.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384587416.git.Qi.Chen@windriver.com>
References: <cover.1384587416.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] shadow-native: allow for setting password in clear text
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
X-List-Received-Date: Sat, 16 Nov 2013 07:37:39 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Allow user to set password in clear text. This is convenient when
we're building out an image.

This feature is mainly used by useradd.bbclass and extrausers.bbclass.

This patch adds a new option '-P' to useradd, usermod, groupadd and groupmod
commands provided by shadow-native. The shadow package on target and in SDK
will not be affected.

[YOCTO #5365]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../allow-for-setting-password-in-clear-text.patch |  208 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch

diff --git a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
new file mode 100644
index 0000000..eafb935
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
@@ -0,0 +1,208 @@
+Upstream-Status: Inappropriate [OE specific]
+
+Allow for setting password in clear text.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ src/Makefile.am |    8 ++++----
+ src/groupadd.c  |    8 +++++++-
+ src/groupmod.c  |    9 ++++++++-
+ src/useradd.c   |    9 +++++++--
+ src/usermod.c   |   10 ++++++++--
+ 5 files changed, 34 insertions(+), 10 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6a3b4c5..1ffdbc6 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -76,10 +76,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBSELINUX) $(LIBCRYPT)
+ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
+ chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT)
+ gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
+-groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
++groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
+ groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
+ groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX)
+-groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
++groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
+ grpck_LDADD    = $(LDADD) $(LIBSELINUX)
+ grpconv_LDADD  = $(LDADD) $(LIBSELINUX)
+ grpunconv_LDADD = $(LDADD) $(LIBSELINUX)
+@@ -99,9 +99,9 @@ su_SOURCES     = \
+ 	suauth.c
+ su_LDADD       = $(LDADD) $(LIBPAM) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
+ sulogin_LDADD  = $(LDADD) $(LIBCRYPT)
+-useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
++useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
+ userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
+-usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
++usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
+ vipw_LDADD     = $(LDADD) $(LIBSELINUX)
+ 
+ install-am: all-am
+diff --git a/src/groupadd.c b/src/groupadd.c
+index 66b38de..3157486 100644
+--- a/src/groupadd.c
++++ b/src/groupadd.c
+@@ -124,6 +124,7 @@ static void usage (void)
+ 	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
+ 	                "                                (non-unique) GID\n"), stderr);
+ 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), stderr);
++	(void) fputs (_("  -P, --clear-password PASSWORD use this clear text password for the new group\n"), stderr);
+ 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
+ 	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
+ 	(void) fputs ("\n", stderr);
+@@ -388,13 +389,14 @@ static void process_flags (int argc, char **argv)
+ 		{"key", required_argument, NULL, 'K'},
+ 		{"non-unique", no_argument, NULL, 'o'},
+ 		{"password", required_argument, NULL, 'p'},
++		{"clear-password", required_argument, NULL, 'P'},
+ 		{"root", required_argument, NULL, 'R'},
+ 		{"system", no_argument, NULL, 'r'},
+ 		{NULL, 0, NULL, '\0'}
+ 	};
+ 
+ 	while ((c =
+-		getopt_long (argc, argv, "fg:hK:op:R:r", long_options,
++		getopt_long (argc, argv, "fg:hK:op:P:R:r", long_options,
+ 		             &option_index)) != -1) {
+ 		switch (c) {
+ 		case 'f':
+@@ -446,6 +448,10 @@ static void process_flags (int argc, char **argv)
+ 			pflg = true;
+ 			group_passwd = optarg;
+ 			break;
++		case 'P':
++			pflg = true;
++			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
++			break;
+ 		case 'R':
+ 			if ('/' != optarg[0]) {
+ 				fprintf (stderr,
+diff --git a/src/groupmod.c b/src/groupmod.c
+index 27eb159..17acbc3 100644
+--- a/src/groupmod.c
++++ b/src/groupmod.c
+@@ -127,6 +127,8 @@ static void usage (void)
+ 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), stderr);
+ 	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
+ 	                "                                PASSWORD\n"), stderr);
++	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this (clear text)\n"
++	                "                                PASSWORD\n"), stderr);
+ 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
+ 	(void) fputs ("\n", stderr);
+ 	exit (E_USAGE);
+@@ -348,11 +350,12 @@ static void process_flags (int argc, char **argv)
+ 		{"new-name", required_argument, NULL, 'n'},
+ 		{"non-unique", no_argument, NULL, 'o'},
+ 		{"password", required_argument, NULL, 'p'},
++		{"clear-password", required_argument, NULL, 'P'},
+ 		{"root", required_argument, NULL, 'R'},
+ 		{NULL, 0, NULL, '\0'}
+ 	};
+ 	while ((c =
+-		getopt_long (argc, argv, "g:hn:op:R:",
++		getopt_long (argc, argv, "g:hn:op:P:R:",
+ 		             long_options, &option_index)) != -1) {
+ 		switch (c) {
+ 		case 'g':
+@@ -376,6 +379,10 @@ static void process_flags (int argc, char **argv)
+ 			group_passwd = optarg;
+ 			pflg = true;
+ 			break;
++		case 'P':
++			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
++			pflg = true;
++			break;
+ 		case 'R':
+ 			if ('/' != optarg[0]) {
+ 				fprintf (stderr,
+diff --git a/src/useradd.c b/src/useradd.c
+index 2102630..390909c 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -716,6 +716,7 @@ static void usage (void)
+ 	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
+ 	                "                                (non-unique) UID\n"), stderr);
+ 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), stderr);
++	(void) fputs (_("  -P, --clear-password PASSWORD clear text password of the new account\n"), stderr);
+ 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
+ 	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
+ 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), stderr);
+@@ -1035,6 +1036,7 @@ static void process_flags (int argc, char **argv)
+ 			{"no-user-group", no_argument, NULL, 'N'},
+ 			{"non-unique", no_argument, NULL, 'o'},
+ 			{"password", required_argument, NULL, 'p'},
++			{"clear-password", required_argument, NULL, 'P'},
+ 			{"root", required_argument, NULL, 'R'},
+ 			{"system", no_argument, NULL, 'r'},
+ 			{"shell", required_argument, NULL, 's'},
+@@ -1047,9 +1049,9 @@ static void process_flags (int argc, char **argv)
+ 		};
+ 		while ((c = getopt_long (argc, argv,
+ #ifdef WITH_SELINUX
+-		                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:UZ:",
++		                         "b:c:d:De:f:g:G:k:K:lmMNop:P:R:rs:u:UZ:",
+ #else
+-		                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:U",
++		                         "b:c:d:De:f:g:G:k:K:lmMNop:P:R:rs:u:U",
+ #endif
+ 		                         long_options, NULL)) != -1) {
+ 			switch (c) {
+@@ -1214,6 +1216,9 @@ static void process_flags (int argc, char **argv)
+ 				}
+ 				user_pass = optarg;
+ 				break;
++			case 'P':	/* set clear text password */
++				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
++				break;
+ 			case 'R':
+ 				/* no-op since we handled this in process_root_flag() earlier */
+ 				break;
+diff --git a/src/usermod.c b/src/usermod.c
+index 8363597..f4c1cee 100644
+--- a/src/usermod.c
++++ b/src/usermod.c
+@@ -325,6 +325,7 @@ static void usage (void)
+ 	         "                                new location (use only with -d)\n"
+ 	         "  -o, --non-unique              allow using duplicate (non-unique) UID\n"
+ 	         "  -p, --password PASSWORD       use encrypted password for the new password\n"
++	         "  -P, --clear-password PASSWORD       use clear text password for the new password\n"
+ 	         "  -R  --root CHROOT_DIR         directory to chroot into\n"
+ 	         "  -s, --shell SHELL             new login shell for the user account\n"
+ 	         "  -u, --uid UID                 new UID for the user account\n"
+@@ -950,6 +951,7 @@ static void process_flags (int argc, char **argv)
+ 			{"move-home", no_argument, NULL, 'm'},
+ 			{"non-unique", no_argument, NULL, 'o'},
+ 			{"password", required_argument, NULL, 'p'},
++			{"clear-password", required_argument, NULL, 'P'},
+ 			{"root", required_argument, NULL, 'R'},
+ #ifdef WITH_SELINUX
+ 			{"selinux-user", required_argument, NULL, 'Z'},
+@@ -961,9 +963,9 @@ static void process_flags (int argc, char **argv)
+ 		};
+ 		while ((c = getopt_long (argc, argv,
+ #ifdef WITH_SELINUX
+-			                 "ac:d:e:f:g:G:hl:Lmop:R:s:u:UZ:",
++			                 "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:UZ:",
+ #else
+-			                 "ac:d:e:f:g:G:hl:Lmop:R:s:u:U",
++			                 "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:U",
+ #endif
+ 			                 long_options, NULL)) != -1) {
+ 			switch (c) {
+@@ -1055,6 +1057,10 @@ static void process_flags (int argc, char **argv)
+ 				user_pass = optarg;
+ 				pflg = true;
+ 				break;
++			case 'P':
++				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
++				pflg = true;
++				break;
+ 			case 'R':
+ 				/* no-op since we handled this in process_root_flag() earlier */
+ 				break;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5ab978a..374aa5f 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -33,6 +33,7 @@ SRC_URI_append_class-native = " \
            file://disable-syslog.patch \
            file://useradd.patch \
            file://add_root_cmd_groupmems.patch \
+           file://allow-for-setting-password-in-clear-text.patch \
            "
 SRC_URI_append_class-nativesdk = " \
            file://add_root_cmd_options.patch \
-- 
1.7.9.5


