Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC27C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.19514.1676150687007490492
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7zf5cAoQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id r9-20020a17090a2e8900b00233ba727724so2861547pjd.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epAO2EG8Q+yCBh9i+dO5JtNWsxsXr+yoTlOwZxxSwdY=;
        b=7zf5cAoQPbITt8tJJgJ5FnePr9odPaw8K3oiC0+yiE9lA9jKvntkVFhiv5XQJ25DKF
         ZN5P1+RIhJx0u5IvhE9guYOCOe2eWazvCNTUBF3U6zFAO/+GXXK74C5if1v0oYshrdlO
         2zu7mAjY9IV4uY3hN3rnHp3P9dHineILoHbc5b8TbSbJgxVz7egV6BUF1s3AUSVaCDEj
         eHH4VhFx8EdSsbLVOWP6IXS3ciLyhqjj1Nt0/0pw7gpGo57cMCxs+KkMem2HaD9AL6Bt
         hwJSnWHYKTknX8Z+mRayviuKFnJjxH6hsO8s0t6xaHVtZBL+INBEoHNu1FsB8v1MjOc3
         tIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epAO2EG8Q+yCBh9i+dO5JtNWsxsXr+yoTlOwZxxSwdY=;
        b=CIAbH8kSKd+CFBXoh2hV52FmwH5qysZKE/+MBFZLAbI33Rolle/ULOqlXUWcc5djB8
         RqkP2PBi925g03795QoWOhMfswq4rYLJ4yMPRzZelx1uVHjpDEPMsfq74ZVUTCc7cl3i
         2RbjlfXWNjS0vBNwNJAk/aLNfWJ2ffSAsw7KP5vpfpBGw/5vw33Gh7XTeoLr1X+z65Iz
         asAuf6D6J+Ze+GlxI8l7RpStPtj+p3FCuV4BZNKn/SYmrMmxA50GqnzoY9tMkvhwCgsl
         xy3UK/3lK1zb0/xKb5z9OR9LornO9uPjVBQitUjSpftZgOSdIabUw759YR3APziF0PTe
         vJGw==
X-Gm-Message-State: AO0yUKWobc64AviXze6yEvGd49mrdC3qHqqIFEIrWmVjLX+Y27n+fLVB
	y489n9VTqPwTSmjkBsPpRw7+V9RZEOf6/pOhaMY=
X-Google-Smtp-Source: AK7set9/bOaFfwRrF9a1QgnC8Yq3LaIAshySEA3tnkHP45pqyvhq89PL5Xul/ZlaE4tE0jJCObkg+w==
X-Received: by 2002:a05:6a21:3392:b0:bf:5d4e:1328 with SMTP id yy18-20020a056a21339200b000bf5d4e1328mr12768965pzb.25.1676150685933;
        Sat, 11 Feb 2023 13:24:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/28] oeqa context.py: fix --target-ip comment to include ssh port number
Date: Sat, 11 Feb 2023 11:23:51 -1000
Message-Id: <62b894d75fb3361ed4d5473ae69188bce390980a.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177038

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Providing ssh port number is supported too with
"--target-ip 192.168.0.10:22".

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 637919b9df0abc06da5b2f9b389cf25376bd6b7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 8092dd0bae..0c5d1869ab 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -67,11 +67,11 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 % self.default_target_type)
         runtime_group.add_argument('--target-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address and optionally ssh port (default 22) of device under test, for example '192.168.0.7:22'. Default: %s" \
                 % self.default_target_ip)
         runtime_group.add_argument('--server-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address of the test host from test target machine, default: %s" \
                 % self.default_server_ip)
 
         runtime_group.add_argument('--host-dumper-dir', action='store',
-- 
2.34.1


