Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCj-00055v-F3
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWeue027240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:40 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:39 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:29 -0600
Message-ID: <87fb6a9a620d9256f6703da53703ca9504d74a65.1360270256.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270255.git.mark.hatle@windriver.com>
References: <cover.1360270255.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 08/11] rt-tests: fix cyclictest reported 1 sec latencies
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
X-List-Received-Date: Thu, 07 Feb 2013 23:48:34 -0000
Content-Type: text/plain

From: Jim Somerville <Jim.Somerville@windriver.com>

[ CQID: WIND00391769 ]

Huge latencies reported close to 1 second when certain options
are used in cyclictest.

Extend the original commit to remove the 1 second hardcoded
timer values from the RELTIME and ITIMER options.  Use the
the actual interval instead.

Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...st-finish-removal-of-1-second-first-loops.patch | 58 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch

diff --git a/meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch b/meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch
new file mode 100644
index 0000000..ea4f3cc
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch
@@ -0,0 +1,58 @@
+From 8959451a8ec5dc83dcb2dba6701abe8bf419e12c Mon Sep 17 00:00:00 2001
+Message-Id: <8959451a8ec5dc83dcb2dba6701abe8bf419e12c.1358783585.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Mon, 21 Jan 2013 10:50:18 -0500
+Subject: [PATCH 1/1] cyclictest: finish removal of 1 second first loops
+
+Observation:
+Huge latencies reported close to 1 second when certain options
+are used in cyclictest.
+
+Problem:
+[ commit da4956cbcaf7945554f30e4d3a9be09b1431b19a
+    use interval on first loop instead of 1 second ]
+removed the 1 second first timing loop out of the main path
+in cyclictest but left it in two other paths, namely the ones
+triggered by these two options:
+-r       --relative        use relative timer instead of absolute
+-s       --system          use sys_nanosleep and sys_setitimer
+This causes huge latencies of close to 1 second to be reported
+by cyclictest with certain uses of those two options.
+
+Fix:
+Extend the original commit to remove the 1 second hardcoded
+timer values from the RELTIME and ITIMER options.  Use the
+the actual interval instead.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ src/cyclictest/cyclictest.c |    6 ++----
+ 1 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/cyclictest/cyclictest.c b/src/cyclictest/cyclictest.c
+index 11b6cea..8487409 100644
+--- a/src/cyclictest/cyclictest.c
++++ b/src/cyclictest/cyclictest.c
+@@ -741,17 +741,15 @@ void *timerthread(void *param)
+ 		if (par->timermode == TIMER_ABSTIME)
+ 			tspec.it_value = next;
+ 		else {
+-			tspec.it_value.tv_nsec = 0;
+-			tspec.it_value.tv_sec = 1;
++			tspec.it_value = interval;
+ 		}
+ 		timer_settime(timer, par->timermode, &tspec, NULL);
+ 	}
+ 
+ 	if (par->mode == MODE_SYS_ITIMER) {
+-		itimer.it_value.tv_sec = 1;
+-		itimer.it_value.tv_usec = 0;
+ 		itimer.it_interval.tv_sec = interval.tv_sec;
+ 		itimer.it_interval.tv_usec = interval.tv_nsec / 1000;
++		itimer.it_value = itimer.it_interval;
+ 		setitimer (ITIMER_REAL, &itimer, NULL);
+ 	}
+ 
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 513ddaf..3ae7602 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -7,9 +7,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
            file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
            file://added-missing-dependencies.patch \
+           file://cyclictest-finish-removal-of-1-second-first-loops.patch \
 "
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.1.2.545.g2f19ada



