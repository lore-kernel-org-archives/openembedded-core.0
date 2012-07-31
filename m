Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SwBnn-0003tp-GF
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 14:43:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jul 2012 05:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="200418294"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2012 05:31:11 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 15:33:25 +0300
Message-Id: <1343738005-6091-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] guile: updated to 2.0.6
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
X-List-Received-Date: Tue, 31 Jul 2012 12:43:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some patches (disable_goops_optimizations, fix_cross_compilation) don't
seem to be needed anymore. Others (change-install-data-hook, mark-unused-modules)
were updated to work on 2.0.6. Tested by building and running guile under
QEMU with core-image-sato-sdk and also builing guile on MIPS.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...all-data-hook-to-install-exec-hook-in-gui.patch |   13 +++---
 ...-modules-are-removed-gc-test-as-unresolve.patch |   29 ++++++------
 .../guile_2.0.5_disable_goops_optimizations.patch  |   32 -------------
 .../files/guile_2.0.5_fix_cross_compilation.patch  |   47 --------------------
 ...error.patch => guile_2.0.6_fix_sed_error.patch} |    0
 .../recipes-devtools/guile/files/remove-gets.patch |   23 ----------
 .../guile/{guile_2.0.5.bb => guile_2.0.6.bb}       |   11 ++---
 7 files changed, 23 insertions(+), 132 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch
 rename meta/recipes-devtools/guile/files/{guile_2.0.5_fix_sed_error.patch => guile_2.0.6_fix_sed_error.patch} (100%)
 delete mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
 rename meta/recipes-devtools/guile/{guile_2.0.5.bb => guile_2.0.6.bb} (90%)

diff --git a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
index 9445fca..b9d1ca5 100644
--- a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
+++ b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
@@ -22,18 +22,15 @@ Signed-off-by: Song.Li <Song.Li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meta/Makefile.am b/meta/Makefile.am
-index f26fc44..e603e5c 100644
+index a05730d..bd20784 100644
 --- a/meta/Makefile.am
 +++ b/meta/Makefile.am
-@@ -27,7 +27,7 @@ EXTRA_DIST= \
+@@ -28,7 +28,7 @@ EXTRA_DIST= \
    guild.in guile-config.in
  
  # What we now call `guild' used to be known as `guile-tools'.
 -install-data-hook:
 +install-exec-hook:
- 	cd $(DESTDIR)$(bindir) && rm -f guile-tools$(EXEEXT) && \
- 	$(LN_S) guild$(EXEEXT) guile-tools$(EXEEXT)
- 
--- 
-1.7.9.5
-
+ 	guild="`echo $(ECHO_N) guild				\
+ 	   | $(SED) -e '$(program_transform_name)'`$(EXEEXT)" ;	\
+ 	guile_tools="`echo $(ECHO_N) guile-tools		\
diff --git a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
index 06c8494..43238a7 100644
--- a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
+++ b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
@@ -15,24 +15,25 @@ garbage collector.
  1 files changed, 6 insertions(+), 5 deletions(-)
 
 diff --git a/test-suite/tests/gc.test b/test-suite/tests/gc.test
-index 97eeb19..58e4936 100644
+index a969752..8c8e13e 100644
 --- a/test-suite/tests/gc.test
 +++ b/test-suite/tests/gc.test
-@@ -80,11 +80,12 @@
-       (gc)   ;; thrice: because the test doesn't succeed with only
+@@ -84,11 +84,13 @@
        ;; one gc round. not sure why.
  
