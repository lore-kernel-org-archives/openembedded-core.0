Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id AEF446012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 12:57:42 +0000 (UTC)
Received: by wmec201 with SMTP id c201so21530327wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 04:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NqAebPSdNBt6FpW8AQC2RZ5LIqhcrjeHYRVuCCGjmjo=;
	b=gttuoD+ghkMfNW2qdW5zCcGWUlD5NlDG5CdpPusle+NNFLAZf030B1+yXURo9otCxB
	O/3kf9U3tnB+zfHoELXDMO4y3wdPfiR+VnnxxkW33/zstL4AvXIZSnC9fvX1f6Ly+GP2
	ZCHRnlWhbTgEsDQOpmY8bewjXTV1ru+Xg3IRS1sKt66aQ+6tIU3XQAduJVPcxKyZsZsX
	SfnVlIel7+z8GEy3XVNUjq9zGdt0w0YzWDYdGlk32toTCP7sSg5DaadULtkjml+tlWKP
	Ikm6IS5FpaxU7LP/f/Cm2fMNx6woGjO0BDBB5ncEoBwz7nJ8SuTg8XqNQnJncEUvk3Vx
	V01g==
X-Received: by 10.194.114.105 with SMTP id jf9mr48052598wjb.102.1448542662854; 
	Thu, 26 Nov 2015 04:57:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m11sm2633710wma.5.2015.11.26.04.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 04:57:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 13:58:13 +0100
Message-Id: <1448542693-11336-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][dizzy][fido] linux-dtb.inc: drop unused DTB_NAME variable from do_install
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
X-List-Received-Date: Thu, 26 Nov 2015 12:57:44 -0000

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
2.6.3


