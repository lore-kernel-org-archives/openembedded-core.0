Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TBeab-0007jB-93
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:30:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Sep 2012 21:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,407,1344236400"; d="scan'208";a="191880928"
Received: from unknown (HELO localhost) ([10.255.13.174])
	by orsmga001.jf.intel.com with ESMTP; 11 Sep 2012 21:17:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 11 Sep 2012 21:17:06 -0700
Message-Id: <8b80bb0ac1b1cf845fccb837e789796c47b328c7.1347423112.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1347423112.git.dvhart@linux.intel.com>
References: <cover.1347423112.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1347423112.git.dvhart@linux.intel.com>
References: <cover.1347423112.git.dvhart@linux.intel.com>
Subject: [PATCH 2/3] rt-tests: Add hwlatdetect package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 04:30:13 -0000

Split out rt-tests into rt-tests and hwlatdetect packages as the latter
requires python and we want to be able to install the core rt-tests on
minimal systems without python.

This also addresses QA warnings about the hwlatdetect files not being
packaged.

Add an RRECOMMENDS on the hwlat kernel module package for the new
hwlatdetect package as the python test requires the kernel module to
function properly (but we probably don't want to kill a build if the
exact kernel module package is not available).

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch | 35 +++++++++++
 ...02-rt-tests-Break-out-install_hwlatdetect.patch | 68 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb       | 24 ++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              | 18 ++++++
 meta/recipes-rt/rt-tests/rt-tests_0.84.bb          | 15 ++---
 5 files changed, 149 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 create mode 100644 meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb
 create mode 100644 meta/recipes-rt/rt-tests/rt-tests.inc

diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
new file mode 100644
index 0000000..8b493eb
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
@@ -0,0 +1,35 @@
+From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001
+Message-Id: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Tue, 11 Sep 2012 15:19:30 -0700
+Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB
+
+Upstream-Status: Submitted
+
+Allow users (build systems) to specify PYLIB. This allows for a
+cross-build-system to specify the target PYLIB rather than the host
+PYLIB.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+CC: Clark Williams <williams@redhat.com>
+CC: John Kacur <jkacur@redhat.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 3a82407..61e2f9f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,7 +23,7 @@ endif
+ CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
+ LDFLAGS ?=
+ 
+-PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
+ 
+ ifndef DEBUG
+ 	CFLAGS	+= -O2
+-- 
+1.7.11.4
+
diff --git a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
new file mode 100644
index 0000000..bc6136f
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
@@ -0,0 +1,68 @@
+From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001
+Message-Id: <af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.git.dvhart@linux.intel.com>
+In-Reply-To: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
+References: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Tue, 11 Sep 2012 14:51:10 -0700
+Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect
+
+Upstream-Status: Submitted
+
+Allow hwlatdetect to be installed independently of the rest of the
+tests. This is convenient for build systems that package it separately
+due to the python dependency.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+CC: Clark Williams <williams@redhat.com>
+CC: John Kacur <jkacur@redhat.com>
+---
+ Makefile | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 61e2f9f..636e63b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -119,21 +119,15 @@ changelog:
+ 	git log >ChangeLog
+ 
+ .PHONY: install
+-install: all
++install: all install_hwlatdetect
+ 	mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man4"
+ 	mkdir -p "$(DESTDIR)$(srcdir)" "$(DESTDIR)$(mandir)/man8"
+ 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
+-	if test -n "$(PYLIB)" ; then \
+-		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
+-		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+-		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+-	fi
+ 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
+ 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
+ 	gzip src/backfire/backfire.4 -c >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
+ 	gzip src/cyclictest/cyclictest.8 -c >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
+ 	gzip src/pi_tests/pi_stress.8 -c >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
+-	gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz"
+ 	gzip src/ptsematest/ptsematest.8 -c >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
+ 	gzip src/sigwaittest/sigwaittest.8 -c >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
+ 	gzip src/svsematest/svsematest.8 -c >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
+@@ -141,6 +135,16 @@ install: all
+ 	gzip src/backfire/sendme.8 -c >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
+ 	gzip src/hackbench/hackbench.8 -c >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
+ 
++.PHONY: install_hwlatdetect
++install_hwlatdetect: hwlatdetect
++	if test -n "$(PYLIB)" ; then \
++		mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man8" ; \
++		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
++		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
++		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
++		gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
++	fi
++
+ .PHONY: release
+ release: clean changelog
+ 	mkdir -p releases
+-- 
+1.7.11.4
+
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb
new file mode 100644
index 0000000..a850a2d
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb
@@ -0,0 +1,24 @@
+pickDESCRIPTION = "Python hardware latency detector"
+HOMEPAGE = "http://git.kernel.org/?p=linux/kernel/git/clrkwllms/rt-tests.git"
+SECTION = "tests"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+RDEPENDS = "python python-subprocess python-textutils"
+RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
+
+require rt-tests.inc
+
+PR = "${INC_PR}.0"
+
+EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
+
+do_compile() {
+	oe_runmake hwlatdetect
+}
+
+do_install() {
+        oe_runmake install_hwlatdetect DESTDIR=${D} SBINDIR=${sbindir} \
+	           MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
+
+FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
new file mode 100644
index 0000000..f511532
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -0,0 +1,18 @@
+# Version v0.84
+SRCREV = "857cdd5320ce1f293f5dbcbec79cc8fe22b0bebf"
+
+PR = "r0"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
+           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
+           file://0002-rt-tests-Break-out-install_hwlatdetect.patch"
+
+INC_PR = "r0"
+
+S = "${WORKDIR}/git"
+
+# need to append rt-tests' default CFLAGS to ours
+CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli"
+
+# calling 'uname -m' is broken on crossbuilds
+EXTRA_OEMAKE = "NUMA=0"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.84.bb b/meta/recipes-rt/rt-tests/rt-tests_0.84.bb
index c54936e..c3964d2 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.84.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.84.bb
@@ -6,20 +6,13 @@ LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
                     file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
-# Version v0.84
-SRCREV = "857cdd5320ce1f293f5dbcbec79cc8fe22b0bebf"
 
-PR = "r0"
+require rt-tests.inc
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git"
+PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/git"
-
-# need to append rt-tests' default CFLAGS to ours
-CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli"
-
-# calling 'uname -m' is broken on crossbuilds
-EXTRA_OEMAKE = "NUMA=0"
+# Do not install hwlatdetect
+EXTRA_OEMAKE += "PYLIB=''"
 
 do_install() {
         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
-- 
1.7.11.4



