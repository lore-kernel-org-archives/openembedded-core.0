Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC835C52D11
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:16:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.79712.1674753412584712530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XHtuMMpb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id b7so2494634wrt.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8BuaoJjqbf5NzX0hOvpH+DrZ3/BG9IcyOKBlONSbxA=;
        b=XHtuMMpbZF5FoTpcOSgwt164ihuPCpBjdxyCw009gzCLV82Bym2W9b5i622YyG64dZ
         vDPgMGzQ9cmtlle0HFMJMDIC6MboqRcrOgPe/94SNl+Sx8F4CoCqrXELmLEpguQ+2si2
         Rogb3JS38br9rUTx0p+nL0UL2RzTP3eDyWPZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8BuaoJjqbf5NzX0hOvpH+DrZ3/BG9IcyOKBlONSbxA=;
        b=ZDb2Vu7cgpQs8I/eSkj/hYZD76w9ibHiLsvViNT1ygrGzjprcQwgLU0KIapRZRrpkU
         GsBMCwGugSRRSKO5EdsfNhnVuj+pnSMHqOGH4X6CTLWd3oYhYVngfKc2fDvyQnXXmp6V
         IkSj4czZawP277VfKPI8wYbxZxKSXbo3+TwoMX1hpQPtuMMDIpZhGRi/QpkVlUL/HpaE
         5JZ/VL64j9uORVtmrS6YPs8hjVHH/uZBEwXM/KD/hpIiaEftUfrkZHDVpmI2piBXTc+O
         Bqt5w63GKUBC23XHd7x0bbmNhM945Y5pDXltC+VVTpenS7i7sVpTfNHtURyEPZATOJaS
         Bl3A==
X-Gm-Message-State: AFqh2kq/SLr5dvsLdvvoZz+QeLR/zpq8GDKlGw2GgyDNVZxENtF4uioZ
	ICyWTkULNqUFaeUeFbcAsvPVdirUnZbt78Et
X-Google-Smtp-Source: AMrXdXsgGdj6Q6pqKVcDKo8wKaSdKHKKZ2ptaRTn895bWgqpQODmbGzckt23Ktb7BTZqhynUEdH9RQ==
X-Received: by 2002:a5d:6581:0:b0:2bb:dad4:9525 with SMTP id q1-20020a5d6581000000b002bbdad49525mr30832711wru.10.1674753410826;
        Thu, 26 Jan 2023 09:16:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm1724685wrr.98.2023.01.26.09.16.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:16:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] wic/efi-bootdisk.wks: Fix for 6.1 kernel versions
Date: Thu, 26 Jan 2023 17:16:48 +0000
Message-Id: <20230126171648.2527833-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230126171648.2527833-1-richard.purdie@linuxfoundation.org>
References: <20230126171648.2527833-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176412

oe-selftest efibootpartition.GenericEFITest.test_boot_efi was failing for 6.1 kernels with:

| ERROR: _exec_cmd: export PATH=[...] mcopy -i [...]/rootfs_boot.1.vfat -s [...]/rootfs1/* ::/ returned '1' instead of 0
| output: Disk full

I believe we hit a file boundary size and having "0" overhead in the image meant
the files couldn't be installed. Allow a small amount of overhead to avoid
the error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
index 7300e65e32d..2fd286ff982 100644
--- a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
+++ b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
@@ -1,3 +1,3 @@
 bootloader --ptable gpt
-part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.0
+part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.1
 part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
-- 
2.37.2


