Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4888DFF4936
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 15:39:46 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18703.1775144383332182172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 08:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W6JwkWpy;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b982d56dac4so169652866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144382; x=1775749182; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1UkAF/wrDsew2MBVtrBkr23AEUmEwMP9hDgEZ4qb4A=;
        b=W6JwkWpyhEKXWzgmCHZ0nc+6j8Y9/OUuxriNCQhZ2Grd1F26OpsLMJbq8FwNrcEyLt
         wFfdAm2zDtaaoRmQLBf0XHolpwkAf/NgQGv7ZM/B8n/ilH8unzBpWHJho7a4u8ChGvVW
         lxgZFKCb6Lof6/aV9bDR0JI3jk9dARzXw45aJqMWD4m3oq1Qo/+I4hqdCeWQ2XeRXFpq
         rxn8OKkzlq0+D4BHOmYbYEjT4mp9nzyZSMRr+QsOyFHkzVDrduZ+bI6S+jjPwpUdELoH
         KjX/Md4sG/5zm3gwssKH8IZ1bu6l4v9hLUDI8ty+fOlqcsF2hqVx4PYASzj7GUhrgkZi
         4PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144382; x=1775749182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1UkAF/wrDsew2MBVtrBkr23AEUmEwMP9hDgEZ4qb4A=;
        b=gn3gEdCQkBiDImEONPi728vg/w5H9E1M+vX2enWuXnfmhxLqFl2bgx+YG4qFpNDXgy
         dj+BncSHhou7hYirkScF7wPHaXZPMzoHE3YGiha0sKtkU1xDcskHGOdF0DCl4WWnlxMp
         fupqmd4yccq2bpCxzNINjixbTFP2GDefcwcpctYDp3bhW8UUqtuEAZ4IZDNQ1kmDNz/b
         ZFlKpjy8QrJQzzGnVOZig8qJ4Mn9uXXFHz6xf7v+Z5MI6a+TWYxRZUXmOcw+P87rnnxi
         QQFS/hgm0O7gJWONgngU2BcprG9DzThzmoD3CQjkfoVHKsM16x5xH77wF8XxckoR87aT
         Gfiw==
X-Gm-Message-State: AOJu0Yzme/2Xu2rbCewHLb7muVltrCPsTQqVyIHXl/jTXF76rU2yIPiW
	GzerKTzcwHjT1EL6OVSWRX8WtK18U/Nsmte3nPNR+elDDFZRjVM/Ci338TppJQ==
X-Gm-Gg: ATEYQzxvCB+JIIOaoYpw2r8tCCA/BlYcPklJWPsMYZK3/uXVGnDm4qrfKvq/mvKVYUC
	3BQn/hCKywA7mBfoVkqTFXKmiVF1RtIZgLOlLbHGUJnyuNCs3MDV2+N4dr2i4GX5fibdiCD+HqI
	E3KIG0E2/T1Ch8x3zunsSr1+yagt/mPbyPZxDsTALAZ5PjK11ztd95Jlup1LPq5X6QZZbuSdduk
	08blIgKP1aQxEPRooy5xPcfYMeazoMvTeLdv4GrY5B/hAn/UXL87UEP1oTxUIRIVoe4cHMQepaS
	DlRpzYAFTgiLeOjHg94adVLqiTVWJ7ZxQyS0riFX6/3S2Z5VUb9WMhnFONgdU1cKcetXD654tvd
	RkYwE4TTK8l4bKYfU95WciPtp3c5Dvn+V4Ov/MI/4G47UFOi5YH1GPfu4NZCuArXBS6ncXOCpjI
	543BBinLTmeG3HCKotj1N6npQIihsVbA==
X-Received: by 2002:a17:907:7b9d:b0:b9c:5e58:7519 with SMTP id a640c23a62f3a-b9c5e588e15mr41526266b.47.1775144381511;
        Thu, 02 Apr 2026 08:39:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:fb7f:9298:379f:1206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm101831066b.47.2026.04.02.08.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:39:41 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 17:39:37 +0200
Subject: [PATCH v2 1/4] lib/packagedata.py: slight improvement to code
 readability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v2-1-259169372299@gmail.com>
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144377; l=844;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=mv9MFNuQ8Ux/HNUumCsiHHzQXncmQNPOqSgyEEmC7Ps=;
 b=lvtXddqfqLINNj1g+cXsSC+HVX+jprXo6NYdY39MwZwtJBPqx66FBwvXxlnlwGuhczMZIKubM
 7s5JRdWxm2gAG7sUPQC1bQpvqLiMwdqLKWsqZccdPm8VUYcXJPoA7OK
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234540

Make use of an existing variable rather than creating a new one
when collecting files of a package.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/lib/oe/packagedata.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index b6a10a930a..65092261f6 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -340,8 +340,7 @@ fi
         allow_empty = d.getVar('ALLOW_EMPTY:%s' % pkg)
         if not allow_empty:
             allow_empty = d.getVar('ALLOW_EMPTY')
-        root = "%s/%s" % (pkgdest, pkg)
-        os.chdir(root)
+        os.chdir(pkgdestpkg)
         g = glob('*')
         if g or allow_empty == "1":
             # Symlinks needed for reverse lookups (from the final package name)

-- 
2.43.0


