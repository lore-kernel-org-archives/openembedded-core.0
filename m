Return-Path: <joshc@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3018973243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 12:24:38 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8MCOcb0030456 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 07:24:38 -0500
Received: from jcartwri.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092207243816-149038 ;
	Tue, 22 Sep 2015 07:24:38 -0500 
Received: by jcartwri.amer.corp.natinst.com (Postfix, from userid 1000)
	id 35517300914; Tue, 22 Sep 2015 07:24:38 -0500 (CDT)
From: Josh Cartwright <joshc@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 07:24:38 -0500
Message-Id: <1442924678-17427-1-git-send-email-joshc@ni.com>
X-Mailer: git-send-email 2.5.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/22/2015 07:24:38 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/22/2015 07:24:38 AM,
	Serialize complete at 09/22/2015 07:24:38 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-22_03:, , signatures=0
Subject: [PATCH] rt-tests: bump to v0.94
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
X-List-Received-Date: Tue, 22 Sep 2015 12:24:40 -0000

All of the rt-tests patches that OE has been carrying have been
upstreamed or superceded by changes in the v0.94 release.

Adjust SRC_URI to point to canonical upstream git repo, instead of a
development tree.

There was a notable change upstream that required slight reworking of
the recipe.  rt-tests now joins other kbuild-inspired projects by making
use of a CROSS_COMPILE flag to indicate the compiler prefix.

Previously TOOLCHAIN_OPTIONS were conveyed via $CC directly, however,
this does not work with CROSS_COMPILE.  Workaround this by both
specifying CROSS_COMPILE, and feeding the rt-tests build system the
proper $(HOST_CC_ARCH)$(TOOLCHAIN_OPTIONS) via $CFLAGS.

Signed-off-by: Josh Cartwright <joshc@ni.com>
---
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch | 35 -----------
 ...02-rt-tests-Break-out-install_hwlatdetect.patch | 68 ----------------------
 .../rt-tests/files/Makefile-fix-gzip-command.patch | 30 ----------
 .../rt-tests/files/fix-re-install-failure.patch    | 48 ---------------
 .../rt-tests/files/hackbench-fix-error-check.patch | 41 -------------
 .../{hwlatdetect_0.92.bb => hwlatdetect_0.94.bb}   |  0
 meta/recipes-rt/rt-tests/rt-tests.inc              | 14 ++---
 .../{rt-tests_0.92.bb => rt-tests_0.94.bb}         |  4 +-
 8 files changed, 7 insertions(+), 233 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
 delete mode 100644 meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.92.bb => hwlatdetect_0.94.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.92.bb => rt-tests_0.94.bb} (89%)

diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
deleted file mode 100644
index 8b493eb..0000000
--- a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001
-Message-Id: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
-From: Darren Hart <dvhart@linux.intel.com>
-Date: Tue, 11 Sep 2012 15:19:30 -0700
-Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB
-
-Upstream-Status: Submitted
-
-Allow users (build systems) to specify PYLIB. This allows for a
-cross-build-system to specify the target PYLIB rather than the host
-PYLIB.
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-CC: Clark Williams <williams@redhat.com>
-CC: John Kacur <jkacur@redhat.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 3a82407..61e2f9f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -23,7 +23,7 @@ endif
- CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
- LDFLAGS ?=
- 
--PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
-+PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
- 
- ifndef DEBUG
- 	CFLAGS	+= -O2
--- 
-1.7.11.4
-
diff --git a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
deleted file mode 100644
index bc6136f..0000000
--- a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001
-Message-Id: <af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.git.dvhart@linux.intel.com>
-In-Reply-To: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
-References: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
-From: Darren Hart <dvhart@linux.intel.com>
-Date: Tue, 11 Sep 2012 14:51:10 -0700
-Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect
-
-Upstream-Status: Submitted
-
-Allow hwlatdetect to be installed independently of the rest of the
-tests. This is convenient for build systems that package it separately
-due to the python dependency.
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-CC: Clark Williams <williams@redhat.com>
-CC: John Kacur <jkacur@redhat.com>
----
- Makefile | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 61e2f9f..636e63b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -119,21 +119,15 @@ changelog:
- 	git log >ChangeLog
- 
- .PHONY: install
--install: all
-+install: all install_hwlatdetect
- 	mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man4"
- 	mkdir -p "$(DESTDIR)$(srcdir)" "$(DESTDIR)$(mandir)/man8"
- 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
--	if test -n "$(PYLIB)" ; then \
--		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
--		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
--		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
--	fi
- 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
- 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
- 	gzip src/backfire/backfire.4 -c >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
- 	gzip src/cyclictest/cyclictest.8 -c >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
- 	gzip src/pi_tests/pi_stress.8 -c >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
--	gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz"
- 	gzip src/ptsematest/ptsematest.8 -c >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
- 	gzip src/sigwaittest/sigwaittest.8 -c >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
- 	gzip src/svsematest/svsematest.8 -c >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
-@@ -141,6 +135,16 @@ install: all
- 	gzip src/backfire/sendme.8 -c >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
- 	gzip src/hackbench/hackbench.8 -c >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
- 
-+.PHONY: install_hwlatdetect
-+install_hwlatdetect: hwlatdetect
-+	if test -n "$(PYLIB)" ; then \
-+		mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man8" ; \
-+		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
-+		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
-+		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
-+		gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
-+	fi
-+
- .PHONY: release
- release: clean changelog
- 	mkdir -p releases
--- 
-1.7.11.4
-
diff --git a/meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch b/meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
deleted file mode 100644
index 0a35ddc..0000000
--- a/meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 07b5ed42d7041ccc084889eaa96817aa097bf461 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 3 Feb 2015 03:10:25 +0000
-Subject: [PATCH] Makefile: fix gzip command
-
-The "-c" doesn't work in command "gzip file -c", need use "gzip -c file"
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 219a591..c7d147a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -144,7 +144,7 @@ install_hwlatdetect: hwlatdetect
- 		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
- 		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
- 		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
--		gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
-+		gzip -c src/hwlatdetect/hwlatdetect.8 >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
- 	fi
- 
- .PHONY: release
--- 
-2.0.1
-
diff --git a/meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch b/meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
deleted file mode 100644
index e38ec92..0000000
--- a/meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Currently gzip on host is used. If host gzip is provided by pigz, it fails to
-redo install that pigz can't handle the option after file name. When run:
-
-gzip src/backfire/backfire.4 -c > OUTPUT_FILE
-
-File src/backfire/backfire.4 is zipped into backfire.4.gz but the OUTPUT_FILE
-is empty. When rerun do_install, it shows warning:
-
-| gzip: src/backfire/backfire.4 does not exist -- skipping
-
-and empty manual gzip files are created:
-
-$ file image/usr/share/man/man4/backfire.4.gz
-image/usr/share/man/man4/backfire.4.gz: empty
-
-Fix it by putting option '-c' before the file name.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
---- git/Makefile.orig	2014-11-14 15:47:26.406638419 +0800
-+++ git/Makefile	2014-11-14 15:46:53.890637533 +0800
-@@ -127,15 +127,15 @@
- 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
- 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
- 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
--	gzip src/backfire/backfire.4 -c >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
--	gzip src/cyclictest/cyclictest.8 -c >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
--	gzip src/pi_tests/pi_stress.8 -c >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
--	gzip src/ptsematest/ptsematest.8 -c >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
--	gzip src/sigwaittest/sigwaittest.8 -c >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
--	gzip src/svsematest/svsematest.8 -c >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
--	gzip src/pmqtest/pmqtest.8 -c >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
--	gzip src/backfire/sendme.8 -c >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
--	gzip src/hackbench/hackbench.8 -c >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
-+	gzip -c src/backfire/backfire.4 >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
-+	gzip -c src/cyclictest/cyclictest.8 >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
-+	gzip -c src/pi_tests/pi_stress.8 >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
-+	gzip -c src/ptsematest/ptsematest.8 >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
-+	gzip -c src/sigwaittest/sigwaittest.8 >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
-+	gzip -c src/svsematest/svsematest.8 >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
-+	gzip -c src/pmqtest/pmqtest.8 >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
-+	gzip -c src/backfire/sendme.8 >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
-+	gzip -c src/hackbench/hackbench.8 >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
- 
- .PHONY: install_hwlatdetect
- install_hwlatdetect: hwlatdetect
diff --git a/meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch b/meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
deleted file mode 100644
index d17fdff..0000000
--- a/meta/recipes-rt/rt-tests/files/hackbench-fix-error-check.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-childinfo_t is a union that contains both signed (error) and unsigned
-(threadid) members. Thus a large threadid could appear as a negative error
-value, which will cause unexpected failures.
-
-childinfo_t should be changed to a struct, but it could potentially affect the
-performance. So we keep it as a union but only check error against -1. There is
-still a chance of false alarm but it's small.
-
-Upstream-Status: Pending
-
-Signed-off-by: Song.Li <Song.Li@windriver.com>
-Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
----
- src/hackbench/hackbench.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/hackbench/hackbench.c b/src/hackbench/hackbench.c
-index 8baeb23..dc0de8f 100644
---- a/src/hackbench/hackbench.c
-+++ b/src/hackbench/hackbench.c
-@@ -317,7 +317,7 @@ static unsigned int group(childinfo_t *child,
- 		ctx->wakefd = wakefd;
- 
- 		child[tab_offset+i] = create_worker(ctx, (void *)(void *)receiver);
--		if( child[tab_offset+i].error < 0 ) {
-+		if( child[tab_offset+i].error == -1 ) {
- 			return (i > 0 ? i-1 : 0);
- 		}
- 		snd_ctx->out_fds[i] = fds[1];
-@@ -332,7 +332,7 @@ static unsigned int group(childinfo_t *child,
- 		snd_ctx->num_fds = num_fds;
- 
- 		child[tab_offset+num_fds+i] = create_worker(snd_ctx, (void *)(void *)sender);
--		if( child[tab_offset+num_fds+i].error < 0 ) {
-+		if( child[tab_offset+num_fds+i].error == -1 ) {
- 			return (num_fds+i)-1;
- 		}
- 	}
--- 
-1.7.9.5
-
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.92.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.94.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.92.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_0.94.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 871db13..4e099df 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,14 +1,8 @@
-# Version v0.92
-PV = "0.92"
-SRCREV = "5f9f1e3fe327440a9d405f4af8feb16ff7a909eb"
+# Version v0.94
+PV = "0.94"
+SRCREV = "a8fd81efa718ec449d90cba8f41123ed521bd12b"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
-           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
-           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
-           file://hackbench-fix-error-check.patch \
-           file://Makefile-fix-gzip-command.patch \
-           file://fix-re-install-failure.patch \
-"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.92.bb b/meta/recipes-rt/rt-tests/rt-tests_0.94.bb
similarity index 89%
rename from meta/recipes-rt/rt-tests/rt-tests_0.92.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.94.bb
index fbe2f66..7d70392 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.92.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.94.bb
@@ -14,7 +14,9 @@ SRC_URI += "file://run-ptest \
             file://rt_bmark.py \
            "
 # Do not install hwlatdetect
-EXTRA_OEMAKE += "PYLIB=''"
+EXTRA_OEMAKE += "PYLIB='' CROSS_COMPILE=${TARGET_PREFIX}"
+
+CFLAGS_prepend = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 
 do_install() {
         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
-- 
2.5.1


