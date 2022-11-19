Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33418C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.30661.1668892551976033218
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fTk4GmUH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id u6-20020a17090a5e4600b0021881a8d264so5739513pji.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJkqDg3jqNA1e3oD7rKD20kN/ACICF3i0XLV0LDWZpM=;
        b=fTk4GmUHxu2/lJa/1GWsAI8TWGoqMmXypy4ftpXEnXlxa9b3S07YtV7MZyGe0i3bvC
         PvmzV6QIPO3qGsynthGIGhBlWkuKnfQ+1p43CZShY4iBcuWbz66nESTu0VoShpP9pqRA
         l4ihO33KSgMDFUXArNln4y/CqnF+yZVztKrwS2JmO5PuGwcbh5MIMS3Uwp7iswv0dKRk
         xb79+KL69pfbQJkDp+rgbNNQ/I0jm969b7iUnai8tpBgG6Cih3WCrTInEikS887RwBxz
         dtz/5pXcry698jTmu+I/vCI9IpoT2IzMQ743QPOpSKDVNnDMqi+u+gEon1SfInAROaDn
         gQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJkqDg3jqNA1e3oD7rKD20kN/ACICF3i0XLV0LDWZpM=;
        b=JL45lraPj0hkgAUuFfKZk6AXt/rSWlQfvn1dl0F59iDB3gAOOndIEcbAhHpam1nTA6
         UccBsNkuz0ZmqYujOgo7nPqfNaDKZVu5OGsZI7TK1BhF74uAwTzKQxCFs+KdTJqf+Ol+
         TK8pRVvux5BDDOhZztq8JHck3Pl9y9qOLf0mveuMqZWcei74Uf+ImI4fDKk2MI3zURgi
         GLboCcipqNT6x2EScvKU9oyBT0ZGGLmowr1L5Y4bGwJAAJyHvxBJ+byCaQ1BjJ+wCLii
         XHB3P40/WMGf2AMoBwvUpni/Oy0E48AAQkbyVOeKoPMbUhtQwrJkK6OvlXAY1+X89rw5
         HMVA==
X-Gm-Message-State: ANoB5pkbyowuDBTC4FHApzB5IWUh1hZ0+2Mgp+EaJ97ik+rtJaSADLgc
	79AqOahGSnkm+xlsvtZ1HjdxkNauoUGTHxiEsaE=
X-Google-Smtp-Source: AA0mqf5xEq8cP98G983dzZqsoTVJO3LnSGFlVLVJg4bhfnbp9hrjOIMKBpnc+qFi79RsR1Y93xJqtg==
X-Received: by 2002:a17:90a:ae01:b0:213:e8b5:2d50 with SMTP id t1-20020a17090aae0100b00213e8b52d50mr13792928pjq.211.1668892553006;
        Sat, 19 Nov 2022 13:15:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/35] lttng-tools: submit determinism.patch upstream
Date: Sat, 19 Nov 2022 11:14:55 -1000
Message-Id: <8167b8769550455fef685da8db41d9613fa23b84.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173556

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bec62455d900a0d3e18a62ea7053c214bc545fb6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/lttng-tools/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
index b2ab880bd6..0a897a8e13 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
@@ -13,7 +13,7 @@ to me whether the tests need that or not.
 
 Fixes reproducibility issues for lttng-tools.
 
-Upstream-Status: Pending [needs discussion with upstream about the correct solution]
+Upstream-Status: Submitted [https://bugs.lttng.org/issues/1361 - needs discussion with upstream about the correct solution]
 RP 2021/3/1
 
 Index: lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
-- 
2.25.1


