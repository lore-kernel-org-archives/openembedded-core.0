Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7EDC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21935.1785359680788677876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hhbkgtSI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1343244f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359679; x=1785964479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/G6DJ7lPnWHF/OsNM1reSMJtjuYvwkJ6hBQJybP2i5U=;
        b=hhbkgtSItB+Rn1u61o+JYP+eMqEkAiOF+hLxQpcuwRAhDaeCuEsO1gCWidkezLZC4S
         1R+FXla9S7FyXr3I7wEE947AgI4ExpsaGDc2Uaq3/UxF43J4D5D8Il36Oes4yRYuqR5M
         3D7jHUk9yTi3lySXxpadvidvQB/9uK+Jiz4V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359679; x=1785964479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/G6DJ7lPnWHF/OsNM1reSMJtjuYvwkJ6hBQJybP2i5U=;
        b=lMHXddyNq3gWEhruFsykWyzpL29Igye+KlIC3yX2S7LzmDBeDDrTb3d9Gdd9cgZ1oL
         2VFdH7YI+wihMBIjI7przVwmtamnE8AI/IOhsY1c4twJb21nTZ4l8SJ16OIB3CC+cC9R
         8LDhWijYz7ZOMbD62rUdU6RRLez+s26SyRLhX7UrhKfOHE8WIJ8UcVQ1Qhwd80MR3hPd
         oQP4UDJtyQlLjmBnDpIkZkG/dbbSntLkSUTp6cS/RsVJ1SZCrVfuoKKG60Qi4+Dg06nS
         jKqGn6paXdwBV/aw6ADNfdvMFyZf9LS73hc0DmyhKrlYktCmPXT7yO1a4Z+sExJRpdkF
         Vn4Q==
X-Gm-Message-State: AOJu0Yz9mGtG9bCoI1M8EL3uHyWiNOxMdPJrAKB03w5TbH8vzkSyv6m4
	T8lUdHTx86jWw9PZiXVMgS/ZJAsW97oEb/9kJ+9e1raIb66GJ2d4iVopYlS4gd/vOJlL2Oyo/g3
	okB8cmNw=
X-Gm-Gg: AR+sD116UoXdvaa9BDMnrUXl6xqlZQmGy85kpvLqSqEj9dv9EeSn4ZqhmR81JEDFn5D
	aIvZK8zGBA9q1zTBl3OG6tp2nje347EusKruBpX98DmrmkhLMHhd0PVl+f0KH7KFJ57+DMT2VJI
	JBSRAtiLAKxZ8ElJ7AUBTw8X+7HzLY79YhQfjyxm/CVFLRw8OuXLhUIP3e2nDfFh39iMz/hVN+c
	mS+qq4E93Iah+H8iMj01Jrn5NJXCXcbjkbg0qV2lE9NWD+sxr6be62/TiROUi9WmD6BLG/Nd0/7
	QIU/MaMBmLujF45z9ze9WVKoZ76J0rR7lUmTmZsV19nWkN0Vk3JuvlwtVzHuFihgdzGK1FmglVL
	Gqjs4SqbBY0PDywBI8ZwRRjKENo8M4sp8TTwEekGFDAIWjkyF9Ip2tsaXE77oZ/i/zgIhYQ8Z8/
	c9+eWze5txh8JbTCvBUl5g3mKcvFi2eTy2b3KIE4IrLLtwp3SBj6+eaZgQiO3ONAUxSsiJVXd9a
	pSDP+sHzB6Q5hLhiQ==
X-Received: by 2002:a05:6000:310e:b0:47f:7e8f:d62d with SMTP id ffacd0b85a97d-47fc80bf52bmr10070f8f.10.1785359678659;
        Wed, 29 Jul 2026 14:14:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] cmake: upgrade 4.4.0 -> 4.4.1
Date: Wed, 29 Jul 2026 22:14:29 +0100
Message-ID: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242285

4.4.1 changes in release notes are:

* The FindPython, FindPython3 modules learned to manage, on Windows systems, the pydebug ABI flag.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/{cmake-native_4.4.0.bb => cmake-native_4.4.1.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.0.bb => cmake_4.4.1.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.0.bb => cmake-native_4.4.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.0.bb => cmake_4.4.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 85b444d9f92..45172da729b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc"
+SRC_URI[sha256sum] = "95d4721f3625fb0d9d6ca480dd59a46c84b4c157f7fadd2e9b179ef9c871174d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.0.bb b/meta/recipes-devtools/cmake/cmake_4.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.1.bb

