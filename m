Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7B7C7EE24
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.36191.1683386717257417077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Pf7cXu8G;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64389a44895so2422487b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386716; x=1685978716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A72D5hmMCcTQY0+rCtB6DdDtDKVdcaPCVQarYMV/YD8=;
        b=Pf7cXu8Gk0/3ROug9LoRDSJDNqaWSkUtOUji8LrtVODmfbD5jkatyBYhv4jVLVDFrz
         kgEhHNQnqRGJEOFpXkZO7nFCGskbPJ0mRuLZot7WXnu8Wl68uDSfocbktEYCjV84u5E3
         9LPgJCgWzle511an+MGZM/s9HcG0Xw8Ge/5mj7ynMgNjgvLCYHeRNuQjTKXwg+1KnSJv
         lP+tmoEMTL3PHis5+MxLaDYKOrx0+VC3nwFMarEUoayfMxBXKkim/WU9A33zZ0/s+Tr9
         Z+PszFRDbj4mwSoryZk8KGSUPPoq/vM/vjFJVZ/FE3BRPVSFN5Vy0vKKHh3qwyMkbV3g
         Affw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386716; x=1685978716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A72D5hmMCcTQY0+rCtB6DdDtDKVdcaPCVQarYMV/YD8=;
        b=cUf9BXCwAJaPacfiUMoPLTQDPNrGMZK1GbwtM9qn5xGzc+WNB0ocNTsQEmSYWYJVAR
         EDw9Of3QkOepC3+0VwMO5CoMYa9XUgdCqqXOTaknlLIXQyk36Bt6J72dlSnF6mbDCUz5
         TflnB/fN9EdqSOHDaYoev5+gLPupjbrPFQ+GP1HtY5L2CD4zq8bTa3VQuoJNlWilHJKh
         bVjosdap7cz5iVZJh6GLb/zzgDtngsYilAL6WegLk10a4+Sxe7reSM1HrWIW8UEj4ptr
         rW0FKll/z2TzzIeKwVzSsuvAJEFsTqt77q2G2iHUBM5zdsgax1BXy2EKKvGcxLNnGvVG
         UVLQ==
X-Gm-Message-State: AC+VfDz138SNRvbCoLkffyt1E2bN4aoT/VNKpF/14eZd4lb3Jj1JgH5g
	wdqH/vE3ISTKCnkT7WWa3a9TqtXaRDGh2HWKIRM=
X-Google-Smtp-Source: ACHHUZ7fqrqCKOuRd7Fa44pSlVm+UbkXqJGx3mE324eXFGk37k0enn3s+Tjf5+oUoaHK/V7Enl1WJw==
X-Received: by 2002:a05:6a20:549b:b0:ec:236b:2fce with SMTP id i27-20020a056a20549b00b000ec236b2fcemr6614047pzk.35.1683386716381;
        Sat, 06 May 2023 08:25:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
Date: Sat,  6 May 2023 05:24:42 -1000
Message-Id: <d16301ccdfb97bf126738262eec594008c282df1.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180995

From: Randolph Sapp <rs@ti.com>

This is a bit of a compatibility issue more than anything. Some devices
get upset if the FAT file system contains less blocks than the
partition.

The fixed-size argument is currently respected by the partition creation
step but not by the file system creation step. Let's make it so the file
system respects this value as well.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index a65a5b9780..c28d3917c2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -390,6 +390,13 @@ class BootimgEFIPlugin(SourcePlugin):
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


