Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2759F99C95
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71728.1776537248621756587
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gYcfVfSp;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso1994456e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537247; x=1777142047; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAtRArrCBeAmPSiMVA1gMZfchtoaK1zgrRlOgpEivGk=;
        b=gYcfVfSpLo0TgjPt1ElTrVz54vjdQZFhjyMnta3y/WPbq9vVypE7gTINL8L37dFEKa
         1iWOpFTkGAL2CoJIJ/cJ33Ma90VDWyHkknSa3hqEdlrOGfdFcVXWNxhw/7sR2CO7ZzvX
         ewXJaOfqGuhj/cDoj/IzxssiFT+4GZwyaxFTykrKfUGzKvDyQRn8msGyej4v9WJM1gfn
         DrdYJNNZrCvEi1stLcIsvFQz2yio3Q+JD8YIZ5AmJ/OkLu+CR5PMSmteGReR3r8o1x5f
         XuT7W9tl1M+Q4naV4ugOGoovRInWVEEyeRNAV7nVk/OSPsf4pFBzY5/wboUs/CB4MzZ0
         yD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537247; x=1777142047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oAtRArrCBeAmPSiMVA1gMZfchtoaK1zgrRlOgpEivGk=;
        b=r0SpLDMeimgITA/3o6HCudTU174QnCHG+MOBp+fo34RNbWrykq93tp6Epq5N71wjl0
         HpJfOYxbpR1CZaPHz7QicPhlLEab4kg7kJbfG5ndmsx6THRfYCK5KLCnLyjZxFwGsx5O
         QLCuVoLsCqqiA3pZsHmm8mnzQrT+8npws6gn13TnzUbb2yLDj2xsDyJpYzF9xgp2gH34
         233ANAMOFqBCKtQCT7B6ZZwy8rEAs+OLTNXapV2nOYQkdmDSPO8ujPiCGpfWXXC7Sokk
         romozDLg+2zevV0atGKIi3mtldKUIVVJxLLN3bFWIbn/V4V9hu2zexCKYqjxaXj9ll0u
         2KqQ==
X-Gm-Message-State: AOJu0Yw9q3z9t0sUrtBXRZOzOloLHnQDqA6fFr+cb8KvUXIbg25eCrDm
	hQINunDZXC5VD5XEZv2uCmnLzWy+V0BzHuNlY46fajmWCzdBYB/JUMsB/LB8rg==
X-Gm-Gg: AeBDieudMMVbt7WWBaAode1FGoFY26AkimVf9l7CE75x0E8E4RYrFct3ZJbNcnx/93l
	MnPbf/3vlzgExtxKW9amvQkfqsoz1jG67by5EjgrsrE8v5xXWRuKJKFkSyXeT+k1JF2lWSoCyQa
	Qp/KYXA3JZVsWwA0d9de7n/2B/8/UxHRosf/vuJPWe5BioyXiyR3cmr4+U0L37Bk2aCOXK3t7wh
	KkkHPbJE9bx11ZRhoggQuye98vmxdj4NWAOS0xXurKBzbOD7TlUsRzERnyJwF+rl57nAnbe4DOa
	/+VYv8NZ2QxLfLpRVmjpFFxfKGU1PWEH3U3QMEGR27IKBMtdWwLbRG9kNxSIR22x9+i30kuBrbC
	RYBAsF24aiYrRkyXfUg74ljHyHWPG1jPUXRZGLhDCcUYGX65o9f5/6gnvQ4pEP+MO2ix3r7ImCS
	4IVIfKhhHHRfng15hVf3Td//TOYS75ID/KYtiFHYTd
X-Received: by 2002:a05:6512:2396:b0:5a4:143b:3f3e with SMTP id 2adb3069b0e04-5a416f4c297mr2110457e87.0.1776537246504;
        Sat, 18 Apr 2026 11:34:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:06 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:02 +0200
Subject: [PATCH 2/7] staging: add 'vardepsexclude' to
 'staging_populate_sysroot_dir'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-2-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=968;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=bT33xbBHivJSzMlMdtGkaAa1GpdmVLWWnxeJH8MV/J0=;
 b=BNYQ5i/NhvStYiAVk01JF2ecCYN9GNZPlNAzbOTsfMxiNd8dmYYGsORiTLH5BKVgaOwuK4NmA
 /hZ4BgxwMJBDsGDLI5tXpH5HjefEM50+iWc2bW94hDPHyIOVSPM4HC0
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235516

It will be needed when 'extend_recipe_sysroot' is no longer
ignored when calculating signatures.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/staging.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 1008867a6c..259603dcbf 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -248,6 +248,8 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
     for p in sorted(postinsts):
         bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
+staging_populate_sysroot_dir[vardepsexclude] += "PACKAGE_EXTRA_ARCHS"
+
 #
 # Manifests here are complicated. The main sysroot area has the unpacked sstate
 # which us unrelocated and tracked by the main sstate manifests. Each recipe

-- 
2.43.0


