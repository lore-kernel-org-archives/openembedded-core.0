Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164E6CFD35C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:21:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.10175.1728649280885903078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ES204jpx;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398df2c871so2683588e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728649279; x=1729254079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=ES204jpxfVniuXZMWD6j5ZnT5Ln2ZBS27ZeS2WsXhOMuB7pPahHuhDvlxqm1mD2HnF
         5e0yoXpwvtClIkPjFL36y5tNPaxHFSqZjA9iZPel2C7IEj5m3k8MX4nyBNK3hyB9IA+0
         oMy6WSK9ElBdP5yOmZMUjAFdhseIejhi6Z588uVaVztOWf1cQknV4bv5+Zu0l1wuO6L8
         CYUfewUckRIvcMn0/Ztqga9YtPd1ytLY3ZlkIj2d4tirDJa1JkUq4NR3WN30RNV64TxP
         ZKwPEYlJ9U/4FbRjdR6sb3YGsmNV8hW2jEgWbvqY5wbNcZAsXc7hK590MBCwNMMRzRw8
         7HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649279; x=1729254079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=P+p2KpJqgsHMfq2BZpZSs1gAI/PosbqzcI1pLbZBQYIGVGk77J6r1ARDkwoowTAEQx
         PTHS6SuxDr+asx4zy+FAavgMbb77jFizs/zJUnhqhmrqV2ESDBaEmXMRzHituJuE7OFi
         Tjwz/VkJitUoycuz6cPxpWKsr+LXgrIm9tUdHekUEQxWbnHbAFAUAmafu40+9CV61QOt
         DAW1xQukWBeLa9yQfrbBtHjJDjoRI+JmCk1f4vGBvLXI9rYMIXU+OSIaiz0Wme21ZWs3
         QPZAtpvi5HX1L5ik86ZRXoQs9io5eOe7Q2+iFHJYWNoWL1u6DzDIlwjVuzFOsap3J3DE
         gk2A==
X-Gm-Message-State: AOJu0YwgX0QoQvJwtSoXWySscRrlI04IC7H+QC+NC1XfuxmUSpTTmRMB
	dWMx2MZf59K7WZSmS9/gi521Jj5O1aeZwoOwMFBIHHXkm++pNh8jt8uvjA6R4nejVanOlbmEb4t
	e4dg=
X-Google-Smtp-Source: AGHT+IE2zP6Ksby0nXqEyZlUO2cqXNiKr17V1S1haQlb3hGTodFC5GTgb/o6NuOEz+sB7eabd1Xx6g==
X-Received: by 2002:a05:6512:b1f:b0:531:4c6d:b8ef with SMTP id 2adb3069b0e04-539da3b43efmr1353780e87.6.1728649278948;
        Fri, 11 Oct 2024 05:21:18 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8608sm591336e87.89.2024.10.11.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:21:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v8 5/8] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Fri, 11 Oct 2024 15:20:41 +0300
Message-ID: <20241011122044.12222-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011122044.12222-1-mikko.rapeli@linaro.org>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205690

TEST_RUNQEMUPARAMS variable is used to add runqemu parameters like
"slirp" networking. Support this also in selftests so that "slirp"
networking can be used instead of the tun/tap devices setup which
is easier to work with on shared build machines.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index fa74103dec..e6d6a91a22 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -6,7 +6,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 from oeqa.core.decorator.data import skipIfNotMachine
 import oe.types
 
@@ -14,10 +14,11 @@ class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
     @skipIfNotMachine("qemux86-64", "test is qemux86-64 specific currently")
     def test_boot_efi(self):
-        cmd = "runqemu nographic serial wic ovmf"
+        image = "core-image-minimal"
+        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
+        cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
         if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
             cmd += " kvm"
-        image = "core-image-minimal"
 
         self.write_config("""
 EFI_PROVIDER = "systemd-boot"
-- 
2.34.1


