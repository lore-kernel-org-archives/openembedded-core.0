Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ABCF773259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410463"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:21 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:39 +0300
Message-Id: <1466764661-24544-27-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 26/28] oe-build-perf-test: enable locking
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:23 -0000

Makes it possible to guard that multiple tests are not run in parallel.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 9dd073c..64873c9 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -15,6 +15,8 @@
 #
 """Build performance test script"""
 import argparse
+import errno
+import fcntl
 import logging
 import os
 import sys
@@ -33,6 +35,19 @@ logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
 log = logging.getLogger()
 
 
+def acquire_lock(lock_f):
+    """Acquire flock on file"""
+    log.debug("Acquiring lock %s", os.path.abspath(lock_f.name))
+    try:
+        fcntl.flock(lock_f, fcntl.LOCK_EX | fcntl.LOCK_NB)
+    except IOError as err:
+        if err.errno == errno.EAGAIN:
+            return False
+        raise
+    log.debug("Lock acquired")
+    return True
+
+
 def pre_run_sanity_check():
     """Sanity check of build environment"""
     build_dir = os.environ.get("BUILDDIR")
@@ -72,6 +87,9 @@ def parse_args(argv):
                         help='Enable debug level logging')
     parser.add_argument('--globalres-file',
                         help="Append results to 'globalres' csv file")
+    parser.add_argument('--lock-file', default='./oe-build-perf.lock',
+                        metavar='FILENAME',
+                        help="Lock file to use")
 
     return parser.parse_args(argv)
 
@@ -83,6 +101,11 @@ def main(argv=None):
     if args.debug:
         log.setLevel(logging.DEBUG)
 
+    lock_f = open(args.lock_file, 'w')
+    if not acquire_lock(lock_f):
+        log.error("Another instance of this script is running, exiting...")
+        return 1
+
     if not pre_run_sanity_check():
         return 1
 
-- 
2.6.6


