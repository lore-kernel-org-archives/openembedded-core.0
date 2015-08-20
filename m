Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AEA6676AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 04:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="629004542"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2015 04:56:53 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0BD116A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:22 +0300
Message-Id: <f216fab9a70268f8703f63285c63767c32e1dc8b.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/17] wic: implement --vars option
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:57 -0000

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
index 87ada36..815b84e 100755
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


