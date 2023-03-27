Return-Path: <romuald.jeanne@st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5F8C761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 14:38:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web10.36615.1679927917258924189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 07:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=BU0fJRPL;
 spf=pass (domain: st.com, ip: 185.132.182.106, mailfrom: prvs=1450df14b0=romuald.jeanne@st.com)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RC1GXB023650
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:38:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qe6iOZ3jM3qXHMstDJXj4ykWzlxSIYryW2PmEFTKI1M=;
 b=BU0fJRPLinZ30H79n3ca6Uz9ES7RsGLeeeIHjWFGm1WgaTfgFNB6ntKU9KcJU/frqMo1
 Xwrmr3jmv675uG/6z1N5t8hNzbCY+r55viuX7mpBJqShJ/8wx+MnnbQEwvW+eQ4LJty2
 R7r6kA2c5HVyMcvTJikMhk/jnSpu6fr/+33+1XRGZ3Mob7vVIEg5PmGTlqS6y1zCQPpk
 IZeF5pL/vaA8zqZv8bXERL+nGzxfUoX5iI943i2c5cWJqu1qfNmrlwpE2anFD9gjFra9
 kjZtBUIGa3enGDLuTffUXcC44t+br8L+f8466ho2/d09P91KSbM5QHoWKkWb/MYRsATL +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsqwbqgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:38:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7013F10002A
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:38:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A69B6218622
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:38:33 +0200 (CEST)
Received: from localhost (10.201.23.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 16:38:33 +0200
From: <romuald.jeanne@st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Romuald Jeanne <romuald.jeanne@st.com>
Subject: [PATCH] oeqa/selftest/imagefeatures: set a test for mutliubi in test_image_fstypes
Date: Mon, 27 Mar 2023 16:38:30 +0200
Message-ID: <20230327143830.29934-1-romuald.jeanne@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.79]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179163

From: Romuald Jeanne <romuald.jeanne@st.com>

Allow 'multiubi' fstype image.
Set 'MULTIUBI_BUILD' with two entries to allow configuration for two
different '.ubifs'.
Configure 'MKUBIFS_ARGS_*' and 'UBINIZE_ARGS_*' for both configurations.

Signed-off-by: Romuald Jeanne <romuald.jeanne@st.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 3dc750594c7..d31b43d9cc1 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -199,7 +199,7 @@ class ImageFeatures(OESelftestTestCase):
         image = 'core-image-minimal'
 
         all_image_types = set(get_bb_var("IMAGE_TYPES", image).split())
-        skip_image_types = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
+        skip_image_types = set(('container', 'elf', 'f2fs', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
         img_types = all_image_types - skip_image_types
 
         config = """
@@ -207,16 +207,31 @@ IMAGE_FSTYPES += "%s"
 WKS_FILE = "wictestdisk.wks"
 MKUBIFS_ARGS ?= "-m 2048 -e 129024 -c 2047"
 UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512"
+MULTIUBI_BUILD += "mtd_2_128"
+MKUBIFS_ARGS_mtd_2_128 ?= "-m 2048 -e 129024 -c 2047"
+UBINIZE_ARGS_mtd_2_128 ?= "-m 2048 -p 128KiB -s 512"
+MULTIUBI_BUILD += "mtd_4_256"
+MKUBIFS_ARGS_mtd_4_256 ?= "-m 4096 -e 253952 -c 4096"
+UBINIZE_ARGS_mtd_4_256 ?= "-m 4096 -p 256KiB"
 """ % ' '.join(img_types)
         self.write_config(config)
 
         bitbake(image)
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', 'MULTIUBI_BUILD'], image)
 
         for itype in img_types:
-            image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], itype))
-            # check if result image is in deploy directory
-            self.assertTrue(os.path.exists(image_path),
+            if itype == 'multiubi':
+                # For multiubi build we need to manage MULTIUBI_BUILD entry to append
+                # specific name to IMAGE_LINK_NAME
+                for vname in bb_vars['MULTIUBI_BUILD'].split():
+                    image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s_%s.ubifs" % (bb_vars['IMAGE_LINK_NAME'], vname))
+                    # check if result image is in deploy directory
+                    self.assertTrue(os.path.exists(image_path),
+                                    "%s image %s doesn't exist" % (itype, image_path))
+            else:
+            	image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], itype))
+            	# check if result image is in deploy directory
+            	self.assertTrue(os.path.exists(image_path),
                             "%s image %s doesn't exist" % (itype, image_path))
 
     def test_useradd_static(self):
-- 
2.17.1


