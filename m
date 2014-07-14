Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 16FA27026B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 23:49:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2014 16:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,661,1400050800"; d="scan'208";a="573115276"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 16:48:30 -0700
Message-ID: <53C46C4E.3000205@linux.intel.com>
Date: Mon, 14 Jul 2014 16:48:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1405319307.git.Qi.Chen@windriver.com>
	<ad1abb3f5393bd46b9a125d35ea2f10ebb52793f.1405319307.git.Qi.Chen@windriver.com>
In-Reply-To: <ad1abb3f5393bd46b9a125d35ea2f10ebb52793f.1405319307.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/2] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Mon, 14 Jul 2014 23:49:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/13/2014 11:31 PM, Chen Qi wrote:
> Upgrade shadow from 4.1.4.3 to 4.2.1.
>
> Changes during this upgrade are as following.
>
> 1. Remove the "merged" patches. These patches are either merged or
>     the same functionality has been implemented upstream.
>
>     add_root_cmd_groupmems.patch
>     add_root_cmd_options.patch
>     fix-etc-gshadow-reading.patch
>     shadow-4.1.4.2-env-reset-keep-locale.patch
>     shadow-4.1.4.2-groupmod-pam-check.patch
>     shadow-4.1.4.2-su_no_sanitize_env.patch
>     shadow.automake-1.11.patch
>     shadow_fix_for_automake-1.12.patch
>     useradd.patch
>
> 2. Remove the unneeded patch.
>     The following patch has been removed because the logic in the related
>     codes of the new version has been changed. In specific, the codes now
>     can handle the 'NULL' return value. So there's no need for the following
>     patch.
>
>     slackware_fix_for_glib-2.17_crypt.patch
>
> 3. Teak the current patch to match the new version.
>
>     allow-for-setting-password-in-clear-text.patch
>
> 4. Add a patch to fix compilation failure.
>
>     usermod-fix-compilation-failure-with-subids-disabled.patch
>
> 5. Add a patch to fix the installation failure.
>
>     fix-installation-failure-with-subids-disabled.patch
>
This patch needs a Signed-off-by and Upstream Status


And you have done testing with the various modes useradd/groupadd 
functionality?  If so did you develop any test cases that we could add 
for self-test?


Sau!

