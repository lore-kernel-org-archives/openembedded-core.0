Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9421D60962
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 21:25:24 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 23:25:23 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 116C928BA1E;
	Tue, 16 Jun 2015 23:25:24 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jun 2015 23:25:07 +0200
Message-ID: <1434489907-40606-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] rt-tests: bump version to v0.92
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
X-List-Received-Date: Tue, 16 Jun 2015 21:25:27 -0000
Content-Type: text/plain

Version upgrade to v0.92
Rebased below listed patch to newer source code:
	added-missing-dependencies.patch

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../files/added-missing-dependencies.patch         | 36 +++++++++-------------
 .../{hwlatdetect_0.91.bb => hwlatdetect_0.92.bb}   |  0
 meta/recipes-rt/rt-tests/rt-tests.inc              |  6 ++--
 .../{rt-tests_0.91.bb => rt-tests_0.92.bb}         |  0
 4 files changed, 17 insertions(+), 25 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.91.bb => hwlatdetect_0.92.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.91.bb => rt-tests_0.92.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
index e420282..0bf768e 100644
--- a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
+++ b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
@@ -1,50 +1,42 @@
-From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 6 Dec 2012 11:26:14 +0800
+From 3f948f22d9106a2b957d1d430b16a7c51ccfc067 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@enea.com>
+Date: Tue, 16 Jun 2015 22:53:23 +0200
 Subject: [PATCH] Added missing dependencies
 
 Upstream-Status: Submitted [linux-rt-users]
 
 The following targets missed dependency on librttest.a:
-pi_stress
 rt-migrate-test
 hackbench
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
 ---
- Makefile |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index fd3cdb3..60707a7 100644
+index a48e759..7a3f192 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a
- signaltest: signaltest.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
--pi_stress: pi_stress.o
-+pi_stress: pi_stress.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
- 
- hwlatdetect:  src/hwlatdetect/hwlatdetect.py
+@@ -85,7 +85,7 @@ hwlatdetect:  src/hwlatdetect/hwlatdetect.py
  	chmod +x src/hwlatdetect/hwlatdetect.py
  	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
  
 -rt-migrate-test: rt-migrate-test.o
 +rt-migrate-test: rt-migrate-test.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)
  
  ptsematest: ptsematest.o librttest.a
-@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
+@@ -106,7 +106,7 @@ sendme: sendme.o librttest.a
  pip_stress: pip_stress.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS) $(RTTESTLIB)
  
 -hackbench: hackbench.o
 +hackbench: hackbench.o librttest.a
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)
  
- librttest.a: rt-utils.o error.o rt-get_cpu.o
+ librttest.a: rt-utils.o error.o rt-get_cpu.o rt-sched.o
 -- 
-1.7.9.5
+1.9.1
 
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.91.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.92.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.91.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_0.92.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 68a972a..e63182a 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,6 +1,6 @@
-# Version v0.91
-PV = "0.91"
-SRCREV = "3fed00ff8d2c0cdbc5ba078cbd60ce3cfcee615f"
+# Version v0.92
+PV = "0.92"
+SRCREV = "5f9f1e3fe327440a9d405f4af8feb16ff7a909eb"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.91.bb b/meta/recipes-rt/rt-tests/rt-tests_0.92.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_0.91.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.92.bb
-- 
1.9.1


