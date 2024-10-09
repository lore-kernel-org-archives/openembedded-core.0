Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096E7ECE572
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:27:20 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.14027.1728473238297315245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dK73Aq/+;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso94331331fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 04:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728473236; x=1729078036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=dK73Aq/+rK+mXS3w/qi/NGuIflvQ0X0YSpc2XoBl51wg/6klqjVx8PciIOyGy+BGsu
         fRkA/65t3k7GPYBRiD0HDgFuAcmFh7qSsqMfEmktdb9KI5xP7fuQynhyYYD/dr4OMFl7
         I76P/9pnyVw+CxC2761eQqv+GBbWzpemnYR76oudwdDwYJxTbgPOHeG2bLosr4WJBG5y
         wGnn2J2P9spdGiIRRzWrmYR8q4lPuoCvC03s2d16FVSRoeK1X4Mnr3hJ979ITEw78604
         CeM6DTc6s/OLBhYSM7p4MMiMKw8AkIZ2L2cP/VV+shnCIiZWFusuFa5+GfhgEqT4uHnY
         sYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473236; x=1729078036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=md8qZRlOIMIL3BZKccHKOHKCDcwoYs/cdbZm7Nc4cGZRHU6/tt6DHCN7hTYki89EHI
         27baE+ed9MDp7uP5TchRPrWD1n7/Z8kIuOoW2ladJOeXmTD9S2JEsOS8xBIa9rGPLBkd
         wEoGIwPT8Ph1lw/IIuf94HFNCBbiy/Hg6WZyu4eCxiylNJSyLyKPsLc/jORp3/RNyTAn
         rRnwNEDcGciMaXF7o44Hm0hEMNj+1hTXoQs9lUNnm1CjWXvvclU5Lmit6ZAqe2mB8Y5x
         75AXZ9CDnQKO6pY1DsNaC1lmEPyRO5GGRNCbP1/5wU9UeTjFa46a28OAbbLxdQNJRNhj
         HFkA==
X-Gm-Message-State: AOJu0Yx/31CsExlefYGG+xYKogRpcWCIVhcFaV+D9PlBz/rIv1R9Y7Ec
	Cz6n6CV1lJsXBZc8glgG8qrFCV7t0vx/aIZwGLsFQBziAQKMr4QB7/2KUE6c8dU07H5F68Gafv4
	3w2Y=
X-Google-Smtp-Source: AGHT+IG88HqorA7ZJr1SeRNMyu4URgk54K/XcKEJpc6GrLfVMoEM9qZa/Blx6C7Jaa042otau6/FOA==
X-Received: by 2002:a05:6512:2387:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-539c488d74amr1966483e87.12.1728473236196;
        Wed, 09 Oct 2024 04:27:16 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff234e2sm1449220e87.223.2024.10.09.04.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:27:14 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 6/8] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Wed,  9 Oct 2024 14:26:32 +0300
Message-ID: <20241009112634.402123-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009112634.402123-1-mikko.rapeli@linaro.org>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205354

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


