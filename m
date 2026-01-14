Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6902D39000
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:34:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16051.1768412089421309499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QKJCFKek;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d256c2a9so82356f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768412087; x=1769016887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=STLFCcosD3vyyjJsRdrZZXkm9XRGB5YCxTYsGH6BH3I=;
        b=QKJCFKekzu7r1+2Ng1tScndrYXePruD5aDjDzHdWCllkkS6hnYcyp47qTJ8WDr6yT1
         jtPexPPvCo4xTJEjRt1W27nkkSmErl4Odj8wjmDXEo2KBGhWrVsb517NuKPcnchvrhcH
         PiWnUTB7q7q7zvgtbgcgNz/lvh9kvkXD1GjMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412087; x=1769016887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STLFCcosD3vyyjJsRdrZZXkm9XRGB5YCxTYsGH6BH3I=;
        b=UCkM8NaFwOzMkL7KZY/+ZPby05xsw745e4oRobyUgcKuYtkroyvppgYK+DBJCAVOHC
         3bVx0rV6rlJHpekMlsdnAJfZf7kP1EvxbnPZvQS4N1ypds/n44IGR201XIl7SqmLShGR
         fE2Vc+Xl5rmAYtE5s+jAvbcsCwFdifPOUwMuPRsZTgwoVJeGcUPOquC6wi+CpHs2u569
         weVsp1T7NyojYDwTeq5Xm7tKSdhmWCOQoalQEaB/AMXklxfc+56ApAdATtzrdJm9dw4w
         dsOHAKCM3qxslRlSUt/fsX4A/OLpPsj1A+h753EVY5cW+KDHbTXukisjHZ2yFxegS495
         0j5g==
X-Gm-Message-State: AOJu0Yzv81MCdITFomFcOwPA6nR6qiTCk9d1cWpaaT7OldCAaDQ2IKim
	Kiq18dDcMRGbPuv1DplAXABfOMXdLKd+FUaKP9HgKsNEqHhyVsw6xS1k5D6065uvFkEnWc+FMh3
	W5Lzz1VQ=
X-Gm-Gg: AY/fxX7eJNncXinFMNUKlKeibEQwwlCWr0qeU06BsrwCapJXXgfBk7WLB/j3vqqJaMP
	GUWwizvM8G4i7KRjeABx8uZAj8FqJPjqqHospHyEAZmQnjdf2usZgsgsJZI3PZP3otPxSmxT53R
	bDKKmnMk5xZuusUCi8Baqy2J3BotdA4ebyQb2ymGJ6mNClWh+l9cIWyaqDsx4tVRyToLKrvYb6x
	9yg/vDC7pjKp2qje+dqR2IGJXGUyprJonRvGJDFido1f/aQTFyiCc78Poo8G0d+fQCZe8XXIjpm
	kLpxoFX1TC3NJN6umIvGVTFF2EYf+4WFALVdBvhidphuczzZXD8CNvzA135Oo9kOx0BiluJ+PTd
	QPLwDw8bKa0Mo8uJfRLRZpxc5SrqLmOJtIdH2Hv7zbxpDG9uZFjP2HT3AGgTXyvPyy/tvuEeyWj
	g8RQNt+bTfZ1IaVsVwboO1b5JRNngc+LubJSCVJuk=
X-Received: by 2002:a05:6000:1a87:b0:432:7068:18a with SMTP id ffacd0b85a97d-4342c4f749amr4526458f8f.20.1768412087228;
        Wed, 14 Jan 2026 09:34:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:94c7:73b9:87a6:4747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6fc8fbsm420998f8f.39.2026.01.14.09.34.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:34:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
Date: Wed, 14 Jan 2026 17:34:45 +0000
Message-ID: <20260114173445.2857946-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229364

The pseudo update was causing hangs in builds, pull in the fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a1a00d1a95c..19b0d29b718 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
+SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
 PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

