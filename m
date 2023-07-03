Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFA8EB64D9
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 03:00:09 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.19668.1688353204827965993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 20:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fb8nJAE0;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-553ad54d3c6so2177809a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688353204; x=1690945204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8ydprSdtweke30RN0RXizh27wwzimdUyqUtExErzEA=;
        b=fb8nJAE0fKsUTao/AQwivMtlLS0jdAlgVlAJMXaDxgYvGCWUAV1kJtAmPjd2V3sbZR
         8KtyIiCAYvfC60gk8tBiAmnZU0KoVEZvrXUChLMOdNgYRu+T/JkMq/MlvBsLGaXX5F8h
         M9ER0w9NokCaJh4zR4IWkDdXLeHH+zqBvU+7yxjHnxdGrcTqt9AUjDD17UYkg/GCLd9d
         IqeTeV+BUl97/57UB/IHKZfP1OjqrzOCctZyeBpUz93lS17bLYWQj7EcCvbc0Lnggh0W
         gTSvTpGz8kpZlCIV65JPOYQJl+gUydW5QL5tWy0W0K5Jh06CalOeU6/Egz1s4nwMrmj1
         H6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688353204; x=1690945204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8ydprSdtweke30RN0RXizh27wwzimdUyqUtExErzEA=;
        b=gj9ejjXnkB4r3x5iL+QTgAnrjbL+rBtIey3Vu8Rp8kc27PMNxP/2PEd9dAX8fX/ibX
         6xcZUr73QkxNkW6oTJjD4X5OYVO4ifZiAfLuW9m5ygFgUElZTOGwpykTUlmZ4MQ6Z64Q
         KYhWp3eIM2LauutCABwgN7U6Yqmz+mzllswFPGuCg7iJSMNMA0tuUWOHg2ANJtXsmKhA
         cWlTDocTpFaVUekNokLkiFaPC3aI48/aTMKQwJQLx3vvT8aulJZ4AalN+XDHPiy0R9xo
         1J1HZRcHEcQ9HHBcDZP7mueK/dgk+gkW0AJqr+pBFqpdC2uWi3b/8n60uHh51SwOEucp
         Me0g==
X-Gm-Message-State: ABy/qLaE16X69XMHMe0QPsnIGi93dywAvAXhQgV6lT7k8IACCq63KhLV
	EX1IfX/hHLToNbkrJiDRqVo4Tmw9cyw=
X-Google-Smtp-Source: APBJJlFxbTmWEFzg65s2od8tmd/Ks5/U+mkzeuW6t/rsDBMhmm324IDBdLUFu1yH7Xo1EpN/8StwvA==
X-Received: by 2002:a17:903:228e:b0:1b8:5fb4:1c85 with SMTP id b14-20020a170903228e00b001b85fb41c85mr6409281plh.16.1688353203750;
        Sun, 02 Jul 2023 20:00:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1fb3])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f54400b001b03a1a3151sm5622855plf.70.2023.07.02.20.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 20:00:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] mesa: Point to native llvm-config
Date: Sun,  2 Jul 2023 19:59:59 -0700
Message-ID: <20230703025959.3968541-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703025959.3968541-1-raj.khem@gmail.com>
References: <20230703025959.3968541-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 03:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183787

Default search in meson would grok /usr/bin for llvm-config and if found
will use it, which might add wrong paths into cflags/ldflags, since we
depend on llvm-native when building gallium support ( thats when
llvm-config is effective), its better to point llvm-config into native
sysroot so it can add correct paths into compiler/linker cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 928899008e6..63d7494dfc4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -75,6 +75,11 @@ EXTRA_OEMESON = " \
 def strip_comma(s):
     return s.strip(',')
 
+# llvm-config should be the one from llvm-native and not from build host ( if llvm is installed on host )
+do_write_config:append() {
+    sed -i -e '/\[binaries\]/a\' -e "llvm-config = '${STAGING_BINDIR_NATIVE}/llvm-config'" ${WORKDIR}/meson.native
+}
+
 PACKAGECONFIG = " \
 	gallium \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
-- 
2.41.0


