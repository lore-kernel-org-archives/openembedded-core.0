Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C88D21254
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:46:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.44637.1729154788124351514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ql64/HzS;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f84907caso859079e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154786; x=1729759586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=Ql64/HzSoF/y3VPwFvHB8rx+8NyFtN84AU+utencWnbYNk04zJqk0+MDdCBYrlz+3Z
         o/b1WPcgmFAvodod2zpJt3W/HJ7mnN8Nbq8R/AcgmC7v3EQ9sH0k33JKAfeKoUuGfMTX
         EhhkNkh4xnbK2a/xhYSjsNVkNLMwrrT4KZFOZpXR2b/siYLh3RSYFu5NGysVgUCDETc9
         Qkdyr5/GLpQJBiKij7yTnz47UId3Y2hj/e+fm7x6VLc1nhv6sHNo/qlREu8ozLlphWxk
         0bsnAb7ESv6P1apotBQjgJVvoH/xerKjzRWBWTqwkPG/I9IgNyJrOgsCw6VuP8ongNGg
         SrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154786; x=1729759586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=LoTd5TNexEn6xtqZ0EeLWRxgi2ANV3bYE4Gt18ls7/i1cQVB6fgO1skj+R5ZSzXHJ+
         4a36J+YEC/CtBehmuEZzAlp8Aahf+2ch82qcoQAcpJ//aj7oy27HrrulICKyRKX0+Kqh
         ++kI/Xfa2r1pJNhwZgGOiOfQulBQFroOVXp31mOEU7pujb16jpXENEo8uKV3yukxAMm9
         BahQWU5pPJb9vRMoSokM8Qg94DURDFVfwNDfIpdNJHsqLwUAZHIjYGBHQ1RvVLdYYel5
         J6DBu8Cd8NaWiaK7LbjWWw3PPbmU/k4tXaGBMwkpRZuCX+t7YQ373Qa4q8eNmeAQRg4J
         EwKw==
X-Gm-Message-State: AOJu0YxShK4stMnLPldERSWKv0EJ6SpqyDhA+ZMRsHQ84CWrR1vgoktJ
	FIYXfIoVCPMgchs6aY04Dc759RC4DYtcoHZUTyjj8NoSZrF6CjTdhia69W2vj7ToclmGxV0oTxg
	jfdg=
X-Google-Smtp-Source: AGHT+IG46ge1AakYY4ZxtDoveU41yWBrhlLVFEjoNcE0iwkdCVl+Gn9U2r23yUfssE3k1pK/knLvHw==
X-Received: by 2002:a05:6512:1256:b0:536:7a88:6185 with SMTP id 2adb3069b0e04-53a03f185c1mr4156309e87.15.1729154786182;
        Thu, 17 Oct 2024 01:46:26 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e4asm706138e87.55.2024.10.17.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:46:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v9 06/11] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Thu, 17 Oct 2024 11:45:47 +0300
Message-ID: <20241017084552.182136-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017084552.182136-1-mikko.rapeli@linaro.org>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206001

The test is actually using grub-efi not systemd-boot so
remove it completely. systemd-boot will be tested via uki.py
tests.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index e6d6a91a22..fcfcdaf7e4 100644
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


