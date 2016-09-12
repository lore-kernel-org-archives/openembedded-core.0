Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 48E1A76E3F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 22:57:51 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x24so8679715pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HVugMdgYZSKjSNLg1Tat1HY7g4tV35vBM+FembKllKw=;
	b=dTK8CubcvNCYtRJ+XdRoIcjLupoecp7ceS+rGUEpguoPICmSvs3PaFsNZ4t+OYRXFx
	1kro9AA192oWX98Bs1arYcs+wa1P1FYus1lISAeAtO5hlZAVxaxRn96b5gvprE/T6k8X
	Z3XTgrhCzRsGU02uEL2uZhgw6EZs/ZFYirfmvpMK7NUec5RJwNE6zs6ITdHvLWLpFcT8
	9dGG8UuhKy52NhrRKN2uG8AXO1225DugEJMXG+d1f/fKTuQ8NyWfpF1Q/+/Nxu5U24Sc
	EF5pB6ad0H6VaWU1OPHUqQ9+ZqiqXurc5JMHsS8WNs3MKLvGBAKbuATfgS4A0i9eiHlm
	Xdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HVugMdgYZSKjSNLg1Tat1HY7g4tV35vBM+FembKllKw=;
	b=VI3sgm4XOAp+I2nuBI8QzaKOuVAbe5cSnjFF0fP36hL9N4OG1kQLaRss3xeYk17GOK
	Fadi+12b4O3R+Kvl+Q+x16OyIipQge0xLwUHxXIgZaDjijgLufPHdiOGzz5+EHSJFnvq
	PZqFFZM/ZHZRaeyMJ/WVRPdJSAebhOtxKEgVMsFSGPspGFqADF1+1OJFp99TmyonJclw
	rR1Bt1gR3IMeA7QEKgTTwAddad+gnJuu+pw/Uf5FTojeRUszTblPA1D0Uw6GvfL3H1gD
	TsJFJXVU2cJ6frFibeF4IyFiu7li0C8VX6TDpyt3zq168navVK0iLprRS2uNH8FZdrVJ
	cKdw==
X-Gm-Message-State: AE9vXwOlAphbLYcPbXNOgBLXR0KWuDK6jCo2/suB6/oUKIJCNcJ4+ORUp4xaSHHYGiZB3Q==
X-Received: by 10.98.152.91 with SMTP id q88mr28856306pfd.136.1473721072395;
	Mon, 12 Sep 2016 15:57:52 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	d14sm26758614pfb.50.2016.09.12.15.57.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 15:57:51 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 15:57:45 -0700
Message-Id: <1473721065-9548-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image.bbclass: add IMAGE_DEVICE_TABLE to rootfs[vardeps]
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
X-List-Received-Date: Mon, 12 Sep 2016 22:57:54 -0000

IMAGE_DEVICE_TABLE and IMAGE_DEVICE_TABLES are both referenced by
_create_devfs, therefore ensure that rootfs is rebuilt if changes
are made to either variable.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8c8b8a2..96eaa45 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -116,7 +116,7 @@ python () {
 
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
-    variables = ['IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
+    variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-- 
1.9.1


