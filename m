Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7429AC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.1416.1746804241742625499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pPBfTSOE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7415d28381dso1626725b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804241; x=1747409041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ameF1VdPJIpcOhQ/1IShD9a5SoQdzlwawdedMrqHCx4=;
        b=pPBfTSOEgAYSboDBZqFSckzlbVf9oG86ZEdksRE2yWUafKJ939GV7pMo/BkmzWl3n2
         MsSK4dttQfCgMcd0ZYmO2eEoDUFQAFNX0hXiMMZZ2sj9HlrE3SJLnMbyIDGRKgiAYLqs
         LmK4a1VxOTCU9HS3kbVq2vNljacnxOey0iH+Y1n8nveCvlOW62vinXjP2QozBQbPiXNG
         FJF90TKywoI8tksZNmh+1QyWT6E3U+suQEE2Jed++sepmgbqb7AXsaimKx/UU/VpWKcM
         ReE9IJshuP7l/fT8VMMknmQoY1pt7qx800DmXKy9nAGq7O6xGMTfgteGrucv7yvoSUYf
         t2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804241; x=1747409041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ameF1VdPJIpcOhQ/1IShD9a5SoQdzlwawdedMrqHCx4=;
        b=N5rz9KAEtCY8g6oMqH7wY2DG6NF7vR4PxJvZn+FS2F6HeISfzib610A+YITAN2hx0P
         zUoG21G+XQTw1fYL0oszEyiZys6Jrea+OV9ijGp/KVO5pGHjNEUYvFKaWHSe89kdIpQt
         OZ4P46G31kn+giIqTpqpeL9OFIgtm2rRG7KMmE4TOsEdYX3+6ZrBnrC/a8IkuiccEDIk
         S17qKdz/IabWsd6aK+H4/4fWFDczwMn15wtr1kjRhLT4PpismQJjPmIK2Pep6thbYOGO
         RKLGnvELU1Jt4oYdmD/ef0L/U4Uw6etFXajj+qrX7OLLLnJLbVlXYh0mwCiymYb7ejFt
         gkCg==
X-Gm-Message-State: AOJu0Yzojg3D/aLQG4dQafNSSWNAmwu40FSdjXB+9sFlK/8T5Ta7aXeq
	6h87KiZX96i5am2bxpWkfWoBLSwgE0bY9SWV/eGKF6wz8ESMu1jRILTMM++UBiJ/yrZGe/luFeW
	a
X-Gm-Gg: ASbGncs3QG2oHFrAJ3gcECHiRfIRLO3Ewp/uvh4rKfUVTC5fhrw50pE6NmlsccoB8Mi
	lTyQ9SDUMAC9almQBWM7PnTi7n+28rtgjhxt5JUVmhuZ4wEc2LP9Zhee0H0hGj2khgfOkiiaP9k
	ubyk9hhFZ9pSS2HchRbbV9LHKiG62+6072nLW26E3bqBNM4fzsvJ6exIbkKyEigCX1dJ+8KMJhr
	b3+JzjaGYLIFaHO6OxR0CTsZPMYsO7nI/aRXyA3Usim2yPPC1DtOxY2IR3RW3hxPL7tmx8yQPrF
	Y1NswpmNG+l9mamVha6kMNrnPlZN5Mtd
X-Google-Smtp-Source: AGHT+IEPme0ChAHSZ4SGh14Q4exo+tn/NGEHMNYKsWmDOQMYgkE0pBYQv+2UCswOx8ri0u5TjLhCzg==
X-Received: by 2002:a05:6a00:138c:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-7423bc1d5f4mr4920601b3a.1.1746804240890;
        Fri, 09 May 2025 08:24:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/17] bluez5: add missing tools to noinst-tools package
Date: Fri,  9 May 2025 08:23:22 -0700
Message-ID: <5f7c43913812bcb80d6dba67da3fc62a8efecfb8.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216214

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

This change will prevent these tools from being installed if the image doesn't install bluez5-noinst-tools package.

BlueZ 5.66: tools/mesh-tester
BlueZ 5.66: tools/ioctl-tester
BlueZ 5.65: tools/iso-tester
BlueZ 5.56: tools/btpclientctl
BlueZ 5.51: tools/bcmfw
BlueZ 5.49: tools/rtlfw
BlueZ 5.47: tools/btconfig (not a new tool, but it was moved from bin_PROGRAMS to noinst_PROGRAMS)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.79.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.79.bb b/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
index 30ea6d317b..330b30884f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.79.bb
@@ -32,6 +32,9 @@ NOINST_TOOLS_TESTING ?= " \
     tools/rfcomm-tester \
     tools/bnep-tester \
     tools/userchan-tester \
+    tools/iso-tester \
+    tools/mesh-tester \
+    tools/ioctl-tester \
 "
 
 # noinst programs in Makefile.tools that are conditional on TOOLS
@@ -46,6 +49,7 @@ NOINST_TOOLS_BT ?= " \
     tools/hcieventmask \
     tools/hcisecfilter \
     tools/btinfo \
+    tools/btconfig \
     tools/btsnoop \
     tools/btproxy \
     tools/btiotest \
@@ -56,6 +60,8 @@ NOINST_TOOLS_BT ?= " \
     tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
+    tools/rtlfw \
+    tools/bcmfw \
     tools/create-image \
     tools/eddystone \
     tools/ibeacon \
@@ -65,5 +71,5 @@ NOINST_TOOLS_BT ?= " \
     tools/check-selftest \
     tools/gatt-service \
     profiles/iap/iapd \
-    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'btpclient', 'tools/btpclient tools/btpclientctl', '', d)} \
 "
-- 
2.43.0


