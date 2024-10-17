Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63C7D2125A
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.43909.1729154798086477101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nZi4qPd8;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e13375d3so768199e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154796; x=1729759596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9LeoT1E2wZPPInwpRJvXgrNhfKHRw6qkNxEF+VzWns=;
        b=nZi4qPd8qlT33Wai8BN17HVgDwJWf901Ypxf1tqhQgcSQUzbAeb5vpTzWya8RGRqxL
         tm8c61krXzD90ZYvukKwDSf/MDfW+IoN2J7HysLR6E0/nvtBHzsDmU2gyhCaAyl06b9+
         IvoBKnPVTFOAdeaT/CNFB/NDhA+Pij1552svxYm1flmxM2xnqkZgApPTp+asajkOBOKq
         YR0mjQO72BQT8C2LxYKugvnrzC2FOZN2xwZn4+YDX+GmW9hnuVdjBMbw7DvVLbUVb5w3
         Gg62CFcPlXEhHhTzk3MEsfXsmVEEiOfw+cH4bXgFNCePMW8tbQgIa+FpDVf5fqHoIPsi
         4KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154796; x=1729759596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9LeoT1E2wZPPInwpRJvXgrNhfKHRw6qkNxEF+VzWns=;
        b=RuYuqmAf03lU5D7XTYLzabspwhkXKAQNHBgw9OdHE09i3TDeyvbsAyXCReeR1u8uQk
         dMemuWvjnJr8v+maWMbOXV6CLIC7mED3rFePYpr/MVJzBjTTx71LV5//encj/92frKSX
         t9kflCf9jZq86uSGac+KOH0FdI6bWeucaae4zIisZj4QF+CYen9IroOCF7m5zP8IX0YU
         uCREkc1zxgGgQdTwNs3yWysyVe5nPOFnTLa53/Oggzxjmdoxdry/cQ+RXD6AZxwK7mvw
         GzoRWFDCrHNcT56EjhPo5ITSa6mg72QCKrzm9bELkeu7O9ACziXlH7PfrDP8lmwLC4Zo
         B/FA==
X-Gm-Message-State: AOJu0Yxl10zKW8NMMFQJww6up14jbXHJes+THOyXLuxnGwQZaU9W633F
	7zPkjMkvlWqpm+zam8sBa+PAKA12KSfhMegPw1t1Lc4fUAb3Vk1NLJN/DI2fnfDk6WBGrfLWgAl
	UQmk=
X-Google-Smtp-Source: AGHT+IHrkhK++JYCYxCMAOWQ+Y64VaBrsGCEfgqN/sNYNcnX30uWdIANIaEJ7CwIEWknl6Y+nscOWA==
X-Received: by 2002:a05:6512:2350:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-539f7abe40bmr7361880e87.45.1729154796044;
        Thu, 17 Oct 2024 01:46:36 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:35 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 10/11] oeqa selftest wic.py: mark efi tests to run on x86_64 build host only
Date: Thu, 17 Oct 2024 11:45:51 +0300
Message-ID: <20241017084552.182136-11-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206005

aarch64 build host fails to boot aarch64 qemu target with u-boot uefi
firmware currently.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e5caef74c4..664d1aa427 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -20,7 +20,7 @@ from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
-from oeqa.core.decorator.data import skipIfNotArch
+from oeqa.core.decorator.data import skipIfNotArch, skipIfNotBuildArch
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 
 
@@ -1342,6 +1342,7 @@ UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
             self.assertEqual(output, '0')
 
     @skipIfNotArch(['aarch64'])
+    @skipIfNotBuildArch(['x86_64'])
     @OETestTag("runqemu")
     def test_efi_plugin_plain_systemd_boot_qemu_aarch64(self):
         """Test plain systemd-boot in qemu with systemd"""
-- 
2.34.1


