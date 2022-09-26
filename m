Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8CDC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 20:24:59 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.2877.1664223893022610005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 13:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lpDpcI2T;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id u24so10592845edb.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 13:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3/1brEeXfyItN6F8pxiBi480w1dg424YyWMlYlbf+GQ=;
        b=lpDpcI2TvXHRZr6VjiSSXq/r0l0m2o5IHAND7VpTe9A+vVvjLGKWy9oswlrTZvS5XY
         q5AqVAE7tim1PPiMhFNnpOgp06/UMRayPXZmXyPeS+pEd/Oml41I8ED/vV7mJCL5dJ+S
         xA3NLmNV7Xx4SND4PaxEGD2IRG6APCYrRDsdBTJMms5X2Vc+JP1Yndjb691pyx3J/mrB
         laSL8mz3U5CGdbqbVr87Pi55dOYQC6SHo8MgooLpfumUZVvJzFgGhsHA+DvYindpwPqe
         hm/dVQewUKq8/KfUgkO7L7bMi6ENtDuVy3nfa6+KbbidZWdH/Oax7XxeoskNGoCA3+v/
         Axqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3/1brEeXfyItN6F8pxiBi480w1dg424YyWMlYlbf+GQ=;
        b=JEW0BLUS3sWooLRhg53tR79MshiLAGyUC2pns4LzQzdy8+emOVg4P9b6goBdzRl7mT
         nB/xN9O/iB/FLvk09+XCSVJrE6l+sEmhRaEQ6yZpxw6KQXCXTFE2reHlPBvKkxBUM982
         02ylmjqzEw0a7hRi0Y6am4rLt11wHvdt3eLHx3aLuObo4chx7gaq5U5uhgtXfTs/pc7V
         IYvVJcmBQz3Qfj+af61YaXlOXi5uyjSS/D4POVqPUKSrMV4Vw+bDci4ySUc4GU31Jbol
         AefryjJrhU5v1VMr2+uVVq/hycy/3pVKqme5wuuaLLllagr74Pjq9qqkJqCT/10BUn+1
         t0Cg==
X-Gm-Message-State: ACrzQf0auLRV76R2s7kFAo0uwAJh9zF2LrwCx/pMNrCScflicLL4hXHl
	ElNGaGA+jjEr5ZNyn85Y+8cu/c5dV00=
X-Google-Smtp-Source: 
 AMsMyM6MY1FPY3P3bWFd4St436bANRB9D46r1eqy6T3idLskrCHnpspgExR1x8H6Qfb4o1sfE98O7A==
X-Received: by 2002:a05:6402:2793:b0:451:fd7d:fc0b with SMTP id
 b19-20020a056402279300b00451fd7dfc0bmr24574532ede.13.1664223891273;
        Mon, 26 Sep 2022 13:24:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a50ee99000000b00456efa875fesm6077712edr.55.2022.09.26.13.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 13:24:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: robert_henz@jabil.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] create-pull-request: don't switch the git remote protocol to
 git://
Date: Mon, 26 Sep 2022 22:24:47 +0200
Message-Id: <20220926202447.768720-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <27206.1664221809231976757@lists.openembedded.org>
References: <27206.1664221809231976757@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 20:24:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171074

Many git repos prefer https:// nowadays and many removed support
for git://.

This breaks the script when using github.com even when selected remote
is ssh (git@github.com:openembedded/...), it will re-write it to git://
before calling git pull-request causing:

openembedded-core $ scripts/create-pull-request -u github -b jansa/artifacts -o pull-kernel
NOTE: Assuming local branch HEAD, use -l to override.
fatal: unable to connect to github.com:
github.com[0: 140.82.121.3]: errno=Connection timed out

warn: No match for commit ea003bd026aa24bb4c8b7562f44ed6512e921259 found at git://github.com/shr-distribution/oe-core
warn: Are you sure you pushed 'jansa/artifacts' there?
ERROR: git request-pull reported an error

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 8eefcf63a5..2f91a355b0 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -128,7 +128,7 @@ PROTO_RE="[a-z][a-z+]*://"
 GIT_RE="\(^\($PROTO_RE\)\?\)\($USER_RE@\)\?\([^:/]*\)[:/]\(.*\)"
 REMOTE_URL=${REMOTE_URL%.git}
 REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\5#")
-REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\4/\5#")
+REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#https://\4/\5#")
 
 if [ -z "$BRANCH" ]; then
 	BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
-- 
2.37.3


