Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 455D8780A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 07:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="91714649"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2017 07:47:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6FAC3580363
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:18 +0300
Message-Id: <d48c29bed3319d732bcf96f382152a1c21659ca8.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495722660.git.ed.bartosh@linux.intel.com>
References: <cover.1495722660.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/11] wic: add wic_init_parser_cp
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
X-List-Received-Date: Thu, 25 May 2017 14:47:22 -0000

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


