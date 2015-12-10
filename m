Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 487F96FFEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:45 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w144so24557619wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NqAebPSdNBt6FpW8AQC2RZ5LIqhcrjeHYRVuCCGjmjo=;
	b=PKEg8XhwpU9bcrit35ycYV4G1UC4+wTWlSq6lFxSm+ZXKWUnQzrIRjuO48eqmap5Lg
	vLpoJpEc0mrIdyPyTF1ZgYg435hRRRhBfvkKR/xql8IV+mNfKFH0ZgCoVjHV+vMMemlV
	1QeITg11X4GErDLUlnXxsV4L4ZrGNwsnEecrA1hpbmm0ZQPh1o2giNobjgu9fleEg5no
	fU038oUv7LedrHctVZqUWEbTKaJ3QfWlmqiDn1OHOF5wD6hqGDWKQzgjcccvXeNrFmC5
	xG0Hse7tN64fQB53M9kFd7HJR7hmLdZxCVE2Qlmuyp6SWDYa8dZFCt1JoVyUDgWujhxX
	SKxQ==
X-Received: by 10.28.32.65 with SMTP id g62mr40151567wmg.81.1449755206601;
	Thu, 10 Dec 2015 05:46:46 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm12484530wjz.4.2015.12.10.05.46.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:21 +0100
Message-Id: <ebb53828ca0b315745d74598eaafd22eb135997f.1449754339.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
Subject: [PATCH][fido][RESEND 5/5] linux-dtb.inc: drop unused DTB_NAME variable from do_install
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:46 -0000

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


