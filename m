Return-Path: <romuald.jeanne@st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37993C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:48:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web11.14429.1679320110417829480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=GE2S5NUb;
 spf=pass (domain: st.com, ip: 185.132.182.106, mailfrom: prvs=1443c70c56=romuald.jeanne@st.com)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KCtHsX026759
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 14:48:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ngss0wAAmlTVZ/dqdNy0puhoILpI+CAX7Xu4LZwiCKY=;
 b=GE2S5NUbQYrh4Xo+am9PIje6OMoSg/elzfrM8dfmlW7cqKCsgZTc5GTDfJ4vDDka07xe
 ya5QCKv7YQArwSqWVgA7j9dFeMMXIWGO4P67jKDVV1RepKgp2WfDWm2ru+rrvMntaqpv
 bYBut703dyfrkNj49qa3a27uQnQVOtreJqqVoh5Fh6sPCYnduJ45GgFjmg1Z9lkCppvj
 LF9GQmJDZatM0OE7CmxTEXmf/QEKTyc4nTdXE+0xPQju6CTLFi39BslLXK9zslPfX4l2
 U56kzlY5Ss/jppLeaWc5ZcbYAYQXFJxESvpxEC6BUDObj/khCQ2JdX4YCBWpJ3+20V5i +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pd3kq3dqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 14:48:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF7FA100034
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 14:48:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64D1A216ECF
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 14:48:27 +0100 (CET)
Received: from localhost (10.201.23.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 20 Mar
 2023 14:48:27 +0100
From: <romuald.jeanne@st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Romuald Jeanne <romuald.jeanne@st.com>
Subject: [PATCH] oeqa/selftest/imagefeatures: set a test for mutliubi in test_image_fstypes
Date: Mon, 20 Mar 2023 14:48:18 +0100
Message-ID: <20230320134818.4510-1-romuald.jeanne@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_09,2023-03-20_02,2023-02-09_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178830

From: Romuald Jeanne <romuald.jeanne@st.com>

Allow 'multiubi' fstype image.
Set 'MULTIUBI_BUILD' with two entries to allow configuration for two
different '.ubifs'.
Configure 'MKUBIFS_ARGS_*' and 'UBINIZE_ARGS_*' for both configurations.

Signed-off-by: Romuald Jeanne <romuald.jeanne@st.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index bdd4d3200e2..cc374663e1a 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -203,7 +203,7 @@ class ImageFeatures(OESelftestTestCase):
         image_name = 'core-image-minimal'
 
         all_image_types = set(get_bb_var("IMAGE_TYPES", image_name).split())
-        skip_image_types = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
+        skip_image_types = set(('container', 'elf', 'f2fs', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
         img_types = all_image_types - skip_image_types
 
         config = """
@@ -211,6 +211,12 @@ IMAGE_FSTYPES += "%s"
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
 
@@ -219,10 +225,21 @@ UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512"
         deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
         link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
         for itype in img_types:
-            image_path = os.path.join(deploy_dir_image, "%s.%s" % (link_name, itype))
-            # check if result image is in deploy directory
-            self.assertTrue(os.path.exists(image_path),
-                            "%s image %s doesn't exist" % (itype, image_path))
+            if itype == 'multiubi':
+                # For multiubi build we need to manage MULTIUBI_BUILD entry to append
+                # specific name to IMAGE_LINK_NAME
+                multiubi_build = get_bb_var('MULTIUBI_BUILD', image_name).split()
+                for vname in multiubi_build:
+                    image_path = os.path.join(deploy_dir_image, "%s_%s.ubifs" % (link_name, vname))
+                    # check if result image is in deploy directory
+                    self.assertTrue(os.path.exists(image_path),
+                                    "%s image %s doesn't exist" % (itype, image_path))
+            else:
+                image_path = os.path.join(deploy_dir_image, "%s.%s" % (link_name, itype))
+                # check if result image is in deploy directory
+                self.assertTrue(os.path.exists(image_path),
+                                "%s image %s doesn't exist" % (itype, image_path))
+
 
     def test_useradd_static(self):
         config = """
-- 
2.17.1


