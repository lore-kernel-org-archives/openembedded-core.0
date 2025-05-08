Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8E4C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 15:19:44 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.18506.1746717581096742831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 08:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ADqh7aeY;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54addb5a139so1363127e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746717579; x=1747322379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJO9R+3zN2Hc97ZjX8g/zjUVgiUvC39w4WoiZ2Bxyus=;
        b=ADqh7aeYt2C91cBKM3ERO4l0lvvfoj1ohOCy6ojFGZHTthRwJZtJFP6xQ1Z03+vsjR
         BIiGaFq0ZwmXrRXUURWc/V6aVdmmx1bppVMgIw6yVyXVybuDaz3TDw79sXhOUYEjSVcf
         Op/Rm1cSrqo4C3Ky18nsYx3PEtnaFn7BZFx/UPsHBVt27W1wtVGzNV38vEtlSjGX7jCt
         BCaigWICJSaWwu9qWeRgzrAxV5f7qsYSkTedvt6PTv+phm3rAjwArUSnU32K7RFtSFpm
         z1K2+mCtP7QZ2C3/qQbe+rsaif03LjpZfZz+ZGwJbPeYYAK8iR7Anp2O4tQ+K2Le/cPB
         IUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717579; x=1747322379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJO9R+3zN2Hc97ZjX8g/zjUVgiUvC39w4WoiZ2Bxyus=;
        b=W8qJWTvV6KjbeOAdlvqsgXPIFuExkjBbFg1z/2OlP8xW0TSV4EC/Qx/OgcB5BJdwyW
         9zlFDe4liplJgIw91vlTTc73dMWgi0rudx4cEa9qKYWYMFaCaaEslgufH7BE77vNHq0x
         swAqDqejMJ1aDmIWt5FhKnAccTFqaBo7/Ljg8OghgsKxpBv+/xvVKdIY92JtU3Dst6vL
         wKQ/+nYG78SBlZyY7+H7HzISg2qMc3nhN7ntIrbJy3M1LhEjzLL7LAJp7szA9dvKDofE
         Zo8wAKuiS4qKkZoE7nlf4ADSnHidOLoRJvAwP9WK/yMM06mxiPLXYfDUIiADhDKlS2MU
         K5XA==
X-Gm-Message-State: AOJu0YyRD2vnJ6MGhR+RXTpukqfw4X3+xh6w7FMxEJEMEx6WLU2hX++U
	YxbWz24nRs+kqHB3M2Ux6xWy5jibecW9QipPBJ1SbTFuy3SppvGf3yy0uSnmuoMLvGSXxHSiIE1
	6b5s=
X-Gm-Gg: ASbGncvUp0NS7CPfaYBKh1UMfqLA87ReEA0Whb7oI3V7s/YIBxx9r+d/MgzGPTqxzXE
	USBaPoYdSMywj+u8mXUIl1r5+h/+/OyOTO2SwWlO9XLbW5lT0sq+Goc25gSR9NtcUJeW6Ug913a
	mCCAbBssLGYgs72zsBkC5jYh5tnE4SR+v/gwo8rYMkMtbG46j3QyBxqjY4qU5Bwb0it1HPbsHiE
	cwkyzZltzD/CYsYbyQ6KRkXVfD7GmqRybDh4cX9e/5Oi/G789b2CAy1jagatx/+68fIwipsszTV
	KWL4evntBOBjgHLbAZtECh2lq11aMdX0Ti64jSqG13/0tqKplx0HxOEGtIpcCSD6flxh3YQhisz
	SVJY9HoFxfEi7Q1q59Q==
X-Google-Smtp-Source: AGHT+IGmP+tWTh9vPHYTUcM2rxl45wpUK2ld7olbznUDwwjfTL4BsMHu5kF2vIw/MsGZjo8uXItkaw==
X-Received: by 2002:a05:6512:4389:b0:54f:c4bc:d098 with SMTP id 2adb3069b0e04-54fc4bcd209mr564313e87.32.1746717579136;
        Thu, 08 May 2025 08:19:39 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1713sm2723800e87.15.2025.05.08.08.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:19:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa selftest pokybleeding.py: change from mtd-utils-selftest to pseudo
Date: Thu,  8 May 2025 18:19:28 +0300
Message-ID: <20250508151928.1560286-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 15:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216152

Test recipe git repo URL is checked for newer commits and
mtd-utils-selftest check is sometimes failing due to server
errors. Use pseudo which uses Yocto Project in git servers
which should be reliable.

Fixes: [YOCTO #15855]

build/build-st-17692/tmp/hosttools"; export HOME="/srv/pokybuild"; git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all -c clone.defaultRemoteName=origin ls-remote git://git.infradead.org/mtd-utils.git  failed with exit code 128, output:
fatal: read error: Connection reset by peer

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/pokybleeding.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/pokybleeding.py b/meta/lib/oeqa/selftest/cases/pokybleeding.py
index dc12f761b9..d0940d680d 100644
--- a/meta/lib/oeqa/selftest/cases/pokybleeding.py
+++ b/meta/lib/oeqa/selftest/cases/pokybleeding.py
@@ -15,18 +15,18 @@ class PokyBleeding(OESelftestTestCase):
         with a single scm in SRC_URI and for recipe with two scm's in SRC_URI.
         """
 
-        self.assertNotEqual( get_bb_var('SRCREV', 'mtd-utils-selftest'), "AUTOINC")
+        self.assertNotEqual( get_bb_var('SRCREV', 'pseudo'), "AUTOINC")
 
         self.assertNotEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
         self.assertNotEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
         
         features = '''
 INHERIT += "poky-bleeding"
-POKY_AUTOREV_RECIPES = "hello-rs mtd-utils-selftest"
+POKY_AUTOREV_RECIPES = "hello-rs pseudo"
 '''
         self.write_config(features)
 
-        self.assertEqual( get_bb_var('SRCREV', 'mtd-utils-selftest'), "AUTOINC")
+        self.assertEqual( get_bb_var('SRCREV', 'pseudo'), "AUTOINC")
 
         self.assertEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
         self.assertEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
-- 
2.43.0


