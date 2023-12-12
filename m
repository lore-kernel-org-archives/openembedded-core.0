Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91E9C41535
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:27:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2823.1702391265447295475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LC9NgF8e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ce934e9d51so3551403b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391264; x=1702996064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrtOtSCdc4weOrQT9KKwaWGd3NG5ykmm2segnHjB+3U=;
        b=LC9NgF8e2iQ0lvU0NzoDgf28wlfPqj1MLd2yZegzT8LMl5Y2lPbPILbdHzewFJtpX0
         1DQlxn7FROXWz2TBp74ClmMK9Q8XwxRyVfLpM/9ZuY1MyhLplzDsSNLPIX+6yPd8YP7G
         XmdEr9w+CgHnbyOLejr0YEvIsxbkncjeqI8/DIb5NozxhDmHRT2UIxr9ciD2NWhrc36G
         qWmrG0TYCC+jvX9H73lthJ8xgnKMy21vlFFzm3+vZWzjD9TK29G7dtwypLwNdAxes35J
         PFJKokfIOULHh2JVz/iQ2GnLY9WQOJXXnfM/yCEbQOnPTWPJ30LLIP+cfcIjbfR2d7Kc
         Sn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391264; x=1702996064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrtOtSCdc4weOrQT9KKwaWGd3NG5ykmm2segnHjB+3U=;
        b=FnIPY6LqDja1qDvR4lA11ah5obSJxTEFAI0c+wkdc+B2WYimjyS6xoDPNXAGbvvC+Y
         pCSGKKeMcnyX3OvR842GXlswZRX6je0hLsBLbG+spuMxt7/cwxyZhFFAC8vmAQ7MN8Rl
         zQAvwEbHuUBm0UhVsgOQQ7Dmjjcl+UKkopM0aJKqbw+kKpu2cF5Lhn8tQ+wEM2PbLnIg
         vJU62LUhWQ67yaUf4xGxhqo61GHJQCZx7iQNgZ5uFyYk+M2QdUbRNm+ESvGdpTEfG60W
         qkDwCYlWf9KXxfAhzYH/l1axe5a50ZatHQkMCQ7KABnPqcDJ9Z2i7JQZjHe0iWi91LYU
         0a/Q==
X-Gm-Message-State: AOJu0YwhTAEWe1z5Krq4yeXXgKyuHRdeW8SEtUjskoRR0cjB8Yq7p+gW
	EUtIyWmA0J2drd6xZ6g5j5uUf3ddj9nFgHojd3M=
X-Google-Smtp-Source: AGHT+IGCx3UQZy3v9fQJYSNltbbNs3yWKPrpvdCTPza1CrxhNTMT+ZjIFY/gUsaHMibWt40pU3+rdw==
X-Received: by 2002:a05:6a20:3942:b0:18f:97c:926c with SMTP id r2-20020a056a20394200b0018f097c926cmr3429649pzg.81.1702391264179;
        Tue, 12 Dec 2023 06:27:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/29] vim: upgrade 9.0.2068 -> 9.0.2130
Date: Tue, 12 Dec 2023 04:27:07 -1000
Message-Id: <75b48593f8e1ad9efc14842bf29a68daa7b02472.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192205

From: Tim Orling <ticotimo@gmail.com>

https://github.com/vim/vim/compare/v9.0.2068...v9.0.2130

CVE: CVE-2023-48231
CVE: CVE-2023-48232
CVE: CVE-2023-48233
CVE: CVE-2023-48234
CVE: CVE-2023-48235
CVE: CVE-2023-48236
CVE: CVE-2023-48237

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5978d565a9e700485fc563dfe2e3c0045dd74b59)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a37310afd8..6b440d8947 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2068"
-SRCREV = "9198c1f2b1ddecde22af918541e0de2a32f0f45a"
+PV .= ".2130"
+SRCREV = "075ad7047457debfeef13442c01e74088b461092"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


