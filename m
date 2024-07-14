Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD237C3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.15277.1720960753765836841
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LNDxj9sa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fbcf71d543so22844285ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960753; x=1721565553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDxzWWqEt8SOrGBuIbsXq9iUNZZsVeGwVw2hirRdyLo=;
        b=LNDxj9saDDf4JwQ8B/yX/z2P65hnUQ4cO4STpHPQSpLpezjaUb0wJd+FAyYjPukD7w
         sf9X0AP4XJ+aowoRxOtJT70vrxUvBaY/LYA+OvJLgpwmPAi2iwEWGIP13TX4wVY8Vhtc
         GKdl4DuZsTavO6R6gnYc7TI6r2mYRv0u0FtmYvs9p4m9c2iQVSTjr46NMmG8USc8nrYT
         fF9+OKwsedwZiPJzMwgh2gv8bQYkkdh/fxbcbP/dGXCR2sGnzYYE9+BQ5iXaMqdp6sYc
         Hm51rHcNNf7Q56pNO+Z0hCzqAE+IpgLFwlNBNPgr//ggpc30tE8iOQ+4ycwvCI05u6aM
         ILpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960753; x=1721565553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDxzWWqEt8SOrGBuIbsXq9iUNZZsVeGwVw2hirRdyLo=;
        b=k4N64y5dfDzGVRClGvTyQulIgax0Q2s//aIgDB6pQa10oBUH3PgQ6L+xzgD8v4fG5W
         COQyjHi0vNZq8GxfpNpOYGlv2Q5oss1yJidBmHy9xLw3MpFmwKw2JwiAJqCFr8XQpo+e
         Led7UW609JE96LSdJLyF8REfpXbSAaYTTBacLKPmOmlCpo83F4PcTvvduh5ZhAOSK37I
         I11jmP9/t7/4xDIyum5qFPnfNJw+5rQ9jDIU+0HQ1jvm6n8g4o2KfHAP2+Xq1ltURwuo
         Xzv01NOgOpjfyxdtz5CSYhQwqSMUf3oQqN9orn/KU78JHyFWJBGgcyQR9dH6QzRnB0QN
         gmMg==
X-Gm-Message-State: AOJu0YxgIU2WeUjCD2T1EKXG9sauS5Vif89thPDE2yW+7mnxrOKRBATw
	s5ZJ49sXNVttbGiA1M0Kt2xkM13pQk/tr6hK2WiP+QT7vpTXwXwTDemYs6UhwpKREzj9Gtd2DS3
	wGJE=
X-Google-Smtp-Source: AGHT+IHHHi/aG6bRw+7LdaPpihcEYEaWhj9lgwM7PzrNaBDaqdL/OoUd29yyZedrzO9pumjOmcPEIg==
X-Received: by 2002:a17:902:c946:b0:1fb:8797:beff with SMTP id d9443c01a7336-1fbb6d2ac74mr122581485ad.36.1720960753080;
        Sun, 14 Jul 2024 05:39:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/27] ed: upgrade 1.20.1 -> 1.20.2
Date: Sun, 14 Jul 2024 05:38:35 -0700
Message-Id: <2c473a2cadf198262d06ec5131d111cfe15cb7ba.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- main_loop.c (command_s): Fix g/x/s/x/x, which failed to skip the
  final newline, printing lines twice.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d726710f7b1d707a55777d486bf06b0021f9dcfb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ed/{ed_1.20.1.bb => ed_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.20.1.bb => ed_1.20.2.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.20.1.bb b/meta/recipes-extended/ed/ed_1.20.2.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.20.1.bb
rename to meta/recipes-extended/ed/ed_1.20.2.bb
index 9ae53002c3..2b78b080ba 100644
--- a/meta/recipes-extended/ed/ed_1.20.1.bb
+++ b/meta/recipes-extended/ed/ed_1.20.2.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "b1a463b297a141f9876c4b1fcd01477f645cded92168090e9a35db2af4babbca"
+SRC_URI[sha256sum] = "65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.34.1


