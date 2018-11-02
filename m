Return-Path: <Arsalan_Awan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9B41579F7D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:47:12 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gIaxW-0001Dp-12 from Arsalan_Awan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Nov 2018 08:02:02 -0700
Received: from PKL-AAWAN1-UBUNTU.pkl.mentorg.com (137.202.0.90) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 2 Nov 2018 15:01:57 +0000
From: Arsalan Awan <Arsalan_Awan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 20:01:42 +0500
Message-ID: <6bf54a814e2aaa03e262aa2edd529405d391ee22.1541168618.git.Arsalan_Awan@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541168618.git.Arsalan_Awan@mentor.com>
References: <cover.1541168618.git.Arsalan_Awan@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Subject: [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix booting from removable media
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
X-List-Received-Date: Fri, 02 Nov 2018 15:47:12 -0000
Content-Type: text/plain

From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>

The EFI bootloader name and path for being able to boot from a
removable storage media - such as USB - must be like:

  /EFI/BOOT/boot<arch>.efi
  /EFI/BOOT/bootx64.efi
  /EFI/BOOT/bootia32.efi
  /EFI/BOOT/bootaa64.efi

otherwise system will not be able to boot from it.

This commit fixes the grub-efi bootloader destination image name
accordingly just like efi_populate() function does it in
meta/classes/grub-efi.bbclass.

Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index d6bd3bf..9a30713 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -329,13 +329,15 @@ class IsoImagePlugin(SourcePlugin):
 
                 if re.match("x86_64", target_arch):
                     grub_image = "grub-efi-bootx64.efi"
+                    grub_image_dst = "bootx64.efi"
                 elif re.match('i.86', target_arch):
                     grub_image = "grub-efi-bootia32.efi"
+                    grub_image_dst = "bootia32.efi"
                 else:
                     raise WicError("grub-efi is incompatible with target %s" %
                                    target_arch)
 
-                grub_target = os.path.join(target_dir, grub_image)
+                grub_target = os.path.join(target_dir, grub_image_dst)
                 if not os.path.isfile(grub_target):
                     grub_src = os.path.join(deploy_dir, grub_image)
                     if not os.path.exists(grub_src):
-- 
2.7.4


