Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB00C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:42:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16167.1672594972570891594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aqDUfhnD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id m4so27172567pls.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYkub/ip77QX/N/reXkL2mcGsLo54J4WhIzj1uT38EA=;
        b=aqDUfhnDdbmiSscRP+9iNd61uskdrneQSN+fWh1TSZXWrqV/7AXqlN9SiVhZPbN3m6
         3l9CbRDY+d2qlWNoJhtWIzbxH4PYt/q9XgHeLPRwOUefPkVsZBH+mcevM0RVCqVwnh3T
         79tBLrSK4UE6PFmNc0PLdUJEBHbog4gKq2HJxPr6OkfhmS0k94PdElH+G1+mf2IlpnPs
         VQTKDrnZoedYLH3ROmryokcn8rmadBNBd6yo0dgCbbG97V9BuqpbXOx7r2wdNYxHKFTP
         5jXFnoNJzgoraTawL7DqwntXYtpItMzt/d9IC8/LBajpPEwB1laUTRcYzVtM/WQ0Q2GT
         c/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYkub/ip77QX/N/reXkL2mcGsLo54J4WhIzj1uT38EA=;
        b=3abPP5furKFCTA8R1I1amzO1HGH9tGiX/Sl0EEhyIP1DZZW9VazK/pZZiq3tfwsKKt
         n2LxEul8un9Uy9quZvadkshSvPLWXm4fyhR2MkFCPj6oaBjGAvQEtCdaRpvCC0kgrhJA
         W01LxXDj3CCwF/cBGDveHwtxays6qPonnecOlXmT09x5WfLgo1AuDwpylTifTPlhUu/4
         DyysGQ3CIS+KDTf7W4j9yrR2J755ZVtlhfobPefuTJC9aYXW9BREKow/LmEcZu5hSvNL
         eUHJ0t1em19/mt4gps0CMgicAeNOj2ORxVJSJn9iSnwu8LEUEbsuqOrSIUMdchHQlejG
         t62A==
X-Gm-Message-State: AFqh2kopaUsqYPecI4fy/7hbbtw1o8Czeb/dzUOBrH4qKCRChl8Ykfi6
	m2uKLb7or+nZW0Do6zPly01DL7ZxuscJJrNryOw=
X-Google-Smtp-Source: AMrXdXsok3eiYJ6QUt7KKhgUyMjoiTqpUEw0habNPpmCbV0hRDHOM71w9y6ui2t3VKtLlO0X4RzH1A==
X-Received: by 2002:a17:902:a40a:b0:192:7363:f6c7 with SMTP id p10-20020a170902a40a00b001927363f6c7mr27788763plq.37.1672594971309;
        Sun, 01 Jan 2023 09:42:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/18] rsync: fix CVE-2022-29154 remote arbitrary files write inside the directories of connecting peers
Date: Sun,  1 Jan 2023 07:42:19 -1000
Message-Id: <6367c60c93b76dda9d9b37de21f750966bffbf87.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175221

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2022-29154.patch          | 334 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
 2 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2022-29154.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2022-29154.patch b/meta/recipes-devtools/rsync/files/CVE-2022-29154.patch
