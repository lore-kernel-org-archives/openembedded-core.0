Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF93CC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 19:17:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.158308.1698693417062084639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 12:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=En+nxcnC;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9b95943beso43513465ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698693416; x=1699298216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2jOC7HFsnT7lDAymzETG6JCNJDkMdbqzuN3en26Hoo=;
        b=En+nxcnCO4CYfvWYxxYv3scdzl8PHZLBUVBwnv6/2+u/OLevX1aJGjGZjURSaQ+xva
         krMRhndDnhESVpA3TYUaEZ4eTu3R34yrYKQjPrg19a06bwpCsE6gpZw1Tum0yV0YNUck
         PKykwHucx8YTfGt6MXacUHfdz8fUTT9OjcGaN4gyVYJsBgLy/i2ftMwA7cdifjQwcLDQ
         cnrPFKyD6G8OjkJiXcbFS/eKyTvbGkvImPKTu8XPfHyeKj50n6UFPryM1iuvKy5MKeLn
         LkSrub91/sQasqUhTFmLDrsuVoTPoq6kVgLY4xJUfLrxeN/tv+xp4fTSEMxR6CBtffvh
         eViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698693416; x=1699298216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2jOC7HFsnT7lDAymzETG6JCNJDkMdbqzuN3en26Hoo=;
        b=IExSw2olYVQDEInJirG0Q5AvzyByN+RATJcSNwF5DxnYKqzQ5stA7RCYwJTPssTqNS
         uax8mPqLU2p4fq0iGaS1P/WtMmP8JI2uIz6fuzb6R5I/lCGkuIXkR2gDRYvsqFp0Z6dl
         TtV6RXuY1iXy8OwLQHplc1R9W16eK4im11CfFLw/IIbEaPCa6z51UEPNm54xGKKsWB06
         AyLnMV1FtOE7iFbaSKU8AOlVGyGI+mEUSFmPVFKwBhWjmg26+bAFNxKsW6jV99nJBsbm
         XqIWq2E6+gcnXNhkAmgomgPLsgG9Su8S/NlK+OX5vv7PehNBOL93u4QuU4D3V6L3EkOA
         QP3Q==
X-Gm-Message-State: AOJu0YwK7D3HbzxRe03fe4ZtwcmNC7kKkd+QFJIhOyzptwRiJQPX7VoA
	3WIfNS2s0DzlhLfAZ4mB7zew6zd2Jss=
X-Google-Smtp-Source: AGHT+IHZqbTIsj2HXAefn3ciVHmo4qIhwAoqa+faPgh/YM3TdAuu4A3iwGjR6cH7fMCHcswW34fngw==
X-Received: by 2002:a17:903:41c4:b0:1cc:4a84:27fa with SMTP id u4-20020a17090341c400b001cc4a8427famr4044363ple.9.1698693416195;
        Mon, 30 Oct 2023 12:16:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ea8400b001cc29ffcd96sm5647863plb.192.2023.10.30.12.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 12:16:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemuriscv: Add to common MACHINE_FEATURES instead of overriding them
Date: Mon, 30 Oct 2023 12:16:53 -0700
Message-ID: <20231030191653.65495-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 19:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189809

machine features like vfat are needed for ptests to pass ( e..g. parted)
This brings it closer to what x86 qemu config looks like as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 46ae66b9e50..7024bd0a4e6 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 require conf/machine/include/qemu.inc
 require conf/machine/include/riscv/tune-riscv.inc
 
-MACHINE_FEATURES = "screen keyboard ext2 ext3 serial"
+MACHINE_FEATURES += "keyboard ext2 ext3 serial"
 
 KERNEL_IMAGETYPE = "Image"
 KERNEL_IMAGETYPES += "uImage"
-- 
2.42.0


