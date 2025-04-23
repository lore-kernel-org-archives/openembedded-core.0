Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC57C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:46:55 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.3906.1745398007632363101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B/rolaaP;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso56547491fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745398005; x=1746002805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/W/hF6Wotq3ofEMbsaF2RjRPSIlZb0l3eelU9U7g+s=;
        b=B/rolaaP22FFNyIFHvOV9fuWpKuoK19fXq3lTl3dyPmNGIN6P4Cov2/aGIohBmd/oD
         UoKb9u1k8/99AHgWkXc2zKs8E2wToDztukxKz7AMyNDw527gxY4sO9sVfpLnGgNDOOuu
         i9so4fZRdhpqF9ny7+72D/SEe3+HYkw6c+lv8HqHJtxepTHcNZOhE3EXLLCEGFx0RmYs
         k7DTtH4dVW7vi4QLacSrFiT5JGgLW/h0/Uq/QCe1VcQeFM+d/hT5b5PPItvm1P2pWCN3
         +1H+M6BhKqjPkPhesQrkjqlgHGtb/IF3IWOUo+VoyGNBNvvTVI4VvB5X4OG+enby/J01
         +hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398005; x=1746002805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/W/hF6Wotq3ofEMbsaF2RjRPSIlZb0l3eelU9U7g+s=;
        b=iuzdQGM0+KgMWMeLHmX0Rs/7vJ/yxvcq6Dc3cZER9b1/7n+HZool8+DK4qMaUQ/Nrk
         N9ZEVaUWizzLMdGF5N9bZ7eCY5Gmf9TRxfRqgeFUohBve7na1BB7GxLqzwc+33pqNQyi
         giXfCm1FW1e3wsCXAk8Pl3RQZ0oSI1JLtYt4MxWEwVCEzYx/3rMa4N2HbNKDn+vUgZYj
         8c9h2p6CN2I+r0pI7giraBX27mrcRCLo1KyTA8yFtSqC/CCMX0t9sFsmfD356FwP7r8J
         BsBPxXI4EB3sTha/PJ4JCyTg1zMpkv/CEAwjVrCw/w6W7PjCl23a4ZQASPI2Y/LjKAuu
         1F6g==
X-Gm-Message-State: AOJu0YxzhGDi8oTYN2n7gzFv9mL0KRFLhdOWw8lDxrImJEXawxm1vWHA
	DK7z4HiyDTHTpTezLPBwbpK2p808KgMJRjLk0w3k3VvxGfMPEouJcSp26/y8j7vdLdeDkV5lVZJ
	ekE0=
X-Gm-Gg: ASbGnctsOMafup6kqSJTSUfI1ZaLVTy71OMdnMGryVoS46dHmapduesCEQf2ykScsn7
	pY+d9wopXr9cXSGOzwYOOM1S4SBg9RjAhCzfLfR7BOGpGosWeNrY5rXzAbqIwGC94zcXZ17F/Ig
	prbLFRlpg5zt4rNuFqqFfsEEV7ezvXzuLMfgua5mRTd97nEFYazgue1Hji3LEiiC0vuBZBfofd+
	mdOxatv4mbF1xeSSdWLfDuEuRhvzUcf3y1FhKCSAZqaFZGxZ2QKXM4YsX2q1M02pZWUpyIwrDRN
	4JSqOTTtVwEuV/oGzj/f1vsQveOodyn9sMnZTbP68ppCxKjMkS123kPvYhTfySffObcz8i9ipUW
	CD4tmC2LOiu7dPNWb7A==
X-Google-Smtp-Source: AGHT+IFEalTm8L7Ru9ddKyv2pLuS6jvJVsnzRg1XlgX1JRPP73HEUuSYSGEB48hBupflaLZGzGzM3A==
X-Received: by 2002:a2e:a58c:0:b0:30b:edd8:886 with SMTP id 38308e7fff4ca-310904d424bmr55878381fa.9.1745398005374;
        Wed, 23 Apr 2025 01:46:45 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075f28dsm18019491fa.6.2025.04.23.01.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:46:45 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] efi-uki-bootdisk.wks.in: reduce ESP boot partition size
Date: Wed, 23 Apr 2025 11:46:23 +0300
Message-ID: <20250423084623.140006-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215273

This sample ESP partition is used mostly for testing purposes.
It's not expected to host multiple UKI binaries for example.
Thus reduce size from 500 Mb to size of needed boot binaries
72 Mb plus around 20% free space 88Mb. This is enough for
all test cases and fits to RAM when using PMEM memory based
block device on real target boards with just a few Gb of RAM.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
index 1ea9c8a845..67cc41a241 100644
--- a/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
+++ b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
@@ -1,3 +1,3 @@
 bootloader --ptable gpt --timeout=5
-part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 512M
+part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --overhead-factor=1
 part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
-- 
2.43.0


