Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFE2C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:24 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.14508.1644184403933710960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nt9DdR6O;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a8so36452694ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L+Kr78ipKWTNbQarp80O48le4mmtKuRGz6ar8F5ergs=;
        b=Nt9DdR6OOdWYrYXo49h7OV7NcbmRx7Yyd8yfWHwDuuc9dCZCR9Yp1bU9Ha882X4QUx
         7x+eCeN/QxfgpuhJ9rG3xZtmxdLoDrfwOgfsvlbXjOJnm08HPw0fpXHNt35um4YPILaM
         YjZWjeMofPx/VgqXfFwgnet4rW3tg7f9jgearFk4fPBKUIJQMGL6Klg/Blk9bU0H3K4P
         C4Ouw7Q+7/eddeKN+5odBZ6ixT1jLNqzya47Cua1rz4/o1F5qSpWQxfQyMxqLBvWEL+g
         JuGKmkm5jjedaPn9iVlnHhaWKpThWAmVCNECtgitWl+UIPpTK6wJXHSxZtgfbagEIbjf
         mK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+Kr78ipKWTNbQarp80O48le4mmtKuRGz6ar8F5ergs=;
        b=COVw7lXLVDZF1kH/7Qs9HgvUUdqYrulCE8PNH33cpoCaJRzLgFyfiAjDRanutI03lC
         r0tlDsN50jXszfnrT9XbZVaXLbJ2swLxpGyCRF4V0PtrGA9ydzszXly1BO07cbjJ8A/U
         5K9qypm1r3Vufi0MTZOvWAt5zIkMZrYWUwUr67oLl3gSPIo9TTn/2T19Rm0JDQeLw4uv
         CgTp0zRIa9/Sc7n0g+LIOXxSjQ0E8yjDizkXmaZ3tUHAcUTep4w0q54GxcvCjrsHA7d8
         970/n9/p9qjizkYnrP0lw8Anc1CB3Bq3WP4Or8o7j4ZIehE1dF2UnghIN17W4lPNnFK5
         oWdg==
X-Gm-Message-State: AOAM533D69rzb8JrzDm2KFNE2sCWQkM5J+aT5HuX9LUKCMF97ciDy2ws
	7Bvs5eccjwTr7GXK31a6sKVzrpX6lQY=
X-Google-Smtp-Source: 
 ABdhPJxHc5Z6CRiWgTY00n2Y0D9zOhuanlAQsP6269fT86l6o4Tib+I/+BcRERGhTqqjVWlZ09vuuA==
X-Received: by 2002:a17:906:4d2:: with SMTP id
 g18mr7751318eja.133.1644184402411;
        Sun, 06 Feb 2022 13:53:22 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/8] llvm: update 12.0.1 -> 13.0.1
Date: Sun,  6 Feb 2022 22:53:12 +0100
Message-Id: <20220206215316.367469-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206215316.367469-1-alex@linutronix.de>
References: <20220206215316.367469-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161416

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 161142cec5..372f8fe59a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "6.2%"
 GOVERSION ?= "1.17%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "12.0.1"
+LLVMVERSION ?= "13.0.1"
 RUSTVERSION ?= "1.58%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index d9efa53499..9400bf0821 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,7 +19,7 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "12.0.1"
+PV = "13.0.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
@@ -27,7 +27,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "fed41342a82f5a3a9201819a82bf7a48313e296b"
+SRCREV = "75e33f71c2dae584b13a7d1186ae0a038ba98838"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.20.1


