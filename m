Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF18CEFD0C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 20:54:52 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100468.1767732882723513894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 12:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=e0woC7XW;
 spf=pass (domain: baylibre.com, ip: 209.85.160.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee1a3ef624so8865931cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767732881; x=1768337681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fOa6f33yPKrj0Taz4+fZKSJP3L7pWal4yWSulPuP24=;
        b=e0woC7XWiw3212LGSfFYVKUFEQ9ADF/W9FS5cZtEwbuvD5mzUaqNMhWJv+A2JzbABf
         CEilCmCrIgi10POPfhHiio/r7VkkQiKJUoWp657JKO/xCS75WFEcFbiKnMEdqwnWXc+m
         K1NIbqiHYXoE5415JQ2cjwxADE/ArgGn01ZS9uAuDe5xwZYHKNeJDavNrEmpd+NA9vtN
         Jpc4Npit9QIVfoM582hBmTpN8MFqIT/NkiAQHDoYl7rOVJRrfk0WLR/oOjaETGzlVLhM
         2VDCB3tOg0PKYF+P+K8Uom/1SyPvjZeXAl4fn4SDBTTaahykDz2dH8Ic8aw2/8y3Ig7U
         i0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767732881; x=1768337681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fOa6f33yPKrj0Taz4+fZKSJP3L7pWal4yWSulPuP24=;
        b=iNG1k6ZE9NF8+EgdIHslLbAJqx5X59A72r3WS3hsDvV02yvj3QxkyqI8RudHYjhf0y
         NdL/0oX1x7j3uYVkbZHXecbosZEuU1/a7eZeplEb+VDjZ726F4qh+J7nyQM6dxMVWW/0
         9dl6dYAFWs4JIGkvp7bdSAQuqd07m1jIlRISghichftBekAuhHdAxE8IZoZTy06BSOQ+
         NRChW5JO628KqHVq4boU4OL4YGNCaKonlvG54TVp9/QKyCtW7TvP5L2l1JVnd1lZ9PsG
         LXXcr42PzTC0ukwL0L2UTM2Yl3xVUi5uSCK3eaqH7j2GX2s5qzjdGN9LRhQeUEopFl/l
         I6CQ==
X-Gm-Message-State: AOJu0Yz+jXmG1Om6JZ+BF0+24OrfF32ihABxbr3lKZQltJ+eQwEH15SX
	FKJeaqKzZvMZC6/2pBsLRGV712VSFc8MWb4KbqMtQ+oiGOYDbabZ+cKzUbRhMRiLmllSbcBZ442
	Q/aZch8Q=
X-Gm-Gg: AY/fxX5Y4rl9q+dzr51cB6gORo5Ky5tA5N1Yb8UQfIMEtEybE7r6NM20Yq90R5uCm8h
	v6q/lNnGhzTuWukvABG6N0W5CXm/Kzc9Pw7fqlhNrloEKfc0xdGtkbfGgTwxHf3KKcMlCWiLTwA
	F29NmpKpe4qBk368LlsNxqpRDQGjJb//dTMpi8MEBDzyekqOUjQM3bHvygUZRjJBROoedMNBKJD
	Vt170ykS9b1qGCT0ZIYDbBBV/PIHOrl/t5SYo+JlNRIyTt7OoU2ABKmVjMkPLdS0IoH01Bu5FNW
	Xq5uvGw/pxKQ1HWP8IR1tgCi2Ckit1K02EJMnTzCRLgl7ZpiMNn7x9Jjx9pAABdVa3PUr5zZnbc
	dNSx97fxELZXyen2eYKU3dpEs3FsBuveXBnr3kr0PHOPVtQTW9a2ENgAk6HkMReFMepK1El9R22
	4F7ElNG8MBQYydwLk=
X-Google-Smtp-Source: AGHT+IFJ+HWLsI/3lkjItVv+COxxVYzQ78uKrTWf6+X4IFQsQriHe3iqc3JuHx1eQfARlcZixSMA+g==
X-Received: by 2002:ac8:5e08:0:b0:4ff:a9d4:8773 with SMTP id d75a77b69052e-4ffb4afd0e0mr2906141cf.82.1767732881097;
        Tue, 06 Jan 2026 12:54:41 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d3d34fsm17612221cf.4.2026.01.06.12.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:54:40 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH 1/2] piglit: upgrade to latest revision
Date: Tue,  6 Jan 2026 15:54:37 -0500
Message-ID: <20260106205438.994413-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228930

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 060e287f26..f8cf7aa889 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "a0a27e528f643dfeb785350a1213bfff09681950"
+SRCREV = "62d499d63d2b8b29a67efd9d93ed9b6a94d4950e"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.52.0


