Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD2B56FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 09:42:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u819gDEZ032305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 02:42:14 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 02:42:13 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 05:42:10 -0400
Message-ID: <cb48e6f5eecf18d47b9ac45c0b6aec412f79d9ec.1472708502.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1472708502.git.dengke.du@windriver.com>
References: <cover.1472708502.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: fix "sed n (flushes pattern space, terminates early)" testcase failure
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
X-List-Received-Date: Thu, 01 Sep 2016 09:42:14 -0000
Content-Type: text/plain

It is a busybox upstream known bug. When the busybox sed sub-command 'n'
hit the files EOF, it print an extra character that have been printed, but
the GNU sed would not print it.

In busybox source code ../editors/sed.c
------------------------------------------------------------------------
    case 'n':
        if (!G.be_quiet)
                sed_puts(pattern_space, last_gets_char);
            if (next_line) {
                    free(pattern_space);
                    pattern_space = next_line;
                    last_gets_char = next_gets_char;
                    next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
                    substituted = 0;
                    linenum++;
                    break;
            }
            /* fall through */

    /* Quit.  End of script, end of input. */
    case 'q':
        /* Exit the outer while loop */
            free(next_line);
            next_line = NULL;
            goto discard_commands;
------------------------------------------------------------------------
when read at the end of the file, the 'next_line' is null, it would go
"case 'q'" and goto discard_commands, the discard_commands would print
the old pattern space which have been printed.

So in order to comply with GNU sed, in case 'n', when the next_line is null
I add "else" at the end of the second "if": "goto again;" and send it to
the busybox upstream, the busybox maintainer adopt it and make a little
changes to the patch, we can see it at:

His reply:

	http://lists.busybox.net/pipermail/busybox/2016-September/084613.html

The new patch on busybox master branch:

	https://git.busybox.net/busybox/commit/?id=76d72376e0244a5cafd4880cdc623e37d86a75e4

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...-n-flushes-pattern-space-terminates-early.patch | 72 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch b/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
new file mode 100644
index 0000000..4f53984
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
@@ -0,0 +1,72 @@
+From 903542f7331c58007a3ef938d41e1c55fc329648 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 31 Aug 2016 23:40:43 -0400
+Subject: [PATCH] sed: fix "sed n (flushes pattern space, terminates early)"
+ testcase failure
+
+This patch fix "sed n (flushes pattern space, terminates early)"
+testcase failure. We can see it at:
+
+	https://git.busybox.net/busybox/commit/?id=76d72376e0244a5cafd4880cdc623e37d86a75e4
+
+Upstream-Status: Backport
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ editors/sed.c       | 19 ++++++++++---------
+ testsuite/sed.tests |  6 +-----
+ 2 files changed, 11 insertions(+), 14 deletions(-)
+
+diff --git a/editors/sed.c b/editors/sed.c
+index 7bbf820..259c39c 100644
+--- a/editors/sed.c
++++ b/editors/sed.c
+@@ -1274,16 +1274,17 @@ static void process_files(void)
+ 		case 'n':
+ 			if (!G.be_quiet)
+ 				sed_puts(pattern_space, last_gets_char);
+-			if (next_line) {
+-				free(pattern_space);
+-				pattern_space = next_line;
+-				last_gets_char = next_gets_char;
+-				next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
+-				substituted = 0;
+-				linenum++;
+-				break;
++			if (next_line == NULL) {
++				/* If no next line, jump to end of script and exit. */
++				goto discard_line;
+ 			}
+-			/* fall through */
++			free(pattern_space);
++			pattern_space = next_line;
++			last_gets_char = next_gets_char;
++			next_line = get_next_line(&next_gets_char, &last_puts_char, last_gets_char);
++			substituted = 0;
++			linenum++;
++			break;
+ 
+ 		/* Quit.  End of script, end of input. */
+ 		case 'q':
+diff --git a/testsuite/sed.tests b/testsuite/sed.tests
+index 34479e5..96ff7a5 100755
+--- a/testsuite/sed.tests
++++ b/testsuite/sed.tests
+@@ -73,13 +73,9 @@ testing "sed t (test/branch clears test bit)" "sed -e 's/a/b/;:loop;t loop'" \
+ testing "sed T (!test/branch)" "sed -e 's/a/1/;T notone;p;: notone;p'" \
+ 	"1\n1\n1\nb\nb\nc\nc\n" "" "a\nb\nc\n"
+ 
+-test x"$SKIP_KNOWN_BUGS" = x"" && {
+-# Normal sed end-of-script doesn't print "c" because n flushed the pattern
+-# space.  If n hits EOF, pattern space is empty when script ends.
+-# Query: how does this interact with no newline at EOF?
+ testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'" \
+ 	"a\nb\nb\nc\n" "" "a\nb\nc\n"
+-}
++
+ # non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @ script end
+ # GNU sed: N flushes pattern space, therefore c is printed too @ script end
+ testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index e8265cd..f370451 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
            file://makefile-fix-backport.patch \
            file://parallel-make-fix.patch \
+           file://0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.8.1


