Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB73B71BEE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 19:30:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x54JUAfH031156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2019 12:30:21 -0700
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 12:29:59 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jun 2019 15:29:39 -0400
Message-ID: <20190604192939.29929-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604192939.29929-1-sakib.sajal@windriver.com>
References: <20190604192939.29929-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] bash: inherit useradd and remove redundant patch
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
X-List-Received-Date: Tue, 04 Jun 2019 19:30:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1) inherit useradd to allow new users to be created.

Ensure that useradd/del are available when running
bash ptests.

2) run ptest as non-root.

Removed patch:
   fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch

which enabled the two tests:
   execscript, test,
to be run by root but under 'su' as a user. These two tests
now fail since all bash ptest are now run as non-root and there
is no need to 'su'. There are remaining problems with the test
that will be resolved in future commits.

Bash ptest statistics with said changes:
   PASS: 77
   SKIP:  0
   FAIL:  4

Failed tests: execscript
	      test
	      read
  	      trap

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 meta/recipes-extended/bash/bash.inc           |  2 +-
 ...un-heredoc-run-execscript-run-test-f.patch | 45 -------------------
 meta/recipes-extended/bash/bash_5.0.bb        |  1 -
 3 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index dbb803ddef..1965e9c4a3 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -4,7 +4,7 @@ SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native virtual/libiconv"
 
-inherit autotools gettext texinfo update-alternatives ptest
+inherit autotools gettext texinfo update-alternatives ptest useradd
 
 EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
 EXTRA_OECONF = "--enable-job-control --without-bash-malloc bash_cv_wexitstatus_offset=8"
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
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index e60e5304a5..0a3f1b15f0 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
-           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
            file://fix-run-builtins.patch \
            "
-- 
2.20.1


