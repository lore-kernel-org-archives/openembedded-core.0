Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F511C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 15:33:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.65202.1753976006230787687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 08:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f01iKkzJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so7764685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753976004; x=1754580804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldfEWDMpmygerolvgYSpyiaBGKpbXlx7Jcs1SFsC5Ho=;
        b=f01iKkzJOzOw8ZEDBNkJusFbb2qcXWaxz5a/EbJaII0XU3BauiDA3jlCDkiBB/XxtV
         Gt6IJFtViW4RsVFdASHfXvV6T3gTNFleUJJfx7Qw+IAQeeHw1GBeH4uA39wKS+sAqvRB
         hrIJU0qAlLe+6H6edrUxrDXjsV6kZbGes3o/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976004; x=1754580804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldfEWDMpmygerolvgYSpyiaBGKpbXlx7Jcs1SFsC5Ho=;
        b=vzb31meYhoffD4Fk4OyDpoybtxsrYW0zwtUr+0K1WgC+snWi3arUJM8UnGY1KoI578
         AlQXWvirC2rPgjkV7WnTG/BMap/rF6pexNUNWd7jk9yvGuZBogyTl3TG+bAHhFs8JD3m
         QvHAuTKICRd84m7kwG/NRUnBV6BYJ1o73wmHpE3ZhXl3cQjuArUH7U89p5vK7nQBZH/0
         qvc2f6vQTkcFxf6o5BRcNJubH2ZJELc4lc8i1D2tk9Ycj4xHygSipyiBTRPRJ9+X2P9E
         cvyANtRtiv8EL1didKmknaew/PeETLuO7FEIbBLtSM2z9FP3N3KFqcAv+GhO7VT0NMmg
         T4mw==
X-Gm-Message-State: AOJu0YzGaOjkMYZCTtVcAqKathyMFYhJ3p1rLHU2Tc8zm4WNzU9hxppO
	pVE/CyHMFgJ2KWy04wtpMsqwanaHWzgwFMZeilpofVVc5h/N5loQpAoQT0AboBI9RM+sZ00zFx8
	NDPr8f/Gj0w==
X-Gm-Gg: ASbGncufnp3bimlHvw9B8iFO0YRYVt41b2W31Cboyqcpe9OtqKrGAByjJlFkZKKeOda
	EkAutULepA1uRGzwEgsksGN3rzCvVxCwUWp9+KUApSmcMCGPTgDyWqEREMI001csoVTOls1PfKa
	RktvVIBfhPIooxeRBgUr27Swf/7dzk25CSgkdcjpu2SIBM8D84AUbOBcT/s8hjAOSucvaZ6NjOW
	KRZxCOzgAkYUjAjFpF58eopEWhs7ULrOqdPrZ67dTQTumCFaIMQuDtZ6RbsbcNkIdBwK3i6+qn6
	kC7g4178m2XYIeKD8CFf/IN6+hcc1O21jJ6sC2Ik0D5N0SFiSc16j0fpZezJ7rlgqtkuDybJ5mX
	xqohxj7OFxIz/aj26xlYSwo9jrJnHdW79CbWX052NDBXOnkIySnj/K9bu36T76Nxlhwow+pRd+q
	PnmPNxFUqnKNxKCNtaa7Il9sV6+Q9IroxF8xA=
X-Google-Smtp-Source: AGHT+IFbfEvhZVxEAOPFIveW66g2zlrw9Vy/n7j5EXHZpgXMGZrqckcb3x/C728FmluPhZ/I2a3XTQ==
X-Received: by 2002:a05:600c:1907:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-458a22153bemr29328315e9.6.1753976004333;
        Thu, 31 Jul 2025 08:33:24 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c475067sm2703727f8f.58.2025.07.31.08.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:33:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v5 4/4] runqemu: print snapshot mode state in console
Date: Thu, 31 Jul 2025 17:33:13 +0200
Message-Id: <20250731153313.3693397-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731153313.3693397-1-yoann.congal@smile.fr>
References: <20250731153313.3693397-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 15:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221201

From: Yoann Congal <yoann.congal@smile.fr>

With snapshot enabled, no change on rootfs will be saved after qemu
shutdown. Since this is not what a user might expect, print the snapshot
mode state and its consequence in console at runqemu start.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v4: reformat message handling
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index da53265219..a57fe794dc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1053,6 +1053,9 @@ to your build configuration.
             logoutput.append('NFS_DIR: [%s]' % self.rootfs)
         else:
             logoutput.append('ROOTFS: [%s]' % self.rootfs)
+        logoutput.append('SNAPSHOT: [%s]' %
+                         "Enabled. Changes on rootfs won't be kept after QEMU shutdown." if self.snapshot
+                         else "Disabled. Changes on rootfs will be kept after QEMU shutdown.")
         if self.ovmf_bios:
             logoutput.append('OVMF: %s' % self.ovmf_bios)
         if (self.ovmf_secboot_pkkek1):

