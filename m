Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39821CE7CF5
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:29:18 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.76651.1727771347878088884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sIgik++Z;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso3170091fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771346; x=1728376146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=sIgik++ZT3byHXQnJ3Ozd/7d3+8O1AsM372RPNLsO351WqP4NQ2Mo+601bDqS1Vo/K
         rdpg+waDD9T70q/3B7W6lU8JK+3A/swkXbo475+5zpA/GQOmXvozplwkmmbeEcAkiYsm
         wxoH9firgDt5hyPQYHGXz3kzYDiiKMyBAK+RxByTVl38zmzTCocxXF68RBlEJ00o95h5
         q5/8GFw4IVIFGcNgv+7RsWC8vgQXUV2UM/uLK4ivIpsxyv9Ofn6Jg1oAZzSpTWVoys67
         Ng0x4wugo4oDb1Qlt90dkMvg5iVhIlHIR0uPYIfFg+noyPR1clQr/Uvk50Tz8p+txjEm
         SvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771346; x=1728376146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHK/wJqit9EI4RDs5pqRkRsBKVbzpULM3hajdw6AHGY=;
        b=BJSR9Jbor2KxiY/oENnrm8D10qXT3209oVzvtlxR4jOxA0SZXhoN8+N0x2p0B7Sigq
         tmNzynDjWcZnZKxnBw/ZV8cAO9GsYfzrK8DnjsfrJIKufro7gCZbozZw5Oq6/+RY6Q/B
         WQOwo4VgDm7k8NntOsCA5BbK047o9vmkoNehqUr5LSSjaOO/uwj0dwKsB6Haw9vI1mR8
         7ATgPZiIVL78YugM2POsafXdQ8sEz0CRQZ3vIpMLpjc58MrEDeJBY/VWN7Zw8CoAF3yB
         CwUBBt0c4yL2jSNPrfK/aOB/8Gx0C5whihqfiTjsdYXgdimPGYZHqUbylkDK/PrkdEVb
         BhCA==
X-Gm-Message-State: AOJu0Yw93W+V5I3SbHQNjLBjlZKMDyS9r68urRgnCGIuYnu4JXJ2XutK
	kKcSPv6q622w6asde4bMZe6liexfFnsZcCaFxCrpX+dLat1chrbnTt/njLXhZky8+HraDBKCjld
	bNmI=
X-Google-Smtp-Source: AGHT+IFP9sYPBzt0YyRVtRdQsqhdt3NNZUaqjqcS1LbeC7HAhD2g3kZvLe5ih+NlQ+2pruaPuM1TZA==
X-Received: by 2002:a2e:d09:0:b0:2f7:4ccd:8918 with SMTP id 38308e7fff4ca-2f9d41b5f1cmr64136771fa.43.1727771345844;
        Tue, 01 Oct 2024 01:29:05 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:29:04 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 08/11] oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
Date: Tue,  1 Oct 2024 11:28:18 +0300
Message-ID: <20241001082821.26115-9-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205142

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


