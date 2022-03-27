Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF71C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:21 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.732.1648399280604390900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cKO27HzR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id q19so10443894pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DAhO/V7ZCROCPirfRLvaj2hXD7oGm7yhApNZcGfh//U=;
        b=cKO27HzR6H3yZFULSg+ORaTfaV7Sr044jXw367IZi9uLGMcSmdniMQ0Gqtkk0yhojJ
         sB2NzNSL/+PbWpLnIbNZwNBSZyin31YBk0rC6k72g9GyZXkCR03qWPO57NxOfQZ8tZC1
         zBvNj//3/NMB5fXbhR2tjRphICWfs52lU0IphsXy3M0cS1piQKS9NhJZIVrLRxR4VW8R
         K9ibLUKVsGyGsem4B4qSsHt1QNqxjP+FJofZqY7sr0M2QvXnWOMiOSL5j7+wMPHsnwC1
         dPjpqKGz3G3h+DaCYX5C2sr1vWvB1plWebkLjUsBRm8m5vbPmM2Y/wOEeGGhh9kOYKts
         704w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAhO/V7ZCROCPirfRLvaj2hXD7oGm7yhApNZcGfh//U=;
        b=aPb9lU9RmN4EBGp/ne4YhJRL/U0M+HxYXqgUDZjx235PKLcHAbYb4az/H1DpWHkWey
         /mExcQaSNQmPQeRnP0fOPTKyxcx/FTzVu2FYi+lDURBC6+88YQJX2lH4UEusV2D/bo89
         yrzfFsYt/eamrSpAjBetarz7zHj4EYw4OTMLwtP9BOVb+kHRjwX35l+JKD3/TGFWiRPO
         JUrF8ih8ke2KaivQmzN/k6yTPkP4pR1puOd+PNrjEwR1311jK6vEhPjCnHD/OwnNDnsG
         0Q326rWSJD8MsOKmkOopFYd6rPxNU7ybCXIz1KCE63FGu403VbTkxYOKZHoNTH4u2TlM
         /Yaw==
X-Gm-Message-State: AOAM531hXnjBobWb8PYThPiknYxKhhepBa0UjmPYWE7jUBWn7lo2M/xo
	Zv1SP4bJo5wlD6UnLgXDi45GmncM/ii/qG86M5Q=
X-Google-Smtp-Source: 
 ABdhPJyR+DfI+kc+nuC2dgt0IjfEUJE5YfO4a5kfGeopNqCtulVNPq6Cme22gKKc7MjcYw3H1Vi5WQ==
X-Received: by 2002:a63:f412:0:b0:381:28f:85dd with SMTP id
 g18-20020a63f412000000b00381028f85ddmr7196811pgi.319.1648399279700;
        Sun, 27 Mar 2022 09:41:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/10] qemu: backport patch fix for CVE-2020-13791
Date: Sun, 27 Mar 2022 06:40:53 -1000
Message-Id: 
 <6d4e6302fa21b1c663b94b05088ecf9b9d544c0a.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163669

From: Davide Gardenal <davidegarde2000@gmail.com>

Upstream patch:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00979.html

CVE: CVE-2020-13791

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


