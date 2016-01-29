Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id A91B16FF23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:40:34 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id z62so3240404lfd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 22:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7cKTqqYK2zCAU9Nomn1mol7AvpTYVlLfaF51V6VIVEI=;
	b=em0w27rc6GWGMxxNP2zFeb19ep1ZE6AMxU9WQewbOZ0ke6GE4AMpL0pZqOt4H5qiTq
	yHqnEboube9fB8dfc6DmqBhCrrkNQ9MEkLZLMOwLuYtJVEPJmeW9XWEHco3HLPMe8mUh
	+dzQoYTrnFNYl3VaMYAvvinn6Me8ASfsi0zXTeH9ZbbtUHaQPjf6Zhi4h3FYw+aEUFt9
	cY3ICGbhs3M2aVPlt2Vn8wZy3UZHP6lfTGH73WIqjJ9n9cpYpB5IjhK1fIL88VJUWpf2
	wJw2w5tB+fK4sMXJ9g1I65l09bAjGNPKI0qOT88gn/kbNeimeFS/PZCOgGGVyTKDT9Hi
	L7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7cKTqqYK2zCAU9Nomn1mol7AvpTYVlLfaF51V6VIVEI=;
	b=jK7aSOL6XE0jcq2fp77/RA0UbO7LlBa/fbffZAXr4AejyOAjjLPX2aUqWnwmQQ+mK5
	d/JR9sOLWcra1olzbx6nGNlgvvdPdqpycHsAC4FgFFEjyeu8lkBWgGfLG1LcfupRPRAf
	C/14h2+890JerBF16q8/MswEpkiRIcb765XaZBzrf775B7AqHWwdNwBH1bZYDIo83F6g
	btsYw/5cKLyj9aeAcm0hwO0SugpsbelpOLAdxQap+7ozc4n9ULYV7nwRr5zCHRieX9Rv
	rpXYMfdlM22C7dO+pclp+TwlJp9zWZjIWFArc7E1iOVDAGTVuTFIXmpYr8eDBtBl8JUg
	zctw==
X-Gm-Message-State: AG10YOR4Kh4e/mfEzzH0RJCJ7LNA8lbUIDpca8YHHAoc6FpiCBl0eu95MToSZZ8HvKoBMw==
X-Received: by 10.25.21.29 with SMTP id l29mr478222lfi.123.1454049634866;
	Thu, 28 Jan 2016 22:40:34 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	mj4sm1874949lbc.19.2016.01.28.22.40.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 22:40:34 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 07:40:17 +0100
Message-Id: <1454049619-22703-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
References: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	bruce.ashfield@windriver.com, darren@dvhart.com
Subject: [PATCH V3 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Fri, 29 Jan 2016 06:40:35 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

It makes no sense to install a initramfs bundled kernel image since
do_package does not depend on do_bundle_initramfs at all, otherwise, it
leads to a impicit kernel-image package depending on do_package run before
or after do_bundle_initramfs.

And for some reason, we can not add a intertask dependency between
do_package and do_bundle_initramfs, that would introduce a circular
dependency in following scenarios:
1 Some kernel modules have been added into INITRAMFS_IMAGE.
2 INITRAMFS_IMAGE has been bundled into kernel image.
3 kernel-image package has been added into core image's IMAGE_INSTALL.

We need firgure out another way to fix this problem.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f37affc..a3b33d0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -179,10 +179,6 @@ do_bundle_initramfs () {
 		kernel_do_compile
 		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
 		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
-		# Update install area
-		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
-		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-		echo "${B}/${KERNEL_OUTPUT}.initramfs"
 	fi
 }
 
-- 
1.9.1


