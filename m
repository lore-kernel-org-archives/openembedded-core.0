Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B146FCDB460
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10396.1781682339761670272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B/wrkhTQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so57519175e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682338; x=1782287138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBaq3JZJdeGo3qyzraIALG1RjIpNe/voUNiclnJXtxg=;
        b=B/wrkhTQfFMxWWjG1nm/b79F+2BTtuYPh4OTmxHhTFR2ecMbMH93TBEGXV861IVT5r
         j+jEz5wXkDVSPf88CRd6uNYl+IrQybUvH5ijNQudG3F8XOCPPqgoN0xcZDU9BVcmuJFg
         IXyOsWvDjKGwcCQqWWekT+Jrecv21VTAPt4R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682338; x=1782287138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBaq3JZJdeGo3qyzraIALG1RjIpNe/voUNiclnJXtxg=;
        b=adhui3iDSnSbt6tPadLNNr9Rc2/jV6G47oGFuotJTQ1hIJcWD0GU3wBYRdB5pQA2EX
         SOL+XPVeWQs8EAplPrO5CfkyOrDSb9jmQhPzc6zb+uk5uX+dXnvTvkUI2THPpPxaOGpZ
         /t6C9ZoX4PX/S9MxE5J2JASO/sekir1kljD3CofEAWICFEim89SdmqT3HevaLoD99rM/
         hwwDZ8qRVPzPAIkWgAKAv4Fz+7tsHib3Yu+e6jRPnVNzxELTAX87UgFiZAezRu1f8F2I
         ufleWjRnid2zBmDw0LAU0eBQdBvxSxfkOcxM2hN0yWYuR3UkdxCnGtzNwCSCRCJ91qOn
         4GNQ==
X-Gm-Message-State: AOJu0YxJ6VaYnOQm4yLLaM9IhccsfbNuG03xgccsCjd7c8PVtoyAAUEa
	kUYgu3FlC9UZ7tTVgl1DckNVo8nWNCNraGkdMsJ37aCHTCP537kEJYL7s/w2b8EF/7nD431db88
	cdNfJ
X-Gm-Gg: Acq92OF8ER0bu+R50XYGX2o9/nAYf7jO0bsKrXZ86KhnrOChq97CUuxohkDR+6YbNUH
	9E3LAFsZAufDdXqTsN7Wv/RvamHRPgk8AMp7ZO1+ROs5HMDI7mNMHBxKM4N01V3MmGqtZrwSGv9
	XaYj1JGBFW0EFtKbqzdYQKmsZm7biibmtkq+gpb9wNCfzvR0k9lJ0/dAJ1d3fHUFxTGaewbiebS
	1hpzMeTKuS7ebXjwxIVnhJ0D0d2JwU0d48ocNSuNK37N1HTeK2pbu/iSpIBgcEZpnb6jp/P3evC
	jMsniGvO6A1QEyepF0ufOvokyLTZh/OuVzn4dqPWuMz8w3cR6fo6fSMyGJP96Xgz8J/4qpKvEia
	XHBXTIRdZi8OF2hMR5pApaIb6fyXLYoDPhej8ZOzqaMsftpRjqadaHvMzlwdntM0Z9zHQuiURus
	55cat9ZExv8k8Q6Ufk34IHC75p8jp/aRJrhtycQdhjksVl00WJN3YgZBZP0TcXqVLXspWJl4TbR
	/Ud1HauifJJ/W0Zcw==
X-Received: by 2002:a05:600c:a30c:b0:490:c024:2eba with SMTP id 5b1f17b1804b1-492333e2829mr40745465e9.22.1781682337938;
        Wed, 17 Jun 2026 00:45:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/30] oeqa/runtime/parselogs: update pci BAR ignore for kernel 6.10
Date: Wed, 17 Jun 2026 09:44:53 +0200
Message-ID: <25434155c68e6beb683433ce065325de21d87903.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The format of the pci BAR warnings we get on qemu boots has
changed in 6.10+ via the following kernel commit:

    commit dc4e6f21c3f844ebc1c52b6920b8ec5dfc73f4e8
    Author: Puranjay Mohan <puranjay@kernel.org>
    Date:   Sat Nov 6 16:56:06 2021 +0530

        PCI: Use resource names in PCI log messages

        Use the pci_resource_name() to get the name of the resource and use it
        while printing log messages.

        [bhelgaas: rename to match struct resource * names, also use names in other BAR messages]
        Link: https://lore.kernel.org/r/20211106112606.192563-3-puranjay12@gmail.com
        Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
        Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Since it doesn't appear that we can do regex's in parselogs
and the bar number is now in the middle of the message, we
go with a slightly wider format of the message to ignore.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a7126604b6536868600d43aff000a426384995c)
[YC: In scarthgap, the breaking backported commit is in >=6.6.130:
fffdb0fece19 ("PCI: Use resource names in PCI log messages")]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
index b0c0fc9ddf4..143db40d63b 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
@@ -13,6 +13,14 @@ FBIOPUT_VSCREENINFO failed, double buffering disabled
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
 invalid BAR (can't size)
+# 6.10+ the invalid BAR warnings are of this format:
+# pci 0000:00:00.0: [Firmware Bug]: BAR 0: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 1: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 2: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 3: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 4: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size
+invalid; can't size
 
 # These should be reviewed to see if they are still needed
 wrong ELF class

