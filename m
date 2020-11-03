Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.4769.1604441437831510839
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 14:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=457682e720=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0A3Lr8B8010331
	for <Openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2020 16:10:37 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 34h5esgknj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <Openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 16:10:37 -0600
Received: from us-aus-exch1.ni.corp.natinst.com (us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.43/8.16.0.43) with ESMTPS id 0A3MAaCc030011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <Openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2020 16:10:36 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 3 Nov 2020 16:10:36 -0600
Received: from cvadrevu-linux.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1395.4 via Frontend Transport; Tue, 3 Nov 2020 16:10:36 -0600
From: "Chaitanya Vadrevu" <chaitanya.vadrevu@ni.com>
To: <Openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [PATCH] isoimage-isohybrid.py: Support adding files/dirs
Date: Tue, 3 Nov 2020 16:10:32 -0600
Message-ID: <20201103221032.19129-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_16:2020-11-03,2020-11-03 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Content-Type: text/plain

Add "payload_dir" parameter so user can add other files/dirs
to the ISO.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 11326a274b..afc9ea0f8f 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -216,6 +216,18 @@ class IsoImagePlugin(SourcePlugin):
             creator.name = source_params['image_name'].strip()
             logger.debug("The name of the image is: %s", creator.name)
 
+    @staticmethod
+    def _install_payload(source_params, iso_dir):
+        """
+        Copies contents of payload directory (as specified in 'payload_dir' param) into iso_dir
+        """
+
+        if source_params.get('payload_dir'):
+            payload_dir = source_params['payload_dir']
+
+            logger.debug("Payload directory: %s", payload_dir)
+            shutil.copytree(payload_dir, iso_dir, symlinks=True, dirs_exist_ok=True)
+
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -228,6 +240,8 @@ class IsoImagePlugin(SourcePlugin):
 
         isodir = "%s/ISO" % cr_workdir
 
+        cls._install_payload(source_params, isodir)
+
         if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in rootfs_dir:
                 raise WicError("Couldn't find --rootfs-dir, exiting.")
-- 
2.17.1

