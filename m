Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE14CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:37:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.23459.1697708245949746860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULk0KHvm;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9c75ceea588so90019666b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697708244; x=1698313044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LoC5sT/MoHnxKAzLZByTxo7ZtauaVIRapf1VSnEtn74=;
        b=ULk0KHvm5EnQ+H5o+ij0/Kl3XptCgl/hwAghIWHC0NLtgRKGc681k0/nAp/YbY2xrm
         XkOwQCvEAsnf/lUg+0765Rzw1YcsL3wvQKGHGets1KMyJfqSyCr9SkWHgD9LetQ8u8f0
         79I5d5toOyOT0biz+oHZPnzrjSzCJdXezleXX/Z/ABx7CdwH0rg7wAc0hYw7aqQPk9SQ
         N8GbXGmFKZ4niTWf+++ttxDXMJPiT0usbgeDVd1lvtNCbE30M87pbnhJZqO5PVYIYKE1
         pe2Cd7BQZS9pzam7Ec3hRSXW8Frl3QU1f05DjqNfY4UPrYIzCr6hIx7weLJ6Dr8oDINL
         bg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708244; x=1698313044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoC5sT/MoHnxKAzLZByTxo7ZtauaVIRapf1VSnEtn74=;
        b=MzExZufdOADWbbya+vE6PKW7pLn24I72EwsNFhQ2dI+d/wn9eoUzVjfYo/ryWCFI+p
         2Sqy1fY2XN7e2vz2gBe8DnJH7QSC9+CEeR5ao/6E+sHfXoP127ZfR5eJKbWHJYIs8meI
         BLRtYZawlX2SxyaypTyN+pJAAPcQfGn5t223WBj11JD2qbE/TbvxkYwv7Lohmz9Lncqg
         O/N5YPMzs2J1OdqzX1PJ++64tSgimqcip1achyj1gRVuztAzDtL5/81eCvrqT9w1CcNU
         j027BkFroHYBsSGMDKdU/bqyN4GB39CHb1CC2pm+qXVK/f2Ah2TLxeGoZoAgXcf+dMox
         n8vA==
X-Gm-Message-State: AOJu0YwjXrGwGsqmIibUYywECp7SKMkJoGfXPhdrWlUd81uQu4JtD6PM
	2P8e59J/CNGtbxRbvNx4rlZFwj3luYM=
X-Google-Smtp-Source: AGHT+IEX64pwXszGZg4iZx0MD9QGB9cftYcgFwAjeEUW0Aom+hN963V3WyGWSXEXq3pvrWZY+ZavfQ==
X-Received: by 2002:a17:907:60d6:b0:9bd:9bfe:e410 with SMTP id hv22-20020a17090760d600b009bd9bfee410mr1255974ejc.72.1697708243999;
        Thu, 19 Oct 2023 02:37:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d4-20020a1709067f0400b009b9a1714524sm3276374ejr.12.2023.10.19.02.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:37:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/buildoptions: tag the download mirror test with 'yocto-mirrors'
Date: Thu, 19 Oct 2023 11:37:20 +0200
Message-Id: <20231019093720.2567858-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 09:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189438

This will allow bundling all yocto mirror tests together, both for
the purposes of running only them specifically,
and excluding them from 'general' oe-selftest runs.

There is an upcoming test for sstate cache served over content
delivery network which will use the same tag, so it can be run
together with this.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 104448442ad..50c4a331869 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -204,6 +204,7 @@ class ToolchainOptions(OESelftestTestCase):
         self.write_config(features)
         bitbake('fortran-helloworld')
 
+@OETestTag("yocto-mirrors")
 class SourceMirroring(OESelftestTestCase):
     # Can we download everything from the Yocto Sources Mirror over http only
     def test_yocto_source_mirror(self):
-- 
2.39.2


