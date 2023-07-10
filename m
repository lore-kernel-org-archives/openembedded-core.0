Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FF1EB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 22:24:54 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.179.1689027889319410790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 15:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GYlUtcd5;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7835ffc53bfso108451039f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689027888; x=1691619888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhA2Da6iDgbiSRZ2NIwCfnF2O3L+gTp+HGP7CBBccR8=;
        b=GYlUtcd57hSN2rTWcRPpzYZlPL7HQ3Sbheb7CoT38Q5lp3jNPv1Udzt8kXJ8NJfCGZ
         URmsjyLgggSOw4GhqXeINpNiOzNjN0xBkDN0+aM7fEI86soumqa5RL11rbtsiOiC9+/p
         dlNCB44nKvhCcN+jVEfE4nSIfUEIeuMAtMY7XJATCs634ktZUJT1ntS2+ovF+2s40ecg
         HGR2Y1AIojbPtMPWRAv5IxgeEnMCx7C8zeOEUpFe5di6a36EI3EPWIU2RndnsuqAVvkx
         C8ci5tsJS8i1DU9OT8jMpzIiuZYgglv64nNXwJUoeAwTlVTJQuM+g/SVhVUa2l9m1d5s
         1sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689027888; x=1691619888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhA2Da6iDgbiSRZ2NIwCfnF2O3L+gTp+HGP7CBBccR8=;
        b=Ye/RZChCHYBEeyUW0wnn1VekmamE03eNz3tlD6Fj3pwOo5R2RUFLVqMFOzMsj3jPXd
         veuDB0W7lVJhpegXIz0cluHkOFtl82BIFLMTxLuAcguDnbhpCFfbQfqqfZKY16T4dER1
         aseqs/nKbe8R2MwMm961U0HBFPjPilGI3jk45i32ondeMBU5+ipCLaVi9IiygOCqUVOP
         KBQpm2FFuOjIPl8AM7Uo4ZOnRLzii8mGidxo2LBWPQ6G2K3EpRX1DhwpPQkH1WOdVQzv
         k66DlUt99E7neEOlkdU+J3jfraExyb6uq26+L1CxfbNrKOW8gt/kTPECICaov1O2om2Q
         NIVA==
X-Gm-Message-State: ABy/qLaJ/3WPPbRgaif3O+oN0QUSHzArRxJNIOFfrrbOizL8YdFcop6n
	EdOyJS5MeHD0L+KljIRuvAga2oE1EJG1rA==
X-Google-Smtp-Source: APBJJlHtth+XIilXJYudKQGkqRtaeG4IYkUpnY6q/RmuT2F1v0ASxare5Dk4sprIf5gimZzDRL1I+A==
X-Received: by 2002:a05:6602:714:b0:785:cac9:2d49 with SMTP id f20-20020a056602071400b00785cac92d49mr11122540iox.1.1689027888433;
        Mon, 10 Jul 2023 15:24:48 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l8-20020a02cd88000000b0042036f06b24sm127838jap.163.2023.07.10.15.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 15:24:48 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 3/4] pybootchartgui: fix overlapping argument in render_processes_chart
Date: Mon, 10 Jul 2023 22:24:19 +0000
Message-Id: <20230710222420.2235277-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710222420.2235277-1-jose.quaresma@foundries.io>
References: <20230710222420.2235277-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 22:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184103

There is another variable named 'w' on the function which is redefined.
The full width is needed in the function so rename it as this must be unique.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 10f6783d38..e2f9c5dc6c 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -620,8 +620,8 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
     return curr_y
 
-def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
-    chart_rect = [off_x, curr_y+header_h, w, h - curr_y - 1 * off_y - header_h  ]
+def render_processes_chart(ctx, options, trace, curr_y, width, h, sec_w):
+    chart_rect = [off_x, curr_y+header_h, width, h - curr_y - 1 * off_y - header_h  ]
 
     draw_legend_box (ctx, "Configure", \
              TASK_COLOR_CONFIGURE, off_x  , curr_y + 45, leg_s)
-- 
2.34.1


