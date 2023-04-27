Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D622C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 15:13:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.23284.1682608376140118523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 08:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BAUl8+si;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f086770a50so58577735e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682608374; x=1685200374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFd/u77cDpQ/254hAqQuFvN4En4E30r9dIjLiihS64Y=;
        b=BAUl8+si7SBVHsa7dtUgeL3ArsB4RC0S5mqIlZTbaWkCeyzyjD0+XrttTusMjr14z/
         eXd89EN+K2xhF27inHxbQNim5rdmi1wdvVMiUzhzAvyNSnU+cHHXweVEVPlcY5d7H4Ds
         Lyv7FBRU0AmGujAwPfpsXtKJpuUV/fsbm3hVywtqFCZ9t/GJpC6wdazXZhahaKlvPndI
         dWIqkDNYI9rNzvScGMtF5SpnPSp+tV9xkFaUMjIDpIKC/41QQ5Ar9bni18fgzsdqmjo/
         pJNCYMOd5+QTQrtRG9UKpx6rl5LG1CWpIVkaQro7IbaIQtHzVraDlyW5Hh6TioCpK6Wp
         vO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682608374; x=1685200374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFd/u77cDpQ/254hAqQuFvN4En4E30r9dIjLiihS64Y=;
        b=V2opCXsAxnBZyD7D8gjipstmNPruMcC9QaCcbn+hZIGFiW9CGNxyT/P5Z+8n//oN9C
         TNbQE+YaOTPZAYSeoKdP6ge6bsugXjw5t1lJDcvJeZJXp7F/yG/FppLjElQwjXvkhD3s
         pXJAf4d53XrCqHwvqiU836yK6zNyYfMOtG7mKiilGWmzw2NGe3VaWeOMbZeTNxk5rEi0
         NpDKtud38Q3J7IgORWySaAPFvlbbK2ArcrjnVYeNLsP4VJiUiUudroNWkmzNeVEnQXAK
         6Y8pg0En3637IK6CUOioG+oIHEBvVENYPxONMkzj6MA6ONQaDNaRnnDVQ2c2KlOXZQFO
         a8OA==
X-Gm-Message-State: AC+VfDxIrcIFy+ZH+Il9ms549u2psbTIWrNMecOoq13a/HavY0BQXdY9
	YJl1St+qaC0cIHWKEZBgeHmae4CbidQ=
X-Google-Smtp-Source: ACHHUZ42mr4NeWBss8DyLJEfp5hKu2JdafO0JYGviN53BkHVF6KfqL4+JcLEX5eQueIhnRfbCRGSqw==
X-Received: by 2002:a05:600c:24cd:b0:3f1:92e8:a6fe with SMTP id 13-20020a05600c24cd00b003f192e8a6femr1799225wmu.31.1682608374176;
        Thu, 27 Apr 2023 08:12:54 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c215300b003ee20b4b2dasm21655529wml.46.2023.04.27.08.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 08:12:53 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV4 2/3] python3-bcrypt: enable build of unit tests
Date: Thu, 27 Apr 2023 17:12:49 +0200
Message-Id: <6d52c4f677afb522fcfb289843aa92d7b676fe76.1682608254.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682608254.git.frederic.martinsons@gmail.com>
References: <cover.1682608254.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 15:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180495

From: Frederic Martinsons <frederic.martinsons@gmail.com>

The source code of bcrypt extension doesn't define any tests
but it is to show the ptest-cargo usage

Below is the updated test suite output for the recipe (cut):

PASS: tests/test_bcrypt.py:test_invalid_params[password-$2b$04$cVWp4XaNU8a4v1uMRum2SO-513-10-ValueError]
PASS: tests/test_bcrypt.py:test_invalid_params[password-$2b$04$cVWp4XaNU8a4v1uMRum2SO-20-0-ValueError]
PASS: tests/test_bcrypt.py:test_2a_wraparound_bug
============================================================================
Testsuite summary

running 0 tests

test result: ok$<2>. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s

root@qemux86-64:/usr/lib/python3-bcrypt/ptest#

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 21f2eb6ba4..b4f245530d 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -7,12 +7,14 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
 
 SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
 
-inherit pypi python_setuptools3_rust ptest cargo-update-recipe-crates
+inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
+CARGO_SRC_DIR = "src/_bcrypt"
+
 require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.34.1


