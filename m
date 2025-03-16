Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E259AC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.31805.1742141576346819794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SSFZeH1f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so7184015e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141574; x=1742746374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKggF3hJ6mHR/HloVSwgxU3i1RSlTDSRlsOGIW3nULI=;
        b=SSFZeH1f0F8fkM4hqkwVL+TXYcyBIOrL8gOh7X9EOQLcFH3L8/W18EvS6i9nWoxY6f
         JuO+kHtM9RsYIXok2hhoi5rHg8khYO0/VbKjGmx607mVWudM7PKhVhvtP6SAmWGK6mSe
         5DVfXG9Z675zb9q71QbRAeXOl283PlFo7WmQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141574; x=1742746374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKggF3hJ6mHR/HloVSwgxU3i1RSlTDSRlsOGIW3nULI=;
        b=MnVG6LFn0xoQnuqSes1B4bfTUqB9y2uNaBwQ2Sfn8rOPd+UapjRBOf47fXq+CXSPW5
         CJeARDrEH+2dHISWW2HB4yIOR/38Osbe5P3WkWQbBg+hwdvY+nmvMegQT6eIsun1WM6v
         JlSSrQ6QadljhcsNRP6wy17KtgxMo/YEM91r7guW7IQjbFNU1O5pQtell2mwRb2r1LoJ
         yisRWyMKkWZjeI0nfPnEwqRew3EPs+8SzCGHd5dazNSZWRl4Uoago5HR9WCQs2z8f4a5
         OlWq3kcGSo1hbPyUGeoYSXtJYeki+GBE2spw87isMA6R78biCYiidlYnC+kOJrb4RIL/
         4uCQ==
X-Gm-Message-State: AOJu0YwMR6lWdKJ66zSBItTvL8wt5vo1onaWp2H70nUx+JRzF8dN4HV6
	buMCGd9cfruxcgUhEY7CRrmUv7QFSXzJELVs0yLNb8OYaaDQorWwifDuohae+E6boebZJNmfm7S
	m
X-Gm-Gg: ASbGnctETYx0XzQP9Hx1nH0jiPSTmX2hpYPfF3Oeapwst1BERR/fto6ZBxu0sfi0mW0
	bfIbyewizjWN0MrE9GqKgNgrLrba8Wpfy3Nd7eDX8c7G0p4TWnpwmov1V3rASK9ydHOabgQ+BWf
	fBe9sCXnBRPVpJEkdAcNxmhpJJ5mSjUXjhAxP+MFzQPM7wysEiWkA3FJigxu2KlGlN2cQELLxo/
	HztIxdlTPtwJFL/wEYmxN9ULaF0Snd0pmmrbyIGzGkDM6xcec/KuzntzTDzC8UhImJ4+sEAxuRa
	5UF55kjD8brvt3LwSNotRMGjvVPr2vtc4OC/x7nk9wFUkpCGSbeRY4KQGGBcKaqbRYC9V5oaIw=
	=
X-Google-Smtp-Source: AGHT+IEzUATekYomLV5/6BSK/PVkYavfE3rzatZJ6JkYWOXuQUc2F+C3EL9+Zd4/LqXVC5+3yxYbvg==
X-Received: by 2002:a05:600c:1c1a:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43d1ec8a179mr119346055e9.14.1742141574137;
        Sun, 16 Mar 2025 09:12:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/43] python3-yamllint: upgrade 1.35.1 -> 1.36.0
Date: Sun, 16 Mar 2025 16:11:56 +0000
Message-ID: <20250316161209.3629986-30-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213033

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-yamllint_1.35.1.bb => python3-yamllint_1.36.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.35.1.bb => python3-yamllint_1.36.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb b/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
index 116209f683c..f6c1a1dd90f 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.36.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd"
+SRC_URI[sha256sum] = "3835a65994858679ea06fd998dd968c3f71935cd93742990405999d888e21130"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 

