Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2822FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 19:48:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.1873.1666900090326790478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 12:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=5Z15cn5k;
 spf=pass (domain: baylibre.com, ip: 209.85.218.50, mailfrom: bero@baylibre.com)
Received: by mail-ej1-f50.google.com with SMTP id sc25so7638845ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrGdHWpKBCyNnHPSTIxflq7XU0f9Z1tJvKUOW9eVg6w=;
        b=5Z15cn5k1TE/08vZHTOsp41TfxQllvnrq2eeVGZMLzsPGeh69etAW58+vVc4f33uUv
         vvR+wZOlbbm50VAMZp44qk8M4k134us77TH6D6HUKLwspZjQxFD5Us8jRi9AqU4Tg4tu
         S9dMngkZYomC3OAmGF1xuEGRBpeBTe/+OigB5Y5O9Qw3E0xHVh23Mb2RpV3B33TeKIbB
         lwS9Mf4ru23b+4UC1okz7f15DXUz+Ekd2qGRcleuq0PSMLQnFIm+0U56LW3phpW6tInO
         Umho2G5uNc/Hvkn0xZkQs0v/SkKjRLqvbK5Tkt3NyNRF5ox9lh2Nz6IndS/jrpump2fy
         wIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrGdHWpKBCyNnHPSTIxflq7XU0f9Z1tJvKUOW9eVg6w=;
        b=PrKH0fRXNHtLiQyYY42ZabAnj1UJ6m/QeevVDAdXb4PZoJbqyQ5SJBxGpwfTKFfUBV
         btAlk1bxtfIwebd89O8w/3ZrdbQhi3oCd1oUmZDMSvTrjIysy8d0LAGGC3vtmm0cO3ZV
         +mxrAWIir19Ivk7D3WS1gsBchwVbmnJJpULgsSOXAEa3zEf0mC6U9zHBvVfSsfddvdUn
         avGki7OkEMVeZUBzb/FQuMbyxB0V7IQI7QjkLxTZbPIUi8RJHN+o1FP3cXJOwYtbkAFI
         04efMSvSNdzoarbkeL78dxZgthKXrjPa1k4JC9rd9ZsMrTIdyAc0ACVP/o+9zdfVws7Z
         JzKg==
X-Gm-Message-State: ACrzQf2JfQuZ9gMS0+ec+NUizGhQ1CPmS4Ddr6pfyk92RsAZQdoqE89M
	vsizODti5/xmibyOpXaOaYUcEHOXyiKusA==
X-Google-Smtp-Source: AMsMyM69qeuV/m/npFIMh8pLR+JbDi+R+PBihycKe4AR/J58Jw6ZT8RqmPuzBn4PWPukMpn5VRRcUA==
X-Received: by 2002:a17:906:65c6:b0:73c:8897:65b0 with SMTP id z6-20020a17090665c600b0073c889765b0mr43998967ejn.322.1666900088518;
        Thu, 27 Oct 2022 12:48:08 -0700 (PDT)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id z101-20020a509e6e000000b00457c5637578sm1471745ede.63.2022.10.27.12.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 12:48:08 -0700 (PDT)
From: bero@baylibre.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Subject: [PATCH v2 1/1] cmake-native: Fix host tool contamination (Bug: 14951)
Date: Thu, 27 Oct 2022 21:47:49 +0200
Message-Id: <20221027194748.3851487-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027185937.2023904-1-bero@baylibre.com>
References: <20221027185937.2023904-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 19:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172203

From: Bernhard Rosenkränzer <bero@baylibre.com>

[v2 hopefully fixes the From: mangling by the ML, no functional changes]

Trying to build cmake-native on a host system where curl was built with cmake
(resulting in CURLConfig.cmake and friends, which do not use the same naming
schemes expected by cmake-native's build process, being installed to a system
wide cmake directory like /usr/lib64/cmake/CURL) results in undefined
references to all libcurl symbols.

The problem is that cmake-native sees and uses the system wide
/usr/lib64/cmake/CURL/CURLConfig.cmake, which defines CURL::libcurl and
CURL::curl as opposed to setting ${CURL_LIBRARIES} as expected by
cmake-native.

find_package(CURL) (cmake-native's CMakeLists.txt, line 478) succeeds, but
incorrectly uses the system wide CURLConfig.cmake, resulting
CMAKE_CURL_LIBRARIES to be set to an empty string (cmake-native's
CMakeLists.txt, line 484), causing the cmake-native build to miss -lcurl.

The simplest fix is to let cmake know the right value for
CURL_LIBRARIES. Making it -lcurl should always work with libcurl-native
in recipe-sysroot-native.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.24.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
index 722a486f20..bcc87eb8f2 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
@@ -32,6 +32,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCURL_LIBRARIES=-lcurl \
 "
 
 do_configure () {
-- 
2.38.1


