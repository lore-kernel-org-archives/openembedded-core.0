Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A4CCD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9403.1777739466544371965
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XCPuYsLW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1549955f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739464; x=1778344264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOWr8x5ylEc6xYEk2Gh5xZcVil3fFEjlQEuV+cCWt3A=;
        b=XCPuYsLWHoTAjIcOO8iQ1WnOJhEwF3HALJ57aKBZFDvfX0GJ5NnmQyC46lUbkFT915
         7ulN3kdVzDFrwKmK7RAcAG+yEeMSyAMaTGvfFmNqT9bmDzNqOZxC44nDTo9f+VFY1h5R
         OYTDQ3HyJmJrPnJ+teobweI4FDPy9mshwGMxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739464; x=1778344264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOWr8x5ylEc6xYEk2Gh5xZcVil3fFEjlQEuV+cCWt3A=;
        b=d9mw+AltVj0QxmXSvUqMqLm24oYK4U21UiPeWAVjXxtAaondXuX7FIwRghe6wsUbf8
         tpm4HlXGsuxRajCqaxSMUShE2pPVvVXclWtcAts/qE/maqkuPG0Xp6M3WGpEwUrQEVFZ
         WEF1UiQU1v46Ac5pMPsPazujm0/kP+K2BUBD4d4kUiUTyAXi7hCPTaBRgnNWpP7IZKE/
         j5vph37wUsc3eHPGjbujchz7u12kgqDiP4OyVJZ+l/TjT7aY5gUUwBxsu3HM7xno2GN7
         kWPazpMUaikoBmhpAclgB1YfYvBZ9Xtu5Xry+Jl7v5jA0M+d49OdFs1XqADYRAMhBJrY
         r/PA==
X-Gm-Message-State: AOJu0Yzkh0RSs4O9BHIEq8UMwHIJ3fA13Ic5s6q5jve+FK1RRWJKp4CV
	r8U/7OS0idmjHMAFWCDhtqHZQuOgOXW546JPjbXh98zX9Kjdt45lD8B1JN2ILUge2KZumHKn3kF
	fJ0WmqgSnEaF9g7tasp8q0NeATZFv70uULGvx5kEEyRYn5fpoMcrjK+YkdwG6COzVraTV/RkJTm
	QRRYXUxkEuh1ML7As=
X-Gm-Gg: AeBDievZt2bD6Fx5PAtr3O/P6tiG2S+icFMamAEPZxNbS4C/2IEjWHdljN6vfIdQa/s
	ZM5FKkrHLkNG4ktJhhGM1epvV4K9m+46nOrKBjfi3iZniTjqWFcDv/v0+F6gYyCPSGdfLBMFKkI
	sl3by8IB9U//TRMt5Q8JzIE8C+GKz7YYv+uhWerzGfvKuye2IL4XqqBk6l7Okvdh6WbkIRwjmTN
	4vM/L4frxV5uD9WWYWzWx0nkNN+bfiOmy/r/5Wa8jgGt46mvdk0KuunldHLJUmKPVMhQ9HIhkUy
	PyoBIPu8FZx9rDxr4hDhRjx7m99LnF51J47+WOcEW8x0x9QYNa4K2rMxI6pXIb9P8HMb/asVdwp
	kcn2l8kIKKsR3n5UgV5MxkcOqKRHnZMtQQ5Y5uFptxjuR83DEPgAZ4RTofF5a0crVNjgozi1X4n
	oEPGfXLy0APx2fsu0SKB1KgOoWzMZe+E0PACFnHbEpX19WHE3dMQ1Ovww33vWQ1TY=
X-Received: by 2002:a05:6000:2f87:b0:43c:f8b4:e58 with SMTP id ffacd0b85a97d-44bb6ab1e87mr5710661f8f.41.1777739464257;
        Sat, 02 May 2026 09:31:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 45/62] python3-pyopenssl: upgrade 26.0.0 -> 26.1.0
Date: Sat,  2 May 2026 17:29:05 +0100
Message-ID: <20260502162929.1377831-45-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236354

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pyopenssl_26.0.0.bb => python3-pyopenssl_26.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.0.0.bb => python3-pyopenssl_26.1.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
index ca2ee93d298..6163093ca91 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "f293934e52936f2e3413b89c6ce36df66a0b34ae1ea3a053b8c5020ff2f513fc"
+SRC_URI[sha256sum] = "737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b"
 
 inherit pypi setuptools3
 

