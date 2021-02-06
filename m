Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.7242.1612623421619168872
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 06:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bCtVBsR+Yfy+uoEV09cf9rdjrbvaUhdLh9M2g6vrNQKVHbSk+ibNxpT7oVDLiWL1BnAnQ7Altx
 y8xS37q4gsJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="200566870"
X-IronPort-AV: E=Sophos;i="5.81,158,1610438400"; 
   d="scan'208";a="200566870"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2021 06:57:01 -0800
IronPort-SDR: X46c2jN7+yDvagUdVeojEKIj4DV+TkUkgaoc8JNm60LBcLJmZjBh0uM9LtK9puQXGBnS2Qcfk6
 2L9Lw0OVPEfA==
X-IronPort-AV: E=Sophos;i="5.81,158,1610438400"; 
   d="scan'208";a="434877855"
Received: from taoki-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.238])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2021 06:57:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 2/2] sudo: fix CVE-2021-3156
Date: Sat,  6 Feb 2021 22:56:51 +0800
Message-Id: <20210206145651.1610972-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210206145651.1610972-1-anuj.mittal@intel.com>
References: <20210206145651.1610972-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sudo/files/CVE-2021-3156-1.patch          | 100 ++++++++++++++++++
 .../sudo/files/CVE-2021-3156-2.patch          |  53 ++++++++++
 .../sudo/files/CVE-2021-3156-3.patch          |  73 +++++++++++++
 .../sudo/files/CVE-2021-3156-4.patch          |  29 +++++
 .../sudo/files/CVE-2021-3156-5.patch          |  41 +++++++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |   5 +
 6 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-1.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-2.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-3.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-4.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-3156-5.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2021-3156-1.patch b/meta/recipes-extended/sudo/files/CVE-2021-3156-1.patch
