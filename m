Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8A7C001DE
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 22:24:54 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.178.1689027888345257415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 15:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MtHEdC1y;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-34574eb05f4so19137495ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689027887; x=1691619887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCjv7P/0GdtnIngYpDEmoQL93MOmxIecaa/eVAYg6U8=;
        b=MtHEdC1y4OZY8mxDRigMyTyAp+h+khO12+/3IPFoN1eYRmQ8sevk3qVKfgM8wmcVLr
         iQ5HBx5lXDcO747omdHi1Nf7k5EgAABxqdv0PhdfyaoMZhYSlagim/8nphGnaPzSav52
         1q5UkmxHE1pYaHql2knhvDFvsBe/uLvFH0cVZYWgg4kJhNeAsjfNiHc4djR4WuNbYaW1
         aLbpwy7zf920PmHv0/LwSeEcj2LxepoHfkicfbfRLzYflJ1J5FLN2Aqsx3XpFrD7PyxT
         M3e8R2c+Jaq5+2+SNygFQpV2Cx4hsr5LsDiCdaAYhD3N6vkOAaf98XKIb5m6pwJDOZA2
         yMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689027887; x=1691619887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCjv7P/0GdtnIngYpDEmoQL93MOmxIecaa/eVAYg6U8=;
        b=UCV3/oGjzlDC4qh1Vuqoo5tfn/lP4esjX54yzlLF5NP6OE5e36zfzr2vhkdDOgKqeo
         rbrM1izmcYEnZs/+V/8PTrhTjZs9zySQzOQN/5G3UtyuKxvQ86vT2zMMs61r0PqFFO3B
         4/0ZO09KLqPjmYNGHwyNyMcuNw6+NGvLNjb2+dCHxNezvJvKqyVxKA/rD+wZlk5KoQCb
         O3Ql5ovy9qf7LSeqEZMUISsTrGFWT7YY6HdDVqzRTb7dVXU8B9Jw3WVVHLTH9ruJZsul
         M49ChbQTkW2Wa9fBMJii1kvMhH9uC25M1o4wiiYyPFfKOPyTfjXioNB4GQIWuHUJc8QV
         cuyQ==
X-Gm-Message-State: ABy/qLb43meTevBgO7+kqo/DXc2L+LaYAX/H/TuR5a4rmxkdF6f1nvta
	4tWhmC1DLs37V+VizwKp3liwnld8X7qPwg==
X-Google-Smtp-Source: APBJJlGwf0wUGGwkzPyx4KZgE19vAFWkjjU3YfoZ+j6vdxBsoX6CI4DtnxITJVSGWowgQNsFc9SycQ==
X-Received: by 2002:a92:ce12:0:b0:345:913a:41a3 with SMTP id b18-20020a92ce12000000b00345913a41a3mr12767988ilo.30.1689027887432;
        Mon, 10 Jul 2023 15:24:47 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l8-20020a02cd88000000b0042036f06b24sm127838jap.163.2023.07.10.15.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 15:24:47 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/4] pybootchartgui: concatenate the elapsed time with the process
Date: Mon, 10 Jul 2023 22:24:18 +0000
Message-Id: <20230710222420.2235277-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710222420.2235277-1-jose.quaresma@foundries.io>
References: <20230710222420.2235277-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 22:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184102

The function draw_label_in_box have logic to chose the rigth side
to call the draw_text, so use it instaed of forcing the cordinates
of the right side.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index ddfa9a6192..10f6783d38 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -682,10 +682,9 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
                 draw_fill_rect(ctx, col, (x, y, w, proc_h))
             draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
 
-            draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
-
             # Show elapsed time for each task
-            draw_text(ctx, elapsed_time, PROC_TEXT_COLOR, x + w + 4, y + proc_h - 4)
+            process = "%ds %s" % (elapsed_time, process)
+            draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
 
             y = y + proc_h
 
-- 
2.34.1


