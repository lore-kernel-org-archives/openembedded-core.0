Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099F5C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 07:49:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2484.1678866548758858094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 00:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PYU3lOmz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so511453wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678866547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGmcaMfjW8tNCuobYnyXl+zAAVKmADN0zPYPvEBVECg=;
        b=PYU3lOmzEaIguvR5NOskopiWyqByUJ+MYoYvXMhrCKCOqAdiUV6by+AoizVoyqQcha
         hP7BF840c5/gSDTQ7mj1Sb4iKLeJAntb7Wx+utg5zmNdTWd1tjYFAWrx/X5MvgXDyMYn
         bGrzI6gWq5NR2OnU6ZjHIaULW4xEzeztX+7rDTX2UCm+VPUB+syDJ5ZWXXKODIO04oGF
         En62dBoKkF5Ww9nsE0MzUaG/yvtj722WOLPL420Lk8+fulCs0suupM2unSmRhQK4KV4A
         jiJyPdgTwXI0vvSrRZRxhLs0xUrwJfmTWhU8btMBtKWnnTijVGv2EkXG9L/vEbS2ZA3F
         /VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGmcaMfjW8tNCuobYnyXl+zAAVKmADN0zPYPvEBVECg=;
        b=w+8/KfBvoLZiAXQrAUFjHMAWM+eCXusS4eCaTGYLr5C4k6q5pp9wib6j0X4iI5mk3E
         SQ+O/aCc4wn9X5CGuNZ2Vvz4qHoPK1ANYQ359tvhgI4qiuv8NOxCqk8Ht2ZlAz7s/dwH
         9uE5l1/ypyQ8EtcRkaPy65bE9VkZ2TpORc5jPZ3YBq6VbYIXczHMyPiR8Pw91XT/zgAG
         LA5DHyRWya1OmUcHeFUhEKIAT09xhyEpv8x7IiIUQOlv4aawt2PMokdLLeBtPUhtQLq9
         4nBimnmvPkPoEK7z1UTSS3JcxnackyofMXgo7bVVyDtQK1ktL5WpVfqv7pYDUJ3dq6ds
         3aYQ==
X-Gm-Message-State: AO0yUKV2sCcor1eWex2lfYtnIWxeY9srHM8OegHH0uryY/tLUFQ/jsNF
	UZYxP+Lu947Gsrzv+8Z/U9G0BMMqB40=
X-Google-Smtp-Source: AK7set8aAcHAvTdvOvt3hLclb6dwhkZ+5H6jV/c+nfkEJLUIoFO8eLr3uXY2s8+Oo01f16pkkdEdDg==
X-Received: by 2002:a05:600c:c10:b0:3eb:248f:a13e with SMTP id fm16-20020a05600c0c1000b003eb248fa13emr17611165wmb.22.1678866546727;
        Wed, 15 Mar 2023 00:49:06 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:de0b:a9f8:3449:816c])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003eb395a8280sm965068wmi.37.2023.03.15.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 00:49:06 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH] cargo.bbclass: use offline mode for building
Date: Wed, 15 Mar 2023 08:48:51 +0100
Message-Id: <20230315074851.26633-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178525

From: Frederic Martinsons <frederic.martinsons@gmail.com>

There should not be any network access during the build step so
specify this explicitely to cargo.
This will allow better error message, e.g:

| Caused by:
|  can't checkout from 'ssh://git@.../fmartinsons/zbus-git-dep-test.git': you are in  the offline mode (--offline)

Instead of

|   Updating git repository `ssh://git@.../fmartinsons/zbus-git-dep-test.git`
| warning: spurious network error (2 tries remaining): failed to resolve address for gitlab.com: Temporary failure in name resolution;class=Net (12)

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 93e185f2c9..7a8cc1e751 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -39,7 +39,7 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --offline --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-- 
2.34.1


