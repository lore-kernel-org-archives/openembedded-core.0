Return-Path: <joshc@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFE071633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:00:04 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t7SCxjVv020338; Fri, 28 Aug 2015 07:59:45 -0500
Received: from jcartwri.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015082807594560-789994 ;
	Fri, 28 Aug 2015 07:59:45 -0500 
Received: by jcartwri.amer.corp.natinst.com (Postfix, from userid 1000)
	id 93052300322; Fri, 28 Aug 2015 07:59:45 -0500 (CDT)
From: Josh Cartwright <joshc@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 07:59:45 -0500
Message-Id: <1440766785-23743-1-git-send-email-joshc@ni.com>
X-Mailer: git-send-email 2.5.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/28/2015 07:59:45 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/28/2015 07:59:45 AM,
	Serialize complete at 08/28/2015 07:59:45 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-28_06:, , signatures=0
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] rt-tests: drop unnecessary added-missing-dependencies.patch
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
X-List-Received-Date: Fri, 28 Aug 2015 13:00:08 -0000

Neither the hackbench target, or the rt-migrate-test target actually
depend on librttest.a; drop this unnecessary patch.

Signed-off-by: Josh Cartwright <joshc@ni.com>
---
 .../files/added-missing-dependencies.patch         | 42 ----------------------
 meta/recipes-rt/rt-tests/rt-tests.inc              |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch

diff --git a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
deleted file mode 100644
index 0bf768e..0000000
--- a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3f948f22d9106a2b957d1d430b16a7c51ccfc067 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@enea.com>
-Date: Tue, 16 Jun 2015 22:53:23 +0200
-Subject: [PATCH] Added missing dependencies
-
-Upstream-Status: Submitted [linux-rt-users]
-
-The following targets missed dependency on librttest.a:
-rt-migrate-test
-hackbench
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a48e759..7a3f192 100644
---- a/Makefile
-+++ b/Makefile
-@@ -85,7 +85,7 @@ hwlatdetect:  src/hwlatdetect/hwlatdetect.py
- 	chmod +x src/hwlatdetect/hwlatdetect.py
- 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
- 
--rt-migrate-test: rt-migrate-test.o
-+rt-migrate-test: rt-migrate-test.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)
- 
- ptsematest: ptsematest.o librttest.a
-@@ -106,7 +106,7 @@ sendme: sendme.o librttest.a
- pip_stress: pip_stress.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS) $(RTTESTLIB)
- 
--hackbench: hackbench.o
-+hackbench: hackbench.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)
- 
- librttest.a: rt-utils.o error.o rt-get_cpu.o rt-sched.o
--- 
-1.9.1
-
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 9a076ad..871db13 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -5,7 +5,6 @@ SRCREV = "5f9f1e3fe327440a9d405f4af8feb16ff7a909eb"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
            file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
-           file://added-missing-dependencies.patch \
            file://hackbench-fix-error-check.patch \
            file://Makefile-fix-gzip-command.patch \
            file://fix-re-install-failure.patch \
-- 
2.5.0


