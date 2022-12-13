Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01B2C4167B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.70915.1670929885698639222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=du/nTQju;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id y16so15234308wrm.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khN7qqjWnEiBJTHvsoy76TUukiXQG96KKnwZ6f6IRZw=;
        b=du/nTQjurB74vS2rArtpWVarH4QE5HlmlNLl4+Q29R3InTiGcXkXTuNFYg/U/JxRcQ
         yxR3WQDwSCRAZLC8Gn+4gwTVEMqdqRuiJYJmTGa3D36ueiwyTQBn+eScNoxZChHftJCD
         RKydmSCzuYshhxlGCHGZGCUeNPwoUTbLlEbLCpbGQ1yIBYKGTer3vWv6vFop3VfbIg3J
         6gWDIFRs109UQ9Z2YXllkbnJkW/sn3mqPle/dSUbdKbyiS2/0deXreOmVS263BZLdl8j
         a+SUsIXN7PRu7Gl//OyhndXgzAp8FK46CROXQGG3Wxo2Pphr/r4m7offW9QPLfepgcuD
         RuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khN7qqjWnEiBJTHvsoy76TUukiXQG96KKnwZ6f6IRZw=;
        b=bFr6qLAM7vcu+HpOof0XmmtkFmk9QGR2BbYl09Tg50eqnY82BjMo06toOVbaAeJlTn
         7zC33zbQbRNf9qWB8bYr6zEH8F46gM6DLaa4jZxJ2dDO9EqoMZfdc+x/Q+2AyF+0YLlg
         zSOROP/GKfWXcMmdw62WsDTvppSg0On+foJ7PX2SUMlRIjJ/fk4PINPmRlcbyhvRYKZ9
         3zKakTAFu0a4cN5MjnqevpYIbLjlVsFrO2yXP0bxnnEWT9jb6fra3PMs0jdin9Pk2bIB
         SfzzKRih0dN7ezD1m5zZgp0oI6GuYyRpXpjEUYxzdQfSrxoaVx8LC1SFcR5CNp+s92Yp
         vn9Q==
X-Gm-Message-State: ANoB5plBFjmUDprhqRyka+iqpmnOl1MJXTYoisreuWvr6Ob4zUuo4+av
	MZgdB96/U0T/q3MCVQWhsreAseYbnlo=
X-Google-Smtp-Source: AA0mqf7oK7ZJ7KVONcCQHTTs7hnnwoE1SFHVEZFdQkLS+KtiJRmCgTrA6RrpEcYXYEuy6uU+DRvWrg==
X-Received: by 2002:adf:fa4c:0:b0:242:4990:b751 with SMTP id y12-20020adffa4c000000b002424990b751mr12745238wrr.34.1670929884107;
        Tue, 13 Dec 2022 03:11:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/24] llvm: update 15.0.4 -> 15.0.6
Date: Tue, 13 Dec 2022 12:10:57 +0100
Message-Id: <20221213111118.149697-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174513

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4345701443..d8c4d11ac7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "15.0.4"
+LLVMVERSION ?= "15.0.6"
 RUSTVERSION ?= "1.65%"
 
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


