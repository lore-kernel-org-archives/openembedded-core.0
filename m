Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C845CC4332F
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 14:10:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.11441.1637676635988199300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PY58YDJp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c4so39157556wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3DtpRtSU3ueygX6Htg84X5f1JGBvEb+/OePSxX3jn0=;
        b=PY58YDJpgAbi5R6Hz/dcT3YAi/m5JUmQQFA6jWO2kT1ShzWiz/oVFNo0cSJdTfgA9P
         /duJ3DL0wy3AM9tAutY0y3HcHPdRMWaPH4PpwFtjCRZ0j9ks4uFZw9WrqbjZuWBYlBkI
         SHbnhabYcVfnN41huq/KnCsNBuRAaYambHzOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3DtpRtSU3ueygX6Htg84X5f1JGBvEb+/OePSxX3jn0=;
        b=DlqOvNrq2Nv0bsa0OyYU7zVW4YTRmyH/BfwquZ8gFFnZtcHrhkIsY8XUM54hhJJ80+
         K8mdvJAJl5HVdEEKPNrGKUrq0H39tcPeIl01dmu13LM0y/8O9Sw8xPfRdMw4bOb4tBXT
         twg8gmffO31U6XqY5Wybr0LvTtUdvdKSyBOunErOpkEXvo9pS7YeG0IX+c2FlwZTEkng
         MOr9h2Hyijy9fKgwJbnzY9WrOuoGz1OF3LOKLryVn0OlpiNBco+zKd7tlfEGYNAAt+nc
         FDcMBO49ztGR2VfrP47fYA+0jduHa/rXRX6CG1RjNL09CemR9b437NFGHDiWwwysKVEC
         7ctA==
X-Gm-Message-State: AOAM533MJLCc1gywXN3hRXRIlBeVT9yB6bSLvQY1rriwGjdULPXVoSTK
	3SOALnnhmbD+cmqrwN35//kwcWvMYBFxRw==
X-Google-Smtp-Source: 
 ABdhPJxMjPZxP1Zn4qRJtpkQAtxNBvIVObt5XiVT6YT3InmVvA/Mf5+mMCmqvW9EpkT6jF66E3R9jg==
X-Received: by 2002:adf:f708:: with SMTP id r8mr7549775wrp.198.1637676634018;
        Tue, 23 Nov 2021 06:10:34 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id
 m3sm2264777wrv.95.2021.11.23.06.10.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:10:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Pass -D option to ranlib for determisim
Date: Tue, 23 Nov 2021 14:10:33 +0000
Message-Id: <20211123141033.28119-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 14:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158606

Add the -D option to BUILD_RANLIB so that deterministic archives
are built for native/cross output. This improves the changes of hash
equivalence matches and hence build artefact reuse.

We don't need this in the target case since we compile binutils-cross
with an option making this the default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 71c1e52ad63..fba99e8f0cd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -542,7 +542,7 @@ export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
 export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_AR = "${BUILD_PREFIX}ar"
 export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
-export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
+export BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
 export BUILD_STRIP = "${BUILD_PREFIX}strip"
 BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
 BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
-- 
2.32.0


