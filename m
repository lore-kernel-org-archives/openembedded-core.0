Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A2161731F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:40:36 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id n70so3239735lfn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 22:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uvUlFt7/cDZAA2O0Mn+QKtLbqRQlvp2GsoC/jF1l1rU=;
	b=e0PRSvD9hHsznaeEMPkil9oXcVGNtObNgWpENB+5x7AdaTN7A/MwAc2hl8jKuhAxAK
	Rm8JYCp/kCZlYTP6XH+6wd+KTL1aKbpmSwH2GG9LVF68nBbQUs2iTj15hGpVDvCVyW4N
	0BOGmzbH4UW2dlnnZWnHSDw0cc7UtXS8RAieawAbUh+Xto5p1s9LFBujCo2B07TbjH22
	YXys36yrIKXPTNSVWyBPKgg8QpktGnKvHdZGynOnwNWw0OkaQwXaA4rX3DRBwwkCXheu
	lGfpFFy5Ct2Pm4uwNr95yRWkJQ7TfzlLg9BNUrgiWWNYvkOP1rE7noO9u0SytyT2dKj3
	SDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uvUlFt7/cDZAA2O0Mn+QKtLbqRQlvp2GsoC/jF1l1rU=;
	b=M4YuZfrfprKIuD42kldgPhAcbY87DOhMZjkcxzDQQWk1zt+MGzrufjWK/kJXRjVWvb
	r0gEIxFQ1Xt+gFJ70pVfbg65rJKOgus2A2ZDGjekWXsCtqXCjDDIan5f55Nb+kXdSX/X
	e1s2VkyVsfWAbnoV4gFBYURCGXXh+n9Tmh9ngbqD1+919RyAChl1VOlHwJ7h5lgWKOYb
	oI3CrLXULeMP7jRnWPObWAIy2puKEzpsVQxyNbCpj2/Xp9k4GjkcTrY0QwlkIfkl1+3n
	nTKATKHnX9pJardgDjhh1PX3XW1lttsOOXkDEXpK3QGz7taiehK6hwtuQoJ0iODcLzrm
	tYPw==
X-Gm-Message-State: AG10YOQhxxYRw24yS5Tyq+UcO4SMa7kg2LtANbyK86ieyFwnIhRKVe/PWJwG93BBuigQUg==
X-Received: by 10.25.143.208 with SMTP id r199mr2624985lfd.148.1454049636982; 
	Thu, 28 Jan 2016 22:40:36 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	mj4sm1874949lbc.19.2016.01.28.22.40.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 22:40:36 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 07:40:18 +0100
Message-Id: <1454049619-22703-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
References: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	bruce.ashfield@windriver.com, darren@dvhart.com
Subject: [PATCH V3 2/3] image.bbclass: removes bundle_initramfs related code
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
X-List-Received-Date: Fri, 29 Jan 2016 06:40:37 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of these code is to repackage initramfs bundled kernel
into rootfs by making image.bbclass build depend on bundle_initramfs of
virtual/kernel. But this is not going to succeed because virtual/kernel's
do_package is not depending on its bundle_initramfs.

We must figure out another way to package initramfs bundled kernel.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 56a49e7..87645a0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -167,10 +167,6 @@ python () {
     d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
 
     check_image_features(d)
-    initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
-    if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -511,12 +507,3 @@ do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
-
-# Allow the kernel to be repacked with the initramfs and boot image file as a single file
-do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
-do_bundle_initramfs[nostamp] = "1"
-do_bundle_initramfs[noexec] = "1"
-do_bundle_initramfs () {
-	:
-}
-addtask bundle_initramfs after do_image_complete
-- 
1.9.1


