Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F05C3F6B0
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 22:20:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.10086.1660515645756781214
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VHdpEXaD;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id f28so5378910pfk.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mqYqAYCNrSSlrD1AYKlysebUkF1wrduP7xnIOy344Gg=;
        b=VHdpEXaDTU0+GSkUbORQz5OJLWsUSce8wEipNhq6Zw0a11z72lA4E/VFMhhxqzkIzm
         VKUPljm6FMSkV/fjxpT6vRmdPcMrBsnPBky8PPNw6SCzu/wWPPgRErskxtqQzt+HqJo6
         l/XEJCYnsjdbrnAc9k+UVBCbGYRe7s9NeUdCJWbqWMlLd5Hu0HX3lOO9LNiAPGzVNBJm
         rRXv06qWg1dQB13pNL1kk87CHkw/XogU5O82Up5UkL6fLGjtO04nb55Jy933nniWnU/N
         AZxU//BF0nLeJNUVCzcvSM2jxqNe8dSbe4KIZwqAQcTaYYB/3R4p9PlKry2usMFYu9kP
         FN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mqYqAYCNrSSlrD1AYKlysebUkF1wrduP7xnIOy344Gg=;
        b=jQFc9rCZMjL1CSgs3uouAhmg3CKs+F5f5ctFIRRAd77nymKv9ncBrTnKqMKNSwEmAf
         esWtk1c6gNhpx6Lwob5zsugHjliCa77pY2OpyL5z8BgsWnxvaMJElwCBvpnHvRqWE0Fk
         XWhbwf19UfJ2/9c3XAW196IXIn9sRV6yJctsGoWhOHysuinYhWyf716i6N+pBdSIC9w1
         E2v2XhnFjxJymg24asJS8o1D/uqNGzcjk/KzME1PlSUbE6IFNkJRxnhlgAoK/eiZRgXI
         /EFkQJI588hYRhG1jSMjwMM+lXg/rxZBmnd1DGVxCZ+CTcK2zocz9Fs3ROgAFq4lt/vf
         bikA==
X-Gm-Message-State: ACgBeo241R6f/ui+cTsXPQWlGlXTYzkKuBOBqVw89+mKyYpK9NfpZvJ+
	0yPw8O7B5ZjFAfv1kWgviVEwRTjvOC7hhg==
X-Google-Smtp-Source: 
 AA6agR4c8X8QxRYDIp+Z2Cvcv0kAWoFRevutamgCMS7DutgGPG5o/n+TmdpbG5MGsGzEtXP06UuArg==
X-Received: by 2002:a63:4b4a:0:b0:427:bbb0:110e with SMTP id
 k10-20020a634b4a000000b00427bbb0110emr4770339pgl.397.1660515644127;
        Sun, 14 Aug 2022 15:20:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a170902d58f00b0016d8b0dfd61sm5819502plh.178.2022.08.14.15.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 15:20:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 04/10] rsync: Backport fix to address CVE-2022-29154
Date: Sun, 14 Aug 2022 15:20:31 -0700
Message-Id: <20220814222037.283943-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220814222037.283943-1-raj.khem@gmail.com>
References: <20220814222037.283943-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 22:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169331

CVE: CVE-2022-29154

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rsync/files/CVE-2022-29154.patch          | 372 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.4.bb    |   1 +
 2 files changed, 373 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2022-29154.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2022-29154.patch b/meta/recipes-devtools/rsync/files/CVE-2022-29154.patch
