Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7834E77B59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190248; x=1521726248;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nmyHoi4msOuM4gTLotz2F/PCuw3trxfbjrWg2hVAYrk=;
	b=eYl4h/yNIIc6XFHbMoWPf2MhHEMgHY9onoIib4R9IGEW9R25Vn9Im1/A
	+uV5a/iE+RDGVgeWFPxgXFgxSDGNKA==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="78187177"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 22 Mar 2017 06:44:07 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 80FCA2C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:44:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:31 +0200
Message-Id: <5ef6560db5a1ab1480e5721ffed311c75b27dcd9.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/10] wic: improve getting syslinux path
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:06 -0000

Used wic-tools STAGING_DATADIR if syslinux can't be found
in default bootimg_dir.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 51 +++++++++++++-----------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 1779520..11db304 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -44,17 +44,32 @@ class BootimgPcbiosPlugin(SourcePlugin):
     name = 'bootimg-pcbios'
 
     @classmethod
+    def _get_syslinux_dir(cls, bootimg_dir):
+        """
+        Get path to syslinux from either default bootimg_dir
+        or wic-tools STAGING_DIR.
+        """
+        for path in (bootimg_dir, get_bitbake_var("STAGING_DATADIR", "wic-tools")):
+            if not path:
+                continue
+            syslinux_dir = os.path.join(path, 'syslinux')
+            if os.path.exists(syslinux_dir):
+                return syslinux_dir
+
+        raise WicError("Couldn't find syslinux directory, exiting")
+
+    @classmethod
     def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
         """
-        mbrfile = "%s/syslinux/" % bootimg_dir
+        syslinux_dir = cls._get_syslinux_dir(bootimg_dir)
         if creator.ptable_format == 'msdos':
-            mbrfile += "mbr.bin"
+            mbrfile = os.path.join(syslinux_dir, "mbr.bin")
         elif creator.ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
+            mbrfile = os.path.join(syslinux_dir, "gptmbr.bin")
         else:
             raise WicError("Unsupported partition table: %s" %
                            creator.ptable_format)
@@ -140,19 +155,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        def _has_syslinux(dirname):
-            if dirname:
-                syslinux = "%s/syslinux" % dirname
-                if os.path.exists(syslinux):
-                    return True
-            return False
-
-        if not _has_syslinux(bootimg_dir):
-            bootimg_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
-            if not bootimg_dir:
-                raise WicError("Couldn't find STAGING_DATADIR, exiting")
-            if not _has_syslinux(bootimg_dir):
-                raise WicError("Please build syslinux first")
+        syslinux_dir = cls._get_syslinux_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
 
@@ -160,14 +163,14 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
                 (staging_kernel_dir, hdddir),
-                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
-                (bootimg_dir, hdddir),
-                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
-                (bootimg_dir, hdddir),
-                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
-                (bootimg_dir, hdddir),
-                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
-                (bootimg_dir, hdddir))
+                "install -m 444 %s/ldlinux.sys %s/ldlinux.sys" %
+                (syslinux_dir, hdddir),
+                "install -m 0644 %s/vesamenu.c32 %s/vesamenu.c32" %
+                (syslinux_dir, hdddir),
+                "install -m 444 %s/libcom32.c32 %s/libcom32.c32" %
+                (syslinux_dir, hdddir),
+                "install -m 444 %s/libutil.c32 %s/libutil.c32" %
+                (syslinux_dir, hdddir))
 
         for install_cmd in cmds:
             exec_cmd(install_cmd)
-- 
2.1.4


