Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0E2A6B5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20Sae021074
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:28 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:29 +0800
Message-ID: <4e72f16aff4f57ad0d71404c21727d78610b27d0.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] make: upgrade to 4.0
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:27 -0000
Content-Type: text/plain

Upgrade to 4.0, remove the following patches since they have been fixed
by the upgrade:
 - expand_MAKEFLAGS.patch
 - intermediate-target-bugfix.patch
 - make-savannah-bug30612-fix_white_space.patch
 - make-savannah-bug30612-handling_of_archives.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../make/make-3.82/expand_MAKEFLAGS.patch          |  39 -----
 .../make-3.82/intermediate-target-bugfix.patch     |  23 ---
 .../make-savannah-bug30612-fix_white_space.patch   |  58 -------
 ...ke-savannah-bug30612-handling_of_archives.patch | 188 ---------------------
 .../make/{make_3.82.bb => make_4.0.bb}             |  10 +-
 5 files changed, 2 insertions(+), 316 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
 rename meta/recipes-devtools/make/{make_3.82.bb => make_4.0.bb} (44%)

diff --git a/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
deleted file mode 100644
index 941365f..0000000
--- a/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Backport [The fix is already in upstream cvs repo, but not in the stable release]
-
-When working on the self-hosted-image work, I found in the target
-"bitbake eglibc-initial -c install" always failed:
-
-make[1]: Entering directory `/raid/pe2/build/tmp/work/i586-poky-linux/eglibc-initial-2.13-r18+svnr14157/eglibc-2_13/libc'
-/usr/bin/install -c -m 644 include/limits.h /usr/include/limits.h
-/usr/bin/install: cannot remove `/usr/include/limits.h': Permission denied
-make[1]: *** [/usr/include/limits.h] Error 1
-make[1]: Leaving directory `/raid/pe2/build/tmp/work/i586-poky-linux/eglibc-initial-2.13-r18+svnr14157/eglibc-2_13/libc'
-make: *** [install-headers] Error 2
-ERROR: oe_runmake faile
-
-Debugging shows the install_root variable in eglibc's makefiles is strangely
-reset at some place.
-
-Further investigation shows this is a bug of make-3.82:
-
-http://savannah.gnu.org/bugs/?30723
-http://cvs.savannah.gnu.org/viewvc/make/main.c?root=make&r1=1.243&r2=1.244
-http://old.nabble.com/-bug--30723--implicit-re-executing-of-subdirs-breaks-$(origin)-with-make-3.82-td29394353.html
-
-The patch was got from the second link above(the upstream cvs repo of make).
-
-Thu Dec  1 16:05:59 CST 2011
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-
-diff -Nru make-3.82.orig//main.c make-3.82/main.c
---- make-3.82.orig//main.c	2010-07-19 15:10:53.000000000 +0800
-+++ make-3.82/main.c	2011-12-01 16:04:11.818522186 +0800
-@@ -2093,7 +2093,7 @@
-             const char *pv = define_makeflags (1, 1);
-             char *p = alloca (sizeof ("MAKEFLAGS=") + strlen (pv) + 1);
-             sprintf (p, "MAKEFLAGS=%s", pv);
--            putenv (p);
-+            putenv (allocated_variable_expand (p));
-           }
- 
- 	  if (ISDB (DB_BASIC))
diff --git a/meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch b/meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
deleted file mode 100644
index b416e64..0000000
--- a/meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Backport [The fix is already in upstream git repo, but not in the stable release]
-
-From fbe5b2c9cd612b962836b9391fa2b58c8baed6fc Mon Sep 17 00:00:00 2001
-From: Paul Smith <psmith@gnu.org>
-Date: Mon, 10 Sep 2012 02:36:05 +0000
-Subject: Force intermediate targets to be considered if their non-intermediate
-
-parent needs to be remade.  Fixes Savannah bug #30653.
----
-diff --git a/remake.c b/remake.c
-index c0bf709..b1ddd23 100644
---- a/remake.c
-+++ b/remake.c
-@@ -612,6 +612,10 @@ update_file_1 (struct file *file, unsigned int depth)
-                 d->file->dontcare = file->dontcare;
-               }
- 
-+            /* We may have already considered this file, when we didn't know
-+               we'd need to update it.  Force update_file() to consider it and
-+               not prune it.  */
-+            d->file->considered = !considered;
- 
- 	    dep_status |= update_file (d->file, depth);
diff --git a/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch b/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
deleted file mode 100644
index 0ef501f..0000000
--- a/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Fix another error related to whitespace handling in archives.
-
-2011-06-12  Paul Smith  <psmith@gnu.org>
-
-* read.c (parse_file_seq): Move the check for empty members out of
-the loop so we can go to the next member properly.
-Another fix for Savannah bug #30612.
-
-Upstream-Status: Backport
-
----
- read.c                          | 10 +++++-----
- tests/scripts/features/archives |  5 +++++
- 5 files changed, 30 insertions(+), 5 deletions(-)
-
-diff --git a/read.c b/read.c
-index c87d4a7..b012094 100644
---- a/read.c
-+++ b/read.c
-@@ -3044,16 +3044,16 @@ parse_file_seq (char **stringp, unsigned int size, int stopchar,
-                       nlen -= (n + 1) - tp;
-                       tp = n + 1;
- 
--                      /* If we have just "lib(", part of something like
--                         "lib( a b)", go to the next item.  */
--                      if (! nlen)
--                        continue;
--
-                       /* We can stop looking now.  */
-                       break;
-                     }
-                 }
-               while (*e != '\0');
-+
-+              /* If we have just "lib(", part of something like "lib( a b)",
-+                 go to the next item.  */
-+              if (! nlen)
-+                continue;
-             }
-         }
- 
-diff --git a/tests/scripts/features/archives b/tests/scripts/features/archives
-index 00aa1af..3fe46a0 100644
---- a/tests/scripts/features/archives
-+++ b/tests/scripts/features/archives
-@@ -36,6 +36,11 @@ utouch(-50, 'a2.o');
- run_make_test('all: libxx.a(a3.o *.o)', '',
-               "ar rv libxx.a a3.o\na - a3.o\nar rv libxx.a a2.o\nr - a2.o\n");
- 
-+# Check whitespace handling
-+utouch(-40, 'a2.o');
-+run_make_test('all: libxx.a(  a3.o    *.o     )', '',
-+              "ar rv libxx.a a2.o\nr - a2.o\n");
-+
- rmfiles(qw(a1.o a2.o a3.o libxx.a));
- 
- # This tells the test driver that the perl test script executed properly.
-
diff --git a/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch b/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
deleted file mode 100644
index 2502ac7..0000000
--- a/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-Upstream-Status: Backport
-
-2010-08-13  Paul Smith  <psmith@gnu.org>
-
-* NEWS: Accidentally forgot to back out the sorted wildcard
-enhancement in 3.82, so update NEWS.
-Also add NEWS about the error check for explicit and pattern
-targets in the same rule, added to 3.82.
-
-* main.c (main): Add "oneshell" to $(.FEATURES) (forgot to add
-this in 3.82!)
-
-* read.c (parse_file_seq): Fix various errors parsing archives
-with multiple objects in the parenthesis, as well as wildcards.
-Fixes Savannah bug #30612.
-
-
-Index: NEWS
-===================================================================
---- NEWS.orig	2010-07-28 05:39:50.000000000 +0000
-+++ NEWS	2012-11-14 11:07:26.427456125 +0000
-@@ -18,14 +18,6 @@
- * Compiling GNU make now requires a conforming ISO C 1989 compiler and
-   standard runtime library.
- 
--* WARNING: Future backward-incompatibility!
--  Wildcards are not documented as returning sorted values, but up to and
--  including this release the results have been sorted and some makefiles are
--  apparently depending on that.  In the next release of GNU make, for
--  performance reasons, we may remove that sorting.  If your makefiles
--  require sorted results from wildcard expansions, use the $(sort ...)
--  function to request it explicitly.
--
- * WARNING: Backward-incompatibility!
-   The POSIX standard for make was changed in the 2008 version in a
-   fundamentally incompatible way: make is required to invoke the shell as if
-@@ -42,6 +34,21 @@
-   existing targets were provided in $?).
- 
- * WARNING: Backward-incompatibility!
-+  Wildcards were not documented as returning sorted values, but the results
-+  have been sorted up until this release..  If your makefiles require sorted
-+  results from wildcard expansions, use the $(sort ...)  function to request
-+  it explicitly.
-+
-+* WARNING: Backward-incompatibility!
-+  In previous versions of make it was acceptable to list one or more explicit
-+  targets followed by one or more pattern targets in the same rule and it
-+  worked "as expected".  However, this was not documented as acceptable and if
-+  you listed any explicit targets AFTER the pattern targets, the entire rule
-+  would be mis-parsed.  This release removes this ability completely: make
-+  will generate an error message if you mix explicit and pattern targets in
-+  the same rule.
-+
-+* WARNING: Backward-incompatibility!
-   As a result of parser enhancements, three backward-compatibility issues
-   exist: first, a prerequisite containing an "=" cannot be escaped with a
-   backslash any longer.  You must create a variable containing an "=" and
-Index: main.c
-===================================================================
---- main.c.orig	2012-11-14 11:07:25.000000000 +0000
-+++ main.c	2012-11-14 11:07:26.427456125 +0000
-@@ -1138,7 +1138,7 @@
-      a macro and some compilers (MSVC) don't like conditionals in macros.  */
-   {
-     const char *features = "target-specific order-only second-expansion"
--                           " else-if shortest-stem undefine"
-+                           " else-if shortest-stem undefine oneshell"
- #ifndef NO_ARCHIVES
-                            " archives"
- #endif
-Index: read.c
-===================================================================
---- read.c.orig	2010-07-13 01:20:42.000000000 +0000
-+++ read.c	2012-11-14 11:07:26.431456125 +0000
-@@ -3028,7 +3028,7 @@
-             {
-               /* This looks like the first element in an open archive group.
-                  A valid group MUST have ')' as the last character.  */
--              const char *e = p + nlen;
-+              const char *e = p;
-               do
-                 {
-                   e = next_token (e);
-@@ -3084,19 +3084,19 @@
-          Go to the next item in the string.  */
-       if (flags & PARSEFS_NOGLOB)
-         {
--          NEWELT (concat (2, prefix, tp));
-+          NEWELT (concat (2, prefix, tmpbuf));
-           continue;
-         }
- 
-       /* If we get here we know we're doing glob expansion.
-          TP is a string in tmpbuf.  NLEN is no longer used.
-          We may need to do more work: after this NAME will be set.  */
--      name = tp;
-+      name = tmpbuf;
- 
-       /* Expand tilde if applicable.  */
--      if (tp[0] == '~')
-+      if (tmpbuf[0] == '~')
- 	{
--	  tildep = tilde_expand (tp);
-+	  tildep = tilde_expand (tmpbuf);
- 	  if (tildep != 0)
-             name = tildep;
- 	}
-@@ -3152,7 +3152,10 @@
-             else
-               {
-                 /* We got a chain of items.  Attach them.  */
--                (*newp)->next = found;
-+                if (*newp)
-+                  (*newp)->next = found;
-+                else
-+                  *newp = found;
- 
-                 /* Find and set the new end.  Massage names if necessary.  */
-                 while (1)
-Index: tests/run_make_tests.pl
-===================================================================
---- tests/run_make_tests.pl.orig	2010-07-13 01:20:43.000000000 +0000
-+++ tests/run_make_tests.pl	2012-11-14 11:07:26.431456125 +0000
-@@ -29,6 +29,7 @@
- # You should have received a copy of the GNU General Public License along with
- # this program.  If not, see <http://www.gnu.org/licenses/>.
- 
-+%FEATURES = ();
- 
- $valgrind = 0;              # invoke make with valgrind
- $valgrind_args = '';
-@@ -367,6 +368,8 @@
-      $parallel_jobs = 1;
-    }
- 
-+   %FEATURES = map { $_ => 1 } split /\s+/, `sh -c "echo '\\\$(info \\\$(.FEATURES))' | $make_path -f- 2>/dev/null"`;
-+
-    # Set up for valgrind, if requested.
- 
-    if ($valgrind) {
-Index: tests/scripts/features/archives
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ tests/scripts/features/archives	2012-11-14 11:07:26.431456125 +0000
-@@ -0,0 +1,42 @@
-+#                                                              -*-mode: perl-*-
-+
-+$description = "Test GNU make's archive management features.";
-+
-+$details = "\
-+This only works on systems that support it.";
-+
-+# If this instance of make doesn't support archives, skip it
-+exists $FEATURES{archives} or return -1;
-+
-+# Create some .o files to work with
-+utouch(-60, qw(a1.o a2.o a3.o));
-+
-+# Very simple
-+run_make_test('all: libxx.a(a1.o)',
-+              '', "ar rv libxx.a a1.o\nar: creating libxx.a\na - a1.o\n");
-+
-+# Multiple .o's.  Add a new one to the existing library
-+run_make_test('all: libxx.a(a1.o a2.o)',
-+              '', "ar rv libxx.a a2.o\na - a2.o\n");
-+
-+# Touch one of the .o's so it's rebuilt
-+utouch(-40, 'a1.o');
-+run_make_test(undef, '', "ar rv libxx.a a1.o\nr - a1.o\n");
-+
-+# Use wildcards
-+run_make_test('all: libxx.a(*.o)',
-+              '', "#MAKE#: Nothing to be done for `all'.\n");
-+
-+# Touch one of the .o's so it's rebuilt
-+utouch(-30, 'a1.o');
-+run_make_test(undef, '', "ar rv libxx.a a1.o\nr - a1.o\n");
-+
-+# Use both wildcards and simple names
-+utouch(-50, 'a2.o');
-+run_make_test('all: libxx.a(a3.o *.o)', '',
-+              "ar rv libxx.a a3.o\na - a3.o\nar rv libxx.a a2.o\nr - a2.o\n");
-+
-+rmfiles(qw(a1.o a2.o a3.o libxx.a));
-+
-+# This tells the test driver that the perl test script executed properly.
-+1;
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_4.0.bb
similarity index 44%
rename from meta/recipes-devtools/make/make_3.82.bb
rename to meta/recipes-devtools/make/make_4.0.bb
index 6cc467d..bb2a7ed 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_4.0.bb
@@ -1,16 +1,10 @@
-PR = "r3"
 LICENSE = "GPLv3 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require make.inc
 
-SRC_URI += "file://expand_MAKEFLAGS.patch \
-            file://intermediate-target-bugfix.patch \
-            file://make-savannah-bug30612-handling_of_archives.patch;striplevel=0 \
-            file://make-savannah-bug30612-fix_white_space.patch"
-
-SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
-SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"
+SRC_URI[md5sum] = "571d470a7647b455e3af3f92d79f1c18"
+SRC_URI[sha256sum] = "e60686c7afede62cc8c86ad3012cf081ea4887daf9d223ce7115703b2bb2dbdb"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


