Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBABC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:00:20 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6579.1705507211260961801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XsPczO3/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d5f56912daso11337425ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507210; x=1706112010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKxo0bWtbcbMo037MW3YuRj7sjCoZLhtoQ1ZKkEcBdc=;
        b=XsPczO3/hUzxTsFIQJJsAFpL7ZrL2hZqExBhrCtPQByo4X+MbERp/90QcCO2cwAE4e
         Dol+u3CJIMskSnikxJH0uEyKS+FHlmJ0FbKnegOCthf/UVbZhPbXGDR8bAZkXbINJ9tx
         LSQHEFmPGw48pK7YIOFf1bFX7tWLhlfRp8bTVAh49g8Rv1gG5w0STaWb3kc1skF7/Ufo
         U9/EsGxMvsm/R3+llxwbbv0jdREhmpRmCETMNkCUo/Ldm0UIz5ztKQoI7Up2HTb0wi3b
         /ZWcHz3fyPhhdXyIKUOIGaW9BECvC60iFU42+pYEgeOtJFiodq5nmA2Dx5FLKzYGrBVK
         PKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507210; x=1706112010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKxo0bWtbcbMo037MW3YuRj7sjCoZLhtoQ1ZKkEcBdc=;
        b=sX0dXdzvIfQziJCGuSFR253+1qrPzLbmCKs13rof4esmI5IIP03Xc3vdH8KI4oD+Ew
         9IcAzecRvvjtwPEi1ObvpNfCWRzQugm4vPiEf5qlQhV2gswdCW/uMbLq9rjZtCgSwI0w
         9aIV4n6X7WzhdC9madp5RGguB+htR8btPCHUSKAEV95+P4QzrZxV+BXBvswo9UlRTlvU
         E1ojcE2EIhb/YlwBNOUlfIG8O3cWLaEQ+W2viR5KBOdbKwb4SuafuNwjAcnKiLWuoET5
         0cnSzAv5a1wA4bO56hn9lSDTp5zQ7Y2PT2FuEiQmtHQsUNh7s/TsSk8rTm8rHFwcx+N+
         4mog==
X-Gm-Message-State: AOJu0YzTIoeHN1eioQ8WKiUOJme1NGub1Qg6Ol1qMz6iPGTieq58taWq
	ObTGxzIvZOhwh43cAERIxsgLe1NQmzpafF2gEb6h0NX7JhG9XQ==
X-Google-Smtp-Source: AGHT+IEhPv1M+Mr2BxqDhfK+KNH5BkF5L7k322xtSEtT6yBNacQ7tDZazwj+YFnbIOZg76MFGIe1pQ==
X-Received: by 2002:a17:902:6808:b0:1d5:f504:bfa4 with SMTP id h8-20020a170902680800b001d5f504bfa4mr2055225plk.136.1705507208539;
        Wed, 17 Jan 2024 08:00:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.08.00.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:00:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] pybootchartgui: fix 2 SyntaxWarnings
Date: Wed, 17 Jan 2024 05:59:00 -1000
Message-Id: <ebd61290a644a6d9f2b3701e0e7ea050636da76c.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193931

From: Martin Jansa <Martin.Jansa@gmail.com>

scripts/pybootchartgui/pybootchartgui/draw.py:820: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
scripts/pybootchartgui/pybootchartgui/draw.py:918: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if i is not 0:

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8d996616f0ca57220d939a41ca9ba6d696ea2a4f)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 707e7fe427..ce3af74e2b 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -703,7 +703,7 @@ def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip) :
         cmdString = proc.cmd
     else:
         cmdString = ''
-    if (OPTIONS.show_pid or OPTIONS.show_all) and ipid is not 0:
+    if (OPTIONS.show_pid or OPTIONS.show_all) and ipid != 0:
         cmdString = cmdString + " [" + str(ipid // 1000) + "]"
     if OPTIONS.show_all:
         if proc.args:
@@ -801,7 +801,7 @@ class CumlSample:
         if self.color is None:
             i = self.next() % HSV_MAX_MOD
             h = 0.0
-            if i is not 0:
+            if i != 0:
                 h = (1.0 * i) / HSV_MAX_MOD
             s = 0.5
             v = 1.0
-- 
2.34.1


