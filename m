Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3036011F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 06:53:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAS6rqrw020237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Nov 2015 22:53:52 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 Nov 2015 22:53:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 28 Nov 2015 14:53:40 +0800
Message-ID: <c9514adc712caf70fd65eaf9f1bcd6c97a97f2fa.1448693519.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448693519.git.hongxu.jia@windriver.com>
References: <cover.1448693519.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bash_4.3.30: fix testcase run-coproc/run-execscript/run-test/run-heredoc failed
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
X-List-Received-Date: Sat, 28 Nov 2015 06:53:57 -0000
Content-Type: text/plain

Add user 'test' to fix the failure of 'the test suite should not
be run as root'(run-execscript and run-test)

Backport test case from git://git.sv.gnu.org/bash.git to fix run-execscript
and run-heredoc

Still failed cases:
FAIL: run-intl
FAIL: run-lastpipe
FAIL: run-trap

YOCTO: 5698

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/bash/bash.inc                |   3 +
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 169 +++++++++++++++++++++
 meta/recipes-extended/bash/bash/run-ptest          |   2 +-
 meta/recipes-extended/bash/bash_4.3.30.bb          |   1 +
 4 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 020409f..85639d3 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -23,6 +23,9 @@ RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
 
+USERADD_PACKAGES = "${PN}-ptest"
+USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
+
 do_configure_prepend () {
 	if [ ! -e ${S}/acinclude.m4 ]; then
 		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
diff --git a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
new file mode 100644
index 0000000..7f099ae
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
@@ -0,0 +1,169 @@
+From 2c30dff8ea8b17ad5ba9881e35ad1eba9c515f13 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 26 Nov 2015 22:09:07 -0500
+Subject: [PATCH] fix run-coproc/run-heredoc/run-execscript/run-test/ failed
+
+FAIL: run-coproc
+update test case:tests/coproc.right, tests/coproc.tests
+git://git.sv.gnu.org/bash.git bash-4.4-testing
+
+FAIL: run-heredoc
+update test case: tests/heredoc.right tests/heredoc3.sub
+git://git.sv.gnu.org/bash.git bash-4.4-testing
+
+FAIL: run-execscript:
+the test suite should not be run as root
+
+FAIL: run-test
+the test suite should not be run as root
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/coproc.right   |  5 +----
+ tests/coproc.tests   | 30 +++++++++++++++++++++++++-----
+ tests/heredoc.right  |  5 ++---
+ tests/heredoc3.sub   |  3 ++-
+ tests/run-execscript |  3 ++-
+ tests/run-test       |  3 ++-
+ 6 files changed, 34 insertions(+), 15 deletions(-)
+
+diff --git a/tests/coproc.right b/tests/coproc.right
+index 6d9deaa..94b001c 100644
+--- a/tests/coproc.right
++++ b/tests/coproc.right
+@@ -1,11 +1,8 @@
+-84575
+ 63 60
+ a b c
+-84577
+ 63 60
+ flop
+-./coproc.tests: line 22: 84577 Terminated              coproc REFLECT { cat -; }
+-84579
++coproc.tests: REFLECT: status 143
+ 63 60
+ FOO
+ 63 60
+diff --git a/tests/coproc.tests b/tests/coproc.tests
+index 8be3563..d347eb7 100644
+--- a/tests/coproc.tests
++++ b/tests/coproc.tests
+@@ -1,6 +1,13 @@
++: ${TMPDIR:=/tmp}
++TMPOUT=${TMPDIR}/coproc-wait-$BASHPID
++
+ coproc { echo a b c; sleep 2; }
+ 
+-echo $COPROC_PID
++case $COPROC_PID in
++[0-9]*)	;;
++*)	echo COPROC_PID not integer ;;
++esac
++
+ echo ${COPROC[@]}
+ 
+ read LINE <&${COPROC[0]}
+@@ -10,7 +17,11 @@ wait $COPROC_PID
+ 
+ coproc REFLECT { cat - ; }
+ 
+-echo $REFLECT_PID
++case $REFLECT_PID in
++[0-9]*)	;;
++*)	echo REFLECT_PID not integer ;;
++esac
++
+ echo ${REFLECT[@]}
+ 
+ echo flop >&${REFLECT[1]}
+@@ -18,12 +29,21 @@ read LINE <&${REFLECT[0]}
+ 
+ echo $LINE
+ 
+-kill $REFLECT_PID
+-wait $REFLECT_PID
++{ sleep 1; kill $REFLECT_PID; } &
++wait $REFLECT_PID >$TMPOUT 2>&1 || echo "coproc.tests: REFLECT: status $?"
++grep 'Terminated.*coproc.*REFLECT' < $TMPOUT >/dev/null 2>&1 || {
++	echo "coproc.tests: wait for REFLECT failed" >&2
++}
++rm -f $TMPOUT
++exec 2>&1
+ 
+ coproc xcase -n -u
+ 
+-echo $COPROC_PID
++case $COPROC_PID in
++[0-9]*)	;;
++*)	echo COPROC_PID not integer ;;
++esac
++
+ echo ${COPROC[@]}
+ 
+ echo foo >&${COPROC[1]}
+diff --git a/tests/heredoc.right b/tests/heredoc.right
+index 6abaa1f..8df91c5 100644
+--- a/tests/heredoc.right
++++ b/tests/heredoc.right
+@@ -76,15 +76,14 @@ ENDEND
+ end ENDEND
+ hello
+ end hello
+-x star x
+ end x*x
+ helloEND
+ end helloEND
+ hello
+ \END
+ end hello<NL>\END
+-./heredoc3.sub: line 74: warning: here-document at line 72 delimited by end-of-file (wanted `EOF')
+-./heredoc3.sub: line 75: syntax error: unexpected end of file
++./heredoc3.sub: line 75: warning: here-document at line 73 delimited by end-of-file (wanted `EOF')
++./heredoc3.sub: line 76: syntax error: unexpected end of file
+ comsub here-string
+ ./heredoc.tests: line 105: warning: here-document at line 103 delimited by end-of-file (wanted `EOF')
+ hi
+diff --git a/tests/heredoc3.sub b/tests/heredoc3.sub
+index 73a111e..9d3d846 100644
+--- a/tests/heredoc3.sub
++++ b/tests/heredoc3.sub
+@@ -49,9 +49,10 @@ hello
+     END    
+ echo end hello
+ 
+-cat <<x*x & touch 'x*x'
++cat <<x*x >/dev/null & touch 'x*x'
+ x star x
+ x*x
++wait $!
+ echo end 'x*x'
+ rm 'x*x'
+ 
+diff --git a/tests/run-execscript b/tests/run-execscript
+index f97ab21..0d00a1b 100644
+--- a/tests/run-execscript
++++ b/tests/run-execscript
+@@ -5,5 +5,6 @@ echo "warning: \`/tmp/bash-notthere' not being found or \`/' being a directory"
+ echo "warning: produce diff output, please do not consider this a test failure" >&2
+ echo "warning: if diff output differing only in the location of the bash" >&2
+ echo "warning: binary appears, please do not consider this a test failure" >&2
+-${THIS_SH} ./execscript > /tmp/xx 2>&1
++rm -f /tmp/xx
++su -c "${THIS_SH} ./execscript > /tmp/xx 2>&1" test
+ diff /tmp/xx exec.right && rm -f /tmp/xx
+diff --git a/tests/run-test b/tests/run-test
+index b2482c3..2e8f049 100644
+--- a/tests/run-test
++++ b/tests/run-test
+@@ -1,4 +1,5 @@
+ unset GROUPS UID 2>/dev/null
+ 
+-${THIS_SH} ./test.tests >/tmp/xx 2>&1
++rm -f /tmp/xx
++su -c "${THIS_SH} ./test.tests >/tmp/xx 2>&1" test
+ diff /tmp/xx test.right && rm -f /tmp/xx
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index e3f8133..2098fa4 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-make -k THIS_SH=/bin/bash BUILD_DIR=. srcdir=.  runtest
+make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd`  runtest
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 811e61c..4426cf0 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
            "
 
-- 
1.9.1


