Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 446C16E6B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:56:45 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 11 Feb 2014 16:56:43 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 1A0AB28AEDD;
	Tue, 11 Feb 2014 16:56:44 +0100 (CET)
From: <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2014 16:56:34 +0100
Message-ID: <1392134194-30350-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] rt-tests: version bump to 0.87
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
X-List-Received-Date: Tue, 11 Feb 2014 15:56:46 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

- Drop PR and INC_PR.
- license remains the same with cyclictest.c checksum change

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 ...st-finish-removal-of-1-second-first-loops.patch |   61 --------------------
 meta/recipes-rt/rt-tests/rt-tests.inc              |    9 +--
 .../{rt-tests_0.85.bb => rt-tests_0.87.bb}         |    4 +-
 3 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch
 rename meta/recipes-rt/rt-tests/{rt-tests_0.85.bb => rt-tests_0.87.bb} (90%)

diff --git a/meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch b/meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch
deleted file mode 100644
index a9cc0e3..0000000
--- a/meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 8959451a8ec5dc83dcb2dba6701abe8bf419e12c Mon Sep 17 00:00:00 2001
-Message-Id: <8959451a8ec5dc83dcb2dba6701abe8bf419e12c.1358783585.git.Jim.Somerville@windriver.com>
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Mon, 21 Jan 2013 10:50:18 -0500
-Subject: [PATCH 1/1] cyclictest: finish removal of 1 second first loops
-
-Observation:
-Huge latencies reported close to 1 second when certain options
-are used in cyclictest.
-
-Problem:
-[ commit da4956cbcaf7945554f30e4d3a9be09b1431b19a
-    use interval on first loop instead of 1 second ]
-removed the 1 second first timing loop out of the main path
-in cyclictest but left it in two other paths, namely the ones
-triggered by these two options:
--r       --relative        use relative timer instead of absolute
--s       --system          use sys_nanosleep and sys_setitimer
-This causes huge latencies of close to 1 second to be reported
-by cyclictest with certain uses of those two options.
-
-Fix:
-Extend the original commit to remove the 1 second hardcoded
-timer values from the RELTIME and ITIMER options.  Use the
-the actual interval instead.
-
-Upstream-Status:  Accepted
-[ https://git.kernel.org/cgit/linux/kernel/git/clrkwllms/rt-tests.git/commit/?h=work&id=1b92da30837e9552aba209cbdf938877f0fd3bbf ]
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
----
- src/cyclictest/cyclictest.c |    6 ++----
- 1 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/cyclictest/cyclictest.c b/src/cyclictest/cyclictest.c
-index 11b6cea..8487409 100644
---- a/src/cyclictest/cyclictest.c
-+++ b/src/cyclictest/cyclictest.c
-@@ -741,17 +741,15 @@ void *timerthread(void *param)
- 		if (par->timermode == TIMER_ABSTIME)
- 			tspec.it_value = next;
- 		else {
--			tspec.it_value.tv_nsec = 0;
--			tspec.it_value.tv_sec = 1;
-+			tspec.it_value = interval;
- 		}
- 		timer_settime(timer, par->timermode, &tspec, NULL);
- 	}
- 
- 	if (par->mode == MODE_SYS_ITIMER) {
--		itimer.it_value.tv_sec = 1;
--		itimer.it_value.tv_usec = 0;
- 		itimer.it_interval.tv_sec = interval.tv_sec;
- 		itimer.it_interval.tv_usec = interval.tv_nsec / 1000;
-+		itimer.it_value = itimer.it_interval;
- 		setitimer (ITIMER_REAL, &itimer, NULL);
- 	}
- 
--- 
-1.7.4.1
-
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 91e5028..81f4f2b 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,18 +1,13 @@
-# Version v0.85
-SRCREV = "210e625227d21e0b589b8eaa36cd81f1cb981819"
-
-PR = "r0"
+# Version v0.87
+SRCREV = "b0413ae5ed802004fb0c4af74a1757381fd2b91f"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
            file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
            file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
            file://added-missing-dependencies.patch \
-           file://cyclictest-finish-removal-of-1-second-first-loops.patch \
            file://hackbench-fix-error-check.patch \
 "
 
-INC_PR = "r2"
-
 S = "${WORKDIR}/git"
 
 # need to append rt-tests' default CFLAGS to ours
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb b/meta/recipes-rt/rt-tests/rt-tests_0.87.bb
similarity index 90%
rename from meta/recipes-rt/rt-tests/rt-tests_0.85.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.87.bb
index ae61092..df646de 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.87.bb
@@ -4,13 +4,11 @@ SECTION = "tests"
 DEPENDS = "linux-libc-headers virtual/libc"
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
+                    file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=e768b8da44555fe63f65e5c497844cb5 \
                     file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
 
 require rt-tests.inc
 
-PR = "${INC_PR}.0"
-
 # Do not install hwlatdetect
 EXTRA_OEMAKE += "PYLIB=''"
 
-- 
1.7.10.4


