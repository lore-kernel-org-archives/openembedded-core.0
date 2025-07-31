Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD16AC87FD3
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:27:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.56904.1753950445717378997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vcg6FoWG;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso6276145e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753950444; x=1754555244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2uXXx5USlu6YzcXo1ffNHGefrpyHRNDMmy/8oDvTY=;
        b=Vcg6FoWGDf8OE6eSoj9u/o+4UqmT7gti23pOPHRYTeYIUGBKGiMCdSvw+OqEs7RwaG
         vYFdoox5whAQ2Xhu6633gEuGIOyL0Purimm/vWJUhLaCD/+0oYeHhgJF+IRcsVWuxV7z
         sHQHbDYgFjkR1j80+8K7D4CtnoRuPDu7SWTqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950444; x=1754555244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2uXXx5USlu6YzcXo1ffNHGefrpyHRNDMmy/8oDvTY=;
        b=AkbvvCSYLNNP66SFSpMJKgCFt6Q9w4kzklgbXRKlN+Ns8dxzU4QkNnqtnqMiHmUi5p
         lOQyl+b2OCh5NHJefelOEdgNdGTIvogJi6KBMMVJ6KjjSgOgp7KwKYBUmR2iXpQ4KBem
         J0UQqoYFzsbtpCuvB/NMmBHQWnzY5gFdfo0SNiAQSE96P3x7TtOGSem6PkbzxLcuQlW2
         pSCpYU1M6/HNp4xrOnPSkzXRxAQ50LfRffqpoglN1EKgNOYxQz0BMUK9N+oMhcqUudtX
         h9aP//nXZdKS7zGV2T7b3cfGJRcRWXsG4/seIFBm7Hi1NQfInNc1VgwteAjt3cXdQX67
         tt/g==
X-Gm-Message-State: AOJu0YwmRlw/AqNVBUVywjM3F0qLfca+Q+ShLis+RcVru8KKsxtD3ELO
	ccd1Y3dxouv61Ju+I2Np0MVaNJ9aTykWvssaIuTWlYzjQ/IP+nHJptb1DRs1TPOED97dcB0jY2A
	BWMDyhUP8TA==
X-Gm-Gg: ASbGncuRnCR4KtTJT9V7mf/P3di4wb+aFx+cEMeOvI+tqZzZGdPMe09zgGy/rIIbXs2
	CVxfP2HFSQRrv4ILx9ODH0ylPvP2cHbREPxWj9eFSrhwZ46v7n4kBbpiGa+MjJt2G4p0o9bu8w4
	/Tf/KwG99P/ZF5EAyG3rTZfX1+YIjW3SMjnnsiTzsEhOW7Wrl1cSI+7Ojqc4rDjSxl3HK0wEKHa
	HcVWKx/9QjvttLEBiQHGSW3z7hR14ClYxEtwXmFSM2e+M55r/d2dOPb2/xUXFMeH/MvPJFsaZsS
	zDqMbO7kxwx+WG6sPzK7jmw9ngZecdT2CnYAMQEe+D4snhqC+ScnljInKeS/k1T9pMjpUoiBiix
	rxzBLRkpDAV2mBMVcRDsNKpVG6bse15qTaUFUHWgRpCJBC4fGZNE3Gh5qrXxNlLDszpvkt+nW+9
	Zr+9I7l1h+61MCkne21NAnGngvrzqa8wFKytw=
X-Google-Smtp-Source: AGHT+IGcVpxp3D2r5YqMVwNgtm88MX/AJhhO/KzKabuJ0Q3MccUqPqKWdDBpAplsEipShr1XQmfohw==
X-Received: by 2002:a05:600c:8889:10b0:454:ccd6:327 with SMTP id 5b1f17b1804b1-45893943ce2mr31859315e9.1.1753950443922;
        Thu, 31 Jul 2025 01:27:23 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47908esm1562672f8f.59.2025.07.31.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:27:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 4/4] runqemu: print snapshot mode state in console
Date: Thu, 31 Jul 2025 10:27:07 +0200
Message-Id: <20250731082707.3481718-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731082707.3481718-1-yoann.congal@smile.fr>
References: <20250731082707.3481718-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221179

From: Yoann Congal <yoann.congal@smile.fr>

With snapshot enabled, no change on rootfs will be saved after qemu
shutdown. Since this is not what a user might expect, print the snapshot
mode state and its consequence in console at runqemu start.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/runqemu | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index da53265219..99ea0a98ea 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1053,6 +1053,11 @@ to your build configuration.
             logoutput.append('NFS_DIR: [%s]' % self.rootfs)
         else:
             logoutput.append('ROOTFS: [%s]' % self.rootfs)
+        if self.snapshot:
+            msg = "Enabled. Changes on rootfs won't be kept after QEMU shutdown."
+        else:
+            msg = "Disabled. Changes on rootfs will be kept after QEMU shutdown."
+        logoutput.append('SNAPSHOT: [%s]' % msg)
         if self.ovmf_bios:
             logoutput.append('OVMF: %s' % self.ovmf_bios)
         if (self.ovmf_secboot_pkkek1):

