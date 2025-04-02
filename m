Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90E9C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2135.1743577859819619953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DE1PGYML;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3965c995151so3486619f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577857; x=1744182657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJVB+VvK0Ijeab93Vl+AgEAFHuYkgX0d+pLi1SEMjK0=;
        b=DE1PGYMLfHhSCqKRbWi6eFHL/+wPeXIyBq8Mxn54BqTKlq7gmK+qhU0I4w0qkDgkqH
         5ax+uGeJuhSFz3I7P51aEJR1P83loBFAIUvgxKCpurYTPs93u2iAVlRitZLYapMMIeiY
         d+mRVvf3qnnSPvwgfyzLJS8cGMMRTVwxSXNvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577857; x=1744182657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJVB+VvK0Ijeab93Vl+AgEAFHuYkgX0d+pLi1SEMjK0=;
        b=wCs2MBrb7X93g0RSdD/t0XL0XERIT9A6IB6BGQLTeOKcftCuiAFEqtlHt2IQr+MER2
         18w1d/GyU1tQVPJhjeVKJVLWhHkgU7zCCgSmXJHnnbUBuS/xGAql/V0O0HxMtUAZJHf+
         51ssijKGqLYkfIdgzlMfUM02h6u/+FVpQYQY8Z14IFJTZtorKTe/ZZ0SNXZsYHpTMqxC
         9PBDDmVy8rjk0tVf+pdwjjUMpmux3ShHdwUKtGRTXeaVWhKDxSwXXXN4QVHp818+XyU0
         qQvBQ+guxxegjoJXBV8VWFYqc/Kp3GPPmufD9biDQm4r5Ijl3gOcicNvt2umL57hbrEZ
         S++Q==
X-Gm-Message-State: AOJu0Yy+3o6VvVx7q4cHi7rTcE7QTSnHt1hKxU7a/7CyBSVhHwuJUp6J
	/N6jGvU2WYlKr8uWdKGoqqIqFr8DmUnYzA+pnoSa5bG96zxrPRrRqb2ei6JWBPmiEsINzSklvq9
	o
X-Gm-Gg: ASbGnct6va1H7jYEvJrqelKpO6yDOg6x8A6J8sC8fPVrqoILccUaS1XUvz+x81OucpH
	IoyoJuhIKXQghTJWMBp7GEdWTGXZVG0OmW7TFQFI3yIZs5I3zT2Q7dD0T9D3srC8eJ9hlNKHmJs
	WMiobVTIlN61qE/acazaPTLLqV5dnPoLUwu0LKPMMKCyEt+8Zn1rVr2Sqym2/Ccvwh664OogQ9P
	ilKwVQpGgPDbrbNNLtGsULuQjoEFSRDLQkLLjHs7gLljUfoo1Jn/eAQPlBndJ7ATg6lphzfPaeG
	Qfy0IXw6Lbt83RXWtr6GL1wO3tIGM/rflvJIJ1V1USVJkC8PZlYQt2EUaZdc4j5Ejxg+LUEpBQ=
	=
X-Google-Smtp-Source: AGHT+IGD4YNi+2bUr0pe1tU+8fNS3ROtmOspI6+BgtXyJQqF/jiTWjy41qvpwVv4quihMgVjZzglDg==
X-Received: by 2002:a05:6000:430b:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39c29752af5mr1148518f8f.13.1743577857519;
        Wed, 02 Apr 2025 00:10:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/48] kmod: upgrade 34.1 -> 34.2
Date: Wed,  2 Apr 2025 08:09:44 +0100
Message-ID: <20250402071017.2157620-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214188

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/kmod/{kmod_34.1.bb => kmod_34.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kmod/{kmod_34.1.bb => kmod_34.2.bb} (97%)

diff --git a/meta/recipes-kernel/kmod/kmod_34.1.bb b/meta/recipes-kernel/kmod/kmod_34.2.bb
similarity index 97%
rename from meta/recipes-kernel/kmod/kmod_34.1.bb
rename to meta/recipes-kernel/kmod/kmod_34.2.bb
index 8154e6ec574..e5923a64cf3 100644
--- a/meta/recipes-kernel/kmod/kmod_34.1.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
@@ -18,7 +18,7 @@ inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives
 SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            file://depmod-search.conf \
            "
-SRC_URI[sha256sum] = "125957c9125fc5db1bd6a2641a1c9a6a0b500882fb8ccf7fb6483fcae5309b17"
+SRC_URI[sha256sum] = "5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54"
 
 EXTRA_OEMESON += "\
     -Ddistconfdir=${nonarch_base_libdir} \

