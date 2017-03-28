Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 308AF77B14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490705002; x=1522241002;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/K6VEvIEMzUDUOK83uCBcCi8Sdq+BEBln2q50as1WBw=;
	b=S41yfiYo0xpMvLTjz+UKeTQGnsjjKJ4XjSPtIbPltQSFTPGSegK+N2pc
	KKaTRVjljighIVGP1iLuj44/BZ4P/w==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="71268582"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 28 Mar 2017 05:43:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E507F6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:03 +0300
Message-Id: <1c068947e561a336bcfaf6bb433d7bf4c6e25908.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/9] wic: use wic-tools STAGING_DATADIR as bootimg_dir
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:20 -0000

If bootloader artifacts are not found in default bootimg_dir
use wic-tools sysroot for the same purpose. This should
prevent wic from failing if bootloader artifacts can't be
found in image native sysroot.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 42 +++++++++++-------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 11db304..bfb8ff5 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -44,19 +44,16 @@ class BootimgPcbiosPlugin(SourcePlugin):
     name = 'bootimg-pcbios'
 
     @classmethod
-    def _get_syslinux_dir(cls, bootimg_dir):
+    def _get_bootimg_dir(cls, bootimg_dir, dirname):
         """
-        Get path to syslinux from either default bootimg_dir
-        or wic-tools STAGING_DIR.
+        Check if dirname exists in default bootimg_dir or
+        in wic-tools STAGING_DIR.
         """
-        for path in (bootimg_dir, get_bitbake_var("STAGING_DATADIR", "wic-tools")):
-            if not path:
-                continue
-            syslinux_dir = os.path.join(path, 'syslinux')
-            if os.path.exists(syslinux_dir):
-                return syslinux_dir
+        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR", "wic-tools")):
+            if os.path.exists("%s/%s" % (result, dirname)):
+                return result
 
-        raise WicError("Couldn't find syslinux directory, exiting")
+        raise WicError("Couldn't find correct bootimg_dir, exiting")
 
     @classmethod
     def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
@@ -65,11 +62,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
         """
-        syslinux_dir = cls._get_syslinux_dir(bootimg_dir)
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
+        mbrfile = "%s/syslinux/" % bootimg_dir
         if creator.ptable_format == 'msdos':
-            mbrfile = os.path.join(syslinux_dir, "mbr.bin")
+            mbrfile += "mbr.bin"
         elif creator.ptable_format == 'gpt':
-            mbrfile = os.path.join(syslinux_dir, "gptmbr.bin")
+            mbrfile += "gptmbr.bin"
         else:
             raise WicError("Unsupported partition table: %s" %
                            creator.ptable_format)
@@ -155,7 +153,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        syslinux_dir = cls._get_syslinux_dir(bootimg_dir)
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
 
         staging_kernel_dir = kernel_dir
 
@@ -163,14 +161,14 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
                 (staging_kernel_dir, hdddir),
-                "install -m 444 %s/ldlinux.sys %s/ldlinux.sys" %
-                (syslinux_dir, hdddir),
-                "install -m 0644 %s/vesamenu.c32 %s/vesamenu.c32" %
-                (syslinux_dir, hdddir),
-                "install -m 444 %s/libcom32.c32 %s/libcom32.c32" %
-                (syslinux_dir, hdddir),
-                "install -m 444 %s/libutil.c32 %s/libutil.c32" %
-                (syslinux_dir, hdddir))
+                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
+                (bootimg_dir, hdddir),
+                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
+                (bootimg_dir, hdddir))
 
         for install_cmd in cmds:
             exec_cmd(install_cmd)
-- 
2.1.4