new file mode 100644
index 0000000000..83c277575e
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-3156-1.patch
@@ -0,0 +1,100 @@
+Upstream-Status: Backport[https://www.sudo.ws/repos/sudo/rev/9b97f1787804]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2021-3156
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1611416639 25200
+# Node ID 9b97f1787804aedccaec63c379053b1a91a0e409
+# Parent  90aba6ba6e03f3bc33b4eabf16358396ed83642d
+Reset valid_flags to MODE_NONINTERACTIVE for sudoedit.
+This is consistent with how the -e option is handled.
+Also reject -H and -P flags for sudoedit as was done in sudo 1.7.
+Found by Qualys, this is part of the fix for CVE-2021-3156.
+
+diff -r 90aba6ba6e03 -r 9b97f1787804 src/parse_args.c
+--- a/src/parse_args.c	Mon Jan 18 12:30:52 2021 +0100
++++ b/src/parse_args.c	Sat Jan 23 08:43:59 2021 -0700
+@@ -117,7 +117,10 @@
+ /*
+  * Default flags allowed when running a command.
+  */
+-#define DEFAULT_VALID_FLAGS	(MODE_BACKGROUND|MODE_PRESERVE_ENV|MODE_RESET_HOME|MODE_LOGIN_SHELL|MODE_NONINTERACTIVE|MODE_SHELL)
++#define DEFAULT_VALID_FLAGS	(MODE_BACKGROUND|MODE_PRESERVE_ENV|MODE_RESET_HOME|MODE_LOGIN_SHELL|MODE_NONINTERACTIVE|MODE_PRESERVE_GROUPS|MODE_SHELL)
++#define EDIT_VALID_FLAGS	MODE_NONINTERACTIVE
++#define LIST_VALID_FLAGS	(MODE_NONINTERACTIVE|MODE_LONG_LIST)
++#define VALIDATE_VALID_FLAGS	MODE_NONINTERACTIVE
+ 
+ /* Option number for the --host long option due to ambiguity of the -h flag. */
+ #define OPT_HOSTNAME	256
+@@ -262,6 +265,7 @@
+ 	progname = "sudoedit";
+ 	mode = MODE_EDIT;
+ 	sudo_settings[ARG_SUDOEDIT].value = "true";
++	valid_flags = EDIT_VALID_FLAGS;
+     }
+ 
+     /* Load local IP addresses and masks. */
+@@ -365,7 +369,7 @@
+ 			usage_excl();
+ 		    mode = MODE_EDIT;
+ 		    sudo_settings[ARG_SUDOEDIT].value = "true";
+-		    valid_flags = MODE_NONINTERACTIVE;
++		    valid_flags = EDIT_VALID_FLAGS;
+ 		    break;
+ 		case 'g':
+ 		    assert(optarg != NULL);
+@@ -377,6 +381,7 @@
+ 		    break;
+ 		case 'H':
+ 		    sudo_settings[ARG_SET_HOME].value = "true";
++		    SET(flags, MODE_RESET_HOME);
+ 		    break;
+ 		case 'h':
+ 		    if (optarg == NULL) {
+@@ -431,7 +436,7 @@
+ 			    usage_excl();
+ 		    }
+ 		    mode = MODE_LIST;
+-		    valid_flags = MODE_NONINTERACTIVE|MODE_LONG_LIST;
++		    valid_flags = LIST_VALID_FLAGS;
+ 		    break;
+ 		case 'n':
+ 		    SET(flags, MODE_NONINTERACTIVE);
+@@ -439,6 +444,7 @@
+ 		    break;
+ 		case 'P':
+ 		    sudo_settings[ARG_PRESERVE_GROUPS].value = "true";
++		    SET(flags, MODE_PRESERVE_GROUPS);
+ 		    break;
+ 		case 'p':
+ 		    /* An empty prompt is allowed. */
+@@ -505,7 +511,7 @@
+ 		    if (mode && mode != MODE_VALIDATE)
+ 			usage_excl();
+ 		    mode = MODE_VALIDATE;
+-		    valid_flags = MODE_NONINTERACTIVE;
++		    valid_flags = VALIDATE_VALID_FLAGS;
+ 		    break;
+ 		case 'V':
+ 		    if (mode && mode != MODE_VERSION)
+@@ -533,7 +539,7 @@
+     if (!mode) {
+ 	/* Defer -k mode setting until we know whether it is a flag or not */
+ 	if (sudo_settings[ARG_IGNORE_TICKET].value != NULL) {
+-	    if (argc == 0 && !(flags & (MODE_SHELL|MODE_LOGIN_SHELL))) {
++	    if (argc == 0 && !ISSET(flags, MODE_SHELL|MODE_LOGIN_SHELL)) {
+ 		mode = MODE_INVALIDATE;	/* -k by itself */
+ 		sudo_settings[ARG_IGNORE_TICKET].value = NULL;
+ 		valid_flags = 0;
+@@ -601,7 +607,7 @@
+     /*
+      * For shell mode we need to rewrite argv
+      */
+-    if (ISSET(mode, MODE_RUN) && ISSET(flags, MODE_SHELL)) {
++    if (ISSET(flags, MODE_SHELL|MODE_LOGIN_SHELL) && ISSET(mode, MODE_RUN)) {
+ 	char **av, *cmnd = NULL;
+ 	int ac = 1;
+ 
+
+
diff --git a/meta/recipes-extended/sudo/files/CVE-2021-3156-2.patch b/meta/recipes-extended/sudo/files/CVE-2021-3156-2.patch
new file mode 100644
index 0000000000..6d051252cb
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-3156-2.patch
@@ -0,0 +1,53 @@
+From 03d04069468d6633be0d6ef6c4adff07620488da Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Sat, 6 Feb 2021 15:57:55 +0800
+Subject: [PATCH] sudo: fix CVE-2021-3156
+
+Upstream-Status: Backport [https://www.sudo.ws/repos/sudo/rev/a97dc92eae6b]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2021-3156
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1611416639 25200
+# Node ID a97dc92eae6b60ae285055441341d493c17262ff
+# Parent  9b97f1787804aedccaec63c379053b1a91a0e409
+Add sudoedit flag checks in plugin that are consistent with front-end.
+Don't assume the sudo front-end is sending reasonable mode flags.
+These checks need to be kept consistent between the sudo front-end
+and the sudoers plugin.
+
+---
+ plugins/sudoers/policy.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/plugins/sudoers/policy.c b/plugins/sudoers/policy.c
+index c4749a6..2f18fe1 100644
+--- a/plugins/sudoers/policy.c
++++ b/plugins/sudoers/policy.c
+@@ -88,10 +88,11 @@ parse_bool(const char *line, int varlen, int *flags, int fval)
+ int
+ sudoers_policy_deserialize_info(void *v, char **runas_user, char **runas_group)
+ {
++    const int edit_mask = MODE_EDIT|MODE_IGNORE_TICKET|MODE_NONINTERACTIVE;
+     struct sudoers_open_info *info = v;
+-    char * const *cur;
+     const char *p, *errstr, *groups = NULL;
+     const char *remhost = NULL;
++    char * const *cur;
+     int flags = 0;
+     debug_decl(sudoers_policy_deserialize_info, SUDOERS_DEBUG_PLUGIN);
+ 
+@@ -343,6 +344,12 @@ sudoers_policy_deserialize_info(void *v, char **runas_user, char **runas_group)
+ #endif
+     }
+ 
++    /* Sudo front-end should restrict mode flags for sudoedit. */
++    if (ISSET(flags, MODE_EDIT) && (flags & edit_mask) != flags) {
++	sudo_warnx(U_("invalid mode flags from sudo front end: 0x%x"), flags);
++	goto bad;
++    }
++
+     user_gid = (gid_t)-1;
+     user_sid = (pid_t)-1;
+     user_uid = (gid_t)-1;
diff --git a/meta/recipes-extended/sudo/files/CVE-2021-3156-3.patch b/meta/recipes-extended/sudo/files/CVE-2021-3156-3.patch
new file mode 100644
index 0000000000..30a574d05c
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-3156-3.patch
@@ -0,0 +1,73 @@
+Upstream-Status: Backport[https://www.sudo.ws/repos/sudo/rev/049ad90590be]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2021-3156
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1611416639 25200
+# Node ID 049ad90590be1e5dfb7df2675d2eb3e37c96ab86
+# Parent  a97dc92eae6b60ae285055441341d493c17262ff
+Fix potential buffer overflow when unescaping backslashes in user_args.
+Also, do not try to unescaping backslashes unless in run mode *and*
+we are running the command via a shell.
+Found by Qualys, this fixes CVE-2021-3156.
+
+diff -r a97dc92eae6b -r 049ad90590be plugins/sudoers/sudoers.c
+--- a/plugins/sudoers/sudoers.c	Sat Jan 23 08:43:59 2021 -0700
++++ b/plugins/sudoers/sudoers.c	Sat Jan 23 08:43:59 2021 -0700
+@@ -547,7 +547,7 @@
+ 
+     /* If run as root with SUDO_USER set, set sudo_user.pw to that user. */
+     /* XXX - causes confusion when root is not listed in sudoers */
+-    if (sudo_mode & (MODE_RUN | MODE_EDIT) && prev_user != NULL) {
++    if (ISSET(sudo_mode, MODE_RUN|MODE_EDIT) && prev_user != NULL) {
+ 	if (user_uid == 0 && strcmp(prev_user, "root") != 0) {
+ 	    struct passwd *pw;
+ 
+@@ -932,8 +932,8 @@
+     if (user_cmnd == NULL)
+ 	user_cmnd = NewArgv[0];
+ 
+-    if (sudo_mode & (MODE_RUN | MODE_EDIT | MODE_CHECK)) {
+-	if (ISSET(sudo_mode, MODE_RUN | MODE_CHECK)) {
++    if (ISSET(sudo_mode, MODE_RUN|MODE_EDIT|MODE_CHECK)) {
++	if (!ISSET(sudo_mode, MODE_EDIT)) {
+ 	    const char *runchroot = user_runchroot;
+ 	    if (runchroot == NULL && def_runchroot != NULL &&
+ 		    strcmp(def_runchroot, "*") != 0)
+@@ -961,7 +961,8 @@
+ 		sudo_warnx(U_("%s: %s"), __func__, U_("unable to allocate memory"));
+ 		debug_return_int(NOT_FOUND_ERROR);
+ 	    }
+-	    if (ISSET(sudo_mode, MODE_SHELL|MODE_LOGIN_SHELL)) {
++	    if (ISSET(sudo_mode, MODE_SHELL|MODE_LOGIN_SHELL) &&
++		    ISSET(sudo_mode, MODE_RUN)) {
+ 		/*
+ 		 * When running a command via a shell, the sudo front-end
+ 		 * escapes potential meta chars.  We unescape non-spaces
+@@ -969,10 +970,22 @@
+ 		 */
+ 		for (to = user_args, av = NewArgv + 1; (from = *av); av++) {
+ 		    while (*from) {
+-			if (from[0] == '\\' && !isspace((unsigned char)from[1]))
++			if (from[0] == '\\' && from[1] != '\0' &&
++				!isspace((unsigned char)from[1])) {
+ 			    from++;
++			}
++			if (size - (to - user_args) < 1) {
++			    sudo_warnx(U_("internal error, %s overflow"),
++				__func__);
++			    debug_return_int(NOT_FOUND_ERROR);
++			}
+ 			*to++ = *from++;
+ 		    }
++		    if (size - (to - user_args) < 1) {
++			sudo_warnx(U_("internal error, %s overflow"),
++			    __func__);
++			debug_return_int(NOT_FOUND_ERROR);
++		    }
+ 		    *to++ = ' ';
+ 		}
+ 		*--to = '\0';
+
+
diff --git a/meta/recipes-extended/sudo/files/CVE-2021-3156-4.patch b/meta/recipes-extended/sudo/files/CVE-2021-3156-4.patch
new file mode 100644
index 0000000000..c1b00c740e
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-3156-4.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport [https://www.sudo.ws/repos/sudo/rev/09f98816fc89]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2021-3156
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1611416640 25200
+# Node ID 09f98816fc8978f1d8623a857073d2d5746f0379
+# Parent  049ad90590be1e5dfb7df2675d2eb3e37c96ab86
+Fix the memset offset when converting a v1 timestamp to TS_LOCKEXCL.
+We want to zero the struct starting at flags, not type (which was just set).
+Found by Qualys.
+
+diff -r 049ad90590be -r 09f98816fc89 plugins/sudoers/timestamp.c
+--- a/plugins/sudoers/timestamp.c	Sat Jan 23 08:43:59 2021 -0700
++++ b/plugins/sudoers/timestamp.c	Sat Jan 23 08:44:00 2021 -0700
+@@ -643,8 +643,8 @@
+ 	if (entry.size == sizeof(struct timestamp_entry_v1)) {
+ 	    /* Old sudo record, convert it to TS_LOCKEXCL. */
+ 	    entry.type = TS_LOCKEXCL;
+-	    memset((char *)&entry + offsetof(struct timestamp_entry, type), 0,
+-		nread - offsetof(struct timestamp_entry, type));
++	    memset((char *)&entry + offsetof(struct timestamp_entry, flags), 0,
++		nread - offsetof(struct timestamp_entry, flags));
+ 	    if (ts_write(cookie->fd, cookie->fname, &entry, 0) == -1)
+ 		debug_return_bool(false);
+ 	} else {
+
+
diff --git a/meta/recipes-extended/sudo/files/CVE-2021-3156-5.patch b/meta/recipes-extended/sudo/files/CVE-2021-3156-5.patch
new file mode 100644
index 0000000000..c04b8e72a6
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2021-3156-5.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport [https://www.sudo.ws/repos/sudo/rev/c125fbe68783]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2021-3156
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@sudo.ws>
+# Date 1611416640 25200
+# Node ID c125fbe6878395d10f01d891d3c09b1229ada404
+# Parent  09f98816fc8978f1d8623a857073d2d5746f0379
+Don't assume that argv is allocated as a single flat buffer.
+While this is how the kernel behaves it is not a portable assumption.
+The assumption may also be violated if getopt_long(3) permutes arguments.
+Found by Qualys.
+
+diff -r 09f98816fc89 -r c125fbe68783 src/parse_args.c
+--- a/src/parse_args.c	Sat Jan 23 08:44:00 2021 -0700
++++ b/src/parse_args.c	Sat Jan 23 08:44:00 2021 -0700
+@@ -614,16 +614,16 @@
+ 	if (argc != 0) {
+ 	    /* shell -c "command" */
+ 	    char *src, *dst;
+-	    size_t cmnd_size = (size_t) (argv[argc - 1] - argv[0]) +
+-		strlen(argv[argc - 1]) + 1;
++	    size_t size = 0;
+ 
+-	    cmnd = dst = reallocarray(NULL, cmnd_size, 2);
+-	    if (cmnd == NULL)
++	    for (av = argv; *av != NULL; av++)
++		size += strlen(*av) + 1;
++	    if (size == 0 || (cmnd = reallocarray(NULL, size, 2)) == NULL)
+ 		sudo_fatalx(U_("%s: %s"), __func__, U_("unable to allocate memory"));
+ 	    if (!gc_add(GC_PTR, cmnd))
+ 		exit(EXIT_FAILURE);
+ 
+-	    for (av = argv; *av != NULL; av++) {
++	    for (dst = cmnd, av = argv; *av != NULL; av++) {
+ 		for (src = *av; *src != '\0'; src++) {
+ 		    /* quote potential meta characters */
+ 		    if (!isalnum((unsigned char)*src) && *src != '_' && *src != '-' && *src != '$')
+
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.3.bb b/meta/recipes-extended/sudo/sudo_1.9.3.bb
index 4edcbfc607..37fd6386dd 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3.bb
@@ -5,6 +5,11 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://CVE-2021-23239.patch \
            file://CVE-2021-23240.patch \
+           file://CVE-2021-3156-1.patch \
+           file://CVE-2021-3156-2.patch \
+           file://CVE-2021-3156-3.patch \
+           file://CVE-2021-3156-4.patch \
+           file://CVE-2021-3156-5.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.29.2

