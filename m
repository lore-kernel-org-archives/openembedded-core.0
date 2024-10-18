Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6E2D2FFE0
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 10:01:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.18591.1729245701754297173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 03:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fb7x+Lty;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so19938545e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729245700; x=1729850500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9TXPTSXIpK4odkUyJUXuKNk/uFXcbusCQmCJgiJE34=;
        b=Fb7x+LtyNBEZ+3bUqFkGRm4edyAr2FwhImI9jj96O8QjVSw+lc/cChNhKPfm2zTrI5
         lp0eCXFlpzGA6xU2ktITQnI+SNnFIDVr9fNaxF3aiOFShysd0HsRuHLiAOq6gA3C0qJf
         +Qylkb5F8uRujhNXiaOlaIJDbzUMJ+jYDxS2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245700; x=1729850500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9TXPTSXIpK4odkUyJUXuKNk/uFXcbusCQmCJgiJE34=;
        b=qgjxWsOSiHtpAg5/TakCiExlyHI+2VUdDHAlKwefFI+XyLETSqiY1A05o3cNcKPNFQ
         lASS0z+G3m41zfcj5r5DNiILFSB+3Az2eMy4BW07drZBsPjmXlPQR9MxHUCBdMTP4X3b
         hVB6L2w4zr6UWIs/swjQA4cBaQtPECajdXj0jOVfbxkhJ26bg5K0VXoGNIwihb2ClPz4
         21jpvLOm9TYl1bBODiFFOdNuYJcxpNczaeic42JDj9IpKR9G6oiwI/EvcQkQCAGdZUDZ
         biIFrncgT1lC9IXJNfV4r03W4e1UtXYTNbUpg+htjj0QMg2vtFAlb1LO6szYUdRf6GpT
         rV9A==
X-Gm-Message-State: AOJu0YzOS5Hcq0KvjSr5XIF7+9HlKhd+mCy1Z19VBzBt/5QOi5a1wl+r
	kqs1HdxTe5ihwDr38B2VSIlyi8K32GKXqVllV7NNVwdJfz6Ds+Nk6p9oQony2VgX/bIXvr4KUVd
	e
X-Google-Smtp-Source: AGHT+IFuOIMt63uwAzVY0RW+PPBqB0pOjaM4RzJNIC5vVnvFhy+yHsbajoUtaertrRvuZsaHBgVpkQ==
X-Received: by 2002:adf:e703:0:b0:37d:5496:290c with SMTP id ffacd0b85a97d-37eab729a12mr1168399f8f.7.1729245699605;
        Fri, 18 Oct 2024 03:01:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b6b8:7e19:2b4e:cb76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5e9sm1491533f8f.76.2024.10.18.03.01.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] oeqa/runtime/parselogs: Add differnet PCI BAR errors with qemu 9.1.0
Date: Fri, 18 Oct 2024 11:01:33 +0100
Message-ID: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206045

With wemu 9.1.0 we see parselogs failures with mips and mips64. We've long
since ignored these errors so update to continue to do so with the new form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../oeqa/runtime/cases/parselogs-ignores-mipsarch.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
index 9c2677c4cf0..156b0f9c103 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-mipsarch.txt
@@ -6,3 +6,14 @@ cacheinfo: Failed to find cpu0 device node
 #   failed when register_sysctl_sz sched_fair_sysctls to kernel
 #   failed when register_sysctl_sz sched_core_sysctls to kernel
 failed when register_sysctl_sz sched
+
+# With qemu 9.1.0
+# pci 0000:00:00.0: BAR 2: can't handle BAR above 4GB (bus address 0x1f00000010)
+# pci 0000:00:00.0: BAR 5: error updating (0x1105d034 != 0x0100d034)
+BAR 0: error updating
+BAR 1: error updating
+BAR 2: error updating
+BAR 3: error updating
+BAR 4: error updating
+BAR 5: error updating
+: can't handle BAR above 4GB

