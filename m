Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFB4C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:52 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.43678.1721740424189042124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oHxmhjkO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb52e2cb33so2960040a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740423; x=1722345223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MG2a/j1cT0vXQN4AgzTU+VBJaoeUA0NADzjhCsK3P2k=;
        b=oHxmhjkOkvpPdao3KSAiwiPSzbRDU5hwnk8Z+d4fS6Z39flVuXVOSUm50h9HyQBQR4
         JFAuZoPTurr3kn7AnCS+MIY7UVMbc5ZrqmQ5MK8Sm5j1xSNz6+nMwDqIhRN5870cmZyE
         KuG4tMqoCrnbIXm+Ae19+8tJWL9L9bP3UtWaDwwGmDND9b+F/9+HK/pMK0f9UFHYS5/Y
         HPZ0R0iesljFFgL3dif9aa5suCABxTQWrIA59BaRtkpudLkOUGbsuXh22Znq/m1V/S8X
         XZ60erQsvSFxjNhg5hVHkbt/TYqLb9QliE/qj4kRVnpgR48pEzdpK/KpkvKL6Cw7P/KO
         XinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740423; x=1722345223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MG2a/j1cT0vXQN4AgzTU+VBJaoeUA0NADzjhCsK3P2k=;
        b=s7Je1uNN4eUpqACt4jKziSxRRd4xuGkHcEPtLRv7yAFWDI9DG7tjdPQ7Uy3CHpM2HU
         uIxbESvC5kEC7rfZTvzhMVCocI3eMjNUI5sSrYlOVx1lhK0eMDjn0+DthDMLDOWJjl8G
         xq8csdCnIExWVYuMw/0hk9dHY4iqX/epRYEYjDg+b92cxzo+JPtCbZkvz9YwKrOiXgxD
         9ht0lAwZgeBM52z/Pp9ZRfEOF5xv63kyTC6d9FElxLsFk/nBC2QTuivJ0y/yQb1d1WXL
         j17YhrEnmeHhueRtnEW569Mvn9qG/JDpuhyZE1f7xI41Dy9Qcf5QgzYbitFev9/YBuey
         HvBQ==
X-Gm-Message-State: AOJu0YwgRuBn2+2gKY5C+np3ulbmSpu+njqpwSUSmCu+L2Kum/5mhS4h
	EubYVliQbsxdrH5Uxoa2Rx8OzE62h7xLjwHpyTWPTjoY4ljF7iQgm3/ECTWFUeXh9KSboRC5jHM
	zk7Q=
X-Google-Smtp-Source: AGHT+IGwd6RL62pHjRm54YscRaBtUABB9LZrhRS8jl4xx5kyTmKDgGBBP/6ImV7tM9cR5GLxkt+LPA==
X-Received: by 2002:a17:90a:1786:b0:2cb:5455:8018 with SMTP id 98e67ed59e1d1-2cd27434d7bmr6049304a91.23.1721740423388;
        Tue, 23 Jul 2024 06:13:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/17] layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Tue, 23 Jul 2024 06:13:09 -0700
Message-Id: <9d2eded1d423a24a8fa811f26d501bd68cd7a1be.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202355

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This rebuilds whenever DISTRO_VERSION changes (i.e. any commit is made)
and systemd depends upon it so lots of things end up rebuilding which
isn't necessary,

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 002a2a9d977ed5b86138333c567d25616d38c60b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index efbf2610f9..4d09619a28 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   ca-certificates \
   shared-mime-info \
   desktop-file-utils \
+  os-release \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-- 
2.34.1


