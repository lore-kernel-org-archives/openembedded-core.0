Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E26BCF07D5
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:57:38 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.38960.1728550653815851771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ax8c9AUC;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad784e304so6918361fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 01:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550652; x=1729155452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=Ax8c9AUC9ashaZhcS5XH8MvdYVeblHoKwNk8PRV2HeUcKjM5WoJb3rvqW0n13zudpY
         QjipArlTd+jGjt3XLvwicZnJ6yZhKEvFy/biSlk3lz/YwI8wKHfnG34jlaNuVMr7tWyM
         b39aSbwV3AYWcDUp8LV241tTkaHCnB7LR4DUn2Dwbw4fQrsllRh9Sf+C84cqcdkBlVAy
         45jq4F1piHnDCBhVNDOD22w7LFzcMqz5ijnbFNslXHBL19XPtTLaMRXBgnefEMvEj8G9
         lj9PewWaxm+9Vee3bNyA2sylQTgeQZPvhMCj6tdd4Y2pEuQZwU2DIQT2PMa6I1gw/niw
         6WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550652; x=1729155452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9V65r0HXKpZR9eOjIBLjsUByBDggRnmrGcQf/O+X80=;
        b=ZGnNtFcou2oUQFXIV4nQ4wiA5RfOaAXu9Bxpq1QnPgmu031MwtadzpRC5u2UQBjD9/
         sArHwq7etiau1qARXrX+wb+icCqbX31bGCNC0X9fpOxbH6BIVs3y2UTQGYSwtGAegdOc
         5JuBQeZoTGcMaZs5UcuFI9IUje0kZpBbkKw/ukghBFOsxeGoU+Hk2KDhSEDkTAGAuWBq
         i8ONCfeEazN7C0tqTGoItotOQBRYt4yjZDEcjNSbKN22bgDMgcCKyXydgipB50bxRI+o
         GNSz0fWSrHcG4BThZyygUYGAf+0kFxia1pEXkerpUhLbIyI+qIVvzMTV0wfmOZf6tErE
         aE8A==
X-Gm-Message-State: AOJu0Yw+YySel1Dp+qiKvP00wqWQ2ANngpRUsWIBq0vwydNMwx6Cz6Eu
	cESOr744aElJbHw84+AM3ZlakQliCC3o4haSA++19N6/4oWN0w14NGGXkl4RiGCtqB8hlrlkRea
	Im74=
X-Google-Smtp-Source: AGHT+IEkYmRb2ROELz90/A3UkxHUdsOGsDs+BQMzzbYD4lIWpUjXlQYfvWR+aSPYGXWf2N6/OEBmDA==
X-Received: by 2002:a05:651c:507:b0:2fa:d772:1009 with SMTP id 38308e7fff4ca-2fb187ac497mr32229721fa.34.1728550651872;
        Thu, 10 Oct 2024 01:57:31 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2459cb82sm1397621fa.56.2024.10.10.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:57:30 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 6/8] oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi test
Date: Thu, 10 Oct 2024 11:56:45 +0300
Message-ID: <20241010085647.439990-7-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010085647.439990-1-mikko.rapeli@linaro.org>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 08:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205395

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


