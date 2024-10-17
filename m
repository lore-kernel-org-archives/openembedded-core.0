Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4AAD21257
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:33 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.43907.1729154785472472261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SxsEJUrn;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e8607c2aso857814e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154783; x=1729759583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=SxsEJUrnnBPpthbLAhAoQOJgPqhqrGCnxNjZUHB5KxkOHCCQlYGOwC0iHC3qxjFfu0
         BgCe54irRzhiqhaynNf5PH0MzpkxJKf3nYQTSXp0QzyPteUXI3Bk1f37Kcy1nJH1EStP
         /9rBFVQwowOLGrSrFPgos2mg9GoYqs7YH0IHS+Ab+ELNCnzykbHOYYQDJfB6zMgLa9nv
         BRLH5mTgbcExVUCUBmLdqefd/bQwJAs2CIwPaozkWq9508+HQV6LCsq5QAnO0tupsfNx
         m1LU/tTgZFJvDgUzpQ8oM17oB3rykFWoYF6wqc+gYvknR7RGfjbf4bFzyQa1Ed7YgUze
         jzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154783; x=1729759583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=l/L2hyhzT5ZoK99ag3GVYyoJAYJQVaD/ZmFbYBk/fs6MwkSleTsoOY9ub/oGh5ueCI
         u+tNFDZHo8vv+xZME7/H/xA/DgVsZVTsyGhwxRqTDWvuTwncMBzMi0icTN+qkV8/+j6w
         RfMCRuUhfxJUYADR55aSdeoqgHdxtQBz8aqgzZidqzRTYj/rHpiTnsgburUynxFwhf59
         GyuaG59oiYTg6ib3VCLcFoMVTnRgHWNYHbqPEOcPITF1bJ0uIUe2xaduWnFdX6TqAjDK
         ideyXC/8L3wJGcMDZnGCn5VGH7KWF4M1NTDpKQCMEEXb9GPIjXUhuHKO7rEQ7qLrcdIv
         uyiA==
X-Gm-Message-State: AOJu0YynIGB1IbpshZWjpC/Cwm8S1ZDlfwvUcmqPVOUKXk5TXd98tjRF
	6ZvtDINl9vR15Le/cSQ68mOXqHTsSdtYi5QKIkNfVVNuANZRg2sGUQZBSyReBr8LKprr8HXnaqj
	WbTM=
X-Google-Smtp-Source: AGHT+IHoDyG5L3hmoo3YflPhuL5EcyC4S7AmOq+7dE6MgbyT/BumhrMP3GT3iAJQfgklvoKsa5RscA==
X-Received: by 2002:a05:6512:15a5:b0:539:f607:1d2b with SMTP id 2adb3069b0e04-53a03f07230mr4549884e87.7.1729154783476;
        Thu, 17 Oct 2024 01:46:23 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 05/11] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Thu, 17 Oct 2024 11:45:46 +0300
Message-ID: <20241017084552.182136-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206000

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


