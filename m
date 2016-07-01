Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 95F8B60111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 08:39:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jul 2016 01:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="1013359129"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2016 01:39:08 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3F9E92C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 01:39:03 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 11:39:02 +0300
Message-Id: <1467362342-29498-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] rt-tests: move ptest to python3
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
X-List-Received-Date: Fri, 01 Jul 2016 08:39:08 -0000

convert python2 based ptest of rt-tests package to python3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py | 26 +++++++++++++-------------
 meta/recipes-rt/rt-tests/files/run-ptest   |  2 +-
 meta/recipes-rt/rt-tests/rt-tests_2.0.bb   |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 0e2b105..080a655 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 
 # SPDX-License-Identifier:     BSD-3-Clause
@@ -106,8 +106,8 @@ def tc_name(sub_name):
 
 def log(*msg):
         tmp = "".join(map(str, msg)) # 'map(str, ...' allows numbers
-        for line in tmp.split("\n"):
-                print "#", line
+        for line in tmp.splitlines():
+                print("#", line)
 
 #-------------------------------------------------------------------------------
 # Like log(), but with a timestamp added
@@ -265,7 +265,7 @@ cmd = ("cyclictest",
        "-d", str(interval_delta),
        "-l", str(loop_count)
        )
-rex = re.compile("C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
+rex = re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
 
 def run_cyclictest_once():
         res = subprocess.check_output(cmd)
@@ -283,7 +283,7 @@ def run_cyclictest_once():
         avg_sum = 0
         avg_cnt = 0
 
-        for line in res.split("\n"):
+        for line in res.splitlines():
                 m = rex.search(line)
                 if m is not None:
                         minlist.append(int(m.group(2)))
@@ -376,11 +376,11 @@ class cyclictest_runner:
                         log()
                         log("PASS")
 
-                        print
-                        print tc_name(name), "[Min/us,Avg/us,Max/us]:",
-                        print "%d,%.1f,%d" % (bm_min,bm_avg, bm_max)
-                        print "PASS:", tc_name(name)
-                        print
+                        print()
+                        print(tc_name(name), "[Min/us,Avg/us,Max/us]:",)
+                        print("%d,%.1f,%d" % (bm_min,bm_avg, bm_max))
+                        print("PASS:", tc_name(name))
+                        print()
 
                 except Exception:
                         log()
@@ -391,9 +391,9 @@ class cyclictest_runner:
                         log("WD: ", os.getcwd())
                         log()
                         log("FAIL")
-                        print
-                        print "FAIL:", tc_name(name)
-                        print
+                        print()
+                        print("FAIL:", tc_name(name))
+                        print()
 
 #-------------------------------------------------------------------------------
 
diff --git a/meta/recipes-rt/rt-tests/files/run-ptest b/meta/recipes-rt/rt-tests/files/run-ptest
index 8e6d3e3..b7c5e29 100644
--- a/meta/recipes-rt/rt-tests/files/run-ptest
+++ b/meta/recipes-rt/rt-tests/files/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python ./rt_bmark.py
+python3 ./rt_bmark.py
diff --git a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
index 21780d1..83869b8 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
@@ -28,6 +28,6 @@ do_install_ptest() {
         cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
 }
 
-RDEPENDS_${PN}-ptest += " stress python python-subprocess python-multiprocessing python-datetime python-re python-lang"
+RDEPENDS_${PN}-ptest += " stress python3 python3-subprocess python3-multiprocessing python3-datetime python3-re python3-lang python3-misc"
 
 FILES_${PN} += "${prefix}/src/backfire"
-- 
2.4.0


