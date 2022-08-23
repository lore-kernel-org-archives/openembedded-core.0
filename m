Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F788C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.4539.1661294161398155788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IhpCNOM+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id p185so315520pfb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=P5zkJYZPW43SWJQkEV+77B0TgiZ5XLXVJWiQpcQyGj4=;
        b=IhpCNOM+qwWvhuPROi+hWlUacNnadXnYIPZTOJyedAkh5c5WDfwG044Zf7xGAK2nMH
         /VNXF+oN1XhbsXgv5PzNeph5QwsLkNgkSvi0I4zWokACyxRSu7vgQ/xO5Br9hETX6uHp
         ay04aPN7SkqJPBcNOdWV9QKNFpxHONXfQvJ7IpNyQiQZ1USaJfLfSgHRujQAIdLQu5vQ
         L0zSkFKQHBXBLMX8q6FzceIo8pGzs8K/jzkkUjTaXxJpgkeSXtamlCgAolclKJX1ttKI
         sRL9ir8aY14vE2FVeBdBW2+f31lL6qWL/rQsSjk4zYSMLlxQP73F4idRLDEKcSDmf4kP
         sS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=P5zkJYZPW43SWJQkEV+77B0TgiZ5XLXVJWiQpcQyGj4=;
        b=mWaesivFc/cat9e4hyDBmJgdEBsy/wImW80SmqV5JIn+hIeIp4/wye/DSExvqIEbR4
         1lpeeG3vUZDqmrW1K1I54u1I754TeBT7MfN2PZEr2DXYYKUnbDTdUtb88R8nbzexU4po
         JUsSxanynj78DE1GA/amzuQHys+07z7MI5dRkmrHoDYOkdZM3bTrWlEUVPfbBks/mkcN
         GmThJLt3YbOslYbhGMFc91H9MefjQEx5S9qbFZrq3ra9yLBiO16NgbJsKrF3lirgC6pf
         jlxvbc7R7ZQoa05cnvR/f/Cnj2GOyrMkQ06gHb3NTxW72UYdl3D397VNhKYhMoRPllWo
         Y4qw==
X-Gm-Message-State: ACgBeo2CjldYw1bgXiqNzbFCSEXmD1rDQOQuDW1KovBCA51Uhp4GZ8z9
	JwdYNJ95F+ACoc7X6iL+oC4vffdQH83lm4vK
X-Google-Smtp-Source: 
 AA6agR7bDPbzyV6wmlucb41p7BVatTvNlMKJhp/OjsXO3+l5A3F33HPr2/xC5v/FfFUhKT2OLwQf+w==
X-Received: by 2002:a63:125c:0:b0:427:a637:3414 with SMTP id
 28-20020a63125c000000b00427a6373414mr22031939pgs.80.1661294160396;
        Tue, 23 Aug 2022 15:36:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.35.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:35:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/28] u-boot: fix CVE-2022-33967
Date: Tue, 23 Aug 2022 12:35:17 -1000
Message-Id: 
 <8123b22735d33f8c0bf71ad41877f968e1c16302.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169737

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2022-33967.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...s-squashfs-Use-kcalloc-when-relevant.patch | 64 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch
new file mode 100644
index 0000000000..70fdbb1031
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch
@@ -0,0 +1,64 @@
+From 50d4b8b9effcf9dc9e5a90034de2f0003fb063f0 Mon Sep 17 00:00:00 2001
+From: Miquel Raynal <miquel.raynal@bootlin.com>
+Date: Mon, 27 Jun 2022 12:20:03 +0200
+Subject: [PATCH] fs/squashfs: Use kcalloc when relevant
+
+A crafted squashfs image could embed a huge number of empty metadata
+blocks in order to make the amount of malloc()'d memory overflow and be
+much smaller than expected. Because of this flaw, any random code
+positioned at the right location in the squashfs image could be memcpy'd
+from the squashfs structures into U-Boot code location while trying to
+access the rearmost blocks, before being executed.
+
+In order to prevent this vulnerability from being exploited in eg. a
+secure boot environment, let's add a check over the amount of data
+that is going to be allocated. Such a check could look like:
+
+if (!elem_size || n > SIZE_MAX / elem_size)
+	return NULL;
+
+The right way to do it would be to enhance the calloc() implementation
+but this is quite an impacting change for such a small fix. Another
+solution would be to add the check before the malloc call in the
+squashfs implementation, but this does not look right. So for now, let's
+use the kcalloc() compatibility function from Linux, which has this
+check.
+
+Fixes: c5100613037 ("fs/squashfs: new filesystem")
+Reported-by: Tatsuhiko Yasumatsu <Tatsuhiko.Yasumatsu@sony.com>
+Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
+Tested-by: Tatsuhiko Yasumatsu <Tatsuhiko.Yasumatsu@sony.com>
+
+Upstream-Status: Backport [7f7fb9937c6cb49dd35153bd6708872b390b0a44]
+CVE: CVE-2022-33967
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ fs/squashfs/sqfs.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index e2d91c654c..10e63afbce 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -13,6 +13,7 @@
+ #include <linux/types.h>
+ #include <linux/byteorder/little_endian.h>
+ #include <linux/byteorder/generic.h>
++#include <linux/compat.h>
+ #include <memalign.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -725,7 +726,8 @@ static int sqfs_read_inode_table(unsigned char **inode_table)
+ 		goto free_itb;
+ 	}
+ 
+-	*inode_table = malloc(metablks_count * SQFS_METADATA_BLOCK_SIZE);
++	*inode_table = kcalloc(metablks_count, SQFS_METADATA_BLOCK_SIZE,
++			       GFP_KERNEL);
+ 	if (!*inode_table) {
+ 		ret = -ENOMEM;
+ 		goto free_itb;
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 04f60adaa5..54033698be 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -6,6 +6,7 @@ SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
                    file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
                    file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
+                   file://0001-fs-squashfs-Use-kcalloc-when-relevant.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.25.1


