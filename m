Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 056BB782EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 04:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="273606432"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2017 04:24:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EE8035800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:00 +0300
Message-Id: <735b8c8f41196f3226249184242246624f91e5da.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 12/26] wic: add 'wic cp' command
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:11 -0000

Added empty 'wic cp' command that does nothing.
The functionality will be added by the next commits.

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |  7 +++++++
 scripts/wic               | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 95c8d1c..f8f2844 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -309,6 +309,13 @@ def wic_ls(args, native_sysroot):
         path = args.path.path or '/'
         print(disk.dir(args.path.part, path))
 
+def wic_cp(args, native_sysroot):
+    """
+    Copy local file or directory to the vfat partition of
+    partitioned image.
+    """
+    pass
+
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
diff --git a/scripts/wic b/scripts/wic
index 945dda8..5e81fad 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -241,6 +241,12 @@ def wic_ls_subcommand(args, usage_str):
     """
     engine.wic_ls(args, args.native_sysroot)
 
+def wic_cp_subcommand(args, usage_str):
+    """
+    Command-line handling for copying files/dirs to images.
+    The real work is done by engine.wic_cp()
+    """
+    engine.wic_cp(args, args.native_sysroot)
 
 def wic_help_subcommand(args, usage_str):
     """
@@ -277,6 +283,9 @@ helptopics = {
     "ls":        [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_ls_help],
+    "cp":        [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_cp_help],
     "list":      [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_list_help]
@@ -390,6 +399,10 @@ subcommands = {
                   hlp.wic_ls_usage,
                   hlp.wic_ls_help,
                   wic_init_parser_ls],
+    "cp":        [wic_cp_subcommand,
+                  hlp.wic_cp_usage,
+                  hlp.wic_cp_help,
+                  wic_init_parser_cp],
     "help":      [wic_help_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_help_help,
-- 
2.1.4


