Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A8DC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 22:10:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.88081.1674771013026818167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 14:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PlwUexnF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l8so2192560wms.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jeUJpABV3EhcPYmwTsM9m+ewLl1ezNFwSeaLMPNI5To=;
        b=PlwUexnFmwpLZYorOfk8T+PL1rIdR9xvQDbrz6j+aHcTJyg07lEBTljFMYYlLlZJbt
         rk+KunyDEOHJ+Rw1QMjIezRS0vaseUFc5+U6b7SUmHTedV3IgtNGDWX69AD1wakyFCHL
         yUQoWPE6tPUvbS3nZ3WvdsAtG8r79uEAP3HEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeUJpABV3EhcPYmwTsM9m+ewLl1ezNFwSeaLMPNI5To=;
        b=WQjLRTsGD2Yr+byRMN/vDncs4pwQQwm8IRefK9rwjygIjQfCIXHVY0VuNlDhHUPa14
         JfxkQcf+trP7VXK1Kk1y/jYlLxXSrhKUtld4XqoWetUobA/ExC8t3N4Rlrx5lXZ+8Pab
         +x/qM7vnNg0fBxs6sk0/JnB3UlZM1XgTssJ3SZfFSbFJ4oYK19Jja0eXgeGP9X8fIWCV
         hXC8JInWxOb5xnpcXuf5YbtJwf5qtZCi4EqmPkE0o2QXmNmYkRr5IL/8JdahD5z0osdz
         suG9kP/ZhB2mRq6hFyrRu6/qcxh7SIEuAZ4ZOGozWQnmK+QbvEvIHiPbT0decPT8NB3A
         w7Vw==
X-Gm-Message-State: AFqh2koosxBv9ZKLxkJz0TotHl5YRqAb+MY6/EPK5VA/qKhsWB7uT9gJ
	4xm83Z67lAgOI1zS7rzvMCjBATzwbqDiVo2T
X-Google-Smtp-Source: AMrXdXtQ6OnFmaVVDJ1jq4fO2V+OliSrWROfv2gEToVc+iqnPKZMZzPA3pSkJsRdy036zKMH+MbQdw==
X-Received: by 2002:a05:600c:982:b0:3da:f5b5:13ec with SMTP id w2-20020a05600c098200b003daf5b513ecmr35222671wmp.34.1674771011087;
        Thu, 26 Jan 2023 14:10:11 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm6963166wml.9.2023.01.26.14.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 14:10:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel/linux-kernel-base: Fix kernel build artefact determinism issues
Date: Thu, 26 Jan 2023 22:10:09 +0000
Message-Id: <20230126221009.2550277-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 22:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176431

With the 6.1 kernel we've seen reproducibility/determinism issues where the kernel
seems to rebuild headers referencing the hostname or local user. kernel-devsrc
building after the kernel seemed to trigger it in some cases.

Moving the definitions to the bbclass used by all the kernel recipe code including
kernel-devsrc seems to be the best way to ensure this doesn't happen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel.bbclass            | 3 ---
 meta/classes-recipe/linux-kernel-base.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index bd3b6471c6b..4fbe84c4e42 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -210,9 +210,6 @@ PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
-export KBUILD_BUILD_VERSION = "1"
-export KBUILD_BUILD_USER ?= "oe-user"
-export KBUILD_BUILD_HOST ?= "oe-host"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index cb2212c9485..65cc48f304d 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -43,5 +43,9 @@ def linux_module_packages(s, d):
     suffix = ""
     return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
+export KBUILD_BUILD_VERSION = "1"
+export KBUILD_BUILD_USER ?= "oe-user"
+export KBUILD_BUILD_HOST ?= "oe-host"
+
 # that's all
 
-- 
2.37.2


