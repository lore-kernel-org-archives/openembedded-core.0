Return-Path: <prvs=6717f2ab70=adrian.ratiu@ni.com>
X-Greylist: delayed 807 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jun 2018 14:10:24 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0B57479D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 14:10:24 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w5SDuIum001114 for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:57:00 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2jucuu8a0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:56:59 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w5SDuxO1002651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:56:59 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 28 Jun 2018 08:56:58 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 28 Jun 2018 08:56:58 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 28 Jun 2018 08:56:58 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 16:58:33 +0300
Message-ID: <20180628135833.13156-2-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180628135833.13156-1-adrian.ratiu@ni.com>
References: <20180628135833.13156-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-06-28_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 2/2] wic: isoimage-isohybrid: debloat image of redundant rootfs
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
X-List-Received-Date: Thu, 28 Jun 2018 14:10:24 -0000
Content-Type: text/plain

There's no reason to have that rootfs.img filesystem in the image:
it's not used for anything because both the EFI and legacy boot paths
use the /initrd which contains the same contents as the rootfs.img,
only compressed. It was probably forgotten in there :)

My iso went down from 224 to 94 mb.

Tested using UEFI/legacy boots on CD-roms, usb dongle and qemu VM's.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/canned-wks/mkhybridiso.wks    |  2 +-
 .../wic/plugins/source/isoimage-isohybrid.py  | 27 +------------------
 2 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/mkhybridiso.wks b/scripts/lib/wic/canned-wks/mkhybridiso.wks
index 9d34e9b477..48c5ac4791 100644
--- a/scripts/lib/wic/canned-wks/mkhybridiso.wks
+++ b/scripts/lib/wic/canned-wks/mkhybridiso.wks
@@ -2,6 +2,6 @@
 # long-description: Creates an EFI and legacy bootable hybrid ISO image
 # which can be used on optical media as well as USB media.
 
-part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi,image_name=HYBRID_ISO_IMG" --ondisk cd --label HYBRIDISO --fstype=ext4
+part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi,image_name=HYBRID_ISO_IMG" --ondisk cd --label HYBRIDISO
 
 bootloader  --timeout=15  --append=""
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index b119c9c2fd..0d4f50d1f7 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -47,7 +47,7 @@ class IsoImagePlugin(SourcePlugin):
 
     Example kickstart file:
     part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi, \\
-    image_name= IsoImage" --ondisk cd --label LIVECD --fstype=ext2
+    image_name= IsoImage" --ondisk cd --label LIVECD
     bootloader  --timeout=10  --append=" "
 
     In --sourceparams "loader" specifies the bootloader used for booting in EFI
@@ -253,33 +253,8 @@ class IsoImagePlugin(SourcePlugin):
             raise WicError("Couldn't find IMAGE_ROOTFS, exiting.")
 
         part.rootfs_dir = rootfs_dir
-
-        # Prepare rootfs.img
         deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
         img_iso_dir = get_bitbake_var("ISODIR")
-        rootfs_img = "%s/rootfs.img" % img_iso_dir
-        if not os.path.isfile(rootfs_img):
-            # check if rootfs.img is in deploydir
-            deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            image_name = get_bitbake_var("IMAGE_LINK_NAME")
-            rootfs_img = "%s/%s.%s" \
-                % (deploy_dir, image_name, part.fstype)
-
-        if not os.path.isfile(rootfs_img):
-            # create image file with type specified by --fstype
-            # which contains rootfs
-            du_cmd = "du -bks %s" % rootfs_dir
-            out = exec_cmd(du_cmd)
-            part.size = int(out.split()[0])
-            part.extra_space = 0
-            part.overhead_factor = 1.2
-            part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, \
-                                native_sysroot)
-            rootfs_img = part.source_file
-
-        install_cmd = "install -m 0644 %s %s/rootfs.img" \
-            % (rootfs_img, isodir)
-        exec_cmd(install_cmd)
 
         # Remove the temporary file created by part.prepare_rootfs()
         if os.path.isfile(part.source_file):
-- 
2.18.0


