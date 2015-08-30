Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 87A8976E8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 17:47:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 10:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="635017208"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Aug 2015 10:47:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 24A186A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:46:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 20:47:05 +0300
Message-Id: <0fec11b02de588664bf7a831e1ef8e0c49fa72cd.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/12] wic: implement --vars option
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
X-List-Received-Date: Sun, 30 Aug 2015 17:47:41 -0000

This option is used to point wic to the directory with .env
files containing list of bitbake variables and their values.

If this option is used wic will get bitbake variables from
files instead of parsing 'bitbake -e' output.

The main reason for this is to support new mode, when bitbake
runs wic to produce wic images. In this case wic can't run bitbake
again as it's locked, so it will get variables from .env files.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 5818e2d..25b0d67 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -114,6 +114,9 @@ def wic_create_subcommand(args, usage_str):
     parser.add_option("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
                       dest='compressor',
                       help="compress image with specified compressor")
+    parser.add_option("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
     parser.add_option("-D", "--debug", dest="debug", action="store_true",
                       default=False, help="output debug information")
 
@@ -146,6 +149,9 @@ def wic_create_subcommand(args, usage_str):
     else:
         options.build_check = False
 
+    if options.vars_dir:
+        BB_VARS.vars_dir = options.vars_dir
+
     if options.build_check:
         print "Checking basic build environment..."
         if not engine.verify_build_env():
-- 
2.1.4


