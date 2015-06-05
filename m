Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D700375771
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:06:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 05 Jun 2015 01:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="737561412"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2015 01:06:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id D32536A4083;
	Fri,  5 Jun 2015 01:06:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 09:13:08 +0300
Message-Id: <1433484789-304-4-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/4] wic: replaced __run_parted with exec_native_cmd
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
X-List-Received-Date: Fri, 05 Jun 2015 08:06:57 -0000

There is no need for yet another wrapper around exec_native_cmd.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 8fd44a6..dcb63e5 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -220,15 +220,6 @@ class Image:
 
             d['min_size'] *= self.sector_size
 
-    def __run_parted(self, args):
-        """ Run parted with arguments specified in the 'args' list. """
-
-        args.insert(0, "parted")
-        args = ' '.join(args)
-        msger.debug(args)
-
-        exec_native_cmd(args, self.native_sysroot)
-
     def __create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' object. """
 
@@ -237,12 +228,12 @@ class Image:
         msger.debug("Added '%s' partition, sectors %d-%d, size %d sectors" %
                     (parttype, start, end, size))
 
-        args = ["-s", device, "unit", "s", "mkpart", parttype]
+        cmd = "parted -s %s unit s mkpart %s" % (device, parttype)
         if fstype:
-            args.extend([fstype])
-        args.extend(["%d" % start, "%d" % end])
+            cmd += " %s" % fstype
+        cmd += " %d %d" % (start, end)
 
-        return self.__run_parted(args)
+        return exec_native_cmd(cmd, self.native_sysroot)
 
     def __format_disks(self):
         self.layout_partitions()
@@ -251,8 +242,9 @@ class Image:
             d = self.disks[dev]
             msger.debug("Initializing partition table for %s" % \
                         (d['disk'].device))
-            self.__run_parted(["-s", d['disk'].device, "mklabel",
-                               d['ptable_format']])
+            exec_native_cmd("parted -s %s mklabel %s" % \
+                            (d['disk'].device, d['ptable_format']),
+                            self.native_sysroot)
 
         msger.debug("Creating partitions")
 
@@ -305,8 +297,9 @@ class Image:
                 flag_name = "legacy_boot" if d['ptable_format'] == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
                             (flag_name, p['num'], d['disk'].device))
-                self.__run_parted(["-s", d['disk'].device, "set",
-                                   "%d" % p['num'], flag_name, "on"])
+                exec_native_cmd("parted -s %s set %d %s on" % \
+                                (d['disk'].device, p['num'], flag_name),
+                                self.native_sysroot)
 
             # Parted defaults to enabling the lba flag for fat16 partitions,
             # which causes compatibility issues with some firmware (and really
@@ -315,8 +308,9 @@ class Image:
                 if d['ptable_format'] == 'msdos':
                     msger.debug("Disable 'lba' flag for partition '%s' on disk '%s'" % \
                                 (p['num'], d['disk'].device))
-                    self.__run_parted(["-s", d['disk'].device, "set",
-                                       "%d" % p['num'], "lba", "off"])
+                    exec_native_cmd("parted -s %s set %d lba off" % \
+                                    (d['disk'].device, p['num']),
+                                    self.native_sysroot)
 
     def cleanup(self):
         if self.disks:
-- 
2.1.4


