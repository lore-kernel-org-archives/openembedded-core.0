Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC32CCA480
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.11782.1655667071878919231
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jn4BU7S4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id y6so8020656plg.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U/V3/dtob3dAR9RCNALefxHYHjUiKXRmuuFmlPSG8qQ=;
        b=jn4BU7S44RCR8VYSrlotoBsEhehR/uJHQ7BIX5OxIXsJIynCcx9Hb4axDNW6Gr95Of
         I9IzEu4V0xkAIZPG0GJpxWcymsPNoZxArtcy0hHjMOFsmrHWFkVVNEW7aPEPA6wFIt6V
         4s4Io3mpSvwqENKAufSBZv7FS/b/OhAldvoTit06EBHAwsBRUf0QSH6lLFqgetiMxbYw
         jGNf/CBpSyrWAPpqFwEBawPl6O/igeMTqCv1W0t8pdxaqCbGAF14oWkv9M+5EG/JihM+
         lB24NmHzSCR0akv7gG6IuUFACyj+bSJ45sknbDooVrSPyNkPlMab2CRpWEvSKQFQ19dQ
         pqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/V3/dtob3dAR9RCNALefxHYHjUiKXRmuuFmlPSG8qQ=;
        b=ZJBczW8zo+TlrNk0DBV4oEZ7BU+d1xKDJFxGRKifL8wY1C2n7xM990F1H3C04n06cj
         +PpOYy4EsvRR2Z4jsX22WX8++lOyZNYlECOJBjnz35p/UJUdQO1Uf73c25e6ILq8d3ZH
         /MfxKRNm+qSCM1ITIE0kcKA2aqQnScZLfm6sDj9oPOiarMQ8FkvECHbD1qHlzXTu2/76
         8cLFO6qXnXmsbtWsJGZrLz6ISTvccpzy1Wde635uexBa84gmFNfSgCPBhTLXrqZmly5c
         c8AADYR89eUo+rEPn+cOqNwNidY1ywsg+uSaeICfYG6+5/TpqEUEQMnyK2ajJawMe8s4
         VX1A==
X-Gm-Message-State: AJIora9YvxyT5hq2WsiLtJL14pRPptIXMzD/C6emMZ/7N6LZXd96HEdB
	Ybk8/KrhaKIxyrfHjsqKxY9V6Sjwj6xbewMc
X-Google-Smtp-Source: 
 AGRyM1vSrTzvzq/Y4CzRHH7ZDcWp+SUelrdI7RRYMp2Pggk1zGXItQnqMEzm7Hrqa+k6DS6lQSJhgA==
X-Received: by 2002:a17:90b:224a:b0:1e6:7780:6c8c with SMTP id
 hk10-20020a17090b224a00b001e677806c8cmr22710431pjb.119.1655667070939;
        Sun, 19 Jun 2022 12:31:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] devtool: Fix _copy_file() TypeError
Date: Sun, 19 Jun 2022 09:30:39 -1000
Message-Id: 
 <5e6f4d0d3d314897b8ab2f45b3a78b0da9df99ab.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167050

From: Xiaobing Luo <luoxiaobing0926@gmail.com>

when devtool finish, the _copy_file() failed.
--------------------------------------------
TypeError: _copy_file() got an unexpected keyword argument
'base_outdir'
--------------------------------------------

Fixes: 05f2d5d2ce00 ("devtool: finish: add dry-run option")

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a45d9dc089fb2719ca69b92870917f8c0925f632)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 01fb5ad96f..4b50e3c63b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -353,7 +353,7 @@ def _move_file(src, dst, dry_run_outdir=None, base_outdir=None):
             bb.utils.mkdirhier(dst_d)
         shutil.move(src, dst)
 
-def _copy_file(src, dst, dry_run_outdir=None):
+def _copy_file(src, dst, dry_run_outdir=None, base_outdir=None):
     """Copy a file. Creates all the directory components of destination path."""
     dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
     logger.debug('Copying %s to %s%s' % (src, dst, dry_run_suffix))
-- 
2.25.1


