Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11328C64ED9
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.3134.1675840925245421797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFVGrHJH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id o36so12661018wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN2D+S+alOfgiv5HkCvZbRD4Ul7crQmX0P49dRjawWs=;
        b=YFVGrHJH5CQEzfnV2Pduaw0/uP6C+ewTwCQMZ7RtjaksncrE3vJXCRC48NLVGt16N1
         GbBXcekuvzD+u3k9RysnRAFAgofhzBBQ4CYJEMw0Uo+tLQ9ZBaMcEeC+Rjp2cK+gP55v
         98p27amKvq99y4+ZuH5rd/NOrK965sgNzrsodGe0UH3TgaVMaTYmJ74IvafPbn1+NJvF
         IeSZ/YshMq/sGL4JWgZn+X/UqO76OQJtamNNlRJESm24kkGqbBHzqBFUOT5ud0NTE77c
         4fuKxIaOYAHedQOVxze+OgDHs6+J3kf2+UIuZ0Y6j+tx9vE8XMAiLRoe/AaFyCdiB31B
         JXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN2D+S+alOfgiv5HkCvZbRD4Ul7crQmX0P49dRjawWs=;
        b=rHydakcEqvhHy52M/8r4OKPVyb8gXUHCtbMqAj/FnmjEZhnlsPKvovKt36aopBoZ9b
         Ch2N0AwNXyaCa+EEmGHsFK5OLjRblU8fwW6w4oq4a1AKXOU+49/zZsb2ad+W5+Ad5U8i
         5fuX+MOZWsj9QtHzIHw28zSCLdhLN2ud+d9oi7kkwqW+/l8Tw8xlRThzokAb7UuRcuxf
         cGpVDhY8cYa0LDspoxtk0uzGhGaIMCN15g1ecWdn3N6SS3fU8FvoZUMN2D1uVFGdPB4A
         hdXmScaQZiVzclv6LZljVMBxzpnOstjteLnK43oYbTfgHKmAlnZ8iXNIR2/ce/rNUhsQ
         Swnw==
X-Gm-Message-State: AO0yUKXvDwkyD0B4hVuMsZZQG43HX4gTk8jpN/D7bJKImRcQmL6wPSQT
	P0N6qmuSCUcqtLK69vQeVQZEWlJ4UDQ=
X-Google-Smtp-Source: AK7set/Cxq28HoUeNAHDOckXp+A8Bezd/0qjg7WPAQ+34ZNO46Rm0FNIQod0xW4yrDbQGJwds0b9Hg==
X-Received: by 2002:a05:600c:3420:b0:3dc:4548:abe6 with SMTP id y32-20020a05600c342000b003dc4548abe6mr5471537wmp.12.1675840931374;
        Tue, 07 Feb 2023 23:22:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/52] shaderc: upgrade 2022.4 -> 2023.2
Date: Wed,  8 Feb 2023 08:21:32 +0100
Message-Id: <20230208072143.2930292-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176881

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../shaderc/{shaderc_2022.4.bb => shaderc_2023.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2022.4.bb => shaderc_2023.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2022.4.bb b/meta/recipes-graphics/shaderc/shaderc_2023.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2022.4.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.2.bb
index 0fe6887cbc..07fae0bb7e 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2022.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "067e008c80c323b1cd1ab1e547b38f9a5f52269e"
+SRCREV = "55f4bbd993de3a3cad34cb41cd07b82fa1c77dd6"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.30.2


