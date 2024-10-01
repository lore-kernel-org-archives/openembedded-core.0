Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A2CE7CF8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:29:18 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.76279.1727771349432883744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Bmz9ks2j;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so29473261fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771347; x=1728376147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=Bmz9ks2jX/n1acXw7Ckb4mu7GQBW9CdCs0WLCer1Sa3+q/NxPhyz/OFb76fHjM16wt
         +/H/qLzL6sX4jj8FSwI1DzYcXZmyCtQo8h72aJuVSNvGaRAnQoSNwNlT5e44UDPjyZ2R
         w8BKVxPtmilf0WaTsNipWpIlFNpAqKNPD7HfJLskQ/SciQHsqofVU0bQVu9qaLrgfiCX
         XRmifhoyOxv/JQFoMSFHL1luGSjtNL4rXmLPeuubNUyRGfC3ZOOmiMhPkaNGXtHwdO8Y
         VDXWloImBqJuZUxw0Lcy2EMjQJibYUvPjB+w4V6sSgU8Tx2F6ANHYU17pfDspPng1l0e
         ZoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771347; x=1728376147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=C0DwhT9OOx185PPA1HZd9n0nIj4gk0XivxNdpvjx65zJKCq7JXfch2C/h8IVTBFson
         iZ7BNj0cwQHFyXyh8yYuVi+Ki94n72uOQqxgZG8z4nIogktuMiZBCMoOMXp9w4VIyZea
         Jx8C2sieIIP7lUQMqNlxducufgaPpwgyGM1gBE7f+yb766oZfkeycf/Jng4qxjti8LrA
         E0jcyoa2sJ2uk+pWP5LqWgJYGUfaIYZq9aV5VqjHZiqtC4nMYqHO1uo90vPZSXJqIHkL
         K//6cWPpj1zGFxTwCIEj55YiLrznty5InSazbUVUxLlb4/cBk+Mlbjby+4el5VjhFteR
         tDgw==
X-Gm-Message-State: AOJu0Yzu52F1GMEfSY+WZ4xzUbGOzun2FXN6oZ33tRfH4z0gOnvPhenh
	fj3a4tyJtG0dCFleiys6KcbgSARqJv6WwK/DE8+YIfL5+EXgtn3Jjs2zEDmPA3SStCT1yuuT+/c
	c6iA=
X-Google-Smtp-Source: AGHT+IEOJ/4WKcImziAgwKtjSAPpsbad3PiTQuYIMMRR/4EUaYzn7QH8mmTvQz1ezu1oekw/dcmuQw==
X-Received: by 2002:a05:651c:19a9:b0:2fa:c5e5:62a0 with SMTP id 38308e7fff4ca-2fac5e5671bmr43312011fa.1.1727771347558;
        Tue, 01 Oct 2024 01:29:07 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:29:07 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 09/11] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Tue,  1 Oct 2024 11:28:19 +0300
Message-ID: <20241001082821.26115-10-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205143

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


