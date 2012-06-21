Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1ShfsV-00088E-Ev
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:48:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jun 2012 04:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="156582001"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.145])
	by orsmga001.jf.intel.com with ESMTP; 21 Jun 2012 04:37:59 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 14:39:53 +0300
Message-Id: <1340278793-24590-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] guile: fix compilation on MIPS/PPC
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
X-List-Received-Date: Thu, 21 Jun 2012 11:48:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit fixes the guile compilation segfault on MIPS/PPC.
Tested by compiling guile with MACHINE=qemumips.

[Yocto #2478]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../guile_2.0.5_disable_goops_optimizations.patch  |   32 +++++++++++++
 .../files/guile_2.0.5_fix_cross_compilation.patch  |   47 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.5.bb         |    4 +-
 3 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch

diff --git a/meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch b/meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch
new file mode 100644
index 0000000..8609775
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/guile_2.0.5_disable_goops_optimizations.patch
@@ -0,0 +1,32 @@
+commit f7d8efc630ce45f5d82aae5b2682d261e5541d5f
+Author: Andy Wingo <wingo@pobox.com>
+Date:   Sun Apr 15 13:00:30 2012 -0700
+
+    disable optimizations in goops dispatch procedures
+    
+    * module/oop/goops/dispatch.scm: Disable peval and cse.
+
+Upstream-Status: Backported
+
+diff --git a/module/oop/goops/dispatch.scm b/module/oop/goops/dispatch.scm
+index e433b86..b12ab15 100644
+--- a/module/oop/goops/dispatch.scm
++++ b/module/oop/goops/dispatch.scm
+@@ -1,4 +1,4 @@
+-;;;; 	Copyright (C) 1999, 2000, 2001, 2003, 2006, 2009 Free Software Foundation, Inc.
++;;;;   Copyright (C) 1999, 2000, 2001, 2003, 2006, 2009, 2012 Free Software Foundation, Inc.
+ ;;;;
+ ;;;; This library is free software; you can redistribute it and/or
+ ;;;; modify it under the terms of the GNU Lesser General Public
+@@ -178,7 +178,9 @@
+                      '())
+                  (acons gf gf-sym '()))))
+   (define (comp exp vals)
+-    (let ((p ((@ (system base compile) compile) exp #:env *dispatch-module*)))
++    (let ((p ((@ (system base compile) compile) exp
++              #:env *dispatch-module*
++              #:opts '(#:partial-eval? #f #:cse? #f))))
+       (apply p vals)))
+   
+   ;; kick it.
+
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch b/meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch
new file mode 100644
index 0000000..b81f02e
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/guile_2.0.5_fix_cross_compilation.patch
@@ -0,0 +1,47 @@
+commit f3b312a19d70293d7a3407fc4ef479183edd7cca
+Author: Ludovic Courtès <ludo@gnu.org>
+Date:   Wed Jun 20 01:11:44 2012 +0200
+
+    Fix cross-compilation of GOOPS-using code.
+    
+    Fixes <http://bugs.gnu.org/11645>.
+    Reported by Bogdan A. Marinescu <bogdan.a.marinescu@intel.com>.
+    
+    * module/oop/goops/dispatch.scm (compute-dispatch-procedure)[comp]:
+      Wrap `compile' call in (with-target %host-type ...).
+
+Upstream-Status: Backported
+
+diff --git a/module/oop/goops/dispatch.scm b/module/oop/goops/dispatch.scm
+index b12ab15..de5359f 100644
+--- a/module/oop/goops/dispatch.scm
++++ b/module/oop/goops/dispatch.scm
+@@ -25,6 +25,7 @@
+   #:use-module (oop goops)
+   #:use-module (oop goops util)
+   #:use-module (oop goops compile)
++  #:use-module (system base target)
+   #:export (memoize-method!)
+   #:no-backtrace)
+ 
+@@ -178,11 +179,15 @@
+                      '())
+                  (acons gf gf-sym '()))))
+   (define (comp exp vals)
+-    (let ((p ((@ (system base compile) compile) exp
+-              #:env *dispatch-module*
+-              #:opts '(#:partial-eval? #f #:cse? #f))))
+-      (apply p vals)))
+-  
++    ;; When cross-compiling Guile itself, the native Guile must generate
++    ;; code for the host.
++    (with-target %host-type
++      (lambda ()
++        (let ((p ((@ (system base compile) compile) exp
++                  #:env *dispatch-module*
++                  #:opts '(#:partial-eval? #f #:cse? #f))))
++          (apply p vals)))))
++
+   ;; kick it.
+   (scan))
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.5.bb b/meta/recipes-devtools/guile/guile_2.0.5.bb
index db75863..cf222a6 100644
--- a/meta/recipes-devtools/guile/guile_2.0.5.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.5.bb
@@ -18,6 +18,8 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
            file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
            file://opensuse/guile-64bit.patch \
            file://guile_2.0.5_fix_sed_error.patch \
+           file://guile_2.0.5_disable_goops_optimizations.patch \
+           file://guile_2.0.5_fix_cross_compilation.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
@@ -26,7 +28,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "bcf70d54b44c99cb9acd3f63c5486b4b"
 SRC_URI[sha256sum] = "2a026ea6cdbc51ca71bcd9787839debfa45ac5db1e26dc00b30ca9b128b10956"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



