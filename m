Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D429E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:33:32 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.6623.1733391208551500373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MX+Z/EFI;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so5053091fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 01:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391207; x=1733996007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOirl3mzPxlq9pWG6//wRgrm4G9MAYVUt5CKKLJidbs=;
        b=MX+Z/EFIfks0e6Pw4tEWnYJropkPMbPrN1O5qao9TOmuWsqPGbpGTa4VpLFHKCUr0+
         4pFXrzVFv7Veb8rWMzuSc794D+OtxgyVSlnNj8Lszpq8Bu0Ill5zJg4aZspJriUBTogU
         L2DWVrgpEB28Knj2k9oAPcQK8V42iWB/dBVYjqyobtB1fC5RWxqvsZl7/Z0WkDDSBRT6
         0F/bGZaueu7hoIgNIxnqBbo+imENtAA2RU2iEnCSjNWIX8X97ck7uSRaGaKjEXU7qppK
         73L4xR/FP/lbc/gjETbKq6ae7lCp7owyGSwJCtjhYPM8lT1WrDg1T5hV1cDhTczTfRTT
         7zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391207; x=1733996007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOirl3mzPxlq9pWG6//wRgrm4G9MAYVUt5CKKLJidbs=;
        b=qaSic7RueXAL5/EJk7aNvAwoEJJ/lQfyQbzENKXIdDvH23q66BelJ8FRGLkH4VsM/g
         Ch4EYLI4Kp9yCjvhfp8DQZ2Mn2DBc1hQzpVekuQmXqhnOIlF/7f1kemoue3UkAnrskWc
         2D9jWgLJEvUGXMyBH3WCrXjfLWR2TRG3U4mw0zprrKbR3nIx4rdsR0469zhjiXlqwGzZ
         se1giLkta8md7WRB9KRdFLwCmrdO6p/8VfQoiEIBX8EFRs3GaXchovaf/T8+WPkN9kCa
         S55saaPh6/GBGkpaOTmM5P/F0BduRQF3viYnEtknBSDqRKbcxUvro0fPlC7uGAxfFtI7
         ygvA==
X-Gm-Message-State: AOJu0Yy+WwlCuaQtIOxtYRA1pC4L+cud5YhFxufnm5HnrSanUjf4e3e2
	drPOoD+9COTkSU+ip+QRpqSVBqlkv/KvJC1UlnE9bqO7/Iz4Ucy0l9LBL5AKZAfo2lBx4YDIp+7
	s
X-Gm-Gg: ASbGncsayh8vvsGVmA8HwRhpdspyiYk16QUBNlS5rDFVy7taCaEWOUGm1/+n89BOUOc
	dmLROr8B+FQI+wtRIY7FgenINSjI0RTtjDRlcSWC60JXEVwxo3aMPwIu+3I+IMFpDgwbzdKOVsn
	8E6worbAE1oAPNdPRfzoOxj8iq7YK+4okTi8TJuWVzxTCKtT9W4E8DMb2a6/Byp6x6aNqrDE1Hl
	4GmbXm2jEYaL4Qz7Nqhuvaf+RJ6EK5940t2sCbrvJHKvzMKgkhMLDXY9Ipm9nb9VtO0QUMHweCk
	4MiYgN/KTEvxBZMR4zTuycE=
X-Google-Smtp-Source: AGHT+IEZh4hyhavQ11JWl0ZZDXu7QNtJiQ0WH82g2e2PxJEw3dC7VJJkRWOuCqRSLM+eKQcN/h2mnA==
X-Received: by 2002:a05:651c:b24:b0:300:2073:53b0 with SMTP id 38308e7fff4ca-30020735442mr6058211fa.0.1733391206664;
        Thu, 05 Dec 2024 01:33:26 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e5750dsm1648961fa.101.2024.12.05.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:33:24 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] swig: update from 4.2.1 to 4.3.0
Date: Thu,  5 Dec 2024 11:32:35 +0200
Message-ID: <20241205093237.333818-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205093237.333818-1-mikko.rapeli@linaro.org>
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208367

Changes:

https://swig.org/

    SWIG-4.3.0 summary:

        Add experimental support for C as a target language.
        MzScheme/Racket is deprecated and planned for removal in SWIG-4.4.
        The distributed Windows binary is now a 64-bit executable.
        Add some missing use of move semantics for performance improvements.
        Enhanced handling of namespaces when using the nspace feature.
        STL wrapper enhancements for std::unique_ptr, std::string_view,
        std::filesystem.
        Various enum and enum class wrapping improvements.
        Other C++ handling improvements around templates, friends, C++11
        trailing return types and C++17 fold expressions.
        Many parser improvements for both C and C++, especially expressions.
        Improvements to handling of string and character literals.
        Minor preprocessor fixes.
        Python: Stricter stable ABI conformance, add support for python-3.13.
        C#: Add support for converting Doxygen comments into XML C# comments.
        Various other target language specific enhancements and updates for
        Java, Javascript, Lua, MzScheme, Ocaml, Octave, Perl, Python, R, Ruby.

Refresh determinism.patch for new version.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-devtools/swig/swig/determinism.patch         | 8 ++++----
 .../swig/{swig_4.2.1.bb => swig_4.3.0.bb}                 | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.2.1.bb => swig_4.3.0.bb} (87%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 9c49414ad7..aed71dfb07 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 28648b3873d83e26bd19b64ce2c0a41ced9292d3 Mon Sep 17 00:00:00 2001
+From e9b14eee91681b9ae4481c93b80b1a6154093d94 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
@@ -13,12 +13,12 @@ RP 2021/3/1
  1 file changed, 1 deletion(-)
 
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index de0a512..ac9e825 100644
+index f68b609..0c2aba3 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -638,7 +638,6 @@ static void getoptions(int argc, char *argv[]) {
+@@ -633,7 +633,6 @@ static void getoptions(int argc, char *argv[]) {
  	}
-       } else if (strcmp(argv[i], "-version") == 0) {
+       } else if (strcmp(argv[i], "-version") == 0 || strcmp(argv[1], "--version") == 0) {
  	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
 -	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
  	fprintf(stdout, "\nConfigured options: %cpcre\n",
diff --git a/meta/recipes-devtools/swig/swig_4.2.1.bb b/meta/recipes-devtools/swig/swig_4.3.0.bb
similarity index 87%
rename from meta/recipes-devtools/swig/swig_4.2.1.bb
rename to meta/recipes-devtools/swig/swig_4.3.0.bb
index b564be9b36..dd7d0b4bb0 100644
--- a/meta/recipes-devtools/swig/swig_4.2.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.3.0.bb
@@ -12,10 +12,10 @@ SECTION = "devel"
 
 DEPENDS = "libpcre2 bison-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-            file://determinism.patch \
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+           file://determinism.patch \
            "
-SRC_URI[sha256sum] = "fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8"
+SRC_URI[sha256sum] = "f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


