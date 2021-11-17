Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BE5C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8739.1637163338401764524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVn8Zrmp;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id i12so2609104wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJ7cZ7k3FR1KW4ck99BVkMXkvgW0p4KYoM/jboO6ksY=;
        b=gVn8Zrmpv+a4NAS6U6YEesIrbZ95/R8GeWphjm8LEWdPuNDmnG+HwmCBB9wor26jfl
         fBDC4l9m7kyzdxZkh7A4JnyvGTmICMTp8JjG8aEpDos4Z6dbvI475QYj5cvDWp+Pj9yq
         dbeUbxaSOrXzGJWMzfzleIR1MeHURmZeKeIQWB3mL2WKZNg8V7gx7/36zA7oAN8jRPQG
         IAZf5/wD6pNtf78R+wurOvsBc1D6i5sv96G8EFD9TIqebNo/UKxh0mSA9gnVRq+EGang
         MFT6rm9a8SM8Wxv+9MNur5jdLX9ORjy6w3APLTHz+0QStEhg9Q/Z396KhsJ2Ys2J3OXO
         a8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJ7cZ7k3FR1KW4ck99BVkMXkvgW0p4KYoM/jboO6ksY=;
        b=NsKU0lm45/zy6EEAjOK4nNTNeK98+UEBQK3weVOGPh2aU6V1NISdNMMFgkkzOsZkpI
         kHhr56eTbFC/ZTonGqmKuiI6jvjpdHa2z/nwj6LbnA7kSVjrT2eMa4nrU+46/r92hdvk
         zgxrRUZ1Yum6q21ElDBTkqs4F2b1YxNE/IcnbGLp8DGL4In9X3at3kpJlcIhlRGGPRRe
         C/KZQrqazflTHnS0OS8jRBMnqFbP9dZT0aPw5qsdxFM3c3SzkGa2XnbtQcAFOvWlGEhE
         AGUcNVv51NA1Dg95ohSGrm4pP8XNB4D+h7wsB+FEjERGTtl2qPfV+s7lfMAprT4Dfrgg
         8LbA==
X-Gm-Message-State: AOAM531psU/SYEVPcwnkusE1ujtAmZXaIYvHyczaITRt0IbQ04jLRfim
	//6apT7Eb/wY5tCduxgHQJhXDHKxFVg=
X-Google-Smtp-Source: 
 ABdhPJy2IgNErlu5/RTfQlWRsGEiT2iFgVagPcC+77Kl/D4lcdoOM0pPGwx+Zxhdq+fbBpaC06hf9g==
X-Received: by 2002:a05:600c:4e51:: with SMTP id
 e17mr626579wmq.127.1637163337002;
        Wed, 17 Nov 2021 07:35:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/36] diffoscope: upgrade 190 -> 192
Date: Wed, 17 Nov 2021 16:35:05 +0100
Message-Id: <20211117153525.257146-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158411

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_190.bb => diffoscope_192.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_190.bb => diffoscope_192.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_190.bb b/meta/recipes-support/diffoscope/diffoscope_192.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_190.bb
rename to meta/recipes-support/diffoscope/diffoscope_192.bb
index 8303ee4693..4dda858ef2 100644
--- a/meta/recipes-support/diffoscope/diffoscope_190.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_192.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "29e3c5ce764b494771876aef3f587ed4867374a0f4e28afe39d4f0640ddb7744"
+SRC_URI[sha256sum] = "ae2774334fce7905f1b938a155d487d55b9fef9da9a9d18eda3d74951a8a8084"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


