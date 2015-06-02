Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF30A757BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:55:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2015 08:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="704019096"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2015 08:56:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 908156A4005;
	Tue,  2 Jun 2015 08:55:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:02:01 +0300
Message-Id: <1433253725-14089-4-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/7] wic: Add gpt to the list of supported partition table formats
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
X-List-Received-Date: Tue, 02 Jun 2015 15:55:59 -0000

Only msdos partition table format was supported by wic source
plugins.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2fc0357..22c7b0a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -61,7 +61,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         kernel = "/bzImage"
 
-        if cr._ptable_format == 'msdos':
+        if cr._ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
@@ -106,7 +106,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         kernel = "/bzImage"
 
-        if cr._ptable_format == 'msdos':
+        if cr._ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 9c63855..c28b9af 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -100,7 +100,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         kernel = "/vmlinuz"
         syslinux_conf += "KERNEL " + kernel + "\n"
 
-        if cr._ptable_format == 'msdos':
+        if cr._ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index ebf95ae..29c873d 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -101,7 +101,7 @@ class RootfsPlugin(SourcePlugin):
         syslinux_conf += "LABEL linux\n"
         syslinux_conf += "  KERNEL /boot/bzImage\n"
 
-        if image_creator._ptable_format == 'msdos':
+        if image_creator._ptable_format in ('msdos', 'gpt'):
             rootstr = rootdev
         else:
             raise ImageError("Unsupported partition table format found")
-- 
2.1.4


