Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF12C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:36:33 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.21017.1681234590460074199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 10:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kMUn6TQG;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bkylerussell@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id h3so22636497qtu.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681234589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UVoxNVixG7wxhAQGS2UPs42SZdNqkQj3CLJHypDMrc=;
        b=kMUn6TQG3Acm39osnGQ6QAjZgc7z3hb0N07ZkNLfU309L3+dE3LVkcvKrFUZTZNVj0
         Dt60gwqMJEy3dbO5qURdZWpq8ufnKZnBylxoZprqfMJ8n7w8ZhTeVYRG3wb2el4ejttb
         cJ+Chuy+tN4d6qPkaVXsj+Ogb1+LypFBs01Krw6c93dyF37nXOIviUEaNnFX1FqmwNCP
         gqMY3pl+U2YbJHzqQH7wAEfBLom3JlQZcBWvA54PefLICgscTBYeug3UaBpch4xNgMXg
         Z2JhClyd67RfibkW5fqs/WQw3i1UTLPVzyJLPZs3VNAgexJXtiEaYAJhFt7tM3wAXEhk
         jHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681234589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UVoxNVixG7wxhAQGS2UPs42SZdNqkQj3CLJHypDMrc=;
        b=SV8Gix9Z3IlOiFpEZOuCw89+XadDosS2TSxibtxEe1pVxA6tfLR6hQn5mVy+SFM/1h
         lONIUHzmLyIqAaeBFfIemEeia2YJwfpq5MBeyuu1oWTCXM0whZAkBiNIOqnkZHPjfboR
         w2YJAoehpbg5uXfW4/iPAuJ+b+W8RPh9kbVJBEblOCX/E9Am5D7bEKVSciYRItodHuUG
         HozLMJdLHLbVjnNZVIZu5OFxIvmf/pokKw7+BElMYjnf0/foJmKWEZVs+hVs43/5EUf2
         4pXZBHhEcusv11u60pYjM56y6LINxcWxu/Uh6K3lNg8AYy2Hi7/7I79tin4PJg0INeW9
         C5EQ==
X-Gm-Message-State: AAQBX9cPDq9Kmz2gURBsMjeCEqOQFgTKs6hTWcufb0tG5uzSGxArwMeC
	y+Xo5KtCxm6BX497KAZK1WhDvRZMzMU=
X-Google-Smtp-Source: AKy350YVc5uxMhw4BJMdDdsLexhzLs+oYJiCKFg+qZeoNJyLPucT7cxOGESpY8mSvzGlv2NFDRBslg==
X-Received: by 2002:a05:622a:5c9:b0:3e4:488c:9325 with SMTP id d9-20020a05622a05c900b003e4488c9325mr24536937qtb.15.1681234589292;
        Tue, 11 Apr 2023 10:36:29 -0700 (PDT)
Received: from hercule.bkyle.space (cpe-74-138-104-174.kya.res.rr.com. [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id bm20-20020a05620a199400b007435a646354sm4102147qkb.0.2023.04.11.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 10:36:28 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] kernel-devsrc: depend on python3-core instead of python3
Date: Tue, 11 Apr 2023 13:36:16 -0400
Message-Id: <20230411173616.780926-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 17:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179937

Avoids pulling in potential GPLv3 packages through python3-misc catch-all.

python3-core is the intended minimal RDEPENDS for packages requiring python3
support.  Other python3 module dependencies should be listed explicitly.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b4ea5f756a..6764598d48 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -377,7 +377,7 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
 FILES:${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
 
-RDEPENDS:${PN} = "bc python3 flex bison ${TCLIBC}-utils"
+RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils"
 # 4.15+ needs these next two RDEPENDS
 RDEPENDS:${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
-- 
2.34.1


