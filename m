Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0470C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:14:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.712.1750724098317145835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 17:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=WYw03r4n;
 spf=pass (domain: sifive.com, ip: 209.85.216.45, mailfrom: jimmy.ho@sifive.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso5894506a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750724097; x=1751328897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgGq0dcNImhStMaOY/6NqhI4VejFfkO2YVP1FHIiBlU=;
        b=WYw03r4negEpEsXhg+LS9mI6C7x+QB6Gyn0UhoMZV82RQSCt9/xqsesmnd4Jpv4J4L
         hR3Gc/GY0IsgDMW/ZrSiXocLh21lwChTKTpYUIRu6W9c7mT+jVMawCgwI7Ff4+M43LZh
         ue3Yr1oSyP/uPQfZ8HQeI340dpAIxeq9Lh7N+zTHcbTyk6ZsfIaYF2iqopFjr34IySTv
         gHUVH/cZP9GYixeFgsCVHNqYJr3hw6/yLmg8Zm4gHjPOGY4X1jx0fBwgHxAZxrcc6RuH
         iEcn5VWB5VnX5xJYvjINHsc5Yxm+YJgtoQ3MixVJDCHveQOaraHV7R87wG3v3IZ8Y/CS
         DK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750724097; x=1751328897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgGq0dcNImhStMaOY/6NqhI4VejFfkO2YVP1FHIiBlU=;
        b=X7WEa1zL4r6HHXBvQeDur1dxFBs9L7RO55ORmwc1J7p/nBZmrVbisegWusIBv8IxaS
         IoBOz10+YNCjlUw1bWZGunwDDlEUfDT2XUNY+HWSREGngXMEakmrIfkk3WSl1KjQXHj1
         BlokIvIO3qDKqKoibNZB+HzXy0ke0pctbY8JOKZKpGb0CUUyp5unWQdbVrp/eUsVcf24
         6pPt4Y1AzRa//yfxq8DtgFif/+J3bVZZP5SyqqwjrW3pnVy+YhGOoZ1dCBNYCifVYlXU
         kiLiAa4fd5VUkJzsoAgmbkw4Oh+iycsPUcyxIEJVf6R+MbzzSKMViASh9Fah6BTp0AOW
         SD1g==
X-Gm-Message-State: AOJu0YwXP5+4KPrF8I4RBRWvJwyVLADWXnh25da1WDPSnctwLgjw1Jgn
	6FEvq2tXDJMDdL+s75KJdD3Uw9WPEhNAQDaPtawuUMBwi6N1hjNUBQgZd13H/Qm2DvSjy6dt+cw
	o1FObLZuNX5BLoWnUb5Fd2/fKhfolwUex1aHrmPBqGU+s9/pOlFquD40pI4FGovkcawdweHQZgB
	UJfk/qFtOXEEdov4dOkeL9S1XTmBLeXLuWRCB08mgC8uMZE8HrlsThDRab4bKKhPYTpPs=
X-Gm-Gg: ASbGncv+2VbDz92h+VJnK0ye87gyjdao5T3kE6c5sIPKc12yNLhZZdC48XATqnfZ8fw
	/DaY1n6GQwqVMoNL3lYBTIY9ghiWLR12CFstfwAWXNPGm51vWJDK9oPK9y4Hsj7t4u+PxC45Zbx
	P5r+GKa3UD4P87cxD6NEzruCU5itFqB3S9KqIiWS23w0tdeTY+BTDpDUvWBmZ4r07sjVfPno/E3
	gCBN3XfoCyeOhRKADoBSPMzFHmi2HV62X6FZxAE2EXJDwgnFMbe9WR90K9UPSJKMu1t9X81Z67T
	ch6cQz96NNgckTX0Byqtad6x4uODOFEd62+FJToAY2WsBnFnFrJ1B3+Ubv1KYseIpB2tBzurcpc
	6FzcXyg3slg==
X-Google-Smtp-Source: AGHT+IGsTy1mpssREDQ/xtHtxjbMwsawDbyWRYWn2FkAPRy3dh0WPrWQOChvjr8UzCR2FlqBJti/MA==
X-Received: by 2002:a17:90b:1f89:b0:313:176b:3d4b with SMTP id 98e67ed59e1d1-3159d7c8fb2mr18139621a91.22.1750724096661;
        Mon, 23 Jun 2025 17:14:56 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331983sm11415663a91.47.2025.06.23.17.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:14:56 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH] nfsrootfs: disable warning message if bootargs root parameter have not been defined
Date: Tue, 24 Jun 2025 08:14:21 +0800
Message-ID: <20250624001421.16384-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219257

we have case that don't define root in bootargs,
if [ ${bootparam_root} != "/dev/nfs" ] will output warning "/init.d/85-nfsrootfs: line 4: [: !=: unary operator expected"
let variable expension result become string to solve this problem

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
index e67ee4c25d..30555aef55 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 nfsrootfs_enabled() {
-	if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
+	if [ "${bootparam_root}" != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
 		return 1
 	fi
 	return 0
-- 
2.39.3


