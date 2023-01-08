Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52284C46467
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 02:30:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.36956.1673145051028189007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 18:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qGHExnj3;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d83so1778365pfd.7
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 18:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsij72e+wo0kcdgg3Cktq6mQJSPpxh5rjOcASB9yQOc=;
        b=qGHExnj3gbCtnD1yn2OwwB6t9Jbz0myL7wGzpzzCINTxsIVxC8DCicL3PAAayJD4xB
         LeEjLyD4riOj/H1cLt7sXado8vLJWPQ8MVIv3UxSNZ2uViXsnkM30FAJo+/72qVsfopR
         JYS6ud++v0wZDMBcnPqsKnF56PJfCB6AKEC7xvQSSW7DVrU6EHsQ5axmrqpK4TT1WJ4P
         lHnIv88ROePwwM9NnX3EyWE7jZZ5OS4gylYcOQmUFf6vPWn9NttuUfVx02yCKPM5N79H
         K/vV5ZgtrbfeQCnk3YMONC3LNo8Yb9lYgxGKENUidgwmBQFfIT0qpbVDOsuenxHWwIzi
         +VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsij72e+wo0kcdgg3Cktq6mQJSPpxh5rjOcASB9yQOc=;
        b=7er8qRyHU31qYtt0jMaCN+ngNbOYltaNDXJBWGAkfuoL+cCaGzIvBse1bBTzo50ySK
         8AnnnOYz3N/3f4kfQ/Rk7qGwxg3+Ev52fSKqHLbBPPqmbzpZzOZtj/mVfzEqjePUuIXI
         CrJbeVntfwEaDevooD/joV9MsnVcnv/I87BLwsIMWG7pT1IMGs7yK66+0mdmlMsM1sha
         pPt9skWfJix0Z8QHIUNBhN1UTic+v9jSTdDTjZ4Vvi0r9od98GGqoxiFfElbepQ86/Xc
         mz5o+gYCQKSiwv8kbosIECeJi2Ms09tJwvyIrHTRYP7cUcrF/+cs0/N5u/o7gZ732P6b
         c4pQ==
X-Gm-Message-State: AFqh2kqXdT+YuMa99R+v/7R0L5ysTLXdqn2R31U9eExpBLDdvmtv8Gwn
	x0J5Wj+b8bxnLyvO0JqJica4SxLlnbjWMA==
X-Google-Smtp-Source: AMrXdXu2FHdHHmz8jIj75JR2QqKl73zhJQnuB9wwxa0xs9GvRhOxZoO/Lu7GMcu16EEjUz/XCdcjMw==
X-Received: by 2002:aa7:8f8e:0:b0:581:c0ee:3a5e with SMTP id t14-20020aa78f8e000000b00581c0ee3a5emr33718936pfs.20.1673145050201;
        Sat, 07 Jan 2023 18:30:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id y186-20020a6232c3000000b00571cdbd0771sm3434040pfy.102.2023.01.07.18.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 18:30:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mpg123: Enable largefile support
Date: Sat,  7 Jan 2023 18:30:47 -0800
Message-Id: <20230108023047.1465271-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 02:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175624

Disable lfs aliases since they are not needed when LFS is enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb b/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
index 11ff5dea92..a8a2377bd4 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
@@ -37,6 +37,8 @@ AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d
 
 EXTRA_OECONF = " \
     --enable-shared \
+    --enable-largefile \
+    --disable-lfs-alias \
     --with-audio='${AUDIOMODS}' \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
-- 
2.39.0


