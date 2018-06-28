Return-Path: <prvs=6717f2ab70=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 20E8C74A0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 14:37:03 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w5SDuGQf015569 for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:56:58 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2jvdqwu2v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:56:58 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w5SDuv5V021312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:56:57 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 28 Jun 2018 08:56:57 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 28 Jun 2018 08:56:56 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 16:58:32 +0300
Message-ID: <20180628135833.13156-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-06-28_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 1/2] wic: isoimage-isohybrid: fix UEFI spec breakage
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
X-List-Received-Date: Thu, 28 Jun 2018 14:37:04 -0000
Content-Type: text/plain

It's really good that OE supports multiple EFI_PROVIDERs and that
commit 9a1709278de87 ("wic: isoimage-isohybrid: use grub-efi from
deploy dir") makes re-use of the grub-efi built image, but we should
still respect the standard otherwise the ISO will not boot, so install
grub images as boot[x64|ia32].efi not ${PN}-boot[x64|ia32].efi.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index d6bd3bff7b..b119c9c2fd 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -328,16 +328,18 @@ class IsoImagePlugin(SourcePlugin):
                     raise WicError("Coludn't find target architecture")
 
                 if re.match("x86_64", target_arch):
-                    grub_image = "grub-efi-bootx64.efi"
+                    grub_src_image = "grub-efi-bootx64.efi"
+                    grub_dest_image = "bootx64.efi"
                 elif re.match('i.86', target_arch):
-                    grub_image = "grub-efi-bootia32.efi"
+                    grub_src_image = "grub-efi-bootia32.efi"
+                    grub_dest_image = "bootia32.efi"
                 else:
                     raise WicError("grub-efi is incompatible with target %s" %
                                    target_arch)
 
-                grub_target = os.path.join(target_dir, grub_image)
+                grub_target = os.path.join(target_dir, grub_dest_image)
                 if not os.path.isfile(grub_target):
-                    grub_src = os.path.join(deploy_dir, grub_image)
+                    grub_src = os.path.join(deploy_dir, grub_src_image)
                     if not os.path.exists(grub_src):
                         raise WicError("Grub loader %s is not found in %s. "
                                        "Please build grub-efi first" % (grub_image, deploy_dir))
-- 
2.18.0


