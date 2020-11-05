Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3755.1604555570970083275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 21:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: rebecca.swee.fun.chang@intel.com)
IronPort-SDR: PYNkZlQ49VoEVlUAZp4AIsTjDbyQ9c0tEf6AszDO/geNHzSy1MkaRKQ+6OWsLWKeTDmiKzgAOg
 RtrhAfSDCdlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="254039304"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="254039304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 21:52:48 -0800
IronPort-SDR: 9SUtBSWVQ7IpHaBu3DENEgwt0w70XG4kbCSUiVG3T2WH5dvNeNX8yADZg7ayYpaPfNxaVKIxiy
 VCVF55UCvCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="358316312"
Received: from unknown (HELO pg-gsrd-build.png.intel.com) ([10.226.216.131])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2020 21:52:46 -0800
From: "Rebecca Chang Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/4] numactl: Add the recipe for numactl
Date: Thu,  5 Nov 2020 13:39:51 +0000
Message-Id: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.17.1

From: Randy Witt <randy.e.witt@intel.com>

This is a direct copy of numactl from meta-openembedded. numactl is
being moved to oe-core since the latest versions of rt-tests(which is in
oe-core) require libnuma.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dda815792b0939b2f233aa3ec7c140fc114a37d1)
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../numactl/0001-define-run-test-target.patch |  32 ++++++
 ...1-numademo-fix-error-on-32bit-system.patch | 100 ++++++++++++++++++
 .../numactl/Fix-the-test-output-format.patch  |  64 +++++++++++
 meta/recipes-support/numactl/numactl/Makefile |   7 ++
 .../recipes-support/numactl/numactl/run-ptest |   9 ++
 meta/recipes-support/numactl/numactl_git.bb   |  60 +++++++++++
 6 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
 create mode 100644 meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
 create mode 100644 meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
 create mode 100644 meta/recipes-support/numactl/numactl/Makefile
 create mode 100755 meta/recipes-support/numactl/numactl/run-ptest
 create mode 100644 meta/recipes-support/numactl/numactl_git.bb

diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
new file mode 100644
index 0000000000..78ffb22f89
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -0,0 +1,32 @@
+rename test target as run-test
+
+Upstream-Statue: Pending
+
+test target not only compile the test files, but also run them, which is
+not suitable for cross-compile environment, so rename it as run-test.
+
+and define test target to compile the test files.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b6db339..de176c4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
+ test_numademo: numademo
+ 	./numademo -t -e 10M
+ 
+-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
++test: all $(check_PROGRAMS)
++
++run-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
+ 
+ TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch b/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
new file mode 100644
index 0000000000..506101711a
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
@@ -0,0 +1,100 @@
+From 68485f8516884377e54c623b0deff73f97321d96 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Thu, 19 Sep 2019 04:32:31 -0400
+Subject: [PATCH] numademo: fix error on 32bit system
+
+Error Info on 32bit:
+root@intel-x86:~# numademo -t -e 1M
+Configured Nodes does not match available memory nodes
+
+That's because sizeof(long)=4Word, but sizeof(long long)=8Word
+on 32bit. So (long long) assigning to (long) maybe cause overflow.
+
+long numa_node_size(int node, long *freep)
+{
+    ...
+    long sz = numa_node_size64_int(node, &f2);
+    ~^^~
+    return sz;
+    ...
+}
+long long numa_node_size64(int node, long long *freep)
+~^^   ^^~
+{
+    ...
+}
+
+Unify the return type of above functions.
+
+Upstream-Status: Accepted [next version is after 2.0.13 or 2.0.14]
+[https://github.com/numactl/numactl/commit/a7c4bc790a191d3e42b63850b409c1a72b75a4e1]
+                 Submitted [https://github.com/numactl/numactl/pull/79]
+[The first patch was merged but has a error, then the second fix it.]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ libnuma.c         | 4 ++--
+ numa.h            | 2 +-
+ numademo.c        | 2 +-
+ test/move_pages.c | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libnuma.c b/libnuma.c
+index cac8851..8b5c6aa 100644
+--- a/libnuma.c
++++ b/libnuma.c
+@@ -791,10 +791,10 @@ long long numa_node_size64(int node, long long *freep)
+ 
+ make_internal_alias(numa_node_size64);
+ 
+-long numa_node_size(int node, long *freep)
++long long numa_node_size(int node, long long *freep)
+ {
+ 	long long f2;
+-	long sz = numa_node_size64_int(node, &f2);
++	long long sz = numa_node_size64_int(node, &f2);
+ 	if (freep)
+ 		*freep = f2;
+ 	return sz;
+diff --git a/numa.h b/numa.h
+index 3a8c543..268fb1d 100644
+--- a/numa.h
++++ b/numa.h
+@@ -143,7 +143,7 @@ int numa_preferred(void);
+ 
+ /* Return node size and free memory */
+ long long numa_node_size64(int node, long long *freep);
+-long numa_node_size(int node, long *freep);
++long long numa_node_size(int node, long long *freep);
+ 
+ int numa_pagesize(void);
+ 
+diff --git a/numademo.c b/numademo.c
+index a720db0..8c56da8 100644
+--- a/numademo.c
++++ b/numademo.c
+@@ -301,7 +301,7 @@ int max_node, numnodes;
+ int get_node_list(void)
+ {
+         int a, got_nodes = 0;
+-        long free_node_sizes;
++        long long free_node_sizes;
+ 
+         numnodes = numa_num_configured_nodes();
+         node_to_use = (int *)malloc(numnodes * sizeof(int));
+diff --git a/test/move_pages.c b/test/move_pages.c
+index d1d8436..f8ff25d 100644
+--- a/test/move_pages.c
++++ b/test/move_pages.c
+@@ -26,7 +26,7 @@ int *node_to_use;
+ int get_node_list()
+ {
+         int a, got_nodes = 0, max_node, numnodes;
+-        long free_node_sizes;
++        long long free_node_sizes;
+ 
+         numnodes = numa_num_configured_nodes();
+         node_to_use = (int *)malloc(numnodes * sizeof(int));
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
new file mode 100644
index 0000000000..9812ecc8b3
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -0,0 +1,64 @@
+From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 21 Jul 2015 02:01:22 +0900
+Subject: [PATCH] Fix the test output format
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ test/regress  |  6 +++---
+ test/regress2 | 11 +++++------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/test/regress b/test/regress
+index 2ce1705..d086a47 100755
+--- a/test/regress
++++ b/test/regress
+@@ -74,6 +74,7 @@ probe_hardware()
+ 	if [ $numnodes -lt 2 ] ; then
+ 	    echo "need at least two nodes with at least $NEEDPAGES each of"
+ 	    echo "free memory for mempolicy regression tests"
++	    echo "FAIL: numa regress"
+	    exit 77  # Skip test
+ 	fi
+ }
+@@ -207,10 +208,9 @@ main()
+ 	rm A B
+ 
+ 	if [ "$EXIT" = 0 ] ; then
+-		echo '========SUCCESS'
++		echo 'PASS: numactl regress'
+ 	else
+-		echo '========FAILURE'
+-		exit 1
++		echo 'FAIL: numactl regress'
+ 	fi
+ }
+ 
+diff --git a/test/regress2 b/test/regress2
+index aa6ea41..450c510 100755
+--- a/test/regress2
++++ b/test/regress2
+@@ -9,12 +9,11 @@ testdir=`dirname "$0"`
+ export PATH=${builddir}:$PATH
+ 
+ T() {
+-       echo "$@" 
+-       if ! $VALGRIND "$@" ;  then
+-	  echo	$1 FAILED!!!!
+-	  exit 1
+-       fi
+-       echo
++	if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
++	   echo  "FAIL: $1"
++	else
++	   echo "PASS: $1"
++	fi
+ }
+ 
+ # still broken
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-support/numactl/numactl/Makefile b/meta/recipes-support/numactl/numactl/Makefile
new file mode 100644
index 0000000000..9a5134c3f2
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/Makefile
@@ -0,0 +1,7 @@
+.PHONY: regress1 regress2
+
+regress1:
+	cd test ; ./regress
+
+regress2:
+	cd test ; ./regress2
diff --git a/meta/recipes-support/numactl/numactl/run-ptest b/meta/recipes-support/numactl/numactl/run-ptest
new file mode 100755
index 0000000000..215f7c25b9
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+make regress1
+make regress2
+if  numademo -t -e 10M; then
+	echo "PASS: numademo"
+else
+	echo "FAIL: numademo"
+fi
+
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
new file mode 100644
index 0000000000..20b7fed862
--- /dev/null
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -0,0 +1,60 @@
+SUMMARY = "Development package for building Applications that use numa"
+HOMEPAGE = "http://oss.sgi.com/projects/libnuma/" 
+DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
+to run other programs with a specific NUMA policy and a libnuma to do \
+allocations with NUMA policy in applications."
+LICENSE = "GPL-2.0 & LGPL-2.1"
+SECTION = "apps"
+
+inherit autotools-brokensep ptest
+
+LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
+
+SRCREV = "5d9f16722e3df49dc618a9f361bd482559695db7"
+PV = "2.0.13+git${SRCPV}"
+
+SRC_URI = "git://github.com/numactl/numactl \
+    file://Fix-the-test-output-format.patch \
+    file://Makefile \
+    file://run-ptest \
+    file://0001-define-run-test-target.patch \
+    file://0001-numademo-fix-error-on-32bit-system.patch \
+"
+
+S = "${WORKDIR}/git"
+
+# ARM does not currently support NUMA
+COMPATIBLE_HOST = "^((?!arm).*)$"
+
+do_install() {
+    oe_runmake DESTDIR=${D} prefix=${D}/usr install
+    #remove the empty man2 directory
+    rm -r ${D}${mandir}/man2
+}
+
+do_compile_ptest() {
+    oe_runmake test
+}
+
+do_install_ptest() {
+    #install tests binaries
+    local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
+    mynode    nodemap node-parse pagesize prefered randmap realloc_test \
+    tbitmap tshared"
+
+    [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
+    for i in $test_binaries; do
+        install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
+    done
+
+    local test_scripts="checktopology checkaffinity printcpu regress regress2 \
+        shmtest  runltp bind_range"
+    for i in $test_scripts; do
+        install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
+    done
+
+    install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
+    install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
+}
+
+RDEPENDS_${PN}-ptest = "bash"
-- 
2.17.1

