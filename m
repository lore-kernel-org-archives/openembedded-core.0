Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 324E277D41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899515; x=1522435515;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g9WSnZcIMkT8l6eiMfIWFldTh5sGnT9RiIX2OajEAsc=;
	b=mBrtHn2MBJTYW/73Ucb1TlV1CMHsf4y1fatZHb7AKxx+1DUHU9HM4PNK
	5xN6LC78NtZcbHOgkFWjn4KyfFyeIQ==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="840142215"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2017 11:45:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4C2C42C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:44 +0300
Message-Id: <22aaaef8c655ce2f6d6cff5258a06df82803bdea.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/9] wic: allow only supported fstypes
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:13 -0000

Restricted possible values of --fstype to the list of
supported types. This should catch incorrect values
when .wks file is being parsed.

Removed checks for empty fstype and mentioning of
unsupported fstype 'ontrackdm6aux3'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py              | 4 +++-
 scripts/lib/wic/partition.py             | 8 ++------
 scripts/lib/wic/plugins/imager/direct.py | 2 --
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index a039300..d026caa 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -136,7 +136,9 @@ class KickStart():
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
-        part.add_argument('--fstype')
+        part.add_argument('--fstype', default='vfat',
+                          choices=('ext2', 'ext3', 'ext4', 'btrfs',
+                                   'squashfs', 'vfat', 'msdos', 'swap'))
         part.add_argument('--label')
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 647a6fb..f0e88fb 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -136,11 +136,11 @@ class Partition():
                                "specify a non-zero --size/--fixed-size for that "
                                "partition." % self.mountpoint)
 
-            if self.fstype and self.fstype == "swap":
+            if self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
                 self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
-            elif self.fstype:
+            else:
                 rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
                                              self.lineno, self.fstype)
                 if os.path.isfile(rootfs):
@@ -217,10 +217,6 @@ class Partition():
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
-        if not self.fstype:
-            raise WicError("File system for partition %s not specified in "
-                           "kickstart, use --fstype option" % self.mountpoint)
-
         # Get rootfs size from bitbake variable if it's not set in .ks file
         if not self.size:
             # Bitbake variable ROOTFS_SIZE is calculated in
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 67fd183..79b948a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -487,8 +487,6 @@ class PartitionedImage():
                 parted_fs_type = "fat32"
             elif part.fstype == "msdos":
                 parted_fs_type = "fat16"
-            elif part.fstype == "ontrackdm6aux3":
-                parted_fs_type = "ontrackdm6aux3"
             else:
                 # Type for ext2/ext3/ext4/btrfs
                 parted_fs_type = "ext2"
-- 
2.1.4


