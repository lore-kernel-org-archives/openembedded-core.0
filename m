Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F54C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.1204.1684776400747152820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SUmAf/H4;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-510b6a24946so11587765a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776399; x=1687368399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyOPqCq+H8AHC7pJKdWYnzhQlLaOw188aXHTYMCptnI=;
        b=SUmAf/H4toT0NmYnXP6Nn93SbMw1KC+SrdqJnQvmnwE9DIuOIpK/k2jzjenrdc3xxO
         SgZljtKAec1f8/2SSzef0t/sAiSxp0xD/FwxRxsBd02YLmja+4lDeEzod3h06N9aH2AX
         8DpZTBIplPVKCsccbVOgUurtOZ9sfNzZCT5uOdxJf3fHvL31uWvudNEYi/Wqa0vCAhiL
         nG2nHMJnM/6c54JMZTDLAcU88kU4bs97ighPadSm+PwhcxEt6esVS6DD6tuBrSqxeqKr
         H9RrAzIBWekG57woUtLVXaJsQjJxL5mKcBMqEg+XB/i3UNqWIz1GPlieMTxlOcrPv2P5
         9TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776399; x=1687368399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyOPqCq+H8AHC7pJKdWYnzhQlLaOw188aXHTYMCptnI=;
        b=WM0zuKuVhlhFyupfpRQtbnAtS4TiEB2356DFqcT9zjHku5fuVnFuwXZmxFq6pSloa+
         skgdT6YiEkW4d8AMeDyO4uipBsucqi+nztqLsw6rVJfBHNDYTMBe+oHwc7z1wZc//I8U
         QMl8JEyuFqeICiGmYWaWJed8jJwXabDXFfLP9Z/hMM7aWyajCTr1OklBi45Jy9NoeVuS
         BrCj3u99MbEWKmtJJJDuUQEgGQFaw/SJUlME0zNI0PbLndoABVSA29VXAw8BzkBJ80bL
         157sLQUYFniuZ40pZytO798lu9QO9o0eCLd7e/4kBhQYZ3SJaNese+huNBZKfaPVzlZa
         sWuw==
X-Gm-Message-State: AC+VfDxGPRjayQi7DtDWT3gFKEcn8m0ixA1f9F3OGa1jJ2kMrV0NXGBO
	NIyItY6/kn043X0dkI59d6ssdNm46nw=
X-Google-Smtp-Source: ACHHUZ4L4cHxZw4NW+Xsm3dEkMtS3jAmmHSQx0gykSgl5W+rvaRofUYTcFPjhuy1ZvpKrUYhHsf/GQ==
X-Received: by 2002:a05:6402:1b0f:b0:510:b636:4073 with SMTP id by15-20020a0564021b0f00b00510b6364073mr8875146edb.3.1684776399175;
        Mon, 22 May 2023 10:26:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] gdb: trim python support RDEPENDS
Date: Mon, 22 May 2023 19:25:01 +0200
Message-Id: <20230522172503.1651374-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230522172503.1651374-1-alex@linutronix.de>
References: <20230522172503.1651374-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181606

Depending on all of python3 (which pulls in all modules)
is not needed, python3-codecs is enough.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 9db61b785f3..434ff222ba3 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -33,7 +33,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
 PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3-codecs"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 # ncurses is already a hard DEPENDS, but would be added here if it weren't
 PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
-- 
2.30.2


