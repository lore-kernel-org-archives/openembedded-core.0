Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYe49-0005Na-Nd for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:35:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEELo30020536
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:21:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19887-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:21:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEELhQA020529
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 14:21:44 GMT
Message-ID: <1352902904.13332.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2012 14:21:44 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] make-3.82: Add patch for archive expression expansion issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 14:35:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

bitbake make-native; MACHINE=qemuarm bitbake icu

would fail with:

*** No rule to make target `uconvmsg/libuconvmsg.a(uconvmsg/uconvmsg_dat.ao', needed by `uconvmsg/libuconvmsg.a'.  Stop

which is caused by a bug in make 3.82 which the attached patch fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch b/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
new file mode 100644
index 0000000..2502ac7
--- /dev/null
+++ b/meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
@@ -0,0 +1,188 @@
+Upstream-Status: Backport
+
+2010-08-13  Paul Smith  <psmith@gnu.org>
+
+* NEWS: Accidentally forgot to back out the sorted wildcard
+enhancement in 3.82, so update NEWS.
+Also add NEWS about the error check for explicit and pattern
+targets in the same rule, added to 3.82.
+
+* main.c (main): Add "oneshell" to $(.FEATURES) (forgot to add
+this in 3.82!)
+
+* read.c (parse_file_seq): Fix various errors parsing archives
+with multiple objects in the parenthesis, as well as wildcards.
+Fixes Savannah bug #30612.
+
+
+Index: NEWS
+===================================================================
+--- NEWS.orig	2010-07-28 05:39:50.000000000 +0000
++++ NEWS	2012-11-14 11:07:26.427456125 +0000
+@@ -18,14 +18,6 @@
+ * Compiling GNU make now requires a conforming ISO C 1989 compiler and
+   standard runtime library.
+ 
+-* WARNING: Future backward-incompatibility!
+-  Wildcards are not documented as returning sorted values, but up to and
+-  including this release the results have been sorted and some makefiles are
+-  apparently depending on that.  In the next release of GNU make, for
+-  performance reasons, we may remove that sorting.  If your makefiles
+-  require sorted results from wildcard expansions, use the $(sort ...)
+-  function to request it explicitly.
+-
+ * WARNING: Backward-incompatibility!
+   The POSIX standard for make was changed in the 2008 version in a
+   fundamentally incompatible way: make is required to invoke the shell as if
+@@ -42,6 +34,21 @@
+   existing targets were provided in $?).
+ 
+ * WARNING: Backward-incompatibility!
++  Wildcards were not documented as returning sorted values, but the results
++  have been sorted up until this release..  If your makefiles require sorted
++  results from wildcard expansions, use the $(sort ...)  function to request
++  it explicitly.
++
++* WARNING: Backward-incompatibility!
++  In previous versions of make it was acceptable to list one or more explicit
++  targets followed by one or more pattern targets in the same rule and it
++  worked "as expected".  However, this was not documented as acceptable and if
++  you listed any explicit targets AFTER the pattern targets, the entire rule
++  would be mis-parsed.  This release removes this ability completely: make
++  will generate an error message if you mix explicit and pattern targets in
++  the same rule.
++
++* WARNING: Backward-incompatibility!
+   As a result of parser enhancements, three backward-compatibility issues
+   exist: first, a prerequisite containing an "=" cannot be escaped with a
+   backslash any longer.  You must create a variable containing an "=" and
+Index: main.c
+===================================================================
+--- main.c.orig	2012-11-14 11:07:25.000000000 +0000
++++ main.c	2012-11-14 11:07:26.427456125 +0000
+@@ -1138,7 +1138,7 @@
+      a macro and some compilers (MSVC) don't like conditionals in macros.  */
+   {
+     const char *features = "target-specific order-only second-expansion"
+-                           " else-if shortest-stem undefine"
++                           " else-if shortest-stem undefine oneshell"
+ #ifndef NO_ARCHIVES
+                            " archives"
+ #endif
+Index: read.c
+===================================================================
+--- read.c.orig	2010-07-13 01:20:42.000000000 +0000
++++ read.c	2012-11-14 11:07:26.431456125 +0000
+@@ -3028,7 +3028,7 @@
+             {
+               /* This looks like the first element in an open archive group.
+                  A valid group MUST have ')' as the last character.  */
+-              const char *e = p + nlen;
++              const char *e = p;
+               do
+                 {
+                   e = next_token (e);
+@@ -3084,19 +3084,19 @@
+          Go to the next item in the string.  */
+       if (flags & PARSEFS_NOGLOB)
+         {
+-          NEWELT (concat (2, prefix, tp));
++          NEWELT (concat (2, prefix, tmpbuf));
+           continue;
+         }
+ 
+       /* If we get here we know we're doing glob expansion.
+          TP is a string in tmpbuf.  NLEN is no longer used.
+          We may need to do more work: after this NAME will be set.  */
+-      name = tp;
++      name = tmpbuf;
+ 
+       /* Expand tilde if applicable.  */
+-      if (tp[0] == '~')
++      if (tmpbuf[0] == '~')
+ 	{
+-	  tildep = tilde_expand (tp);
++	  tildep = tilde_expand (tmpbuf);
+ 	  if (tildep != 0)
+             name = tildep;
+ 	}
+@@ -3152,7 +3152,10 @@
+             else
+               {
+                 /* We got a chain of items.  Attach them.  */
+-                (*newp)->next = found;
++                if (*newp)
++                  (*newp)->next = found;
++                else
++                  *newp = found;
+ 
+                 /* Find and set the new end.  Massage names if necessary.  */
+                 while (1)
+Index: tests/run_make_tests.pl
+===================================================================
+--- tests/run_make_tests.pl.orig	2010-07-13 01:20:43.000000000 +0000
++++ tests/run_make_tests.pl	2012-11-14 11:07:26.431456125 +0000
+@@ -29,6 +29,7 @@
+ # You should have received a copy of the GNU General Public License along with
+ # this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
++%FEATURES = ();
+ 
+ $valgrind = 0;              # invoke make with valgrind
+ $valgrind_args = '';
+@@ -367,6 +368,8 @@
+      $parallel_jobs = 1;
+    }
+ 
++   %FEATURES = map { $_ => 1 } split /\s+/, `sh -c "echo '\\\$(info \\\$(.FEATURES))' | $make_path -f- 2>/dev/null"`;
++
+    # Set up for valgrind, if requested.
+ 
+    if ($valgrind) {
+Index: tests/scripts/features/archives
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ tests/scripts/features/archives	2012-11-14 11:07:26.431456125 +0000
+@@ -0,0 +1,42 @@
++#                                                              -*-mode: perl-*-
++
++$description = "Test GNU make's archive management features.";
++
++$details = "\
++This only works on systems that support it.";
++
++# If this instance of make doesn't support archives, skip it
++exists $FEATURES{archives} or return -1;
++
++# Create some .o files to work with
++utouch(-60, qw(a1.o a2.o a3.o));
++
++# Very simple
++run_make_test('all: libxx.a(a1.o)',
++              '', "ar rv libxx.a a1.o\nar: creating libxx.a\na - a1.o\n");
++
++# Multiple .o's.  Add a new one to the existing library
++run_make_test('all: libxx.a(a1.o a2.o)',
++              '', "ar rv libxx.a a2.o\na - a2.o\n");
++
++# Touch one of the .o's so it's rebuilt
++utouch(-40, 'a1.o');
++run_make_test(undef, '', "ar rv libxx.a a1.o\nr - a1.o\n");
++
++# Use wildcards
++run_make_test('all: libxx.a(*.o)',
++              '', "#MAKE#: Nothing to be done for `all'.\n");
++
++# Touch one of the .o's so it's rebuilt
++utouch(-30, 'a1.o');
++run_make_test(undef, '', "ar rv libxx.a a1.o\nr - a1.o\n");
++
++# Use both wildcards and simple names
++utouch(-50, 'a2.o');
++run_make_test('all: libxx.a(a3.o *.o)', '',
++              "ar rv libxx.a a3.o\na - a3.o\nar rv libxx.a a2.o\nr - a2.o\n");
++
++rmfiles(qw(a1.o a2.o a3.o libxx.a));
++
++# This tells the test driver that the perl test script executed properly.
++1;
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_3.82.bb
index 8167c01..127dec2 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_3.82.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require make.inc
 
-SRC_URI += "file://expand_MAKEFLAGS.patch"
+SRC_URI += "file://expand_MAKEFLAGS.patch \
+            file://make-savannah-bug30612-handling_of_archives.patch;striplevel=0"
 
 SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
 SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"




