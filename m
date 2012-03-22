Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAYBQ-0000m5-JS
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 03:55:24 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900F03MD1J392@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:46:14 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6C3BD2016D; Wed,
	21 Mar 2012 22:46:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:46:05 -0400
Message-id: <1332384365-32497-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
In-reply-to: <1332384365-32497-1-git-send-email-denis@denix.org>
References: <1332384365-32497-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] rt-tests: add patch to support passing CFLAGS/LDFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 02:55:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Enable passing OE and Distro-specific CFLAGS/LDFLAGS to the Makefile.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
Feel free to drop this, if the patch gets accepted upstream soon enough.

 .../makefile-support-user-cflags-ldflags.patch     |   89 ++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb          |    8 +-
 2 files changed, 94 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch

diff --git a/meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch b/meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch
new file mode 100644
index 0000000..09a5d7b
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch
@@ -0,0 +1,89 @@
+From: Darren Hart <dvhart@linux.intel.com>
+Subject: [PATCH rt-tests RFC 4/6] Makefile: Support user supplied CFLAGS and LDFLAGS
+Date: Thu, 22 Mar 2012 02:14:04 +0100
+
+Accept user supplied CFLAGS and LDFLAGS, overwriting the
+Makefile supplied versions. This can cause the build to
+fail if the user does not provide at least what the Makefile
+defines, but so be it.
+
+Upstream-Status: Submitted [linux-rt-users@vger.kernel.org]
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+CC: Clark Williams <williams@redhat.com>
+CC: John Kacur <jkacur@redhat.com>
+CC: Denys Dmytriyenko <denis@denix.org>
+Signed-off-by: John Kacur <jkacur@redhat.com>
+---
+ Makefile |   25 +++++++++++++------------
+ 1 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4038dcc..e1edf6c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,8 @@ ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
+ NUMA 	:= 1
+ endif
+ 
+-CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
++CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
++LDFLAGS ?=
+ 
+ PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
+ 
+@@ -61,41 +62,41 @@ all: $(TARGETS) hwlatdetect
+ -include $(sources:.c=.d)
+ 
+ cyclictest: cyclictest.o rt-utils.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(NUMA_LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(NUMA_LIBS)
+ 
+ signaltest: signaltest.o rt-utils.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ pi_stress: pi_stress.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ hwlatdetect:  src/hwlatdetect/hwlatdetect.py
+ 	chmod +x src/hwlatdetect/hwlatdetect.py
+ 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
+ 
+ rt-migrate-test: rt-migrate-test.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ ptsematest: ptsematest.o rt-utils.o rt-get_cpu.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
+ 
+ sigwaittest: sigwaittest.o rt-utils.o rt-get_cpu.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
+ 
+ svsematest: svsematest.o rt-utils.o rt-get_cpu.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
+ 
+ pmqtest: pmqtest.o rt-utils.o rt-get_cpu.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
+ 
+ sendme: sendme.o rt-utils.o rt-get_cpu.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
+ 
+ pip_stress: pip_stress.o error.o rt-utils.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ hackbench: hackbench.o
+-	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ CLEANUP  = $(TARGETS) *.o .depend *.*~ *.orig *.rej rt-tests.spec *.d
+ CLEANUP += $(if $(wildcard .git), ChangeLog)
+-- 
+1.7.7.6
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index 1a91e86..6c4931e 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -11,13 +11,15 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
 
 # git -> 0.83 needs a PE bump
 PE = "1"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
+SRC_URI = "git://github.com/clrkwllms/rt-tests.git \
+           file://makefile-support-user-cflags-ldflags.patch"
 
 S = "${WORKDIR}/git"
 
-CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli ${LDFLAGS}"
+# need to append rt-tests' default CFLAGS to ours
+CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli"
 
 # calling 'uname -m' is broken on crossbuilds
 EXTRA_OEMAKE = "NUMA=0"
-- 
1.7.8.5



