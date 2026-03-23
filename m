Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022ECF4611B
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:16 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17891.1774273869536643781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cBwZS3qT;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50b268fba9aso1377551cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273868; x=1774878668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F96D9dJ+i91Npcou1dDLj2tmUemM8Qs6AmneaL04bns=;
        b=cBwZS3qTrw/j6tQUzWPQKF2IoaoCCukKZQPEYNp8ZHBgyFoX2fJz9oXhMhmdCl/dHh
         ybasG5n5X668MSQwiY0EhHSyb7rEDJRYdvthFA6gumjz6FZJiG/0FfHmU/RlM9ArHWVk
         tjeakdDozxoqAM0l2Lmhl3jlIlDiPra+vBO/44tme8X3mEgZFcC95posQv0LIsyZTbC3
         WTO3N1UGQ/TzDSlfXQuM6wwOli0TN9kmxgbObD79qMR3IraGRsqxU5GQQA3j/lmo4tLi
         aLmOQpGCYB9iw/ZsCMZWEz8TUyf6bn9iV3fzk0SvmOtBgDkjKUB/kF7EVbnwibUc4Y6+
         H2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273868; x=1774878668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F96D9dJ+i91Npcou1dDLj2tmUemM8Qs6AmneaL04bns=;
        b=klx4tnEZ8hKtSruK8/XzrmsdWj5hZP+wqnDRmUMOwIFPY2drHjMF7NgTKSx92cEEWC
         RtwCJBnp+b/rFs9g+6ryAEFuw4uUDHsVy2fIRHbrRFMVjFh/gMuNSs1vosIs3RgReNuQ
         jyqgNPzWumu2c/1Nkil0aWY4IEobVesWQJ4sevByHzb7XENpubxSP3M1/EdpRt6f41CT
         qQAmjn3BTuU+mY8DrpX5O+U6oGMbh9WqeeYHLAT2mATqrVBaLZciQepS0z0LrsKBicwU
         h8KRCs0AVEgu28csMpvxDw3L7XQb0BvmdmjLzYPWOke6uVhJ/7sN0Ss1S1ptU5mzgWa1
         9meA==
X-Gm-Message-State: AOJu0YxZHICW0Ufj/10yerfM0aAli8UivEk/KZGfOb5mPtO4mSGtTQnb
	2TWIj/AI4W6l8vGrQlbjWa0+c2CHF972AtwnwZBY2sbiT1URt6DqkMVK
X-Gm-Gg: ATEYQzyavUz2b/KBAixSRfaRHF6v8ZUZ7q2ri4obpqzzoO3T885PDYkrS6NQov5FQYB
	0psS9hOrLhXq+5Is35VK8bKkOki+Bl/UzLu3siHHTSacvpqkGnqeY5KFIMpQddWu0vlw1oAkhsX
	Pa6BSw3zqxjZDsivIJXgEdZ+pTdVKIFT0uxlupKXA9lvJiO4cY3H/O+naz5DvGpxc9rf3horJQX
	lalzvjYnfcBi4zNVzrEBjX/DbbwI7jg07OXtjlBlCJbphL7/voCdUCA6NABkLMRYrPtCLlsdK/D
	X4VMumXCDTDfZRqN/0pomKT1w26VpJZaczU0nDTUvyZCm3uq2zW7gHIMm5V5A8QaxjKfNqrQARf
	NJ9IxLVtA5bRDJWcUKWPzsm4Q5qFBF3qzsN3h/TafL1PacZQOGW5PJLsKsIw1vxcCkPJvo4XKPR
	LcXYIBwOLIwqVIpo2ou2L5dmLo2P9VEMnPia9+pChb50EjHXTCMwM6utSVAyApwO+VpUMDF9p0M
	gvLdZLj/LbjBjwLm01/vnZcZhnMhNGQIPhKqLo28ygCHDfKueTnX3pdo98=
X-Received: by 2002:a05:622a:49:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-50b375b7ddemr199758131cf.70.1774273868345;
        Mon, 23 Mar 2026 06:51:08 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 07/11] linux-yocto-dev: bump to v7.0
Date: Mon, 23 Mar 2026 09:50:53 -0400
Message-ID: <20260323135057.1605923-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233726

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 2ca7777a5e..668cd35473 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.19/standard/base"
+KBRANCH = "v7.0/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.19"
+LINUX_VERSION ?= "7.0"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


