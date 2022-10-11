Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA960C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 21:23:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.13146.1665523384483880218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 14:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CH+gM/hB;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id e18so21953456edj.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6bharQ7bhfd4YiHKJ0Pqo94GakjL9MwugaJlDY3Gjl8=;
        b=CH+gM/hBafJGgKqbPddYSniO4kMvZqrNlRamJtKiqIIITctEXb0kNf3Gjz9+k9Ufwx
         K7lalcRFb90m91it+wofvrCLuPIWK38JSiyEcomQUI8IMkdOIq+EyYwhDgmToYyAVPGy
         LIzF8uV+t6+Knn1/c7eiLKOXr7FSfL5mlbEHAqfOpFPEP89of/OC/V7QuLh/Z0tBtOiR
         v0WJvkps5fYzpCzB1dflXeS1nEmA0Y4RNxArMi+dvZUwdlZQknlBmhcLAZADVfqZavZp
         04SC4CSJaIJeLaOqS7PJ1TfO2s81bCgFgBUWg0MaLqJQydqv4Q8O4nXB0USICEIZhCwJ
         QTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bharQ7bhfd4YiHKJ0Pqo94GakjL9MwugaJlDY3Gjl8=;
        b=YAKdzh+tniGo4pCQsfuN8FyYSCTAlrhhuncd1WzL/qLWpiN6/Y1CPaJs70jWK6kB3S
         SHJJSHrrXsAdnZF8n7dq0Uhla5GHTdqLqPeeG1W7i83OFjoG8EFGy4GOFWDbPXzmht2A
         espUCIhweeBAdd74ZfO5GIxVxN9n9N4x1GU9unm0CNv7BeMn5ua68pC8AaCf4/97OqGt
         VusHINNmyP1NPA2fVaAQStnUZZiCnIlvwdEptUV+yx/lLLIyx2PCIM4Mh+QkpYZ3vr93
         B1/3mBmYVAYOqS8h0i/Ac/iZroMH3kiqK724uj333VhdC87TKQd2kDjs3rT81aACJ9ex
         Flpg==
X-Gm-Message-State: ACrzQf1WbuZEWGRpgaxrWdqxqyU/r5InqqbjLzsmvSQWpDdeFqYcmQJ5
	tbH1UwDjlDsvsrLvivjcnYf/008jK7gbe9hL6hPDaA==
X-Google-Smtp-Source: 
 AMsMyM5+urxzFXi/1W0qJMlIUDG4+8tjIFU1H4WhefkDx5XcX/B0+qF9+CA2k9dBBlw2gmAOSe1cgWZfysOm9HX055o=
X-Received: by 2002:a05:6402:501a:b0:457:f093:cadb with SMTP id
 p26-20020a056402501a00b00457f093cadbmr24319884eda.143.1665523382374; Tue, 11
 Oct 2022 14:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221011154943.39162-1-vkumbhar@mvista.com>
In-Reply-To: <20221011154943.39162-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Oct 2022 11:22:51 -1000
Message-ID: 
 <CAOSpxdZy=WqYV=xC_HPmezeuBEgZdA5YJ-x3i-zG9sYNxCDOww@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] rsync: fix CVE-2022-29154
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 21:23:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171638

On Tue, Oct 11, 2022 at 5:50 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> MR: 120436
> Type: Security Fix
> Disposition: Backport from https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> ChangeID: c343a62e84fc2bd4793bda2f45e603a1347d0672
> Description:
>     CVE-2022-29154 rsync: remote arbitrary files write inside the
>

I assume the above is some sort of internal mvista information, much
of which isn't appropriate for oe-core.

The backport link and description are good to include, the rest should
be removed.

> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../rsync/files/0001-CVE-2022-29154.patch     | 335 ++++++++++++++++++

In V2 please name the file CVE-2022-29154.patch

