Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B7FE7D270
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 09:17:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.14756.1695719831996290369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 02:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121944360"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="121944360"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 18:17:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 48191CD7E4
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 18:17:07 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DDB1D5014
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 18:17:06 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57D072FC90C3;
	Tue, 26 Sep 2023 18:17:05 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>,
	Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [PATCH V6] tar: add ptest support
Date: Mon, 25 Sep 2023 13:39:47 +0800
Message-Id: <1695620387-2946-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--31.347700-10.000000
X-TMASE-MatchedRID: 69/SY35xO7VSuJfEWZSQfBMxKDqgAFSz3hng3KTHeTaOEENgsUAuYv4Q
	R/7oUDJyT1fsjZmF+qx+ZzhDh7nRZBk6r7o1Tg7l/HTKStsDGMJHNQ8CqEKO2AZVHDHZX+kd65w
	itCGfmW+M64yzWHFaGW6J2k+mxn+fvE0Zd97DR2axlpnlQFCyhwmWvXEqQTm5vn+2qfQyWg2/BR
	68O365biB4587cm8bVxmJ07fhF3Nbuha5ro/3Uoww85kvZfX2KKQNhMboqZlq4GyTmeN+AbNWrF
	FAqqfvHRt/dc/AJIZqZrdz84ftrgLNUVnqixiMO7pujb8urdzYxXH/dlhvLv199KTJvos9IUKYK
	eywNH7qtqhvfTy0XN9j7FJhauVHfVRqx2TJ8EO95deF6OSK9lwmFQuskd8oGDtozTuqqlFsmE1l
	q3FzSNLKZFu0xI5yccFobH4UqaSSTReo2rNvq+Ih/ebSxR/HnWfgivgcUPZNtuLVtkff+0A7or9
	T0k1Z+EE/NmKAZp8y4V/5VEBnHsOeKNmNNd29X/Sl5cYQQGW+ycrvYxo9Kp1xlRrXdZ///bY2Vj
	MZmBCQNQOL2LRVn+3f1e2LieD10IRvqkRRE3o6zRPQ8T4oe5Q8JAnaMw0RVgW6bY8SOq3WjxYyR
	Ba/qJV/Hpl/zcOjl5MIx11wv+CPiRhduhvElsucjNHNZLY/T
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 09:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188240

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for tar.
- It is taking around 3m to execute with kvm, so added it to PTEST_SLOW.
- It contains 244 cases.
- Below is parts of the run log:
  START: ptest-runner
  2023-09-26T08:37
  BEGIN: /usr/lib/tar/ptest
  ## ------------------------ ##
  ## GNU tar 1.35 test suite. ##
  ## ------------------------ ##
  PASS: tar version
  PASS: decompressing from stdin
  ...
  200 tests were successful.
  44 tests were skipped.
  DURATION: 190
  END: /usr/lib/tar/ptest
  2023-09-26T08:40
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/recipes-core/images/core-image-ptest.bb  |   3 +
 .../tar/tar/0001-tests-fix-TESTSUITE_AT.patch | 228 ++++++++++++++++++
 ...2-tests-check-for-recently-fixed-bug.patch |  60 +++++
 ...rectory-with-writing-from-an-archive.patch | 112 +++++++++
 meta/recipes-extended/tar/tar/run-ptest       |  14 ++
 meta/recipes-extended/tar/tar_1.35.bb         |  34 +++
 7 files changed, 452 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/0001-tests-fix-TESTSUITE_AT.patch
 create mode 100644 meta/recipes-extended/tar/tar/0002-tests-check-for-recently-fixed-bug.patch
 create mode 100644 meta/recipes-extended/tar/tar/0003-Exclude-VCS-directory-with-writing-from-an-archive.patch
 create mode 100644 meta/recipes-extended/tar/tar/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9160103cb0..3df7c9e405 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -109,6 +109,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3 \
     strace \
+    tar \
     tcl \
     util-linux \
     valgrind \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b81ab7b7c8..b6f5c2fd60 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -24,6 +24,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
