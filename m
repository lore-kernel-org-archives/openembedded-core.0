Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 066B077D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899521; x=1522435521;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TX23vx9hM35XpRQ4VIf1ckZG+XnszjZG5wgUcOcZp4E=;
	b=Vrg6nPYNi4P17gst15e6MRBJj7KWMnj+tA0aLU5ggEGg+3vCIETYzi1a
	WpE4ycBLp4Gtp6fInA68MkWki7eK0A==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="949916427"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2017 11:45:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id ECA342C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:51 +0300
Message-Id: <46c0422039f93c384aa4adf4acde2f1137c39717.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 9/9] wic: remove prepare_empty_partition_squashfs
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:20 -0000

There is not much sense in creation of empty squashfs
partition. It's also not possible to create empty squashfs
partition of specified size.

Even more, prepare_empty_partition_squashfs method is
absolutely broken. It raises exception when called and
even its signature differs from the rest of of similar
methods. It means that nobody uses it and it's safe
to remove it.

Removed prepare_empty_partition_squashfs method and
testing of empty squashfs partition.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py |  3 +--
 scripts/lib/wic/partition.py  | 33 ++++-----------------------------
 2 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index c160f5f..df5e060 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -729,8 +729,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                             'part emptyvfat   --fstype vfat   --size 1M\n',
                             'part emptymsdos  --fstype msdos  --size 1M\n',
                             'part emptyext2   --fstype ext2   --size 1M\n',
-                            'part emptybtrfs  --fstype btrfs  --size 100M\n',
-                            'part emptysquash --fstype squashfs --size 1M\n'])
+                            'part emptybtrfs  --fstype btrfs  --size 100M\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
             self.assertEqual(0, runCmd(cmd).status)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 6f324ad..5edb340 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -141,6 +141,10 @@ class Partition():
                                             native_sysroot)
                 self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
             else:
+                if self.fstype == 'squashfs':
+                    raise WicError("It's not possible to create empty squashfs "
+                                   "partition '%s'" % (self.mountpoint))
+
                 rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
                                              self.lineno, self.fstype)
                 if os.path.isfile(rootfs):
@@ -390,35 +394,6 @@ class Partition():
 
     prepare_empty_partition_vfat = prepare_empty_partition_msdos
 
-    def prepare_empty_partition_squashfs(self, cr_workdir, oe_builddir,
-                                         native_sysroot):
-        """
-        Prepare an empty squashfs partition.
-        """
-        logger.warning("Creating of an empty squashfs %s partition was attempted. "
-                       "Proceeding as requested.", self.mountpoint)
-
-        path = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        if os.path.isfile(path):
-            os.remove(path)
-
-        # it is not possible to create a squashfs without source data,
-        # thus prepare an empty temp dir that is used as source
-        tmpdir = tempfile.mkdtemp()
-
-        squashfs_cmd = "mksquashfs %s %s -noappend" % \
-                       (tmpdir, path)
-        exec_native_cmd(squashfs_cmd, native_sysroot)
-
-        os.rmdir(tmpdir)
-
-        # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % path
-        out = exec_cmd(du_cmd)
-        fs_size = out.split()[0]
-
-        self.size = int(fs_size)
-
     def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
         """
         Prepare a swap partition.
-- 
2.1.4


