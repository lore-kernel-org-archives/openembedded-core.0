Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 020DB731FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2016 10:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="32428162"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 10:48:52 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 4C2C32C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:48 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:08 +0200
Message-Id: <f86bb8e2a5927e98ba5d9012e6ef70fc946a5df3.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 6/9] wic: implement search of includes
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
X-List-Received-Date: Tue, 19 Jan 2016 18:48:54 -0000

Used custom argument type to implement search of include
.wks files in canned wks paths. Include files can be
specified either by full path or by name.

[YOCTO #8848]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index c73a456..3722799 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -25,11 +25,12 @@
 # Ed Bartosh <ed.bartosh> (at] linux.intel.com>
 
 
-
+import os
 import shlex
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
 from wic.partition import Partition
+from wic.utils.misc import find_canned
 
 class KickStartError(Exception):
     pass
@@ -78,6 +79,17 @@ def overheadtype(arg):
 
     return result
 
+def cannedpathtype(arg):
+    """
+    Custom type for ArgumentParser
+    Tries to find file in the list of canned wks paths
+    """
+    scripts_path = os.path.abspath(os.path.dirname(__file__) + '../../..')
+    result = find_canned(scripts_path, arg)
+    if not result:
+        raise ArgumentTypeError("file not found: %s" % arg)
+    return result
+
 class KickStart(object):
     def __init__(self, confpath):
 
@@ -117,7 +129,7 @@ class KickStart(object):
         bootloader.add_argument('--source')
 
         include = subparsers.add_parser('include')
-        include.add_argument('path')
+        include.add_argument('path', type=cannedpathtype)
 
         self._parse(parser, confpath)
 
-- 
2.1.4


