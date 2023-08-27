Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A684AC83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 08:12:11 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.23912.1693123928070829252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 01:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=c4Glbn/t;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a19bf6ab66so287512066b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693123926; x=1693728726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjxcUMevXBd3d7FM8HLKp8r8fPXezbyJM/kGkz0ccxE=;
        b=c4Glbn/tN+2gpVffmMPK4kmMyAQF0P8y8l6LclSy7ywOb+KJlh31v/C6IwYraBoXeX
         G8rwv54vq54b2rwmnlp2aRUumtLbLOAVhx7SB95PbV2/nuP3oEgA+ctno4IiDbOUHzYB
         dJ4hV2OP9AgD9M9X0thqPYR9/ozr0orJ3gLwqksLqBscMf97c2nqWihiKoZB7+ITV0DJ
         ukELrlFfC3GceS4pF9ntcViu+67tmTdtfV7IQdfsngBZg5TYo22oSKA4NIYDoUmVBGKs
         pE5b0nsemS43zzjhKn3Z+7f3z6wulqy4IOsV9bCLoLsG6KJ1FkgGqgY3fYlF+M9uMWbK
         i+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693123926; x=1693728726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjxcUMevXBd3d7FM8HLKp8r8fPXezbyJM/kGkz0ccxE=;
        b=ZIWUkpkm8EHoyU2JgYo0TcmEu5upRN+ifJVW/Zan/TX/sAw5LY3UzKll5f0hraxOMk
         r8YVtIrdkH1kYQBWu+jPKsiIgYC/SDoGXqM7Uy5XSkjkGAifaPuoQlKLGtWkAbosgKKQ
         OY44oHaMK8a/EDDYG78/IWfRGPTePlx2t1bk7z5Wd0CgneKkHNsKVLut9RUxovxSXxK8
         nQOGTeqDfWrNvvoi5G2x7YgHkoAJ6D9KjFH/owKLw0hAh5K14iAOiixL0SA8nh0JyPFk
         zzb5dRaa6yYop+xY6rF4abZii6escXy9C9uyz9wpM0H5MzDG53EO6Ym6b2qOUOgOdg58
         H/Og==
X-Gm-Message-State: AOJu0YxqfhGlTJ3Z6prwZQJipv9EV/48flQ3u2YOkX/inXamOlfxGpjz
	5R14r0tflyPaNfbwMkdNOcpBiZz78Lg=
X-Google-Smtp-Source: AGHT+IGvp6WAdH6cqtC0tzehL09A6iRkUG4Q0rCchB7lNBi4vPNp3XpbSSsnx5vAiGlL6njbzOA4eA==
X-Received: by 2002:a17:906:8456:b0:9a1:db2e:9dbb with SMTP id e22-20020a170906845600b009a1db2e9dbbmr9420415ejy.0.1693123926349;
        Sun, 27 Aug 2023 01:12:06 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id lx16-20020a170906af1000b0099bcd1fa5b0sm3159756ejb.192.2023.08.27.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 01:12:06 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Randolph Sapp <rs@ti.com>
Subject: [oe][OE-core][Patch 1/1] Revert "bin_package.bbclass: Inhibit the default dependencies"
Date: Sun, 27 Aug 2023 10:09:53 +0200
Message-Id: <20230827080953.2005190-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230827080953.2005190-1-max.oss.09@gmail.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 08:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186769

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727.

The commit not only removes the dependencies on the cross compiler
but also does not depend on e.g. virtual/${TARGET_PREFIX}compilerlibs
and virtual/libc which in turn makes the file-rdeps qa check fail
if installing binaries linked against e.g. libc or libstdc++.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes-recipe/bin_package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recipe/bin_package.bbclass
index 9dd2489725..3a1befc29c 100644
--- a/meta/classes-recipe/bin_package.bbclass
+++ b/meta/classes-recipe/bin_package.bbclass
@@ -20,9 +20,6 @@
 # they would be in ${WORKDIR}.
 #
 
-# Nothing is being built so there is no need for the cross-compiler.
-INHIBIT_DEFAULT_DEPS = "1"
-
 # Skip the unwanted steps
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-- 
2.35.3


