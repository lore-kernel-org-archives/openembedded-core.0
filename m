Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Tgr76-0003AA-2I
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 07:08:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB75sHwr016478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 21:54:17 -0800 (PST)
Received: from pek-usp-11.wrs.com (128.224.163.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 6 Dec 2012 21:54:16 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2012 13:54:13 +0800
Message-ID: <9067bc6fa818b0159c7af35655e2030225ea73ea.1354859376.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354859376.git.jackie.huang@windriver.com>
References: <cover.1354859376.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 1/1] rt-tests: added missing dependencies in Makefile
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
X-List-Received-Date: Fri, 07 Dec 2012 06:08:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following targets missed dependency on librttest.a:
pi_stress
rt-migrate-test
hackbench

[YOCTO #3549]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../files/added-missing-dependencies.patch         |   50 ++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |    6 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch

diff --git a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
new file mode 100644
index 0000000..e420282
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
@@ -0,0 +1,50 @@
+From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 6 Dec 2012 11:26:14 +0800
+Subject: [PATCH] Added missing dependencies
+
+Upstream-Status: Submitted [linux-rt-users]
+
+The following targets missed dependency on librttest.a:
+pi_stress
+rt-migrate-test
+hackbench
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fd3cdb3..60707a7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a
+ signaltest: signaltest.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-pi_stress: pi_stress.o
++pi_stress: pi_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ hwlatdetect:  src/hwlatdetect/hwlatdetect.py
+ 	chmod +x src/hwlatdetect/hwlatdetect.py
+ 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
+ 
+-rt-migrate-test: rt-migrate-test.o
++rt-migrate-test: rt-migrate-test.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ ptsematest: ptsematest.o librttest.a
+@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
+ pip_stress: pip_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-hackbench: hackbench.o
++hackbench: hackbench.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ librttest.a: rt-utils.o error.o rt-get_cpu.o
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 6a699fc..513ddaf 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -5,9 +5,11 @@ PR = "r0"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
-           file://0002-rt-tests-Break-out-install_hwlatdetect.patch"
+           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
+           file://added-missing-dependencies.patch \
+"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1



