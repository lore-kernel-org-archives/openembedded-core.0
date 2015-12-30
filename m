Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE4696FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 21:20:33 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id sv6so113505882lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 13:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0lNE/1/Ma+okDlbawawxwPLJPl3TkxU3j4LwPfgXtZM=;
	b=Bqncysyr/DmoaBRX6N578hCs9xwlTDH5WG/j1sW3HiOYWuzJYiJaA++/ZDSg72eysX
	oYyrCxTesYUFkPIhiV4u5al6yBuTx/961AtOpNDii3Spw/TQ3eEzuk+oI7IzXt93wxGf
	ZEwjmyRouUhi5us3e+A5KVQbKzHfwSNrVa8tlENdHpqs5YKc8MYJmX1ez+9jWawL9aCL
	iVcMC/NPcoOOt2Y/I3c2rlTAB9xVzCqD2066Xcv3nzqMz41hXgrKLRQaizJNdW2tB7Q2
	pLwJcWsY00LS7UrZT0VJiWJujgslDPLJnpyuxP8dl/vJfxB5EXk+L9+np1hkAmt32gxu
	gGaw==
X-Received: by 10.112.140.166 with SMTP id rh6mr23979421lbb.77.1451510433356; 
	Wed, 30 Dec 2015 13:20:33 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	h82sm12247544lfh.27.2015.12.30.13.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 13:20:32 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 22:19:59 +0100
Message-Id: <1451510400-7446-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
References: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V1 2/3] image.bbclass: removes bundle_initramfs related code
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
X-List-Received-Date: Wed, 30 Dec 2015 21:20:34 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of these code is to repackage initramfs bundled kernel
into rootfs by making image.bbclass build depend on bundle_initramfs of
virtual/kernel. But this is not going to succeed because virtual/kernel's
do_package is not depending on its bundle_initramfs.

We must figure out another way to package initramfs bundled kernel.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image.bbclass | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d2f8105..d87977c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -181,9 +181,6 @@ python () {
 
     check_image_features(d)
     initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
-    if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_rootfs" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -521,11 +518,3 @@ do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
 addtask rootfs before do_build
-# Allow the kernel to be repacked with the initramfs and boot image file as a single file
-do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
-do_bundle_initramfs[nostamp] = "1"
-do_bundle_initramfs[noexec] = "1"
-do_bundle_initramfs () {
-	:
-}
-addtask bundle_initramfs after do_rootfs
-- 
1.9.1


