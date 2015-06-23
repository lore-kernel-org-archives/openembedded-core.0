Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2306AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:54:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 02:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="748754118"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2015 02:53:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B8CB16A4083;
	Tue, 23 Jun 2015 02:53:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:52:57 +0300
Message-Id: <1435053182-8028-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 1/6] wic: Add --compress-with command line option
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
X-List-Received-Date: Tue, 23 Jun 2015 09:54:07 -0000

Added -c/--compress-with command line option to 'wic create'
subcommand. This option is used to specify compressor
utility to compress the image produced by wic. gzip, bzip2 and
xz compressors are supported in this implementation.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index fe66548..c8b2fab 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -152,6 +152,7 @@ SYNOPSIS
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
         [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+        [-c, --compress-with]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
@@ -218,6 +219,9 @@ DESCRIPTION
     The -o option can be used to place the image in a directory with a
     different name and location.
 
+    The -c option is used to specify compressor utility to compress
+    an image. gzip, bzip2 and xz compressors are supported.
+
     The set of properties available for a given image type can be
     listed using the 'wic list' command.
 """
diff --git a/scripts/wic b/scripts/wic
index 7b0c3b2..8869fba 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -105,6 +105,9 @@ def wic_create_subcommand(args, usage_str):
     parser.add_option("-p", "--skip-build-check", dest="build_check",
                       action="store_false", default=True, help="skip the build check")
     parser.add_option("-f", "--build-rootfs", action="store_true", help="build rootfs")
+    parser.add_option("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
+                      dest='compressor',
+                      help="compress image with specified compressor")
     parser.add_option("-D", "--debug", dest="debug", action="store_true",
                       default=False, help="output debug information")
 
-- 
2.1.4