> 5. Add a patch to fix the failure at rootfs time if extrausers is inherited.
>
>     commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
>
> 6. Fix the bad section in the recipe.
>
> 7. Disable the new subids feature in the new version as it doesn't support
>     cross compilation for now.
>
> 8. Modify the pkg_postinst to `exit 1' if the `pwconv' or `grpconv' fails.
>     Also, fix the arguments to use '--root $D' instead of '--root=$D'.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../shadow/files/add_root_cmd_groupmems.patch      |   75 --
>   .../shadow/files/add_root_cmd_options.patch        | 1384 --------------------
>   .../allow-for-setting-password-in-clear-text.patch |  215 ++-
>   ...fix-unexpected-open-failure-in-chroot-env.patch |   46 +
>   .../shadow/files/fix-etc-gshadow-reading.patch     |   36 -
>   ...installation-failure-with-subids-disabled.patch |   28 +
>   .../shadow-4.1.4.2-env-reset-keep-locale.patch     |   31 -
>   .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |   36 -
>   .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |   31 -
>   .../shadow/files/shadow.automake-1.11.patch        |  106 --
>   .../files/shadow_fix_for_automake-1.12.patch       |   23 -
>   .../files/slackware_fix_for_glib-2.17_crypt.patch  |   63 -
>   meta/recipes-extended/shadow/files/useradd.patch   |   17 -
>   ...-compilation-failure-with-subids-disabled.patch |   33 +
>   ...uretty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} |    0
>   ...-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} |    0
>   meta/recipes-extended/shadow/shadow.inc            |   35 +-
>   .../shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb}  |    0
>   18 files changed, 223 insertions(+), 1936 deletions(-)
>   delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>   create mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>   create mode 100644 meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
>   delete mode 100644 meta/recipes-extended/shadow/files/useradd.patch
>   create mode 100644 meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
>   rename meta/recipes-extended/shadow/{shadow-securetty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} (100%)
>   rename meta/recipes-extended/shadow/{shadow-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} (100%)
>   rename meta/recipes-extended/shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb} (100%)
>
> diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch b/meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
> deleted file mode 100644
> index 4044496..0000000
> --- a/meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -Add a --root command option to groupmems utility.
> -
> -This option allows the utility to be chrooted when run under pseudo.
> -
> -Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
> -
> -diff -Naur old/src/groupmems.c new/src/groupmems.c
> ---- old/src/groupmems.c	2011-02-13 11:58:16.000000000 -0600
> -+++ new/src/groupmems.c	2013-05-30 04:45:38.000000000 -0500
> -@@ -60,6 +60,7 @@
> - #define EXIT_MEMBER_EXISTS	7	/* member of group already exists */
> - #define EXIT_INVALID_USER	8	/* specified user does not exist */
> - #define EXIT_INVALID_GROUP	9	/* specified group does not exist */
> -+#define EXIT_BAD_ARG		10	/* invalid argument to option */
> -
> - /*
> -  * Global variables
> -@@ -79,6 +80,7 @@
> - static bool is_shadowgrp;
> - static bool sgr_locked = false;
> - #endif
> -+static const char *newroot = "";
> -
> - /* local function prototypes */
> - static char *whoami (void);
> -@@ -368,6 +370,7 @@
> -	                "Options:\n"
> -	                "  -g, --group groupname         change groupname instead of the user's group\n"
> -	                "                                (root only)\n"
> -+	                "  -R, --root CHROOT_DIR         directory to chroot into\n"
> -	                "\n"
> -	                "Actions:\n"
> -	                "  -a, --add username            add username to the members of the group\n"
> -@@ -391,10 +394,11 @@
> -		{"group", required_argument, NULL, 'g'},
> -		{"list", no_argument, NULL, 'l'},
> -		{"purge", no_argument, NULL, 'p'},
> -+		{"root", required_argument, NULL, 'R'},
> -		{NULL, 0, NULL, '\0'}
> -	};
> -
> --	while ((arg = getopt_long (argc, argv, "a:d:g:lp", long_options,
> -+	while ((arg = getopt_long (argc, argv, "a:d:g:lpR:", long_options,
> -	                           &option_index)) != EOF) {
> -		switch (arg) {
> -		case 'a':
> -@@ -416,6 +420,28 @@
> -			purge = true;
> -			++exclusive;
> -			break;
> -+		case 'R':
> -+			if ('/' != optarg[0]) {
> -+				fprintf (stderr,
> -+					 _("%s: invalid chroot path '%s'\n"),
> -+					Prog, optarg);
> -+				exit (EXIT_BAD_ARG);
> -+			}
> -+			newroot = optarg;
> -+
> -+			if (access (newroot, F_OK) != 0) {
> -+				fprintf(stderr,
> -+					_("%s: chroot directory %s does not exist\n"),
> -+					Prog, newroot);
> -+				exit (EXIT_BAD_ARG);
> -+			}
> -+			if ( chroot(newroot) != 0 ) {
> -+				fprintf(stderr,
> -+					_("%s: unable to chroot to directory %s\n"),
> -+					Prog, newroot);
> -+				exit (EXIT_BAD_ARG);
> -+			}
> -+			break;
> -		default:
> -			usage ();
> -		}
> diff --git a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch b/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
> deleted file mode 100644
> index ab87e35..0000000
> --- a/meta/recipes-extended/shadow/files/add_root_cmd_options.patch
> +++ /dev/null
> @@ -1,1384 +0,0 @@
> -Add a --root command option to the following utilties:
> -
> -* useradd
> -* groupadd
> -* usermod
> -* groupmod
> -* userdel
> -* groupdel
> -* passwd
> -* gpasswd
> -* pwconv
> -* pwunconv
> -* grpconv
> -* grpunconv
> -
> -This option allows the utilities to be chrooted when run under pseudo.
> -They can then be used to manipulate user and group account information
> -in target sysroots.
> -
> -The useradd utility was also modified to create home directories
> -recursively when necessary.
> -
> -Upstream-Status: Inappropriate [Other]
> -Workaround is specific to our build system.
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -2011-09-29 Fix the parsing of the --root option in gpasswd, useradd, usermod:
> -
> -In programs which need to scan the command line in two passes to handle
> ---root option separately from the rest of the arguments, replace the first
> -calls to getopt_long with a simple iteration over the argument list since
> -getopt_long has the bad habit of reordering arguments on the command line.
> -
> -Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> -
> -diff -urN shadow-4.1.4.3.orig//src/gpasswd.c shadow-4.1.4.3//src/gpasswd.c
> ---- shadow-4.1.4.3.orig//src/gpasswd.c	2011-09-29 12:00:45.211000091 +0100
> -+++ shadow-4.1.4.3//src/gpasswd.c	2011-09-29 12:09:54.590000090 +0100
> -@@ -63,6 +63,7 @@
> -  * (/etc/gshadow present) */
> - static bool is_shadowgrp;
> - #endif
> -+static const char *newroot = "";
> -
> - /* Flags set by options */
> - static bool aflg = false;
> -@@ -97,6 +98,7 @@
> - static void usage (void);
> - static RETSIGTYPE catch_signals (int killed);
> - static bool is_valid_user_list (const char *users);
> -+static void process_root_flag (int argc, char **argv);
> - static void process_flags (int argc, char **argv);
> - static void check_flags (int argc, int opt_index);
> - static void open_files (void);
> -@@ -136,6 +138,7 @@
> - 	           "Options:\n"
> - 	           "  -a, --add USER                add USER to GROUP\n"
> - 	           "  -d, --delete USER             remove USER from GROUP\n"
> -+	           "  -Q  --root CHROOT_DIR         directory to chroot into\n"
> - 	           "  -r, --remove-password         remove the GROUP's password\n"
> - 	           "  -R, --restrict                restrict access to GROUP to its members\n"
> - 	           "  -M, --members USER,...        set the list of members of GROUP\n"
> -@@ -226,6 +229,57 @@
> - }
> -
> - /*
> -+ * process_root_flag - chroot if given the --root option
> -+ *
> -+ * We do this outside of process_flags() because
> -+ * the is_shadow_pwd boolean needs to be set before
> -+ * process_flags(), and if we do need to chroot() we
> -+ * must do so before is_shadow_pwd gets set.
> -+ */
> -+static void process_root_flag (int argc, char **argv)
> -+{
> -+	/*
> -+	 * Parse the command line options.
> -+	 */
> -+	int i;
> -+        char *root;
> -+
> -+        for (i = 0; i < argc; i++) {
> -+		if (!strcmp (argv[i], "--root") || !strcmp (argv[i], "-Q")) {
> -+			if (i + 1 == argc) {
> -+				fprintf (stderr,
> -+				         _("%s: option '%s' requires an argument\n"),
> -+				         Prog, argv[i]);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			root = argv[i + 1];
> -+
> -+			if ('/' != root[0]) {
> -+				fprintf (stderr,
> -+				         _("%s: invalid chroot path '%s'\n"),
> -+				         Prog, root);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			newroot = root;
> -+
> -+			if (access (newroot, F_OK) != 0) {
> -+				fprintf(stderr,
> -+				        _("%s: chroot directory %s does not exist\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			if ( chroot(newroot) != 0 ) {
> -+				fprintf(stderr,
> -+				        _("%s: unable to chroot to directory %s\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			break;
> -+		}
> -+	}
> -+}
> -+
> -+/*
> -  * process_flags - process the command line options and arguments
> -  */
> - static void process_flags (int argc, char **argv)
> -@@ -235,6 +289,7 @@
> - 	static struct option long_options[] = {
> - 		{"add", required_argument, NULL, 'a'},
> - 		{"delete", required_argument, NULL, 'd'},
> -+		{"root", required_argument, NULL, 'Q'},
> - 		{"remove-password", no_argument, NULL, 'r'},
> - 		{"restrict", no_argument, NULL, 'R'},
> - 		{"administrators", required_argument, NULL, 'A'},
> -@@ -242,7 +297,7 @@
> - 		{NULL, 0, NULL, '\0'}
> - 		};
> -
> --	while ((flag = getopt_long (argc, argv, "a:A:d:gM:rR", long_options, &option_index)) != -1) {
> -+	while ((flag = getopt_long (argc, argv, "a:A:d:gM:Q:rR", long_options, &option_index)) != -1) {
> - 		switch (flag) {
> - 		case 'a':	/* add a user */
> - 			aflg = true;
> -@@ -283,6 +338,9 @@
> - 			}
> - 			Mflg = true;
> - 			break;
> -+		case 'Q':
> -+			/* no-op since we handled this in process_root_flag() earlier */
> -+			break;
> - 		case 'r':	/* remove group password */
> - 			rflg = true;
> - 			break;
> -@@ -995,6 +1053,8 @@
> - 	setbuf (stdout, NULL);
> - 	setbuf (stderr, NULL);
> -
> -+	process_root_flag (argc, argv);
> -+
> - #ifdef SHADOWGRP
> - 	is_shadowgrp = sgr_file_present ();
> - #endif
> -diff -urN shadow-4.1.4.3.orig//src/groupadd.c shadow-4.1.4.3//src/groupadd.c
> ---- shadow-4.1.4.3.orig//src/groupadd.c	2011-09-29 12:00:45.212000091 +0100
> -+++ shadow-4.1.4.3//src/groupadd.c	2011-09-29 11:59:28.386000092 +0100
> -@@ -76,6 +76,7 @@
> - static gid_t group_id;
> - static /*@null@*/char *group_passwd;
> - static /*@null@*/char *empty_list = NULL;
> -+static const char *newroot = "";
> -
> - static bool oflg = false;	/* permit non-unique group ID to be specified with -g */
> - static bool gflg = false;	/* ID value for the new group */
> -@@ -120,6 +121,7 @@
> - 	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
> - 	                "                                (non-unique) GID\n"), stderr);
> - 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
> - 	(void) fputs ("\n", stderr);
> - 	exit (E_USAGE);
> -@@ -383,12 +385,13 @@
> - 		{"key", required_argument, NULL, 'K'},
> - 		{"non-unique", no_argument, NULL, 'o'},
> - 		{"password", required_argument, NULL, 'p'},
> -+		{"root", required_argument, NULL, 'R'},
> - 		{"system", no_argument, NULL, 'r'},
> - 		{NULL, 0, NULL, '\0'}
> - 	};
> -
> - 	while ((c =
> --		getopt_long (argc, argv, "fg:hK:op:r", long_options,
> -+		getopt_long (argc, argv, "fg:hK:op:R:r", long_options,
> - 		             &option_index)) != -1) {
> - 		switch (c) {
> - 		case 'f':
> -@@ -440,6 +443,28 @@
> - 			pflg = true;
> - 			group_passwd = optarg;
> - 			break;
> -+		case 'R':
> -+			if ('/' != optarg[0]) {
> -+				fprintf (stderr,
> -+				         _("%s: invalid chroot path '%s'\n"),
> -+				         Prog, optarg);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			newroot = optarg;
> -+
> -+			if (access (newroot, F_OK) != 0) {
> -+				fprintf(stderr,
> -+				        _("%s: chroot directory %s does not exist\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			if ( chroot(newroot) != 0 ) {
> -+				fprintf(stderr,
> -+				        _("%s: unable to chroot to directory %s\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			break;
> - 		case 'r':
> - 			rflg = true;
> - 			break;
> -diff -urN shadow-4.1.4.3.orig//src/groupdel.c shadow-4.1.4.3//src/groupdel.c
> ---- shadow-4.1.4.3.orig//src/groupdel.c	2011-09-29 12:00:45.212000091 +0100
> -+++ shadow-4.1.4.3//src/groupdel.c	2011-09-29 11:59:28.386000092 +0100
> -@@ -36,6 +36,7 @@
> -
> - #include <ctype.h>
> - #include <fcntl.h>
> -+#include <getopt.h>
> - #include <grp.h>
> - #include <pwd.h>
> - #ifdef ACCT_TOOLS_SETUID
> -@@ -59,6 +60,7 @@
> -
> - static char *group_name;
> - static gid_t group_id = -1;
> -+static const char *newroot = "";
> -
> - #ifdef	SHADOWGRP
> - static bool is_shadow_grp;
> -@@ -70,12 +72,14 @@
> - /*@-exitarg@*/
> - #define E_SUCCESS	0	/* success */
> - #define E_USAGE		2	/* invalid command syntax */
> -+#define E_BAD_ARG	3	/* invalid argument to option */
> - #define E_NOTFOUND	6	/* specified group doesn't exist */
> - #define E_GROUP_BUSY	8	/* can't remove user's primary group */
> - #define E_GRP_UPDATE	10	/* can't update group file */
> -
> - /* local function prototypes */
> - static void usage (void);
> -+static void process_flags (int argc, char **argv);
> - static void grp_update (void);
> - static void close_files (void);
> - static void open_files (void);
> -@@ -86,11 +90,78 @@
> -  */
> - static void usage (void)
> - {
> --	fputs (_("Usage: groupdel group\n"), stderr);
> -+	(void) fprintf (stderr,
> -+					_("Usage: groupdel [options]\n"
> -+					  "\n"
> -+					  "Options:\n"),
> -+					Prog);
> -+	(void) fputs (_("  -g, --group GROUP            group name to delete\n"), stderr);
> -+	(void) fputs (_("  -h, --help                   display this help message and exit\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR        directory to chroot into\n"), stderr);
> -+	(void) fputs ("\n", stderr);
> - 	exit (E_USAGE);
> - }
> -
> - /*
> -+ * process_flags - perform command line argument setting
> -+ *
> -+ *	process_flags() interprets the command line arguments and sets
> -+ *	the values that the user will be created with accordingly. The
> -+ *	values are checked for sanity.
> -+ */
> -+static void process_flags (int argc, char **argv)
> -+{
> -+	{
> -+		/*
> -+		 * Parse the command line options.
> -+		 */
> -+		int c;
> -+		static struct option long_options[] = {
> -+			{"group", required_argument, NULL, 'g'},
> -+			{"help", no_argument, NULL, 'h'},
> -+			{"root", required_argument, NULL, 'R'},
> -+			{NULL, 0, NULL, '\0'}
> -+		};
> -+		while ((c = getopt_long (argc, argv,
> -+								 "g:R:",
> -+								 long_options, NULL)) != -1) {
> -+			switch (c) {
> -+			case 'g':
> -+				group_name = optarg;
> -+				break;
> -+			case 'h':
> -+				usage ();
> -+				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+							_("%s: invalid chroot path '%s'\n"),
> -+							Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+							_("%s: chroot directory %s does not exist\n"),
> -+							Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+							_("%s: unable to chroot to directory %s\n"),
> -+							Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> -+			default:
> -+				usage ();
> -+			}
> -+		}
> -+	}
> -+}
> -+
> -+/*
> -  * grp_update - update group file entries
> -  *
> -  *	grp_update() writes the new records to the group files.
> -@@ -328,14 +399,14 @@
> - 	(void) bindtextdomain (PACKAGE, LOCALEDIR);
> - 	(void) textdomain (PACKAGE);
> -
> --	if (argc != 2) {
> -+   if (argc == 1) {
> - 		usage ();
> - 	}
> -
> --	group_name = argv[1];
> --
> - 	OPENLOG ("groupdel");
> -
> -+	process_flags (argc, argv);
> -+
> - #ifdef ACCT_TOOLS_SETUID
> - #ifdef USE_PAM
> - 	{
> -diff -urN shadow-4.1.4.3.orig//src/groupmod.c shadow-4.1.4.3//src/groupmod.c
> ---- shadow-4.1.4.3.orig//src/groupmod.c	2011-09-29 12:00:45.212000091 +0100
> -+++ shadow-4.1.4.3//src/groupmod.c	2011-09-29 11:59:28.387000092 +0100
> -@@ -79,6 +79,7 @@
> - static char *group_passwd;
> - static gid_t group_id;
> - static gid_t group_newid;
> -+static char *newroot = "";
> -
> - struct cleanup_info_mod info_passwd;
> - struct cleanup_info_mod info_group;
> -@@ -126,6 +127,7 @@
> - 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), stderr);
> - 	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
> - 	                "                                PASSWORD\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> - 	(void) fputs ("\n", stderr);
> - 	exit (E_USAGE);
> - }
> -@@ -346,10 +348,11 @@
> - 		{"new-name", required_argument, NULL, 'n'},
> - 		{"non-unique", no_argument, NULL, 'o'},
> - 		{"password", required_argument, NULL, 'p'},
> -+		{"root", required_argument, NULL, 'R'},
> - 		{NULL, 0, NULL, '\0'}
> - 	};
> - 	while ((c =
> --		getopt_long (argc, argv, "g:hn:op:",
> -+		getopt_long (argc, argv, "g:hn:op:R:",
> - 		             long_options, &option_index)) != -1) {
> - 		switch (c) {
> - 		case 'g':
> -@@ -373,6 +376,28 @@
> - 			group_passwd = optarg;
> - 			pflg = true;
> - 			break;
> -+		case 'R':
> -+			if ('/' != optarg[0]) {
> -+				fprintf (stderr,
> -+				         _("%s: invalid chroot path '%s'\n"),
> -+				         Prog, optarg);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			newroot = optarg;
> -+
> -+			if (access (newroot, F_OK) != 0) {
> -+				fprintf(stderr,
> -+				        _("%s: chroot directory %s does not exist\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			if ( chroot(newroot) != 0 ) {
> -+				fprintf(stderr,
> -+				        _("%s: unable to chroot to directory %s\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			break;
> - 		default:
> - 			usage ();
> - 		}
> -diff -urN shadow-4.1.4.3.orig//src/grpconv.c shadow-4.1.4.3//src/grpconv.c
> ---- shadow-4.1.4.3.orig//src/grpconv.c	2011-09-29 12:00:45.213000091 +0100
> -+++ shadow-4.1.4.3//src/grpconv.c	2011-09-29 11:59:28.387000092 +0100
> -@@ -39,6 +39,7 @@
> -
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <getopt.h>
> - #include <grp.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -@@ -50,6 +51,14 @@
> - #ifdef SHADOWGRP
> - #include "groupio.h"
> - #include "sgroupio.h"
> -+
> -+/*
> -+ * exit status values
> -+ */
> -+/*@-exitarg@*/
> -+#define E_USAGE		2	/* invalid command syntax */
> -+#define E_BAD_ARG	3	/* invalid argument to option */
> -+
> - /*
> -  * Global variables
> -  */
> -@@ -57,9 +66,12 @@
> -
> - static bool gr_locked  = false;
> - static bool sgr_locked = false;
> -+static const char *newroot = "";
> -
> - /* local function prototypes */
> - static void fail_exit (int status);
> -+static void usage (void);
> -+static void process_flags (int argc, char **argv);
> -
> - static void fail_exit (int status)
> - {
> -@@ -82,6 +94,77 @@
> - 	exit (status);
> - }
> -
> -+/*
> -+ * usage - display usage message and exit
> -+ */
> -+static void usage (void)
> -+{
> -+	(void) fprintf (stderr,
> -+					_("Usage: grpconv [options]\n"
> -+					  "\n"
> -+					  "Options:\n"),
> -+					Prog);
> -+	(void) fputs (_("  -h, --help                    display this help message and exit\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> -+	(void) fputs ("\n", stderr);
> -+	exit (E_USAGE);
> -+}
> -+
> -+/*
> -+ * process_flags - perform command line argument setting
> -+ *
> -+ *	process_flags() interprets the command line arguments and sets
> -+ *	the values that the user will be created with accordingly. The
> -+ *	values are checked for sanity.
> -+ */
> -+static void process_flags (int argc, char **argv)
> -+{
> -+	{
> -+		/*
> -+		 * Parse the command line options.
> -+		 */
> -+		int c;
> -+		static struct option long_options[] = {
> -+			{"help", no_argument, NULL, 'h'},
> -+			{"root", required_argument, NULL, 'R'},
> -+			{NULL, 0, NULL, '\0'}
> -+		};
> -+		while ((c = getopt_long (argc, argv,
> -+								 "R:",
> -+								 long_options, NULL)) != -1) {
> -+			switch (c) {
> -+			case 'h':
> -+				usage ();
> -+				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+					         _("%s: invalid chroot path '%s'\n"),
> -+					         Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+					        _("%s: chroot directory %s does not exist\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+					        _("%s: unable to chroot to directory %s\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> -+			default:
> -+				usage ();
> -+			}
> -+		}
> -+	}
> -+}
> -+
> - int main (int argc, char **argv)
> - {
> - 	const struct group *gr;
> -@@ -89,9 +172,6 @@
> - 	const struct sgrp *sg;
> - 	struct sgrp sgent;
> -
> --	if (1 != argc) {
> --		(void) fputs (_("Usage: grpconv\n"), stderr);
> --	}
> - 	Prog = Basename (argv[0]);
> -
> - 	(void) setlocale (LC_ALL, "");
> -@@ -100,6 +180,8 @@
> -
> - 	OPENLOG ("grpconv");
> -
> -+	process_flags (argc, argv);
> -+
> - 	if (gr_lock () == 0) {
> - 		fprintf (stderr,
> - 		         _("%s: cannot lock %s; try again later.\n"),
> -diff -urN shadow-4.1.4.3.orig//src/grpunconv.c shadow-4.1.4.3//src/grpunconv.c
> ---- shadow-4.1.4.3.orig//src/grpunconv.c	2011-09-29 12:00:45.213000091 +0100
> -+++ shadow-4.1.4.3//src/grpunconv.c	2011-09-29 11:59:28.387000092 +0100
> -@@ -43,6 +43,7 @@
> - #include <stdlib.h>
> - #include <string.h>
> - #include <fcntl.h>
> -+#include <getopt.h>
> - #include <time.h>
> - #include <unistd.h>
> - #include <grp.h>
> -@@ -51,6 +52,14 @@
> - #ifdef SHADOWGRP
> - #include "groupio.h"
> - #include "sgroupio.h"
> -+
> -+/*
> -+ * exit status values
> -+ */
> -+/*@-exitarg@*/
> -+#define E_USAGE		2	/* invalid command syntax */
> -+#define E_BAD_ARG	3	/* invalid argument to option */
> -+
> - /*
> -  * Global variables
> -  */
> -@@ -58,9 +67,12 @@
> -
> - static bool gr_locked  = false;
> - static bool sgr_locked = false;
> -+static const char *newroot = "";
> -
> - /* local function prototypes */
> - static void fail_exit (int status);
> -+static void usage (void);
> -+static void process_flags (int argc, char **argv);
> -
> - static void fail_exit (int status)
> - {
> -@@ -83,6 +95,77 @@
> - 	exit (status);
> - }
> -
> -+/*
> -+ * usage - display usage message and exit
> -+ */
> -+static void usage (void)
> -+{
> -+	(void) fprintf (stderr,
> -+					_("Usage: grpunconv [options]\n"
> -+					  "\n"
> -+					  "Options:\n"),
> -+					Prog);
> -+	(void) fputs (_("  -h, --help                    display this help message and exit\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> -+	(void) fputs ("\n", stderr);
> -+	exit (E_USAGE);
> -+}
> -+
> -+/*
> -+ * process_flags - perform command line argument setting
> -+ *
> -+ * process_flags() interprets the command line arguments and sets
> -+ * the values that the user will be created with accordingly. The
> -+ * values are checked for sanity.
> -+ */
> -+static void process_flags (int argc, char **argv)
> -+{
> -+	{
> -+		/*
> -+		 * Parse the command line options.
> -+		 */
> -+		int c;
> -+		static struct option long_options[] = {
> -+			{"help", no_argument, NULL, 'h'},
> -+			{"root", required_argument, NULL, 'R'},
> -+			{NULL, 0, NULL, '\0'}
> -+		};
> -+		while ((c = getopt_long (argc, argv,
> -+								 "R:",
> -+								 long_options, NULL)) != -1) {
> -+			switch (c) {
> -+			case 'h':
> -+				usage ();
> -+				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+					         _("%s: invalid chroot path '%s'\n"),
> -+					         Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+					        _("%s: chroot directory %s does not exist\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+					        _("%s: unable to chroot to directory %s\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> -+			default:
> -+				usage ();
> -+			}
> -+		}
> -+	}
> -+}
> -+
> - int main (int argc, char **argv)
> - {
> - 	const struct group *gr;
> -@@ -100,6 +183,8 @@
> -
> - 	OPENLOG ("grpunconv");
> -
> -+	process_flags (argc, argv);
> -+
> - 	if (sgr_file_present () == 0) {
> - 		exit (0);	/* no /etc/gshadow, nothing to do */
> - 	}
> -diff -urN shadow-4.1.4.3.orig//src/passwd.c shadow-4.1.4.3//src/passwd.c
> ---- shadow-4.1.4.3.orig//src/passwd.c	2011-09-29 12:00:45.214000091 +0100
> -+++ shadow-4.1.4.3//src/passwd.c	2011-09-29 11:59:28.388000092 +0100
> -@@ -75,6 +75,7 @@
> - static char *name;		/* The name of user whose password is being changed */
> - static char *myname;		/* The current user's name */
> - static bool amroot;		/* The caller's real UID was 0 */
> -+static const char *newroot = "";
> -
> - static bool
> -     aflg = false,			/* -a - show status for all users */
> -@@ -174,6 +175,7 @@
> - 	         "  -n, --mindays MIN_DAYS        set minimum number of days before password\n"
> - 	         "                                change to MIN_DAYS\n"
> - 	         "  -q, --quiet                   quiet mode\n"
> -+	         "  -R, --root CHROOT_DIR         directory to chroot into\n"
> - 	         "  -r, --repository REPOSITORY   change password in REPOSITORY repository\n"
> - 	         "  -S, --status                  report password status on the named account\n"
> - 	         "  -u, --unlock                  unlock the password of the named account\n"
> -@@ -803,6 +805,7 @@
> - 			{"lock", no_argument, NULL, 'l'},
> - 			{"mindays", required_argument, NULL, 'n'},
> - 			{"quiet", no_argument, NULL, 'q'},
> -+			{"root", required_argument, NULL, 'R'},
> - 			{"repository", required_argument, NULL, 'r'},
> - 			{"status", no_argument, NULL, 'S'},
> - 			{"unlock", no_argument, NULL, 'u'},
> -@@ -811,7 +814,7 @@
> - 			{NULL, 0, NULL, '\0'}
> - 		};
> -
> --		while ((c = getopt_long (argc, argv, "adei:kln:qr:Suw:x:",
> -+		while ((c = getopt_long (argc, argv, "adei:kln:qR:r:Suw:x:",
> - 		                         long_options, &option_index)) != -1) {
> - 			switch (c) {
> - 			case 'a':
> -@@ -858,6 +861,28 @@
> - 			case 'q':
> - 				qflg = true;	/* ok for users */
> - 				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+					         _("%s: invalid chroot path '%s'\n"),
> -+					         Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+					        _("%s: chroot directory %s does not exist\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+				            _("%s: unable to chroot to directory %s\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> - 			case 'r':
> - 				/* -r repository (files|nis|nisplus) */
> - 				/* only "files" supported for now */
> -diff -urN shadow-4.1.4.3.orig//src/pwconv.c shadow-4.1.4.3//src/pwconv.c
> ---- shadow-4.1.4.3.orig//src/pwconv.c	2011-09-29 12:00:45.214000091 +0100
> -+++ shadow-4.1.4.3//src/pwconv.c	2011-09-29 11:59:28.388000092 +0100
> -@@ -59,6 +59,7 @@
> -
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <getopt.h>
> - #include <pwd.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -@@ -79,6 +80,7 @@
> - #define E_SUCCESS	0	/* success */
> - #define E_NOPERM	1	/* permission denied */
> - #define E_USAGE		2	/* invalid command syntax */
> -+#define E_BAD_ARG	3	/* invalid argument to option */
> - #define E_FAILURE	3	/* unexpected failure, nothing done */
> - #define E_MISSING	4	/* unexpected failure, passwd file missing */
> - #define E_PWDBUSY	5	/* passwd file(s) busy */
> -@@ -90,9 +92,12 @@
> -
> - static bool spw_locked = false;
> - static bool pw_locked = false;
> -+static const char *newroot = "";
> -
> - /* local function prototypes */
> - static void fail_exit (int status);
> -+static void usage (void);
> -+static void process_flags (int argc, char **argv);
> -
> - static void fail_exit (int status)
> - {
> -@@ -115,6 +120,77 @@
> - 	exit (status);
> - }
> -
> -+/*
> -+ * usage - display usage message and exit
> -+ */
> -+static void usage (void)
> -+{
> -+	(void) fprintf (stderr,
> -+					_("Usage: pwconv [options]\n"
> -+					  "\n"
> -+					  "Options:\n"),
> -+					Prog);
> -+	(void) fputs (_("  -h, --help                    display this help message and exit\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> -+	(void) fputs ("\n", stderr);
> -+	exit (E_USAGE);
> -+}
> -+
> -+/*
> -+ * process_flags - perform command line argument setting
> -+ *
> -+ *	process_flags() interprets the command line arguments and sets
> -+ *	the values that the user will be created with accordingly. The
> -+ *	values are checked for sanity.
> -+ */
> -+static void process_flags (int argc, char **argv)
> -+{
> -+	{
> -+		/*
> -+		 * Parse the command line options.
> -+		 */
> -+		int c;
> -+		static struct option long_options[] = {
> -+			{"help", no_argument, NULL, 'h'},
> -+			{"root", required_argument, NULL, 'R'},
> -+			{NULL, 0, NULL, '\0'}
> -+		};
> -+		while ((c = getopt_long (argc, argv,
> -+								 "R:",
> -+								 long_options, NULL)) != -1) {
> -+			switch (c) {
> -+			case 'h':
> -+				usage ();
> -+				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+					         _("%s: invalid chroot path '%s'\n"),
> -+					         Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+					        _("%s: chroot directory %s does not exist\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+					        _("%s: unable to chroot to directory %s\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> -+			default:
> -+				usage ();
> -+			}
> -+		}
> -+	}
> -+}
> -+
> - int main (int argc, char **argv)
> - {
> - 	const struct passwd *pw;
> -@@ -122,9 +198,6 @@
> - 	const struct spwd *sp;
> - 	struct spwd spent;
> -
> --	if (1 != argc) {
> --		(void) fputs (_("Usage: pwconv\n"), stderr);
> --	}
> - 	Prog = Basename (argv[0]);
> -
> - 	(void) setlocale (LC_ALL, "");
> -@@ -133,6 +206,8 @@
> -
> - 	OPENLOG ("pwconv");
> -
> -+	process_flags (argc, argv);
> -+
> - 	if (pw_lock () == 0) {
> - 		fprintf (stderr,
> - 		         _("%s: cannot lock %s; try again later.\n"),
> -diff -urN shadow-4.1.4.3.orig//src/pwunconv.c shadow-4.1.4.3//src/pwunconv.c
> ---- shadow-4.1.4.3.orig//src/pwunconv.c	2011-09-29 12:00:45.214000091 +0100
> -+++ shadow-4.1.4.3//src/pwunconv.c	2011-09-29 11:59:28.388000092 +0100
> -@@ -35,6 +35,7 @@
> - #ident "$Id: pwunconv.c 2852 2009-04-30 21:44:35Z nekral-guest $"
> -
> - #include <fcntl.h>
> -+#include <getopt.h>
> - #include <pwd.h>
> - #include <stdio.h>
> - #include <sys/types.h>
> -@@ -46,15 +47,24 @@
> - #include "shadowio.h"
> -
> - /*
> -+ * exit status values
> -+ */
> -+/*@-exitarg@*/
> -+#define E_USAGE		2	/* invalid command syntax */
> -+#define E_BAD_ARG	3	/* invalid argument to option */
> -+/*
> -  * Global variables
> -  */
> - char *Prog;
> -
> - static bool spw_locked = false;
> - static bool pw_locked = false;
> -+static const char *newroot = "";
> -
> - /* local function prototypes */
> - static void fail_exit (int status);
> -+static void usage (void);
> -+static void process_flags (int argc, char **argv);
> -
> - static void fail_exit (int status)
> - {
> -@@ -75,6 +85,76 @@
> - 	exit (status);
> - }
> -
> -+/*
> -+ * usage - display usage message and exit
> -+ */
> -+static void usage (void)
> -+{
> -+	(void) fprintf (stderr,
> -+					_("Usage: pwunconv [options]\n"
> -+					  "\n"
> -+					  "Options:\n"),
> -+					Prog);
> -+	(void) fputs (_("  -h, --help                    display this help message and exit\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> -+	(void) fputs ("\n", stderr);
> -+	exit (E_USAGE);
> -+}
> -+
> -+/*
> -+ * process_flags - perform command line argument setting
> -+ *
> -+ * process_flags() interprets the command line arguments and sets
> -+ * the values that the user will be created with accordingly. The
> -+ * values are checked for sanity.
> -+ */
> -+static void process_flags (int argc, char **argv)
> -+{
> -+	{
> -+		/*
> -+		 * Parse the command line options.
> -+		 */
> -+		int c;
> -+		static struct option long_options[] = {
> -+			{"help", no_argument, NULL, 'h'},
> -+			{"root", required_argument, NULL, 'R'},
> -+			{NULL, 0, NULL, '\0'}
> -+		};
> -+		while ((c = getopt_long (argc, argv,
> -+								 "R:",
> -+								 long_options, NULL)) != -1) {
> -+			switch (c) {
> -+			case 'h':
> -+				usage ();
> -+				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+					         _("%s: invalid chroot path '%s'\n"),
> -+					         Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+					        _("%s: chroot directory %s does not exist\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+					        _("%s: unable to chroot to directory %s\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> -+			default:
> -+				usage ();
> -+			}
> -+		}
> -+	}
> -+}
> -
> - int main (int argc, char **argv)
> - {
> -@@ -93,6 +173,8 @@
> -
> - 	OPENLOG ("pwunconv");
> -
> -+	process_flags (argc, argv);
> -+
> - 	if (!spw_file_present ()) {
> - 		/* shadow not installed, do nothing */
> - 		exit (0);
> -diff -urN shadow-4.1.4.3.orig//src/useradd.c shadow-4.1.4.3//src/useradd.c
> ---- shadow-4.1.4.3.orig//src/useradd.c	2011-09-29 12:00:45.215000091 +0100
> -+++ shadow-4.1.4.3//src/useradd.c	2011-09-29 11:59:28.520000092 +0100
> -@@ -112,6 +112,7 @@
> - #ifdef WITH_SELINUX
> - static const char *user_selinux = "";
> - #endif
> -+static const char *newroot = "";
> -
> - static long user_expire = -1;
> - static bool is_shadow_pwd;
> -@@ -189,6 +190,7 @@
> - static void new_spent (struct spwd *);
> - static void grp_update (void);
> -
> -+static void process_root_flag (int argc, char **argv);
> - static void process_flags (int argc, char **argv);
> - static void close_files (void);
> - static void open_files (void);
> -@@ -711,6 +713,7 @@
> - 	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
> - 	                "                                (non-unique) UID\n"), stderr);
> - 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), stderr);
> -+	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
> - 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), stderr);
> - 	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), stderr);
> -@@ -943,6 +946,57 @@
> - }
> -
> - /*
> -+ * process_root_flag - chroot if given the --root option
> -+ *
> -+ * We do this outside of process_flags() because
> -+ * the is_shadow_pwd boolean needs to be set before
> -+ * process_flags(), and if we do need to chroot() we
> -+ * must do so before is_shadow_pwd gets set.
> -+ */
> -+static void process_root_flag (int argc, char **argv)
> -+{
> -+	/*
> -+	 * Parse the command line options.
> -+	 */
> -+	int i;
> -+        char *root;
> -+
> -+        for (i = 0; i < argc; i++) {
> -+		if (!strcmp (argv[i], "--root") || !strcmp (argv[i], "-R")) {
> -+			if (i + 1 == argc) {
> -+				fprintf (stderr,
> -+				         _("%s: option '%s' requires an argument\n"),
> -+				         Prog, argv[i]);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			root = argv[i + 1];
> -+
> -+			if ('/' != root[0]) {
> -+				fprintf (stderr,
> -+				         _("%s: invalid chroot path '%s'\n"),
> -+				         Prog, root);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			newroot = root;
> -+
> -+			if (access (newroot, F_OK) != 0) {
> -+				fprintf(stderr,
> -+				        _("%s: chroot directory %s does not exist\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			if ( chroot(newroot) != 0 ) {
> -+				fprintf(stderr,
> -+				        _("%s: unable to chroot to directory %s\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			break;
> -+		}
> -+	}
> -+}
> -+
> -+/*
> -  * process_flags - perform command line argument setting
> -  *
> -  *	process_flags() interprets the command line arguments and sets
> -@@ -978,6 +1032,7 @@
> - 			{"no-user-group", no_argument, NULL, 'N'},
> - 			{"non-unique", no_argument, NULL, 'o'},
> - 			{"password", required_argument, NULL, 'p'},
> -+			{"root", required_argument, NULL, 'R'},
> - 			{"system", no_argument, NULL, 'r'},
> - 			{"shell", required_argument, NULL, 's'},
> - #ifdef WITH_SELINUX
> -@@ -989,9 +1044,9 @@
> - 		};
> - 		while ((c = getopt_long (argc, argv,
> - #ifdef WITH_SELINUX
> --		                         "b:c:d:De:f:g:G:k:K:lmMNop:rs:u:UZ:",
> -+		                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:UZ:",
> - #else
> --		                         "b:c:d:De:f:g:G:k:K:lmMNop:rs:u:U",
> -+		                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:U",
> - #endif
> - 		                         long_options, NULL)) != -1) {
> - 			switch (c) {
> -@@ -1156,6 +1211,9 @@
> - 				}
> - 				user_pass = optarg;
> - 				break;
> -+			case 'R':
> -+				/* no-op since we handled this in process_root_flag() earlier */
> -+				break;
> - 			case 'r':
> - 				rflg = true;
> - 				break;
> -@@ -1735,6 +1793,36 @@
> - 	}
> - }
> - #endif
> -+
> -+/*
> -+ * mkdir_p - create directories, including parent directories when needed
> -+ *
> -+ * similar to mkdir -p
> -+ */
> -+void mkdir_p(const char *path) {
> -+	int len = strlen(path);
> -+	char newdir[len + 1];
> -+	mode_t mode = 0755;
> -+	int i = 0;
> -+
> -+	if (path[i] == '\0') {
> -+		return;
> -+	}
> -+
> -+	/* skip the leading '/' */
> -+	i++;
> -+
> -+	while(path[i] != '\0') {
> -+		if (path[i] == '/') {
> -+			strncpy(newdir, path, i);
> -+			newdir[i] = '\0';
> -+			mkdir(newdir, mode);
> -+		}
> -+		i++;
> -+	}
> -+	mkdir(path, mode);
> -+}
> -+
> - /*
> -  * create_home - create the user's home directory
> -  *
> -@@ -1748,34 +1836,31 @@
> - #ifdef WITH_SELINUX
> - 		selinux_file_context (user_home);
> - #endif
> --		/* XXX - create missing parent directories.  --marekm */
> --		if (mkdir (user_home, 0) != 0) {
> --			fprintf (stderr,
> --			         _("%s: cannot create directory %s\n"),
> --			         Prog, user_home);
> --#ifdef WITH_AUDIT
> --			audit_logger (AUDIT_ADD_USER, Prog,
> --			              "adding home directory",
> --			              user_name, (unsigned int) user_id,
> --			              SHADOW_AUDIT_FAILURE);
> --#endif
> --			fail_exit (E_HOMEDIR);
> --		}
> --		chown (user_home, user_id, user_gid);
> --		chmod (user_home,
> --		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
> --		home_added = true;
> -+		mkdir_p(user_home);
> -+	}
> -+	if (access (user_home, F_OK) != 0) {
> - #ifdef WITH_AUDIT
> - 		audit_logger (AUDIT_ADD_USER, Prog,
> - 		              "adding home directory",
> - 		              user_name, (unsigned int) user_id,
> --		              SHADOW_AUDIT_SUCCESS);
> -+		              SHADOW_AUDIT_FAILURE);
> -+#endif
> -+		fail_exit (E_HOMEDIR);
> -+	}
> -+	chown (user_home, user_id, user_gid);
> -+	chmod (user_home,
> -+	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
> -+	home_added = true;
> -+#ifdef WITH_AUDIT
> -+	audit_logger (AUDIT_ADD_USER, Prog,
> -+	              "adding home directory",
> -+	              user_name, (unsigned int) user_id,
> -+	              SHADOW_AUDIT_SUCCESS);
> - #endif
> - #ifdef WITH_SELINUX
> --		/* Reset SELinux to create files with default contexts */
> --		setfscreatecon (NULL);
> -+	/* Reset SELinux to create files with default contexts */
> -+	setfscreatecon (NULL);
> - #endif
> --	}
> - }
> -
> - /*
> -@@ -1861,6 +1946,7 @@
> - 	 */
> - 	user_groups[0] = (char *) 0;
> -
> -+	process_root_flag (argc, argv);
> -
> - 	is_shadow_pwd = spw_file_present ();
> - #ifdef SHADOWGRP
> -diff -urN shadow-4.1.4.3.orig//src/userdel.c shadow-4.1.4.3//src/userdel.c
> ---- shadow-4.1.4.3.orig//src/userdel.c	2011-09-29 12:00:45.216000091 +0100
> -+++ shadow-4.1.4.3//src/userdel.c	2011-09-29 11:59:28.389000092 +0100
> -@@ -79,6 +79,7 @@
> - static char *user_name;
> - static uid_t user_id;
> - static char *user_home;
> -+static const char *newroot = "";
> -
> - static bool fflg = false;
> - static bool rflg = false;
> -@@ -119,6 +120,7 @@
> - 	         "  -f, --force                   force removal of files,\n"
> - 	         "                                even if not owned by user\n"
> - 	         "  -h, --help                    display this help message and exit\n"
> -+	         "  -R, --root CHROOT_DIR         directory to chroot into\n"
> - 	         "  -r, --remove                  remove home directory and mail spool\n"
> - 	         "\n"), stderr);
> - 	exit (E_USAGE);
> -@@ -768,12 +770,34 @@
> - 			{"remove", no_argument, NULL, 'r'},
> - 			{NULL, 0, NULL, '\0'}
> - 		};
> --		while ((c = getopt_long (argc, argv, "fhr",
> -+		while ((c = getopt_long (argc, argv, "fhR:r",
> - 		                         long_options, NULL)) != -1) {
> - 			switch (c) {
> - 			case 'f':	/* force remove even if not owned by user */
> - 				fflg = true;
> - 				break;
> -+			case 'R':
> -+				if ('/' != optarg[0]) {
> -+					fprintf (stderr,
> -+					         _("%s: invalid chroot path '%s'\n"),
> -+					         Prog, optarg);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				newroot = optarg;
> -+
> -+				if (access (newroot, F_OK) != 0) {
> -+					fprintf(stderr,
> -+					        _("%s: chroot directory %s does not exist\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				if ( chroot(newroot) != 0 ) {
> -+					fprintf(stderr,
> -+					        _("%s: unable to chroot to directory %s\n"),
> -+					        Prog, newroot);
> -+					exit (E_BAD_ARG);
> -+				}
> -+				break;
> - 			case 'r':	/* remove home dir and mailbox */
> - 				rflg = true;
> - 				break;
> -diff -urN shadow-4.1.4.3.orig//src/usermod.c shadow-4.1.4.3//src/usermod.c
> ---- shadow-4.1.4.3.orig//src/usermod.c	2011-09-29 12:00:45.216000091 +0100
> -+++ shadow-4.1.4.3//src/usermod.c	2011-09-29 11:59:28.390000092 +0100
> -@@ -110,6 +110,7 @@
> - static long user_newinactive;
> - static long sys_ngroups;
> - static char **user_groups;	/* NULL-terminated list */
> -+static const char *newroot = "";
> -
> - static bool
> -     aflg = false,		/* append to existing secondary group set */
> -@@ -164,6 +165,7 @@
> - #endif
> - static void grp_update (void);
> -
> -+static void process_root_flag (int, char **);
> - static void process_flags (int, char **);
> - static void close_files (void);
> - static void open_files (void);
> -@@ -323,6 +325,7 @@
> - 	         "                                new location (use only with -d)\n"
> - 	         "  -o, --non-unique              allow using duplicate (non-unique) UID\n"
> - 	         "  -p, --password PASSWORD       use encrypted password for the new password\n"
> -+	         "  -R  --root CHROOT_DIR         directory to chroot into\n"
> - 	         "  -s, --shell SHELL             new login shell for the user account\n"
> - 	         "  -u, --uid UID                 new UID for the user account\n"
> - 	         "  -U, --unlock                  unlock the user account\n"
> -@@ -802,6 +805,58 @@
> - }
> -
> - /*
> -+ * process_root_flag - chroot if given the --root option
> -+ *
> -+ * We do this outside of process_flags() because
> -+ * the is_shadow_pwd boolean needs to be set before
> -+ * process_flags(), and if we do need to chroot() we
> -+ * must do so before is_shadow_pwd gets set.
> -+ */
> -+static void process_root_flag (int argc, char **argv)
> -+{
> -+	/*
> -+	 * Parse the command line options.
> -+	 */
> -+	int i;
> -+        char *root;
> -+
> -+        for (i = 0; i < argc; i++) {
> -+		if (!strcmp (argv[i], "--root") || !strcmp (argv[i], "-R")) {
> -+			if (i + 1 == argc) {
> -+				fprintf (stderr,
> -+				         _("%s: option '%s' requires an argument\n"),
> -+				         Prog, argv[i]);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			root = argv[i + 1];
> -+
> -+			if (    (!VALID (root) )
> -+				|| (   ('/' != root[0]) ) ) {
> -+				fprintf (stderr,
> -+				         _("%s: invalid chroot path '%s'\n"),
> -+				         Prog, root);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			newroot = root;
> -+
> -+			if (access (newroot, F_OK) != 0) {
> -+				fprintf(stderr,
> -+				        _("%s: chroot directory %s does not exist\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			if ( chroot(newroot) != 0 ) {
> -+				fprintf(stderr,
> -+				        _("%s: unable to chroot to directory %s\n"),
> -+				        Prog, newroot);
> -+				exit (E_BAD_ARG);
> -+			}
> -+			break;
> -+		}
> -+	}
> -+}
> -+
> -+/*
> -  * process_flags - perform command line argument setting
> -  *
> -  *	process_flags() interprets the command line arguments and sets the
> -@@ -895,6 +950,7 @@
> - 			{"move-home", no_argument, NULL, 'm'},
> - 			{"non-unique", no_argument, NULL, 'o'},
> - 			{"password", required_argument, NULL, 'p'},
> -+			{"root", required_argument, NULL, 'R'},
> - #ifdef WITH_SELINUX
> - 			{"selinux-user", required_argument, NULL, 'Z'},
> - #endif
> -@@ -905,9 +961,9 @@
> - 		};
> - 		while ((c = getopt_long (argc, argv,
> - #ifdef WITH_SELINUX
> --			                 "ac:d:e:f:g:G:hl:Lmop:s:u:UZ:",
> -+			                 "ac:d:e:f:g:G:hl:Lmop:R:s:u:UZ:",
> - #else
> --			                 "ac:d:e:f:g:G:hl:Lmop:s:u:U",
> -+			                 "ac:d:e:f:g:G:hl:Lmop:R:s:u:U",
> - #endif
> - 			                 long_options, NULL)) != -1) {
> - 			switch (c) {
> -@@ -999,6 +1055,9 @@
> - 				user_pass = optarg;
> - 				pflg = true;
> - 				break;
> -+			case 'R':
> -+				/* no-op since we handled this in process_root_flag() earlier */
> -+				break;
> - 			case 's':
> - 				if (!VALID (optarg)) {
> - 					fprintf (stderr,
> -@@ -1715,6 +1774,8 @@
> -
> - 	OPENLOG ("usermod");
> -
> -+	process_root_flag (argc, argv);
> -+
> - 	is_shadow_pwd = spw_file_present ();
> - #ifdef SHADOWGRP
> - 	is_shadow_grp = sgr_file_present ();
> diff --git a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
> index eafb935..68da25f 100644
> --- a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
> +++ b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
> @@ -3,20 +3,19 @@ Upstream-Status: Inappropriate [OE specific]
>   Allow for setting password in clear text.
>
>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>   ---
>    src/Makefile.am |    8 ++++----
>    src/groupadd.c  |    8 +++++++-
> - src/groupmod.c  |    9 ++++++++-
> + src/groupmod.c  |    8 +++++++-
>    src/useradd.c   |    9 +++++++--
> - src/usermod.c   |   10 ++++++++--
> - 5 files changed, 34 insertions(+), 10 deletions(-)
> + src/usermod.c   |    8 +++++++-
> + 5 files changed, 32 insertions(+), 9 deletions(-)
>
>   diff --git a/src/Makefile.am b/src/Makefile.am
> -index 6a3b4c5..1ffdbc6 100644
> +index 25e288d..856b087 100644
>   --- a/src/Makefile.am
>   +++ b/src/Makefile.am
> -@@ -76,10 +76,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBSELINUX) $(LIBCRYPT)
> +@@ -88,10 +88,10 @@ chgpasswd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBSELINUX) $(LIBCRYPT)
>    chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
>    chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBSELINUX) $(LIBCRYPT)
>    gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
> @@ -29,47 +28,46 @@ index 6a3b4c5..1ffdbc6 100644
>    grpck_LDADD    = $(LDADD) $(LIBSELINUX)
>    grpconv_LDADD  = $(LDADD) $(LIBSELINUX)
>    grpunconv_LDADD = $(LDADD) $(LIBSELINUX)
> -@@ -99,9 +99,9 @@ su_SOURCES     = \
> +@@ -111,9 +111,9 @@ su_SOURCES     = \
>    	suauth.c
>    su_LDADD       = $(LDADD) $(LIBPAM) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD)
>    sulogin_LDADD  = $(LDADD) $(LIBCRYPT)
> --useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> -+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
> - userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> --usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX)
> -+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT)
> +-useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
> ++useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
> + userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE)
> +-usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR)
> ++usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBCRYPT)
>    vipw_LDADD     = $(LDADD) $(LIBSELINUX)
>
>    install-am: all-am
>   diff --git a/src/groupadd.c b/src/groupadd.c
> -index 66b38de..3157486 100644
> +index f716f57..4e28c26 100644
>   --- a/src/groupadd.c
>   +++ b/src/groupadd.c
> -@@ -124,6 +124,7 @@ static void usage (void)
> +@@ -124,6 +124,7 @@ static /*@noreturn@*/void usage (int status)
>    	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
> - 	                "                                (non-unique) GID\n"), stderr);
> - 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), stderr);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD use this clear text password for the new group\n"), stderr);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
> - 	(void) fputs ("\n", stderr);
> -@@ -388,13 +389,14 @@ static void process_flags (int argc, char **argv)
> - 		{"key", required_argument, NULL, 'K'},
> - 		{"non-unique", no_argument, NULL, 'o'},
> - 		{"password", required_argument, NULL, 'p'},
> + 	                "                                (non-unique) GID\n"), usageout);
> + 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), usageout);
> ++	(void) fputs (_("  -P, --clear-password PASSWORD use this clear password for the new group\n"), usageout);
> + 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
> + 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> + 	(void) fputs ("\n", usageout);
> +@@ -387,12 +388,13 @@ static void process_flags (int argc, char **argv)
> + 		{"key",        required_argument, NULL, 'K'},
> + 		{"non-unique", no_argument,       NULL, 'o'},
> + 		{"password",   required_argument, NULL, 'p'},
>   +		{"clear-password", required_argument, NULL, 'P'},
> - 		{"root", required_argument, NULL, 'R'},
> - 		{"system", no_argument, NULL, 'r'},
> + 		{"system",     no_argument,       NULL, 'r'},
> + 		{"root",       required_argument, NULL, 'R'},
>    		{NULL, 0, NULL, '\0'}
>    	};
>
> - 	while ((c =
> --		getopt_long (argc, argv, "fg:hK:op:R:r", long_options,
> -+		getopt_long (argc, argv, "fg:hK:op:P:R:r", long_options,
> - 		             &option_index)) != -1) {
> +-	while ((c = getopt_long (argc, argv, "fg:hK:op:rR:",
> ++	while ((c = getopt_long (argc, argv, "fg:hK:op:P:rR:",
> + 		                 long_options, NULL)) != -1) {
>    		switch (c) {
>    		case 'f':
> -@@ -446,6 +448,10 @@ static void process_flags (int argc, char **argv)
> +@@ -444,6 +446,10 @@ static void process_flags (int argc, char **argv)
>    			pflg = true;
>    			group_passwd = optarg;
>    			break;
> @@ -77,37 +75,35 @@ index 66b38de..3157486 100644
>   +			pflg = true;
>   +			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
>   +			break;
> - 		case 'R':
> - 			if ('/' != optarg[0]) {
> - 				fprintf (stderr,
> + 		case 'r':
> + 			rflg = true;
> + 			break;
>   diff --git a/src/groupmod.c b/src/groupmod.c
> -index 27eb159..17acbc3 100644
> +index d9d3807..68f49d1 100644
>   --- a/src/groupmod.c
>   +++ b/src/groupmod.c
> -@@ -127,6 +127,8 @@ static void usage (void)
> - 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), stderr);
> +@@ -127,6 +127,7 @@ static void usage (int status)
> + 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), usageout);
>    	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
> - 	                "                                PASSWORD\n"), stderr);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this (clear text)\n"
> -+	                "                                PASSWORD\n"), stderr);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> - 	(void) fputs ("\n", stderr);
> - 	exit (E_USAGE);
> -@@ -348,11 +350,12 @@ static void process_flags (int argc, char **argv)
> - 		{"new-name", required_argument, NULL, 'n'},
> - 		{"non-unique", no_argument, NULL, 'o'},
> - 		{"password", required_argument, NULL, 'p'},
> + 	                "                                PASSWORD\n"), usageout);
> ++	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this clear PASSWORD\n"), usageout);
> + 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> + 	(void) fputs ("\n", usageout);
> + 	exit (status);
> +@@ -375,10 +376,11 @@ static void process_flags (int argc, char **argv)
> + 		{"new-name",   required_argument, NULL, 'n'},
> + 		{"non-unique", no_argument,       NULL, 'o'},
> + 		{"password",   required_argument, NULL, 'p'},
>   +		{"clear-password", required_argument, NULL, 'P'},
> - 		{"root", required_argument, NULL, 'R'},
> + 		{"root",       required_argument, NULL, 'R'},
>    		{NULL, 0, NULL, '\0'}
>    	};
> - 	while ((c =
> --		getopt_long (argc, argv, "g:hn:op:R:",
> -+		getopt_long (argc, argv, "g:hn:op:P:R:",
> - 		             long_options, &option_index)) != -1) {
> +-	while ((c = getopt_long (argc, argv, "g:hn:op:R:",
> ++	while ((c = getopt_long (argc, argv, "g:hn:op:P:R:",
> + 		                 long_options, NULL)) != -1) {
>    		switch (c) {
>    		case 'g':
> -@@ -376,6 +379,10 @@ static void process_flags (int argc, char **argv)
> +@@ -405,6 +407,10 @@ static void process_flags (int argc, char **argv)
>    			group_passwd = optarg;
>    			pflg = true;
>    			break;
> @@ -115,84 +111,81 @@ index 27eb159..17acbc3 100644
>   +			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
>   +			pflg = true;
>   +			break;
> - 		case 'R':
> - 			if ('/' != optarg[0]) {
> - 				fprintf (stderr,
> + 		case 'R': /* no-op, handled in process_root_flag () */
> + 			break;
> + 		default:
>   diff --git a/src/useradd.c b/src/useradd.c
> -index 2102630..390909c 100644
> +index b3bd451..4416f90 100644
>   --- a/src/useradd.c
>   +++ b/src/useradd.c
> -@@ -716,6 +716,7 @@ static void usage (void)
> +@@ -773,6 +773,7 @@ static void usage (int status)
>    	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
> - 	                "                                (non-unique) UID\n"), stderr);
> - 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), stderr);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD clear text password of the new account\n"), stderr);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), stderr);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), stderr);
> - 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), stderr);
> -@@ -1035,6 +1036,7 @@ static void process_flags (int argc, char **argv)
> - 			{"no-user-group", no_argument, NULL, 'N'},
> - 			{"non-unique", no_argument, NULL, 'o'},
> - 			{"password", required_argument, NULL, 'p'},
> + 	                "                                (non-unique) UID\n"), usageout);
> + 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
> ++	(void) fputs (_("  -P, --clear-password PASSWORD clear password of the new account\n"), usageout);
> + 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
> + 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> + 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
> +@@ -1047,6 +1048,7 @@ static void process_flags (int argc, char **argv)
> + 			{"no-user-group",  no_argument,       NULL, 'N'},
> + 			{"non-unique",     no_argument,       NULL, 'o'},
> + 			{"password",       required_argument, NULL, 'p'},
>   +			{"clear-password", required_argument, NULL, 'P'},
> - 			{"root", required_argument, NULL, 'R'},
> - 			{"system", no_argument, NULL, 'r'},
> - 			{"shell", required_argument, NULL, 's'},
> -@@ -1047,9 +1049,9 @@ static void process_flags (int argc, char **argv)
> + 			{"system",         no_argument,       NULL, 'r'},
> + 			{"root",           required_argument, NULL, 'R'},
> + 			{"shell",          required_argument, NULL, 's'},
> +@@ -1059,9 +1061,9 @@ static void process_flags (int argc, char **argv)
>    		};
>    		while ((c = getopt_long (argc, argv,
>    #ifdef WITH_SELINUX
> --		                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:UZ:",
> -+		                         "b:c:d:De:f:g:G:k:K:lmMNop:P:R:rs:u:UZ:",
> - #else
> --		                         "b:c:d:De:f:g:G:k:K:lmMNop:R:rs:u:U",
> -+		                         "b:c:d:De:f:g:G:k:K:lmMNop:P:R:rs:u:U",
> - #endif
> +-		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:s:u:UZ:",
> ++		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:s:u:UZ:",
> + #else				/* !WITH_SELINUX */
> +-		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:s:u:U",
> ++		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:s:u:U",
> + #endif				/* !WITH_SELINUX */
>    		                         long_options, NULL)) != -1) {
>    			switch (c) {
> -@@ -1214,6 +1216,9 @@ static void process_flags (int argc, char **argv)
> +@@ -1227,6 +1229,9 @@ static void process_flags (int argc, char **argv)
>    				}
>    				user_pass = optarg;
>    				break;
> -+			case 'P':	/* set clear text password */
> ++			case 'P': /* set clear text password */
>   +				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
>   +				break;
> - 			case 'R':
> - 				/* no-op since we handled this in process_root_flag() earlier */
> + 			case 'r':
> + 				rflg = true;
>    				break;
>   diff --git a/src/usermod.c b/src/usermod.c
> -index 8363597..f4c1cee 100644
> +index e7d4351..b79f7a3 100644
>   --- a/src/usermod.c
>   +++ b/src/usermod.c
> -@@ -325,6 +325,7 @@ static void usage (void)
> - 	         "                                new location (use only with -d)\n"
> - 	         "  -o, --non-unique              allow using duplicate (non-unique) UID\n"
> - 	         "  -p, --password PASSWORD       use encrypted password for the new password\n"
> -+	         "  -P, --clear-password PASSWORD       use clear text password for the new password\n"
> - 	         "  -R  --root CHROOT_DIR         directory to chroot into\n"
> - 	         "  -s, --shell SHELL             new login shell for the user account\n"
> - 	         "  -u, --uid UID                 new UID for the user account\n"
> -@@ -950,6 +951,7 @@ static void process_flags (int argc, char **argv)
> - 			{"move-home", no_argument, NULL, 'm'},
> - 			{"non-unique", no_argument, NULL, 'o'},
> - 			{"password", required_argument, NULL, 'p'},
> +@@ -419,6 +419,7 @@ static /*@noreturn@*/void usage (int status)
> + 	                "                                new location (use only with -d)\n"), usageout);
> + 	(void) fputs (_("  -o, --non-unique              allow using duplicate (non-unique) UID\n"), usageout);
> + 	(void) fputs (_("  -p, --password PASSWORD       use encrypted password for the new password\n"), usageout);
> ++	(void) fputs (_("  -P, --clear-password PASSWORD use clear password for the new password\n"), usageout);
> + 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> + 	(void) fputs (_("  -s, --shell SHELL             new login shell for the user account\n"), usageout);
> + 	(void) fputs (_("  -u, --uid UID                 new UID for the user account\n"), usageout);
> +@@ -996,6 +997,7 @@ static void process_flags (int argc, char **argv)
> + 			{"move-home",    no_argument,       NULL, 'm'},
> + 			{"non-unique",   no_argument,       NULL, 'o'},
> + 			{"password",     required_argument, NULL, 'p'},
>   +			{"clear-password", required_argument, NULL, 'P'},
> - 			{"root", required_argument, NULL, 'R'},
> - #ifdef WITH_SELINUX
> - 			{"selinux-user", required_argument, NULL, 'Z'},
> -@@ -961,9 +963,9 @@ static void process_flags (int argc, char **argv)
> + 			{"root",         required_argument, NULL, 'R'},
> + 			{"shell",        required_argument, NULL, 's'},
> + 			{"uid",          required_argument, NULL, 'u'},
> +@@ -1012,7 +1014,7 @@ static void process_flags (int argc, char **argv)
> + 			{NULL, 0, NULL, '\0'}
>    		};
>    		while ((c = getopt_long (argc, argv,
> - #ifdef WITH_SELINUX
> --			                 "ac:d:e:f:g:G:hl:Lmop:R:s:u:UZ:",
> -+			                 "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:UZ:",
> - #else
> --			                 "ac:d:e:f:g:G:hl:Lmop:R:s:u:U",
> -+			                 "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:U",
> - #endif
> - 			                 long_options, NULL)) != -1) {
> - 			switch (c) {
> -@@ -1055,6 +1057,10 @@ static void process_flags (int argc, char **argv)
> +-		                         "ac:d:e:f:g:G:hl:Lmop:R:s:u:U"
> ++		                         "ac:d:e:f:g:G:hl:Lmop:P:R:s:u:U"
> + #ifdef ENABLE_SUBIDS
> + 		                         "v:w:V:W:"
> + #endif				/* ENABLE_SUBIDS */
> +@@ -1112,6 +1114,10 @@ static void process_flags (int argc, char **argv)
>    				user_pass = optarg;
>    				pflg = true;
>    				break;
> @@ -200,9 +193,9 @@ index 8363597..f4c1cee 100644
>   +				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
>   +				pflg = true;
>   +				break;
> - 			case 'R':
> - 				/* no-op since we handled this in process_root_flag() earlier */
> + 			case 'R': /* no-op, handled in process_root_flag () */
>    				break;
> + 			case 's':
>   --
>   1.7.9.5
>
> diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> new file mode 100644
> index 0000000..4fa3d18
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> @@ -0,0 +1,46 @@
> +Upstream-Status: Inappropriate [OE specific]
> +
> +commonio.c: fix unexpected open failure in chroot environment
> +
> +When using commands with '-R <newroot>' option in our pseudo environment,
> +we would usually get the 'Pemission Denied' error. This patch serves as
> +a workaround to this problem.
> +
> +Note that this patch doesn't change the logic in the code, it just expands
> +the codes.
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + lib/commonio.c |   16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/commonio.c b/lib/commonio.c
> +index cc536bf..51cafd9 100644
> +--- a/lib/commonio.c
> ++++ b/lib/commonio.c
> +@@ -613,10 +613,18 @@ int commonio_open (struct commonio_db *db, int mode)
> + 	db->cursor = NULL;
> + 	db->changed = false;
> +
> +-	fd = open (db->filename,
> +-	             (db->readonly ? O_RDONLY : O_RDWR)
> +-	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
> +-	saved_errno = errno;
> ++	if (db->readonly) {
> ++		fd = open (db->filename,
> ++			   (true ? O_RDONLY : O_RDWR)
> ++			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
> ++		saved_errno = errno;
> ++	} else {
> ++		fd = open (db->filename,
> ++			   (false ? O_RDONLY : O_RDWR)
> ++			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
> ++		saved_errno = errno;
> ++	}
> ++
> + 	db->fp = NULL;
> + 	if (fd >= 0) {
> + #ifdef WITH_TCB
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
> deleted file mode 100644
> index 80ebdc2..0000000
> --- a/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -shadow: Fix parsing of gshadow entries
> -
> -Upstream-Status: Backport [http://anonscm.debian.org/viewvc/pkg-shadow?view=revision&revision=3096]
> -
> -newgrp command does not function properly.
> -Even with the valid password, it outputs: "'Invalid password'"
> -
> -Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> -
> -2010-02-14  Michael Bunk  <mb@computer-leipzig.com>
> -
> -	* NEWS, lib/gshadow.c: Fix parsing of gshadow entries.
> -
> -diff -urpN a/lib/gshadow.c b/lib/gshadow.c
> ---- a/lib/gshadow.c	2013-07-11 10:18:15.745450428 +0800
> -+++ b/lib/gshadow.c	2013-07-11 10:17:30.465450280 +0800
> -@@ -222,6 +222,7 @@ void endsgent (void)
> - 		if (NULL == buf) {
> - 			return NULL;
> - 		}
> -+		buflen = BUFSIZ;
> - 	}
> -
> - 	if (NULL == fp) {
> -@@ -229,9 +230,9 @@ void endsgent (void)
> - 	}
> -
> - #ifdef	USE_NIS
> --	while (fgetsx (buf, (int) sizeof buf, fp) == buf)
> -+	while (fgetsx (buf, (int) buflen, fp) == buf)
> - #else
> --	if (fgetsx (buf, (int) sizeof buf, fp) == buf)
> -+	if (fgetsx (buf, (int) buflen, fp) == buf)
> - #endif
> - 	{
> - 		while (   ((cp = strrchr (buf, '\n')) == NULL)
> diff --git a/meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch b/meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
> new file mode 100644
> index 0000000..aca5252
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
> @@ -0,0 +1,28 @@
> +From 384f8c0b4800eb910a975ab9bd3b8bd2e1d89269 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 27 May 2014 14:23:56 +0800
> +Subject: [PATCH] fix installation failure with subids disabled
> +
> +---
> + src/Makefile.am |    5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 25e288d..076f8ef 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -52,7 +52,10 @@ usbin_PROGRAMS = \
> + noinst_PROGRAMS = id sulogin
> +
> + suidbins       = su
> +-suidubins      = chage chfn chsh expiry gpasswd newgrp passwd newuidmap newgidmap
> ++suidubins      = chage chfn chsh expiry gpasswd newgrp passwd
> ++if ENABLE_SUBIDS
> ++suidubins += newgidmap newuidmap
> ++endif
> + if ACCT_TOOLS_SETUID
> + 	suidubins += chage chgpasswd chpasswd groupadd groupdel groupmod newusers useradd userdel usermod
> + endif
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
> deleted file mode 100644
> index 6514746..0000000
> --- a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -# commit message copied from openembedded:
> -#    commit 246c80637b135f3a113d319b163422f98174ee6c
> -#    Author: Khem Raj <raj.khem@gmail.com>
> -#    Date:   Wed Jun 9 13:37:03 2010 -0700
> -#
> -#    shadow-4.1.4.2: Add patches to support dots in login id.
> -#
> -#    Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -#
> -# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-08-11
> -
> -http://bugs.gentoo.org/283725
> -https://alioth.debian.org/tracker/index.php?func=detail&aid=311740&group_id=30580&atid=411480
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -Index: shadow-4.1.4.2/libmisc/env.c
> -===================================================================
> ---- shadow-4.1.4.2.orig/libmisc/env.c	2009-04-27 13:07:56.000000000 -0700
> -+++ shadow-4.1.4.2/libmisc/env.c	2010-06-03 17:44:51.456408474 -0700
> -@@ -251,7 +251,7 @@ void sanitize_env (void)
> - 			if (strncmp (*cur, *bad, strlen (*bad)) != 0) {
> - 				continue;
> - 			}
> --			if (strchr (*cur, '/') != NULL) {
> -+			if (strchr (*cur, '/') == NULL) {
> - 				continue;	/* OK */
> - 			}
> - 			for (move = cur; NULL != *move; move++) {
> diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
> deleted file mode 100644
> index 640200b..0000000
> --- a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -# commit message copied from openembedded:
> -#    commit 246c80637b135f3a113d319b163422f98174ee6c
> -#    Author: Khem Raj <raj.khem@gmail.com>
> -#    Date:   Wed Jun 9 13:37:03 2010 -0700
> -#
> -#    shadow-4.1.4.2: Add patches to support dots in login id.
> -#
> -#    Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -#
> -# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-08-11
> -
> -http://bugs.gentoo.org/300790
> -http://lists.alioth.debian.org/pipermail/pkg-shadow-devel/2009-November/007850.html
> -
> -2009-11-05  Nicolas François  <nicolas.francois@centraliens.net>
> -
> -	* NEWS, src/groupmod.c: Fixed groupmod when configured with
> -	--enable-account-tools-setuid.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -Index: shadow-4.1.4.2/src/groupmod.c
> -===================================================================
> ---- shadow-4.1.4.2.orig/src/groupmod.c	2009-06-05 15:16:58.000000000 -0700
> -+++ shadow-4.1.4.2/src/groupmod.c	2010-06-03 17:45:43.828952613 -0700
> -@@ -720,7 +720,7 @@ int main (int argc, char **argv)
> - 	{
> - 		struct passwd *pampw;
> - 		pampw = getpwuid (getuid ()); /* local, no need for xgetpwuid */
> --		if (NULL == pamh) {
> -+		if (NULL == pampw) {
> - 			fprintf (stderr,
> - 			         _("%s: Cannot determine your user name.\n"),
> - 			         Prog);
> diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
> deleted file mode 100644
> index 0dc4d75..0000000
> --- a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -# commit message copied from openembedded:
> -#    commit 246c80637b135f3a113d319b163422f98174ee6c
> -#    Author: Khem Raj <raj.khem@gmail.com>
> -#    Date:   Wed Jun 9 13:37:03 2010 -0700
> -#
> -#    shadow-4.1.4.2: Add patches to support dots in login id.
> -#
> -#    Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -#
> -# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-08-11
> -
> -http://bugs.gentoo.org/show_bug.cgi?id=301957
> -https://alioth.debian.org/scm/browser.php?group_id=30580
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -Index: shadow-4.1.4.2/src/su.c
> -===================================================================
> ---- shadow-4.1.4.2.orig/src/su.c	2009-07-23 13:38:56.000000000 -0700
> -+++ shadow-4.1.4.2/src/su.c	2010-06-03 17:46:47.718944010 -0700
> -@@ -378,7 +378,7 @@ int main (int argc, char **argv)
> - #endif
> - #endif				/* !USE_PAM */
> -
> --	sanitize_env ();
> -+	/* sanitize_env (); */
> -
> - 	(void) setlocale (LC_ALL, "");
> - 	(void) bindtextdomain (PACKAGE, LOCALEDIR);
> diff --git a/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch b/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
> deleted file mode 100644
> index a793f09..0000000
> --- a/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -# patch is from openembedded:
> -#    commit 2db61370333f7a2fc1dbb86385734883387e0217
> -#    Author: Martin Jansa <Martin.Jansa@gmail.com>
> -#    Date:   Fri Apr 2 07:34:46 2010 +0200
> -#
> -#    shadow: fix do_install with automake-1.11
> -#
> -#    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -#
> -# comment added by Kevin Tian <kevin.tian@intel.com>
> -
> -man_nopan is for !USE_PAM already included in man_MANS and automake-1.11 hates to install some file twice
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -diff -uNr shadow-4.1.4.2.orig/man/Makefile.am shadow-4.1.4.2/man/Makefile.am
> ---- shadow-4.1.4.2.orig/man/Makefile.am	2009-03-14 15:40:10.000000000 +0100
> -+++ shadow-4.1.4.2/man/Makefile.am	2010-04-02 07:31:17.000000000 +0200
> -@@ -163,7 +163,6 @@
> - 	$(man_MANS) \
> - 	$(man_XMANS) \
> - 	$(addprefix login.defs.d/,$(login_defs_v)) \
> --	$(man_nopam) \
> - 	id.1 \
> - 	id.1.xml \
> - 	sulogin.8 \
> -diff -uNr shadow-4.1.4.2.orig/man/fr/Makefile.am shadow-4.1.4.2/man/fr/Makefile.am
> ---- shadow-4.1.4.2.orig/man/fr/Makefile.am	2008-09-06 18:44:45.000000000 +0200
> -+++ shadow-4.1.4.2/man/fr/Makefile.am	2010-04-02 07:42:11.000000000 +0200
> -@@ -52,7 +52,6 @@
> -
> - EXTRA_DIST = \
> - 	$(man_MANS) \
> --	$(man_nopam) \
> - 	id.1
> -
> - include ../generate_translations.mak
> -diff -uNr shadow-4.1.4.2.orig/man/it/Makefile.am shadow-4.1.4.2/man/it/Makefile.am
> ---- shadow-4.1.4.2.orig/man/it/Makefile.am	2008-09-06 18:44:45.000000000 +0200
> -+++ shadow-4.1.4.2/man/it/Makefile.am	2010-04-02 07:42:20.000000000 +0200
> -@@ -46,7 +46,6 @@
> -
> - EXTRA_DIST = \
> - 	$(man_MANS) \
> --	$(man_nopam) \
> - 	id.1 \
> - 	logoutd.8
> -
> -diff -uNr shadow-4.1.4.2.orig/man/ja/Makefile.am shadow-4.1.4.2/man/ja/Makefile.am
> ---- shadow-4.1.4.2.orig/man/ja/Makefile.am	2007-12-31 17:48:28.000000000 +0100
> -+++ shadow-4.1.4.2/man/ja/Makefile.am	2010-04-02 07:42:17.000000000 +0200
> -@@ -49,7 +49,6 @@
> -
> - EXTRA_DIST = \
> - 	$(man_MANS) \
> --	$(man_nopam) \
> - 	id.1 \
> - 	shadow.3 \
> - 	sulogin.8
> -diff -uNr shadow-4.1.4.2.orig/man/pl/Makefile.am shadow-4.1.4.2/man/pl/Makefile.am
> ---- shadow-4.1.4.2.orig/man/pl/Makefile.am	2008-09-06 18:44:45.000000000 +0200
> -+++ shadow-4.1.4.2/man/pl/Makefile.am	2010-04-02 07:42:07.000000000 +0200
> -@@ -49,7 +49,6 @@
> -
> - EXTRA_DIST = \
> - 	$(man_MANS) \
> --	$(man_nopam) \
> - 	getspnam.3 \
> - 	id.1 \
> - 	shadow.3 \
> -diff -uNr shadow-4.1.4.2.orig/man/ru/Makefile.am shadow-4.1.4.2/man/ru/Makefile.am
> ---- shadow-4.1.4.2.orig/man/ru/Makefile.am	2010-04-02 07:39:00.000000000 +0200
> -+++ shadow-4.1.4.2/man/ru/Makefile.am	2010-04-02 07:42:01.000000000 +0200
> -@@ -54,7 +54,6 @@
> -
> - EXTRA_DIST = \
> - 	$(man_MANS) \
> --	$(man_nopam) \
> - 	id.1 \
> - 	sulogin.8
> -
> -diff -uNr shadow-4.1.4.2.orig/man/sv/Makefile.am shadow-4.1.4.2/man/sv/Makefile.am
> ---- shadow-4.1.4.2.orig/man/sv/Makefile.am	2008-09-06 18:44:45.000000000 +0200
> -+++ shadow-4.1.4.2/man/sv/Makefile.am	2010-04-02 07:42:24.000000000 +0200
> -@@ -53,8 +53,7 @@
> - endif
> -
> - EXTRA_DIST = \
> --	$(man_MANS) \
> --	$(man_nopam)
> -+	$(man_MANS)
> -
> - include ../generate_translations.mak
> -
> ---- shadow-4.1.4.2.orig/man/ru/Makefile.am	2010-04-02 07:54:09.000000000 +0200
> -+++ shadow-4.1.4.2/man/ru/Makefile.am	2010-04-02 07:51:57.000000000 +0200
> -@@ -1,7 +1,6 @@
> - mandir = @mandir@/ru
> -
> - man_MANS = \
> --	$(man_nopam) \
> - 	chage.1 \
> - 	chfn.1 \
> - 	chgpasswd.8 \
> diff --git a/meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch b/meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
> deleted file mode 100644
> index 6a27ed3..0000000
> --- a/meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Upstream-Status: pending
> -
> -Automake 1.12 has deprecated automatic de-ANSI-fication support
> -
> -This patch avoids this issue with automake 1.12:
> -
> -| configure.in:22: error: automatic de-ANSI-fication support has been removed
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/05/02
> -
> -Index: shadow-4.1.4.3/configure.in
> -===================================================================
> ---- shadow-4.1.4.3.orig/configure.in
> -+++ shadow-4.1.4.3/configure.in
> -@@ -19,7 +19,6 @@ AC_PROG_CC
> - AC_ISC_POSIX
> - AC_PROG_LN_S
> - AC_PROG_YACC
> --AM_C_PROTOTYPES
> - AM_PROG_LIBTOOL
> -
> - dnl Checks for libraries.
> diff --git a/meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch b/meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
> deleted file mode 100644
> index 7cd45af..0000000
> --- a/meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -
> -This patch is from Slackware, I tried to find the actual
> -author to add that attribution.  The comment below is the
> -best summary, I will not repeat it here.
> -
> -Upstream-Status: Backport from slackware
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: shadow-4.1.4.3/lib/encrypt.c
> -===================================================================
> ---- shadow-4.1.4.3.orig/lib/encrypt.c
> -+++ shadow-4.1.4.3/lib/encrypt.c
> -@@ -45,15 +45,40 @@ char *pw_encrypt (const char *clear, con
> - 	static char cipher[128];
> - 	char *cp;
> -
> --	cp = crypt (clear, salt);
> --	if (!cp) {
> --		/*
> --		 * Single Unix Spec: crypt() may return a null pointer,
> --		 * and set errno to indicate an error.  The caller doesn't
> --		 * expect us to return NULL, so...
> --		 */
> --		perror ("crypt");
> --		exit (EXIT_FAILURE);
> -+ 	cp = crypt (clear, salt);
> -+ 	if (!cp) {
> -+ 		/*
> -+		 * In glibc-2.17 and newer, crypt() will return NULL if
> -+		 * it was called using an invalid salt format.  Previous
> -+		 * versions of glibc would go ahead and compute a DES hash
> -+		 * using the invalid salt.  The salt value in this case was
> -+		 * always '!'.  We might arrive at this place if either the
> -+		 * user does not exist, or if the hash in /etc/shadow doesn't
> -+		 * have the proper magic for one of the supported hash
> -+		 * formats (for example, if the account was locked using
> -+		 * "passwd -l".  To handle this situation, we will recompute
> -+		 * the hash using a hardcoded salt as was previously done
> -+		 * by glibc.  The hash returned by the old glibc function
> -+		 * always began with "!!", which would ensure that it could
> -+		 * never match an otherwise valid hash in /etc/shadow that
> -+		 * was disabled with a "!" at the beginning (since the second
> -+		 * character would never be "!" as well), so we will also
> -+		 * prepend the resulting hash with "!!".  Finally, in case
> -+		 * crypt() failed for some other reason we will check to see
> -+		 * if we still get NULL from crypt even with the valid salt
> -+		 * and will fail if that's the case.
> -+ 		 */
> -+
> -+		/* Recalculate hash using a hardcoded, valid SHA512 salt: */
> -+		cp = crypt (clear, "$6$8IIcy/1EPOk/");
> -+
> -+		if (!cp) {
> -+			perror ("crypt");
> -+			exit (EXIT_FAILURE);
> -+		} else {
> -+			sprintf (cipher, "!!%s", cp);
> -+			return cipher;
> -+		}
> - 	}
> -
> - 	/* The GNU crypt does not return NULL if the algorithm is not
> diff --git a/meta/recipes-extended/shadow/files/useradd.patch b/meta/recipes-extended/shadow/files/useradd.patch
> deleted file mode 100644
> index ff5016c..0000000
> --- a/meta/recipes-extended/shadow/files/useradd.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Work around a bug introduced with the --root option which was causing
> -all other arguments to be ignored.
> -
> -Upstream-Status: inappropriate
> -Signed-off-by: Phil Blundell <philb@gnu.org>
> -
> ---- a/src/useradd.c~	2011-09-01 15:36:40.398234861 +0100
> -+++ b/src/useradd.c	2011-09-01 17:29:00.782004133 +0100
> -@@ -1957,6 +1957,8 @@
> -
> - 	get_defaults ();
> -
> -+	optind = 1;
> -+
> - 	process_flags (argc, argv);
> -
> - #ifdef ACCT_TOOLS_SETUID
> diff --git a/meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch b/meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
> new file mode 100644
> index 0000000..37dc153
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
> @@ -0,0 +1,33 @@
> +Upstream-Status: Pending
> +
> +usermod: fix compilation failure with subids disabled
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/usermod.c |    3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/usermod.c b/src/usermod.c
> +index e7d4351..685b50a 100644
> +--- a/src/usermod.c
> ++++ b/src/usermod.c
> +@@ -1360,7 +1360,7 @@ static void process_flags (int argc, char **argv)
> + 		         Prog, (unsigned long) user_newid);
> + 		exit (E_UID_IN_USE);
> + 	}
> +-
> ++#ifdef ENABLE_SUBIDS
> + 	if (   (vflg || Vflg)
> + 	    && !is_sub_uid) {
> + 		fprintf (stderr,
> +@@ -1376,6 +1376,7 @@ static void process_flags (int argc, char **argv)
> + 		         Prog, sub_gid_dbname (), "-w", "-W");
> + 		exit (E_USAGE);
> + 	}
> ++#endif
> + }
> +
> + /*
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb
> similarity index 100%
> rename from meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> rename to meta/recipes-extended/shadow/shadow-securetty_4.2.1.bb
> diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb
> similarity index 100%
> rename from meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
> rename to meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 6848e05..9e5c0b9 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -1,50 +1,38 @@
>   SUMMARY = "Tools to change and administer password and group data"
>   HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
>   BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
> -SECTION = "base utils"
> +SECTION = "base/utils"
>   LICENSE = "BSD | Artistic-1.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
>                       file://src/passwd.c;beginline=8;endline=30;md5=d83888ea14ae61951982d77125947661"
>
>   DEPENDS = "shadow-native"
>   DEPENDS_class-native = ""
>   DEPENDS_class-nativesdk = ""
>
> -SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
> -           file://shadow.automake-1.11.patch \
> -           file://shadow_fix_for_automake-1.12.patch \
> +SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
>              file://shadow-4.1.3-dots-in-usernames.patch \
> -           file://shadow-4.1.4.2-env-reset-keep-locale.patch \
> +           file://usermod-fix-compilation-failure-with-subids-disabled.patch \
> +           file://fix-installation-failure-with-subids-disabled.patch \
>              ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>              "
>
>   SRC_URI_append_class-target = " \
>              file://login_defs_pam.sed \
> -           file://shadow-4.1.4.2-groupmod-pam-check.patch \
> -           file://shadow-4.1.4.2-su_no_sanitize_env.patch \
>              file://shadow-update-pam-conf.patch \
> -           file://slackware_fix_for_glib-2.17_crypt.patch \
> -           file://fix-etc-gshadow-reading.patch \
>              "
>
>   SRC_URI_append_class-native = " \
> -           file://add_root_cmd_options.patch \
>              file://disable-syslog.patch \
> -           file://useradd.patch \
> -           file://add_root_cmd_groupmems.patch \
>              file://allow-for-setting-password-in-clear-text.patch \
> +           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>              "
>   SRC_URI_append_class-nativesdk = " \
> -           file://add_root_cmd_options.patch \
>              file://disable-syslog.patch \
> -           file://useradd.patch \
> -           file://add_root_cmd_groupmems.patch \
>              "
>
> -SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
> -SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
> -
> -PR = "r14"
> +SRC_URI[md5sum] = "2bfafe7d4962682d31b5eba65dba4fc8"
> +SRC_URI[sha256sum] = "3b0893d1476766868cd88920f4f1231c4795652aa407569faff802bcda0f3d41"
>
>   # Additional Policy files for PAM
>   PAM_SRC_URI = "file://pam.d/chfn \
> @@ -61,6 +49,7 @@ EXTRA_OECONF += "--without-audit \
>                    --without-libcrack \
>                    --without-selinux \
>                    --with-group-name-max-length=24 \
> +                 --enable-subordinate-ids=no \
>                    ${NSCDOPT}"
>
>   NSCDOPT = ""
> @@ -166,11 +155,11 @@ ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
>
>   pkg_postinst_${PN} () {
>   	if [ "x$D" != "x" ]; then
> -	  rootarg="--root=$D"
> +	  rootarg="--root $D"
>   	else
>   	  rootarg=""
>   	fi
>
> -	pwconv $rootarg
> -	grpconv $rootarg
> +	pwconv $rootarg || exit 1
> +	grpconv $rootarg || exit 1
>   }
> diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.2.1.bb
> similarity index 100%
> rename from meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> rename to meta/recipes-extended/shadow/shadow_4.2.1.bb
>

