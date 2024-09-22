Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7489BCF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.11542.1726994547438035565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ossfKKCS;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365392cfafso3426596e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994545; x=1727599345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=ossfKKCSypiIqB8G+xQWYE6apEfJ5R/FEuKe8yEeQ2SpCUL6NT8ws60NqmAo78hcVm
         j1ku5ngywQu9VMDN8+12zjm3o7330X/CDJW45+SZVdis3cAr1Rdb6K/Loj+nch8zoAMY
         ksvksodV8+j9ZfBinU9CUjSubql85imRwWJ7Hw8O1zWC6qxKSzwRKouLvJjnySurSW1r
         hd/RaY62h6P1zk2yikhhsFZg2upI+E0iANjcRkmDPXVCFUd024E+zBtFdntx0RUdCPsV
         WiIoe3TLYKs3ILxu5dnxFSWKFReqOSX0m3z3I6MZdYYCkmzA7KwvQmIf9Yhs/eVcstk8
         qRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994545; x=1727599345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=nwEOmQvRXj45xU5DaUCQu+eDtrct/DeHgrQAxQQiwlfGX8zNr5B6FJ7NbayEfs4jlb
         Oo4rtM/11TGEbqTJCXbVysjtiNxG7d5HTkEBkFaaKpWsitaAMtXtxMF5P+9zhbuZ1+gY
         UotZs1a1g25jU/KkmWhZiwCLjCWm7uf3Ipdj7NCnAVo7KfpdvF6k5Vm4xkL9poXShkgW
         KbJwnGZ66tCfXoqRNAVGKYTyjncEx57As+2QAsEbj2vn7XIT6cfI/RfUaIU6MkCWF+0i
         +uAfCr0ADpO65Gqnbkui9NGBwA4kKlUjgC9nY/K7mA4BR0IWdbEkqimAMzs4QaYq0iR1
         2GbA==
X-Gm-Message-State: AOJu0YxMY7PJ4/J1FD76U0NWeGZt3pNx0IWvdN9gFR9gkredWn7f9dDV
	6GhWZ8VMR/GjWDfVxupnTwMxHjqZ7YH2hxILieQfdJ6mdL4eGFdmjc5Yyiik9JaZ1J72sC0STtr
	XM98=
X-Google-Smtp-Source: AGHT+IGhhs4jPVYqnkOW+v1cN/NSGfXjjsUZMoqAEpUHhQbHugYaGxaYlxMK2dEPNl064Rn3YXVuDA==
X-Received: by 2002:ac2:4f03:0:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-536ac32f114mr4296990e87.38.1726994545562;
        Sun, 22 Sep 2024 01:42:25 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:42:23 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 10/12] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Sun, 22 Sep 2024 11:41:26 +0300
Message-ID: <20240922084128.9648-11-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204782

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


