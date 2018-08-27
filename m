Return-Path: <prvs=7777a5c19a=alexandru.vasiu@ni.com>
X-Greylist: delayed 2755 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Aug 2018 15:17:05 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id E566D78EEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:17:05 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7REKPJO025861 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:14 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2m334x6rpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:14 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7REVCDB003458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:12 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 09:31:12 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 09:31:11 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 17:31:04 +0300
Message-ID: <20180827143105.30059-2-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827143105.30059-1-alexandru.vasiu@ni.com>
References: <20180827143105.30059-1-alexandru.vasiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 2/3] isoimage-isohybrid: Fix variable names
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
X-List-Received-Date: Mon, 27 Aug 2018 15:17:06 -0000
Content-Type: text/plain

initrd.cpio is created in initrd_dir, not in cr_workdir. Gzip will
let initrd.cpio uncompressed if the path is not found.

Also, grub_image variable doesn't exist, grub_src_image should
be used instead.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 4a0a57ef9e..25a695da17 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -194,7 +194,7 @@ class IsoImagePlugin(SourcePlugin):
             exec_cmd("cd %s && find . | cpio -o -H newc -R root:root >./initrd.cpio " \
                     % initrd_dir, as_shell=True)
             exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
-                    % (cr_workdir, initrd), as_shell=True)
+                    % (initrd_dir, initrd), as_shell=True)
             shutil.rmtree(initrd_dir)
 
         return initrd
@@ -317,7 +317,7 @@ class IsoImagePlugin(SourcePlugin):
                     grub_src = os.path.join(deploy_dir, grub_src_image)
                     if not os.path.exists(grub_src):
                         raise WicError("Grub loader %s is not found in %s. "
-                                       "Please build grub-efi first" % (grub_image, deploy_dir))
+                                       "Please build grub-efi first" % (grub_src_image, deploy_dir))
                     shutil.copy(grub_src, grub_target)
 
                 if not os.path.isfile(os.path.join(target_dir, "boot.cfg")):
-- 
2.18.0


