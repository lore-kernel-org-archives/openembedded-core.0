Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B4B786AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:26:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Dec 2015 00:26:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,463,1444719600"; d="scan'208";a="867124271"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2015 00:23:55 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 78A306A4007;
	Tue, 22 Dec 2015 01:11:55 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 10:36:29 +0200
Message-Id: <1450773389-6402-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCHv2] scripts/oe-selftest: Add support for selftest log with timestamp
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
X-List-Received-Date: Tue, 22 Dec 2015 08:26:16 -0000

Each time oe-selftest runs, the oe-selftest.log file is overwritten.
This patch solves it by adding time stamp to each selftest log file
and doing a symlink named as oe-selftest.log to the last one created.

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 scripts/oe-selftest | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bc50b2a..ff3307b 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -31,6 +31,7 @@ import unittest
 import logging
 import argparse
 import subprocess
+import time as t
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -43,10 +44,14 @@ from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
 from oeqa.selftest.base import oeSelfTest
 
 def logger_create():
+    log_file = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S") + ".log"
+    if os.path.exists("oe-selftest.log"): os.remove("oe-selftest.log")
+    os.symlink(log_file, "oe-selftest.log")
+
     log = logging.getLogger("selftest")
     log.setLevel(logging.DEBUG)
 
-    fh = logging.FileHandler(filename='oe-selftest.log', mode='w')
+    fh = logging.FileHandler(filename=log_file, mode='w')
     fh.setLevel(logging.DEBUG)
 
     ch = logging.StreamHandler(sys.stdout)
-- 
2.5.0


