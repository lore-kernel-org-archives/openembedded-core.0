Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78955C4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 11:08:57 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.146819.1669720131762007231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 03:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=D9T13AiU;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so11585201pjd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 03:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkoA3MjcvrfKnznOK7dG1KDyhZzaUARtl+sG7ffufPs=;
        b=D9T13AiURt17+GSZYCeNGedyxHpZ+Z464QQZp9mLdTp+leVtV5oh1b4IeIT37VzPkn
         /EM74VjyBLWDG4IMclFg3kufNPXrkM0bK+PkGcv/rO7gDGII7Kg5Mt/meNTvH/cD6wAt
         ZMS1HGnSXWZfnnytSXCDJsE7+IoIiYrb8MENM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkoA3MjcvrfKnznOK7dG1KDyhZzaUARtl+sG7ffufPs=;
        b=fu+3B8fet0fsDQIlCSiZTJyXaGQJfPiyRh0U9STctYPZeTAPxqqIGsvrjh18jovkX3
         wlLs5vWrBhWKQrCiKc0131hEUgw+7o1cVcvdwpT+4ohgXS/wl/dRvtNNffb+a+ZfQ8oO
         PQnhDo9tMrd//CldQzUR44uaxJ8XzRM/68zBaELKN8rbU0zKbUTvfBTLoyM18ievBmG6
         i8x1EKzAcozPxV50a0+bBUxJYbM6YiAZCuH0V1tF3upObVudxQqnGlTV0WTk00qikA+7
         s6vRwh46Sby8xnDPsY2M3Ln4uWf3viQ8HUEUsG4zUM5jHy58j2Hrkt/xRUvHe55aPmBd
         uDnQ==
X-Gm-Message-State: ANoB5plwvaKbJf2XhfVuRH56ORNSCzm1myWIwq646meVLRoAWy77x+yM
	zJDtWsdwRQgOarSMy7qdcS3WtaPWoVoS3w==
X-Google-Smtp-Source: AA0mqf569OdLZj65hUY+b1gWpLaA399S6kgI5VJenrBJNtA3bBe235DNyBs9cMMlxXB5S6gsWzsY7Q==
X-Received: by 2002:a17:90a:a591:b0:219:2926:372a with SMTP id b17-20020a17090aa59100b002192926372amr13838721pjq.110.1669720130797;
        Tue, 29 Nov 2022 03:08:50 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([203.192.204.199])
        by smtp.gmail.com with ESMTPSA id z7-20020a17090a398700b0021912989f81sm1082862pjb.51.2022.11.29.03.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 03:08:50 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] qemu: fix CVE-2021-20196 block fdc null pointer dereference may lead to guest crash
Date: Tue, 29 Nov 2022 16:38:32 +0530
Message-Id: <20221129110832.1040199-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 11:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173964

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
index 0000000000..24da80e7db
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
@@ -0,0 +1,62 @@
+From 94608c59045791dfd35102bc59b792e96f2cfa30 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Tue, 29 Nov 2022 15:57:13 +0530
+Subject: [PATCH] CVE-2021-20196
+
+Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
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


