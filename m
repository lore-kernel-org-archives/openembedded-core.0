Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd2-00065p-1H
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:40:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721053"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:54 -0700
Message-Id: <6cc5c10cc1cc94c36bdb61802a669512c1d373c1.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/12] guile: upgrade from 2.0.3 to 2.0.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 05:40:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 -----------------
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 -------------
 ...-modules-are-removed-gc-test-as-unresolve.patch |   38 ++++++++++++++++++++
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 -------------
 ...with-owner-not-retained-threads-test-as-u.patch |   33 +++++++++++++++++
 .../guile/files/guile_2.0.5_fix_sed_error.patch    |   24 ++++++++++++
 .../guile/files/opensuse/guile-64bit.patch         |    3 +-
 .../files/opensuse/guile-turn-off-gc-test.patch    |    3 +-
 .../guile/{guile_2.0.3.bb => guile_2.0.5.bb}       |   16 +++++----
 9 files changed, 108 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
 rename meta/recipes-devtools/guile/{guile_2.0.3.bb => guile_2.0.5.bb} (84%)

diff --git a/meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch b/meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
deleted file mode 100644
index e6df9b9..0000000
--- a/meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-From c53b49c63d7ed145fbaa3dde25063c407631f373 Mon Sep 17 00:00:00 2001
-From: Rob Browning <rlb@defaultvalue.org>
-Date: Sat, 23 Apr 2011 14:57:49 -0500
-Subject: Fix the SRFI 60 copy-bit documentation.
-
----
- libguile/srfi-60.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libguile/srfi-60.c b/libguile/srfi-60.c
-index 264f4cb..1ed3c9e 100644
---- a/libguile/srfi-60.c
-+++ b/libguile/srfi-60.c
-@@ -70,7 +70,7 @@ SCM_DEFINE (scm_srfi60_log2_binary_factors, "log2-binary-factors", 1, 0, 0,
- 
- 
- SCM_DEFINE (scm_srfi60_copy_bit, "copy-bit", 3, 0, 0,
--            (SCM index, SCM n, SCM bit),
-+            (SCM index, SCM n, SCM newbit),
- 	    "Return @var{n} with the bit at @var{index} set according to\n"
- 	    "@var{newbit}.  @var{newbit} should be @code{#t} to set the bit\n"
- 	    "to 1, or @code{#f} to set it to 0.  Bits other than at\n"
-@@ -86,7 +86,7 @@ SCM_DEFINE (scm_srfi60_copy_bit, "copy-bit", 3, 0, 0,
-   int bb;
- 
-   ii = scm_to_ulong (index);
--  bb = scm_to_bool (bit);
-+  bb = scm_to_bool (newbit);
- 
-   if (SCM_I_INUMP (n))
-     {
diff --git a/meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch b/meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
deleted file mode 100644
index 7176c76..0000000
--- a/meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-From 6614b8efc5a8d90a26a2b99308b909ac351b65e5 Mon Sep 17 00:00:00 2001
-From: Rob Browning <rlb@defaultvalue.org>
-Date: Sat, 23 Apr 2011 14:57:50 -0500
-Subject: Define _GNU_SOURCE to fix the GNU/kFreeBSD build.
-
-Author: Petr Salinger <Petr.Salinger@seznam.cz>
-Closes: #401168
----
- libguile/fports.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/libguile/fports.c b/libguile/fports.c
-index 1348b8b..3ac3ced 100644
---- a/libguile/fports.c
-+++ b/libguile/fports.c
-@@ -20,6 +20,7 @@
- 
- 
- #define _LARGEFILE64_SOURCE      /* ask for stat64 etc */
-+#define _GNU_SOURCE              /* ask for LONG_LONG_MAX/LONG_LONG_MIN */
- 
- #ifdef HAVE_CONFIG_H
- #  include <config.h>
diff --git a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
new file mode 100644
index 0000000..06c8494
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Inappropriate [debian patch]
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+From e52bfcdbaca5dce498678d8f512381e3e39a4066 Mon Sep 17 00:00:00 2001
+From: Rob Browning <rlb@defaultvalue.org>
+Date: Sun, 18 Mar 2012 11:40:55 -0500
+Subject: Mark "Unused modules are removed" gc test as unresolved.
+
+As per discussion with upstream, mark this test as unresolved since it
+may produce false negatives, depending on the behavior/timing of the
+garbage collector.
+---
+ test-suite/tests/gc.test |   11 ++++++-----
+ 1 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/test-suite/tests/gc.test b/test-suite/tests/gc.test
+index 97eeb19..58e4936 100644
+--- a/test-suite/tests/gc.test
++++ b/test-suite/tests/gc.test
+@@ -80,11 +80,12 @@
+       (gc)   ;; thrice: because the test doesn't succeed with only
+       ;; one gc round. not sure why.
+ 
+-      (= (let lp ((i 0))
+-           (if (guard)
+-               (lp (1+ i))
+-               i))
+-         total)))
++      (or (= (let lp ((i 0))
++               (if (guard)
++                   (lp (1+ i))
++                   i))
++             total)
++          (throw 'unresolved))))
+ 
+   (pass-if "Lexical vars are collectable"
+     (let ((l (compile
diff --git a/meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch b/meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
deleted file mode 100644
index aa64f58..0000000
--- a/meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-From 0c91fa9270e86b20bfb8e62db5ac84617b2567d9 Mon Sep 17 00:00:00 2001
-From: Rob Browning <rlb@defaultvalue.org>
-Date: Thu, 10 Nov 2011 02:23:04 -0600
-Subject: Include gc.h rather than gc/gc_version.h in pthread test.
-
-See comments in recent gc_version.h.  It should never be included
-directly, and doing so was causing build failures.
----
- .../standalone/test-pthread-create-secondary.c     |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/test-suite/standalone/test-pthread-create-secondary.c b/test-suite/standalone/test-pthread-create-secondary.c
-index fe39c2a..d87fb33 100644
---- a/test-suite/standalone/test-pthread-create-secondary.c
-+++ b/test-suite/standalone/test-pthread-create-secondary.c
-@@ -27,7 +27,7 @@
- #include <stdlib.h>
- #include <libguile.h>
- 
--#include <gc/gc_version.h>
-+#include <gc.h>
- 
- 
- /* Up to GC 7.2alpha5, calling `GC_INIT' from a secondary thread would
diff --git a/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch b/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
new file mode 100644
index 0000000..34be3b9
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [debian patch]
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+From 848543091d55dddb54a85612155964506d712852 Mon Sep 17 00:00:00 2001
+From: Rob Browning <rlb@defaultvalue.org>
+Date: Sun, 18 Mar 2012 13:28:24 -0500
+Subject: Mark "mutex with owner not retained" threads test as unresolved.
+
+As per discussion with upstream, mark this test as unresolved since it
+may produce false negatives, depending on the behavior/timing of the
+garbage collector.
+---
+ test-suite/tests/threads.test |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/test-suite/tests/threads.test b/test-suite/tests/threads.test
+index 85a7c38..50899cb 100644
+--- a/test-suite/tests/threads.test
++++ b/test-suite/tests/threads.test
+@@ -414,8 +414,10 @@
+ 
+             (gc) (gc)
+             (let ((m (g)))
+-              (and (mutex? m)
+-                   (eq? (mutex-owner m) (current-thread)))))))
++              (or
++               (and (mutex? m)
++                    (eq? (mutex-owner m) (current-thread)))
++               (throw 'unresolved))))))
+ 
+       ;;
+       ;; mutex lock levels
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch b/meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
new file mode 100644
index 0000000..e5dc226
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Pending
+
+This fixes sed issue when prefix has / in it, like /usr/local
+
+autoreconf error avoided:
+| sed: -e expression #1, char 9: unknown option to `s'
+| configure.ac:39: error: AC_INIT should be called with package and version arguments
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/01
+
+Index: guile-2.0.5/build-aux/git-version-gen
+===================================================================
+--- guile-2.0.5.orig/build-aux/git-version-gen
++++ guile-2.0.5/build-aux/git-version-gen
+@@ -187,7 +187,7 @@ else
+     v=UNKNOWN
+ fi
+ 
+-v=`echo "$v" |sed "s/^$prefix//"`
++v=`echo "$v" |sed "s#^$prefix##"`
+ 
+ # Test whether to append the "-dirty" suffix only if the version
+ # string we're using came from git.  I.e., skip the test if it's "UNKNOWN"
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
index be3191a..d3e312f 100644
--- a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
+++ b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
@@ -1,6 +1,7 @@
-
 Upstream-Status: Inappropriate [opensuse patch]
 
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+
 Index: guile-2.0.3/libguile/hash.c
 ===================================================================
 --- guile-2.0.3.orig/libguile/hash.c	2011-07-06 15:49:59.000000000 -0700
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
index ed56694..e201486 100644
--- a/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
+++ b/meta/recipes-devtools/guile/files/opensuse/guile-turn-off-gc-test.patch
@@ -1,6 +1,7 @@
-
 Upstream-Status: Inappropriate [opensuse patch]
 
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+
 See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10096
 why this test is turned off.
 Index: guile-2.0.3/test-suite/tests/gc.test
diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.5.bb
similarity index 84%
rename from meta/recipes-devtools/guile/guile_2.0.3.bb
rename to meta/recipes-devtools/guile/guile_2.0.5.bb
index 164ab8c..db75863 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.5.bb
@@ -14,17 +14,19 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
 
 SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
-           file://debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch \
-           file://debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch \
-           file://debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch \
+           file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
+           file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
            file://opensuse/guile-64bit.patch \
-           file://opensuse/guile-turn-off-gc-test.patch \
+           file://guile_2.0.5_fix_sed_error.patch \
            "
 
-SRC_URI[md5sum] = "3b8b4e1083037f29d2c4704a6d55f2a8"
-SRC_URI[sha256sum] = "a53b21159befe3e89bbaca71e9e62cf00af0f49fcca297c407944b988d59eb08"
+#           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
+#           file://opensuse/guile-turn-off-gc-test.patch 
 
-PR = "r5"
+SRC_URI[md5sum] = "bcf70d54b44c99cb9acd3f63c5486b4b"
+SRC_URI[sha256sum] = "2a026ea6cdbc51ca71bcd9787839debfa45ac5db1e26dc00b30ca9b128b10956"
+
+PR = "r0"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
-- 
1.7.7.6



