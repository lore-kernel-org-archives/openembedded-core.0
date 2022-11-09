Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C893DC4321E
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1540.1668022307154915422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E79661FB;
	Wed,  9 Nov 2022 11:31:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5090D3F703;
	Wed,  9 Nov 2022 11:31:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 06/15] oeqa/selftest/imagefeatures: don't use wic images in test_hypervisor_fmts
Date: Wed,  9 Nov 2022 19:31:26 +0000
Message-Id: <20221109193135.291048-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193135.291048-1-ross.burton@arm.com>
References: <20221109193135.291048-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173039

There's no need to build a wic image in this test as not all machines
(such as qemuarm64 currently) have wic images out of the box.

We can simply build ext4 images to work on more machines and save some ti=
me.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeq=
a/selftest/cases/imagefeatures.py
index f259ebb8041..df796eaed09 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -136,7 +136,7 @@ class ImageFeatures(OESelftestTestCase):
         img_types =3D [ 'vmdk', 'vdi', 'qcow2' ]
         features =3D ""
         for itype in img_types:
-            features +=3D 'IMAGE_FSTYPES +=3D "wic.%s"\n' % itype
+            features +=3D 'IMAGE_FSTYPES +=3D "ext4.%s"\n' % itype
         self.write_config(features)
=20
         image_name =3D 'core-image-minimal'
@@ -145,7 +145,7 @@ class ImageFeatures(OESelftestTestCase):
         deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
         link_name =3D get_bb_var('IMAGE_LINK_NAME', image_name)
         for itype in img_types:
-            image_path =3D os.path.join(deploy_dir_image, "%s.wic.%s" %
+            image_path =3D os.path.join(deploy_dir_image, "%s.ext4.%s" %
                                       (link_name, itype))
=20
             # check if result image file is in deploy directory
--=20
2.34.1