--      (= (let lp ((i 0))
--           (if (guard)
--               (lp (1+ i))
--               i))
--         total)))
-+      (or (= (let lp ((i 0))
-+               (if (guard)
-+                   (lp (1+ i))
-+                   i))
-+             total)
-+          (throw 'unresolved))))
+       (maybe-gc-flakiness
+-       (= (let lp ((i 0))
+-            (if (guard)
+-                (lp (1+ i))
+-                i))
+-          total))))
++       (or (= (let lp ((i 0))
++                (if (guard)
++                    (lp (1+ i))
++                    i))
++              total)
++           (throw 'unresolved)))))
++
  
    (pass-if "Lexical vars are collectable"
      (let ((l (compile
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch b/meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch
deleted file mode 100644
index 8609775..0000000
--- a/meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-commit f7d8efc630ce45f5d82aae5b2682d261e5541d5f
-Author: Andy Wingo <wingo@pobox.com>
-Date:   Sun Apr 15 13:00:30 2012 -0700
-
-    disable optimizations in goops dispatch procedures
-    
-    * module/oop/goops/dispatch.scm: Disable peval and cse.
-
-Upstream-Status: Backported
-
-diff --git a/module/oop/goops/dispatch.scm b/module/oop/goops/dispatch.scm
-index e433b86..b12ab15 100644
---- a/module/oop/goops/dispatch.scm
-+++ b/module/oop/goops/dispatch.scm
-@@ -1,4 +1,4 @@
--;;;; 	Copyright (C) 1999, 2000, 2001, 2003, 2006, 2009 Free Software Foundation, Inc.
-+;;;;   Copyright (C) 1999, 2000, 2001, 2003, 2006, 2009, 2012 Free Software Foundation, Inc.
- ;;;;
- ;;;; This library is free software; you can redistribute it and/or
- ;;;; modify it under the terms of the GNU Lesser General Public
-@@ -178,7 +178,9 @@
-                      '())
-                  (acons gf gf-sym '()))))
-   (define (comp exp vals)
--    (let ((p ((@ (system base compile) compile) exp #:env *dispatch-module*)))
-+    (let ((p ((@ (system base compile) compile) exp
-+              #:env *dispatch-module*
-+              #:opts '(#:partial-eval? #f #:cse? #f))))
-       (apply p vals)))
-   
-   ;; kick it.
-
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch b/meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch
deleted file mode 100644
index b81f02e..0000000
--- a/meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-commit f3b312a19d70293d7a3407fc4ef479183edd7cca
-Author: Ludovic Courtès <ludo@gnu.org>
-Date:   Wed Jun 20 01:11:44 2012 +0200
-
-    Fix cross-compilation of GOOPS-using code.
-    
-    Fixes <http://bugs.gnu.org/11645>.
-    Reported by Bogdan A. Marinescu <bogdan.a.marinescu@intel.com>.
-    
-    * module/oop/goops/dispatch.scm (compute-dispatch-procedure)[comp]:
-      Wrap `compile' call in (with-target %host-type ...).
-
-Upstream-Status: Backported
-
-diff --git a/module/oop/goops/dispatch.scm b/module/oop/goops/dispatch.scm
-index b12ab15..de5359f 100644
---- a/module/oop/goops/dispatch.scm
-+++ b/module/oop/goops/dispatch.scm
-@@ -25,6 +25,7 @@
-   #:use-module (oop goops)
-   #:use-module (oop goops util)
-   #:use-module (oop goops compile)
-+  #:use-module (system base target)
-   #:export (memoize-method!)
-   #:no-backtrace)
- 
-@@ -178,11 +179,15 @@
-                      '())
-                  (acons gf gf-sym '()))))
-   (define (comp exp vals)
--    (let ((p ((@ (system base compile) compile) exp
--              #:env *dispatch-module*
--              #:opts '(#:partial-eval? #f #:cse? #f))))
--      (apply p vals)))
--  
-+    ;; When cross-compiling Guile itself, the native Guile must generate
-+    ;; code for the host.
-+    (with-target %host-type
-+      (lambda ()
-+        (let ((p ((@ (system base compile) compile) exp
-+                  #:env *dispatch-module*
-+                  #:opts '(#:partial-eval? #f #:cse? #f))))
-+          (apply p vals)))))
-+
-   ;; kick it.
-   (scan))
-
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch b/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
similarity index 100%
rename from meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
rename to meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
diff --git a/meta/recipes-devtools/guile/files/remove-gets.patch b/meta/recipes-devtools/guile/files/remove-gets.patch
deleted file mode 100644
index 6d3605f..0000000
--- a/meta/recipes-devtools/guile/files/remove-gets.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: guile-2.0.5/lib/stdio.in.h
-===================================================================
---- guile-2.0.5.orig/lib/stdio.in.h	2012-01-24 03:06:06.000000000 -0800
-+++ guile-2.0.5/lib/stdio.in.h	2012-07-04 12:28:15.617108481 -0700
-@@ -711,11 +711,13 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
diff --git a/meta/recipes-devtools/guile/guile_2.0.5.bb b/meta/recipes-devtools/guile/guile_2.0.6.bb
similarity index 90%
rename from meta/recipes-devtools/guile/guile_2.0.5.bb
rename to meta/recipes-devtools/guile/guile_2.0.6.bb
index 8fae712..a9df4f7 100644
--- a/meta/recipes-devtools/guile/guile_2.0.5.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.6.bb
@@ -17,10 +17,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
            file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
            file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
            file://opensuse/guile-64bit.patch \
-           file://guile_2.0.5_fix_sed_error.patch \
-           file://guile_2.0.5_disable_goops_optimizations.patch \
-           file://guile_2.0.5_fix_cross_compilation.patch \
-           file://remove-gets.patch \
+           file://guile_2.0.6_fix_sed_error.patch \
            file://arm_endianness.patch \
            file://change-install-data-hook-to-install-exec-hook-in-gui.patch \
            "
@@ -28,10 +25,8 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
 #           file://opensuse/guile-turn-off-gc-test.patch 
 
-SRC_URI[md5sum] = "bcf70d54b44c99cb9acd3f63c5486b4b"
-SRC_URI[sha256sum] = "2a026ea6cdbc51ca71bcd9787839debfa45ac5db1e26dc00b30ca9b128b10956"
-
-PR = "r5"
+SRC_URI[md5sum] = "3438cd4415c0c43ca93a20e845eba7e2"
+SRC_URI[sha256sum] = "3ece055145a5020dd36b84f5fbccd4b3846a671960dd5ee55931555f03200950"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



