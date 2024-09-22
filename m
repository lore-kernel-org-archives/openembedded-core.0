Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78634CF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:24 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.11541.1726994543213006322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UazXCoA0;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5356bb5522bso4053188e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994541; x=1727599341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=UazXCoA0kZC5pQqczUIpaDbm6N4NFBfb39feccHCBsWDryIVZbD7RCVYbRKQ668Ckn
         pGLcahXVMNk+368sMDgA8kRHcAauEWt5WMgr2GtGIrqUzhzNqnixsM+Ndwlcms56Tp7T
         iEFGA4WI0w+2Wcn4QGYyALFaohmSSj+bgq//0rXz+KikVuT0tQtpfRazRsvO6bOHzh1B
         u3FFPkIry0WBg0X6VBzQWzlixROr6S7Nq1VL3lEjEbzgQpeEUmIiEWtr6zF53E33G3dc
         RQ1O6MGacd7qAznrGP+DuOGRpshc74j1CslbMgKhneplxdzCKVn/qdCUGppI0ynx/lhy
         mq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994541; x=1727599341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=o9vkmI8WEWq37RAXNpyr3plGUNOHN5mCAW4vVPMVipeKbK/RnG3IRvGMWREomfTXsM
         dIRLV9Rzah0/wDJxrHK9FXwRAVphP4Gxsfd5us7H+OPBy0DCOkUVdemPkREPfrzmyL8z
         /I0ghmn4u9GDp9b0hNV9TM7m37rjAbS/RbGiDfnhFszGpIEWrIWM6AtowQW8o6X5wARc
         1za6eK9JJra2syBTAybbtD2QI49zjq3S3WNzQcz/VdsjvlTu1aZ4YlYhyf7jveiYeSwi
         VoeyM2VWLm21rH+c0Ls+n3JawnMXjjByXFAy/n7q5jmh2EEV1JdXjJ9jHP+NBW82g1Pd
         8bJA==
X-Gm-Message-State: AOJu0Yxo83G5rZeMT3vZE5oGym8ZMRoAfaGo+IQedyVCv6jaMkmnd7MI
	RwCc7mOqWA2TD8wikTyKB8Nd+QHJqsjVtbdU5EuQIuTJAcUZwyBEfdjPoUDDllxh3M8lc9TvZcx
	foh0=
X-Google-Smtp-Source: AGHT+IEoE8zjF/X2jFDxOqvegSSQsf4Ncq1oqLoPokvDppjGFDpsHHZaJm92tHiU8KJlT10L7nwdVA==
X-Received: by 2002:a05:6512:12ca:b0:535:3cdc:8755 with SMTP id 2adb3069b0e04-536ac2e5b93mr4243829e87.20.1726994541317;
        Sun, 22 Sep 2024 01:42:21 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:42:19 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 09/12] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Sun, 22 Sep 2024 11:41:25 +0300
Message-ID: <20240922084128.9648-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204781

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


