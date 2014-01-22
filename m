Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BCA3F60CEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:39:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0M2dews026031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 18:39:40 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 18:39:39 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 10:39:46 +0800
Message-ID: <c16c9ad825e53c9e068b54465765b1623c22e2fc.1390358320.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390358320.git.Qi.Chen@windriver.com>
References: <cover.1390358320.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] busybox: upgrade to stable 1.22.1
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
X-List-Received-Date: Wed, 22 Jan 2014 02:39:40 -0000
Content-Type: text/plain

Upgrade busybox to the stable release 1.22.1.

During this upgrade, 9 patches are removed. Reasons are detailed below.

The following 6 patches are removed as they have been merged.
    meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
    meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
    meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
    meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
    meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
    meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch

The following three patches are removed because they are mainly about moving
binaries from /bin to /usr/bin to make the update-alternative work correctly
at rootfs time. We can easily solve this problem by changing recipes. There's
no compelling reason why such patches are needed.
    meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
    meta/recipes-core/busybox/busybox/stat-usr-bin.patch
    meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox-lineedit-initialize-delptr.patch       |   23 --
 ...usybox-list-suid-and-non-suid-app-configs.patch |  179 -------------
 ...sybox-sed-fix-sed-clusternewline-testcase.patch |  262 --------------------
 .../busybox-sulogin-empty-root-password.patch      |   58 -----
 .../busybox/find-get-rid-of-nested-functions.patch |  117 ---------
 .../busybox/busybox/run-parts.in.usr-bin.patch     |   29 ---
 .../busybox/busybox/stat-usr-bin.patch             |   21 --
 ...estsuite-du-du-k-works-fix-false-positive.patch |   35 ---
 .../busybox/busybox/watch.in.usr-bin.patch         |   29 ---
 .../{busybox_1.21.1.bb => busybox_1.22.1.bb}       |   13 +-
 meta/recipes-core/busybox/busybox_git.bb           |   11 +-
 11 files changed, 4 insertions(+), 773 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/stat-usr-bin.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch
 rename meta/recipes-core/busybox/{busybox_1.21.1.bb => busybox_1.22.1.bb} (66%)

