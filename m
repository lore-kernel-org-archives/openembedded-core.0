Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5547C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 16:37:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.22108.1646066254156253721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2YJvBIf;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d28so16406692wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKwWqcbt3siF9n6kOES/XjsAihhAtmsLUGCvR9MFvBM=;
        b=i2YJvBIfp3Z99Le4MgXLKLFWJsspWsNAZ/seG++ktHVX/jfn5E7XZZs9WzaXVMTsGJ
         To6fs50FPoilTBQPz3GR+GYmvK6tovwOSr4E+lUs7HCAXNBdczro9b7PAiUMXftpZ6KA
         qmDK0poddIiWj6g9k+fLX+/CUcoLTzdE9bJxxDKelw8pjiPHT4Oc7AMAQzkRva+A+ZxG
         GgTeoz23z++HdEIVvSlG/0FcopEnK4YtErxIb5lanleaQxz8N4GLfQZwULW+Lc3zMyvM
         IMM95e0hgxoWMnNpR+dJnHdK706TG2Z/L5k4pMuyMbkxbf1AJF46Yk+8/AYFtkt4p35e
         28Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKwWqcbt3siF9n6kOES/XjsAihhAtmsLUGCvR9MFvBM=;
        b=6MQpTydqSfJPhG2fnNWXtHdoZKyY03H5AgW3F+YydHABDU0VsgHyULxVdEXyvWsi4I
         ibYX6pMKzQNeJZA4lAKiRx6/SUl60G8HuyanBovGaZK47klYf2EywrZQW1sI50WBhqyx
         dMsFFm0Q8gZHOeLsvnrJ1mcE5Jm5eM5wxHxqegCFamvZIitTMkCX1Yss5mwXE+FoCnkY
         Qn1xW/BW+cWdi+kCVb+a5CfAVBHOuPhc7LSrJFeVQvMqVE7re6iWFYlsC72p0hcVUvmS
         BQtQNPZNZtPJejET01GCnNNuRY2d9WEq38lzh/314/r+uqTiVjI6feTlnzDkXT7PCkeP
         3PIQ==
X-Gm-Message-State: AOAM532KOaaU6PXLNwHST5mhminM4La3zLK8fJtE4Yh0BEzmm/P9mrfB
	yOI55d9rb4gNnExaekQF8gN6NVkHU8g=
X-Google-Smtp-Source: 
 ABdhPJz0VBWciNQf2BBG/Be+WtY0SODu47qkvPIvUa3iBSuLXrdHN8rbNSafMiJWOzVHkBjp/WRMEg==
X-Received: by 2002:a5d:6f08:0:b0:1ef:d822:e3 with SMTP id
 ay8-20020a5d6f08000000b001efd82200e3mr3136181wrb.561.1646066252396;
        Mon, 28 Feb 2022 08:37:32 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm12350284wra.65.2022.02.28.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:37:31 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"
Date: Mon, 28 Feb 2022 16:37:10 +0000
Message-Id: <20220228163710.44361-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 16:37:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162510

This reverts commit 47594d59ec4ab82fcf87d3c590caf7c46a6bfdff.

This patch was introduced 5 years ago as a temporary workaround
to fix an upstream bug.

Currently with that patch the following flags are duplicated:
 OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
 OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
 OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"

The duplicated flags is used in the toolchain.cmake:
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )

CC: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/cmake.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fac7bbca7a..d9bcddbdbb 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -31,8 +31,6 @@ OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
 OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
 OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
-CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 
 def oecmake_map_compiler(compiler, d):
     args = d.getVar(compiler).split()
-- 
2.35.1


