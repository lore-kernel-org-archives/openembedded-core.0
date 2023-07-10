Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2414AEB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 22:24:54 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.196.1689027890222530334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 15:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AuaFYxCz;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1b0138963ffso4722053fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689027889; x=1691619889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NP8pMFGeMkJwQIEoLkfALaz4kCwoTlO/re1Qz2PDeY=;
        b=AuaFYxCzDPIGBhKX3HnHubG0NXEopdOxJlM1epZLhX16IkH+5f8dnUO5vd+UpGjNxI
         F792IeDaYc1hCORIy+1edSGwMCnwwWTCFR8Ew1dqgJ2MNq4SWeBWe+IZ1TQYfhk6hOdg
         aC1DjuY9mhm+vL2vPftlAeHy5xbseBUnV0scRRmzlp2jSaz4Ms/92LofBdOOeDiY/Jk1
         EaLfpmDfOvU06KpQ/ajwMIPTibpjLOhTphKssTIYA2nir2LVWiJO/s6E7Gtv9J0ZCreV
         +vyvbaESS9hNK1JKDqb81aC7R2kXCrSBS6jljZaDzI3G4XLRFbG9G7S4QzbtG43Agpnp
         vKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689027889; x=1691619889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NP8pMFGeMkJwQIEoLkfALaz4kCwoTlO/re1Qz2PDeY=;
        b=V8SHFieoNjjd6yDZfGNLtce86CBXj8jeDy/EOcMju+tNa1P7KDVFw0o7yjHD3bzYJl
         4ad/RJWrBTmJbSeg7qBI+wsFaKeSx9Jl2OfN02eqpBHv5aDV/omgrXX0iIGoYf48D+33
         32KCxy97iNktCMHni0rkO01kv7N5ocyNceqgYZOYAyhVg2QsE1FgKWvtKmrUv1oIAq4n
         coIw/SK637E/gzI+y04UH4uJTvZgfxmlqsbyZsKAJcrx7WVi6oKj1/vpHF1Z5ZHpe4W5
         tBF/ZcznoYj4GdxYGPaBwXPZepkZ7SYMZ07BVdZsfXG4w+1fXsuzB4CVcRs7/rKqEeFq
         0jTw==
X-Gm-Message-State: ABy/qLY9bgu5bBd9HWKX4ZjxS1aD+lgSjEPqc7X1wQONYTkbI78j+kCf
	KILnhTMnWOK5HKrqY1dIoc+2i3792elpUQ==
X-Google-Smtp-Source: APBJJlHrlg6VckyoFOn5mF+13XVd5YKQRM/J2vmE3vL0rkrHgTN3PRK5+PSdeGsqooLHaetBXz3KWQ==
X-Received: by 2002:a05:6870:b4a0:b0:1b0:805:8678 with SMTP id y32-20020a056870b4a000b001b008058678mr16681402oap.24.1689027889409;
        Mon, 10 Jul 2023 15:24:49 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id l8-20020a02cd88000000b0042036f06b24sm127838jap.163.2023.07.10.15.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 15:24:49 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 4/4] pybootchartgui: fix width max usage in draw_label_in_box
Date: Mon, 10 Jul 2023 22:24:20 +0000
Message-Id: <20230710222420.2235277-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710222420.2235277-1-jose.quaresma@foundries.io>
References: <20230710222420.2235277-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 22:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184104

The function draw_label_in_box chooses the correct side based on
the maximum width length argument 'maxx'.
Currently the labels are always drawn on the left side and this
is because we are inadvertently passing the 'maxx' argument wrong.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index e2f9c5dc6c..3d1ff695c1 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -684,7 +684,7 @@ def render_processes_chart(ctx, options, trace, curr_y, width, h, sec_w):
 
             # Show elapsed time for each task
             process = "%ds %s" % (elapsed_time, process)
-            draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, proc_h)
+            draw_label_in_box(ctx, PROC_TEXT_COLOR, process, x, y + proc_h - 4, w, width)
 
             y = y + proc_h
 
-- 
2.34.1


