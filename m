Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DBBC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:42 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.46613.1669908339739228776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0s+U/rjq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id w37so1950342pga.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abF55vm8vv7I1KGn6J1eja3q2cgksRZGSHDKYFE+PIQ=;
        b=0s+U/rjq0rHyvx9WFKBtqlm1RCkoS51+v2H/NYUQoZxSRrQ3lwawd4wCOgem3c1vDE
         WPJ5KXWd1JMGOorl68/9POeGAV3A1zo+l3K+H+8dUY8gmNK2AlHKAXFyBS1l/FCxXGX1
         wGLF5Qwe+3cNVBx9E0yvRFodMABKo8jFuGBwkZWQkPwW0cQHLVjd00yOq5juBiCqBqYN
         h3ickoKEcpV1OYNlgvI3gOkJCYwjGWbkW8ATNxc9E2FmfmsEPvXvkK1LmCB565ko/IzN
         K3gq4Sc1uwwbUOq8a2WG7rQK8eh0v5HZ8lJrHAJjyrQY0YvvWckxNxhLC9E65b/XxUSL
         5txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abF55vm8vv7I1KGn6J1eja3q2cgksRZGSHDKYFE+PIQ=;
        b=tpo3Ti9FLZteaLpkhdOSzHHIjm4ZegdFu6vxcJKMxS1BL1TG7N46U9XO9jL0TxLJ5O
         4Hq4reOrMTYJGGGMbXouj62XiTw8hYV9ovvD0cGYKLiJotdBo98zMiT1N/rymt5NdT1S
         3kJL2gMLf4B4YxcntqnLyS67fmJvh1VntwH89flQwSLWo64F63H+N79NVPZadovVoH+3
         Nq8+FGj83xL+QjTVAR5C6TKy8CrvQiSR5TJn2Z/pCSozwd3t/BMunpRhcJWZkaXXX7uT
         EWq6XZv6/JTz+P6PKEKPxGeDwbtD9Nm2WcnkoHmOS2rwu/49BeUo3Xu2Kz1KFXanZbqG
         CSvg==
X-Gm-Message-State: ANoB5pmsx37/2OhzbQDyzn+YLKWok+nBq3I6+i6DMh1qiWKOSajrKN4V
	51EEMjklYuUlsO6BdFozisEAlLZdC+iBRjua3d0=
X-Google-Smtp-Source: AA0mqf46WPiSHTPJci6i99PqhknZn5uQcyPIrzoklJtxEAxDMgw1O8DPwrlppQrhNzMKvpiRZvSDMg==
X-Received: by 2002:a63:cf14:0:b0:478:22cb:f05d with SMTP id j20-20020a63cf14000000b0047822cbf05dmr17930719pgg.456.1669908338562;
        Thu, 01 Dec 2022 07:25:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] qemu: fix CVE-2021-20196 block fdc null pointer dereference may lead to guest crash
Date: Thu,  1 Dec 2022 05:25:16 -1000
Message-Id: <1523fcbb6fef60d30c07377673fca265c5c9781c.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174115

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20196.patch            | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 764f948a28..a915b54c1a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -113,6 +113,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-0216-2.patch \
            file://CVE-2021-3750.patch \
 	   file://CVE-2021-3638.patch \
+	   file://CVE-2021-20196.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
new file mode 100644
index 0000000000..e9b815740f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
@@ -0,0 +1,62 @@
+From 94608c59045791dfd35102bc59b792e96f2cfa30 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Tue, 29 Nov 2022 15:57:13 +0530
+Subject: [PATCH] CVE-2021-20196
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]
+CVE: CVE-2021-20196
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
+
+Guest might select another drive on the bus by setting the
+DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
+The current controller model doesn't expect a BlockBackend
+to be NULL. A simple way to fix CVE-2021-20196 is to create
+an empty BlockBackend when it is missing. All further
+accesses will be safely handled, and the controller state
+machines keep behaving correctly.
+---
+ hw/block/fdc.c | 19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index ac5d31e8..e128e975 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -58,6 +58,11 @@
+         }                                                       \
+     } while (0)
+ 
++/* Anonymous BlockBackend for empty drive */
++static BlockBackend *blk_create_empty_drive(void)
++{
++    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
++}
+ 
+ /********************************************************/
+ /* qdev floppy bus                                      */
+@@ -1356,7 +1361,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
+ 
+ static FDrive *get_cur_drv(FDCtrl *fdctrl)
+ {
+-    return get_drv(fdctrl, fdctrl->cur_drv);
++    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
++
++    if (!cur_drv->blk) {
++        /*
++         * Kludge: empty drive line selected. Create an anonymous
++         * BlockBackend to avoid NULL deref with various BlockBackend
++         * API calls within this model (CVE-2021-20196).
++         * Due to the controller QOM model limitations, we don't
++         * attach the created to the controller device.
++         */
++        cur_drv->blk = blk_create_empty_drive();
++    }
++    return cur_drv;
+ }
+ 
+ /* Status A register : 0x00 (read-only) */
+-- 
+2.25.1
+
-- 
2.25.1


