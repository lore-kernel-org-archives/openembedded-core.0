Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 892066162B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2014 17:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="449256414"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 17:17:15 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:17:00 -0600
Message-Id: <47e3ea316f19e10f8c3574def2b0d807c574e4ba.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
References: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 7/7] wic: Hook up --debug option
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:34 -0000

Hook up the existing --debug option to toggle the wic debug loglevel,
which is indispensible when things go wrong, and make it easy to use
from the command-line.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py |  5 ++++-
 scripts/wic                 | 11 +++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 2dd98b9..6cf6169 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -175,7 +175,7 @@ def list_canned_image_help(scripts_path, fullpath):
 
 def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, hdddir, staging_data_dir, scripts_path,
-               image_output_dir, properties_file, properties=None):
+               image_output_dir, debug, properties_file, properties=None):
     """
     Create image
 
@@ -235,6 +235,9 @@ def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     direct_args.insert(0, staging_data_dir)
     direct_args.insert(0, "direct")
 
+    if debug:
+        msger.set_loglevel('debug')
+
     cr = creator.Creator()
 
     cr.main(direct_args)
diff --git a/scripts/wic b/scripts/wic
index 4ea5569..824acae 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -69,6 +69,8 @@ def wic_create_subcommand(args, usage_str):
                       action = "store", help = "path to the native sysroot containing the tools to use to build the image")
     parser.add_option("-p", "--skip-build-check", dest = "build_check",
                       action = "store_false", default = True, help = "skip the build check")
+    parser.add_option("-D", "--debug", dest = "debug", action = "store_true",
+                      default = False, help = "output debug information")
 
     (options, args) = parser.parse_args(args)
 
@@ -162,7 +164,7 @@ def wic_create_subcommand(args, usage_str):
 
     wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, hdddir, staging_data_dir, scripts_path,
-               image_output_dir, options.properties_file)
+               image_output_dir, options.debug, options.properties_file)
 
 
 def wic_list_subcommand(args, usage_str):
@@ -203,16 +205,9 @@ def main():
                                    usage = wic_usage)
 
     parser.disable_interspersed_args()
-    parser.add_option("-D", "--debug", dest = "debug", action = "store_true",
-                      default = False, help = "output debug information")
 
     (options, args) = parser.parse_args()
 
-    loglevel = logging.INFO
-    if options.debug:
-        loglevel = logging.DEBUG
-    start_logging(loglevel)
-
     if len(args):
         if args[0] == "help":
             if len(args) == 1:
-- 
1.8.3.1


