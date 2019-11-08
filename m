Return-Path: <chee.yang.lee@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BFA5F7FC10
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 03:41:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 19:41:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,280,1569308400"; d="scan'208";a="233498602"
Received: from cheeyang-desk1.png.intel.com ([172.30.199.38])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2019 19:41:36 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2019 11:41:19 +0800
Message-Id: <20191108034119.12676-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] wic: beautify 'wic help'
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
X-List-Received-Date: Fri, 08 Nov 2019 03:41:36 -0000
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

The Wic help returned to the user is unreadable.

Use a custom ArgumentParser to override argparse help message.

change help message as suggest in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12205
[YOCTO #12205]

changes applies to 'wic help', 'wic -h', 'wic --h' and 'wic --help'

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/help.py | 56 +++++++++++++++++++++++++++++++++++++++++
 scripts/wic             |  8 +++---
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index af7d0576e2..968cc0ed6f 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1046,3 +1046,59 @@ NAME
 DESCRIPTION
     Specify a help topic to display it. Topics are shown above.
 """
+
+
+wic_help = """
+Creates a customized OpenEmbedded image.
+
+Usage:  wic [--version]
+        wic help [COMMAND or TOPIC]
+        wic COMMAND [ARGS]
+
+    usage 1: Returns the current version of Wic
+    usage 2: Returns detailed help for a COMMAND or TOPIC
+    usage 3: Executes COMMAND
+
+
+COMMAND:
+
+    list   -   List available canned images and source plugins
+    ls     -   List contents of partitioned image or partition
+    rm     -   Remove files or directories from the vfat or ext* partitions
+    help   -   Show help for a wic COMMAND or TOPIC
+    write  -   Write an image to a device
+    cp     -   Copy files and directories to the vfat or ext* partitions
+    create -   Create a new OpenEmbedded image
+
+
+TOPIC:
+    overview  - Presents an overall overview of Wic
+    plugins   - Presents an overview and API for Wic plugins
+    kickstart - Presents a Wic kicstart file reference
+
+
+Examples:
+
+    $ wic --version
+
+    Returns the current version of Wic
+
+
+    $ wic help cp
+
+    Returns the SYNOPSIS and DESCRIPTION for the Wic "cp" command.
+
+
+    $ wic list images
+
+    Returns the list of canned images (i.e. *.wks files located in
+    the /scripts/lib/wic/canned-wks directory.
+
+
+    $ wic create mkefidisk -e core-image-minimal
+
+    Creates an EFI disk image from artifacts used in a previous
+    core-image-minimal build in standard BitBake locations
+    (e.g. Cooked Mode).
+
+"""
diff --git a/scripts/wic b/scripts/wic
index 1d89fb2eda..1a717300f5 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -495,14 +495,18 @@ def init_parser(parser):
         subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][2])
         subcommands[subcmd][3](subparser)
 
+class WicArgumentParser(argparse.ArgumentParser):
+     def format_help(self):
+         return hlp.wic_help
 
 def main(argv):
-    parser = argparse.ArgumentParser(
+    parser = WicArgumentParser(
         description="wic version %s" % __version__)
 
     init_parser(parser)
 
     args = parser.parse_args(argv)
+
     if args.debug:
         logger.setLevel(logging.DEBUG)
 
@@ -510,8 +514,6 @@ def main(argv):
         if args.command == "help":
             if args.help_topic is None:
                 parser.print_help()
-                print()
-                print("Please specify a help topic")
             elif args.help_topic in helptopics:
                 hlpt = helptopics[args.help_topic]
                 hlpt[0](hlpt[1], hlpt[2])
-- 
2.22.0


