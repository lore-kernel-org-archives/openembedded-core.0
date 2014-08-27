Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9031471149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:57:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7RFvJiF027026
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:57:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 08:57:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 08:57:10 -0700
Message-ID: <2bb8dedf13e6feef6839a04acfead75269b76d5d.1409154816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409154816.git.liezhi.yang@windriver.com>
References: <cover.1409154816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] run-ptest: fix bashism
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
X-List-Received-Date: Wed, 27 Aug 2014 15:57:23 -0000
Content-Type: text/plain

These script use /bin/sh as the interpreter, but contains bashism:
    recipes-devtools/insserv/files/run-ptest
    recipes-devtools/quilt/quilt/run-ptest
    recipes-devtools/tcltk/tcl/run-ptest
    recipes-extended/gawk/gawk-4.1.1/run-ptest
    recipes-support/beecrypt/beecrypt/run-ptest

Fixed:
    "==" -> "=" (should be -eq when integer)
    "&>log" -> ">log 2>&1"

And quilt's test scripts requires bash, add bash to RDEPENDS_quilt-ptest

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/insserv/files/run-ptest    |    2 +-
 meta/recipes-devtools/quilt/quilt-0.63.inc       |    2 +-
 meta/recipes-devtools/quilt/quilt/run-ptest      |    2 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest        |    4 ++--
 meta/recipes-extended/gawk/gawk-4.1.1/run-ptest  |    4 ++--
 meta/recipes-support/beecrypt/beecrypt/run-ptest |    2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/insserv/files/run-ptest b/meta/recipes-devtools/insserv/files/run-ptest
index 495d155..4a6da30 100644
--- a/meta/recipes-devtools/insserv/files/run-ptest
+++ b/meta/recipes-devtools/insserv/files/run-ptest
@@ -11,7 +11,7 @@ output() {
 }
 
 for i in test_simple_sequence test_undetected_loop; \
-  do $i &>/dev/null ; output; \
+  do $i >/dev/null 2>&1; output; \
 done
 
 rm -rf ${tmpdir}
diff --git a/meta/recipes-devtools/quilt/quilt-0.63.inc b/meta/recipes-devtools/quilt/quilt-0.63.inc
index f375785..433d6b4 100644
--- a/meta/recipes-devtools/quilt/quilt-0.63.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.63.inc
@@ -55,5 +55,5 @@ do_install_ptest() {
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
-                        perl-module-text-parsewords \
+                        perl-module-text-parsewords bash \
 "
diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
index 1ea0dae..958a9df 100755
--- a/meta/recipes-devtools/quilt/quilt/run-ptest
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
 
 ln -sf /bin/ed /usr/bin/ed
-for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? == 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
+for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
 rm -f /usr/bin/ed
diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index a5d6548..dadba65 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,8 +1,8 @@
 #!/bin/sh
 
 for i in `ls tests/*.test |awk -F/ '{print $2}'`; \
-    do TCL_LIBRARY=library ./tcltest tests/all.tcl -file $i &>$i.tmp; \
+    do TCL_LIBRARY=library ./tcltest tests/all.tcl -file $i >$i.tmp 2>&1; \
     grep -q "^Files with failing tests:" $i.tmp; \
-    if [ $? == 0 ]; then echo "FAIL: $i"; \
+    if [ $? -eq 0 ]; then echo "FAIL: $i"; \
     else echo "PASS: $i"; rm -f $i.tmp; fi; \
 done
diff --git a/meta/recipes-extended/gawk/gawk-4.1.1/run-ptest b/meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
index 7d214ea..d23f0bf 100644
--- a/meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
+++ b/meta/recipes-extended/gawk/gawk-4.1.1/run-ptest
@@ -3,8 +3,8 @@
 cd test
 for i in `grep -vE "@|^$|#|Gt-dummy" Maketests |awk -F: '{print $1}'`; \
   do LC_ALL=${GAWKLOCALE:-C} LANG=${GAWKLOCALE:-C} srcdir=`pwd` AWK=gawk CMP=cmp \
-  make -f Maketests $i &>$i.tmp; \
+  make -f Maketests $i >$i.tmp 2>&1; \
   grep -q "Error" $i.tmp; \
-  if [ $? == 0 ]; then echo "FAIL: $i"; \
+  if [ $? -eq 0 ]; then echo "FAIL: $i"; \
   else echo "PASS: $i"; rm -f $i.tmp; fi; \
 done
diff --git a/meta/recipes-support/beecrypt/beecrypt/run-ptest b/meta/recipes-support/beecrypt/beecrypt/run-ptest
index 5bc7460..2ee294d 100644
--- a/meta/recipes-support/beecrypt/beecrypt/run-ptest
+++ b/meta/recipes-support/beecrypt/beecrypt/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
 
 cd tests
-for i in `ls`; do ./$i; if [ $? == 0 ]; then echo "PASS: $i"; \
+for i in `ls`; do ./$i; if [ $? -eq 0 ]; then echo "PASS: $i"; \
     else echo "FAIL: $i"; fi; done
-- 
1.7.9.5


