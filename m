Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01EFC0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 15:26:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.7788.1691249185465768928
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 08:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FP7cJ44B;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bb8a89b975so19043275ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691249184; x=1691853984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uI0sChrPAbUm9twZlzEtVXX+WvRak/gqUxZBeXwdPoM=;
        b=FP7cJ44BcM9YP0xo2ZsWU67s5VOCIyenhKEFo0qCX1EPyEXH/RcZjUFRxz52bdi965
         qYEAZLhm8p/rigAyxqQ1NQAEiBfUZOmuNLjtllCM5SdfR1HAtj0REOixrsk8shSGlbrO
         RTdDSwZkzx78CdpgzYVZ5/Gehe3orE9+OpU90+dn6sIVTyHTmR6bDOCM2Bbb1SKDBsLs
         Csw0RfctBcY4/oJxGjDN7lvJUgTrPQhZnOzV8PaRCLoNvoy2y4of/GK9YsRdQSnbVB3M
         uKjmJPgdOecBCNk54zT6HAyQGY4/s5DuPmcqSnUOW5gyLAezaknWFwYzHLnQM27EeaWu
         nspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691249184; x=1691853984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI0sChrPAbUm9twZlzEtVXX+WvRak/gqUxZBeXwdPoM=;
        b=DgTHdj6nJgwgcfx5/q6ekD4lM/JNHwqlmijjBnHwoBI3/I/ZCeq8SMmQ9ia7i1y6Q2
         x1cbXWxeBdN2r6Ad3G4JrVxtwme2kY8nkZOdlVg15d6UgvEDZS0It1fzRZgTX7NJqOof
         ZnxZwxIryCQ0sdofvKZcFb+tRKB/EyN6V1jCccDMQrg0smTAc98zXqwoaUEewd+YlFZ4
         ppWMQzQNW7HOPqp2zxW3dqqRVn9yYBhGpkih56rpQF8SoyAHyxesRVPJSWBiBrKwi6pY
         THVLUd/htK5dTvttdRzk+DDKBwrQr3OjyF/A0INCzHqCWaWRHoGcMZ/C8cXP2DQiKwXW
         9UPQ==
X-Gm-Message-State: AOJu0Yz/bpnar53twi13lLf9eX3rl7UWtKUnp9XJiaGUUX4yWhBHQM0Y
	1QMGkRSJyxzi2Ptb/VJVqGq+YBgHQdT5yg==
X-Google-Smtp-Source: AGHT+IHKwNm0v057C2eq2hwpT9BPMZw+fIQYaF67lMGYMJ/wDqOmZXNkjNlwoKdjBEYu6ho6l/ussQ==
X-Received: by 2002:a17:902:ab51:b0:1bc:6266:d0e4 with SMTP id ij17-20020a170902ab5100b001bc6266d0e4mr552064plb.69.1691249184393;
        Sat, 05 Aug 2023 08:26:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id jb15-20020a170903258f00b001b80d411e5bsm3614723plb.253.2023.08.05.08.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 08:26:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd-boot: Ensure EFI_LD is also passed to compiler driver
Date: Sat,  5 Aug 2023 08:26:20 -0700
Message-ID: <20230805152621.331289-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 15:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185555

Where compiler driver is used for linking ensure bfd linker is used as
well so its consistent when called directly or via compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_254.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
index e887e636e86..5d69cf83abc 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.bb
@@ -11,6 +11,7 @@ inherit deploy
 LDFLAGS:prepend = "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
+LDFLAGS:append = " -fuse-ld=${EFI_LD}"
 
 do_write_config[vardeps] += "CC OBJCOPY EFI_LD"
 do_write_config:append() {
-- 
2.41.0


