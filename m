Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5846DCF536D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.7903.1729686895263991664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=20JQUx5/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20caea61132so52758825ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686894; x=1730291694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iAwrc8yyvQPkZeEjZP6dLFhskk2vL+aLh3a/WUZScQ=;
        b=20JQUx5/OJ63grWnCE0BnMMjsLfTGGXXGTGaRye8tiU02fcv8AaFvGdjvgbQo8mwXs
         uQlqpOyh7o8Ui0iTEL6yezUXfeDOKsfGwgRzPvzXkH3J70ZxPvdtBjZpDXIho0kdZHiJ
         4Gww5lDGxEidJ40qlXIAHunctKM/N8bXHvmlg7WGjMRXTQoWGE4Uc7R8LcA+zGh/MaKc
         Iqy/bLntWHBqPa4BsY4AIn62TYgNY2PXzkabAjtYPfsouzG344fX+q+04OQEvFFv7eBq
         qGTwIjM6BITsXTLNQUQqZAZ7sdyq2h+so4FcDoz2TuXZJF7I4mxzLHowMxWHyGUqhEsV
         fuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686894; x=1730291694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iAwrc8yyvQPkZeEjZP6dLFhskk2vL+aLh3a/WUZScQ=;
        b=nZ5LFJtPGGrv2KM8bipxOtqSmNAANwLd4LbyjPl+n7CChnX6d2Uz3+NGSnkTZ2kGjH
         1Hod6JMvFBP4quI2BAfICDcTPRFHlnXUcKXZosYRs1kHmxMPt0Bgax7EVcGFArPb160V
         jvtOM0dYrb9EK4/bl5it8yiFf9pvlBBAouPEdDL2EWjOyUzopaFyLO8AqOgcikth64wd
         o42Hl1pnw3Zi1rmXLin6gppmbcUH+fOrJUDn08LkfmlYs1Tl4tVYOHMjzarXDJVClfNt
         xZtxKkngtmsVdsjfPlhvnTyt4U4nlIV27J2ZIojNAixPfNIiLtJblUPAKiH+XQxdgEly
         KObQ==
X-Gm-Message-State: AOJu0YwIJpajlxezBrD8tDk+jOC+NPdB7+VaG4sikt26MMK3zv9fXema
	ihJiAY205MsmPuc9L7Ou+4Ybv+owAkFYMoNhO0oDeEoVzt5oGp/GdWGGupgp+10OYXNtxCkJtuh
	R
X-Google-Smtp-Source: AGHT+IGMRK0OnpqHFcoKSHnOwzQZDverCYYt1X9j9QkapPxhNIe7eMNfoi+pkwluQupsgXqlbKVsgA==
X-Received: by 2002:a17:902:ce10:b0:20c:8cc4:cf2c with SMTP id d9443c01a7336-20fa9deaa57mr25031795ad.10.1729686894472;
        Wed, 23 Oct 2024 05:34:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/27] efi-bootdisk.wks: Increase overhead-factor to avoid test failures
Date: Wed, 23 Oct 2024 05:34:15 -0700
Message-Id: <76f91dba302330c89c4a742e4ef24ec1898d130f.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206218

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After commit d74bfb2d5c9e6247e4c0a3c2fdba0cc4a7585395:
"linux-yocto: Enable l2tp drivers when ptest featuee is on"
was merged, oe-selftest efibootpartition.GenericEFITest.test_boot_efi
breaks due to space issues.

Increase the disk space available to avoid this and allow functional
automated testing again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb76c15de881a56ead0a18f6428c5564291249c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
index 2fd286ff98..5211972955 100644
--- a/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
+++ b/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
@@ -1,3 +1,3 @@
 bootloader --ptable gpt
-part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.1
+part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot --fstype=vfat --label boot --active --align 1024 --use-uuid --overhead-factor 1.2
 part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
-- 
2.34.1