new file mode 100644
index 00000000000..e43b092ea89
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2022-29154.patch
@@ -0,0 +1,372 @@
+From b7231c7d02cfb65d291af74ff66e7d8c507ee871 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Sun, 31 Jul 2022 16:55:34 -0700
+Subject: [PATCH] Some extra file-list safety checks.
+
+Upstream-Status: Backport [https://github.com/WayneD/rsync/commit/b7231c7d02cfb65d291af74ff66e7d8c507ee871]
+CVE: CVE-2022-29154
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ exclude.c  | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ flist.c    |  17 ++++++-
+ io.c       |   4 ++
+ main.c     |   7 ++-
+ receiver.c |  11 +++--
+ rsync.1.md |  44 ++++++++++++++++--
+ 6 files changed, 202 insertions(+), 11 deletions(-)
+
+--- a/exclude.c
++++ b/exclude.c
+@@ -27,16 +27,22 @@ extern int am_server;
+ extern int am_sender;
+ extern int eol_nulls;
+ extern int io_error;
++extern int xfer_dirs;
++extern int recurse;
+ extern int local_server;
+ extern int prune_empty_dirs;
+ extern int ignore_perishable;
++extern int old_style_args;
++extern int relative_paths;
+ extern int delete_mode;
+ extern int delete_excluded;
+ extern int cvs_exclude;
+ extern int sanitize_paths;
+ extern int protocol_version;
++extern int list_only;
+ extern int module_id;
+ 
++extern char *filesfrom_host;
+ extern char curr_dir[MAXPATHLEN];
+ extern unsigned int curr_dir_len;
+ extern unsigned int module_dirlen;
+@@ -44,8 +50,10 @@ extern unsigned int module_dirlen;
+ filter_rule_list filter_list = { .debug_type = "" };
+ filter_rule_list cvs_filter_list = { .debug_type = " [global CVS]" };
+ filter_rule_list daemon_filter_list = { .debug_type = " [daemon]" };
++filter_rule_list implied_filter_list = { .debug_type = " [implied]" };
+ 
+ int saw_xattr_filter = 0;
++int trust_sender_filter = 0;
+ 
+ /* Need room enough for ":MODS " prefix plus some room to grow. */
+ #define MAX_RULE_PREFIX (16)
+@@ -292,6 +300,125 @@ static void add_rule(filter_rule_list *l
+ 	}
+ }
+ 
++/* Each arg the client sends to the remote sender turns into an implied include
++ * that the receiver uses to validate the file list from the sender. */
++void add_implied_include(const char *arg)
++{
++	filter_rule *rule;
++	int arg_len, saw_wild = 0, backslash_cnt = 0;
++	int slash_cnt = 1; /* We know we're adding a leading slash. */
++	const char *cp;
++	char *p;
++	if (old_style_args || list_only || filesfrom_host != NULL)
++		return;
++	if (relative_paths) {
++		cp = strstr(arg, "/./");
++		if (cp)
++			arg = cp+3;
++	} else {
++		if ((cp = strrchr(arg, '/')) != NULL)
++			arg = cp + 1;
++	}
++	arg_len = strlen(arg);
++	if (arg_len) {
++		if (strpbrk(arg, "*[?")) {
++			/* We need to add room to escape backslashes if wildcard chars are present. */
++			cp = arg;
++			while ((cp = strchr(cp, '\\')) != NULL) {
++				arg_len++;
++				cp++;
++			}
++			saw_wild = 1;
++		}
++		arg_len++; /* Leave room for the prefixed slash */
++		rule = new0(filter_rule);
++		if (!implied_filter_list.head)
++			implied_filter_list.head = implied_filter_list.tail = rule;
++		else {
++			rule->next = implied_filter_list.head;
++			implied_filter_list.head = rule;
++		}
++		rule->rflags = FILTRULE_INCLUDE + (saw_wild ? FILTRULE_WILD : 0);
++		p = rule->pattern = new_array(char, arg_len + 1);
++		*p++ = '/';
++		cp = arg;
++		while (*cp) {
++			switch (*cp) {
++			  case '\\':
++				backslash_cnt++;
++				if (saw_wild)
++					*p++ = '\\';
++				*p++ = *cp++;
++				break;
++			  case '/':
++				if (p[-1] == '/') /* This is safe because of the initial slash. */
++					break;
++				if (relative_paths) {
++					filter_rule const *ent;
++					int found = 0;
++					*p = '\0';
++					for (ent = implied_filter_list.head; ent; ent = ent->next) {
++						if (ent != rule && strcmp(ent->pattern, rule->pattern) == 0)
++							found = 1;
++					}
++					if (!found) {
++						filter_rule *R_rule = new0(filter_rule);
++						R_rule->rflags = FILTRULE_INCLUDE + (saw_wild ? FILTRULE_WILD : 0);
++						R_rule->pattern = strdup(rule->pattern);
++						R_rule->u.slash_cnt = slash_cnt;
++						R_rule->next = implied_filter_list.head;
++						implied_filter_list.head = R_rule;
++					}
++				}
++				slash_cnt++;
++				*p++ = *cp++;
++				break;
++			  default:
++				*p++ = *cp++;
++				break;
++			}
++		}
++		*p = '\0';
++		rule->u.slash_cnt = slash_cnt;
++		arg = (const char *)rule->pattern;
++	}
++
++	if (recurse || xfer_dirs) {
++		/* Now create a rule with an added "/" & "**" or "*" at the end */
++		rule = new0(filter_rule);
++		if (recurse)
++			rule->rflags = FILTRULE_INCLUDE | FILTRULE_WILD | FILTRULE_WILD2;
++		else
++			rule->rflags = FILTRULE_INCLUDE | FILTRULE_WILD;
++		/* A +4 in the len leaves enough room for / * * \0 or / * \0 \0 */
++		if (!saw_wild && backslash_cnt) {
++			/* We are appending a wildcard, so now the backslashes need to be escaped. */
++			p = rule->pattern = new_array(char, arg_len + backslash_cnt + 3 + 1);
++			cp = arg;
++			while (*cp) {
++				if (*cp == '\\')
++					*p++ = '\\';
++				*p++ = *cp++;
++			}
++		} else {
++			p = rule->pattern = new_array(char, arg_len + 3 + 1);
++			if (arg_len) {
++				memcpy(p, arg, arg_len);
++				p += arg_len;
++			}
++		}
++		if (p[-1] != '/')
++			*p++ = '/';
++		*p++ = '*';
++		if (recurse)
++			*p++ = '*';
++		*p = '\0';
++		rule->u.slash_cnt = slash_cnt + 1;
++		rule->next = implied_filter_list.head;
++		implied_filter_list.head = rule;
++	}
++}
++
+ /* This frees any non-inherited items, leaving just inherited items on the list. */
+ static void pop_filter_list(filter_rule_list *listp)
+ {
+@@ -718,7 +845,7 @@ static void report_filter_result(enum lo
+ 			      : name_flags & NAME_IS_DIR ? "directory"
+ 			      : "file";
+ 		rprintf(code, "[%s] %sing %s %s because of pattern %s%s%s\n",
+-		    w, actions[*w!='s'][!(ent->rflags & FILTRULE_INCLUDE)],
++		    w, actions[*w=='g'][!(ent->rflags & FILTRULE_INCLUDE)],
+ 		    t, name, ent->pattern,
+ 		    ent->rflags & FILTRULE_DIRECTORY ? "/" : "", type);
+ 	}
+@@ -890,6 +1017,7 @@ static filter_rule *parse_rule_tok(const
+ 		}
+ 		switch (ch) {
+ 		case ':':
++			trust_sender_filter = 1;
+ 			rule->rflags |= FILTRULE_PERDIR_MERGE
+ 				      | FILTRULE_FINISH_SETUP;
+ 			/* FALL THROUGH */
+--- a/flist.c
++++ b/flist.c
+@@ -73,6 +73,7 @@ extern int need_unsorted_flist;
+ extern int sender_symlink_iconv;
+ extern int output_needs_newline;
+ extern int sender_keeps_checksum;
++extern int trust_sender_filter;
+ extern int unsort_ndx;
+ extern uid_t our_uid;
+ extern struct stats stats;
+@@ -83,8 +84,7 @@ extern char curr_dir[MAXPATHLEN];
+ 
+ extern struct chmod_mode_struct *chmod_modes;
+ 
+-extern filter_rule_list filter_list;
+-extern filter_rule_list daemon_filter_list;
++extern filter_rule_list filter_list, implied_filter_list, daemon_filter_list;
+ 
+ #ifdef ICONV_OPTION
+ extern int filesfrom_convert;
+@@ -986,6 +986,19 @@ static struct file_struct *recv_file_ent
+ 		exit_cleanup(RERR_UNSUPPORTED);
+ 	}
+ 
++	if (*thisname != '.' || thisname[1] != '\0') {
++		int filt_flags = S_ISDIR(mode) ? NAME_IS_DIR : NAME_IS_FILE;
++		if (!trust_sender_filter /* a per-dir filter rule means we must trust the sender's filtering */
++		 && filter_list.head && check_filter(&filter_list, FINFO, thisname, filt_flags) < 0) {
++			rprintf(FERROR, "ERROR: rejecting excluded file-list name: %s\n", thisname);
++			exit_cleanup(RERR_PROTOCOL);
++		}
++		if (implied_filter_list.head && check_filter(&implied_filter_list, FINFO, thisname, filt_flags) <= 0) {
++			rprintf(FERROR, "ERROR: rejecting unrequested file-list name: %s\n", thisname);
++			exit_cleanup(RERR_PROTOCOL);
++		}
++	}
++
+ 	if (inc_recurse && S_ISDIR(mode)) {
+ 		if (one_file_system) {
+ 			/* Room to save the dir's device for -x */
+--- a/io.c
++++ b/io.c
+@@ -419,6 +419,7 @@ static void forward_filesfrom_data(void)
+ 		while (s != eob) {
+ 			if (*s++ == '\0') {
+ 				ff_xb.len = s - sob - 1;
++				add_implied_include(sob);
+ 				if (iconvbufs(ic_send, &ff_xb, &iobuf.out, flags) < 0)
+ 					exit_cleanup(RERR_PROTOCOL); /* impossible? */
+ 				write_buf(iobuf.out_fd, s-1, 1); /* Send the '\0'. */
+@@ -450,9 +451,12 @@ static void forward_filesfrom_data(void)
+ 		char *f = ff_xb.buf + ff_xb.pos;
+ 		char *t = ff_xb.buf;
+ 		char *eob = f + len;
++		char *cur = t;
+ 		/* Eliminate any multi-'\0' runs. */
+ 		while (f != eob) {
+ 			if (!(*t++ = *f++)) {
++				add_implied_include(cur);
++				cur = t;
+ 				while (f != eob && *f == '\0')
+ 					f++;
+ 			}
+--- a/main.c
++++ b/main.c
+@@ -89,6 +89,7 @@ extern int backup_dir_len;
+ extern int basis_dir_cnt;
+ extern int default_af_hint;
+ extern int stdout_format_has_i;
++extern int trust_sender_filter;
+ extern struct stats stats;
+ extern char *stdout_format;
+ extern char *logfile_format;
+@@ -104,7 +105,7 @@ extern char curr_dir[MAXPATHLEN];
+ extern char backup_dir_buf[MAXPATHLEN];
+ extern char *basis_dir[MAX_BASIS_DIRS+1];
+ extern struct file_list *first_flist;
+-extern filter_rule_list daemon_filter_list;
++extern filter_rule_list daemon_filter_list, implied_filter_list;
+ 
+ uid_t our_uid;
+ gid_t our_gid;
+@@ -635,6 +636,7 @@ static pid_t do_cmd(char *cmd, char *mac
+ #ifdef ICONV_CONST
+ 		setup_iconv();
+ #endif
++		trust_sender_filter = 1;
+ 	} else if (local_server) {
+ 		/* If the user didn't request --[no-]whole-file, force
+ 		 * it on, but only if we're not batch processing. */
+@@ -1500,6 +1502,8 @@ static int start_client(int argc, char *
+ 		char *dummy_host;
+ 		int dummy_port = rsync_port;
+ 		int i;
++		if (filesfrom_fd < 0)
++			add_implied_include(remote_argv[0]);
+ 		/* For remote source, any extra source args must have either
+ 		 * the same hostname or an empty hostname. */
+ 		for (i = 1; i < remote_argc; i++) {
+@@ -1523,6 +1527,7 @@ static int start_client(int argc, char *
+ 			if (!rsync_port && !*arg) /* Turn an empty arg into a dot dir. */
+ 				arg = ".";
+ 			remote_argv[i] = arg;
++			add_implied_include(arg);
+ 		}
+ 	}
+ 
+--- a/receiver.c
++++ b/receiver.c
+@@ -593,10 +593,13 @@ int recv_files(int f_in, int f_out, char
+ 		if (DEBUG_GTE(RECV, 1))
+ 			rprintf(FINFO, "recv_files(%s)\n", fname);
+ 
+-		if (daemon_filter_list.head && (*fname != '.' || fname[1] != '\0')
+-		 && check_filter(&daemon_filter_list, FLOG, fname, 0) < 0) {
+-			rprintf(FERROR, "attempt to hack rsync failed.\n");
+-			exit_cleanup(RERR_PROTOCOL);
++		if (daemon_filter_list.head && (*fname != '.' || fname[1] != '\0')) {
++			int filt_flags = S_ISDIR(file->mode) ? NAME_IS_DIR : NAME_IS_FILE;
++			if (check_filter(&daemon_filter_list, FLOG, fname, filt_flags) < 0) {
++				rprintf(FERROR, "ERROR: rejecting file transfer request for daemon excluded file: %s\n",
++					fname);
++				exit_cleanup(RERR_PROTOCOL);
++			}
+ 		}
+ 
+ #ifdef SUPPORT_XATTRS
+--- a/rsync.1.md
++++ b/rsync.1.md
+@@ -154,6 +154,33 @@ rsync daemon by leaving off the module n
+ 
+ See the following section for more details.
+ 
++## MULTI-HOST SECURITY
++
++Rsync takes steps to ensure that the file requests that are shared in a
++transfer are protected against various security issues.  Most of the potential
++problems arise on the receiving side where rsync takes steps to ensure that the
++list of files being transferred remains within the bounds of what was
++requested.
++
++Toward this end, rsync 3.1.2 and later have aborted when a file list contains
++an absolute or relative path that tries to escape out of the top of the
++transfer.  Also, beginning with version 3.2.5, rsync does two more safety
++checks of the file list to (1) ensure that no extra source arguments were added
++into the transfer other than those that the client requested and (2) ensure
++that the file list obeys the exclude rules that we sent to the sender.
++
++For those that don't yet have a 3.2.5 client rsync, it is safest to do a copy
++into a dedicated destination directory for the remote files rather than
++requesting the remote content get mixed in with other local content.  For
++example, doing an rsync copy into your home directory is potentially unsafe on
++an older rsync if the remote rsync is being controlled by a bad actor:
++
++>     rsync -aiv host1:dir1 ~
++
++A safer command would be:
++
++>     rsync -aiv host1:dir1 ~/host1-files
++
+ ## ADVANCED USAGE
+ 
+ The syntax for requesting multiple files from a remote host is done by
+@@ -2323,6 +2350,12 @@ your home directory (remove the '=' for
+     behavior.  The environment is always overridden by manually specified
+     positive or negative options (the negative is `--no-old-args`).
+ 
++    Note that this option also disables the extra safety check added in 3.2.5
++    that ensures that a remote sender isn't including extra top-level items in
++    the file-list that you didn't request.  This side-effect is necessary
++    because we can't know for sure what names to expect when the remote shell
++    is interpreting the args.
++
+     This option conflicts with the [`--protect-args`](#opt) option.
+ 
+ 0.  `--protect-args`, `-s`
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.4.bb b/meta/recipes-devtools/rsync/rsync_3.2.4.bb
index e6f917b5cdc..711e97002d2 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.4.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
+           file://CVE-2022-29154.patch \
            "
 
 SRC_URI[sha256sum] = "6f761838d08052b0b6579cf7f6737d93e47f01f4da04c5d24d3447b7f2a5fad1"
-- 
2.37.2