>  meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
>  2 files changed, 336 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/0001-CVE-2022-29154.patch
>
> diff --git a/meta/recipes-devtools/rsync/files/0001-CVE-2022-29154.patch b/meta/recipes-devtools/rsync/files/0001-CVE-2022-29154.patch
> new file mode 100644
> index 0000000000..d29bacbe01
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/0001-CVE-2022-29154.patch
> @@ -0,0 +1,335 @@
> +From 1f862345cf7787af25acf23f08e38c3ee53e2697 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Fri, 26 Aug 2022 05:25:23 +0000
> +Subject: [PATCH] CVE-2022-29154
> +
> +Upstream-Status: Backport from https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> +CVE: CVE-2022-29154
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + exclude.c  | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
> + flist.c    |  17 ++++++-
> + io.c       |   4 ++
> + main.c     |   7 ++-
> + receiver.c |  11 +++--
> + 5 files changed, 161 insertions(+), 8 deletions(-)
> +
> +diff --git a/exclude.c b/exclude.c
> +index 7989fb3..e4bad74 100644
> +--- a/exclude.c
> ++++ b/exclude.c
> +@@ -26,16 +26,22 @@ extern int am_server;
> + extern int am_sender;
> + extern int eol_nulls;
> + extern int io_error;
> ++extern int xfer_dirs;
> ++extern int recurse;
> + extern int local_server;
> + extern int prune_empty_dirs;
> + extern int ignore_perishable;
> ++extern int old_style_args;

I'm getting a build failure on rsync-native on Ubuntu 20.04:

| gcc  -I../rsync-3.1.3/zlib
-isystem/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/usr/include
-O2 -pipe -DHAVE_CONFIG_H -Wall -W
-L/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/usr/lib

-L/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/lib
                        -Wl,--enable-new-dtags
-Wl,-rpath-link,/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/usr/lib

-Wl,-rpath-link,/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/lib

-Wl,-rpath,/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/usr/lib

-Wl,-rpath,/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/recipe-sysroot-native/lib
                        -Wl,-O1 -Wl,--allow-shlib-undefined
