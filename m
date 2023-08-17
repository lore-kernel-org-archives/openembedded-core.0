Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1C5C52D72
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:02:57 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.2180.1692298967574351793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hvUA89Q8;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76d77d47ec1so10455185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692298966; x=1692903766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNVIgPIjARXwaIwxtfRsWJZOojsCeQl/ltOvsV8/j98=;
        b=hvUA89Q8IapITwAi5dboRtP2vQn3s6tPTTH1C12cbKTz/zmOJdsI0mxCEpa8PXdIYW
         pS6c20X44Q8+pri1Da3+jzzXcGq9jU0XxLamExMR/nD4rfgzaOHuLi3nw53Z9odjL3wC
         Hen53TuoXYLmqxLiAHn70QqoZGdS7dRVyAJmYh9ZuS4URwEdoHy4grcs9DwU/MQfFQkw
         bFsX5RvwE0/Uru57icxwHT+aeBQUVDdilDIW4PqH5ANI7ppVXVOopiiiIue9c/Cfzb36
         22pXqT2odNb9gw6PrcFcXI4fhoxPJUS692LewkR9xI5zzOgn2tKF4jSpgIYPyHBXVkvO
         KTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298966; x=1692903766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNVIgPIjARXwaIwxtfRsWJZOojsCeQl/ltOvsV8/j98=;
        b=XIHbywO1qsmlklRLXD9y37ruCkrlYRebH84KgjpbWv6ipPUawo8egHUi529bGNcFXd
         RbABqs7Cu5d5WwlmuEgsJb7CUWYqMuLfxgJfPnTFVX+nNc5BPVjYuXCW4TLQ6VF4tzie
         +UhAAzLfC/0Ol3bYO5SJkkiGVYyxN7pASKH02ECclQEZul4wU0Jjexm4u3U1QRMRRb4G
         uZNbLbPllM0K4eTZ/faVGoKd5YIp4UwLS0oLaNJiOTuBAeQiJiRBKRDpeo2HhaeQVn9A
         rtjmk8FMMVfz5S/FtbwmTAttV75mvGZhpiCIT5B4S++E7bZzL3D66UDBq6uDJrD4qTa8
         HWHw==
X-Gm-Message-State: AOJu0YyE5h0GIT+MvnThk4Pqtvdz1JSqjbxMDveNafoaVCFox+OsgbqE
	5fJrz5jjq6CSY4uLSSeormrq8VXwrs0xxUIKhvw=
X-Google-Smtp-Source: AGHT+IHPbaAvcsiNCgSVqkSGe8WaohawxJCGLVkQR+OKCuAXQUaDMnyT8D9erS2OA4wbVhrVZgSKIg==
X-Received: by 2002:a05:6214:170a:b0:649:7da6:3c68 with SMTP id db10-20020a056214170a00b006497da63c68mr499716qvb.23.1692298966626;
        Thu, 17 Aug 2023 12:02:46 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf291000000b0063d47a29e6fsm80998qvl.55.2023.08.17.12.02.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:02:45 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/5] python3-setuptools: upgrade 68.0.0 -> 68.1.0
Date: Thu, 17 Aug 2023 15:02:41 -0400
Message-ID: <20230817190241.2302457-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817190241.2302457-1-tgamblin@baylibre.com>
References: <20230817190241.2302457-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186338

Changelog: https://github.com/pypa/setuptools/blob/main/NEWS.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-setuptools_68.0.0.bb => python3-setuptools_68.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.0.0.bb => python3-setuptools_68.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
index 4ac789d18c..e04cd1dcd0 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "baf1fdb41c6da4cd2eae722e135500da913332ab3f2f5c7d33af9b492acb5235"
+SRC_URI[sha256sum] = "d59c97e7b774979a5ccb96388efc9eb65518004537e85d52e81eaee89ab6dd91"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.41.0


