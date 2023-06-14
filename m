Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6D2EB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:43 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.7484.1686734983327258738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E55rw9H4;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51640b9ed95so11048642a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734982; x=1689326982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u34NRFISL6Uahwmqkxng6ai9gShews60z3KMFILI2I=;
        b=E55rw9H49Ct+ED+dGLxA/5vaPhdfyReTMp8ipY7dLyWBhjXRTXT3F9psMdFg2z779y
         lZm2d9J6H8sAp6/4tL46xKTB4bapOEI6f4jlrGiL5MpuMEYLNn90wdlgYADcYKcHv0PN
         98tyHZLhHV+y15gcMTh44ybftPKWK0rZL4YqBH0G/ok6/Ej6SxIg5cAetBkjGYjp1t87
         J+V9GPEBu5YE6qNYvcv+FmVfPcc3Dj0wmUlV/arkYx8C+JPTukyRiG6LuVnITfDnR2FW
         yFfkdrczz/ZJmnOKnHpuXOQIStfdIVOXgp8oFbM4LFSI4oMck1MQ7Mq/Be3hX0l7efg/
         E3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734982; x=1689326982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+u34NRFISL6Uahwmqkxng6ai9gShews60z3KMFILI2I=;
        b=Vj4w6+uzzXA3rnZMyzDmS1LyNjmhIthsImpoBmz+ikNRlrJF7Yp59oLTvj1E6rOjQ+
         96lx4bgNX199aQ1H2S3xUfSMpe0vwBuEfT9jRbrcrsg4dgwaoRkLQEhWwtjW4lBRLSi+
         Xb2Zr+yxG9Eok+JVb0LanC4ZNt4SPvilsyPP6F9Mk8SFf6Y/K4R9/avOeuV9EtjmRqAC
         N5GW9ju2fgp8ANs9w3UNrzgHwiyGbrDekKffdtutV5n7pzlk4P/oNe9EDEAt8PpgU4uY
         SzDXcyXMiPrWQJ64+jODjzRmkR3LDPNKCsFy/10YDZvg87b3IvBjP7TP2OCdO+b16HsY
         LidQ==
X-Gm-Message-State: AC+VfDwJLPLopvUExTSVO4MyRpzfjJsgSphFxhFprbr1Jh/ueg6Bqxbj
	vK25eLqMMdKg6H5EcXXrRzh7HF1aWqI=
X-Google-Smtp-Source: ACHHUZ6V+UHkw31MtxVZbUFtnIpfA6PoLFKoEzJ/sHYchHeFRVsQ0UMcBAK2M2uPJnNGM8imIIMWoA==
X-Received: by 2002:a17:907:6da1:b0:979:65f0:cced with SMTP id sb33-20020a1709076da100b0097965f0ccedmr14470728ejc.17.1686734981780;
        Wed, 14 Jun 2023 02:29:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/55] libxcrypt: upgrade 4.4.33 -> 4.4.34
Date: Wed, 14 Jun 2023 11:28:49 +0200
Message-Id: <20230614092918.4065570-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182771

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{libxcrypt-compat_4.4.33.bb => libxcrypt-compat_4.4.34.bb} | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                     | 4 ++--
 .../libxcrypt/{libxcrypt_4.4.33.bb => libxcrypt_4.4.34.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.33.bb => libxcrypt-compat_4.4.34.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.33.bb => libxcrypt_4.4.34.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b03810763..4d145cf3ccd 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "d7fe1ac04c326dba7e0440868889d1dccb41a175"
-SRCBRANCH ?= "develop"
+SRCREV = "e80cfde51bb4fe4bcf27585810e0b4ea3d1e4d7d"
+SRCBRANCH ?= "master"
 
 SRC_URI += "file://fix_cflags_handling.patch"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.34.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.34.bb
-- 
2.30.2


