Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55C4EE57C5
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71924.1767125569152301026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S5qGzpZK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0f3f74587so145891805ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125568; x=1767730368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uF49ErK0nDuo5FrodHWB+3hwO6WuiJfBzSyysKIQosw=;
        b=S5qGzpZKAobGGXRjmdV7MBz/ZnJYATzaFg3k/QgwfOWAikMhaQXgXztJE1Daf60NND
         rv19jk8rVaoiYHCYr7+YrRTO68f1xoJgtVdOS/9NwMC7LyREfCak1jsqHTmOdcwMNNdk
         bm1Q80Kme/pl9a8weqJuBO8WhHfEFiDEDSlLFZAH31Qv9izZIGT9yeR2xqjf8/c8NxWE
         eU2H2vmrzQ8Anl+sK+S407RC1LCRr/LEabt38GetsmTE943cIV9mqNczUhB8337upHGw
         l5H1irc/VKvo9Rx7JDkp3QkEwiKLe4SC0MqpJPK0BU7PAKt7wX+VCCogomVZt8suneky
         1nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125568; x=1767730368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uF49ErK0nDuo5FrodHWB+3hwO6WuiJfBzSyysKIQosw=;
        b=CPsTeR9YRQ9fDAU2HqM+WNo8+1zxdQVdogWOQnVER7ZW3NFeGcHx1XDuGzW/LYv7Wf
         cLYbRqtfY4t82wY47kuuqiGgmTEuCscEwvzsgP/Vt2fx8iMuZhn6K/B/DkFVuQJP/B3z
         MLspM/6qIT6B/YhxDoptIcUZzEHOfuo9eXcu/C7SS5CEIb0hWvvjmXv+ziBL1rv7Wp+l
         lGuCyXJt4OUPNxSRYvUSKmzRIDc9U1sKMYPXjD99GpjfCM4YxbDKSoATCoi0f+0qWfaN
         9qDrcY8nGZfQUEmop+woLCi0d/gTBjGrJMx6R0STLltS0q1N7zy3m+ldZ/WKD6gLAXXS
         eIMw==
X-Gm-Message-State: AOJu0Yzh3vWCexDFMfUJrUlkSF7yjmrlu6PpwG5/fjD77Q+EfPiKGDzF
	AsjN5X42gYX34v2FETXiy9zcsbhUmVPqsVXIZpjBCchKvx512hVzXcy7+uqSmmPLQxN6PmrIaVa
	oqcGS
X-Gm-Gg: AY/fxX5YTu0xNxyEK/wGR2A0s/dTtrJy31OT5rFmil1GfRkiR4Yi7NhYIKyQg/giIl0
	whw0nP8MvnTtevJSKFmu/4g4mrJUZWh0Zck8i43k23BqlWLZi6GQROPlwuT4p8tUwyTydB1GFGi
	okOKBDHUhkSKhE/d72tpspIyADSA4IxVUUeWOLcb4NkuuGLkiv2V1PBDO+pSmDmycgVJOizBui2
	e3/wq+ND5pNPscsX3RR1rTxeVPtWmtfdIssvJulpDa4Bs7bO95qo1YPiItAOawg/3lgCke5WdL7
	Og56OjGxpZayandr8c8GJ0jJo0JbNW9q9Ve4lAH41HkdZyucf7DSVOVOV9rRX7uLtlUWtAHrfye
	fVUfgmkOIJAVv9PeKVch+0oByCQ4+FQLe8ihJTdw79tPVwuJA8C1fQEdfYr1giLaWAsMm03jaCZ
	VmFA==
X-Google-Smtp-Source: AGHT+IH3diN8+LUZAn/4FQQdf6ylEVm9qkXwHqfYKzWr4fMpeHjKqPqArhZIMmiXEw/czYq0VPRh8w==
X-Received: by 2002:a17:903:1208:b0:295:20b8:e104 with SMTP id d9443c01a7336-2a2f2a5721dmr270983205ad.58.1767125568426;
        Tue, 30 Dec 2025 12:12:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 25/29] mesa: upgrade 25.2.5 -> 25.2.8
Date: Tue, 30 Dec 2025 12:11:55 -0800
Message-ID: <fde7e5c1b997e6a24fe546055047889a3c2d80dd.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228717

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Pick up the latest (and last) release from 25.2 branch, fixing several
issues with the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fb953ee296577db183733e9f21d8fc866ec4453)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3124db0986..cf2c2a57a0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
-PV = "25.2.5"
+SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
+PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


