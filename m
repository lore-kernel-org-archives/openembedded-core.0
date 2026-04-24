Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65E2FB44C0
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31962.1777064204152118670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EWUgwMfk;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so103614255e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064202; x=1777669002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7g5RmySy4thRGK3jMwVlFKw6UPcgoD+tlmxp4lnHxU=;
        b=EWUgwMfkZTtBxZI80klzY+HIx5+mdFrgVSwg6SX1fkAiarHNVz8dkl0Tq1l8MqtQc3
         xJEzMkVB2OXQLqgBHBE7yJR1u6mo0tu4YLlWLd4y1zf6NXVjXUbOy2m0Q41Mk9NgNv01
         yRIELZNG/e7ZOnt00b2HLHaYZFEiJfUusqQgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064202; x=1777669002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7g5RmySy4thRGK3jMwVlFKw6UPcgoD+tlmxp4lnHxU=;
        b=lXzHxX0l8u4W9PJWnxH0mS7FtYW1mXI3tSPuizIELKp/lQmRP7lPe5A3Ad6PNQ+Rae
         hBmb93KDD22lM26u9FfD/WxAU3U1VaMrnzKsyp1RhpjEcsqD2WY/n3Vd4RVSXR5l07zm
         O1gkl6gScrO66paxVJYutJU/RoXDpDl3QGG/obUAQZaXWS1pk3Kov5kf5lMExdzkoIIh
         WHesBeOcqXxom/y8w5AewYSVdM34DhmIamn3HABbpr1WXzaAiG+U7vFc+A8nUnW3E8IL
         QBYHbPpWzo6gxuab4hzbidDPEekV6FMZsbcMZMmEICa6SiUP86q35J/oAFTkR40+78Lj
         dwyw==
X-Gm-Message-State: AOJu0Yx9uLUsPsdKL3HDiyNrA1JVTNnGcQTXZrgFATjSbCRciq9kAZCv
	urmPaW2nwLgxTQxd9MILqmlMMz1bJHH2LSpJZAwcwTK9+N1xTFdfXx0is9/wyqINEcGSbQzrw5Z
	cUQGOZ8FlCe3v
X-Gm-Gg: AeBDietXC53Qp27kKK2El3xJwWqce56cdPRfyhWY1Yj4nDYn+WLXJVF5cuvdn1369U0
	cJigt03xtZV60RHmm2OZEz4jdIpAT7UlI8S9+MU84FqGw3Mbx8JOwAgi3xUSoKzDqvPXcakRUUe
	6ppoTYxWeqiGXM6V83OR5bbcsNrg4lI4t0zR32mS0GoYVtdZCSx1dxpAsINVkQkf8ria6WoI/L6
	oS0DhoTDbD4bPBJ+EeM7wWsSbP0UHBaqf42fqNK2fngn1jy/okVg0ibHmMLqKw45KHDNoZRojZO
	fna5KOSjDzzcIQPNrdqQN5kZ9pCOgUxx/vToxGh6hqJL8/Do+NNAkJh36e+YKfCElx13b3eIP5i
	T08KgOUa53Pezrm9nXFlx72yOXEyAJOOr+f2PaqGUegcn3b42M5nfLYNrKj7+P4OWgyekEbtVAl
	dj5fTWSWarO1vWn5Q0ee8XFxQrDEYKNoNEh0ZhkGYXhcyYwrfu/VYDjazV73FXm+6ih0ob2EUsh
	AwnlKg5j+c6zhPb8OwuTt5Sf+NZ0QuSv1twVA==
X-Received: by 2002:a05:600c:34c7:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-4891c32266amr340024295e9.15.1777064202189;
        Fri, 24 Apr 2026 13:56:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/66] tcl: skip http11 tests
Date: Fri, 24 Apr 2026 22:55:07 +0200
Message-ID: <96574e448abd040743655fb29cd1eeb6735e9df2.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235881

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
 meta/recipes-devtools/tcltk/tcl/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index c485e535c71..8a4edfdda39 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -19,6 +19,9 @@ SKIP="$SKIP \*io-46.1"
 SKIP="$SKIP io-13.6"
 # 14825
 SKIP="$SKIP socket-\* socket_inet-\*"
+# These tests seem to be unreliable:
+# https://core.tcl-lang.org/tcl/tktview/3764f4e81f1483ab554c6d60f8483887bde28221
+SKIP="$SKIP http11-\*"
 
 for i in tests/*.test; do
     i=$(basename $i)

