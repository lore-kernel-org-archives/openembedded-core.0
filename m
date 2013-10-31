Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 465356D330
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:16:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V8GWqf022348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:16:32 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 31 Oct 2013 01:16:31 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 16:16:28 +0800
Message-ID: <e944b96eb586cec34fc00ff4e7f2b0eccc288947.1383207241.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1383207241.git.jackie.huang@windriver.com>
References: <cover.1383207241.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: fix sed auto insert newline testcase
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
X-List-Received-Date: Thu, 31 Oct 2013 08:16:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

backport the patch from busybox upstream to fix the
auto insert newline issue.

busybox defect:
https://bugs.busybox.net/show_bug.cgi?id=6584

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...sybox-sed-fix-sed-clusternewline-testcase.patch |  262 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |    4 +-
 2 files changed, 265 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch b/meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch
new file mode 100644
index 0000000..1894037
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch
@@ -0,0 +1,262 @@
+From 6394bcf17925715db042cfb24f5886b1bed1dfc9 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 31 Oct 2013 14:36:31 +0800
+Subject: [PATCH] sed: fix "sed clusternewline" and "autoinsert newline" testcase
+
+Upstream-Status: Backport [busybox.net]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ editors/sed.c       | 135 ++++++++++++++++++++++++++--------------------------
+ testsuite/sed.tests |   4 --
+ 2 files changed, 68 insertions(+), 71 deletions(-)
+
+diff --git a/editors/sed.c b/editors/sed.c
+index f8ca5d3..98478b4 100644
+--- a/editors/sed.c
++++ b/editors/sed.c
+@@ -845,37 +845,79 @@ static void append(char *s)
+ 	llist_add_to_end(&G.append_head, xstrdup(s));
+ }
+
+-static void flush_append(void)
++/* Output line of text. */
++/* Note:
++ * The tricks with NO_EOL_CHAR and last_puts_char are there to emulate gnu sed.
++ * Without them, we had this:
++ * echo -n thingy >z1
++ * echo -n again >z2
++ * >znull
++ * sed "s/i/z/" z1 z2 znull | hexdump -vC
++ * output:
++ * gnu sed 4.1.5:
++ * 00000000  74 68 7a 6e 67 79 0a 61  67 61 7a 6e              |thzngy.agazn|
++ * bbox:
++ * 00000000  74 68 7a 6e 67 79 61 67  61 7a 6e                 |thzngyagazn|
++ */
++enum {
++	NO_EOL_CHAR = 1,
++	LAST_IS_NUL = 2,
++};
++static void puts_maybe_newline(char *s, FILE *file, char *last_puts_char, char last_gets_char)
++{
++	char lpc = *last_puts_char;
++
++	/* Need to insert a '\n' between two files because first file's
++	 * last line wasn't terminated? */
++	if (lpc != '\n' && lpc != '\0') {
++		fputc('\n', file);
++		lpc = '\n';
++	}
++	fputs(s, file);
++
++	/* 'x' - just something which is not '\n', '\0' or NO_EOL_CHAR */
++	if (s[0])
++		lpc = 'x';
++
++	/* had trailing '\0' and it was last char of file? */
++	if (last_gets_char == LAST_IS_NUL) {
++		fputc('\0', file);
++		lpc = 'x'; /* */
++	} else
++	/* had trailing '\n' or '\0'? */
++	if (last_gets_char != NO_EOL_CHAR) {
++		fputc(last_gets_char, file);
++		lpc = last_gets_char;
++	}
++
++	if (ferror(file)) {
++		xfunc_error_retval = 4;  /* It's what gnu sed exits with... */
++		bb_error_msg_and_die(bb_msg_write_error);
++	}
++	*last_puts_char = lpc;
++}
++
++static void flush_append(char *last_puts_char, char last_gets_char)
+ {
+ 	char *data;
+
+ 	/* Output appended lines. */
+ 	while ((data = (char *)llist_pop(&G.append_head))) {
+-		fprintf(G.nonstdout, "%s\n", data);
++		puts_maybe_newline(data, G.nonstdout, last_puts_char, last_gets_char);
+ 		free(data);
+ 	}
+ }
+
+-static void add_input_file(FILE *file)
+-{
+-	G.input_file_list = xrealloc_vector(G.input_file_list, 2, G.input_file_count);
+-	G.input_file_list[G.input_file_count++] = file;
+-}
+-
+ /* Get next line of input from G.input_file_list, flushing append buffer and
+  * noting if we ran out of files without a newline on the last line we read.
+  */
+-enum {
+-	NO_EOL_CHAR = 1,
+-	LAST_IS_NUL = 2,
+-};
+-static char *get_next_line(char *gets_char)
++static char *get_next_line(char *gets_char, char *last_puts_char, char last_gets_char)
+ {
+ 	char *temp = NULL;
+ 	int len;
+ 	char gc;
+
+-	flush_append();
++	flush_append(last_puts_char, last_gets_char);
+
+ 	/* will be returned if last line in the file
+ 	 * doesn't end with either '\n' or '\0' */
+@@ -919,54 +961,6 @@ static char *get_next_line(char *gets_char)
+ 	return temp;
+ }
+
+-/* Output line of text. */
+-/* Note:
+- * The tricks with NO_EOL_CHAR and last_puts_char are there to emulate gnu sed.
+- * Without them, we had this:
+- * echo -n thingy >z1
+- * echo -n again >z2
+- * >znull
+- * sed "s/i/z/" z1 z2 znull | hexdump -vC
+- * output:
+- * gnu sed 4.1.5:
+- * 00000000  74 68 7a 6e 67 79 0a 61  67 61 7a 6e              |thzngy.agazn|
+- * bbox:
+- * 00000000  74 68 7a 6e 67 79 61 67  61 7a 6e                 |thzngyagazn|
+- */
+-static void puts_maybe_newline(char *s, FILE *file, char *last_puts_char, char last_gets_char)
+-{
+-	char lpc = *last_puts_char;
+-
+-	/* Need to insert a '\n' between two files because first file's
+-	 * last line wasn't terminated? */
+-	if (lpc != '\n' && lpc != '\0') {
+-		fputc('\n', file);
+-		lpc = '\n';
+-	}
+-	fputs(s, file);
+-
+-	/* 'x' - just something which is not '\n', '\0' or NO_EOL_CHAR */
+-	if (s[0])
+-		lpc = 'x';
+-
+-	/* had trailing '\0' and it was last char of file? */
+-	if (last_gets_char == LAST_IS_NUL) {
+-		fputc('\0', file);
+-		lpc = 'x'; /* */
+-	} else
+-	/* had trailing '\n' or '\0'? */
+-	if (last_gets_char != NO_EOL_CHAR) {
+-		fputc(last_gets_char, file);
+-		lpc = last_gets_char;
+-	}
+-
+-	if (ferror(file)) {
+-		xfunc_error_retval = 4;  /* It's what gnu sed exits with... */
+-		bb_error_msg_and_die(bb_msg_write_error);
+-	}
+-	*last_puts_char = lpc;
+-}
+-
+ #define sed_puts(s, n) (puts_maybe_newline(s, G.nonstdout, &last_puts_char, n))
+
+ static int beg_match(sed_cmd_t *sed_cmd, const char *pattern_space)
+@@ -989,7 +983,7 @@ static void process_files(void)
+ 	int substituted;
+
+ 	/* Prime the pump */
+-	next_line = get_next_line(&next_gets_char);
++	next_line = get_next_line(&next_gets_char, &last_puts_char, '\n' /*last_gets_char*/);
+
+ 	/* Go through every line in each file */
+  again:
+@@ -1003,7 +997,7 @@ static void process_files(void)
+
+ 	/* Read one line in advance so we can act on the last line,
+ 	 * the '$' address */
+-	next_line = get_next_line(&next_gets_char);
++	next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
+ 	linenum++;
+
+ 	/* For every line, go through all the commands */
+@@ -1176,6 +1170,7 @@ static void process_files(void)
+ 		/* Append line to linked list to be printed later */
+ 		case 'a':
+ 			append(sed_cmd->string);
++			last_gets_char = '\n';
+ 			break;
+
+ 		/* Insert text before this line */
+@@ -1222,7 +1217,7 @@ static void process_files(void)
+ 				free(pattern_space);
+ 				pattern_space = next_line;
+ 				last_gets_char = next_gets_char;
+-				next_line = get_next_line(&next_gets_char);
++				next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
+ 				substituted = 0;
+ 				linenum++;
+ 				break;
+@@ -1258,7 +1253,7 @@ static void process_files(void)
+ 			pattern_space[len] = '\n';
+ 			strcpy(pattern_space + len+1, next_line);
+ 			last_gets_char = next_gets_char;
+-			next_line = get_next_line(&next_gets_char);
++			next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
+ 			linenum++;
+ 			break;
+ 		}
+@@ -1362,7 +1357,7 @@ static void process_files(void)
+
+ 	/* Delete and such jump here. */
+  discard_line:
+-	flush_append();
++	flush_append(&last_puts_char, last_gets_char);
+ 	free(pattern_space);
+
+ 	goto again;
+@@ -1403,6 +1398,12 @@ static void add_cmd_block(char *cmdstr)
+ 	free(sv);
+ }
+
++static void add_input_file(FILE *file)
++{
++	G.input_file_list = xrealloc_vector(G.input_file_list, 2, G.input_file_count);
++	G.input_file_list[G.input_file_count++] = file;
++}
++
+ int sed_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int sed_main(int argc UNUSED_PARAM, char **argv)
+ {
+diff --git a/testsuite/sed.tests b/testsuite/sed.tests
+index 468565f..e26483c 100755
+--- a/testsuite/sed.tests
++++ b/testsuite/sed.tests
+@@ -135,10 +135,8 @@ testing "sed empty file plus cat" "sed -e 's/nohit//' input -" "one\ntwo" \
+ 	"" "one\ntwo"
+ testing "sed cat plus empty file" "sed -e 's/nohit//' input -" "one\ntwo" \
+ 	"one\ntwo" ""
+-test x"$SKIP_KNOWN_BUGS" = x"" && {
+ testing "sed append autoinserts newline" "sed -e '/woot/a woo' -" \
+ 	"woot\nwoo\n" "" "woot"
+-}
+ testing "sed insert doesn't autoinsert newline" "sed -e '/woot/i woo' -" \
+ 	"woo\nwoot" "" "woot"
+ testing "sed print autoinsert newlines" "sed -e 'p' -" "one\none" "" "one"
+@@ -154,11 +152,9 @@ testing "sed selective matches insert newline" \
+ testing "sed selective matches noinsert newline" \
+ 	"sed -ne 's/woo/bang/p' input -" "a bang\nb bang" "a woo\nb woo" \
+ 	"c no\nd no"
+-test x"$SKIP_KNOWN_BUGS" = x"" && {
+ testing "sed clusternewline" \
+ 	"sed -e '/one/a 111' -e '/two/i 222' -e p input -" \
+ 	"one\none\n111\n222\ntwo\ntwo" "one" "two"
+-}
+ testing "sed subst+write" \
+ 	"sed -e 's/i/z/' -e 'woutputw' input -; $ECHO -n X; cat outputw" \
+ 	"thzngy\nagaznXthzngy\nagazn" "thingy" "again"
+--
+1.8.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index 85d3208..8b91e63 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -32,7 +32,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
-           file://busybox-list-suid-and-non-suid-app-configs.patch"
+           file://busybox-list-suid-and-non-suid-app-configs.patch \
+           file://busybox-sed-fix-sed-clusternewline-testcase.patch \
+"
 
 SRC_URI[tarball.md5sum] = "795394f83903b5eec6567d51eebb417e"
 SRC_URI[tarball.sha256sum] = "cd5be0912ec856110ae12c76c3ec9cd5cba1df45b5a9da2b095b8284d1481303"
-- 
1.7.4.1


