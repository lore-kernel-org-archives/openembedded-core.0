Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01C1C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 06:13:00 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.14713.1684217575882044934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 23:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FvfZ551Z;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64ab2a37812so3038280b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 23:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684217575; x=1686809575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wNet5eNIg3LnTEZMKPL4vk2DwJc+kv/N7sXyhQrNcmE=;
        b=FvfZ551Z1x1i008+Q1VWg/tRl3KNLcyDh8Ta4JcjJqh9hbEjYnflJduBxLzestCatf
         z2Lov0DmOWfwuwJPm2oFyQDmm5KwrAN5GypjU9NCUTWDnzLOM2N6ZSmZeM351cgN+t58
         MzlDdgrlbsAdzDBe3aV9Q18yxNQK7OLLjwdwRWUwZ6PP0ogKD6SPBVHJ+xwtZeZA1zYh
         x+MLF4f8D21xF9q0d4qyUaFhGa9MeMuQWEAX3ma4swsXgI7LGOh05AvxOPRfe1FlhhiQ
         p6uxP4y1aIln0Y29DvalrcylyM/ylMbnv9dqqagxI0vgNuhqfWVGQ8hZb2nj3zEC7hag
         7NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684217575; x=1686809575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNet5eNIg3LnTEZMKPL4vk2DwJc+kv/N7sXyhQrNcmE=;
        b=epqghp2jS5A25iFneX3Oa8XN698zZSnDuEc+q1kMKf859yTGhILqmGw9Yo8LfY/NEM
         PM2YL+Tzt8SlDR16OAWHbFKNSZDjgKYyxmb7+vmY6rqoh8Haa0Sw3KYeCOK/TBzWEn57
         ARC+FpewqOurLWO60tH8kYfGTAtUYzEBxXv/N/2NRL4fhPM/qa1o+PqZa7jIYWj4W5JL
         Bt/zjwcpFRgG+4wllfHIARUAK2xzHuyngFUU0x4i3QTr3b2jm/vPru/bpUxzOupRrniK
         w+H4dIeE0Ng9oqE4iLOXmxyM9+H6k6wMd++B+Jw4KEhqMODuxu79pqKV9O+VqNbhUsY3
         8y8g==
X-Gm-Message-State: AC+VfDy/X8N0IcBDy08z2hY0Pab2MWGEpBI5mZSt4Qx2A0hJt10to4uu
	9h5RABpx8yOd3sSEBdx5PVyh/yRDBrk=
X-Google-Smtp-Source: ACHHUZ4pV4Ht47kihm5Ic9W137cr3/2ptnR8QU8unrftxb5/vFn57M+oZJ0JsKXyXQFlINr9IuhDFA==
X-Received: by 2002:a05:6a20:3d0f:b0:101:8d3d:81b6 with SMTP id y15-20020a056a203d0f00b001018d3d81b6mr23294585pzi.25.1684217574685;
        Mon, 15 May 2023 23:12:54 -0700 (PDT)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id o65-20020a634144000000b00502fd70b0bdsm12751052pga.52.2023.05.15.23.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 23:12:54 -0700 (PDT)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-core@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] libwebp: add BBCLASSEXTEND
Date: Mon, 15 May 2023 23:12:39 -0700
Message-Id: <20230516061239.3921331-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 06:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181399

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add BBCLASSEXTEND += "native nativesdk"
Needed by native imagemagick

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta/recipes-multimedia/webp/libwebp_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb b/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
index 7b4d138d2c..6939cd33a5 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
@@ -53,3 +53,5 @@ PACKAGES =+ "${PN}-gif2webp"
 
 DESCRIPTION:${PN}-gif2webp = "Simple tool to convert animated GIFs to WebP"
 FILES:${PN}-gif2webp = "${bindir}/gif2webp"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.30.2


