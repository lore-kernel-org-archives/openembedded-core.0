Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F390C4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 17:00:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.101081.1671901199457046961
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 08:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtTo5w2g;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id z10so7028428wrh.10
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkMb2ryTtaFs1sTL4czOn/niRqbBmSE55UGACvqN6VI=;
        b=VtTo5w2gv+aetc78lJdXscXXTfDv+mpTqkJvQsXQYnWlJ4q+JzdjaEDS7n1qCPh7fH
         nzKVY2PARzWGuEDjkUJTx1Wb9odXK/mME71zBW1i2QlSDavnzyvOuNyJhIqAO3Un/gMa
         B617Z0c7DCFjV2rvqhWJAVnvokEc62BhCd++PGoRghMplJKz6mF1qCKjMPm5ZOulHEB0
         avz3lS8y+zJkJh5cUpprDDJKi0PBv9j1KB4JwFuL08ZHchm69Z1xG7gfVps454T6+pXi
         GSFgmjeiFtQGAM0iPw5crChnEEzFsX6U7G7JV4+q06a+k/96ByJFbnBUkIRfkAjPFHRk
         nU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkMb2ryTtaFs1sTL4czOn/niRqbBmSE55UGACvqN6VI=;
        b=UsZm0HyRnpb9R6jLwfwXet/bDBkf5Y5ByGcfHshINaWjTvYzusIUvkza6H3lOgc/0y
         6uuEoJ4HhKS5+z1JkCbRZIgQHm8/evvE1Bp4T++q6SnmwKOQRKDUTn5Wc/HtgSmYzffF
         JX6wTVUc83fvAZnXzr7+y4iHK8LPrA2wnKYQoqyegxO6VlC6/k43cbQvKNjJy43vkKKd
         QzCXtN08hOTXDoCsQAZDHbA8G9fheRZn9TPrtE2w7znQC8z4qv4YR3EFXzHD7VqsKbBh
         Sdh0XytuMs/okTGXvHTXPj8EbibQHVm9pY6qqyCriysebj0GO0upVo38wrB90embLfWG
         Tq4w==
X-Gm-Message-State: AFqh2krmFZakkiEh78K5YcFCEMC3w2rZdEN4p+d/fNtAPsHqF60aZfgL
	8h+WpMl7+WXa7uTGvr4srl8DNES+bYU=
X-Google-Smtp-Source: AMrXdXvasUPYsdrdIW0CmKPHBDf870jWJZgTPzQgRvMK4OT64NAeW4t2z3kgCC7LDKOKAZnVnYKUmQ==
X-Received: by 2002:adf:f38f:0:b0:242:102c:c571 with SMTP id m15-20020adff38f000000b00242102cc571mr8102016wro.19.1671901197575;
        Sat, 24 Dec 2022 08:59:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm6005622wrp.95.2022.12.24.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 08:59:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] llvm: update 15.0.4 -> 15.0.6
Date: Sat, 24 Dec 2022 17:59:37 +0100
Message-Id: <20221224165943.1324800-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 17:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174983

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6f9a68a900..dc1cac734f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "15.0.4"
+LLVMVERSION ?= "15.0.6"
 RUSTVERSION ?= "1.66%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 2d346b70cf..402460ee10 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "15.0.4"
+PV = "15.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "5c68a1cb123161b54b72ce90e7975d95a8eaf2a4"
+SRCREV = "088f33605d8a61ff519c580a71b1dd57d16a03f8"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.30.2


