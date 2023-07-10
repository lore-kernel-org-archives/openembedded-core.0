Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25028C0015E
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 22:24:54 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.194.1689027887494242851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 15:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AwkVifbC;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7835e5fa459so166118039f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689027886; x=1691619886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0XLDu+wm4zE+O1xwL4CfYB1J8reseMe3yNkNxgNd7s=;
        b=AwkVifbCl89IhOCDwrlGDdVG4wU0zd8wz3A3TqX69O9+NKMd1//J06FDGqNa493POm
         rJ2KBhBb5IUgHYojykv7Z7OxqPAppdHjFcPswYuKwQaC6GfKo4KbfwiaOaaU/9q6qeBF
         rdiUL9kXma8//6rbe7T8RUL29Nrb0REszAUXXNUXCcpDGjdTBKaptpeeD2anxIS8k6x5
         Ek3GtRZYvCoMKkB5FDrpxyETY5fN+jW2MeSCcurpcDxz92VzGMylYvZc7X4NepwZrvLQ
         Y4AZ4uyxC9rhiqvwoqF2Mab8fe9wmFY8jeMtaEzuj8t9Des6YJJ1YrGK0P3wB//ZYjCK
         P4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689027886; x=1691619886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0XLDu+wm4zE+O1xwL4CfYB1J8reseMe3yNkNxgNd7s=;
        b=ff+xKqZe72UowfI8G9hlA/R2a6g7JdJR8qWCe+APZ6jcI4KGBFWxBFAu8bh3gPn7BU
         JOBJiZMTfN0EYH55Q5HXg7/guVllkNxfy0PKc372YqVNBoLfT2rlvIsdn3r1YejaOE6u
         KjYv5C/IVqMddrCJeOmG9pbgwaDUHiMg5oeB177IHUNRWYh4LOubzrxaU09D5gePaAy4
         T15Onr3lRM0d4OKaLvdXqNh8qMRn+NRUQAwNOzuWurAaRZW6px0e2rQ+EE3x8Ya+cUY0
         qE13SjAr6qy0at5DvpjnQ+2NRaNpCoo9O7vsHjHryVDWt4VVUgOE/0wu4DG2GiBoScDi
         7x0Q==
X-Gm-Message-State: ABy/qLYInoqiAcBVNVgEyK9b76UC6JVFV7omkVHpJogXhXvoxkt53kki
	iAgg6cKL63ZWAUtvzTu9jVHm8X/uNp6y6g==
X-Google-Smtp-Source: APBJJlFVhF8Y4jvPZBK96uSTZjHmFESfJr3+N5OikX+DUM+LihlJQpI6B4ELUshJNNBPhBW95U6ltg==
X-Received: by 2002:a5d:850e:0:b0:786:f4a0:d37e with SMTP id q14-20020a5d850e000000b00786f4a0d37emr7369912ion.4.1689027886327;
        Mon, 10 Jul 2023 15:24:46 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l8-20020a02cd88000000b0042036f06b24sm127838jap.163.2023.07.10.15.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 15:24:46 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/4] pybootchartgui: calcule elapsed_time when starting the loop
Date: Mon, 10 Jul 2023 22:24:17 +0000
Message-Id: <20230710222420.2235277-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 22:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184101

Instaed of calculate the elapsed time over the loop when needed
do it on the loop startup.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index e71fe09ea6..ddfa9a6192 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -646,8 +646,9 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
     offset = trace.min or min(trace.start.keys())
     for start in sorted(trace.start.keys()):
         for process in sorted(trace.start[start]):
+            elapsed_time = trace.processes[process][1] - start
             if not options.app_options.show_all and \
-                    trace.processes[process][1] - start < options.app_options.mintime:
+                    elapsed_time < options.app_options.mintime:
                 continue
             task = process.split(":")[1]
 
@@ -656,7 +657,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
             #print(s)
 
             x = chart_rect[0] + (start - offset) * sec_w
-            w = ((trace.processes[process][1] - start) * sec_w)
+            w = elapsed_time * sec_w
 
             #print("proc at %s %s %s %s" % (x, y, w, proc_h))
             col = None
@@ -684,7 +685,6 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
             draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
 
             # Show elapsed time for each task
-            elapsed_time = f"{trace.processes[process][1] - start}s"
             draw_text(ctx, elapsed_time, PROC_TEXT_COLOR, x + w + 4, y + proc_h - 4)
 
             y = y + proc_h
-- 
2.34.1


