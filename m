Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CFA477813F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="978408369"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Jun 2017 09:15:22 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2936658029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:51 +0300
Message-Id: <729a7b3349127004b37cdda4d2d8bcceb5fcba1c.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/25] wic: add wic_init_parser_cp
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:20 -0000

Add parser for 'wic cp' subcommand and a custom argument type.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 4161f80..945dda8 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -341,6 +341,8 @@ def imgtype(arg):
         image, part = image.split(':')
         if '/' in part:
             part, path = part.split('/', 1)
+        if not path:
+            path = '/'
 
     if not os.path.isfile(image):
         err = "%s is not a regular file or symlink" % image
@@ -354,6 +356,20 @@ def wic_init_parser_ls(subparser):
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+def imgpathtype(arg):
+    img = imgtype(arg)
+    if img.part is None:
+        raise argparse.ArgumentTypeError("partition number is not specified")
+    return img
+
+def wic_init_parser_cp(subparser):
+    subparser.add_argument("src",
+                        help="source spec")
+    subparser.add_argument("dest", type=imgpathtype,
+                        help="image spec: <image>:<vfat partition>[<path>]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
     for helptopic in helptopics:
-- 
2.1.4


