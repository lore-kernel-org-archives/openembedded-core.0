Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B677C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 15:05:41 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.8586.1665500730201029111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=h7ZuB1rJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.173,
 mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id c24so13477081plo.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7qzdH+Te3lIlAu6wRE6XbHBj9pEFP8hnWj7txyLZXg=;
        b=h7ZuB1rJWvCvVqrNivOnSZyZuQL9oP7g9XyenK4mp3QLwtsapX/WcHp7AIBoChYGQi
         pqPE5gTK+uBFkSH0SN5eSMHCqd94qBvt39v2gi4F6VJYeteeaOr+cbTbMlMaiEO9yNdc
         GbQpH+a2Q14J0RnovZe2IoJDLjQwGyTuoAqHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7qzdH+Te3lIlAu6wRE6XbHBj9pEFP8hnWj7txyLZXg=;
        b=eEm4auD/M7K56sw/NiRoMEjkWl2hJI7uLyzikFHdFPTuX+bT7Qbggv0U2b7Czzn6my
         3q2+eevnrkDdvwpsfNeMAFNq5gPQmpTQH3yBr0DXziT7YyHMRqYXqE6uwtX3LELIcIBF
         YgYsukbCL3Gpzo5aWnf1asoi+eHXXGS/aUgzoIYcj0KFuLQ5RoqGa88yjuNzDrjdM2Kg
         p8A4PNMrDVmNY87rIx/qkT0Ex4OXl8hRR5CjXLNLLZom19jbfTgcQsBjoZLZ4f1sVhVN
         Lfe7Pv8wpuYa6LlaHKLAM1zdneTLetNmZJtsXhPvRodOvxs1XNZcj9T84goRfXCfWb8+
         m4hw==
X-Gm-Message-State: ACrzQf3GaCYUn/u+rt0i85eBD+QG2f9atgwtJp1A9ZEtSNKGkw7iqOV/
	R2whSdZQHhxS1T1LXO9gYGa6sSykZs6t2g==
X-Google-Smtp-Source: 
 AMsMyM5J0IC/udrEwVTMj4cWxE7/oYE389Z7IIafGnO21RotIxxSyhmMtIiwZKSFMBinf/IiDsPjIg==
X-Received: by 2002:a17:90b:4f91:b0:205:edc8:4ae with SMTP id
 qe17-20020a17090b4f9100b00205edc804aemr39405892pjb.110.1665500729229;
        Tue, 11 Oct 2022 08:05:29 -0700 (PDT)
Received: from localhost.localdomain ([14.102.17.18])
        by smtp.gmail.com with ESMTPSA id
 y15-20020aa793cf000000b00550724f8ea0sm9044300pff.128.2022.10.11.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 08:05:28 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: fix CVE-2021-20196
Date: Tue, 11 Oct 2022 20:35:05 +0530
Message-Id: <20221011150505.36259-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 15:05:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171629

Source: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
MR: 111637
Type: Security Fix
Disposition: Backport from https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
ChangeID: c1e435aa25bb60b362bb68ab253ff55504e0328d
Description:
    hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196

    Guest might select another drive on the bus by setting the
    DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
    The current controller model doesn't expect a BlockBackend
    to be NULL. A simple way to fix CVE-2021-20196 is to create
    an empty BlockBackend when it is missing. All further
    accesses will be safely handled, and the controller state
    machines keep behaving correctly.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/0001-CVE-2021-20196.patch       | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7a963ad57c..2cdb718b1f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2019-20175.patch \
 	   file://CVE-2020-24352.patch \
 	   file://CVE-2020-25723.patch \
+	   file://0001-CVE-2021-20196.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
new file mode 100644
index 0000000000..affc8ead58
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
@@ -0,0 +1,40 @@
+From a253e632aea9e0e3f3f2ad3d157f34908e9c2008 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Mon, 10 Oct 2022 10:00:53 +0530
+Subject: [PATCH] CVE-2021-20196
+
+Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
+CVE: CVE-2021-20196
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ hw/block/fdc.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index ac5d31e8..a887369c 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1356,7 +1356,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
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


