Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF91CC77B7E
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 03:20:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.11236.1682652033601190293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 20:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HN4DVDCW;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-51f597c975fso9226450a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682652033; x=1685244033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YxudoFIz0GiNhjIQU/nbR/PQv3xvx8DAqQ3sxDSgYQ=;
        b=HN4DVDCW8Mh9J/deum+cqhNVQ9FE5cWMmxDQ3UiddkLxu/ssMrvFf6YgRc0Bwx9P9Q
         Sp+xNDZB+hAysKJDoKtSEfZLSZNCYoAZaQco00zoFc0F0NfgozuqBIde+c3EOWZzmr2n
         J2WChDRgx0ADPHEzetDfW0u6Za1hRhXFcNS+NnpL6oS3Ony3EpJm8zAyAVC8ko2qdEf3
         owg4BbWIKOuA5JFElXo9vc2j2x5vKneKZqK4bk+s7q/k0n0R3MSD9cMFrxfISLy7nKm8
         gPyVz7D9QZd/AopKG/IFHYgH38oWolze4uDm1Lq8T8mbnE2VYZ99lHpp/KgmPfgLA8ui
         UaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682652033; x=1685244033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YxudoFIz0GiNhjIQU/nbR/PQv3xvx8DAqQ3sxDSgYQ=;
        b=a64tmJyd54Yvdclr25a6fvWOasS7ecArvM54NmoeDp00KERTno/fxsPTqeVrbi8cXC
         w9byYrCX24GWLRu8TjHXGt7qLh+vr8dtB3df+9LtKK54cOy5L+9wAK9Kuf7/6vN24NrN
         HFOKinh44pmMahroV9AciNQVv8xyrtsEmbR86ugbb9rBaWsuddmOXJk5QPYaiNyv7//G
         EaGGWMhhmUnckk335xd0Vr9evJ0Mq+KqTLKY5ZtuHDIaMshE2PecEhPC/yCjK/xqvvyf
         RZZn+XuMw5MX5qb4H65xPljDAVtgld8e/ySWOHeeRAEbsGqTsOiZZpbPuWW4KLcMvJJo
         o0BA==
X-Gm-Message-State: AC+VfDydkkKj8ALmWGF/vqJJ/QmIxvXaoebVm1PnxFPftUn9U2r+Zdc0
	/M6OeSbIyLUj/HLeFgqKC7E4hhRWHDpfqQ==
X-Google-Smtp-Source: ACHHUZ6SgoEspxV3tjg6L5swyX5J46K31J7ACot+3aU6uHzfCAFxxUCbg0vbDUoyssbmGzqLN4cV4w==
X-Received: by 2002:a17:90b:3809:b0:22b:b832:d32 with SMTP id mq9-20020a17090b380900b0022bb8320d32mr3886401pjb.9.1682652032659;
        Thu, 27 Apr 2023 20:20:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5002])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a0f0900b0024c1f1cdf98sm604735pjy.13.2023.04.27.20.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 20:20:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bitbake.conf: Add -fcanon-prefix-map to DEBUG_PREFIX_MAP
Date: Thu, 27 Apr 2023 20:20:30 -0700
Message-Id: <20230428032030.2047920-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 03:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180504

This should help canonicalize the relative paths and symlinks
during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108464#c8
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d94ffe1df9..453bef37a9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
+ -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
  -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
  -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
  -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-- 
2.40.1


