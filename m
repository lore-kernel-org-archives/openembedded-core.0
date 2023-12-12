Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8040AC41535
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:42 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2950.1702391316722018096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nKbh+2R0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ce934e9d51so3552259b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391316; x=1702996116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScTPqKJN+Op7i4pPSGIaP3uLwQB3Q6xCWuKq43CATro=;
        b=nKbh+2R0h87Wqk/I/FIjYvZDKN2sKCCfyrtZaOzyfW5rqiz7Xp3sh6rxuTRm9t3zER
         EU4Ee3wgpYTeQcXBs5GAwxLUMcSlrrGR74yJpptglkf+YHikGv8684orEeBe+oa5LNID
         E3AFnroIz6h96fRcBFF1LvTDRCMUMPj1NrHUuRMBR6XKMjn5vUuulzRuvwLnPkJD58ua
         YxqniDwTAtlXTeNnya3gYpq2S07d2xtAgaQbkAqBaXhXMGCt99YV8Ef0zoLdbJeQxIrz
         HICsN+GtBGUNQ1BhBatx70HEDWN1nFw7ESG/ndUijdPiYAMz3e2kxdOydW3azCwvoW0e
         o35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391316; x=1702996116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScTPqKJN+Op7i4pPSGIaP3uLwQB3Q6xCWuKq43CATro=;
        b=tqBVLbnenvIflO/XdoFiG8V2nqW/JQ4E5GQ3mfKNT1mNYZo9CqDAZxei/UUl8m/6A8
         2zgckf5FsVoB5J9AnXZ5aeTFHo1aXNJn76ouO3egZx6hhhv7TigIC6RNjePfEO+5bamL
         kmcXSVi+MGcPU7lDyh5/15TjrLW4udncn24afrz4/eMqDm57lNOY0ggwz8R3S7luS37J
         gT5dsm/8V8E78ZjoIX8FQiAGDS+mdS5Y+7oBA9qQhUQszK5che0xE0nLrnJXRWnxJiuF
         Lw7I5JrcHOQb5wOGsj0Ra0teYeMEi0gUQ6PC4E7Ivdt/ZaPKg8CbJf2LLy5wDgqdxk5V
         qTqQ==
X-Gm-Message-State: AOJu0Yywy5HMQ/cB+Xri7GvyYQcXmcbUpqN5a8SfO/4synR5nyfhdaKN
	surVHUOUuRZfygAdHxM1soOQkAecVy+rAhxMYjg=
X-Google-Smtp-Source: AGHT+IHnbHdOuRWEmSMoJX6cqFbSDttJTpPzkMUglFptpuAzK2ukO85m5VMSozmHsCkhq5T+QVXA2Q==
X-Received: by 2002:aa7:8881:0:b0:6cd:faa6:fc36 with SMTP id z1-20020aa78881000000b006cdfaa6fc36mr3966924pfe.30.1702391315856;
        Tue, 12 Dec 2023 06:28:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 28/29] meson: use correct targets for rust binaries
Date: Tue, 12 Dec 2023 04:27:34 -1000
Message-Id: <ea5e46a627dc7385c4d7732299618b6392b7a407.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192232

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Follow the example of rust and cargo classes and pass RUST_HOST_SYS and
RUST_BUILD_SYS to rustc's --target argument instead of bare HOST_SYS and
BUILD_SYS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1471c6c076f544ccd6f0722c82878311199881a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/meson.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index d08a83d555..a85d120d77 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -79,7 +79,7 @@ llvm-config = 'llvm-config'
 cups-config = 'cups-config'
 g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
 g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
-${@rust_tool(d, "HOST_SYS")}
+${@rust_tool(d, "RUST_HOST_SYS")}
 ${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
 
 [built-in options]
@@ -116,7 +116,7 @@ readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
 llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'
 pkgconfig = 'pkg-config-native'
-${@rust_tool(d, "BUILD_SYS")}
+${@rust_tool(d, "RUST_BUILD_SYS")}
 
 [built-in options]
 c_args = ${@meson_array('BUILD_CFLAGS', d)}
-- 
2.34.1


