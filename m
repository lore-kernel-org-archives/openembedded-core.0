Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1229CDDE76
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:09:30 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.7139.1729685370170226199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=R6icKKMi;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so68213641fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729685368; x=1730290168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=R6icKKMioMrvZ+PBn6VDRHU6sb+vpsKK4PmMM2DAbVvBPmUWddVD7pVPYcFmTK/JcF
         THqCXxEN2/k49nJewOXWq0qeKBfGLVr1evDUE875vpHqkDKjiL1JfJd4HbsCmYjI1zCZ
         ckEPXkBehSsd4d5ZztUEWvID2aolxCgB6S/jHj5Yd90kUVhfRbjRmmS1AB+w99Pg6Boi
         Lt+jn9D4OqDY3EujGwh9WnT4k3dn0WdwkZHx0wkV/8TZW7wh8VsfjqrO0GlrZcrnR/Av
         4637MZtJ0WQLOeayTqVg8Turq0h9bt+Ro4wZl/9yC5QgZLUIUVswT3s9yl+2QVW7DfYn
         1fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685368; x=1730290168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=D6l4do6ESkQBepd+FrgUVAAnDB0RT9VUan3nO/FGsuBxyITf32P7eJpa+vlQdtUbsS
         21G4qqEDj4d+v/RZ5Cx1HNVXSq6iplv8Jt3z7awkAYLtZ1bvadIEus4nu9xF1r/vqkmJ
         i8e3PKczAcsiF2V5kPNtRlgIc6ObzI2vVL9VReer3OveQTYSkI1GXx79ybz39ynFpi7X
         shdYV2szP9wb9o+tYDmqcqkBvA2mEoW05llgHGjfdN0CffhdnLjw3IA2D7CJlP547D+5
         RDdWSnWPpGOHi2XvdofYmF/WAlg4J6AKyapqHimiJXvqtdiwjrxZzqChudLQ0xMcr8Th
         mjAQ==
X-Gm-Message-State: AOJu0Yw25NIJ0uvB4cw6e9q31kB5HIfPauWa5+MSojERh03HDitlQ9tU
	tmmEHtW2ak+JMuQj9uC3PyEKUW5ToPruUnbWrWgHQCWiiMzT06RJnsNytAjZr2HPKoOe/CB64S8
	NpYY=
X-Google-Smtp-Source: AGHT+IFtQeARwt2EzIU8RPppiPOdcXi/J4xgun9l0riTyUDuZQz+CPqbkypFZlobC/h3sKJ2WQLhVQ==
X-Received: by 2002:a2e:611:0:b0:2fb:8df3:2291 with SMTP id 38308e7fff4ca-2fc9d335b21mr8661761fa.16.1729685368168;
        Wed, 23 Oct 2024 05:09:28 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae25d87sm10763801fa.139.2024.10.23.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:09:26 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v10 5/9] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Wed, 23 Oct 2024 15:08:35 +0300
Message-ID: <20241023120839.437771-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023120839.437771-1-mikko.rapeli@linaro.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206206

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


