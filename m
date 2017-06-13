Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9D50478320
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 13 Jun 2017 04:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1140753850"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2017 04:24:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3FB2D58010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:21:53 +0300
Message-Id: <97faad6c27f835382cfcc2ce9a39dcd3d02ab2fa.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 05/26] wic: add wic_init_parser_ls
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:02 -0000

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


