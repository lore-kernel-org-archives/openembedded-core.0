Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E147C636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3148.1675840921222121451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E/hUKUR/;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so737142wmb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2zfHsD2FkOa8u8e06Wqt4JfPEG1NZSqv48pQUxOa2w=;
        b=E/hUKUR/AiXd6LA9hidEA/+M3sAD1/i+D4i3un/CQi8hIi7vaHyjshH+jXd5HcrQ67
         aWjMy3YtIevCP46BNP9wdIn8unmt3WFBuvdN3KXs56e2CiIjpzn3p6jwLRZreMoy3idm
         rG8Hn3MUkDgNugI3JyH+JGYj7gbgWbzf2Uoe94yqblVjpqX8XuZVs85Z9KqNsrqBF7Nv
         DW/SiWYBjCou1v/RVaDJNeisp9QzrXeKG5hdd64tJr1f7OYs9y4oo9/wWIncoWXBB0jI
         4DCOAKRKO/eN7zs5uWu5Nd3WNTfAOLEWpV5nI4yRdxz7nam9rnsAOxczu8ac8XczWM5L
         vhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2zfHsD2FkOa8u8e06Wqt4JfPEG1NZSqv48pQUxOa2w=;
        b=mVfsgnnCsgekaQN4My/CDqUlYARw9TY33auNt25AfFe6et6ud5qjnwMn/i2l8NUrGp
         vrMfom4poNKo7b/AIfVXf1NEll4mneqlctccA2Ax1DoBm3iZIf9K3/GoFzi2Uica8xrs
         mSEL/MCNXEhqI1kh3WwbsxPKuvonpgzs5z6knG72ZpIFQN4I13Pf45IXOmgthCH9CH34
         Hnn1Zo9fXmLy9QgBWDM+uLklDclUJCcbb9v+KyHluhs7F1B/G0b05MkMh/gqSUZP2Ita
         BqqCa6nJ5GkqQOOf7jwHC8Ma4sNIHgcPEykphG2rxJ8DiHzdUn3HJuwn6LbJjLRxRl6O
         4j6A==
X-Gm-Message-State: AO0yUKUDbbzllyBkSOxG5GPaduO3oL74+eybr8FPv9VCVnWptDvQLv2M
	XdKrZI9RhW47g5+2TB7x9MXQsiqEExg=
X-Google-Smtp-Source: AK7set+27whDLScJ+9y+Ux7fSZB0KOsH3zFF4YkBGYHJrFWsZUuehspWkPV40NQntSqvcNBFkNFnvg==
X-Received: by 2002:a05:600c:44d4:b0:3df:f7f9:7bc6 with SMTP id f20-20020a05600c44d400b003dff7f97bc6mr5419714wmo.20.1675840919723;
        Tue, 07 Feb 2023 23:21:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/52] glslang: upgrade 1.3.236.0 -> 1.3.239.0
Date: Wed,  8 Feb 2023 08:21:12 +0100
Message-Id: <20230208072143.2930292-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176861

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_1.3.236.0.bb => glslang_1.3.239.0.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.236.0.bb => glslang_1.3.239.0.bb} (89%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
similarity index 89%
rename from meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
index 22838dfc8c..6bcde521e2 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.239.0.bb
@@ -8,9 +8,10 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "77551c429f86c0e077f26552b7c1c0f12a9f235e"
+SRCREV = "ca8d07d0bc1c6390b83915700439fa7719de6a2a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
-           file://0001-generate-glslang-pkg-config.patch"
+           file://0001-generate-glslang-pkg-config.patch \
+           "
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.30.2


