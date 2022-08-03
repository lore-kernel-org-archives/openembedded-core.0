Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF8BC3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 15:13:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.9952.1659539585049491735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 08:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jeQzVrd6;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso1852304wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=iHYXLBusyX9uGiyu5o1GXQiDAZrwj2tgLxNt4w0UUMk=;
        b=jeQzVrd6Mq5PuWFtv1Jh4ZT46GGueJaEsGEZRZWJtcsixWItyhzwOTFF+MqLQ14YcK
         y8tMOaAVMNwQ8xEBcTMemPIRdwmXbBGk+Ifetxgs6S8mYo7OVC8rR/v+1wmgnahkNgDk
         eoF2Nh5MHZ4eWVZK/StkfkLMRC4Dq6Bxi3NX98cbt74jHaTpdaxaILPzKV3mQiz3i32A
         awjxVSiZbW0mjujkFhDjmNRJuSyMo/PCVu89T96c4gAx/DM9ZQ8hZ14N8dgiLCJyi9TN
         Pg3xq3ogR8n+mDDAAfEQDHr9jPZuamSukMkunkR24XArJ9Ui8rSLj1C1J2c6eR+Bi0UQ
         42Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=iHYXLBusyX9uGiyu5o1GXQiDAZrwj2tgLxNt4w0UUMk=;
        b=KJyIiXGNQAit+R6ZIsgCbBid8Vtek+qImu5nWR8HYRLx3DgP0bNuJ4WC570RLpbYln
         asLB5RCecuwCiR+DW7UIFtWT1MO/mw+wLlmy6Tb1mT0276zDXa/WjEx0dhEYwGf14hdv
         kXve72xt3zISZ0WadVWSIxZzG+9msqwrqYurua/ft+6zZpe8MS720Vk0ULZdO+JhJeCj
         N7WTPFvztnZsLc5r35W5/r66BAmIYbPpB2BAXTplUzyNyAdaulq3s37KdoFLeSxmMi3c
         +oYZLxaJ2Zof/SCOHGdNMZc+BXCEiojP6o7KvfOX+dwkQHvrZPEgMlRP/WaPR0p/QnfQ
         Tqhw==
X-Gm-Message-State: ACgBeo2jTEeN9zREBjX5xxdaVOGfIF5tggkESVHCBCXV9PSTkkcv/ZeG
	9QU4z7kcOPdzmqVSvQYlpcx7/gZnpvU=
X-Google-Smtp-Source: 
 AA6agR5lDXdGRh0SsH0jzr6pnFN1no1e5PbCfUI5LXjkRWjVzILR0THHWlA7plPwq896EkGQ7/iLHg==
X-Received: by 2002:a05:600c:4f4f:b0:3a3:3cb5:c02d with SMTP id
 m15-20020a05600c4f4f00b003a33cb5c02dmr3256825wmq.198.1659539583333;
        Wed, 03 Aug 2022 08:13:03 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a5d51c2000000b0021badf3cb26sm21704304wrv.63.2022.08.03.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 08:13:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Aryaman Gupta <aryaman.gupta@windriver.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] pybootchartgui: fix 2 SyntaxWarnings
Date: Wed,  3 Aug 2022 17:12:29 +0200
Message-Id: <20220803151230.3510723-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <17079CEA61EEB51A.26827@lists.openembedded.org>
References: <17079CEA61EEB51A.26827@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 15:13:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168822

scripts/pybootchartgui/pybootchartgui/draw.py:820: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
scripts/pybootchartgui/pybootchartgui/draw.py:918: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if i is not 0:

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 3926bdd11e..4e04b06427 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -813,7 +813,7 @@ def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip) :
         cmdString = proc.cmd
     else:
         cmdString = ''
-    if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
+    if (OPTIONS.show_pid or OPTIONS.show_all) and ipid != 0:
         cmdString = cmdString + " [" + str(ipid // 1000) + "]"
     if OPTIONS.show_all:
         if proc.args:
@@ -911,7 +911,7 @@ class CumlSample:
         if self.color is None:
             i = self.next() % HSV_MAX_MOD
             h = 0.0
-            if i is not 0:
+            if i != 0:
                 h = (1.0 * i) / HSV_MAX_MOD
             s = 0.5
             v = 1.0
-- 
2.35.1


