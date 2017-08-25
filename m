Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 446917844B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 06:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="1166091471"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 25 Aug 2017 06:42:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A101458048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:37 +0300
Message-Id: <b70570aedd7581e29e4bc2ea6dce91c193641b21.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/10] wic: add 'wic write' command
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:28 -0000

Added empty 'wic write' command that does nothing.
The functionality will be added by the next commits.

[YOCTO #11278]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |  6 ++++++
 scripts/wic               | 55 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 2dc2fd5..d33c9b3 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -375,6 +375,12 @@ def wic_rm(args, native_sysroot):
     disk = Disk(args.path.image, native_sysroot)
     disk.remove(args.path.part, args.path.path)
 
+def wic_write(args, native_sysroot):
+    """
+    Write image to a target device.
+    """
+    pass
+
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
diff --git a/scripts/wic b/scripts/wic
index 02bc82c..592a0e4 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -257,6 +257,13 @@ def wic_rm_subcommand(args, usage_str):
     """
     engine.wic_rm(args, args.native_sysroot)
 
+def wic_write_subcommand(args, usage_str):
+    """
+    Command-line handling for writing images.
+    The real work is done by engine.wic_write()
+    """
+    engine.wic_write(args, args.native_sysroot)
+
 def wic_help_subcommand(args, usage_str):
     """
     Command-line handling for help subcommand to keep the current
@@ -298,6 +305,9 @@ helptopics = {
     "rm":        [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_rm_help],
+    "write":     [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_write_help],
     "list":      [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_list_help]
@@ -397,6 +407,47 @@ def wic_init_parser_rm(subparser):
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+def expandtype(rules):
+    """
+    Custom type for ArgumentParser
+    Converts expand rules to the dictionary {<partition>: size}
+    """
+    if rules == 'auto':
+        return {}
+    result = {}
+    for rule in rules.split('-'):
+        try:
+            part, size = rule.split(':')
+        except ValueError:
+            raise argparse.ArgumentTypeError("Incorrect rule format: %s" % rule)
+
+        if not part.isdigit():
+            raise argparse.ArgumentTypeError("Rule '%s': partition number must be integer" % rule)
+
+        # validate size
+        multiplier = 1
+        for suffix, mult in [('K', 1024), ('M', 1024 * 1024), ('G', 1024 * 1024 * 1024)]:
+            if size.upper().endswith(suffix):
+                multiplier = mult
+                size = size[:-1]
+                break
+        if not size.isdigit():
+            raise argparse.ArgumentTypeError("Rule '%s': size must be integer" % rule)
+
+        result[int(part)] = int(size) * multiplier
+
+    return result
+
+def wic_init_parser_write(subparser):
+    subparser.add_argument("image",
+                        help="path to the wic image")
+    subparser.add_argument("target",
+                        help="target file or device")
+    subparser.add_argument("-e", "--expand", type=expandtype,
+                        help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
     for helptopic in helptopics:
@@ -425,6 +476,10 @@ subcommands = {
                   hlp.wic_rm_usage,
                   hlp.wic_rm_help,
                   wic_init_parser_rm],
+    "write":     [wic_write_subcommand,
+                  hlp.wic_write_usage,
+                  hlp.wic_write_help,
+                  wic_init_parser_write],
     "help":      [wic_help_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_help_help,
-- 
2.1.4


