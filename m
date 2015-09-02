Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A07877058
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 04:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="637005736"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Sep 2015 04:00:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id AABF56A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:15 +0300
Message-Id: <9174e8f787626e1eb499a0b158c52cec64b65146.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 15/17] wic: get rid of listing properties
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:32 -0000

Functionality of listing and using properties of wic images
does not exist in the wic code. However, there are plenty of
help and usage content about it, which is very confusing.

Removed everything regarding image properties from wic codebase.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 55 ++++++++++------------------
 scripts/lib/wic/help.py   | 93 ++++-------------------------------------------
 scripts/wic               | 13 ++-----
 3 files changed, 30 insertions(+), 131 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index d4a7be6..ce942ea 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -194,46 +194,29 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     print "\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file
 
 
-def wic_list(args, scripts_path, properties_file):
+def wic_list(args, scripts_path):
     """
-    Print the complete list of properties defined by the image, or the
-    possible values for a particular image property.
+    Print the list of images or source plugins.
     """
     if len(args) < 1:
         return False
 
-    if len(args) == 1:
-        if args[0] == "images":
-            list_canned_images(scripts_path)
-            return True
-        elif args[0] == "source-plugins":
-            list_source_plugins()
-            return True
-        elif args[0] == "properties":
-            return True
-        else:
-            return False
-
-    if len(args) == 2:
-        if args[0] == "properties":
-            wks_file = args[1]
-            print "print properties contained in wks file: %s" % wks_file
-            return True
-        elif args[0] == "property":
-            print "print property values for property: %s" % args[1]
-            return True
-        elif args[1] == "help":
-            wks_file = args[0]
-            fullpath = find_canned_image(scripts_path, wks_file)
-            if not fullpath:
-                print "No image named %s found, exiting. "\
-                      "(Use 'wic list images' to list available images, or "\
-                      "specify a fully-qualified OE kickstart (.wks) "\
-                      "filename)\n" % wks_file
-                sys.exit(1)
-            list_canned_image_help(scripts_path, fullpath)
-            return True
-        else:
-            return False
+    if args == ["images"]:
+        list_canned_images(scripts_path)
+        return True
+    elif args == ["source-plugins"]:
+        list_source_plugins()
+        return True
+    elif len(args) == 2 and args[1] == "help":
+        wks_file = args[0]
+        fullpath = find_canned_image(scripts_path, wks_file)
+        if not fullpath:
+            print "No image named %s found, exiting. "\
+                  "(Use 'wic list images' to list available images, or "\
+                  "specify a fully-qualified OE kickstart (.wks) "\
+                  "filename)\n" % wks_file
+            sys.exit(1)
+        list_canned_image_help(scripts_path, fullpath)
+        return True
 
     return False
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index cd2176d..9a778b6 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -108,7 +108,7 @@ wic_usage = """
  Current 'wic' commands are:
     help              Show help for command or one of the topics (see below)
     create            Create a new OpenEmbedded image
-    list              List available values for options and image properties
+    list              List available canned images and source plugins
 
  Help topics:
     overview          wic overview - General overview of wic
@@ -221,27 +221,19 @@ DESCRIPTION
 
     The -c option is used to specify compressor utility to compress
     an image. gzip, bzip2 and xz compressors are supported.
-
-    The set of properties available for a given image type can be
-    listed using the 'wic list' command.
 """
 
 wic_list_usage = """
 
- List available OpenEmbedded image properties and values
+ List available OpenEmbedded images and source plugins
 
  usage: wic list images
         wic list <image> help
         wic list source-plugins
-        wic list properties
-        wic list properties <wks file>
-        wic list property <property>
-                [-o <JSON PROPERTY FILE> | --outfile <JSON PROPERTY_FILE>]
 
  This command enumerates the set of available canned images as well as
- help for those images.  It also can be used to enumerate the complete
- set of possible values for a specified option or property needed by
- the image creation process.
+ help for those images.  It also can be used to list of available source
+ plugins.
 
  The first form enumerates all the available 'canned' images.
 
@@ -251,40 +243,23 @@ wic_list_usage = """
  The third form enumerates all the available --sources (source
  plugins).
 
