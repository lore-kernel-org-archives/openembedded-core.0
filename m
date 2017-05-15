Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2333E71E02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:20:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 07:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="856952659"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 15 May 2017 07:20:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DC83D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:20:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 16:57:35 +0300
Message-Id: <3f6950b46c105e9a4ce53436205f0393805a0297.1494856157.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494856157.git.ed.bartosh@linux.intel.com>
References: <cover.1494856157.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/8] wic: add wic_init_parser_ls
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
X-List-Received-Date: Mon, 15 May 2017 14:20:28 -0000

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


