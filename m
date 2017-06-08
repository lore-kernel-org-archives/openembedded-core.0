Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 271C47828E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 08 Jun 2017 09:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="1179989129"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2017 09:15:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EAB1E5807BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:13:04 +0300
Message-Id: <4c6f8b3653618fb6e11c6afd6c2abc426e3bef92.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 22/25] wic: add 'wic rm' command
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:35 -0000

Added empty 'wic rm' command that does nothing.
The functionality will be added by the next commits.

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |  7 +++++++
 scripts/wic               | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index a48c4ad..9a8055c 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -340,6 +340,13 @@ def wic_cp(args, native_sysroot):
     disk = Disk(args.dest.image, native_sysroot)
     disk.copy(args.src, args.dest.part, args.dest.path)
 
+def wic_rm(args, native_sysroot):
+    """
+    Remove files or directories from the vfat partition of
+    partitioned image.
+    """
+    pass
+
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
diff --git a/scripts/wic b/scripts/wic
index fc192ec..da14f47 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -248,6 +248,13 @@ def wic_cp_subcommand(args, usage_str):
     """
     engine.wic_cp(args, args.native_sysroot)
 
+def wic_rm_subcommand(args, usage_str):
+    """
+    Command-line handling for removing files/dirs from images.
+    The real work is done by engine.wic_rm()
+    """
+    engine.wic_rm(args, args.native_sysroot)
+
 def wic_help_subcommand(args, usage_str):
     """
     Command-line handling for help subcommand to keep the current
@@ -286,6 +293,9 @@ helptopics = {
     "cp":        [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_cp_help],
+    "rm":        [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_rm_help],
     "list":      [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_list_help]
@@ -409,6 +419,10 @@ subcommands = {
                   hlp.wic_cp_usage,
                   hlp.wic_cp_help,
                   wic_init_parser_cp],
+    "rm":        [wic_rm_subcommand,
+                  hlp.wic_rm_usage,
+                  hlp.wic_rm_help,
+                  wic_init_parser_rm],
     "help":      [wic_help_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_help_help,
-- 
2.1.4


