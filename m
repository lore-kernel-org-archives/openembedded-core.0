Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8422A731DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:13:18 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id c192so117454888lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0lNE/1/Ma+okDlbawawxwPLJPl3TkxU3j4LwPfgXtZM=;
	b=wqFLbta4p3FP61VV3YPi+HV7a8YsIe6CpywJQOVKFRm4AoSqYN8eHNFk/YfZ7QQZx2
	54EbFvyjodoz6uYhSS/55oe/935rxQ2/cefmf60TnQfjjDYS2zXWOYCApFFki0hedxAM
	qMJ13K/c+U+z8NF/GchSxOa6DpQW4UMyV1XrrxfU2z4OLKNRvdDw8Y69gkLb8IwWpLu3
	WKsLJSE/zHBy+XY8dVws8t1DQKhc4Ug8p4fAlyWrKshczou8O8vg+C6L1ZIG7C2Z3LFm
	pFF0WTul74WgShJ24cFnYdWR2TcBTX7Ivcuxk/sQqlviQxp2xdjG6CIGTiTuro6fu/JU
	/gWQ==
X-Received: by 10.25.208.213 with SMTP id h204mr23680055lfg.112.1451999598629; 
	Tue, 05 Jan 2016 05:13:18 -0800 (PST)
Received: from localhost.localdomain (m77-218-242-32.cust.tele2.se.
	[77.218.242.32]) by smtp.gmail.com with ESMTPSA id
	a124sm9615341lfa.40.2016.01.05.05.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 05:13:18 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 14:12:44 +0100
Message-Id: <1451999565-3502-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/3] image.bbclass: removes bundle_initramfs related code
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
X-List-Received-Date: Tue, 05 Jan 2016 13:13:19 -0000

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