+# tar-ptest in particular needs more space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
diff --git a/meta/recipes-extended/tar/tar/0001-tests-fix-TESTSUITE_AT.patch b/meta/recipes-extended/tar/tar/0001-tests-fix-TESTSUITE_AT.patch
new file mode 100644
index 0000000000..00caeee767
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/0001-tests-fix-TESTSUITE_AT.patch
@@ -0,0 +1,228 @@
+From 39849e9d91f477d3fb839f93cd0815d0cb3273e9 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 18 Jul 2023 09:15:03 -0700
+Subject: tests: fix TESTSUITE_AT
+
+Problem reported by Lukas Javorsky <ljavorsk@redhat.com> in:
+https://lists.gnu.org/r/bug-tar/2023-07/msg00002.html
+* tests/Makefile.am (TESTSUITE_AT): Add exclude17.at, exclude18.at.
+Remove compress.m4; all uses changed.  Add a comment saying how
+to rederive this.  Sort.
+
+Upstream-Status: Submitted [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=39849e9d91f477d3fb839f93cd0815d0cb3273e9]
+---
+ tests/Makefile.am | 93 ++++++++++++++++++++++++++++---------------------------
+ 1 file changed, 48 insertions(+), 45 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 4a8f501..1884b72 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -45,21 +45,24 @@ $(srcdir)/package.m4: $(top_srcdir)/configure.ac
+ ## Test suite.  ##
+ ## ------------ ##
+ 
++# You can generate the body of this macro with the following shell command:
++# LC_ALL=C ls *.at */*.at | sed -e 's/^/ /' -e '$!s/$/\\/'
+ TESTSUITE_AT = \
+- testsuite.at\
+- compress.m4\
+  T-cd.at\
+  T-dir00.at\
+  T-dir01.at\
+  T-empty.at\
++ T-mult.at\
++ T-nest.at\
++ T-nonl.at\
+  T-null.at\
+  T-null2.at\
+  T-rec.at\
+  T-recurse.at\
+  T-zfile.at\
+- T-nonl.at\
+- T-mult.at\
+- T-nest.at\
++ acls01.at\
++ acls02.at\
++ acls03.at\
+  add-file.at\
+  append.at\
+  append01.at\
+@@ -68,14 +71,15 @@ TESTSUITE_AT = \
+  append04.at\
+  append05.at\
+  backup01.at\
+- chtype.at\
+- comprec.at\
+- comperr.at\
++ capabs_raw01.at\
+  checkpoint/defaults.at\
+- checkpoint/interval.at\
+- checkpoint/dot.at\
+  checkpoint/dot-compat.at\
+  checkpoint/dot-int.at\
++ checkpoint/dot.at\
++ checkpoint/interval.at\
++ chtype.at\
++ comperr.at\
++ comprec.at\
+  delete01.at\
+  delete02.at\
+  delete03.at\
+@@ -83,6 +87,8 @@ TESTSUITE_AT = \
+  delete05.at\
+  delete06.at\
+  difflink.at\
++ dirrem01.at\
++ dirrem02.at\
+  exclude.at\
+  exclude01.at\
+  exclude02.at\
+@@ -100,6 +106,8 @@ TESTSUITE_AT = \
+  exclude14.at\
+  exclude15.at\
+  exclude16.at\
++ exclude17.at\
++ exclude18.at\
+  extrac01.at\
+  extrac02.at\
+  extrac03.at\
+@@ -127,11 +135,9 @@ TESTSUITE_AT = \
+  extrac25.at\
+  filerem01.at\
+  filerem02.at\
+- dirrem01.at\
+- dirrem02.at\
+- gzip.at\
+  grow.at\
+- incremental.at\
++ gzip.at\
++ ignfail.at\
+  incr01.at\
+  incr02.at\
+  incr03.at\
+@@ -143,8 +149,8 @@ TESTSUITE_AT = \
+  incr09.at\
+  incr10.at\
+  incr11.at\
++ incremental.at\
+  indexfile.at\
+- ignfail.at\
+  label01.at\
+  label02.at\
+  label03.at\
+@@ -188,22 +194,16 @@ TESTSUITE_AT = \
+  opcomp04.at\
+  opcomp05.at\
+  opcomp06.at\
+- positional01.at\
+- positional02.at\
+- positional03.at\
+  options.at\
+  options02.at\
+  options03.at\
+  owner.at\
+  pipe.at\
+- recurse.at\
++ positional01.at\
++ positional02.at\
++ positional03.at\
+  recurs02.at\
+- rename01.at\
+- rename02.at\
+- rename03.at\
+- rename04.at\
+- rename05.at\
+- rename06.at\
++ recurse.at\
+  remfiles01.at\
+  remfiles02.at\
+  remfiles03.at\
+@@ -226,11 +226,19 @@ TESTSUITE_AT = \
+  remfiles09b.at\
+  remfiles09c.at\
+  remfiles10.at\
++ rename01.at\
++ rename02.at\
++ rename03.at\
++ rename04.at\
++ rename05.at\
++ rename06.at\
+  same-order01.at\
+  same-order02.at\
++ selacl01.at\
++ selnx01.at\
+  shortfile.at\
+- shortupd.at\
+  shortrec.at\
++ shortupd.at\
+  sigpipe.at\
+  sparse01.at\
+  sparse02.at\
+@@ -247,6 +255,13 @@ TESTSUITE_AT = \
+  sptrcreat.at\
+  sptrdiff00.at\
+  sptrdiff01.at\
++ star/gtarfail.at\
++ star/gtarfail2.at\
++ star/multi-fail.at\
++ star/pax-big-10g.at\
++ star/ustar-big-2g.at\
++ star/ustar-big-8g.at\
++ testsuite.at\
+  time01.at\
+  time02.at\
+  truncate.at\
+@@ -255,21 +270,11 @@ TESTSUITE_AT = \
+  update02.at\
+  update03.at\
+  update04.at\
+- volsize.at\
+- volume.at\
+  verbose.at\
+  verify.at\
+  version.at\
+- xform-h.at\
+- xform01.at\
+- xform02.at\
+- xform03.at\
+- star/gtarfail.at\
+- star/gtarfail2.at\
+- star/multi-fail.at\
+- star/ustar-big-2g.at\
+- star/ustar-big-8g.at\
+- star/pax-big-10g.at\
++ volsize.at\
++ volume.at\
+  xattr01.at\
+  xattr02.at\
+  xattr03.at\
+@@ -278,12 +283,10 @@ TESTSUITE_AT = \
+  xattr06.at\
+  xattr07.at\
+  xattr08.at\
+- acls01.at\
+- acls02.at\
+- acls03.at\
+- selnx01.at\
+- selacl01.at\
+- capabs_raw01.at
++ xform-h.at\
++ xform01.at\
++ xform02.at\
++ xform03.at
+ 
+ distclean-local:
+ 	-rm -rf download
+@@ -291,7 +294,7 @@ distclean-local:
+ TESTSUITE = $(srcdir)/testsuite
+ 
+ AUTOTEST = $(AUTOM4TE) --language=autotest
+-$(TESTSUITE): package.m4 $(TESTSUITE_AT)
++$(TESTSUITE): compress.m4 package.m4 $(TESTSUITE_AT)
+ 	$(AUTOTEST) -I $(srcdir) testsuite.at -o $@.tmp
+ 	mv $@.tmp $@
+ 
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar/0002-tests-check-for-recently-fixed-bug.patch b/meta/recipes-extended/tar/tar/0002-tests-check-for-recently-fixed-bug.patch
new file mode 100644
index 0000000000..6cd8c5510f
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/0002-tests-check-for-recently-fixed-bug.patch
@@ -0,0 +1,60 @@
+From 0f0722df45ec520d0dac7c9ad7e69165e9140931 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 7 Oct 2022 15:22:07 -0700
+Subject: tests: check for recently-fixed bug
+
+* tests/exclude17.at: New file.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=0f0722df45ec520d0dac7c9ad7e69165e9140931]
+
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
+
+---
+ tests/exclude17.at | 35 +++++++++++++++++++++++++++++++++++
+ 1 files changed, 35 insertions(+)
+ create mode 100644 tests/exclude17.at
+
+diff --git a/tests/exclude17.at b/tests/exclude17.at
+new file mode 100644
+index 0000000..4162b2b
+--- /dev/null
++++ b/tests/exclude17.at
+@@ -0,0 +1,35 @@
++# Process this file with autom4te to create testsuite. -*- Autotest -*-
++#
++# Test suite for GNU tar.
++# Copyright 2013-2022 Free Software Foundation, Inc.
++
++# This file is part of GNU tar.
++
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++AT_SETUP([--exclude-vcs-ignores memory allocation])
++AT_KEYWORDS([exclude exclude17])
++
++AT_TAR_CHECK([
++mkdir dir
++cd dir
++echo '*.o' >.cvsignore
++tar -cf - --exclude-vcs-ignores . | tar -tf -
++],
++[0],
++[./
++./.cvsignore
++])
++
++AT_CLEANUP
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar/0003-Exclude-VCS-directory-with-writing-from-an-archive.patch b/meta/recipes-extended/tar/tar/0003-Exclude-VCS-directory-with-writing-from-an-archive.patch
new file mode 100644
index 0000000000..577a9ba997
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/0003-Exclude-VCS-directory-with-writing-from-an-archive.patch
@@ -0,0 +1,112 @@
+From 4f814e0e4c673f86dc65a557f7e55f6b5efd1529 Mon Sep 17 00:00:00 2001
+From: Anton Makrushin <makrusan@gmail.com>
+Date: Mon, 20 Mar 2023 20:05:42 +0530
+Subject: Exclude VCS directory with writing from an archive
+
+See https://savannah.gnu.org/bugs/?62859
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/tar.git/commit/?id=4f814e0e4c673f86dc65a557f7e55f6b5efd1529]
+
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
+
+---
+ tests/exclude18.at | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 87 insertions(+)
+ create mode 100644 tests/exclude18.at
+
+diff --git a/tests/exclude18.at b/tests/exclude18.at
+new file mode 100644
+index 0000000..64aaa52
+--- /dev/null
++++ b/tests/exclude18.at
+@@ -0,0 +1,87 @@
++# Process this file with autom4te to create testsuite. -*- Autotest -*-
++
++# Test suite for GNU tar.
++# Copyright 2004-2023 Free Software Foundation, Inc.
++
++# This file is part of GNU tar.
++
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# Test --exclude-vcs option with subcommands: EXTRACT, LIST, DIFF.
++# Check VCS directory with files, and empty.
++#
++# Ref: https://savannah.gnu.org/bugs/?62859
++# Wed 03 Aug 2022 04:06:28 PM UTC, original submission:  Quote
++# Mohamed Akram <mohdakram>
++# > The --exclude-vcs flag seems to exclude .gitignore but not .git when
++# extracting.
++
++AT_SETUP([--exclude-vcs extract list compare])
++AT_KEYWORDS([exclude-vcs extract list compare exclude18])
++
++AT_TAR_CHECK([
++AT_SORT_PREREQ
++mkdir gitrepo
++cd gitrepo
++
++# Make an empty VCS directory:
++mkdir .svn
++
++# Make a VCS directory with a file:
++mkdir .git
++touch .git/_A
++
++# Make a VCS file:
++touch .gitignore
++
++# Make non-VCS files:
++touch .git_B
++touch _C
++
++# Create an archive, include VCS:
++cd ..
++tar -cf gitrepo.tar gitrepo
++rm -r gitrepo
++
++echo Extract:
++tar -xvf gitrepo.tar --exclude-vcs | sort
++
++echo
++echo List:
++tar -tf gitrepo.tar --exclude-vcs | sort
++
++echo
++echo Diff:
++tar -dvf gitrepo.tar --exclude-vcs gitrepo | sort
++
++],
++[0],
++[Extract:
++gitrepo/
++gitrepo/.git_B
++gitrepo/_C
++
++List:
++gitrepo/
++gitrepo/.git_B
++gitrepo/_C
++
++Diff:
++gitrepo/
++gitrepo/.git_B
++gitrepo/_C
++],
++[])
++
++AT_CLEANUP
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-extended/tar/tar/run-ptest
new file mode 100644
index 0000000000..185b33d61a
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+# Define tar test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+# clear log
+rm -rf testsuite.dir
+rm -rf testsuite.log
+
+./testsuite --am-fmt
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index 4dbd418b60..c7bd1d195e 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -42,6 +42,40 @@ do_install:append:class-target() {
     fi
 }
 
+# add for ptest support
+SRC_URI += " \
+    file://run-ptest \
+    file://0001-tests-fix-TESTSUITE_AT.patch \
+    file://0002-tests-check-for-recently-fixed-bug.patch \
+    file://0003-Exclude-VCS-directory-with-writing-from-an-archive.patch \
+"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/gnu/ check
+    oe_runmake -C ${B}/lib/ check
+    oe_runmake -C ${B}/rmt/ check
+    oe_runmake -C ${B}/src/ check
+    rm -rf ${S}/tests/testsuite
+    oe_runmake -C ${B}/tests/ testsuite
+    oe_runmake -C ${B}/tests/ genfile checkseekhole ckmtime
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "/abs_/d" ${D}${PTEST_PATH}/tests/atconfig
+    echo "abs_builddir=${PTEST_PATH}/tests/" >> ${D}${PTEST_PATH}/tests/atconfig
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    sed -i "/PATH=/d" ${D}${PTEST_PATH}/tests/atlocal
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/checkseekhole ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/ckmtime ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


