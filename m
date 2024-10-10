Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AD4CF07D7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:57:38 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.38958.1728550649742179726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VK4Fr66N;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso9909191fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550648; x=1729155448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=VK4Fr66N9o99TjG57E14dV7NN8PPnGtzzUd8hm7a3tb9iFx528d655T2JiUc14O/VY
         y7ty80XDn733ihNZs17Hm3Ion1e5o2af1M12XruDV683SnL/84rfg3YJaisVtu6Qy2L1
         cjGW8Q+ykwSdRSfDAEtxjiRvsxtjz/4/hjcKiS2398QlKuqOeVqhAm+hsGtIx9pD87ce
         btHBNyPgkPTukPFV/3dinrlsIcqUV6d/ijn/dSCWLxx/m7hdwLrMQ72ETF3Aemj08jNq
         gfPpL0sU0L70Lh/3499tDAM4fAF86M9zGWELUhPOZ1NlasXx+C+Mpg8eu9auBj3YR8F0
         YAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550648; x=1729155448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=E7CznegTZ6jvuYy3hkA8EV/cvHoXY1fSvqPhLaijsGn69raoNbP3dA/2ITQF/os84D
         YqAgP5+pqHxNKknlvE28/xLTxss4NFmRyyD5nwMTFqoz8rJKD6FR4MRg3XhDk4epUfxH
         ygDIHJGCItv7X6KzM3sL5nTI6tlKgP6NBTSqTIAZWnuoWU85EXVfVVmEEAxIgDJZaJGm
         W38os6jnGaysBdirDI890czIS/JnZiCEFRDSZ0dCQIlK9t10TJPVGlrJ3xr0O/9b/ehc
         1FjK+/uL2L31rl8Jg3waaBK3O5AH4l3c80SqeUE8A6oM3GYLtT9N59mFti1bFPOd0zXB
         FsWQ==
X-Gm-Message-State: AOJu0YzslN2t3Jd26hHtj6oRx6zSGXseCeB/2cvS+yPVZK/Ym3C6I1BA
	uPyQxstS5/nJch71Dx20fowF6SOcFlNj2kRLgOP15vIo5HLWdV868bIJIZST5n96Gc1ahfBU/qD
	pRvg=
X-Google-Smtp-Source: AGHT+IFPreQ2RxqlKDdiCXq69gaHdKX4S0aFCjI6UeFFFHKwrjsQ248vh4SW2hmYYafZWMRrq0y26Q==
X-Received: by 2002:a2e:a9a8:0:b0:2fa:cfba:fb7f with SMTP id 38308e7fff4ca-2fb187f36c3mr51454191fa.40.1728550647785;
        Thu, 10 Oct 2024 01:57:27 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2459cb82sm1397621fa.56.2024.10.10.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:57:26 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 5/8] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Thu, 10 Oct 2024 11:56:44 +0300
Message-ID: <20241010085647.439990-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010085647.439990-1-mikko.rapeli@linaro.org>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 08:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205394

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


