Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439CEC8302D
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:55:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.10291.1751019354844426012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 03:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=iiqm/ldc;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.45, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cf214200so14971345e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1751019353; x=1751624153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6NrEwmaZpFOhVNS8zgNuA58tPtA0+XDDG6b1WrS3fI=;
        b=iiqm/ldcEXFDlGl9JXJ/BX8SQXXZYGf1Mmhg1C7OXgyTPEI6xr4SnkLl7a/0j0LSXj
         uO4CkRdaKqd3PGffBhojan1E2df3LaPzwSmp8I1vpdJ54sEM68FeRgGLYvVSshV5Bq/M
         hB81dFJv/se5fo7y+aLtkm21tcH/3IbTMZAsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019353; x=1751624153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6NrEwmaZpFOhVNS8zgNuA58tPtA0+XDDG6b1WrS3fI=;
        b=Showj4EHjU7HME9ScQfEqXf1O3+fN2N23IYvL2drYZU2mxfQLlqLJVsOb+XKsDJchc
         MYBzXUfuJKeG+coFkn89ghJfXNoxbk+koKpazIhFg8Ly7P7G4IqeGRZhRVf/+UO0TPQi
         zT3qCcsFekAtaG/IM3fFmMdQWmZz78GGit3Vst0S67Utn5J1yTNbFA8d1Do2S8yFSzwW
         G3bjzWrUkH5EjyzUpFEJ9hPrS4TKs0XmspugvfMc9DLcfSV161dpORAjFnjvn4salB+r
         NyFp8uUdvwDCey3v2yU8Jv973naq2WA7LZiS4iH86KmU3PMpySIWjP4TPUkLJMdNXg3/
         mH4g==
X-Gm-Message-State: AOJu0YyFWVIec21EDdtbaVs0DKvHSJL3Q9LN1ugKx3EAR1ekpeIpNd0A
	Z+aXjmas6C47EBg+UCZh57/UX3VE/XyD2rW6QBGFGUqIo6fa8yI4J/2JNzheTps9WHLJFc9qLF1
	WAs++
X-Gm-Gg: ASbGncuNjyVugw4GpBuCtGk/p1vExmFiEWE61XQTaZwQtuUA0sQ0csl/DDRXbq3XD0b
	zpxiCbkEbBbAIrAm1ETC8EY470rNuL/Kp6U70Nyh3jzTWZWJ9BG5jQbhKiozOpkomr0aIcRGqlT
	JzxvsB/NsKa/kUkBFPgMXPql2AQsjOuD0H+dprNvqXf+80ZrCRQgpkmNkxIcbPsYIrkMO+Viu2O
	bklIRpfHkZ/6+tOeYYwv2GIs+XenG894p+pNzEuEIX3OPBgcOL2KlIjNT3SArC3ka87TYVn0YjJ
	Ezn35V6/K1wg26tsQNr2CUKhx/bhtChpmRfLffuNow/WV6BI77w4xpc6y7+woH3ZSAQhO4wGteG
	6nzB116mkBHliowWv79H0kXYaOiJWw4Tl/0scALvRq73JFl7X7bo=
X-Google-Smtp-Source: AGHT+IGD3mIj2HCkRZN7Ih/EXZs/VDRT7qvxSe2MUCzovkAru2pU1WO2W/5r/cyU9agIdfqV3qvIIQ==
X-Received: by 2002:a05:600c:4706:b0:453:8bc7:5e53 with SMTP id 5b1f17b1804b1-4538edf9e08mr31734385e9.0.1751019352860;
        Fri, 27 Jun 2025 03:15:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm46299805e9.20.2025.06.27.03.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:15:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [OE-core][PATCH 1/1] mmc-utils: upgrade to 1.0
Date: Fri, 27 Jun 2025 12:15:44 +0200
Message-ID: <20250627101544.1836102-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 18:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219447

This is the first tagged version of the package.

Change log since last version bump:

  d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
  a23ad7875b89 mmc-utils: Start to use the generic print_usage function
  e769d44ecb77 mmc-utils: Introduce a generic print_usage function
  6586fa5535dc mmc-utils: Simplify and streamline print_help function
  ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct Command

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index f3944aebf035..612b146950ca 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,9 +5,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
+SRCREV = "d8a8358a7207bd81d0c38dca2cf27a48bf411341"
 
-PV = "0.1+git"
+PV = "1.0"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.43.0


