Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAECAC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 17:02:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.295.1648054958045287618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 10:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/OCemL9;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id d10so4099209eje.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 10:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJ58JSsGMpmPdVr1G9TqizBFFoithub8tP/PPdhWAZ0=;
        b=S/OCemL9G+umYuMB74wPJOtwH09/LqUZjZ/O2d7umRPo0+vCIxxagBmZp0sD+ko0tH
         AaEGvXJs+1wzJYyXZiyLNuQCRXjMEz6t9ACkXBrE1RTSxTkgRDryoU72nidi8eeUBuCZ
         pupLyns35flgnhUPFIrGRnKck5v47XlqHyBMX/aUpf54cs1nnywIfcxISNCb/nAW1NJ5
         Kzp/MBZH+pVf5uToOOPrIeXxTPRu4yJNpKmJDeiuKHjqq1kXqQ1ut68D46UlEshok8i5
         JoU3VMm1p3rC/Bc3wADLimCWH8TtMp3JO1Moi2/161QgzoMtVMHRJ6nXj8CCNvWmk1jb
         M+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJ58JSsGMpmPdVr1G9TqizBFFoithub8tP/PPdhWAZ0=;
        b=MPcsHoPgcqMhOsDJqWOLsmCw8VZi1hnCFfvK/P8kR22av2CsEISNwbTnQxMvdIQs1k
         5tIsyigSFFHvDuenr0l0zKYSLQW+HdbWTBDNiDaQLSq5nNivGiiQyviwJl6Y2vuZEbj3
         BC7COtTRvVfNNSQ+12wne67zd7pTlLMH3ljIQvFHGi63Ws6a3cSaqYcODEa0W2vQuJ5j
         M/JUZc67d7eXW6cf9fXEG6NPQCWWSFnLktqtgVQhUF94CT8UB0qJvbFY/IZN5FHVuWnf
         Vy+d1uqkTpQZ/QYixlVPwFG6AhiIXmx1A/3QO4x4013uB5bmjRk1U3OL4f+W6kLhvTnT
         EV0A==
X-Gm-Message-State: AOAM533NEMppV6Bz0PU2bf0HKBENuSXcxmYzV6wGCBUYcCYdkjBkXg8G
	FnKR4iLBo636h21OPThdkg91GV1rFvf35A==
X-Google-Smtp-Source: 
 ABdhPJzD9GsAjD+6hBHmYK2JFR/+wegGtkXnVFMnDB/SlVYxQPRL28FJYYVlkqNtcMf1hJ+kZlOKdA==
X-Received: by 2002:a17:907:7f8b:b0:6e0:612b:38fd with SMTP id
 qk11-20020a1709077f8b00b006e0612b38fdmr1104244ejc.552.1648054955829;
        Wed, 23 Mar 2022 10:02:35 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-30.retail.telecomitalia.it. [87.5.19.30])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a056402355100b0041925e80963sm235240edd.41.2022.03.23.10.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 10:02:35 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][dunfell][PATCH] qemu: backport patch fix for CVE-2020-13791
Date: Wed, 23 Mar 2022 18:02:19 +0100
Message-Id: <20220323170219.710199-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 17:02:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163591

Upstream patch:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html

CVE: CVE-2020-13791

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13791.patch            | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ef9bc3f64a..01cda49eee 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -92,6 +92,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-27617.patch \
            file://CVE-2020-28916.patch \
            file://CVE-2021-3682.patch \
+           file://CVE-2020-13791.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
new file mode 100644
index 0000000000..6026f02e54
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
@@ -0,0 +1,40 @@
+Date: 	Thu, 4 Jun 2020 16:25:24 +0530
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Subject: 	[PATCH v3] ati-vga: check address before reading configuration bytes (CVE-2020-13791)
+
+While reading PCI configuration bytes, a guest may send an
+address towards the end of the configuration space. It may lead
+to an OOB access issue. Add check to ensure 'address + size' is
+within PCI configuration space.
+
+CVE: CVE-2020-13791
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Reported-by: Yi Ren <c4tren@gmail.com>
+Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+---
+ hw/display/ati.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+Update v3: avoid modifying 'addr' variable
+  -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00834.html
+
+diff --git a/hw/display/ati.c b/hw/display/ati.c
+index 67604e68de..b4d0fd88b7 100644
+--- a/hw/display/ati.c
++++ b/hw/display/ati.c
+@@ -387,7 +387,9 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
+         val = s->regs.crtc_pitch;
+         break;
+     case 0xf00 ... 0xfff:
+-        val = pci_default_read_config(&s->dev, addr - 0xf00, size);
++        if ((addr - 0xf00) + size <= pci_config_size(&s->dev)) {
++            val = pci_default_read_config(&s->dev, addr - 0xf00, size);
++        }
+         break;
+     case CUR_OFFSET:
+         val = s->regs.cur_offset;
+-- 
+2.26.2 
-- 
2.32.0


