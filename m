Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA8B7826D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:15 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 08 Jun 2017 09:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="112031740"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2017 09:15:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D27605806E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:46 +0300
Message-Id: <97ba5104fd556b128b007ee26585e617fe584132.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/25] wic: add wic_init_parser_ls
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:15 -0000

Added parser for 'wic ls' command.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 49cad86..6c9a30d 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -35,6 +35,8 @@ import os
 import sys
 import argparse
 import logging
+
+from collections import namedtuple
 from distutils import spawn
 
 # External modules
@@ -317,6 +319,29 @@ def wic_init_parser_list(subparser):
                              "defined inside the .wks file")
     return
 
+def imgtype(arg):
+    """
+    Custom type for ArgumentParser
+    Converts path spec to named tuple: (image, partition, path)
+    """
+    image = arg
+    part = path = None
+    if ':' in image:
+        image, part = image.split(':')
+        if '/' in part:
+            part, path = part.split('/', 1)
+
+    if not os.path.isfile(image):
+        err = "%s is not a regular file or symlink" % image
+        raise argparse.ArgumentTypeError(err)
+
+    return namedtuple('ImgType', 'image part path')(image, part, path)
+
+def wic_init_parser_ls(subparser):
+    subparser.add_argument("path", type=imgtype,
+                        help="image spec: <image>[:<vfat partition>[<path>]]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
 
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
-- 
2.1.4


