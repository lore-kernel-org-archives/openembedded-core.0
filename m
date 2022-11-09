Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1E7C4321E
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.3683.1668003649812019266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oseyIFW5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id p12so11726069plq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXBnJjMb0UolAdCvc0JNIc1sw6eUVyQZ+A02r+U1XwY=;
        b=oseyIFW5oz+LDUICWO5teWVrOeaH6y4KuBQUwZiGKSSHyFxFjvj42r9WvSooLTsb/N
         CpewXoXPDWt6q+OuZ5j1drU+rnHUOzVy85WR3EG5FJB8v9R3Xzyr8QgteFLzgPL81MlU
         ZQmkHpFo6rT9MTvMWvkEq13V40WKGAWTW+mUFgYx4ix1+5D5qqELitjBFuIKbpSmJHyb
         /tw+55OcfwCkPRrwi5NAaKGboXghWNz3NRv9CgU0W5fxGZ7d+bcbJN30tjeOzT4VtS5g
         udjgMom5WnH7TH1/LePcE8D0m9PAiXexdv8Z0Y4QIKJUuHK2L5HFvziruChzcRwSa4RC
         W2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXBnJjMb0UolAdCvc0JNIc1sw6eUVyQZ+A02r+U1XwY=;
        b=b2yOBnxeEpzFSFwDws90b5tq7Fxm7wl+yro0d3FfWud89WAM8RZFt7Eh55kbBu4eGL
         oUpZ5kayBW8wYZx+FnAedBw7SsjtUVe5v8mKgN2+lHEBtcjpOV/21uP9qCQ141VIvrpO
         cHvOoLF+esy9chSA+wXFeRcJgj/CxuaY8u1jaYZIMznBN4LXVPw6eZ8Ptqg5ZfkVOvRl
         Jr6kgptZI01e9ay2ibxo1H2olTjGxa/pcWl2ZQlQYk70uypoCcZKua6/NokqllIhzY7g
         21kumvjyN45CE1AlzOxMvFYRddOxaLWE9Yd72qg1v/yLo7sm9fkf9fF3M7e6hL2X9TIt
         pQbw==
X-Gm-Message-State: ACrzQf1m3uosGsmxORse3RT/nmGf1OXt55EgiLAxHRD9hNTHtmr3wMvX
	9O5OJllrBHk1JlmZDYMRk5zRCUDkJNuQ8nX8
X-Google-Smtp-Source: AMsMyM5uUVgKwpzh0uTjhMNDs5gMbh2ts9Oe2k4xL4e1Gx54YcHXFs14kKCAQ9/UYvaO3aJTmqJz6Q==
X-Received: by 2002:a17:902:f54f:b0:186:c3af:b558 with SMTP id h15-20020a170902f54f00b00186c3afb558mr59552389plf.143.1668003661080;
        Wed, 09 Nov 2022 06:21:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.21.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:21:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/10] cmake-native: Fix host tool contamination
Date: Wed,  9 Nov 2022 04:20:36 -1000
Message-Id: <62b117c382ffd65f6c5d808699b664f70ba6f2d8.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173025

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

[YOCTO #14951]

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2659c735a464c956b4fca0894a5aed27a0fe7e37)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


