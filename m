Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F74AC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 11:32:11 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.9683.1648121529736425689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 04:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQcvB4G5;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id dr20so8531132ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 04:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQA3aZFqdXNnXydQOF/IrLgkghJaJnYh4V44yym6IRg=;
        b=QQcvB4G5TWaMwd0DZi2LuzxRAJbbRnt213nvtvQZSOz7OHm8hVZjJ25z+j6R82H2/4
         5XZ+ZiyhQA0gfZ9l3IMfQYB78GlGg63zj+XS6xG2S+VqgBs84d+1VDx8iG32yyHWI2T8
         qGaZRjDyXfELqsx/6vDDw+tE2mWSW8Lny3PD2pAWzfkfG3/QBm+ZkZiMn6EW7nkNJqgX
         /NkL2oeSA8VK2N7sDKxmLmJL3YtyPLQFkTXIDe+lmPz63imPdOX0Czvm5SAfQuCOwryE
         RN/MxMC6KdKxQ7X43REox5NisxzJ4mm0bcyBupdUKNRAWOCSJTyDTSNMhqWQ9i7rIT3L
         sPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQA3aZFqdXNnXydQOF/IrLgkghJaJnYh4V44yym6IRg=;
        b=e9meFF6W6gaj4jNougiYfruDXGydMUbhNctVw9qCi5kOWGR37JoI4TP1DuP8qTC7eJ
         dyzDKiDxCzv2IRet3ynBOagwFMqTTXjhx62gEDJZtazPpuomYqoiqNMQElNaEZkNdGFm
         pmGjD9yHBOSgwze3OpoOirZP3rK6+DOF+1O1vEhOMhZGedQqPyVI5kAk0QNkSGirHzKe
         2UUEhSEBLdcYvXwRIlictb77GYuvtYz3/NbJzI1hk/lLth3dQcOneDrQ02P3ckLaA2ux
         u27fIge01VBlwi1fH+3V0ABYun/BtAuv6UshqHTJcDMVTQhZzmbbxXYndlMoUbAzNm9J
         vbYA==
X-Gm-Message-State: AOAM5323pzdV+nUf79r7k/E3qLFmKRd6ciQEfhzf/cSNtsnAX5nswLOP
	S6PZ9Ss8Fl/IQrxk2CgLul9rrveGI1upog==
X-Google-Smtp-Source: 
 ABdhPJyGGNdxTyFZ59U12Wt+YHldlgi18AScOiWGraP634UiqosJ5b5ZnZi8w+JvBoGsWiBifuD0/A==
X-Received: by 2002:a17:907:3d91:b0:6df:a01c:f7cd with SMTP id
 he17-20020a1709073d9100b006dfa01cf7cdmr5169460ejc.255.1648121527352;
        Thu, 24 Mar 2022 04:32:07 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-30.retail.telecomitalia.it. [87.5.19.30])
        by smtp.gmail.com with ESMTPSA id
 nd31-20020a170907629f00b006dff863d41asm1030870ejc.156.2022.03.24.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 04:32:06 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][dunfell][PATCH v2] qemu: backport patch fix for
 CVE-2020-13791
Date: Thu, 24 Mar 2022 12:31:25 +0100
Message-Id: <20220324113125.52167-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 11:32:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163605

Upstream patch:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html

CVE: CVE-2020-13791

Update v2: rebase with patch for CVE-2020-13253 and
add Upstream-Status in patch description

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13791.patch            | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0bdc917783..25c2cdef3a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -97,6 +97,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-13253_3.patch \
            file://CVE-2020-13253_4.patch \
            file://CVE-2020-13253_5.patch \
+           file://CVE-2020-13791.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
new file mode 100644
index 0000000000..1e8278f7b7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
@@ -0,0 +1,44 @@
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
+Upstream-Status: Submitted
+https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Reported-by: Yi Ren <c4tren@gmail.com>
+Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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


