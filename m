Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C20EE7E9A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 16:03:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5EG375I014070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 09:03:07 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 14 Jun 2019 09:03:06 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2019 12:02:29 -0400
Message-ID: <20190614160229.6144-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190614160229.6144-1-Randy.MacLeod@windriver.com>
References: <20190614160229.6144-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] bash: use setpriv, sed.sed to run ptests
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
X-List-Received-Date: Fri, 14 Jun 2019 16:03:05 -0000
Content-Type: text/plain

The execscript test in bash fails when run with ptest-runner calling
'su', with the error:
   bash: cannot set terminal process group (16036): Inappropriate ioctl for device
Even with ptest-runner fixed to make a child process use the right
process group, 'su' still results in the warning above. Use 'setpriv'
instead. 'runuser' was considered and works but depends on pam so it's
ruled out.

Now that all bash tests are run as a user, the patch:
   fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
can be removed.  Also to create the account 'bashtest' in the
'run-ptest' script the bash-ptest must depend on 'shadow'. Also,
in 'run-ptest', ensure that the bash ptests are owned by the 'bashtest' user.

Add 'sed' as a dependency for ptests since tests/exp8.sub runs:
    var=$'x\001y\177z'
    declare -p var | sed -n l
and that results in:
    sed.busybox: ""
    sed.sed: declare -- var="x\001y\177z"$
This appears to be a feature that busybox sed has not implemented.

With this series of changes, bash-ptest for qemux86-64 passes
79 of 81 tests. The remaining failures are:

1. run-read:
  # cat tests/read6.sub
  # test read with a timeout of 0 -- input polling
  # sleep with fractional seconds argument is not universal
  echo abcde | { sleep 0.25 2>/dev/null ; read -t 0; }
  echo $?

  read -t 0 < $0
  echo $?

  read -t 0
  echo $? <-- returns 1, when 0 is expected.

I can reproduce this on my workstation but only when using ptest-runner
and initially logging into the console as root. That's a little odd and
seems like I need to continue to improve ptest-runner.

2. run-trap:
  # cat tests/trap3.sub
  PS4='+[$LINENO] '
  trap 'echo trap: $LINENO' ERR

  set -x

  echo 1
  echo 2
  echo 3 | cat | false <--- error
  echo 4

This is a scheduler behaviour difference between the common case
on a workstation and the common case in qemu. The test case does
warn about the completion order not being deterministic so I plan
to ignore it.

From tests/run-trap:
  UNIX versions number signals and schedule processes differently.
  If output differing only in line numbers is produced, please
  do not consider this a test failure.

Still, it's notable and slightly odd that the common case output
is different.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-extended/bash/bash.inc           |  5 +--
 ...un-heredoc-run-execscript-run-test-f.patch | 45 -------------------
 .../bash/bash/run-bash-ptests                 |  4 ++
 meta/recipes-extended/bash/bash/run-ptest     | 10 ++---
 meta/recipes-extended/bash/bash_5.0.bb        |  2 +-
 5 files changed, 12 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
 create mode 100644 meta/recipes-extended/bash/bash/run-bash-ptests

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 4cf1054967..c91cc8ada8 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -23,7 +23,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-ptest += "make coreutils perl"
+RDEPENDS_${PN}-ptest += "make coreutils perl sed shadow util-linux-setpriv"
 
 DEPENDS_append_libc-glibc = " virtual/libc-locale"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " \
@@ -36,8 +36,6 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " \
 	locale-base-fr-fr.iso-8859-1 \
 	locale-base-zh-hk.big5-hkscs \
 	"
-USERADD_PACKAGES = "${PN}-ptest"
-USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
 
 CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
 
@@ -74,6 +72,7 @@ do_install_append_class-target () {
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
+	install -D ${WORKDIR}/run-bash-ptests ${D}${PTEST_PATH}/run-bash-ptests
         sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
diff --git a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch b/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
deleted file mode 100644
index 9ac2461ab6..0000000000
--- a/meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d1cd4c31ea0ed7406a3ad4bdaa211f581063f655 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 10:21:21 +0800
-Subject: [PATCH 2/2] fix run-execscript/run-test/ failed
-
-FAIL: run-execscript:
-the test suite should not be run as root
-
-FAIL: run-test
-the test suite should not be run as root
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/run-execscript | 3 ++-
- tests/run-test       | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/tests/run-execscript b/tests/run-execscript
-index de78644..38397c1 100644
---- a/tests/run-execscript
-+++ b/tests/run-execscript
-@@ -5,5 +5,6 @@ echo "warning: \`/tmp/bash-notthere' not being found or \`/' being a directory"
- echo "warning: produce diff output, please do not consider this a test failure" >&2
- echo "warning: if diff output differing only in the location of the bash" >&2
- echo "warning: binary appears, please do not consider this a test failure" >&2
--${THIS_SH} ./execscript > ${BASH_TSTOUT} 2>&1
-+rm -f ${BASH_TSTOUT}
-+su -c "${THIS_SH} ./execscript > ${BASH_TSTOUT} 2>&1" test
- diff ${BASH_TSTOUT} exec.right && rm -f ${BASH_TSTOUT}
-diff --git a/tests/run-test b/tests/run-test
-index d68791c..d6317d2 100644
---- a/tests/run-test
-+++ b/tests/run-test
-@@ -1,4 +1,5 @@
- unset GROUPS UID 2>/dev/null
- 
--${THIS_SH} ./test.tests >${BASH_TSTOUT} 2>&1
-+rm -f ${BASH_TSTOUT}
-+su -c "${THIS_SH} ./test.tests > ${BASH_TSTOUT} 2>&1" test
- diff ${BASH_TSTOUT} test.right && rm -f ${BASH_TSTOUT}
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/bash/bash/run-bash-ptests b/meta/recipes-extended/bash/bash/run-bash-ptests
new file mode 100644
index 0000000000..d73a27224d
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/run-bash-ptests
@@ -0,0 +1,4 @@
+#!/bin/sh
+cd "$(dirname "$0")"
+make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd` runtest
+
diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
index c0cf27b6c2..738ad3c42c 100644
--- a/meta/recipes-extended/bash/bash/run-ptest
+++ b/meta/recipes-extended/bash/bash/run-ptest
@@ -19,8 +19,8 @@ then
         echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
 fi
 
-useradd bash_user
-chown -R bash_user:bash_user ./tests
-su bash_user -c "make -k THIS_SH=/bin/bash BUILD_DIR=`pwd` srcdir=`pwd` runtest"
-chown -R root:root ./tests
-userdel bash_user
+useradd bashtest
+chown -R bashtest:bashtest tests
+setpriv --reuid bashtest --rgid bashtest --clear-groups --reset-env $(dirname "$0")/run-bash-ptests
+chown -R root:root tests
+userdel -r bashtest
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index e60e5304a5..eadc82279d 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
-           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
+           file://run-bash-ptests \
            file://fix-run-builtins.patch \
            "
 
-- 
2.17.0


