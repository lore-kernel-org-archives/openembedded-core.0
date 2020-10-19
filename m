Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.6573.1603143742162939505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 14:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: doD4kE2TEC1FY7pOvNEV7dR9yr8UUIixfqgRwl1XHWgfbn6mZwjjSdj5ncdtwELVq9NRHzIXKO
 ezeRr1qlp41A==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="251805866"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="251805866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
IronPort-SDR: 3jfyHfoKVA/DozNjyniXMZzf0YD+A8CMVaoHb7G2oU4Q2/Sd+i/WyyVTHGyBXuxI42sPY6KqHm
 FBkbgb/t/IKw==
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; 
   d="scan'208";a="358958409"
Received: from rewitt-desk0.jf.intel.com ([10.7.159.148])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 14:42:20 -0700
From: "Randy Witt" <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy Witt <randy.e.witt@intel.com>,
	Randy Witt <randy.e.witt@linux.intel.com>
Subject: [PATCH 4/4] rt-tests: Update recipes to use 1.8
Date: Mon, 19 Oct 2020 14:42:14 -0700
Message-Id: <20201019214214.2528690-5-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
References: <20201019214214.2528690-1-randy.e.witt@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Randy Witt <randy.e.witt@intel.com>

John Kacur(the maintainer of rt-tests), recommends "that they use
unstable/devel/latest as the maintained stable branch". I received this
information on IRC, I couldn't find it documented anywhere else.

This means that both rt-tests and hwlatdetect can be updated to be 1.8,
the latest release on unstable/devel/latest.

0001-gzip-with-n-for-build-reproducibilty.patch was removed because
upstream now uses "gzip -n" by default.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 ...Allow-for-CC-and-AR-to-be-overridden.patch | 28 +++++++++
 ...{hwlatdetect_1.1.bb => hwlatdetect_1.8.bb} |  0
 ...gzip-with-n-for-build-reproducibilty.patch | 62 -------------------
 meta/recipes-rt/rt-tests/rt-tests.inc         | 11 +---
 .../{rt-tests_1.1.bb => rt-tests_1.8.bb}      |  9 ++-
 5 files changed, 35 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.1.bb => hwlatdetect_1.8.bb} (100%)
 delete mode 100644 meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch
 rename meta/recipes-rt/rt-tests/{rt-tests_1.1.bb => rt-tests_1.8.bb} (70%)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
new file mode 100644
index 00000000000..c18928ed02d
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -0,0 +1,28 @@
+From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17 00:00:00 2001
+From: Randy Witt <randy.e.witt@intel.com>
+Date: Fri, 16 Oct 2020 16:54:30 -0700
+Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
+
+The Makefile previously allowed for this but it was removed upstream in
+commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
+
+Signed-off-by: Randy Witt <randy.e.witt@intel.com>
+
+Upstream-Status: Inappropriate [other]
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 05fc5ed..7a289c8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 1.8
+-CC = $(CROSS_COMPILE)gcc
+-AR = $(CROSS_COMPILE)ar
++CC ?= $(CROSS_COMPILE)gcc
++AR ?= $(CROSS_COMPILE)ar
+ 
+ OBJDIR = bld
+ 
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch b/meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch
deleted file mode 100644
index 3bafbbe08f0..00000000000
--- a/meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From aabf518e2e61a882b925f9d2ac53dafa7a041a0a Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Tue, 25 Feb 2020 22:58:59 +0000
-Subject: [PATCH] gzip with -n for build reproducibilty
-
-The date can get encoded in the header of the gz file, which
-causes the binary files between two different builds of the
-same data to be different. Add -n for reproducibilty
-
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
-Upstream-Status: Submitted [mailinglist]
-
----
- Makefile | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a54d82b..e9f0d5a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -168,17 +168,17 @@ install: all install_hwlatdetect
- 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
- 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
- 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
--	gzip -c src/backfire/backfire.4 >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
--	gzip -c src/cyclictest/cyclictest.8 >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
--	gzip -c src/pi_tests/pi_stress.8 >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
--	gzip -c src/ptsematest/ptsematest.8 >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
--	gzip -c src/rt-migrate-test/rt-migrate-test.8 >"$(DESTDIR)$(mandir)/man8/rt-migrate-test.8.gz"
--	gzip -c src/sigwaittest/sigwaittest.8 >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
--	gzip -c src/svsematest/svsematest.8 >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
--	gzip -c src/pmqtest/pmqtest.8 >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
--	gzip -c src/backfire/sendme.8 >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
--	gzip -c src/hackbench/hackbench.8 >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
--	gzip -c src/signaltest/signaltest.8 >"$(DESTDIR)$(mandir)/man8/signaltest.8.gz"
-+	gzip -nc src/backfire/backfire.4 >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
-+	gzip -nc src/cyclictest/cyclictest.8 >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
-+	gzip -nc src/pi_tests/pi_stress.8 >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
-+	gzip -nc src/ptsematest/ptsematest.8 >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
-+	gzip -nc src/rt-migrate-test/rt-migrate-test.8 >"$(DESTDIR)$(mandir)/man8/rt-migrate-test.8.gz"
-+	gzip -nc src/sigwaittest/sigwaittest.8 >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
-+	gzip -nc src/svsematest/svsematest.8 >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
-+	gzip -nc src/pmqtest/pmqtest.8 >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
-+	gzip -nc src/backfire/sendme.8 >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
-+	gzip -nc src/hackbench/hackbench.8 >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
-+	gzip -nc src/signaltest/signaltest.8 >"$(DESTDIR)$(mandir)/man8/signaltest.8.gz"
- 
- .PHONY: install_hwlatdetect
- install_hwlatdetect: hwlatdetect
-@@ -187,7 +187,7 @@ install_hwlatdetect: hwlatdetect
- 		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
- 		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
- 		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
--		gzip -c src/hwlatdetect/hwlatdetect.8 >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
-+		gzip -nc src/hwlatdetect/hwlatdetect.8 >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
- 	fi
- 
- .PHONY: tarball
--- 
-2.23.0
-
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 6e3afafce4c..5d28c7e63eb 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,12 +1,7 @@
-# Version 1.1
-SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
+# Version 1.8
+SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
-# 1.2 and up seem to be development versions
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-8])(\d+(\.\d+)+))"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
 
 S = "${WORKDIR}/git"
-
-# calling 'uname -m' is broken on crossbuilds
-EXTRA_OEMAKE = "NUMA=0"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb b/meta/recipes-rt/rt-tests/rt-tests_1.8.bb
similarity index 70%
rename from meta/recipes-rt/rt-tests/rt-tests_1.1.bb
rename to meta/recipes-rt/rt-tests/rt-tests_1.8.bb
index dad252b4ed3..2834cabcd49 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.8.bb
@@ -1,11 +1,9 @@
 SUMMARY = "Real-Time preemption testcases"
 HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
 SECTION = "tests"
-DEPENDS = "linux-libc-headers virtual/libc"
+DEPENDS = "linux-libc-headers virtual/libc numactl"
 LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=e768b8da44555fe63f65e5c497844cb5 \
-                    file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
 inherit ptest
@@ -13,7 +11,7 @@ inherit ptest
 SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
-            file://0001-gzip-with-n-for-build-reproducibilty.patch \
+            file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
            "
 
 # rt-tests needs PI mutex support in libc
@@ -34,3 +32,4 @@ do_install_ptest() {
 RDEPENDS_${PN}-ptest += " stress-ng python3 python3-multiprocessing python3-datetime python3-misc"
 
 FILES_${PN} += "${prefix}/src/backfire"
+RDEPENDS_${PN} += "bash"
-- 
2.26.2

