Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B086CEDD80
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:27:20 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.14025.1728473234936292193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vJbr208R;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398e53ca28so7504867e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473233; x=1729078033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=vJbr208R6QQX8o4VYBFNRVVPwq1q4gpaRA3Q78ca3oO37AEU1PJ5zTJXd4UUnUZoah
         00mwTV5mAKmdFC0VraKVCFPmWjacIJiuRhf0DxvP1Hu1UfZOJPcVPYdcT2oJgdgaHfLU
         f1CBVL2eqpyQC0vLrolV6K2TN4lILnjnWc1b94IW9+ikoDx3dYQRcOktJ9mvvnj5GkGL
         ffdLrp2wHrGv7WQ//stcZ9CvZMTfcBj0dDWvjLF8/bvObj+5PLUNDBW9P6wx48sMeLFJ
         zyV2Kvn8Em8gk8EdVs9bwl28g9JuIcc1imkdzIc4X5C2r9ITymu5p9A/uSrBZrLWJy6U
         SOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473233; x=1729078033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=RDeboNynxFdDjK8lcAi5q7j8XCNi6gHI7egIf9hmmVK/1pQtVHenyZKTbE2cd54sk3
         2jbExS27ePuf5suWtQym7lYeUATdcsq3xt4RxzVUkfJ0qAdH/71iZHDZBKw6h9tyHt/f
         jiPs1qgpymvKes/uy5/iy+tCrgGhL3UiciZMuEHF1YeptB+mY1ana7GXzAwF6l32IU6w
         GDWNeOHcdpvAf2Js+leZXmROsaYw+zDcapKJs8YecAHpLIHI01YPI5xcAH60J633H/La
         FZHzyQy8mcLi+yUG4SiM9ebvYz+WEnV3t0gisO/kByYuz0usX6SpwhLxnXPr+JBi75hr
         jv2Q==
X-Gm-Message-State: AOJu0Yz6vlwro9HixFU/xA/I9NBpizN34aIwnmVydYIOC8cVUKylTFuW
	1B3/6lL7wo2imp1P7+dkvRg0IxuZ/Nv7S3/gz6w14owNNd96h9BUL4AR9kg89khXZr8d3MQpCnT
	rpuY=
X-Google-Smtp-Source: AGHT+IEnm8oTJXh6EX2GRtkgE5/pTgEq81bn19td8xotHfxektzZ7MzDZa2Ibv+zOl/Jzln3m3sMrQ==
X-Received: by 2002:a05:6512:3190:b0:539:9717:7ea0 with SMTP id 2adb3069b0e04-539c497914fmr1280856e87.55.1728473232940;
        Wed, 09 Oct 2024 04:27:12 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm1449220e87.223.2024.10.09.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:27:11 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 5/8] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Wed,  9 Oct 2024 14:26:31 +0300
Message-ID: <20241009112634.402123-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009112634.402123-1-mikko.rapeli@linaro.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205353

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


