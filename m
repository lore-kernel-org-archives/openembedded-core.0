Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F6C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:36:05 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.11716.1660620960040222950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yw8TpMcC;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id t3so208396ply.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pKV2TTg+ojbnn+rcBlIgQuXM5PzJp38q6EGe9LpUsig=;
        b=Yw8TpMcCIc7FdqZ6NEQCjtcEpeFCkeC4A++eEcAyPVpgakJ8anJOpEy3dh8nFqvrvw
         P/DxPjPF3biO0UFzk+LOKnRSGbocsHGSnZ1nVrrpnbXNfL6GE64xEDeGj9m6ZX8QWc9t
         P3IunzR3ssTNF5A0P10a0qLJL3Iw0Sp6CkL0yb6Ld+TlVDaAHqCY9yf8XIdY6UIK51h/
         5QzfSbJwJje26ch7KfbN6F2hwUmA3NETJdP1g1fjAF9w3rqzCUONBlHCaOzLofLHrYFg
         BXJ3wOC0qFKuZHW6HXTE/bIzRDz/SUUerZOcHukvW8gW7jox3wmrx5MjyMQ1cGdlgJ2D
         Uf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pKV2TTg+ojbnn+rcBlIgQuXM5PzJp38q6EGe9LpUsig=;
        b=QtFYJx1uv5gYqJF+GHXdCvUaNJnUvoPupqeNJzJfX9yr05Bo6PNzTurmsSCu3cs1jY
         9pZL8lkoyoDND92NxrdJcCayTm/UCYtxbOtNZdmviYLKkBVjBh5XfELr29f0M9OjpooE
         vCyGLqSYbF83+Y+Ynoz10/+KKDxRTZdl7uQRyVV2DbnofzHzInBAvPWpZvxY/vhQ72IF
         5EkoHSm4KjaCbEGUGNjCxsrSDEgGe1X1mLxz+XXNzrikStHb5FHZvO8kwJ8yBCmjSpTz
         FGcEGDTuvJS5+P4j5YOeYplNT7iyG4D0zdgLL3tqIaYXzP/8OiYryKAxHyQmiD/IXuR/
         d6YA==
X-Gm-Message-State: ACgBeo249wKX/rP5MtWKcgyl5/5J/Wmw20eJ6tdosElDlRZmianjx7li
	8brLBh0Hn7C6tC63w2ywVgVjZ4r3hTvWIg==
X-Google-Smtp-Source: 
 AA6agR42L4nDj6b7ttK5FGv07Zz/jiuzTBYoGXHC/0XhGMcF58dauKAAZrCXyqi88Xdebhk/IWsvHA==
X-Received: by 2002:a17:90a:fc2:b0:1f3:20d0:2e47 with SMTP id
 60-20020a17090a0fc200b001f320d02e47mr21098421pjz.117.1660620959053;
        Mon, 15 Aug 2022 20:35:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a170902ce8800b001714853e503sm7821428plg.36.2022.08.15.20.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:35:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/5] binutils: Disable gprofng when using clang
Date: Mon, 15 Aug 2022 20:35:50 -0700
Message-Id: <20220816033551.2701240-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033551.2701240-1-raj.khem@gmail.com>
References: <20220816033551.2701240-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169424

It does not yet compile with clang it comes with __ builtin___snprintf_chk Not Supported
formatted output of built-in functions check is failing with clang
somehow it seems to be compiler limitation. Therefore disable building
this component with clang for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 8eab78c3301..863eedbcbd9 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -14,6 +14,9 @@ EXTRA_OEMAKE:append:libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
                                 "
+# libcollector/collector.c:547:15: error: no member named '__fprintf_chk' in 'struct CollectorUtilFuncs'
+EXTRA_OECONF:append:toolchain-clang = " --disable-gprofng"
+
 EXTRA_OECONF:class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-- 
2.37.2