diff --git a/meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch b/meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
deleted file mode 100644
index e59211b..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Derived from:
-http://git.busybox.net/busybox/commit/?id=46031da862a60422f80050a905cea0b67026b021.
-
-In vi mode, the 'p' and 'P' commands caused a segfault when nothing had
-been put in the buffer yet because the delptr was not initialized.
-
-Upstream-Status: Backport
-
-Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-
-diff -urpN a/libbb/lineedit.c b/libbb/lineedit.c
---- a/libbb/lineedit.c
-+++ b/libbb/lineedit.c
-@@ -187,6 +187,7 @@ extern struct lineedit_statics *const li
- 	cmdedit_termw = 80; \
- 	IF_FEATURE_EDITING_FANCY_PROMPT(num_ok_lines = 1;) \
- 	IF_USERNAME_OR_HOMEDIR(home_pwd_buf = (char*)null_str;) \
-+	IF_FEATURE_EDITING_VI(delptr = delbuf;) \
- } while (0)
- 
- static void deinit_S(void)
diff --git a/meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch b/meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
deleted file mode 100644
index 753a044..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-Make busybox have the ability to list configuration items regarding suid
-apps and non-suid apps separately.
-
-From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Date: Mon, 17 Jun 2013 11:06:05 +0800
-Subject: [PATCH] busybox: list suid and non-suid app configs
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- Makefile.custom            |    4 ++++
- applets/busybox.mksuid     |   53 ++++++++++++++++++++++++++++++++++++++++++++
- include/applets.src.h      |    9 +++++++-
- scripts/kconfig/confdata.c |   24 ++++++++++++++++----
- 4 files changed, 85 insertions(+), 5 deletions(-)
- create mode 100644 applets/busybox.mksuid
-
-diff --git a/Makefile.custom b/Makefile.custom
-index 6da79e6..a276d6f 100644
---- a/Makefile.custom
-+++ b/Makefile.custom
-@@ -4,6 +4,10 @@
- 
- busybox.links: $(srctree)/applets/busybox.mkll $(objtree)/include/autoconf.h include/applets.h
- 	$(Q)-$(SHELL) $^ >$@
-+busybox.cfg.suid: $(srctree)/applets/busybox.mksuid $(objtree)/include/autoconf.h include/applets.h
-+	$(Q)-SUID="yes" $(SHELL) $^ > $@
-+busybox.cfg.nosuid: $(srctree)/applets/busybox.mksuid $(objtree)/include/autoconf.h include/applets.h
-+	$(Q)-SUID="DROP" $(SHELL) $^ > $@
- 
- .PHONY: install
- ifeq ($(CONFIG_INSTALL_APPLET_SYMLINKS),y)
-diff --git a/applets/busybox.mksuid b/applets/busybox.mksuid
-new file mode 100644
-index 0000000..e11a7a1
---- /dev/null
-+++ b/applets/busybox.mksuid
-@@ -0,0 +1,53 @@
-+#!/bin/sh
-+# Make list of configuration variables regarding suid handling
-+
-+# input $1: full path to autoconf.h
-+# input $2: full path to applets.h
-+# input $3: full path to .config
-+# output (stdout): list of CONFIG_ that do or may require suid
-+
-+# If the environment variable SUID is not set or set to DROP,
-+# lists all config options that do not require suid permissions.
-+# Otherwise, lists all config options for applets that DO or MAY require
-+# suid permissions.
-+
-+# Maintainer: Bernhard Reutner-Fischer
-+
-+export LC_ALL=POSIX
-+export LC_CTYPE=POSIX
-+
-+CONFIG_H=${1:-include/autoconf.h}
-+APPLETS_H=${2:-include/applets.h}
-+DOT_CONFIG=${3:-.config}
-+
-+case ${SUID:-DROP} in
-+    [dD][rR][oO][pP]) USE="DROP" ;;
-+    *) USE="suid" ;;
-+esac
-+
-+$HOSTCC -E -DMAKE_SUID -include $CONFIG_H $APPLETS_H |
-+  awk -v USE=${USE} '
-+    /^SUID[ \t]/{
-+      if (USE == "DROP") {
-+        if ($2 != "BB_SUID_DROP") next
-+      } else {
-+        if ($2 == "BB_SUID_DROP") next
-+      }
-+      cfg = $NF
-+      gsub("\"", "", cfg)
-+      cfg = substr(cfg, 8)
-+      s[i++] = "CONFIG_" cfg
-+      s[i++] = "CONFIG_FEATURE_" cfg "_.*"
-+    }
-+    END{
-+      while (getline < ARGV[2]) {
-+        for (j in s) {
-+          if ($0 ~ "^" s[j] "=y$") {
-+            sub(/=.*/, "")
-+            print
-+            if (s[j] !~ /\*$/) delete s[j] # can drop this applet now
-+          }
-+        }
-+      }
-+    }
-+' - $DOT_CONFIG
-diff --git a/include/applets.src.h b/include/applets.src.h
-index 02b995b..8386c84 100644
---- a/include/applets.src.h
-+++ b/include/applets.src.h
-@@ -52,6 +52,12 @@ s     - suid type:
- # define APPLET_NOEXEC(name,main,l,s,name2)  LINK l name
- # define APPLET_NOFORK(name,main,l,s,name2)  LINK l name
- 
-+#elif defined(MAKE_SUID)
-+# define APPLET(name,l,s)                    SUID s l name
-+# define APPLET_ODDNAME(name,main,l,s,name2) SUID s l name
-+# define APPLET_NOEXEC(name,main,l,s,name2)  SUID s l name
-+# define APPLET_NOFORK(name,main,l,s,name2)  SUID s l name
-+
- #else
-   static struct bb_applet applets[] = { /*    name, main, location, need_suid */
- # define APPLET(name,l,s)                    { #name, #name, l, s },
-@@ -414,7 +420,8 @@ IF_YES(APPLET_NOFORK(yes, yes, BB_DIR_USR_BIN, BB_SUID_DROP, yes))
- IF_GUNZIP(APPLET_ODDNAME(zcat, gunzip, BB_DIR_BIN, BB_SUID_DROP, zcat))
- IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))
- 
--#if !defined(PROTOTYPES) && !defined(NAME_MAIN_CNAME) && !defined(MAKE_USAGE)
-+#if !defined(PROTOTYPES) && !defined(NAME_MAIN_CNAME) && !defined(MAKE_USAGE) \
-+    && !defined(MAKE_LINKS) && !defined(MAKE_SUID)
- };
- #endif
- 
-diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
-index bd2d70e..303df0b 100644
---- a/scripts/kconfig/confdata.c
-+++ b/scripts/kconfig/confdata.c
-@@ -474,7 +474,11 @@ int conf_write(const char *name)
- 						fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
- 						/* bbox */
- 						fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
--						fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
-+						fprintf(out_h, "#ifdef MAKE_SUID\n");
-+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
-+						fprintf(out_h, "#else\n");
-+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
-+						fprintf(out_h, "#endif\n");
- 						fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
- 					}
- 					break;
-@@ -506,7 +510,11 @@ int conf_write(const char *name)
- 					fputs("\"\n", out_h);
- 					/* bbox */
- 					fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
--					fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
-+					fprintf(out_h, "#ifdef MAKE_SUID\n");
-+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
-+					fprintf(out_h, "#else\n");
-+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
-+					fprintf(out_h, "#endif\n");
- 					fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
- 				}
- 				break;
-@@ -518,7 +526,11 @@ int conf_write(const char *name)
- 						fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
- 						/* bbox */
- 						fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
--						fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
-+						fprintf(out_h, "#ifdef MAKE_SUID\n");
-+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
-+						fprintf(out_h, "#else\n");
-+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
-+						fprintf(out_h, "#endif\n");
- 						fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
- 					}
- 					break;
-@@ -532,7 +544,11 @@ int conf_write(const char *name)
- 					fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
- 					/* bbox */
- 					fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
--					fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
-+					fprintf(out_h, "#ifdef MAKE_SUID\n");
-+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
-+					fprintf(out_h, "#else\n");
-+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
-+					fprintf(out_h, "#endif\n");
- 					fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
- 				}
- 				break;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch b/meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
deleted file mode 100644
index 1894037..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
+++ /dev/null
@@ -1,262 +0,0 @@
-From 6394bcf17925715db042cfb24f5886b1bed1dfc9 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 31 Oct 2013 14:36:31 +0800
-Subject: [PATCH] sed: fix "sed clusternewline" and "autoinsert newline" testcase
-
-Upstream-Status: Backport [busybox.net]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- editors/sed.c       | 135 ++++++++++++++++++++++++++--------------------------
- testsuite/sed.tests |   4 --
- 2 files changed, 68 insertions(+), 71 deletions(-)
-
-diff --git a/editors/sed.c b/editors/sed.c
-index f8ca5d3..98478b4 100644
---- a/editors/sed.c
-+++ b/editors/sed.c
-@@ -845,37 +845,79 @@ static void append(char *s)
- 	llist_add_to_end(&G.append_head, xstrdup(s));
- }
-
--static void flush_append(void)
-+/* Output line of text. */
-+/* Note:
-+ * The tricks with NO_EOL_CHAR and last_puts_char are there to emulate gnu sed.
-+ * Without them, we had this:
-+ * echo -n thingy >z1
-+ * echo -n again >z2
-+ * >znull
-+ * sed "s/i/z/" z1 z2 znull | hexdump -vC
-+ * output:
-+ * gnu sed 4.1.5:
-+ * 00000000  74 68 7a 6e 67 79 0a 61  67 61 7a 6e              |thzngy.agazn|
-+ * bbox:
-+ * 00000000  74 68 7a 6e 67 79 61 67  61 7a 6e                 |thzngyagazn|
-+ */
-+enum {
-+	NO_EOL_CHAR = 1,
-+	LAST_IS_NUL = 2,
-+};
-+static void puts_maybe_newline(char *s, FILE *file, char *last_puts_char, char last_gets_char)
-+{
-+	char lpc = *last_puts_char;
-+
-+	/* Need to insert a '\n' between two files because first file's
-+	 * last line wasn't terminated? */
-+	if (lpc != '\n' && lpc != '\0') {
-+		fputc('\n', file);
-+		lpc = '\n';
-+	}
-+	fputs(s, file);
-+
-+	/* 'x' - just something which is not '\n', '\0' or NO_EOL_CHAR */
-+	if (s[0])
-+		lpc = 'x';
-+
-+	/* had trailing '\0' and it was last char of file? */
-+	if (last_gets_char == LAST_IS_NUL) {
-+		fputc('\0', file);
-+		lpc = 'x'; /* */
-+	} else
-+	/* had trailing '\n' or '\0'? */
-+	if (last_gets_char != NO_EOL_CHAR) {
-+		fputc(last_gets_char, file);
-+		lpc = last_gets_char;
-+	}
-+
-+	if (ferror(file)) {
-+		xfunc_error_retval = 4;  /* It's what gnu sed exits with... */
-+		bb_error_msg_and_die(bb_msg_write_error);
-+	}
-+	*last_puts_char = lpc;
-+}
-+
-+static void flush_append(char *last_puts_char, char last_gets_char)
- {
- 	char *data;
-
- 	/* Output appended lines. */
- 	while ((data = (char *)llist_pop(&G.append_head))) {
--		fprintf(G.nonstdout, "%s\n", data);
-+		puts_maybe_newline(data, G.nonstdout, last_puts_char, last_gets_char);
- 		free(data);
- 	}
- }
-
--static void add_input_file(FILE *file)
--{
--	G.input_file_list = xrealloc_vector(G.input_file_list, 2, G.input_file_count);
--	G.input_file_list[G.input_file_count++] = file;
--}
--
- /* Get next line of input from G.input_file_list, flushing append buffer and
-  * noting if we ran out of files without a newline on the last line we read.
-  */
--enum {
--	NO_EOL_CHAR = 1,
--	LAST_IS_NUL = 2,
--};
--static char *get_next_line(char *gets_char)
-+static char *get_next_line(char *gets_char, char *last_puts_char, char last_gets_char)
- {
- 	char *temp = NULL;
- 	int len;
- 	char gc;
-
--	flush_append();
-+	flush_append(last_puts_char, last_gets_char);
-
- 	/* will be returned if last line in the file
- 	 * doesn't end with either '\n' or '\0' */
-@@ -919,54 +961,6 @@ static char *get_next_line(char *gets_char)
- 	return temp;
- }
-
--/* Output line of text. */
--/* Note:
-- * The tricks with NO_EOL_CHAR and last_puts_char are there to emulate gnu sed.
-- * Without them, we had this:
-- * echo -n thingy >z1
-- * echo -n again >z2
-- * >znull
-- * sed "s/i/z/" z1 z2 znull | hexdump -vC
-- * output:
-- * gnu sed 4.1.5:
-- * 00000000  74 68 7a 6e 67 79 0a 61  67 61 7a 6e              |thzngy.agazn|
-- * bbox:
-- * 00000000  74 68 7a 6e 67 79 61 67  61 7a 6e                 |thzngyagazn|
-- */
--static void puts_maybe_newline(char *s, FILE *file, char *last_puts_char, char last_gets_char)
--{
--	char lpc = *last_puts_char;
--
--	/* Need to insert a '\n' between two files because first file's
--	 * last line wasn't terminated? */
--	if (lpc != '\n' && lpc != '\0') {
--		fputc('\n', file);
--		lpc = '\n';
--	}
--	fputs(s, file);
--
--	/* 'x' - just something which is not '\n', '\0' or NO_EOL_CHAR */
--	if (s[0])
--		lpc = 'x';
--
--	/* had trailing '\0' and it was last char of file? */
--	if (last_gets_char == LAST_IS_NUL) {
--		fputc('\0', file);
--		lpc = 'x'; /* */
--	} else
--	/* had trailing '\n' or '\0'? */
--	if (last_gets_char != NO_EOL_CHAR) {
--		fputc(last_gets_char, file);
--		lpc = last_gets_char;
--	}
--
--	if (ferror(file)) {
--		xfunc_error_retval = 4;  /* It's what gnu sed exits with... */
--		bb_error_msg_and_die(bb_msg_write_error);
--	}
--	*last_puts_char = lpc;
--}
--
- #define sed_puts(s, n) (puts_maybe_newline(s, G.nonstdout, &last_puts_char, n))
-
- static int beg_match(sed_cmd_t *sed_cmd, const char *pattern_space)
-@@ -989,7 +983,7 @@ static void process_files(void)
- 	int substituted;
-
- 	/* Prime the pump */
--	next_line = get_next_line(&next_gets_char);
-+	next_line = get_next_line(&next_gets_char, &last_puts_char, '\n' /*last_gets_char*/);
-
- 	/* Go through every line in each file */
-  again:
-@@ -1003,7 +997,7 @@ static void process_files(void)
-
- 	/* Read one line in advance so we can act on the last line,
- 	 * the '$' address */
--	next_line = get_next_line(&next_gets_char);
-+	next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
- 	linenum++;
-
- 	/* For every line, go through all the commands */
-@@ -1176,6 +1170,7 @@ static void process_files(void)
- 		/* Append line to linked list to be printed later */
- 		case 'a':
- 			append(sed_cmd->string);
-+			last_gets_char = '\n';
- 			break;
-
- 		/* Insert text before this line */
-@@ -1222,7 +1217,7 @@ static void process_files(void)
- 				free(pattern_space);
- 				pattern_space = next_line;
- 				last_gets_char = next_gets_char;
--				next_line = get_next_line(&next_gets_char);
-+				next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
- 				substituted = 0;
- 				linenum++;
- 				break;
-@@ -1258,7 +1253,7 @@ static void process_files(void)
- 			pattern_space[len] = '\n';
- 			strcpy(pattern_space + len+1, next_line);
- 			last_gets_char = next_gets_char;
--			next_line = get_next_line(&next_gets_char);
-+			next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
- 			linenum++;
- 			break;
- 		}
-@@ -1362,7 +1357,7 @@ static void process_files(void)
-
- 	/* Delete and such jump here. */
-  discard_line:
--	flush_append();
-+	flush_append(&last_puts_char, last_gets_char);
- 	free(pattern_space);
-
- 	goto again;
-@@ -1403,6 +1398,12 @@ static void add_cmd_block(char *cmdstr)
- 	free(sv);
- }
-
-+static void add_input_file(FILE *file)
-+{
-+	G.input_file_list = xrealloc_vector(G.input_file_list, 2, G.input_file_count);
-+	G.input_file_list[G.input_file_count++] = file;
-+}
-+
- int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int sed_main(int argc UNUSED_PARAM, char **argv)
- {
-diff --git a/testsuite/sed.tests b/testsuite/sed.tests
-index 468565f..e26483c 100755
---- a/testsuite/sed.tests
-+++ b/testsuite/sed.tests
-@@ -135,10 +135,8 @@ testing "sed empty file plus cat" "sed -e 's/nohit//' input -" "one\ntwo" \
- 	"" "one\ntwo"
- testing "sed cat plus empty file" "sed -e 's/nohit//' input -" "one\ntwo" \
- 	"one\ntwo" ""
--test x"$SKIP_KNOWN_BUGS" = x"" && {
- testing "sed append autoinserts newline" "sed -e '/woot/a woo' -" \
- 	"woot\nwoo\n" "" "woot"
--}
- testing "sed insert doesn't autoinsert newline" "sed -e '/woot/i woo' -" \
- 	"woo\nwoot" "" "woot"
- testing "sed print autoinsert newlines" "sed -e 'p' -" "one\none" "" "one"
-@@ -154,11 +152,9 @@ testing "sed selective matches insert newline" \
- testing "sed selective matches noinsert newline" \
- 	"sed -ne 's/woo/bang/p' input -" "a bang\nb bang" "a woo\nb woo" \
- 	"c no\nd no"
--test x"$SKIP_KNOWN_BUGS" = x"" && {
- testing "sed clusternewline" \
- 	"sed -e '/one/a 111' -e '/two/i 222' -e p input -" \
- 	"one\none\n111\n222\ntwo\ntwo" "one" "two"
--}
- testing "sed subst+write" \
- 	"sed -e 's/i/z/' -e 'woutputw' input -; $ECHO -n X; cat outputw" \
- 	"thzngy\nagaznXthzngy\nagazn" "thingy" "again"
---
-1.8.3
-
diff --git a/meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch b/meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
deleted file mode 100644
index baad298..0000000
--- a/meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From b6dc13c2d3754704b1bf5af4e6b957b48585102f Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Tue, 21 May 2013 17:01:55 +0200
-Subject: [PATCH] sulogin: allow system maintenance login if root password is
- empty
-
-The current password checking is unable to distinguish between the user
-entering an empty password or pressing Control-D. As a result, an empty
-password always results in normal startup.
-
-We modify bb_ask to return NULL if Control-D is pressed without entering
-a password. The sulogin applet is then modified to only proceed to
-normal startup if bb_ask returns NULL. This covers EOF with no password,
-interrupt by timeout and ^C.
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- libbb/bb_askpass.c   | 4 +++-
- loginutils/sulogin.c | 4 ++--
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/libbb/bb_askpass.c b/libbb/bb_askpass.c
-index fe2b506..77c1bcd 100644
---- a/libbb/bb_askpass.c
-+++ b/libbb/bb_askpass.c
-@@ -65,7 +65,9 @@ char* FAST_FUNC bb_ask(const int fd, int timeout, const char *prompt)
- 	i = 0;
- 	while (1) {
- 		int r = read(fd, &ret[i], 1);
--		if (r < 0) {
-+		if ((i == 0 && r == 0) /* EOF (^D) with no password */
-+		 || r < 0
-+		) {
- 			/* read is interrupted by timeout or ^C */
- 			ret = NULL;
- 			break;
-diff --git a/loginutils/sulogin.c b/loginutils/sulogin.c
-index f79802a..65e6384 100644
---- a/loginutils/sulogin.c
-+++ b/loginutils/sulogin.c
-@@ -83,8 +83,8 @@ int sulogin_main(int argc UNUSED_PARAM, char **argv)
- 		cp = bb_ask(STDIN_FILENO, timeout,
- 				"Give root password for system maintenance\n"
- 				"(or type Control-D for normal startup):");
--
--		if (!cp || !*cp) {
-+		if (!cp) {
-+			/* ^D, ^C, timeout, or read error */
- 			bb_info_msg("Normal startup");
- 			return 0;
- 		}
--- 
-1.8.2.3
-
diff --git a/meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch b/meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
deleted file mode 100644
index d66ef79..0000000
--- a/meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-Upstream-Status: Accepted
-
-commit 6db5f679a21342249e6a6eb06ec70a337bf0d0b0
-Author: Denys Vlasenko <vda.linux@googlemail.com>
-Date:   Thu May 16 18:36:42 2013 +0200
-
-find:: get rid of nested function (it's a gcc-ism)
-
-function                                             old     new   delta
-alloc_action                                           -      80     +80
-parse_params                                        1459    1445     -14
-static.alloc_action                                   98       -     -98
-
-(add/remove: 1/1 grow/shrink: 0/1 up/down: 80/-112)           Total: -32 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-diff --git a/findutils/find.c b/findutils/find.c
-index d4b7c8e..af913cc 100644
---- a/findutils/find.c
-+++ b/findutils/find.c
-@@ -815,6 +815,31 @@ static const char* plus_minus_num(const char* str)
- }
- #endif
- 
-+/* Say no to GCCism */
-+#define USE_NESTED_FUNCTION 0
-+
-+#if !USE_NESTED_FUNCTION
-+struct pp_locals {
-+	action*** appp;
-+	unsigned cur_group;
-+	unsigned cur_action;
-+	IF_FEATURE_FIND_NOT( bool invert_flag; )
-+};
-+static action* alloc_action(struct pp_locals *ppl, int sizeof_struct, action_fp f)
-+{
-+	action *ap = xzalloc(sizeof_struct);
-+	action **app;
-+	action ***group = &ppl->appp[ppl->cur_group];
-+	*group = app = xrealloc(*group, (ppl->cur_action+2) * sizeof(ppl->appp[0][0]));
-+	app[ppl->cur_action++] = ap;
-+	app[ppl->cur_action] = NULL;
-+	ap->f = f;
-+	IF_FEATURE_FIND_NOT( ap->invert = ppl->invert_flag; )
-+	IF_FEATURE_FIND_NOT( ppl->invert_flag = 0; )
-+	return ap;
-+}
-+#endif
-+
- static action*** parse_params(char **argv)
- {
- 	enum {
-@@ -901,10 +926,18 @@ static action*** parse_params(char **argv)
- 	IF_FEATURE_FIND_MAXDEPTH("-mindepth\0""-maxdepth\0")
- 	;
- 
-+#if !USE_NESTED_FUNCTION
-+	struct pp_locals ppl;
-+#define appp        (ppl.appp       )
-+#define cur_group   (ppl.cur_group  )
-+#define cur_action  (ppl.cur_action )
-+#define invert_flag (ppl.invert_flag)
-+#define ALLOC_ACTION(name) (action_##name*)alloc_action(&ppl, sizeof(action_##name), (action_fp) func_##name)
-+#else
- 	action*** appp;
--	unsigned cur_group = 0;
--	unsigned cur_action = 0;
--	IF_FEATURE_FIND_NOT( bool invert_flag = 0; )
-+	unsigned cur_group;
-+	unsigned cur_action;
-+	IF_FEATURE_FIND_NOT( bool invert_flag; )
- 
- 	/* This is the only place in busybox where we use nested function.
- 	 * So far more standard alternatives were bigger. */
-@@ -913,7 +946,7 @@ static action*** parse_params(char **argv)
- 	action* alloc_action(int sizeof_struct, action_fp f)
- 	{
- 		action *ap;
--		appp[cur_group] = xrealloc(appp[cur_group], (cur_action+2) * sizeof(*appp));
-+		appp[cur_group] = xrealloc(appp[cur_group], (cur_action+2) * sizeof(appp[0][0]));
- 		appp[cur_group][cur_action++] = ap = xzalloc(sizeof_struct);
- 		appp[cur_group][cur_action] = NULL;
- 		ap->f = f;
-@@ -921,9 +954,12 @@ static action*** parse_params(char **argv)
- 		IF_FEATURE_FIND_NOT( invert_flag = 0; )
- 		return ap;
- 	}
--
- #define ALLOC_ACTION(name) (action_##name*)alloc_action(sizeof(action_##name), (action_fp) func_##name)
-+#endif
- 
-+	cur_group = 0;
-+	cur_action = 0;
-+	IF_FEATURE_FIND_NOT( invert_flag = 0; )
- 	appp = xzalloc(2 * sizeof(appp[0])); /* appp[0],[1] == NULL */
- 
- 	while (*argv) {
-@@ -988,7 +1024,7 @@ static action*** parse_params(char **argv)
- 			dbg("%d", __LINE__);
- 			/* start new OR group */
- 			cur_group++;
--			appp = xrealloc(appp, (cur_group+2) * sizeof(*appp));
-+			appp = xrealloc(appp, (cur_group+2) * sizeof(appp[0]));
- 			/*appp[cur_group] = NULL; - already NULL */
- 			appp[cur_group+1] = NULL;
- 			cur_action = 0;
-@@ -1246,6 +1282,9 @@ static action*** parse_params(char **argv)
- 	dbg("exiting %s", __func__);
- 	return appp;
- #undef ALLOC_ACTION
-+#undef appp
-+#undef cur_action
-+#undef invert_flag
- }
- 
- int find_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
diff --git a/meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
deleted file mode 100644
index 45f69a9..0000000
--- a/meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-# copy commit message from OE as the patch comment:
-#    commit f1b326c83be0d95571b991d8d2ee239982380b6b
-#    Author: Martin Jansa <Martin.Jansa@gmail.com>
-#    Date:   Fri Apr 30 15:37:38 2010 +0200
-#
-#    busybox: add patch for installing run-parts to /usr/bin/ instead of /bin
-#    
-#    * otherwise debianutils install will fail with
-#      update-alternatives: Error: cannot register alternative run-parts to /usr/bin/run-parts since it is 
-#    
-#    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-#
-# Poky doesn't have debianutils, but let's keep it for safety
-# above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
-diff -uNr busybox-1.15.3.orig//include/applets.src.h busybox-1.15.3/include/applets.src.h
---- busybox-1.15.3.orig//include/applets.src.h	2009-12-12 22:13:28.000000000 +0100
-+++ busybox-1.15.3/include/applets.src.h	2010-04-30 15:35:40.000000000 +0200
-@@ -304,7 +304,7 @@
- IF_RPM(APPLET(rpm, BB_DIR_BIN, BB_SUID_DROP))
- IF_RPM2CPIO(APPLET(rpm2cpio, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_SBIN, BB_SUID_DROP))
--IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_BIN, BB_SUID_DROP, run_parts))
-+IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_USR_BIN, BB_SUID_DROP, run_parts))
- IF_RUNCON(APPLET(runcon, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_RUNLEVEL(APPLET(runlevel, BB_DIR_SBIN, BB_SUID_DROP))
- IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, _BB_SUID_DROP))
diff --git a/meta/recipes-core/busybox/busybox/stat-usr-bin.patch b/meta/recipes-core/busybox/busybox/stat-usr-bin.patch
deleted file mode 100644
index 4049324..0000000
--- a/meta/recipes-core/busybox/busybox/stat-usr-bin.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-busybox: move /bin/stat to /usr/bin/stat to match coreutils
-
-The coreutils stat binary lives in /usr/bin, fix busybox to use the same path so
-they can be properly tracked by alternatives.
-
-Upstream-Status: Inappropriate [embedded]
-Signed-off-by: Andy Ross <andy.ross@windriver.com>
-
-diff --git a/include/applets.src.h b/include/applets.src.h
-index 0d33bfc..30ae3ad 100644
---- a/include/applets.src.h
-+++ b/include/applets.src.h
-@@ -340,7 +340,7 @@ IF_SOFTLIMIT(APPLET_ODDNAME(softlimit, chpst, BB_DIR_USR_BIN, BB_SUID_DROP, soft
- IF_SORT(APPLET_NOEXEC(sort, sort, BB_DIR_USR_BIN, BB_SUID_DROP, sort))
- IF_SPLIT(APPLET(split, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_START_STOP_DAEMON(APPLET_ODDNAME(start-stop-daemon, start_stop_daemon, BB_DIR_SBIN, BB_SUID_DROP, start_stop_daemon))
--IF_STAT(APPLET(stat, BB_DIR_BIN, BB_SUID_DROP))
-+IF_STAT(APPLET(stat, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_STRINGS(APPLET(strings, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_STTY(APPLET(stty, BB_DIR_BIN, BB_SUID_DROP))
- /* Needs to be run by root or be suid root - needs to change uid and gid: */
diff --git a/meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch b/meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch
deleted file mode 100644
index 070c41b..0000000
--- a/meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Accepted
-
-[Yocto 2896]
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
----
-From 03b614739b923994ff0bef74622973ad18fefebd Mon Sep 17 00:00:00 2001
-From: Kang Kai <kai.kang@windriver.com>
-Date: Mon, 28 Jan 2013 14:02:51 +0100
-Subject: [PATCH] testsuite/du/du-k-works: fix false positive
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- testsuite/du/du-k-works |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/testsuite/du/du-k-works b/testsuite/du/du-k-works
-index 36dcaa8..417b0da 100644
---- a/testsuite/du/du-k-works
-+++ b/testsuite/du/du-k-works
-@@ -2,6 +2,10 @@ mkdir du.testdir
- cd du.testdir
- dd if=/dev/zero of=file1 bs=1k count=64 2>/dev/null
- dd if=/dev/zero of=file2 bs=1k count=16 2>/dev/null
-+# ext4 on images <512M gives 81kb
-+# ext3 on images <512M gives 83kb
- test x"`busybox du -k .`" = x"80	." \
-+  -o x"`busybox du -k .`" = x"81	." \
-+  -o x"`busybox du -k .`" = x"83	." \
-   -o x"`busybox du -k .`" = x"84	." \
-   -o x"`busybox du -k .`" = x"88	."
--- 
-1.7.5.4
-
diff --git a/meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch
deleted file mode 100644
index e8e1edf..0000000
--- a/meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-From f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Sat, 24 Mar 2012 17:36:48 +0100
-Subject: [PATCH] watch: move from /bin to /usr/bin for compatibility with
- procps
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
----
- include/applets.src.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/applets.src.h b/include/applets.src.h
-index 87d9cbb..c148a8c 100644
---- a/include/applets.src.h
-+++ b/include/applets.src.h
-@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
- IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
- /* Needs to be run by root or be suid root - needs to write to /dev/TTY: */
- IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
--IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
-+IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
- IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
--- 
-1.7.5.4
-
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
similarity index 66%
rename from meta/recipes-core/busybox/busybox_1.21.1.bb
rename to meta/recipes-core/busybox/busybox_1.22.1.bb
index cf59f58..ffc9435 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -3,8 +3,6 @@ require busybox.inc
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
-           file://run-parts.in.usr-bin.patch \
-           file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
@@ -22,24 +20,17 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev.conf \
            file://umount.busybox \
            file://defconfig \
-           file://stat-usr-bin.patch \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
-           file://testsuite-du-du-k-works-fix-false-positive.patch \
            file://fail_on_no_media.patch \
-           file://busybox-sulogin-empty-root-password.patch \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
-           file://busybox-list-suid-and-non-suid-app-configs.patch \
-           file://busybox-sed-fix-sed-clusternewline-testcase.patch \
-           file://find-get-rid-of-nested-functions.patch \
-           file://busybox-lineedit-initialize-delptr.patch \
 "
 
-SRC_URI[tarball.md5sum] = "795394f83903b5eec6567d51eebb417e"
-SRC_URI[tarball.sha256sum] = "cd5be0912ec856110ae12c76c3ec9cd5cba1df45b5a9da2b095b8284d1481303"
+SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
+SRC_URI[tarball.sha256sum] = "ae0b029d0a9e4dd71a077a790840e496dd838998e4571b87b60fed7462b6678b"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 91ecff8..f2cc119 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,16 +1,14 @@
 require busybox.inc
 
-SRCREV = "e73f3c1d3d83699b723251f7e6a981021ce75475"
+SRCREV = "d9e0c438e10e2155513e5d26498af472c5137d65"
 # Lookout for PV bump too when SRCREV is changed
-PV = "1.21.1+git${SRCPV}"
+PV = "1.22.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://busybox.net/busybox.git \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
-           file://run-parts.in.usr-bin.patch \
-           file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
@@ -28,18 +26,13 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://mdev.conf \
            file://umount.busybox \
            file://defconfig \
-           file://stat-usr-bin.patch \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
-           file://testsuite-du-du-k-works-fix-false-positive.patch \
            file://fail_on_no_media.patch \
-           file://busybox-sulogin-empty-root-password.patch \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
-           file://busybox-list-suid-and-non-suid-app-configs.patch \
-           file://busybox-sed-fix-sed-clusternewline-testcase.patch \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.7.9.5


