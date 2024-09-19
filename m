Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8172CF3959
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:38:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.21533.1726756677626762904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hHLpgo+5;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so1149253e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756676; x=1727361476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6FtSuErjFeDPdu94Z43XasX0hpYQN6ZTLUYfJaj6NI=;
        b=hHLpgo+5FjM1SsstKwPywEYpEfQ53QlBlsR94Iw7cYFSocsdjgk6giZXk2mtmT7fF5
         6bv0c095AcnRc8fwu/Lk8UiLakUmSNvsr6OA8EdGJebCtARcQsFaedHmAjSsnYqp8S7u
         8rmzh+CTA/6h5/lJwnkQB/SqfpTAYJA2EWSc7o/dDEZQa5AqFpw4fn04wGE9xDVvj7L3
         s6uAHW9XD32bCiL9k78fL0GulQO/AjNPGOzWizUBml6yHlGlwd7tng0RmmK1xaae9oEB
         K6HoHdb5CQ+zWJQ6xSc7295i0F/Z9cITtEKyiI/xY4L+T/xhoG3FXXCLgMlxFu6N3sOP
         FhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756676; x=1727361476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6FtSuErjFeDPdu94Z43XasX0hpYQN6ZTLUYfJaj6NI=;
        b=fq9gAaT3BRq0cBWCl8RUmQsiyRB8JR0qUhaU9Q3oyqsAulCL3qTg59zNKOk6hJSwKZ
         ejYUxx5MjVBtZgJ1AJM6b2f9ZQlhbJdfj9e8PatB3TCT6Ggsfg28yht89BfsrrCaBb2x
         vyIDpBWqRFmZV0NTsioAljLz1MDdWWYvVDAbp2TGAup7A05seVWJQgriAG9swhfvPWbA
         BujVW9EAnv9FwMdG3ugcYkt6KE124pLHm1bE5i/idHVbRDOycNcbG/eojMWAM89HVyof
         ckSSI0lpBGZS4CSPf8MzN1G2ee2tI/2A1pTyHCtJp94bexyNrLrfG8rNSEL/6LjFCtQj
         dIvA==
X-Gm-Message-State: AOJu0YzyhiL8U7+Xl8FIwI5gD2R3a1QoDksnehAH72wzzXAynik9o0+U
	COdz35tglxNwMOozeFl2NGkNHsPHqN4tT96RkGD0UD9/Zg3B6PmkSIWwQGYfnMWmdU9GqyehY4O
	+iBM=
X-Google-Smtp-Source: AGHT+IEYcFyDiUfl7P3auU6o+KCnfgtWHEPAqYiV72rzOjZRm5646lxO+GAjNPmJyGGPWD4jfRMB8w==
X-Received: by 2002:a05:6512:ac6:b0:52f:1a0:b49 with SMTP id 2adb3069b0e04-53678fcebc9mr15019030e87.31.1726756675674;
        Thu, 19 Sep 2024 07:37:55 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 10/12] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Thu, 19 Sep 2024 17:37:04 +0300
Message-ID: <20240919143706.6074-11-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204702

The test is actually using grub-efi not systemd-boot so
remove it completely. systemd-boot will be tested via uki.py
tests.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index 671bb68f2c..e039ba0386 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -21,11 +21,11 @@ class GenericEFITest(OESelftestTestCase):
             cmd += " kvm"
 
         self.write_config("""
-EFI_PROVIDER = "systemd-boot"
+EFI_PROVIDER = "grub-efi"
 IMAGE_FSTYPES:pn-%s:append = " wic"
 MACHINE_FEATURES:append = " efi"
 WKS_FILE = "efi-bootdisk.wks.in"
-IMAGE_INSTALL:append = " grub-efi systemd-boot kernel-image-bzimage"
+IMAGE_INSTALL:append = " grub-efi kernel-image-bzimage"
 """
 % (image))
 
-- 
2.34.1