- The fourth form enumerates all the possible values that exist and can
- be specified in an OE kickstart (wks) file.
-
- The fifth form enumerates all the possible options that exist for the
- set of properties specified in a given OE kickstart (ks) file.
-
- The final form enumerates all the possible values that exist and can
- be specified for any given OE kickstart (wks) property.
-
  See 'wic help list' for more details.
 """
 
 wic_list_help = """
 
 NAME
-    wic list - List available OpenEmbedded image properties and values
+    wic list - List available OpenEmbedded images and source plugins
 
 SYNOPSIS
     wic list images
     wic list <image> help
     wic list source-plugins
-    wic list properties
-    wic list properties <wks file>
-    wic list property <property>
-            [-o <JSON PROPERTY FILE> | --outfile <JSON PROPERTY_FILE>]
 
 DESCRIPTION
-    This command enumerates the complete set of possible values for a
-    specified option or property needed by the image creation process.
-
     This command enumerates the set of available canned images as well
-    as help for those images.  It also can be used to enumerate the
-    complete set of possible values for a specified option or property
-    needed by the image creation process.
+    as help for those images.  It also can be used to list available
+    source plugins.
 
     The first form enumerates all the available 'canned' images.
     These are actually just the set of .wks files that have been moved
@@ -301,60 +276,6 @@ DESCRIPTION
     sources listed by the 'list source-plugins' command.  Users can
     also add their own source plugins - see 'wic help plugins' for
     details.
-
-    The third form enumerates all the possible values that exist and
-    can be specified in a OE kickstart (wks) file.  The output of this
-    can be used by the third form to print the description and
-    possible values of a specific property.
-
-    The fourth form enumerates all the possible options that exist for
-    the set of properties specified in a given OE kickstart (wks)
-    file.  If the -o option is specified, the list of properties, in
-    addition to being displayed, will be written to the specified file
-    as a JSON object.  In this case, the object will consist of the
-    set of name:value pairs corresponding to the (possibly nested)
-    dictionary of properties defined by the input statements used by
-    the image.  Some example output for the 'list <wks file>' command:
-
-    $ wic list test.ks
-    "part" : {
-        "mountpoint" : "/"
-        "fstype" : "ext3"
-    }
-    "part" : {
-        "mountpoint" : "/home"
-        "fstype" : "ext3"
-        "offset" : "10000"
-    }
-    "bootloader" : {
-        "type" : "efi"
-    }
-    .
-    .
-    .
-
-    Each entry in the output consists of the name of the input element
-    e.g. "part", followed by the properties defined for that
-    element enclosed in braces.  This information should provide
-    sufficient information to create a complete user interface with.
-
-    The final form enumerates all the possible values that exist and
-    can be specified for any given OE kickstart (wks) property.  If
-    the -o option is specified, the list of values for the given
-    property, in addition to being displayed, will be written to the
-    specified file as a JSON object.  In this case, the object will
-    consist of the set of name:value pairs corresponding to the array
-    of property values associated with the property.
-
-    $ wic list property part
-        ["mountpoint", "where the partition should be mounted"]
-        ["fstype", "filesytem type of the partition"]
-            ["ext3"]
-            ["ext4"]
-            ["btrfs"]
-            ["swap"]
-        ["offset", "offset of the partition within the image"]
-
 """
 
 wic_plugins_help = """
diff --git a/scripts/wic b/scripts/wic
index c99c504..eb252a2 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -249,18 +249,13 @@ def wic_create_subcommand(args, usage_str):
 
 def wic_list_subcommand(args, usage_str):
     """
-    Command-line handling for listing available image properties and
-    values.  The real work is done by image.engine.wic_list()
+    Command-line handling for listing available images.
+    The real work is done by image.engine.wic_list()
     """
     parser = optparse.OptionParser(usage=usage_str)
+    args = parser.parse_args(args)[1]
 
-    parser.add_option("-o", "--outfile", action="store",
-                      dest="properties_file",
-                      help="dump the possible values for image properties to a JSON file")
-
-    (options, args) = parser.parse_args(args)
-
-    if not engine.wic_list(args, scripts_path, options.properties_file):
+    if not engine.wic_list(args, scripts_path):
         logging.error("Bad list arguments, exiting\n")
         parser.print_help()
         sys.exit(1)
-- 
2.1.4


