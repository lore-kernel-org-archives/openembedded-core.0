Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104BDC5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.16024.1672594717805454701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=osA9CKMw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 36so17132247pgp.10
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztliHxOZODoUCLSed3BMj8zEcQTjNzEjlGuZmNG2bDI=;
        b=osA9CKMwTyiwhmAWtuXlTH0BJCKJZ8psGcZv4HZR5/A6or0cBUPcRI/oC+FEHpwAGp
         lBeR66CQ7nKkVBfPCC4JSKLnsqhtT4U2a1u7SF4UyRzB8KTTqLUz/6+E1VuUNh3UdT/l
         oFpzXUxrkw4b+hmXplHtiI0cKYu58vE5LNheSEY4cr9HSK6E0xDbidbN3X4wHPWRq3iJ
         9T45AYKE/I6xjVh+bUeYfg11b9CnitDIS8tmVulYiXAp63gpB3ooTussgrArjL9022vE
         QaLoQzaeFA+G8qk3u3Lp6gTwfj94FqDfQ8ACVIHZ0v7IvA1AMFCpd41+8X4Zt9fRBsrx
         ix4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztliHxOZODoUCLSed3BMj8zEcQTjNzEjlGuZmNG2bDI=;
        b=VWFosDMdDrZ1Bjkz67TUhvglokfvQrV2WkI51DZQCkYg9Fgc8hR7aB8R5hM5K/GBP/
         k0bSqpd/44YJbWvM83hleQsG0wKtQt8MsHw1/5mVDJXUA9bHke2FIpJXUtMFRACUHwxb
         xU1nAf1+vzb6cyxCI5Ao9KhGkb2VdTvb06+T9Wyen0SSkRKIrrtfeFOZzAzW57QKc1KH
         qsHia8JGmc5sIvXOEb63C3xQT0YfGIXtuOEHYiYfJF5IFgRuxNzXAZnHH85qQ4nY3RiV
         Cwn9niyyQKqDN5LXQRA//7de6s+Srv7DramyHvsUk4Bn8bSKaMu9jYYdVVwDs5kIEya1
         L6dQ==
X-Gm-Message-State: AFqh2krmQ+1JHUofJ+XZAkpbJCv82pJpwrLYlnA5WUg2n0j7ry/9AJuh
	hhG+Juk6EMpBqZh4Bzr8GCkFnQTw1TvKKoNFIVs=
X-Google-Smtp-Source: AMrXdXscE6n5LMBYVEcrm2az+ta31UU16Fnz/xbiDGcxwOo4SvbRfZ0Ye9KyF6D4PfrB7PlU2higBA==
X-Received: by 2002:a62:e510:0:b0:582:5b8d:52be with SMTP id n16-20020a62e510000000b005825b8d52bemr2974926pff.8.1672594716847;
        Sun, 01 Jan 2023 09:38:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/29] baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
Date: Sun,  1 Jan 2023 07:37:42 -1000
Message-Id: <53f65b6756f27a20dc1d79b0d1e5ca3fcaa86ee6.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175208

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Since qemuboot is part of IMAGE_CLASSES via qemu.inc it is being
inherited before we set the QB_FOO variables.
Since our variables have conditional definitions and at that point
they've already been defined by qemuboot, we can no longer define
them in our class.

Move the IMAGE_CLASSES inherit to execute it after we set the
QB_FOO variables to fix booting via runqemu.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8ed78ec262b2502dc3b673b24a868a3eec616a20)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/baremetal-image.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
index cb9e250350..3a96df1f2d 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -95,6 +95,17 @@ QB_OPT_APPEND:append:qemuriscv32 = " -bios none"
 CFLAGS:append:qemuriscv64 = " -mcmodel=medany"
 
 
+## Emulate image.bbclass
+# Handle inherits of any of the image classes we need
+IMAGE_CLASSES ??= ""
+IMGCLASSES = " ${IMAGE_CLASSES}"
+inherit ${IMGCLASSES}
+# Set defaults to satisfy IMAGE_FEATURES check
+IMAGE_FEATURES ?= ""
+IMAGE_FEATURES[type] = "list"
+IMAGE_FEATURES[validitems] += ""
+
+
 # This next part is necessary to trick the build system into thinking
 # its building an image recipe so it generates the qemuboot.conf
 addtask do_rootfs before do_image after do_install
-- 
2.25.1


