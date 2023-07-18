Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2219EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:59 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.9020.1689690417213590334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SCx07dgr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3837931b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690416; x=1692282416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pn+ECDFUIh1kmlXKUPZh9njPQVksFqQdtObNc1/5UiQ=;
        b=SCx07dgrvuF/4/wmWN5iP6r2cAXvg9VdBJo6nPpVva4G93yt2YwJKLsvqYcoO5rcto
         cpEyY/ZyIC/zT5HUr91A2xD9comSDZ2TYCgWqiwAC5tAqe/PGUe9p38zFywn3jny0Y36
         5+mskyT7EbxJRw1Q8dAXlYTyd3Dpzy8apTpwBCbtIMmG22UR/xjYPaZirO9HqwPu0HLM
         YOiSvV6AB/jazTewUrTw5vTnEfzkThtfpkxIEDvr74xoUxv7sTtiErg3r3dnKLDmr84W
         +LQR6hbMlYyXiqN2KxeyjIntxdzsArUALDqYWGv9/vUl+V4txJO5rEci77TOxQcAx3OL
         lVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690416; x=1692282416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pn+ECDFUIh1kmlXKUPZh9njPQVksFqQdtObNc1/5UiQ=;
        b=cvfjtJpZ6QIZZM7IQsiefiBZXxf57uPg0gm3eUloIvBs6fl/p2iyzQKISF8vz5peul
         CXp5j/x774qbRL/Qq9hxsEfTkv3hpjvcmaox3LlUQtYmaspDwLdVgRUPm9Kqeqg2xwE9
         0ObKKb7XqEmAoute+DAZQbEmkwRksYWkyz/eLSDJ9xocTNI5egkoQc5Wnbge0Ay8Su1b
         Knc7ZjIPWgzmJh8dO8sOuLRBTSoTw+uQkquM72kHgYlLYUGFTx27wcrJ5KekDWZ2YSi6
         7V7gU6KV8ajL69atVqrX7j6nEt8ToVEolW4LHNUwZv9u5j1o5FKii6QjNN6OJZ1oYkfq
         11tg==
X-Gm-Message-State: ABy/qLYNXpEGaSIg3IMsDr9IYiB8CWvfgPHyTMLbUPKFeJpn85x10EF5
	uH4juVQIk305R5dG66cCkeTmhXaqFWm3vUld1wA=
X-Google-Smtp-Source: APBJJlFAx6ph6ZfUStdnebsHPYzThltV5+QHEe9mP1/rAudzrupe5minqwOfkBpKav8fIVW5LWsTRQ==
X-Received: by 2002:a05:6a20:3c8d:b0:134:d4d3:f0a8 with SMTP id b13-20020a056a203c8d00b00134d4d3f0a8mr5671903pzj.3.1689690416260;
        Tue, 18 Jul 2023 07:26:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/27] pybootchartgui: show elapsed time for each task
Date: Tue, 18 Jul 2023 04:25:51 -1000
Message-Id: <b2678422b411ccbd19a7b198c872b92077567391.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184521

From: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>

Currently, finding the elapsed time of each task in buildtimes.svg
is a manual effort of checking the top axis and finding and subtracting
the end and start time of the task.

This change adds the elapsed time for each task, so that
manual effort of comparing start/end time is avoided.

Signed-off-by: Mauro Queiros <Mauro.Queiros@criticaltechworks.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3efebd3404de548f0757863da237f2d18ce60013)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index fc708b55c3..707e7fe427 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -558,6 +558,11 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
             draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
 
             draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
+
+            # Show elapsed time for each task
+            elapsed_time = f"{trace.processes[process][1] - start}s"
+            draw_text(ctx, elapsed_time, PROC_TEXT_COLOR, x + w + 4, y + proc_h - 4)
+
             y = y + proc_h
 
     return curr_y
-- 
2.34.1


