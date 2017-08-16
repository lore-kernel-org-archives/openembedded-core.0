Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3E577FDE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 04:39:12 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id t139so1665806ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/cw991wZV7Ycf350vXPZot3p7XeRxZV03rVRoX3ecos=;
	b=DrQeDxtKuU/2AOR0b7fN7pYOMrbyh6eMu6DnXG6KMbjw/7FPOUMRrcA74f55Dd4ws8
	hILfftI1gCYNqXjgsLtmmbpTLKKFft/A1IBHjIGPNeN1pswVFH9qzwla6Ji+gJBX4yNV
	nD1beDC3432/Y9cq0reV4L5sp6kYxUkPJN11PnvCLz+eRV56YyacqEsZBz+E3lJdMDlm
	sOpF9HlS/NZj1jIjElMPfFeA/x4LiFzV0R5zkvo5eUcS7UVHpzWzXmhZYZgXyqOVhBnX
	7xaXgvASC+7kpe7VcM0+4FTEA96ZMj3LnEY2ioqHlbA/DuTYIRcwtUHdGgJvqQjxEgRW
	ukDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/cw991wZV7Ycf350vXPZot3p7XeRxZV03rVRoX3ecos=;
	b=MbPGoZbT7y7ISaJ+IceZfGFxmTDVsaun8r7ulEqyjnn+JWR6iGRxwBzwiaXhsx8D3k
	R8q3MqGxn+oVj3i1ks33Uk6673z3pKc+XzBvLMSOXHtZufJ2Ea9gQxaGl9UrAE2w0aVK
	YRWOwvD43ytyotVjXottvYAchMPsOGgD8G2RPzUWrY685nH3LYQEPJxlNg8uQrAODoek
	uVNueXnbFDLvIynzx0pxZYHbOJ2LYpDk4UyMNXHgcRBz2RKgxE1ivgVGf7lpyB5DaOs2
	aj6AGeE8OfSg9ltfyKNWnGB3hrDL476aq4jctfYto2z9LEk3VPJJE4sga26qZOnXhr62
	VwQQ==
X-Gm-Message-State: AHYfb5hn8FHE6OuVMoTJ8aA9UpVBj8b1SjhDiaX/2unPyWmvDXQleOrE
	ACNqwd6HNmU6Lj5g
X-Received: by 10.37.220.210 with SMTP id y201mr377387ybe.108.1502858354232;
	Tue, 15 Aug 2017 21:39:14 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240]) by smtp.gmail.com with ESMTPSA id
	i71sm4231278ywg.47.2017.08.15.21.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Aug 2017 21:39:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 06:34:08 +0200
Message-Id: <1502858048-7170-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502858048-7170-1-git-send-email-liu.ming50@gmail.com>
References: <1502858048-7170-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] image.bbclass: drop initramfs bundle related code
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
X-List-Received-Date: Wed, 16 Aug 2017 04:39:13 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of this code snippet was to repackage initramfs
bundled kernel images before do_image_complete, to be able to be
included by rootfs, but it's not going to achieve that since the
initramfs bundled kernel images are not even installed to ${D}/boot
after commit a49569e3a7534779bbe3f01a0647fd076c95798d:
[ kernel.bbclass: do not copy bundled initramfs to /boot ]

So there is not a initramfs bundled kernel package at all, we should
drop the code, because it is leading kernel do_initramfs_bundle
unnecessarily rerun and it's very time consuming and hence is impacting
the performance a lot.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3562487..3639aa4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -171,10 +171,6 @@ python () {
     d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
 
     check_image_features(d)
-    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
-    if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN'))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -613,15 +609,6 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
-# Allow the kernel to be repacked with the initramfs and boot image file as a single file
-do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
-do_bundle_initramfs[nostamp] = "1"
-do_bundle_initramfs[noexec] = "1"
-do_bundle_initramfs () {
-	:
-}
-addtask bundle_initramfs after do_image_complete
-
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
     root="$1"
-- 
2.7.4