-Wl,--dynamic-linker=/home/steve/builds/poky-contrib/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
-o rsync flist.o rsync.o generator.o receiver.o cleanup.o sender.o
exclude.o util.o util2.o main.o checksum.o match.o syscall.o log.o
backup.o delete.o options.o io.o compat.o hlink.o token.o uidlist.o
socket.o hashtable.o fileio.o batch.o clientname.o chmod.o acls.o
xattrs.o progress.o pipe.o params.o loadparm.o clientserver.o access.o
connection.o authenticate.o lib/wildmatch.o lib/compat.o
lib/snprintf.o lib/mdfour.o lib/md5.o lib/permstring.o
lib/pool_alloc.o lib/sysacls.o lib/sysxattrs.o  zlib/deflate.o
zlib/inffast.o zlib/inflate.o zlib/inftrees.o zlib/trees.o
zlib/zutil.o zlib/adler32.o zlib/compress.o zlib/crc32.o  -lattr -lacl
-lpopt
| /home/steve/builds/poky-contrib/build/tmp/hosttools/ld: exclude.o:
in function `add_implied_include':
| exclude.c:(.text+0x516): undefined reference to `old_style_args'
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:94: rsync] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/temp/run.do_compile.1142174:1
exit 1 from 'exit 1'
| ERROR: Execution of
'/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/rsync-native/3.1.3-r0/temp/run.do_compile.1142174'
failed with exit code 1
ERROR: Task (virtual:native:/home/steve/builds/poky-contrib/meta/recipes-devtools/rsync/rsync_3.1.3.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1190 tasks of which 904 didn't need to
be rerun and 1 failed.

Steve

> ++extern int relative_paths;
> + extern int delete_mode;
> + extern int delete_excluded;
> + extern int cvs_exclude;
> + extern int sanitize_paths;
> + extern int protocol_version;
> ++extern int list_only;
> + extern int module_id;
> +
> ++extern char *filesfrom_host;
> + extern char curr_dir[MAXPATHLEN];
> + extern unsigned int curr_dir_len;
> + extern unsigned int module_dirlen;
> +@@ -43,8 +49,10 @@ extern unsigned int module_dirlen;
> + filter_rule_list filter_list = { .debug_type = "" };
> + filter_rule_list cvs_filter_list = { .debug_type = " [global CVS]" };
> + filter_rule_list daemon_filter_list = { .debug_type = " [daemon]" };
> ++filter_rule_list implied_filter_list = { .debug_type = " [implied]" };
> +
> + int saw_xattr_filter = 0;
> ++int trust_sender_filter = 0;
> +
> + /* Need room enough for ":MODS " prefix plus some room to grow. */
> + #define MAX_RULE_PREFIX (16)
> +@@ -293,6 +301,125 @@ static void add_rule(filter_rule_list *listp, const char *pat, unsigned int pat_
> +       }
> + }
> +
> ++/* Each arg the client sends to the remote sender turns into an implied include
> ++ * that the receiver uses to validate the file list from the sender. */
> ++void add_implied_include(const char *arg)
> ++{
> ++      filter_rule *rule;
> ++      int arg_len, saw_wild = 0, backslash_cnt = 0;
> ++      int slash_cnt = 1; /* We know we're adding a leading slash. */
> ++      const char *cp;
> ++      char *p;
> ++      if (old_style_args || list_only || filesfrom_host != NULL)
> ++              return;
> ++      if (relative_paths) {
> ++              cp = strstr(arg, "/./");
> ++              if (cp)
> ++                      arg = cp+3;
> ++      } else {
> ++              if ((cp = strrchr(arg, '/')) != NULL)
> ++                      arg = cp + 1;
> ++      }
> ++      arg_len = strlen(arg);
> ++      if (arg_len) {
> ++              if (strpbrk(arg, "*[?")) {
> ++                      /* We need to add room to escape backslashes if wildcard chars are present. */
> ++                      cp = arg;
> ++                      while ((cp = strchr(cp, '\\')) != NULL) {
> ++                              arg_len++;
> ++                              cp++;
> ++                      }
> ++                      saw_wild = 1;
> ++              }
> ++              arg_len++; /* Leave room for the prefixed slash */
> ++              rule = new0(filter_rule);
> ++              if (!implied_filter_list.head)
> ++                      implied_filter_list.head = implied_filter_list.tail = rule;
> ++              else {
> ++                      rule->next = implied_filter_list.head;
> ++                      implied_filter_list.head = rule;
> ++              }
> ++              rule->rflags = FILTRULE_INCLUDE + (saw_wild ? FILTRULE_WILD : 0);
> ++              p = rule->pattern = new_array(char, arg_len + 1);
> ++              *p++ = '/';
> ++              cp = arg;
> ++              while (*cp) {
> ++                      switch (*cp) {
> ++                        case '\\':
> ++                              backslash_cnt++;
> ++                              if (saw_wild)
> ++                                      *p++ = '\\';
> ++                              *p++ = *cp++;
> ++                              break;
> ++                        case '/':
> ++                              if (p[-1] == '/') /* This is safe because of the initial slash. */
> ++                                      break;
> ++                              if (relative_paths) {
> ++                                      filter_rule const *ent;
> ++                                      int found = 0;
> ++                                      *p = '\0';
> ++                                      for (ent = implied_filter_list.head; ent; ent = ent->next) {
> ++                                              if (ent != rule && strcmp(ent->pattern, rule->pattern) == 0)
> ++                                                      found = 1;
> ++                                      }
> ++                                      if (!found) {
> ++                                              filter_rule *R_rule = new0(filter_rule);
> ++                                              R_rule->rflags = FILTRULE_INCLUDE + (saw_wild ? FILTRULE_WILD : 0);
> ++                                              R_rule->pattern = strdup(rule->pattern);
> ++                                              R_rule->u.slash_cnt = slash_cnt;
> ++                                              R_rule->next = implied_filter_list.head;
> ++                                              implied_filter_list.head = R_rule;
> ++                                      }
> ++                              }
> ++                              slash_cnt++;
> ++                              *p++ = *cp++;
> ++                              break;
> ++                        default:
> ++                              *p++ = *cp++;
> ++                              break;
> ++                      }
> ++              }
> ++              *p = '\0';
> ++              rule->u.slash_cnt = slash_cnt;
> ++              arg = (const char *)rule->pattern;
> ++      }
> ++
> ++      if (recurse || xfer_dirs) {
> ++              /* Now create a rule with an added "/" & "**" or "*" at the end */
> ++              rule = new0(filter_rule);
> ++              if (recurse)
> ++                      rule->rflags = FILTRULE_INCLUDE | FILTRULE_WILD | FILTRULE_WILD2;
> ++              else
> ++                      rule->rflags = FILTRULE_INCLUDE | FILTRULE_WILD;
> ++              /* A +4 in the len leaves enough room for / * * \0 or / * \0 \0 */
> ++              if (!saw_wild && backslash_cnt) {
> ++                      /* We are appending a wildcard, so now the backslashes need to be escaped. */
> ++                      p = rule->pattern = new_array(char, arg_len + backslash_cnt + 3 + 1);
> ++                      cp = arg;
> ++                      while (*cp) {
> ++                              if (*cp == '\\')
> ++                                      *p++ = '\\';
> ++                              *p++ = *cp++;
> ++                      }
> ++              } else {
> ++                      p = rule->pattern = new_array(char, arg_len + 3 + 1);
> ++                      if (arg_len) {
> ++                              memcpy(p, arg, arg_len);
> ++                              p += arg_len;
> ++                      }
> ++              }
> ++              if (p[-1] != '/')
> ++                      *p++ = '/';
> ++              *p++ = '*';
> ++              if (recurse)
> ++                      *p++ = '*';
> ++              *p = '\0';
> ++              rule->u.slash_cnt = slash_cnt + 1;
> ++              rule->next = implied_filter_list.head;
> ++              implied_filter_list.head = rule;
> ++      }
> ++}
> ++
> + /* This frees any non-inherited items, leaving just inherited items on the list. */
> + static void pop_filter_list(filter_rule_list *listp)
> + {
> +@@ -721,7 +848,7 @@ static void report_filter_result(enum logcode code, char const *name,
> +                             : name_flags & NAME_IS_DIR ? "directory"
> +                             : "file";
> +               rprintf(code, "[%s] %sing %s %s because of pattern %s%s%s\n",
> +-                  w, actions[*w!='s'][!(ent->rflags & FILTRULE_INCLUDE)],
> ++                  w, actions[*w=='g'][!(ent->rflags & FILTRULE_INCLUDE)],
> +                   t, name, ent->pattern,
> +                   ent->rflags & FILTRULE_DIRECTORY ? "/" : "", type);
> +       }
> +@@ -894,6 +1021,7 @@ static filter_rule *parse_rule_tok(const char **rulestr_ptr,
> +               }
> +               switch (ch) {
> +               case ':':
> ++                      trust_sender_filter = 1;
> +                       rule->rflags |= FILTRULE_PERDIR_MERGE
> +                                     | FILTRULE_FINISH_SETUP;
> +                       /* FALL THROUGH */
> +diff --git a/flist.c b/flist.c
> +index 499440c..630d685 100644
> +--- a/flist.c
> ++++ b/flist.c
> +@@ -70,6 +70,7 @@ extern int need_unsorted_flist;
> + extern int sender_symlink_iconv;
> + extern int output_needs_newline;
> + extern int sender_keeps_checksum;
> ++extern int trust_sender_filter;
> + extern int unsort_ndx;
> + extern uid_t our_uid;
> + extern struct stats stats;
> +@@ -80,8 +81,7 @@ extern char curr_dir[MAXPATHLEN];
> +
> + extern struct chmod_mode_struct *chmod_modes;
> +
> +-extern filter_rule_list filter_list;
> +-extern filter_rule_list daemon_filter_list;
> ++extern filter_rule_list filter_list, implied_filter_list, daemon_filter_list;
> +
> + #ifdef ICONV_OPTION
> + extern int filesfrom_convert;
> +@@ -904,6 +904,19 @@ static struct file_struct *recv_file_entry(int f, struct file_list *flist, int x
> +               exit_cleanup(RERR_UNSUPPORTED);
> +       }
> +
> ++      if (*thisname != '.' || thisname[1] != '\0') {
> ++              int filt_flags = S_ISDIR(mode) ? NAME_IS_DIR : NAME_IS_FILE;
> ++              if (!trust_sender_filter /* a per-dir filter rule means we must trust the sender's filtering */
> ++               && filter_list.head && check_filter(&filter_list, FINFO, thisname, filt_flags) < 0) {
> ++                      rprintf(FERROR, "ERROR: rejecting excluded file-list name: %s\n", thisname);
> ++                      exit_cleanup(RERR_PROTOCOL);
> ++              }
> ++              if (implied_filter_list.head && check_filter(&implied_filter_list, FINFO, thisname, filt_flags) <= 0) {
> ++                      rprintf(FERROR, "ERROR: rejecting unrequested file-list name: %s\n", thisname);
> ++                      exit_cleanup(RERR_PROTOCOL);
> ++              }
> ++      }
> ++
> +       if (inc_recurse && S_ISDIR(mode)) {
> +               if (one_file_system) {
> +                       /* Room to save the dir's device for -x */
> +diff --git a/io.c b/io.c
> +index c04dbd5..698a7da 100644
> +--- a/io.c
> ++++ b/io.c
> +@@ -415,6 +415,7 @@ static void forward_filesfrom_data(void)
> +               while (s != eob) {
> +                       if (*s++ == '\0') {
> +                               ff_xb.len = s - sob - 1;
> ++                              add_implied_include(sob);
> +                               if (iconvbufs(ic_send, &ff_xb, &iobuf.out, flags) < 0)
> +                                       exit_cleanup(RERR_PROTOCOL); /* impossible? */
> +                               write_buf(iobuf.out_fd, s-1, 1); /* Send the '\0'. */
> +@@ -446,9 +447,12 @@ static void forward_filesfrom_data(void)
> +               char *f = ff_xb.buf + ff_xb.pos;
> +               char *t = ff_xb.buf;
> +               char *eob = f + len;
> ++              char *cur = t;
> +               /* Eliminate any multi-'\0' runs. */
> +               while (f != eob) {
> +                       if (!(*t++ = *f++)) {
> ++                              add_implied_include(cur);
> ++                              cur = t;
> +                               while (f != eob && *f == '\0')
> +                                       f++;
> +                       }
> +diff --git a/main.c b/main.c
> +index ee9630f..6ec56e7 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -78,6 +78,7 @@ extern BOOL flist_receiving_enabled;
> + extern BOOL shutting_down;
> + extern int backup_dir_len;
> + extern int basis_dir_cnt;
> ++extern int trust_sender_filter;
> + extern struct stats stats;
> + extern char *stdout_format;
> + extern char *logfile_format;
> +@@ -93,7 +94,7 @@ extern char curr_dir[MAXPATHLEN];
> + extern char backup_dir_buf[MAXPATHLEN];
> + extern char *basis_dir[MAX_BASIS_DIRS+1];
> + extern struct file_list *first_flist;
> +-extern filter_rule_list daemon_filter_list;
> ++extern filter_rule_list daemon_filter_list, implied_filter_list;
> +
> + uid_t our_uid;
> + gid_t our_gid;
> +@@ -534,6 +535,7 @@ static pid_t do_cmd(char *cmd, char *machine, char *user, char **remote_argv, in
> + #ifdef ICONV_CONST
> +               setup_iconv();
> + #endif
> ++              trust_sender_filter = 1;
> +       } else if (local_server) {
> +               /* If the user didn't request --[no-]whole-file, force
> +                * it on, but only if we're not batch processing. */
> +@@ -1358,6 +1360,8 @@ static int start_client(int argc, char *argv[])
> +               char *dummy_host;
> +               int dummy_port = rsync_port;
> +               int i;
> ++              if (filesfrom_fd < 0)
> ++                      add_implied_include(remote_argv[0]);
> +               /* For remote source, any extra source args must have either
> +                * the same hostname or an empty hostname. */
> +               for (i = 1; i < remote_argc; i++) {
> +@@ -1381,6 +1385,7 @@ static int start_client(int argc, char *argv[])
> +                       if (!rsync_port && !*arg) /* Turn an empty arg into a dot dir. */
> +                               arg = ".";
> +                       remote_argv[i] = arg;
> ++                      add_implied_include(arg);
> +               }
> +       }
> +
> +diff --git a/receiver.c b/receiver.c
> +index d6a48f1..c0aa893 100644
> +--- a/receiver.c
> ++++ b/receiver.c
> +@@ -577,10 +577,13 @@ int recv_files(int f_in, int f_out, char *local_name)
> +               if (DEBUG_GTE(RECV, 1))
> +                       rprintf(FINFO, "recv_files(%s)\n", fname);
> +
> +-              if (daemon_filter_list.head && (*fname != '.' || fname[1] != '\0')
> +-               && check_filter(&daemon_filter_list, FLOG, fname, 0) < 0) {
> +-                      rprintf(FERROR, "attempt to hack rsync failed.\n");
> +-                      exit_cleanup(RERR_PROTOCOL);
> ++              if (daemon_filter_list.head && (*fname != '.' || fname[1] != '\0')) {
> ++                      int filt_flags = S_ISDIR(file->mode) ? NAME_IS_DIR : NAME_IS_FILE;
> ++                      if (check_filter(&daemon_filter_list, FLOG, fname, filt_flags) < 0) {
> ++                              rprintf(FERROR, "ERROR: rejecting file transfer request for daemon excluded file: %s\n",
> ++                                      fname);
> ++                              exit_cleanup(RERR_PROTOCOL);
> ++                      }
> +               }
> +
> + #ifdef SUPPORT_XATTRS
> +--
> +2.18.2
> +
> diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
> index 152ff02a25..3507c89186 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
> @@ -15,6 +15,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
>             file://CVE-2016-9841.patch \
>             file://CVE-2016-9842.patch \
>             file://CVE-2016-9843.patch \
> +           file://0001-CVE-2022-29154.patch \
>  "
>
>  SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171630): https://lists.openembedded.org/g/openembedded-core/message/171630
> Mute This Topic: https://lists.openembedded.org/mt/94261791/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

