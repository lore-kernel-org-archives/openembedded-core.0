Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5983D58CD0
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:25:20 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9698.1774236312912474912
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUqvIY5G;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506aa68065eso36300961cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 20:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774236312; x=1774841112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8JrU1mHh6UKPWGlJjrKs+8JnMsFdQSdNZYqX7g7+J0=;
        b=NUqvIY5G9hg/QIWFtaN09qUwvA9PZqwJQJ7AwwL3owL5S5iQvaX/PKSfl4dTqCy6I8
         Z18xZOj/0N4B8Vg7Cvw7n6Op8PTiUE60ZXxHIoUapYqBwwUtSGbPRIMVgfx9T9dmaynq
         8Xa2w0v7kspUvvFWV0QVcHE/wRILSSAHyywryq2IfxJ3a969nJsR/7wN3B3IEI/JEmKD
         CwcqmshqS8J0/OoygcC2K4FQOEarvKP16IwhL80lEQinbBIsU0pzrefdeQO/MJZp8K64
         lKlrQapApZvFLO+gkF4gwk7lOj3T5HEk/rcW9jWqOdNi/9gBP1mKDxnUxDRA7ioIswVc
         8+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236312; x=1774841112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8JrU1mHh6UKPWGlJjrKs+8JnMsFdQSdNZYqX7g7+J0=;
        b=Fa5cYTIe5YgiqxMS0w6psa5vnmF18hg0BuaWOlcBnete3jvBEcc0ks0vjO2wTJx8g7
         wYGfnThfKW3N6W3C6TwvUL5u1M94tAZcvaY0Nj7f2s0P+FcUzf1cf3oc7zCcbueo9BpM
         pJ5+Luk6qZe8LfkIJKVpQ2w4D5GT8YF2SeEUrwCfvD6xdlPrpIx7CC4yXtJI8ZkbSFuh
         bglobamJPweeH1l9vYSIxZmMx3YU9FKGjkPWQjYZUDbx5sdE1c4yBTND3IjVZpREU/i/
         jc1bEuXEJEan/VeR8Qd8HYsrzBI2m84Cea7696HkeMNdgSJjG4sEOYkeXHcvxUDciT4K
         H3Gg==
X-Gm-Message-State: AOJu0Yy3wE4e2Enr/IF4e7JhbHmFGeCr4oJLsnL7M7iXZuugy8T9W6Ut
	/B3SiKVtQthfQwVXeUD5dlKE7J+Mq0uWeLwHY/JOK5x/mR0LejdM0AX5
X-Gm-Gg: ATEYQzxHZVmKGH+IFzioYGL6Kj9HL/IvSFTMpqoqPcDqHxWIO4qXNxS3FKvzuiv3Rw9
	B6YmDnXWp76ZIcOBrQI8iwGB2aMO2KPgueEStvY97uZnMB4VO+Oy30q4V5+TeZjTqgbRmZItOLf
	vlGHJM350voR6eEOMXjtswK9CDqH+6dCP25XO2J7qujrumbmMG9D89kj9XzgiV7pKrnU9aLAHh/
	LV36RceqlgETAclPRcQKJnpcUdJ8X1cP8WcXWFXKdMHy7oa/IkP81wdP9fJIONCQWs493ufR0Bm
	nLdy6bUhFiVw6sRinUUafT02+BBYWL5YGsUqmGY6dbUvzjUYiY3Q2TdBWMDRgNp1zlvj/1Jxpt7
	ngkrJQl2M4h/U0GScEJw9twnWkhvtYPmRdyJdRVI/O6Z8dbg+dUnK1zNqc7pSBEj65pCTkX+G4R
	bnpCKKwG9Ecz6DLUy8DjCQpApHh+17MXqual59/PiuCJUwXPwv8ItIzxiAL2RO78JtY9FTDZRtb
	PhDSzgfr7oVAS6dEgzKXXHub++OVZDJwqcfRmRh3QzUgrjZMO729lM0SkM=
X-Received: by 2002:a05:622a:480f:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b3d9f3a40mr163466541cf.44.1774236311840;
        Sun, 22 Mar 2026 20:25:11 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm89352351cf.15.2026.03.22.20.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:25:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 0/2] linux-yocto: -stable updates
Date: Sun, 22 Mar 2026 23:25:07 -0400
Message-ID: <20260323032509.1590084-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233691

From: Bruce Ashfield <bruce.ashfield@gmail.com>

I saw Yoann's message about the last kirkstone LTS release.

Here are the -stable updates I have pending for 5.15.

Bruce

poky (2):
  linux-yocto/5.15: update to v5.15.200
  linux-yocto/5.15: update to v5.15.201

 poky:
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 26 +++++++++++++-------------
 3 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0

