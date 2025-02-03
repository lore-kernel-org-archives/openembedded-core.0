Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545E1C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.92316.1738600930121551929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eD5YPqKc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso31913855e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600928; x=1739205728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+pCo3U3v0CQZ9NjzM/fltUf8bqkg9AgTEPcyd1ZwJk=;
        b=eD5YPqKcyqpxqzjvtTOjzSJGCQMa9Z6OGYkIadU4IbKsD7UCCHH6G4iHzE8pXmWIk2
         02sojWRwJet2ylwppcMrMqJHy59M+Pj8S/eORrmdfHy2CMKh2b0vinmeYiHc8I08iMAf
         5kLSdaFTzQucjSVkDq3gsFB74Qav8XTD9M9yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600928; x=1739205728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+pCo3U3v0CQZ9NjzM/fltUf8bqkg9AgTEPcyd1ZwJk=;
        b=rscbkmmnDhG/FxRWjU8VMu5PKIor9qNJhhPwKu2gmc2Eqk+vV+iyjfxIpb1ltp7LoK
         slsCEZoy7cK1jkCR27PEcrv8zmj4VwlH58IuWmCy9a79LyfQPF77VyfjIIvkpB7q3CDg
         h99fQ4ZmwgKntiRo6z0UEtgYmhzj0vznST/gynF0YQWXPIo8+eIJxJ74JVkKS8DulzoI
         mFtarp7Q/IlOh4xlw+jfFE9E7G9yfjsUaXV3WVlRboRvPgngvJf+RKPnScOXPYI0E131
         OO4XTIoN/jxUXCe+7ZzABvijDRukk5ZbKw6c1LpYvEpaCMXv8eLDDNQSCiHmcTnROfTK
         +LhQ==
X-Gm-Message-State: AOJu0YxRlOJRzyX8mPfaPXEWtzC7GLdVdZZ/LWu3f/lSp3Aw4Srl1nFh
	XRQBeBVwSFgQbZ3LveVNe7XqOw/b4H3FTOACPSG8Og6EYAp2nnmp6Jj/fD9A96AhGumRw4xOSvD
	N
X-Gm-Gg: ASbGncvi1VN8cs42NpKxd/2pfimSxn5A8cBF6u4g5ULYVy4Vp//q7PKz7TRdsZ+/ScS
	0gsM2kHyEnY0URhg/fKKV9BPJdM25G2it/pp7s7YnfY4+lB8xgbcn5aRgQ/HKxl1R/WZCWWJfX7
	7gZjvKzyf2FDhhfbJlAPetaeOPur8zflocKzk4i8fMmV/Y4NdvOfhYiodzh1xMmdfVFQ41sPe0U
	hd7pexP/GnKJ5P1One+bYrn5Fsf27diIMVrZHftXJPLxi0GKVsWhX1fUE/FheGhkuw6yh7llCq+
	54vsBc8nJdw2tmz3acXtxbVqp1aOiBSphX8kiCBx5bXv
X-Google-Smtp-Source: AGHT+IEJokmuIq9WijcGltCnY+ETVqiooOdxkLgN0Ht7AYWqkgpuYQdJ8k9EXlZ4c4jKMrHr9AoSZQ==
X-Received: by 2002:a05:6000:1864:b0:38a:a037:a517 with SMTP id ffacd0b85a97d-38c51960307mr17557166f8f.19.1738600928205;
        Mon, 03 Feb 2025 08:42:08 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/46] python3-pyopenssl: upgrade 24.3.0 -> 25.0.0
Date: Mon,  3 Feb 2025 16:41:19 +0000
Message-ID: <20250203164130.3403325-35-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210708

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pyopenssl_24.3.0.bb => python3-pyopenssl_25.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_24.3.0.bb => python3-pyopenssl_25.0.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
index b8a980be42b..6485f3e1ed6 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "49f7a019577d834746bc55c5fce6ecbcec0f2b4ec5ce1cf43a9a173b8138bb36"
+SRC_URI[sha256sum] = "cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1cabc4ae64e9dac16"
 
 inherit pypi setuptools3
 

