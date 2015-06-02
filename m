Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CBB9A757BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:55:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2015 08:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="501595968"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2015 08:56:01 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E74416A4005;
	Tue,  2 Jun 2015 08:55:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:02:02 +0300
Message-Id: <1433253725-14089-5-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/7] wic: Use gptmbr.bin MBR for gpt partitions
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
X-List-Received-Date: Tue, 02 Jun 2015 15:56:00 -0000

Used proper syslinux MBR gptmbr.bin for GPT partitons.
Added check for unsupported partition formats.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index c28b9af..ab62b7a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -46,6 +46,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
         mbrfile = "%s/syslinux/" % bootimg_dir
         if cr._ptable_format == 'msdos':
             mbrfile += "mbr.bin"
+        elif cr._ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            msger.error("Unsupported partition table: %s" % cr._ptable_format)
 
         if not os.path.exists(mbrfile):
             msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path correct?" % mbrfile)
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 29c873d..cdd7c84 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -169,7 +169,15 @@ class RootfsPlugin(SourcePlugin):
         Called after all partitions have been prepared and assembled into a
         disk image. In this case, we install the MBR.
         """
-        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
+        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/")
+        if image_creator._ptable_format == 'msdos':
+            mbrfile += "mbr.bin"
+        elif image_creator._ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            msger.error("Unsupported partition table: %s" % \
+                        image_creator._ptable_format)
+
         if not os.path.exists(mbrfile):
             msger.error("Couldn't find %s. Has syslinux-native been baked?" % mbrfile)
 
-- 
2.1.4


