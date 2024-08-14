Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAABC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 19:59:23 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.107584.1723665561956482066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 12:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=KEvLDsmq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.181, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db22c02a42so133551b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1723665561; x=1724270361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMVPEYnr0l4lllScV53LLDWysUrPWSRD9+XHY2h6XZ4=;
        b=KEvLDsmqwrOdf1VpzyC66rjDZFDTowqVuv4lgCUzVczKT0zEdXUEMG8gjm5+BKLfIA
         vbhqENXo6h55Tce8NOS7zrTxDxLFbfp7BsTFE2y+24o84ya7g1CZtWyJJfioHpsaahOB
         DK0Eq4iUwx/HFKcKgnr309t9QILCzswthd8v7f7thdnAQDTPsvI1vvLHqtNOlK2jfz2d
         IwQ2+clwCBnBtciY3elhgjsUY1zP8FHZAUHq5LmR04IRbyPmY+xzakkDj4sikaNXzrqq
         9kLWoxAPIrpoPgUno1vNhQVR3MN9pbwdo8jh/Jd8XYlkJs5e6K0MSd5PPKyoKYLLI3do
         FDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723665561; x=1724270361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMVPEYnr0l4lllScV53LLDWysUrPWSRD9+XHY2h6XZ4=;
        b=Ikc0d5pxIovygy0BnMmhTWsnsjWitpFWlE2bAjnDg1CBNr4msEJnj7rxeq94/tCh/X
         mhNYsKFb1RRst8fb9zL6elp8RYB3UltlwuggiyAwgZoX3mBQIYH7xJ4k1eXnfItKX1bg
         dwUHY72XXY2gIssTFX056dF1q9JAH1K1adJoWVwaY8abuW9zTyRVtNWI49pThmTFglir
         2rSocD0sPa4cSal7YGtqKQsm4zOM0huKiNg8zvwmBZVL5wdh/W/UvBdzHgY6d3zGMtiT
         NrMspyd5k+RX1OwZ08fRzvKHFg3/GamA84XKsA3OaxQNmMGYqWZdwRcc68T0AmvmnLcy
         y3aA==
X-Gm-Message-State: AOJu0YwmKh6aBhwOl5LfllLSNV9Wy5g6qhpT8JOgxauaMOrqZfNoY3I4
	wCjsgK2vodUnx28rt1Tv3OahwitYC+icgNUEux81RyeCoNNkf7iE0ie2BXLrNqjDfZEqg7nKfIU
	=
X-Google-Smtp-Source: AGHT+IG/tBxnhjiK5xf83yykLKJYwe8EBuE+FXUIF/gofAHdDhVB7IamFxLRByCggjLNUvXQoiDhOA==
X-Received: by 2002:a05:6808:1403:b0:3dc:2878:c42 with SMTP id 5614622812f47-3dd2991550cmr4126761b6e.26.1723665560958;
        Wed, 14 Aug 2024 12:59:20 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c271a22sm44615961cf.68.2024.08.14.12.59.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 12:59:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] default-distrovars: Have KERNEL_CONSOLE reference SERIAL_CONSOLES
Date: Wed, 14 Aug 2024 15:59:19 -0400
Message-Id: <20240814195919.1079481-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240814195919.1079481-1-jdmason@kudzu.us>
References: <20240814195919.1079481-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 19:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203330

Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
(or something else).  These are usually defined by the machine config
file as SERIAL_CONSOLES, which has one or more entries.  Take the first
one of those instead of ttyS0, but default back to ttyS0 if nothing is
set.

Also, use this variable in the efi wic file instead of "ttyS0".

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/distro/include/default-distrovars.inc | 3 ++-
 scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7554081e8b1a..26fa26f80c31 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -1,7 +1,8 @@
 QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
-KERNEL_CONSOLE ?= "ttyS0"
+# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
+KERNEL_CONSOLE ?= "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[1] or 'ttyS0'}"
 KEEPUIMAGE ??= "yes"
 
 DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 9f534fe18471..1ab870805ed1 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
+bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE}"
-- 
2.39.2


