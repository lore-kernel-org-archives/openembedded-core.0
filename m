Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51339C55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 12:15:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4416.1785586498940627103
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 05:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G1yPeihw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1069273f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785586497; x=1786191297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rpVwX4wWQeTD3NlQkhNpaY3fHMKq6JvZ+qrWhAVRq10=;
        b=G1yPeihwQ1T6PnMFCp4lOdIQfHbkpTvb9IdWGC/KlKy2AAFBYZD07kQyrvs5IMlzaN
         eXvIm2U75+VQax3sAtgb+DrxaCuQ54E5VFUWhicuXPsZBzy2X1OutAXY7O4+VgEUqIHg
         ylzPsV69wtqi6QzzuzOuBMcWKtbyUPqqGlW94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586497; x=1786191297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rpVwX4wWQeTD3NlQkhNpaY3fHMKq6JvZ+qrWhAVRq10=;
        b=bGIV8YxBqLshGyophkyMyOMQSEpPriOLZhKvZRdAIgcoIUUHzrvN0q8pUAQO8nI9a9
         JuGbzv98TJlnFWGRyCMKPBZR/s6et4l9K00JpCPeBuMzTzLH3Ay99Hd4kL3sD1OwCWhO
         eULtlpEOYXqiNDlqzZX8O21xIWAzkzPZdVMI3qjKPyQ8PuoGrTj8R8OQb/t30FCgogSB
         UKjFTXtjNZAnWzJEX+DD6Rl7t7zbehM6f4U3s91Sl8ruj6oku3h2zKdXqLnfJtIyOSVa
         4aJNDMs10xhx/9Tcs+1Snsj2dzajUF2QEE0NhjgisTZUOXzdZ1sQn4p9BrSUP03oPZFD
         adtw==
X-Gm-Message-State: AOJu0YxtV4MnkS/VsOJYaJoRgsgKR2snVa9QpsGmRUU6Uu2EECi8Cv8/
	V8G7t0GoxrzlObWwhZP8Qohza1BMzfj2xFMyIJMu6u5YvNU9th1/GzfjXsiJoXHFPXFZQDmBb8c
	Q93tQ93w=
X-Gm-Gg: AR+sD12c3Q1S86m2VbcKasVi3fdlqVG/6z8qpnIFthNJ0/sYtsU/0vOwawzLc+rTRVb
	wlCdg9hU1gycKuCxW7Wzu37ALEH3hFpx6bGtIZISGRY/YjJyC6OPPB3dvYx2PtsFq5eFD2UkSfQ
	upTiXUISOQrynCLxyH31LK9O7UbSXSDfF4tW9jIE46CJSR3XsQl1pqsx578oItFLt9WwQMLWjSD
	PsTC4X/NFoXARAaI7kvhMp9YosrfCJgx841diaraS2/fmvBXpHzEDQGAJ9jbA3aQhQM8inJNGE4
	Facbb7JdBidTeTEnWaQieSWBIJxE1Kyriv2CLhFk4IQhUqBr3z6UudY5FtD3FJnMn8QZPcI2zJa
	C5Di201NrEgpjqEUwkP0csZzpcVgvxrWejP7Ims4U6m0fRTpPzr5UyQkEvhGze2LYTBVNjywEkI
	YS7LrgCeWXXWgdLnjhMGVMbCrrAFinogTVJfnBQI1npxdMoIy04eHUNS08C/oHD1VymAYfdsLW3
	tda4LZM1nRCYl1i+g==
X-Received: by 2002:a05:6000:2dca:b0:47f:9752:3277 with SMTP id ffacd0b85a97d-47fd72a5be6mr7238600f8f.2.1785586496798;
        Sat, 01 Aug 2026 05:14:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm16518796f8f.14.2026.08.01.05.14.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:14:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] cmake: upgrade 4.4.1 -> 4.4.2
Date: Sat,  1 Aug 2026 13:14:49 +0100
Message-ID: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 12:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242490

https://cmake.org/cmake/help/latest/release/4.4.html#id2:

This version made no changes to documented features or interfaces. Some implementation
updates were made to support ecosystem changes and/or fix regressions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/{cmake-native_4.4.1.bb => cmake-native_4.4.2.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.1.bb => cmake_4.4.2.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.1.bb => cmake-native_4.4.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.1.bb => cmake_4.4.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 45172da729b..a51b25b8647 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "95d4721f3625fb0d9d6ca480dd59a46c84b4c157f7fadd2e9b179ef9c871174d"
+SRC_URI[sha256sum] = "1db9e61e60b6e0874c86386340b910382f3c5e75b9fbfb44d122063129a2789d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.1.bb b/meta/recipes-devtools/cmake/cmake_4.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.1.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.2.bb

