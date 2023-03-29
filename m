Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB1BC76196
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 03:04:42 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.15754.1680059081189895688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 20:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fD2kRr8D;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso2794017pjc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 20:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680059080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8p+BtNGoscsqJHY5TmxpEyDwia961KTrtfSoQIY8qc=;
        b=fD2kRr8DQaO+iHIWlH/2e7yQDnPSsc6ZqpHtTDFWItg7gOZo5TKIrWp58+AlCaARhU
         lhAp2AbkZbmdcMmio/a+nl/Jq3Krb8oDtIHLY4qbv7Az4XF5tsKB1oaCK6N31tMQ0qan
         JF0fSQ5QkAOYWmgHdsttEmJkzZBVOeGuFX28dOluv0dEudpb1NvGR1xr7nLvTLKgO4FI
         hJ1T5J9cSyL57iZqhu6rzBVN7iNOAF2n3N9VZbU6lqzyAFx+QRCC+dcGHP8z5jZNm8J7
         0DBnu1RWgz9E2ZkoGwZ7IB2N0voXfqrLQnv63A+yjRxEdZjNS2hipCaNALBgbiSP0zAD
         FYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680059080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8p+BtNGoscsqJHY5TmxpEyDwia961KTrtfSoQIY8qc=;
        b=Z8h+ZjdzVL1SE/mBKPSrUbbBtKjNLUVbcs8ewEwV2sELcnDZ1yAAfRlh5iUcFQD9AO
         +27QAy6FBmQ2UcSLcOhcRJYyihtowIxf9Z1SSZNUmRtQfmqHKDk6YMtRUOx6jzb3x9sY
         Acr4jdt4mNlvbUf6ps2loo2/IRK9nFZdlmdhg8aRLFfo0oRbIe4zIODhHlLKU+YmTeto
         pDmngB+jSxHh9zxCSbUKp8XgnMeSO9yOLSBLyn43+kxBQtOs3+KBOZjPliM6CLET65oE
         pcp4Hz+b6LHmlbmxl44Bj3zNZ17AlT6LX0nXPC9HSSo0Ls1va6AlqwAQDW29C4LuZCjN
         zGNA==
X-Gm-Message-State: AAQBX9cobARp8QswvLB4SOIqRuG400+HTth8Koq2ORNpkzBzq768YoBv
	thzrnVMbxYjA2ADLBfRlrB/Yg1eldLXoZA==
X-Google-Smtp-Source: AKy350bq/IuDOIkb0l4YP9gMERNo6gZCrpGhVQwm7DPHUEcOEuH3IjToNFAHP+Z7qvleXcKd8td1ow==
X-Received: by 2002:a17:90b:3a81:b0:23f:680e:78bf with SMTP id om1-20020a17090b3a8100b0023f680e78bfmr19560114pjb.29.1680059080117;
        Tue, 28 Mar 2023 20:04:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id f21-20020a170902e99500b001a2130e2cc0sm9565403plb.160.2023.03.28.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 20:04:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Revert "runqemu: Add workaround for APIC hang on pre 4.15 kernels on qemux86"
Date: Tue, 28 Mar 2023 20:04:36 -0700
Message-Id: <20230329030436.1607689-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 03:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179259

This reverts commit 82e67b82ea8e12aa0b7b9db1d84fec0436dec71b.

It was commited as part of https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
for kernels < 4.15, as of now oldest builder kernel we have is 4.15 on
ubuntu 18.04 so we should not require this workaround. Moreover, this
fixes an smp problem with qemux86 where no matter what -smp <x> option
is used, qemu always starts with single core.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 61a7f1820a..09b0ad5ed5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -584,11 +584,6 @@ to your build configuration.
 
         if os.access(dev_kvm, os.W_OK|os.R_OK):
             self.qemu_opt_script += ' -enable-kvm'
-            if self.get('MACHINE') == "qemux86":
-                # Workaround for broken APIC window on pre 4.15 host kernels which causes boot hangs
-                # See YOCTO #12301
-                # On 64 bit we use x2apic
-                self.kernel_cmdline_script += " clocksource=kvm-clock hpet=disable noapic nolapic"
         else:
             logger.error("You have no read or write permission on /dev/kvm.")
             logger.error("Please change the ownership of this file as described at:")
-- 
2.40.0


