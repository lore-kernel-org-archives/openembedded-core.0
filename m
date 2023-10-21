Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80412C004C0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.81423.1697902131006344115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tSQDgQfH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso1478149b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902130; x=1698506930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYAws4fh5tg8x3EywH73UZu88qGOyeqqo3aIDJZkmQk=;
        b=tSQDgQfH1+D0pakN/SfMPyJPzVnz2HehP6rGkFYUrGFAWIUGxVnLVSYt1rXlZDv/YO
         mhH3bXAhbiC7oLeMKWNzg5tnLngCNwNsKs5NTN5Kl7ccnIVniGJ3q04cQkz0sRlDQPwM
         83JqUVCtaValeWsa8IDuDqByhqly75FhFjbQl9xq95HVwJWtgtU2i51OWSX2Eed+Kcvd
         HVK2aZlyQxipPmzki+hP6vTX8biMmvwG20Qx6PQ8rtY/34Pf9QwXh/yc0vYJ6BJlMepo
         lcvYD6Fvt9Nkk3eJIOe1luFOkQIeRU9KeP92ScLrogrbtYA8EiPuOkFNDEIebP1pbDe0
         mmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902130; x=1698506930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYAws4fh5tg8x3EywH73UZu88qGOyeqqo3aIDJZkmQk=;
        b=BMu2XWVjjiwRGt04PFnm/VXLvk59JnpJq0TRcTdxp9kyD4E5zUJwj+8ljb4GsFLzbR
         XlPy6IHSh5IX4i18SFiFnAiN6dfc7Pp4B5aGv3lAUzCE58TdGZzW6Lz6GIyreRzfQy0X
         j7WqpD9u95MaEYpo09pbfmgvl5EnVJRIqvepp870sapZ6I9NzwTrr+dmkYsYZ/VUvd5H
         OuZ0mmnhAC0bmIB7VP4pjbEGbwhOL9Oek8Ha+wWOvQsuhOTE1R/iiwEOYO9yYDFU6Jxs
         6zNJj1AmtuYDwR2d9WAywpa9wzhuGtEu36XxISAERcko03c2uIGG1V2//8NTsV1N3Nv1
         PCXg==
X-Gm-Message-State: AOJu0Yygoh+pfzzPo9JVD8lc2BcyJdRCWmn+YsdUiu/T7UVgEpX2+E/P
	1cArBrZ97pn/+jcsIGrPJwIuo5JauODNMsXLiy0=
X-Google-Smtp-Source: AGHT+IFW3WIoaamN11Kq2ie3jgPHKcuXOR1bSB/7vj0Ned7rauXWBmlDnQEm99sPnKDYEyPBl6/RFQ==
X-Received: by 2002:a05:6a20:9192:b0:15e:a8:6bb4 with SMTP id v18-20020a056a20919200b0015e00a86bb4mr4117309pzd.8.1697902130126;
        Sat, 21 Oct 2023 08:28:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] vim: Upgrade 9.0.2009 -> 9.0.2048
Date: Sat, 21 Oct 2023 05:28:32 -1000
Message-Id: <7681436190354b5c5b6c3a82b3094badd81113de.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697901991.git.steve@sakoman.com>
References: <cover.1697901991.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189593

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5535.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5e06866692..58025828f2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2009"
-SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
+PV .= ".2048"
+SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


