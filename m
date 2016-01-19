Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 743E6731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 10:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="636345824"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2016 10:48:49 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D10332C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:44 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:05 +0200
Message-Id: <2dda414f6c4ac8615407965a3aad279d0d4cc02c.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 3/9] wic: do not remove build dir in source plugins
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
X-List-Received-Date: Tue, 19 Jan 2016 18:48:48 -0000

Interesting bug was found during implementation of 'include'
parser command.

Build directory was removed in do_configure_partition method of
bootimg- source plugins. This can cause removal of previously
prepared partition images if /boot partition is mentioned after
other partitions in .ks file.

Moved work directory removal to direct.py before processing
partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py                    | 3 +++
 scripts/lib/wic/plugins/source/bootimg-efi.py       | 2 --
 scripts/lib/wic/plugins/source/bootimg-partition.py | 3 ---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    | 2 --
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 8d4daec..a1b4249 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -229,6 +229,9 @@ class DirectImageCreator(BaseImageCreator):
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
+        shutil.rmtree(self.workdir)
+        os.mkdir(self.workdir)
+
         for part in parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
             if not part.size:
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 125c943..a4734c9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -142,8 +142,6 @@ class BootimgEFIPlugin(SourcePlugin):
         Called before do_prepare_partition(), creates loader-specific config
         """
         hdddir = "%s/hdd/boot" % cr_workdir
-        rm_cmd = "rm -rf %s" % cr_workdir
-        exec_cmd(rm_cmd)
 
         install_cmd = "install -d %s/EFI/BOOT" % hdddir
         exec_cmd(install_cmd)
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index bc2ca0f..b76c121 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -71,9 +71,6 @@ class BootimgPartitionPlugin(SourcePlugin):
         - copies all files listed in IMAGE_BOOT_FILES variable
         """
         hdddir = "%s/boot" % cr_workdir
-        rm_cmd = "rm -rf %s/boot" % cr_workdir
-        exec_cmd(rm_cmd)
-
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index a1bfa26..5b719bf 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -78,8 +78,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
         Called before do_prepare_partition(), creates syslinux config
         """
         hdddir = "%s/hdd/boot" % cr_workdir
-        rm_cmd = "rm -rf " + cr_workdir
-        exec_cmd(rm_cmd)
 
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
-- 
2.1.4


