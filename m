Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD39378542
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 07:31:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7I7Vu0D019307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 00:31:56 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 00:31:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 18 Aug 2017 03:31:51 -0400
Message-ID: <461ea9b4eb03b2d1da75a2452322d808b94ff4af.1503041246.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1503041246.git.hongxu.jia@windriver.com>
References: <cover.1503041246.git.hongxu.jia@windriver.com>
Subject: [V2 PATCH 1/2] bash: 4.3.30 -> 4.4
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
X-List-Received-Date: Fri, 18 Aug 2017 07:31:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1. Rebase patches:
- fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
- test-output.patch

2. Drop backported patches:
- CVE-2016-9401.patch
- fix-run-intl.patch

3. Add ${PN}-loadable for loadable builtins which is new features in Bash 4.4

4. The 4.4 fixed CVE-2017-5932 and CVE-2016-0634
- https://security-tracker.debian.org/tracker/CVE-2017-5932
- https://security-tracker.debian.org/tracker/CVE-2016-0634

5. The 4.4 installed include header files, fix bash-dev confilicts
   with lib32-bash-dev
.....
$ bitbake lib32-core-image-sato-sdk
...
|Error: Transaction check error: file /usr/include/bash/config.h
conflicts between attempted installs
|of lib32-bash-dev-4.4-r0.x86 and bash-dev-4.4-r0.core2_64
......

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/bash/bash.inc                |   6 +
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 -------
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 158 +++------------------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 --------------
 meta/recipes-extended/bash/bash/test-output.patch  |  47 ++++--
 meta/recipes-extended/bash/bash_4.3.30.bb          |  75 ----------
 meta/recipes-extended/bash/bash_4.4.bb             |  58 ++++++++
 7 files changed, 113 insertions(+), 391 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 6c94a24..92916d9 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -28,6 +28,8 @@ RDEPENDS_${PN}-ptest += "make"
 USERADD_PACKAGES = "${PN}-ptest"
 USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
 
+CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
+
 do_configure_prepend () {
 	if [ ! -e ${S}/acinclude.m4 ]; then
 		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
@@ -70,4 +72,8 @@ PACKAGES += "${PN}-bashbug"
 FILES_${PN} = "${bindir}/bash ${base_bindir}/bash.bash"
 FILES_${PN}-bashbug = "${bindir}/bashbug"
 
+PACKAGE_BEFORE_PN += "${PN}-loadable"
+RDEPENDS_${PN}-loadable += "${PN}"
+FILES_${PN}-loadable += "${libdir}/bash/*"
+
 RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
diff --git a/meta/recipes-extended/bash/bash/CVE-2016-9401.patch b/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
deleted file mode 100644
index 28c9277..0000000
--- a/meta/recipes-extended/bash/bash/CVE-2016-9401.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From fa741771ed47b30547be63b5b5dbfb51977aca12 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Fri, 20 Jan 2017 11:47:31 -0500
-Subject: [PATCH] Bash-4.4 patch 6
-
-Bug-Reference-URL:
-https://lists.gnu.org/archive/html/bug-bash/2016-11/msg00116.html
-
-Reference to upstream patch:
-https://ftp.gnu.org/pub/gnu/bash/bash-4.4-patches/bash44-006
-
-Bug-Description:
-Out-of-range negative offsets to popd can cause the shell to crash attempting
-to free an invalid memory block.
-
-Upstream-Status: Backport
-CVE: CVE-2016-9401
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- builtins/pushd.def | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/builtins/pushd.def b/builtins/pushd.def
-index 9c6548f..8a13bae 100644
---- a/builtins/pushd.def
-+++ b/builtins/pushd.def
-@@ -359,7 +359,7 @@ popd_builtin (list)
- 	break;
-     }
- 
--  if (which > directory_list_offset || (directory_list_offset == 0 && which == 0))
-+  if (which > directory_list_offset || (which < -directory_list_offset) || (directory_list_offset == 0 && which == 0))
-     {
-       pushd_error (directory_list_offset, which_word ? which_word : "");
-       return (EXECUTION_FAILURE);
-@@ -381,6 +381,11 @@ popd_builtin (list)
- 	 remove that directory from the list and shift the remainder
- 	 of the list into place. */
-       i = (direction == '+') ? directory_list_offset - which : which;
-+      if (i < 0 || i > directory_list_offset)
-+	{
-+	  pushd_error (directory_list_offset, which_word ? which_word : "");
-+	  return (EXECUTION_FAILURE);
-+	}
-       free (pushd_directory_list[i]);
-       directory_list_offset--;
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
index 7f099ae..9ac2461 100644
--- a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
@@ -1,15 +1,7 @@
-From 2c30dff8ea8b17ad5ba9881e35ad1eba9c515f13 Mon Sep 17 00:00:00 2001
+From d1cd4c31ea0ed7406a3ad4bdaa211f581063f655 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 26 Nov 2015 22:09:07 -0500
-Subject: [PATCH] fix run-coproc/run-heredoc/run-execscript/run-test/ failed
-
-FAIL: run-coproc
-update test case:tests/coproc.right, tests/coproc.tests
-git://git.sv.gnu.org/bash.git bash-4.4-testing
-
-FAIL: run-heredoc
-update test case: tests/heredoc.right tests/heredoc3.sub
-git://git.sv.gnu.org/bash.git bash-4.4-testing
+Date: Tue, 15 Aug 2017 10:21:21 +0800
+Subject: [PATCH 2/2] fix run-execscript/run-test/ failed
 
 FAIL: run-execscript:
 the test suite should not be run as root
@@ -21,149 +13,33 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- tests/coproc.right   |  5 +----
- tests/coproc.tests   | 30 +++++++++++++++++++++++++-----
- tests/heredoc.right  |  5 ++---
- tests/heredoc3.sub   |  3 ++-
- tests/run-execscript |  3 ++-
- tests/run-test       |  3 ++-
- 6 files changed, 34 insertions(+), 15 deletions(-)
+ tests/run-execscript | 3 ++-
+ tests/run-test       | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/tests/coproc.right b/tests/coproc.right
-index 6d9deaa..94b001c 100644
---- a/tests/coproc.right
-+++ b/tests/coproc.right
-@@ -1,11 +1,8 @@
--84575
- 63 60
- a b c
--84577
- 63 60
- flop
--./coproc.tests: line 22: 84577 Terminated              coproc REFLECT { cat -; }
--84579
-+coproc.tests: REFLECT: status 143
- 63 60
- FOO
- 63 60
-diff --git a/tests/coproc.tests b/tests/coproc.tests
-index 8be3563..d347eb7 100644
---- a/tests/coproc.tests
-+++ b/tests/coproc.tests
-@@ -1,6 +1,13 @@
-+: ${TMPDIR:=/tmp}
-+TMPOUT=${TMPDIR}/coproc-wait-$BASHPID
-+
- coproc { echo a b c; sleep 2; }
- 
--echo $COPROC_PID
-+case $COPROC_PID in
-+[0-9]*)	;;
-+*)	echo COPROC_PID not integer ;;
-+esac
-+
- echo ${COPROC[@]}
- 
- read LINE <&${COPROC[0]}
-@@ -10,7 +17,11 @@ wait $COPROC_PID
- 
- coproc REFLECT { cat - ; }
- 
--echo $REFLECT_PID
-+case $REFLECT_PID in
-+[0-9]*)	;;
-+*)	echo REFLECT_PID not integer ;;
-+esac
-+
- echo ${REFLECT[@]}
- 
- echo flop >&${REFLECT[1]}
-@@ -18,12 +29,21 @@ read LINE <&${REFLECT[0]}
- 
- echo $LINE
- 
--kill $REFLECT_PID
--wait $REFLECT_PID
-+{ sleep 1; kill $REFLECT_PID; } &
-+wait $REFLECT_PID >$TMPOUT 2>&1 || echo "coproc.tests: REFLECT: status $?"
-+grep 'Terminated.*coproc.*REFLECT' < $TMPOUT >/dev/null 2>&1 || {
-+	echo "coproc.tests: wait for REFLECT failed" >&2
-+}
-+rm -f $TMPOUT
-+exec 2>&1
- 
- coproc xcase -n -u
- 
--echo $COPROC_PID
-+case $COPROC_PID in
-+[0-9]*)	;;
-+*)	echo COPROC_PID not integer ;;
-+esac
-+
- echo ${COPROC[@]}
- 
- echo foo >&${COPROC[1]}
-diff --git a/tests/heredoc.right b/tests/heredoc.right
-index 6abaa1f..8df91c5 100644
---- a/tests/heredoc.right
-+++ b/tests/heredoc.right
-@@ -76,15 +76,14 @@ ENDEND
- end ENDEND
- hello
- end hello
--x star x
- end x*x
- helloEND
- end helloEND
- hello
- \END
- end hello<NL>\END
--./heredoc3.sub: line 74: warning: here-document at line 72 delimited by end-of-file (wanted `EOF')
--./heredoc3.sub: line 75: syntax error: unexpected end of file
-+./heredoc3.sub: line 75: warning: here-document at line 73 delimited by end-of-file (wanted `EOF')
-+./heredoc3.sub: line 76: syntax error: unexpected end of file
- comsub here-string
- ./heredoc.tests: line 105: warning: here-document at line 103 delimited by end-of-file (wanted `EOF')
- hi
-diff --git a/tests/heredoc3.sub b/tests/heredoc3.sub
-index 73a111e..9d3d846 100644
---- a/tests/heredoc3.sub
-+++ b/tests/heredoc3.sub
-@@ -49,9 +49,10 @@ hello
-     END    
- echo end hello
- 
--cat <<x*x & touch 'x*x'
-+cat <<x*x >/dev/null & touch 'x*x'
- x star x
- x*x
-+wait $!
- echo end 'x*x'
- rm 'x*x'
- 
 diff --git a/tests/run-execscript b/tests/run-execscript
-index f97ab21..0d00a1b 100644
+index de78644..38397c1 100644
 --- a/tests/run-execscript
 +++ b/tests/run-execscript
 @@ -5,5 +5,6 @@ echo "warning: \`/tmp/bash-notthere' not being found or \`/' being a directory"
  echo "warning: produce diff output, please do not consider this a test failure" >&2
  echo "warning: if diff output differing only in the location of the bash" >&2
  echo "warning: binary appears, please do not consider this a test failure" >&2
--${THIS_SH} ./execscript > /tmp/xx 2>&1
-+rm -f /tmp/xx
-+su -c "${THIS_SH} ./execscript > /tmp/xx 2>&1" test
- diff /tmp/xx exec.right && rm -f /tmp/xx
+-${THIS_SH} ./execscript > ${BASH_TSTOUT} 2>&1
++rm -f ${BASH_TSTOUT}
++su -c "${THIS_SH} ./execscript > ${BASH_TSTOUT} 2>&1" test
+ diff ${BASH_TSTOUT} exec.right && rm -f ${BASH_TSTOUT}
 diff --git a/tests/run-test b/tests/run-test
-index b2482c3..2e8f049 100644
+index d68791c..d6317d2 100644
 --- a/tests/run-test
 +++ b/tests/run-test
 @@ -1,4 +1,5 @@
  unset GROUPS UID 2>/dev/null
  
--${THIS_SH} ./test.tests >/tmp/xx 2>&1
-+rm -f /tmp/xx
-+su -c "${THIS_SH} ./test.tests >/tmp/xx 2>&1" test
- diff /tmp/xx test.right && rm -f /tmp/xx
+-${THIS_SH} ./test.tests >${BASH_TSTOUT} 2>&1
++rm -f ${BASH_TSTOUT}
++su -c "${THIS_SH} ./test.tests > ${BASH_TSTOUT} 2>&1" test
+ diff ${BASH_TSTOUT} test.right && rm -f ${BASH_TSTOUT}
 -- 
-1.9.1
+1.8.3.1
 
diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch b/meta/recipes-extended/bash/bash/fix-run-intl.patch
deleted file mode 100644
index d4a3409..0000000
--- a/meta/recipes-extended/bash/bash/fix-run-intl.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From a00d3161fd7b6a698bdd2ed5f0ac5faac580ee2a Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 3 Aug 2016 23:13:00 -0400
-Subject: [PATCH] fix run-intl failed
-
-1. Filter extra white space of intl.right
-
-   Due to the extra white space of intl.right, when the result of
-   sub-test unicode2.sub of intl.tests compared to it, the test
-   failed.
-
-   So we need to filter the extra white space of intl.right.
-
-   Import this patch for intl.right from bash devel branch:
-
-	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
-
-   commit is:
-
-	85ec0778f9d778e1820fb8c0e3e996f2d1103b45
-
-2. Change intl.right correspond to the unicode3.sub's output
-
-   In sub-test unicode3.sub of intl.tests, the payload value is:
-
-	payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
-
-   It used quoted string expansion(escaped octal) to assign ASCII
-   characters to variables. So when the test run the following:
-
-	printf %q "$payload"
-
-   It produced:
-
-	$'5\247@3\231+\306S8\237\242\352\263'
-
-   When compared to the intl.right(contain the converted character), it failed.
-
-   Import parts of patch for intl.right from bash devel branch:
-
-	http://git.savannah.gnu.org/cgit/bash.git/log/?h=devel
-
-   commit is:
-
-	74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
-
-Upstream-Status: Backport
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- tests/intl.right | 30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/tests/intl.right b/tests/intl.right
-index acf108a..1efdfbe 100644
---- a/tests/intl.right
-+++ b/tests/intl.right
-@@ -18,34 +18,34 @@ a√©b
- 1.0000
- 1,0000
- Passed all 1378 Unicode tests
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   357 277 277 012                                                
-+0000000 357 277 277 012
- 0000004
--0000000   357 277 277 012                                                
-+0000000 357 277 277 012
- 0000004
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   012                                                            
-+0000000 012
- 0000001
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   303 277 012                                                    
-+0000000 303 277 012
- 0000003
--0000000   101 040 302 243 040 305 222 012                                
-+0000000 101 040 302 243 040 305 222 012
- 0000010
- ./unicode3.sub: line 2: 5ß@3ô+∆S8ü¢Í≥: command not found
--5ß@3ô+∆S8ü¢Í≥
-+$'5\247@3\231+\306S8\237\242\352\263'
- + : $'5\247@3\231+\306S8\237\242\352\263'
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
index 2b09b7d..0ffcc24 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -1,25 +1,42 @@
-Add FAIL/PASS output to test output.
+From 28eb06047ebd2deaa8c7cd2bf6655ef6a469dc14 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 10:01:56 +0800
+Subject: [PATCH 1/2] Add FAIL/PASS output to test output.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Bj√∂rn Stenberg <bjst@enea.com>
 Upstream-Status: Pending
+
+Rebase to 4.4
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
-diff -uNr a/tests/run-all b/tests/run-all
---- a/tests/run-all	1999-10-08 17:07:46.000000000 +0200
-+++ b/tests/run-all	2012-10-27 21:04:18.663331887 +0200
-@@ -22,7 +22,15 @@
+ tests/run-all | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/tests/run-all b/tests/run-all
+index 2882fe0..e21d026 100644
+--- a/tests/run-all
++++ b/tests/run-all
+@@ -33,7 +33,16 @@ do
  	case $x in
  	$0|run-minimal|run-gprof)	;;
  	*.orig|*~) ;;
--	*)	echo $x ; sh $x ;;
-+    *)  echo $x
-+         output=`sh $x`
-+         if [ -n "$output" ]; then
-+             echo "$output"
-+             echo "FAIL: $x"
-+         else
-+             echo "PASS: $x"
-+         fi
-+         ;;
+-	*)	echo $x ; sh $x ; rm -f ${BASH_TSTOUT} ;;
++	*)	echo $x
++		output=`sh $x`
++		if [ -n "$output" ]; then
++			echo "$output"
++			echo "FAIL: $x"
++		else
++			echo "PASS: $x"
++		fi
++		rm -f ${BASH_TSTOUT}
++		;;
  	esac
  done
  
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
deleted file mode 100644
index b40059f..0000000
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-031;apply=yes;striplevel=0;name=patch031 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-032;apply=yes;striplevel=0;name=patch032 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-033;apply=yes;striplevel=0;name=patch033 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-034;apply=yes;striplevel=0;name=patch034 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-035;apply=yes;striplevel=0;name=patch035 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-036;apply=yes;striplevel=0;name=patch036 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-037;apply=yes;striplevel=0;name=patch037 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-038;apply=yes;striplevel=0;name=patch038 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-039;apply=yes;striplevel=0;name=patch039 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-040;apply=yes;striplevel=0;name=patch040 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-041;apply=yes;striplevel=0;name=patch041 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-042;apply=yes;striplevel=0;name=patch042 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-043;apply=yes;striplevel=0;name=patch043 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-044;apply=yes;striplevel=0;name=patch044 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-045;apply=yes;striplevel=0;name=patch045 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-046;apply=yes;striplevel=0;name=patch046 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-047;apply=yes;striplevel=0;name=patch047 \
-           file://execute_cmd.patch;striplevel=0 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
-           file://run-ptest \
-           file://fix-run-builtins.patch \
-           file://0001-help-fix-printf-format-security-warning.patch \
-           file://fix-run-intl.patch \
-           file://CVE-2016-9401.patch \
-           "
-
-SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-SRC_URI[tarball.sha256sum] = "317881019bbf2262fb814b7dd8e40632d13c3608d2f237800a8828fbb8a640dd"
-
-SRC_URI[patch031.md5sum] = "236df1ac1130a033ed0dbe2d2115f28f"
-SRC_URI[patch031.sha256sum] = "cd529f59dd0f2fdd49d619fe34691da6f0affedf87cc37cd460a9f3fe812a61d"
-SRC_URI[patch032.md5sum] = "2360f7e79cfb28526f80021025ea5909"
-SRC_URI[patch032.sha256sum] = "889357d29a6005b2c3308ca5b6286cb223b5e9c083219e5db3156282dd554f4a"
-SRC_URI[patch033.md5sum] = "b551c4ee7b8713759e4143499d0bbd48"
-SRC_URI[patch033.sha256sum] = "fb2a7787a13fbe027a7335aca6eb3c21cdbd813e9edc221274b6a9d8692eaa16"
-SRC_URI[patch034.md5sum] = "c9a56fbe0348e05a886dff97f2872b74"
-SRC_URI[patch034.sha256sum] = "f1694f04f110defe1330a851cc2768e7e57ddd2dfdb0e3e350ca0e3c214ff889"
-SRC_URI[patch035.md5sum] = "e564e8ab44ed1ca3a4e315a9f6cabdc9"
-SRC_URI[patch035.sha256sum] = "370d85e51780036f2386dc18c5efe996eba8e652fc1973f0f4f2ab55a993c1e3"
-SRC_URI[patch036.md5sum] = "b00ff66c41a7c0f06e191200981980b0"
-SRC_URI[patch036.sha256sum] = "ac5f82445b36efdb543dbfae64afed63f586d7574b833e9aa9cd5170bc5fd27c"
-SRC_URI[patch037.md5sum] = "be2a7b05f6ae560313f3c9d5f7127bda"
-SRC_URI[patch037.sha256sum] = "33f170dd7400ab3418d749c55c6391b1d161ef2de7aced1873451b3a3fca5813"
-SRC_URI[patch038.md5sum] = "61e0522830b24fbe8c0d1b010f132470"
-SRC_URI[patch038.sha256sum] = "adbeaa500ca7a82535f0e88d673661963f8a5fcdc7ad63445e68bf5b49786367"
-SRC_URI[patch039.md5sum] = "a4775487abe958536751c8ce53cdf6f9"
-SRC_URI[patch039.sha256sum] = "ab94dced2215541097691f60c3eb323cc28ef2549463e6a5334bbcc1e61e74ec"
-SRC_URI[patch040.md5sum] = "80d3587c58854e226055ef099ffeb535"
-SRC_URI[patch040.sha256sum] = "84bb396b9262992ca5424feab6ed3ec39f193ef5c76dfe4a62b551bd8dd9d76b"
-SRC_URI[patch041.md5sum] = "20bf63eef7cb441c0b1cc49ef3191d03"
-SRC_URI[patch041.sha256sum] = "4ec432966e4198524a7e0cd685fe222e96043769c9613e66742ac475db132c1a"
-SRC_URI[patch042.md5sum] = "70790646ae61e207c995e44931390e50"
-SRC_URI[patch042.sha256sum] = "ac219322db2791da87a496ee6e8e5544846494bdaaea2626270c2f73c1044919"
-SRC_URI[patch043.md5sum] = "855a46955cb251534e80b4732b748e37"
-SRC_URI[patch043.sha256sum] = "47a8a3c005b46e25821f4d8f5ccb04c1d653b1c829cb40568d553dc44f7a6180"
-SRC_URI[patch044.md5sum] = "29623d3282fcbb37e1158136509b5bb8"
-SRC_URI[patch044.sha256sum] = "9338820630bf67373b44d8ea68409f65162ea7a47b9b29ace06a0aed12567f99"
-SRC_URI[patch045.md5sum] = "4473244ca5abfd4b018ea26dc73e7412"
-SRC_URI[patch045.sha256sum] = "ba6ec3978e9eaa1eb3fabdaf3cc6fdf8c4606ac1c599faaeb4e2d69864150023"
-SRC_URI[patch046.md5sum] = "7e5fb09991c077076b86e0e057798913"
-SRC_URI[patch046.sha256sum] = "b3b456a6b690cd293353f17e22d92a202b3c8bce587ae5f2667c20c9ab6f688f"
-SRC_URI[patch047.md5sum] = "8483153bad1a6f52cadc3bd9a8df7835"
-SRC_URI[patch047.sha256sum] = "c69248de7e78ba6b92f118fe1ef47bc86479d5040fe0b1f908ace1c9e3c67c4a"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_4.4.bb b/meta/recipes-extended/bash/bash_4.4.bb
new file mode 100644
index 0000000..b602afe
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_4.4.bb
@@ -0,0 +1,58 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-004;apply=yes;striplevel=0;name=patch004 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-005;apply=yes;striplevel=0;name=patch005 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-006;apply=yes;striplevel=0;name=patch006 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-007;apply=yes;striplevel=0;name=patch007 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-008;apply=yes;striplevel=0;name=patch008 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-009;apply=yes;striplevel=0;name=patch009 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-010;apply=yes;striplevel=0;name=patch010 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-011;apply=yes;striplevel=0;name=patch011 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-012;apply=yes;striplevel=0;name=patch012 \
+           file://execute_cmd.patch;striplevel=0 \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
+           file://run-ptest \
+           file://fix-run-builtins.patch \
+           file://0001-help-fix-printf-format-security-warning.patch \
+           "
+
+SRC_URI[tarball.md5sum] = "148888a7c95ac23705559b6f477dfe25"
+SRC_URI[tarball.sha256sum] = "d86b3392c1202e8ff5a423b302e6284db7f8f435ea9f39b5b1b20fd3ac36dfcb"
+
+SRC_URI[patch001.md5sum] = "817d01a6c0af6f79308a8b7b649e53d8"
+SRC_URI[patch001.sha256sum] = "3e28d91531752df9a8cb167ad07cc542abaf944de9353fe8c6a535c9f1f17f0f"
+SRC_URI[patch002.md5sum] = "765e14cff12c7284009772e8e24f2fe0"
+SRC_URI[patch002.sha256sum] = "7020a0183e17a7233e665b979c78c184ea369cfaf3e8b4b11f5547ecb7c13c53"
+SRC_URI[patch003.md5sum] = "49e7da93bf07f510a2eb6bb43ac3e5a2"
+SRC_URI[patch003.sha256sum] = "51df5a9192fdefe0ddca4bdf290932f74be03ffd0503a3d112e4199905e718b2"
+SRC_URI[patch004.md5sum] = "4557d674ab5831a5fa98052ab19edaf4"
+SRC_URI[patch004.sha256sum] = "ad080a30a4ac6c1273373617f29628cc320a35c8cd06913894794293dc52c8b3"
+SRC_URI[patch005.md5sum] = "cce96dd77cdd1d293beec10848f6cbb5"
+SRC_URI[patch005.sha256sum] = "221e4b725b770ad0bb6924df3f8d04f89eeca4558f6e4c777dfa93e967090529"
+SRC_URI[patch006.md5sum] = "d3379f8d8abce5c6ee338f931ad008d5"
+SRC_URI[patch006.sha256sum] = "6a8e2e2a6180d0f1ce39dcd651622fb6d2fd05db7c459f64ae42d667f1e344b8"
+SRC_URI[patch007.md5sum] = "ec38c76ca439ca7f9c178e9baede84fc"
+SRC_URI[patch007.sha256sum] = "de1ccc07b7bfc9e25243ad854f3bbb5d3ebf9155b0477df16aaf00a7b0d5edaf"
+SRC_URI[patch008.md5sum] = "e0ba18c1e3b94f905da9b5bf9d38b58b"
+SRC_URI[patch008.sha256sum] = "86144700465933636d7b945e89b77df95d3620034725be161ca0ca5a42e239ba"
+SRC_URI[patch009.md5sum] = "e952d4f44e612048930c559d90eb99bb"
+SRC_URI[patch009.sha256sum] = "0b6bdd1a18a0d20e330cc3bc71e048864e4a13652e29dc0ebf3918bea729343c"
+SRC_URI[patch010.md5sum] = "57b5b35955d68f9a09dbef6b86d2c782"
+SRC_URI[patch010.sha256sum] = "8465c6f2c56afe559402265b39d9e94368954930f9aa7f3dfa6d36dd66868e06"
+SRC_URI[patch011.md5sum] = "cc896e1fa696b93ded568e557e2392d5"
+SRC_URI[patch011.sha256sum] = "dd56426ef7d7295e1107c0b3d06c192eb9298f4023c202ca2ba6266c613d170d"
+SRC_URI[patch012.md5sum] = "fa47fbfa56fb7e9e5367f19a9df5fc9e"
+SRC_URI[patch012.sha256sum] = "fac271d2bf6372c9903e3b353cb9eda044d7fe36b5aab52f21f3f21cd6a2063e"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.8.1


