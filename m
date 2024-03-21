Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3A5C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 05:13:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.199.1710997980432349206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 22:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmIaJ4UL;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0000cdf99so4126225ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 22:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710997979; x=1711602779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxWYR3aML19/556JeUxdfvUOdCVXfqdwN01fO34ItAE=;
        b=jmIaJ4UL14yZKIz9IWO1HNe02lbmOl4mol4C1eRdYCBNluRLqFGl+M5U4K/zxyxDs3
         TsEUKEO17gn6ZT1Hk2wTS2kTLX6YyklL5pPDzLeOXPMj9YJXwNIrmZjYAw07c2n1Q9hb
         cLot8wOro4q9CbtG24pEN/bHcaDmxibeaGmV9+Ya7BSooPabFD2PdPYs9SK34E9VU5xd
         eTZdslqdiVJt6IoVjqz2/4q8Pe9RGzCgA5AZkK5fHEjVVRITsloLcqtKDoJgfVunoC3I
         725SjWKxP/JBL+Voj+EhtScy89rlza5AQLr9vBTuZNF9bhnAjX1oVmKSFOwwpw1li1yg
         TeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710997979; x=1711602779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxWYR3aML19/556JeUxdfvUOdCVXfqdwN01fO34ItAE=;
        b=chzr7FbDnwHxtjLQqwErO26sk+CFSFLN9IY3YGzrmMjIad6tCwqdZ0D9b43Vnmc8jI
         I3TUw+zgTMv0K+8B8bKLX08upM+lzy1g52LbnnpJnOMo0zXmc52HwgQhBKN/ci+glaGY
         O5SmR1/jpavZVfW9BEONvfufFKPnzgfIUbtzYPBiLQ8cnx/6BE9RRzDFh0ejyMhzDslY
         Wiu+sRhIyh96NXJSldcdfySvHy3Ne1zwFZH5Fhm78o8FdALlXJaEv+M1yJBWGpebqMrm
         8BPw1MMh2zahWK+/EPbdaRIJZqKSODJod3BNVYKg9bI1RPd1rw2M7o7so9SeznYN7SWg
         bIWg==
X-Gm-Message-State: AOJu0YwMqTnV72ryCWKrjm1hfJlrCV0IPqNnErTTQQAkd7JZqecyLz4E
	Hpz2d63CxbOLTfvHz7ag9PIKaJqqbwW+yn0+R7kbPEKceUQHN4iJqZMYR4ot
X-Google-Smtp-Source: AGHT+IHierhhtRM01CCemA54lOS77DvldbIVSmZg/JIvAogBpC+z3lOcHVBddi7UsxRYo/wJaEOnMw==
X-Received: by 2002:a17:902:6e09:b0:1db:4941:f703 with SMTP id u9-20020a1709026e0900b001db4941f703mr1125768plk.15.1710997979298;
        Wed, 20 Mar 2024 22:12:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::debd])
        by smtp.gmail.com with ESMTPSA id i15-20020a170902c94f00b001e02c15f30fsm7054072pla.86.2024.03.20.22.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 22:12:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemuriscv: Fix kbd and mouse emulation for qemuriscv64
Date: Wed, 20 Mar 2024 22:12:56 -0700
Message-ID: <20240321051256.476294-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197405

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 7024bd0a4e6..d01d988eeee 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -35,4 +35,5 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 QB_GRAPHICS = "-device bochs-display"
-QB_OPT_APPEND = "-device virtio-tablet-pci -device virtio-keyboard-pci"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
+QB_OPT_APPEND:riscv32 = "-device virtio-tablet-pci -device virtio-keyboard-pci"
-- 
2.44.0


