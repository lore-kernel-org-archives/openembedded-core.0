Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2409C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 10:17:13 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.9712.1750321796193391977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 01:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=jOunSxp7;
 spf=pass (domain: sifive.com, ip: 209.85.215.173, mailfrom: jimmy.ho@sifive.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31d592bbe8so383469a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750321795; x=1750926595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/6o5G7ztLStkU8ucvSbtHElYoO8CVgHr3OqMx0b6RQ=;
        b=jOunSxp7J3FTyLjKVHxSN5I7v21UfWTw6W3mBRmunU2ipfkOrpXhN85MRKO8uMIA3U
         criDEqxv9+Q0NelQfYl84B+UK8+VkYmGym4J4XlW7E4XO860HvO0Lx2sYGOuTlcnb3Le
         roOaAF+ImRhQ0jRA6mPrnUKhsgRSlCay7kJ14wrAUtZlaIAFAl2znmk+jUZrNtjlxuRM
         0Po3N0KynmCj05hanLzkwQ3vT3YDxgaeU+b9KpR7ecVTDxTHYlksqShYvAJKzeWbjIDS
         wbgvd78fo+5RRdu7sJscY0Q4yYlxEvNfUuzZe6chImE8CHIBRk2woulGojL5RlCtkSEv
         zleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321795; x=1750926595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/6o5G7ztLStkU8ucvSbtHElYoO8CVgHr3OqMx0b6RQ=;
        b=fdJXEXII6vXuaZD2q/9vgMelY0W9UviO6FDNIr1roBjs4U/lKoaHzR5Ak7TYDJibOp
         Y/NB9yt5c6ulQqMzqi2LUYuURzfEtoUY9GAs8An7uzTdILfhF40qk3OopHjgRmNa79Ki
         HqC+8t15hFjxVQHDwX7F35Uch/nlfPOHHv3u+2xZz8WxfFWWCPSYxvBKxNbRjWZzsTDt
         9weQvp6unpjsdLCflXB2thHGwM5Jx7LNJ9qnbqBas4ME+/nPR+Os9e4wHCVDpZedsO1s
         EF5g/4XV32ZTMHFC75Ot768UOzeKTXf/PxQpC25NzOm2dmc3b+GD0rUpEcoZhA4EvH0v
         mQrQ==
X-Gm-Message-State: AOJu0YxHmmp8V1/aM+wRq6LYtOzjeE/Axv+zc259PWvbkyn+McyL5ruZ
	qfdq4rEmbHMKZAOrgCxRg0ajaXDNNgbN3Y5MkrkMCTB3bxev0Xn+aAzwPK9je0TjpJnIFf2WX7x
	QEVdmqpVOsD2c1aEv1Q1WkRqviHIBytwf7k664kBsm7OcfTo+Ej7uOVD/9NU5uP1SMTb6ZhvcNU
	lHxZ7rneI1XRTCY4E1B2k6P3ratXSuDpqc/X4PgJE7olfQdtmRMGi0kA4f5KDOhPgD
X-Gm-Gg: ASbGncsOeaZ/5OWZrmwjNKGTjNh30E+wpa49IAPK49icVn6yMVYmEOUauA3VBKxB+Ku
	OUOygIQgJniDavaRtMwBpO1RNOmLbYimJ+db0qgX/X3DR9IeBO6q6QBJrVTtcm5RuwNc49htROf
	06B5kibkvCIk10xT1n/O6uHieFNpShBPFM06VGiaQ0IQVpl0rQaywMS7SauRec9ttLhqajpJwMc
	TIUs2+YnqmX5rT9KlBhgWBxPES2/KViSnRaCBbgfS59ijy/AWOtDZi03CwnOU76/SDTNlATUHWH
	/L0PepVcightv6GBceAonruA+VwJJyU3XoK/uELkFFtJ09ZGb0cUNU4/ZSb7IpSwbPuYJ3UsPiB
	urNpwl+aI9Q==
X-Google-Smtp-Source: AGHT+IE5fN8K3UCEDpFvQdidevxpg8htfgILVBqYBvh/sUGJwxQU479n8ri2DM7ILTqN4d6/UIvaVQ==
X-Received: by 2002:a17:90b:2e44:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-313f1d5efe4mr27260588a91.19.1750321794581;
        Thu, 19 Jun 2025 01:29:54 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a31c6aesm1519779a91.41.2025.06.19.01.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:29:54 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH] nfsrootfs: disable warning message if bootargs root parameter have not been defined
Date: Thu, 19 Jun 2025 16:29:19 +0800
Message-ID: <20250619082919.12390-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 10:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219064

we have case that don't define root in bootargs,
if [ ${bootparam_root} != "/dev/nfs" ] will output warning "/init.d/85-nfsrootfs: line 4: [: !=: unary operator expected"
by checking  whether bootparam_root is defined can clear this warning message 

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
index e67ee4c25d..1e76258ce1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 nfsrootfs_enabled() {
-	if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
+	if [ -z ${bootparam_root} ] || [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
 		return 1
 	fi
 	return 0
-- 
2.39.3


