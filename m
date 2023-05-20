Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1799AC77B7A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:35 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.13408.1684598731539956448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=T7SNa4zT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d4e45971bso239146b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598730; x=1687190730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Xn8zoASQ6H8AOE8KUCfph6Nmd66GEvN6UFomdL3ul4=;
        b=T7SNa4zTv9mtRBDlR1eCwiDSSPvpnfacnp2ye7afyUdpt0iv+yV/TlP8/sM3UOSS2U
         Au632sSK7Gptk2yRlKXzTX7yLYLMo+S6qGeKeA+ZHR4Z8yTkOBobAXG4EuAufDPxreN8
         weYflep9WKTtpbLOYeC7CcDxHElw0IBTR9QibYvk/2VMkMaMYDuJuKEjXB7Z/qbo7335
         cQIqujgYZ31gsQEqcPDuMly56+/Lmwt8ejguU6XbUL2h0e4F1g2IfStGKiFycKAhSqKR
         KU/ryuNSby/7EbeHid43FVReHqtF1r5stdPaISW4JAO/7fjpQSpoUypCNXKYDJE8kZMe
         AFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598730; x=1687190730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xn8zoASQ6H8AOE8KUCfph6Nmd66GEvN6UFomdL3ul4=;
        b=AbeIJ2QwlAZpez/2CtZBXxhb65qGWTL/LDPl1HPUKb2TXFCAyWVdkkCf3QzvO1nbcy
         iI7xpnhiN3FcB35fSYGxnY8ccZw4Rh7ZCXvyx2cdVNOlyWRNyXpSAKdUicVtd2btNJPz
         h4GC60N5jon8WZx94AFSLbHG3kEoCsqyzEiMkU4YaP5+l3Zlp7An2SI7YRCkCcixbKoG
         Y/jrmej6IMRsmrCCUDhIkxAWHglvQ+Ilely/pMU/93fHpFP5zbHvKkS4CStbPsJXTVti
         H+Qlg3rYTk81+genVzTLC8ZvYBeu+eaRN24V8zDhmbo5DnZjEUKhVmXBrAw6tAp2pGYb
         54NA==
X-Gm-Message-State: AC+VfDwG/IoL7yFohQARbbDrGjXwfrnd0MSMBZSYEL63FzbDaW0iWd3I
	vph0XNGCqTmAzXK4dOgFQ3/xb2l5ko0lQFre7aI=
X-Google-Smtp-Source: ACHHUZ7xJ7gZzZ9tIhvNUbhJkCIu2293UN9fZukQmuHDaMyz2MH4iewNAH9ylfbHUUGacfxpGdUxoQ==
X-Received: by 2002:a05:6a00:1389:b0:64c:9b56:6215 with SMTP id t9-20020a056a00138900b0064c9b566215mr8339675pfg.25.1684598730604;
        Sat, 20 May 2023 09:05:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
Date: Sat, 20 May 2023 06:05:04 -1000
Message-Id: <2126242c19b0c3dea12c605da8b24b08a9cb803f.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181571

From: Randolph Sapp <rs@ti.com>

This is a bit of a compatibility issue more than anything. Some devices
get upset if the FAT file system contains less blocks than the
partition.

The fixed-size argument is currently respected by the partition creation
step but not by the file system creation step. Let's make it so the file
system respects this value as well.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d16301ccdfb97bf126738262eec594008c282df1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..05e8471116 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -277,6 +277,13 @@ class BootimgEFIPlugin(SourcePlugin):
         logger.debug("Added %d extra blocks to %s to get to %d total blocks",
                      extra_blocks, part.mountpoint, blocks)
 
+        # required for compatibility with certain devices expecting file system
+        # block count to be equal to partition block count
+        if blocks < part.fixed_size:
+            blocks = part.fixed_size
+            logger.debug("Overriding %s to %d total blocks for compatibility",
+                     part.mountpoint, blocks)
+
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
-- 
2.34.1


