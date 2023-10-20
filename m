Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F87C00A98
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.57872.1697817123180517256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NvEpC7WO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cac80292aeso6399295ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817122; x=1698421922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WGPZl6Wo6VEw+/a/4YEtvZKMyEoNlFXA9Bo3DERcEE=;
        b=NvEpC7WOeqPy0x87uLdHn2R3tMFoslbiqocFUqcUKEXjzIj88jdlOwTQ0m6DeyDZCW
         HsGxzj7kpxyD1YeGFfTjxMtw/nhXp2fiLPNKqHq0dET8eNaWFPfS/z264rthb413S4ux
         7S4LQmLywL5PnjmgZzQtSLKA7oXHKD3R04COzeXSevjo6E9kJpDElsASA4Iu6TCPFYol
         Cn6NrbmgQyDfB9FH7tRGNQSyy8UdBgXDcMa1HRUqf9BPE5nCrKNWb2t9f6ci47CGhyv/
         5VGQ79wHbC+cgqvk1hbqprWrDCkm5sFozxIf1W5ycDm9sqxGZPaVUAViz2femiSduOOH
         XgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817122; x=1698421922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WGPZl6Wo6VEw+/a/4YEtvZKMyEoNlFXA9Bo3DERcEE=;
        b=q9oB0tTUKBh3/qoUdr3GKqIEG34LbMQwLfvBLo6+K2PPNXyNS6fbVJql7+lU4SothU
         XBNdKh3ODp2LSUNsYo++ylQ/2h50dcUXdqFf84EZ7zAPPPyeRjlvU1fXbgB+ZQqHU04R
         nI8crynG+NvylQcYA7rXy/9TbgucUVFnoA+zI8AllxyvV+0TgCbiNGdEVwXatbQXbzFN
         /AtkMC1WBxSlXLAbgHaXRQFreAsvHjo0tP7OpbjS8gQtRhg2/5pMBhJ48fubuirFazQR
         4ET/PFSoRp25hME3gwrNg9HVWNe/qtgKShD3HHWInLGuRusDl/CyZvyv6zCajcITYiHw
         F77g==
X-Gm-Message-State: AOJu0Yy4LLGRma/XcI39B/ONSweMdsadtcMvCV2b7tU4t4TFcw9GjXkr
	rNWHwFBML/yoQct7hiCJfdwo4OOxp+2Pn+K/caU=
X-Google-Smtp-Source: AGHT+IFAkMOe+uliaMiEWEp4m6iO/x8LaZyZGperL4AVykoc+tvcyewEcvtNUX0KI0aficNrOJgnNQ==
X-Received: by 2002:a17:903:120d:b0:1c0:bcbc:d64 with SMTP id l13-20020a170903120d00b001c0bcbc0d64mr2364650plh.51.1697817122262;
        Fri, 20 Oct 2023 08:52:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/24] libevent: fix patch Upstream-Status
Date: Fri, 20 Oct 2023 05:51:18 -1000
Message-Id: <6afee5ac3b419532d290d8a0c533e5d144913e92.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189561

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c987afb2054f24d9bf86305774c186a6e015a8f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...test-retriable-tests-are-marked-failed-only-when-all-a.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
index ea17e876ea..26b707ad31 100644
--- a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] test: retriable tests are marked failed only when all
 
 Fixes: #1193
 
-Upstream-Status: Accepted
+Upstream-Status: Backport [https://github.com/libevent/libevent/commit/3daebf308a01b4b2d3fb867be3d6631f7b5a2dbb]
 
 Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
 ---
-- 
2.34.1


