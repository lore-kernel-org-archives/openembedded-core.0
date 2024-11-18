Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4817D49239
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 15:31:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.43794.1731943889013993236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 07:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ztt+pe0S;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43169902057so35904725e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731943887; x=1732548687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7a3oGlQyIL8Rxm8QuAQ/3Ghv2csEZkMIe7tEMGPPNI=;
        b=Ztt+pe0SboAR/CpbRaVp4zj8mUxLXNYSpgi+7xf2Nch0ngOZ8ymd9OoSeTsdnGo+g1
         +vTE4t9Uq/1pt/jbkhzyK/Lad0Pnq0RwNiiyUfYSdXDp83rlcIU5rC56qwnhWHiPtiRR
         oFIlBfKDu8Ua7jvte5opv/hMTzGmq45vD6/3+tTPVNIixNdEChmnj2BopkJPNjD0QJj5
         KCcj0eQ3oLFpbIRkrsWEl1msYNVWlnHUikLGhzKAha+Py68k4vxff3Mv3F21SoufeU+e
         as5p59yaJGkhgnUSCbd0KZc67S3p+P0YM3LxmEyvTqDADSD7vNA3X8ZeUOgdba5QU9ox
         DGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731943887; x=1732548687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7a3oGlQyIL8Rxm8QuAQ/3Ghv2csEZkMIe7tEMGPPNI=;
        b=HcrriRqciJU1+i4/BAHroDAuXYTlbrf8ZL9BQs2CsdCZZaad5rDgEp6p6L2yEBqoDS
         ZHjH7nAeHQzudi/u2xM6ZcTj8k/yH7DwyG4HpTkTQmdVx+FhaUI4pput8TmALEgUm0WE
         QqjLxpMEpDYOQneS6ebk1jk9vEr7m9U5MBYdU2CFfvNvyfcJDy6PML5aeFeVTsTZ8wKB
         3Xy9RnC21js5R5eTYWpl2A5vhobftxhEvr98k9ytVwrtTjxGiastjvAzRuy0JJaC9VMp
         pCuZYdiw18ioH2ZhoyLGVQDqXPT6S+l0JQdkD5O6iKg9nViwWUiaMikSshmX6s40EWPy
         WOlw==
X-Gm-Message-State: AOJu0YzzwCVzRFMw3UIMW69nYr3mFzyMw/xcRuQ5bkaZs5AQkfBRyIdp
	/NVq5DxR66I1FUu3mGL8IKFtymHdvsb7TSTgPFmxF1Ja0SK/qxQdQPmFhQ==
X-Google-Smtp-Source: AGHT+IH8O89QCpVRJ3Spzc98hJEfap87VzxIvOOHde+f880dX1EbXEgSpwOQ7fIARBD9+ixIUHeHkw==
X-Received: by 2002:a05:6000:2c6:b0:382:1c58:5787 with SMTP id ffacd0b85a97d-38225a89fe4mr12109497f8f.46.1731943886672;
        Mon, 18 Nov 2024 07:31:26 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823390c818sm8094100f8f.28.2024.11.18.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:31:26 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] libpam: drop cracklib from DEPENDS
Date: Mon, 18 Nov 2024 15:31:18 +0000
Message-ID: <20241118153118.168460-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 15:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207220

cracklib was dropped as a dependency in libpam v1.5.0
See the following commit as reference:
https://github.com/linux-pam/linux-pam/commit/d702ff714c309069111899fd07c09e31c414c166

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
index c9ef40bf23..a48f78187b 100644
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e"
 
-DEPENDS = "bison-native flex-native cracklib libxml2-native virtual/crypt"
+DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--includedir=${includedir}/security \
                 --libdir=${base_libdir} \
-- 
2.43.0


