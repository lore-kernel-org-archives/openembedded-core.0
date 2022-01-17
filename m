Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8B3C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 17:32:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.414.1642440731228844921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q5tAvZld;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so1200225wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oVbeRA0qi4EAxGpacgLJH2r2qB1F34eN9GBasJ1CxM=;
        b=Q5tAvZldtdwdQo3WfOsh93GyrdUfTJTq0YTEqnK4mRzf8big6icT98T4plyw0K7vJ/
         Phd9gS3Jaave6TKN1HYGpEdsvTlWAxJS1mqHwgfyTzx44sg4lfHd1fYBRHFE4LWZPUE7
         xKhxhfFi7vWcJShxAxdEBko5GSukgAYbuIGo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oVbeRA0qi4EAxGpacgLJH2r2qB1F34eN9GBasJ1CxM=;
        b=0T3EF+fDYvsKyfr5vLqzPdLRTyPHyHbvc7ivMm3NwTibAqmIS7FYuo+79O70xd3mI6
         SYd0rvvvRqo8wDBvknjN1FrC34hh8aXR2IFhXj0C43rYyNGvnAgUNQ7SSkeXyd7Tm/yn
         X5nenkADzEiqZ6ANrvG3Svgi5UrXZR+DKEwyFuMrP28zWyqOEYzywRPwMkLt5OA1dP8M
         W25eQkF8jc+leFnJ1dteJ4PeRe21yobkvUIxdAxgybZli67dl+Y/gJ+VNS6r8ECI9Eak
         mML+aGpqAt9vl93+aGnhuCHnQS+yk8LCZwWRv6/P7pZeh+LJpclfShgEIYNAVWmJJgyx
         gwBQ==
X-Gm-Message-State: AOAM533TjgE//d4tynl3K7c/IaT1/Q0Yavwy+sLqjESzph4G2TvbD06M
	LfERMddJsz0Ad1hE+zbCi+jmLOC8GkFFgA==
X-Google-Smtp-Source: 
 ABdhPJxeZ+h8RN06pWvTixcRYKQZ3sq/8EMCakRf+bzBP+8gVkNLhmThTZ34SMKfFKbnQosFJobr3Q==
X-Received: by 2002:a5d:6d01:: with SMTP id e1mr6489378wrq.579.1642440729154;
        Mon, 17 Jan 2022 09:32:09 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 o12sm6814868wrc.51.2022.01.17.09.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 09:32:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Drop unneeded libtool patch, we use cmake
Date: Mon, 17 Jan 2022 17:32:07 +0000
Message-Id: <20220117173207.1862156-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 17:32:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160654

This patch is old. We use cmake for building expat now and libtool isn't even
used. The upstream author asked questions about it and can clearly be dropped
so do so.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../expat/expat/libtool-tag.patch             | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/libtool-tag.patch

diff --git a/meta/recipes-core/expat/expat/libtool-tag.patch b/meta/recipes-core/expat/expat/libtool-tag.patch
deleted file mode 100644
index 0a0aed23e5d..00000000000
--- a/meta/recipes-core/expat/expat/libtool-tag.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 10342e6b600858b091bc7771e454d9e06af06410 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Nov 2017 18:20:57 +0800
-Subject: [PATCH] Add CC tag to build
-
-Add CC tag to build
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 9560a95..d444bd6 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -319,7 +319,7 @@ LIBCURRENT = @LIBCURRENT@
- LIBOBJS = @LIBOBJS@
- LIBREVISION = @LIBREVISION@
- LIBS = @LIBS@
--LIBTOOL = @LIBTOOL@
-+LIBTOOL = @LIBTOOL@ --tag CC
- LIPO = @LIPO@
- LN_S = @LN_S@
- LTLIBOBJS = @LTLIBOBJS@
--- 
-2.7.4
-
-- 
2.32.0