new file mode 100644
index 0000000000..61e4e03254
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2022-29154.patch
@@ -0,0 +1,334 @@
+From b7231c7d02cfb65d291af74ff66e7d8c507ee871 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Sun, 31 Jul 2022 16:55:34 -0700
+Subject: [PATCH] Some extra file-list safety checks.
+
+CVE-2022-29154 rsync: remote arbitrary files write inside the
+
+Upstream-Status: Backport from [https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871]
+CVE:CVE-2022-29154
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ exclude.c  | 127 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ flist.c    |  17 ++++++-
+ io.c       |   4 ++
+ main.c     |   7 ++-
+ receiver.c |  11 +++--
+ 5 files changed, 158 insertions(+), 8 deletions(-)
+
+diff --git a/exclude.c b/exclude.c
+index 7989fb3..e146e96 100644
+--- a/exclude.c
++++ b/exclude.c
+@@ -26,16 +26,21 @@ extern int am_server;
+ extern int am_sender;
+ extern int eol_nulls;
+ extern int io_error;
++extern int xfer_dirs;
++extern int recurse;
+ extern int local_server;
+ extern int prune_empty_dirs;
+ extern int ignore_perishable;
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
+@@ -43,8 +48,10 @@ extern unsigned int module_dirlen;
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
+@@ -293,6 +300,123 @@ static void add_rule(filter_rule_list *listp, const char *pat, unsigned int pat_
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
+@@ -721,7 +845,7 @@ static void report_filter_result(enum logcode code, char const *name,
+ 			      : name_flags & NAME_IS_DIR ? "directory"
+ 			      : "file";
+ 		rprintf(code, "[%s] %sing %s %s because of pattern %s%s%s\n",
+-		    w, actions[*w!='s'][!(ent->rflags & FILTRULE_INCLUDE)],
++		    w, actions[*w=='g'][!(ent->rflags & FILTRULE_INCLUDE)],
+ 		    t, name, ent->pattern,
+ 		    ent->rflags & FILTRULE_DIRECTORY ? "/" : "", type);
+ 	}
+@@ -894,6 +1018,7 @@ static filter_rule *parse_rule_tok(const char **rulestr_ptr,
+ 		}
+ 		switch (ch) {
+ 		case ':':
++			trust_sender_filter = 1;
+ 			rule->rflags |= FILTRULE_PERDIR_MERGE
+ 				      | FILTRULE_FINISH_SETUP;
+ 			/* FALL THROUGH */
+diff --git a/flist.c b/flist.c
+index 499440c..630d685 100644
+--- a/flist.c
++++ b/flist.c
+@@ -70,6 +70,7 @@ extern int need_unsorted_flist;
+ extern int sender_symlink_iconv;
+ extern int output_needs_newline;
+ extern int sender_keeps_checksum;
++extern int trust_sender_filter;
+ extern int unsort_ndx;
+ extern uid_t our_uid;
+ extern struct stats stats;
+@@ -80,8 +81,7 @@ extern char curr_dir[MAXPATHLEN];
+ 
+ extern struct chmod_mode_struct *chmod_modes;
+ 
+-extern filter_rule_list filter_list;
+-extern filter_rule_list daemon_filter_list;
++extern filter_rule_list filter_list, implied_filter_list, daemon_filter_list;
+ 
+ #ifdef ICONV_OPTION
+ extern int filesfrom_convert;
+@@ -904,6 +904,19 @@ static struct file_struct *recv_file_entry(int f, struct file_list *flist, int x
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
+diff --git a/io.c b/io.c
+index c04dbd5..698a7da 100644
+--- a/io.c
++++ b/io.c
+@@ -415,6 +415,7 @@ static void forward_filesfrom_data(void)
+ 		while (s != eob) {
+ 			if (*s++ == '\0') {
+ 				ff_xb.len = s - sob - 1;
++				add_implied_include(sob);
+ 				if (iconvbufs(ic_send, &ff_xb, &iobuf.out, flags) < 0)
+ 					exit_cleanup(RERR_PROTOCOL); /* impossible? */
+ 				write_buf(iobuf.out_fd, s-1, 1); /* Send the '\0'. */
+@@ -446,9 +447,12 @@ static void forward_filesfrom_data(void)
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
+diff --git a/main.c b/main.c
+index ee9630f..6ec56e7 100644
+--- a/main.c
++++ b/main.c
+@@ -78,6 +78,7 @@ extern BOOL flist_receiving_enabled;
+ extern BOOL shutting_down;
+ extern int backup_dir_len;
+ extern int basis_dir_cnt;
++extern int trust_sender_filter;
+ extern struct stats stats;
+ extern char *stdout_format;
+ extern char *logfile_format;
+@@ -93,7 +94,7 @@ extern char curr_dir[MAXPATHLEN];
+ extern char backup_dir_buf[MAXPATHLEN];
+ extern char *basis_dir[MAX_BASIS_DIRS+1];
+ extern struct file_list *first_flist;
+-extern filter_rule_list daemon_filter_list;
++extern filter_rule_list daemon_filter_list, implied_filter_list;
+ 
+ uid_t our_uid;
+ gid_t our_gid;
+@@ -534,6 +535,7 @@ static pid_t do_cmd(char *cmd, char *machine, char *user, char **remote_argv, in
+ #ifdef ICONV_CONST
+ 		setup_iconv();
+ #endif
++		trust_sender_filter = 1;
+ 	} else if (local_server) {
+ 		/* If the user didn't request --[no-]whole-file, force
+ 		 * it on, but only if we're not batch processing. */
+@@ -1358,6 +1360,8 @@ static int start_client(int argc, char *argv[])
+ 		char *dummy_host;
+ 		int dummy_port = rsync_port;
+ 		int i;
++		if (filesfrom_fd < 0)
++			add_implied_include(remote_argv[0]);
+ 		/* For remote source, any extra source args must have either
+ 		 * the same hostname or an empty hostname. */
+ 		for (i = 1; i < remote_argc; i++) {
+@@ -1381,6 +1385,7 @@ static int start_client(int argc, char *argv[])
+ 			if (!rsync_port && !*arg) /* Turn an empty arg into a dot dir. */
+ 				arg = ".";
+ 			remote_argv[i] = arg;
++			add_implied_include(arg);
+ 		}
+ 	}
+ 
+diff --git a/receiver.c b/receiver.c
+index d6a48f1..c0aa893 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -577,10 +577,13 @@ int recv_files(int f_in, int f_out, char *local_name)
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
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index c743e3f75b..a5c20dee34 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2016-9841.patch \
            file://CVE-2016-9842.patch \
            file://CVE-2016-9843.patch \
+           file://CVE-2022-29154.patch \
 "
 
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
-- 
2.25.1


