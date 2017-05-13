Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 212966AC3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 10:12:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d127so18045783wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7vZB8PbZd5A7VnlB9dN7bqzZA3EklR5O+JDQxvs5fd4=;
	b=mZ8w8UDJyOHk7VqWcm9GaShzZ7MdM5OzPpWIHqH0OPx4CMdGWnuiqL5b1wRfLzzXRx
	M/z+zokI6WuSVms+nfLC9V9BTF1It3S2xgH8fNiy8zox+Fw4s9YR96bm7iL5qy8keZYZ
	ohwYYWYwb2t20Ha+01dqWUKbLZpsl7fPtJ6Va6TTbbsV6JmNCzvUC2EBDBvRrbzsfS83
	zmQlWsXrn6re9j7/qe3cZ6JRPToijV4GzE1rEki+aHu95wL4eQWp0klJ1qxrONmLZkTl
	qAITv4FRNkB5AtRt/vWERi03G9isVzZO06iQhVY2dx1SWNDahqalM/eicgcXtPdx22re
	NKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7vZB8PbZd5A7VnlB9dN7bqzZA3EklR5O+JDQxvs5fd4=;
	b=mx6mhzCXb2FUEaWU4AykWTub9i56zxeKNURM/z92Twd7+hmRgpTYim+QdJAu9qn/eT
	FYXXiD7JUNU0xHwwoyxuG1HK7nF17WUikLES/Aqb/iABPV9zGBcmnQwONGxOqmhe8fr/
	yIH6DIaWvrNXKE1FVp+b3E+VGVE4hLlR23OHoo14Z300yVevQebqYHU+PC0Ay/47sns4
	vSHElfGgldHu5whPO/99PF6zvCNm1MkVX0eDzH+3/F6P4bQl05L6M84c/7xCQBD/LV9S
	evbC5ZGiJJBGZ+BoZ7zlcW5aVxtD0pg6uCurNeCAaR2+lxOGAdgdkYMQhvJHM6B7u7JM
	yufg==
X-Gm-Message-State: AODbwcDtBRKOetkTMxG/69l2q1CF4ynZtLBx5Ds9rxSnOKdmhxr9aMEA
	R6BAuCVARQG2Xg==
X-Received: by 10.80.185.3 with SMTP id m3mr6943484ede.41.1494670357276;
	Sat, 13 May 2017 03:12:37 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.218])
	by smtp.gmail.com with ESMTPSA id l4sm6516343edd.69.2017.05.13.03.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 May 2017 03:12:36 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 May 2017 12:12:27 +0200
Message-Id: <1494670347-8085-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] image.bbclass: drop initramfs bundle related code
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
X-List-Received-Date: Sat, 13 May 2017 10:12:37 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of these code was to repackage initramfs bundled
kernel images before do_image_complete, but they are not really taking
effect since the initramfs bundled kernel images are not even installed
to ${D}/boot after commit a49569e3a7534779bbe3f01a0647fd076c95798d:
[ kernel.bbclass: do not copy bundled initramfs to /boot ]

So drop these code, they are useless, only impacting the performance.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..bc00884 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -184,10 +184,6 @@ python () {
     d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
 
     check_image_features(d)
-    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
-    if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN'))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -608,12 +604,3 @@ do_packagedata[noexec] = "1"
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
2.7.4


