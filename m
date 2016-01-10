Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EB10B76643
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:10 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 65so2202354pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=gJmwzRtCZ8eYSjbZq9UQpZKtASve/pkhYVuxVCurboM=;
	b=Z60hfYeGLrfPWI/NTEMRQZOMA+tiSKCFFDIFWg257Sp99EbfrtEIjbO3JFmHEO3l4h
	dPY6pHnvnN9UxHpqthgcgs0BF8E8ipDwgLQG+OqxfZtgbUZ4cnDmbl92CpSh6eAjaV3Z
	TRLxRIig2RPyoto2HgYVVEQxjm0k0WJ4Yg8NfYrpScOtN356+4gOKGI1nl9HQ/bitdwC
	vpkAL1UgaSH9NV/b8dIRcp0h0QODAnK2CpTNS1mMIX5Xb0KxMd6uyaHxkPDhP6AZbICG
	ODEX1U79TmgXiwcevkIjsGFQ4mUp3Jyo7gvY6yLpizEkv4Z8TFlhY7VEzcuv6RVfdARL
	4o4g==
X-Received: by 10.98.65.148 with SMTP id g20mr15811145pfd.21.1452385872033;
	Sat, 09 Jan 2016 16:31:12 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	p70sm13701258pfi.96.2016.01.09.16.31.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:10 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 0642AFCC846; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:37 -0800
Message-Id: <38f4285b4f3104a8595a392063226c71350d1f66.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 11/20] linux-dtb.inc: drop unused DTB_NAME variable from do_install
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:11 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* this is causing do_install to depend on KERNEL_IMAGE_BASE_NAME which
  in some cases contains something like BUILD_NUMBER from CI, that
  caused do_install to be reexecuted every single time, which is very
  sad to be caused by unused variable.
* jethro and newer don't need this change, because it's also fixed in
  commit 86b3f29f93e3f87903668ea317c6bd97be4cdf62
  Author: Marek Vasut <marex@denx.de>
  Date:   Thu May 14 14:31:11 2015 +0200
  Subject: kernel: Build DTBs early

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 6b8f1a5..4779be2 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -13,7 +13,6 @@ do_install_append() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
 			oe_runmake ${DTB}
-- 
1.9.1


