Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TBeap-0007kB-Uu
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:30:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Sep 2012 21:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,407,1344236400"; d="scan'208";a="191671675"
Received: from unknown (HELO localhost) ([10.255.13.174])
	by azsmga001.ch.intel.com with ESMTP; 11 Sep 2012 21:17:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 11 Sep 2012 21:17:05 -0700
Message-Id: <f2868b4d6561fee8546b1b5739ca8887dc689eec.1347423112.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1347423112.git.dvhart@linux.intel.com>
References: <cover.1347423112.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1347423112.git.dvhart@linux.intel.com>
References: <cover.1347423112.git.dvhart@linux.intel.com>
Subject: [PATCH 1/3] rt-tests: Update to 0.84, use the kernel.org git repository
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
X-List-Received-Date: Wed, 12 Sep 2012 04:30:28 -0000

The maintainer of rt-tests has recreated the git repository on kernel.org and
has stated that kernel.org is now the official source for rt-tests.

Update to 0.84. Remove the user cflags and ldflags patch as it is
included in the 0.84 release.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../makefile-support-user-cflags-ldflags.patch     | 89 ----------------------
 .../{rt-tests_0.83.bb => rt-tests_0.84.bb}         | 11 +--
 2 files changed, 4 insertions(+), 96 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch
 rename meta/recipes-rt/rt-tests/{rt-tests_0.83.bb => rt-tests_0.84.bb} (79%)

diff --git a/meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch b/meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch
deleted file mode 100644
index 09a5d7b..0000000
--- a/meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From: Darren Hart <dvhart@linux.intel.com>
-Subject: [PATCH rt-tests RFC 4/6] Makefile: Support user supplied CFLAGS and LDFLAGS
-Date: Thu, 22 Mar 2012 02:14:04 +0100
-
-Accept user supplied CFLAGS and LDFLAGS, overwriting the
-Makefile supplied versions. This can cause the build to
-fail if the user does not provide at least what the Makefile
-defines, but so be it.
-
-Upstream-Status: Submitted [linux-rt-users@vger.kernel.org]
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-CC: Clark Williams <williams@redhat.com>
-CC: John Kacur <jkacur@redhat.com>
-CC: Denys Dmytriyenko <denis@denix.org>
-Signed-off-by: John Kacur <jkacur@redhat.com>
----
- Makefile |   25 +++++++++++++------------
- 1 files changed, 13 insertions(+), 12 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4038dcc..e1edf6c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,7 +20,8 @@ ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
- NUMA 	:= 1
- endif
- 
--CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
-+CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
-+LDFLAGS ?=
- 
- PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
- 
-@@ -61,41 +62,41 @@ all: $(TARGETS) hwlatdetect
- -include $(sources:.c=.d)
- 
- cyclictest: cyclictest.o rt-utils.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(NUMA_LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(NUMA_LIBS)
- 
- signaltest: signaltest.o rt-utils.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- pi_stress: pi_stress.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- hwlatdetect:  src/hwlatdetect/hwlatdetect.py
- 	chmod +x src/hwlatdetect/hwlatdetect.py
- 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
- 
- rt-migrate-test: rt-migrate-test.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- ptsematest: ptsematest.o rt-utils.o rt-get_cpu.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
- 
- sigwaittest: sigwaittest.o rt-utils.o rt-get_cpu.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
- 
- svsematest: svsematest.o rt-utils.o rt-get_cpu.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
- 
- pmqtest: pmqtest.o rt-utils.o rt-get_cpu.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
- 
- sendme: sendme.o rt-utils.o rt-get_cpu.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
- 
- pip_stress: pip_stress.o error.o rt-utils.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- hackbench: hackbench.o
--	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- CLEANUP  = $(TARGETS) *.o .depend *.*~ *.orig *.rej rt-tests.spec *.d
- CLEANUP += $(if $(wildcard .git), ChangeLog)
--- 
-1.7.7.6
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.84.bb
similarity index 79%
rename from meta/recipes-rt/rt-tests/rt-tests_0.83.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.84.bb
index 6c4931e..c54936e 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.84.bb
@@ -6,15 +6,12 @@ LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
                     file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
-# Version v0.83
-SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
+# Version v0.84
+SRCREV = "857cdd5320ce1f293f5dbcbec79cc8fe22b0bebf"
 
-# git -> 0.83 needs a PE bump
-PE = "1"
-PR = "r2"
+PR = "r0"
 
-SRC_URI = "git://github.com/clrkwllms/rt-tests.git \
-           file://makefile-support-user-cflags-ldflags.patch"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.11.4



