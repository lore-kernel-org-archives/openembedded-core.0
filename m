Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AEBC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:10 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8809.1678888922223885182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3aVNrEL5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id x11so20091350pln.12
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKCJHEE1EEXHUk5J4tqp1SIVL5zX7uOHvscgrWEav8g=;
        b=3aVNrEL53PkxDqB4G5atP6NR2Diq7VHFnPn8BQUES15h7KQARK2/+PXAqLc7Le55mU
         z8KMplvmoFpmNNylLbVVxa86b3K/EK6R8f6GH6S1/epLO1TX3OhuxnNkrF8FN7z9Lfdl
         YSMbSYMfZF63m+Lgg1gsYFa27JQeOZ8KCIOhQHEmwHnep/LVFD2btoqpqXRYu0DDbAsx
         PUw7Gdd/1omuZkojux+4TFLMS+vOn08JbeybF+OlzQ8M33gJczwVU07lbxWm7ySIREMR
         LjHV2FW+b6hbm0KJUofQzOcl9PN1ixtmgLF8CMNV/I/OlwmXlPCSUmLI5Nj+xFwMv+Vv
         AAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKCJHEE1EEXHUk5J4tqp1SIVL5zX7uOHvscgrWEav8g=;
        b=lGn8m6aFx2V5scKQlO9mGJrW1IKSYYuaWRG+gMi4ZzBZ63VvrAX2+l8onSA0H8bqUY
         odQjRQdozHs+bUOhCN+InGI2EcOuJmnFoF9Ce/ENSUzAgX0RJONpgXjYku1TBl29DXyq
         Jl1H4EXYtXiTaqZ6MP4hNqqVrblFwdylzcj7Fim/ihwYb3zIXVcM2jp5wgjNV7bT5+qJ
         JPuDkj8cxW5P3Eb3gEQ2vEc/fLx0yY2ttozUdeMR/LiURVfTY0Q4v4POErqC8cPeI+Ht
         A+xhA9lsqBvBaubFDCb20zSWOKzG4Yrfvz/tHszJeXxVXL5UcNOJjjnDa6VEzi0RZ2Mi
         oefQ==
X-Gm-Message-State: AO0yUKXyInFeU5q3czDMdgFvZJ6TsvpjDJ7yGHPLXCozAKQHvw3D50L7
	v97aC3sB6Hd0fQ2NiqmOKCMcD6XR/KuQfzrz/XY=
X-Google-Smtp-Source: AK7set9v37b6QWsExIVHMpVOBEbXwvT1LCEnL7xm/jMm+C4hehNCm/jsffK8D6aoQWDCNZk8cwiMCg==
X-Received: by 2002:a17:902:db0e:b0:19a:9406:b234 with SMTP id m14-20020a170902db0e00b0019a9406b234mr3493026plx.45.1678888921289;
        Wed, 15 Mar 2023 07:02:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.02.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:02:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/22] lua: Fix install conflict when enable multilib.
Date: Wed, 15 Mar 2023 04:01:12 -1000
Message-Id: <b2892b3b6fa1d396f845539c0256ca0f71378b94.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178572

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/luaconf.h conflicts between attempted installs of lua-dev-5.4.4-r0.aarch64 and lib32-lua-dev-5.4.4-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -219,7 +219,7 @@

 #define LUA_ROOT       "/usr/"
 #define LUA_LDIR       LUA_ROOT "share/lua/" LUA_VDIR "/"
-#define LUA_CDIR       LUA_ROOT "lib64/lua/" LUA_VDIR "/"
+#define LUA_CDIR       LUA_ROOT "lib/lua/" LUA_VDIR "/"

 #if !defined(LUA_PATH_DEFAULT)
 #define LUA_PATH_DEFAULT  \

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b58d86f9902a7eb7a821a3e36ba298c082c0f1f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/lua/lua_5.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 0b2e754b31..a39d888ec2 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -57,3 +57,6 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${includedir}/luaconf.h"
-- 
2.34.1


