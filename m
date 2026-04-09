Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE665F36B94
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:53 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144847.1775776306573280568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M0j/ce0M;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso15826125e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776305; x=1776381105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/Ye+f7BthEpP1oFiu0AFeFEWTFcP9JcHcob84EL8Go=;
        b=M0j/ce0M/qb4/UR2H0cUv5oIM6iTzZlOvjHjDk9SC1ktJmyszxx+Xn/RZKA5CKdi0n
         4+ah/K0oI/rkltu3uEQ7V4/r5x8yUoRKY0ppWLlJ69U3qYgs04r1x8S0QOwiC4JOWgRV
         LLOuEOwDqu6VKO+QOdwvYQXMQkY83qBRz8mhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776305; x=1776381105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/Ye+f7BthEpP1oFiu0AFeFEWTFcP9JcHcob84EL8Go=;
        b=HeeMVv1JNeo6weVBCjZfQebaePeS5TIVUPH7P7YCyGfvStRExZNT86BC9hlrt5yKT7
         PqwQ8by1U8nbowhXrxEiKMrzT9Hd/NugpU0rBRSsLHPquzJh0GfP/9OcFB22AVHE/DwG
         OL4n2CVNhlNBwB+Ui0s7MQ4k5bfx42VkuC6/LU/w2EjTtHELZq0S5Ue6r5RgbGvUXkrB
         vLdWnZEJYKRi2xmNyG4R3Ro4IWIuO5Yvxy4x4GitfFi+ryW5pCQDNjzTKIyLlHxyChBy
         swF2SAWJqqSG/ZvzseTfqWRf+rIrl6Qlqnyhlj8D5Ux/xbE2LOBGrJrzj/vV3rkurg+o
         l6aQ==
X-Gm-Message-State: AOJu0Yzu3M/JAnQ6RYhfUQZWgD61zovEKMvnduxPBQfY4AssOtQQrf1f
	ORHk6RM1VvcFNGcdUrfqtU62YZGQks89oXIET1GztQWqiv+bOvtBF0Y6V3uK2JBlmJZqMLhX+Wo
	ZCFL175TEID3P
X-Gm-Gg: AeBDieteSuALIWL8f+uLo5BC1pZYiHaLMhC3mic6OsycQ5egYT1Z6kpv8GQk1iPx3T9
	LspY90C+bnuYf2op8m/Zm7C0+zHMxiqRKgA1fI5TszpZ0WrL6gvVjXZD0eMuvncHhsMj/LTiImV
	Okk3GNpQffwPNjvAEr4lT2JFHzbtJExwKgfNpA27uNaCYV9Ib3zL0JelE9z49BUGyrUFwEWafVr
	f6utPZXPnGexXSn+oSUq8wGkw7R+dQwbL2foT7AhkOUBJlq4lwICncRvljYzFTYCP9hJtrenvzX
	NG8a9fMy/o/aB231jVCoLoPZiiIaF7hSjsIm5+OoSxQ2xmUfUckD9g1wLFszTPC+PapIQi1l5Ls
	V+UOtgy6XPBII1lVgHkgkXk9fxUh+t5taonCi7N3n/y6Uwhg6mh1hgdGRxzpA81DTRiKenN32Xx
	UHvtIeE9cAgZOcr0DTDqjX5uzfNqe9j20s3XFnJV9hegf8ZQSN4keZmkq3Z/5DacNQN69PVWd+d
	fnLPvRKsBdcWRo73QD2JnUyw9zz
X-Received: by 2002:a05:600c:5288:b0:488:b0a1:3cd9 with SMTP id 5b1f17b1804b1-488d684314bmr7661145e9.16.1775776304740;
        Thu, 09 Apr 2026 16:11:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 29/30] tcl: skip http11 tests
Date: Fri, 10 Apr 2026 01:10:29 +0200
Message-ID: <e6158f316828afaf167b6e67c3b6256888b33634.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234988

From: Ross Burton <ross.burton@arm.com>

These tests are either unstable under load, or just unstable.

A ticket has been filed upstream[1] but for now disable them.

[ YOCTO #15467 ]

[1] https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f8483887bde28221

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f1538518fd3a3017189b38437691ce358a2566a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 87e025fce12..29dd57cde1a 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -5,8 +5,8 @@ export TZ="Europe/London"
 export TCL_LIBRARY=library
 
 # Some tests are overly strict with timings and fail on loaded systems.
-# See bugs #14825 #14882 #15081 #15321.
-SKIPPED_TESTS='async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet-*'
+# See bugs #14825 #14882 #15081 #15321 #15467.
+SKIPPED_TESTS='async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet-* http11-*'
 
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1

