Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8C8C04FDF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.77648.1690740106202337737
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4OPsF9M+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686bc261111so2698057b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740105; x=1691344905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBhIRYtv0h6pI8XUZFM2u2dVpE97W/E7MKjKcRuqkNg=;
        b=4OPsF9M+yN2DV3Q0LrCkjXiS6JZeAuFL5LqCnT1leWXg5W1EvmJEi8NnugJsZrHj8E
         nPccsPzNNdQnLtlN+4RcnFcgf3TcPdlcvK2RL4I7KejcVS7zLUm2ALjdwbECh+O09qF5
         gGDORhW6lu+CAs0VeRtFMvs2XDDtprsRx5Wjc2NCdA+hXz0OAfPbd5ktHnyVKSVNxEhC
         PLC7EMHV+hFusCX0kkRH14SVc8lqyIVCROMX2A7yVPOEQu0/puF/TE8YJcSEAc47i+VU
         HjVtImyJmpDNdbo4O8aMyDg4fp/FAGV3nu4aQfHW0FIplCyF/aNyQMMdup86H5e5Rwlv
         aTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740105; x=1691344905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBhIRYtv0h6pI8XUZFM2u2dVpE97W/E7MKjKcRuqkNg=;
        b=bikR7whvw//s+ZSsOG0ssukuoNP1gTTtBfGUv8SxIESeDagleihSG4O6ZbA2U4Ep1J
         +5RanatMRYH5oEfnnlYENUUyVtux2+a2qvDRzLm0uzdKBYl3fakCO4iVdg64yWWo16yY
         YSnjqWiFAvRs4GuCs5KGE1EDXftjqDOAhYpwDrH7+b4V1MU3pnPCfdSLMos4QdbLXTXS
         NlJ5VPzfOJq5z7SYx3DPvh3YFMy1NxFLFINbXPoUneAdkTTZmTYPHCQvLAQA6zEMCxPS
         hZl0HUnt2A+isYxJSaQB8gSxGSxlJGOfzp/Yzc3bohJB/Qvo3+WKxWzsBEBL1rJx1omc
         r/4w==
X-Gm-Message-State: ABy/qLb+F0GyAHnA44aazv/mepZatYrxmj/31aeqlL8qbBtryBSqL5We
	8CTNJsaEFipjZ+iXjMBImh3zft3DA8Tpxtc0r5vzfw==
X-Google-Smtp-Source: APBJJlGJhHxFxWwssxNN5sl6BH5tA6y1+QmaVOzkBopgZ5IRca/1zX6oniAuCGBDiieeeyykWcCGTg==
X-Received: by 2002:a05:6a20:9155:b0:13b:9e04:5466 with SMTP id x21-20020a056a20915500b0013b9e045466mr8746542pzc.49.1690740105318;
        Sun, 30 Jul 2023 11:01:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/30] meson.bbclass: Point to llvm-config from native sysroot
Date: Sun, 30 Jul 2023 08:00:48 -1000
Message-Id: <f60f22fda1203d868f13dd224aa9d21ae4620dbc.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185103

From: Khem Raj <raj.khem@gmail.com>

Default search in meson would grok /usr/bin for llvm-config and if found
will use it, which might add wrong paths into cflags/ldflags, since we
depend on llvm-native when building gallium support ( thats when
llvm-config is effective), its better to point llvm-config into native
sysroot so it can add correct paths into compiler/linker cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc73360b9728812ed6123e30559b77d8e89cc21c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 19b54e0fdc..fb6660c1a2 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -105,6 +105,7 @@ nm = ${@meson_array('BUILD_NM', d)}
 strip = ${@meson_array('BUILD_STRIP', d)}
 readelf = ${@meson_array('BUILD_READELF', d)}
 objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
+llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'
 pkgconfig = 'pkg-config-native'
 ${@rust_tool(d, "BUILD_SYS")}
 
-- 
2.34.1


