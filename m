Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D24C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2234.1743577845611767672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZitOz10T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so44466285e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577843; x=1744182643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nx8o4YAcAIZK1y/MzubZ6QNiFajQyVCq32AoqMw/Fe8=;
        b=ZitOz10TbGu/rQtzdOw/IJn/ZVkCkTlYKHgRvH7GseeKV8cnHvArPkApOhChwrEFLV
         ktrqSwm2xulAAJYLN51n+C8PpulD5tKK2JKFm1yfVbfMrfZA2p+ig65ur52qHnQHriFx
         kOz77z9mOuQ7lVhDVd/yKPpAqpVSlA+cJHcIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577843; x=1744182643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nx8o4YAcAIZK1y/MzubZ6QNiFajQyVCq32AoqMw/Fe8=;
        b=Be4FxIguuQwL51uGwkTcuICsy0jq2jhXa+DI7nuCOR5jO3Wx7zovrFQVJIYtk18nKR
         hqZTfC6ahG9xQXPyc9n5K36qc9jTjzJIxd3jGb9qGI8zbnEheEGE7V01yQtxQwmZll0Q
         MuhvfJaPKZoMhAY8H1gRBCMmLnZnP93C3SKVQvGtMMM0Ji4if7oC6SJU9soV8IcR/5sa
         YAEVs5iBGnivBXRHNwBBS7hsZXcQfwSh5gznlOD1Fevq3tD1eO+ND6AwUJcYs6qlh3aE
         axaXb8cN/5x6xHdz7yu3W37WbJlF28A4pYX9qezPs9eixhSYzRdFezQ6CT7nNna2puLx
         Wd6A==
X-Gm-Message-State: AOJu0YxBKbpqh1tdXMFa2rsObypwfr0Gzqk2b8zDkmT1NW9N+1I2CLjy
	zbC1zgr9HJwszHV7eeexgPSXA2zY1ha67XAKts6ZjViGtN8zXKEOUxnE485dA/i2F6dUsande1W
	z
X-Gm-Gg: ASbGncugJJOkjR80Xl8H8j9jsaQ5rSjGyAqi0ViwvYKCiHdHqY7YJuBbtAEDjP7ZZ9G
	hWlnpPoz/Naq7Rli3FKONWF8exH3IVmjQJeFbpRboZjueKKhlWuLECx8El0M0jOTy426WBzTKct
	m2Nzi+vOuOVGqAD/IIVgrEpYAbIF6ScBIC0iiJaSXEcmoZXYhHGnIyVRlsZiNciXnFIOx5cchv9
	E1pYPriLGY8A9Milrbg99nGbapRnIKmWv9/euIvVmpi4IkWOH73AI9qbCKIsB8eJp2HkOsWRCZv
	rGXx+c0YGg8piMlNG9WS/d4DWfTXSyKWMq5NH3yjVJgYsJXLJ9M8b5w0Jply/LL6a4/F7h8jwak
	ajaTVwYs1
X-Google-Smtp-Source: AGHT+IGFMb+ks3x//wy2i+aWsaxnkGDZJWvpKgKp4Ta2Y2GTZifaHib6wtTDXugDCRzpDUg3Y6kGgw==
X-Received: by 2002:a05:6000:18a6:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39c297677b7mr877427f8f.29.1743577843422;
        Wed, 02 Apr 2025 00:10:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/48] ed: upgrade 1.21 -> 1.21.1
Date: Wed,  2 Apr 2025 08:09:39 +0100
Message-ID: <20250402071017.2157620-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214183

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ed/{ed_1.21.bb => ed_1.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.21.bb => ed_1.21.1.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.21.bb b/meta/recipes-extended/ed/ed_1.21.1.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.21.bb
rename to meta/recipes-extended/ed/ed_1.21.1.bb
index 4308fac6757..03a61c6d5fd 100644
--- a/meta/recipes-extended/ed/ed_1.21.bb
+++ b/meta/recipes-extended/ed/ed_1.21.1.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "60e24998727d453a5cf02c54664b97536de46a2b34cd1f4f67c1c1a61bbbad75"
+SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 

