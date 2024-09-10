Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C261ECE57A
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 15:01:55 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.25904.1725980509862782448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 08:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YlIDrtnr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75aaaade6so36426781fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725980508; x=1726585308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3S/xWDYYT6aXQfJigpAm85pXojspeDZChpWkYUa1Svc=;
        b=YlIDrtnrNWfVHRJKlGp9S5SWILltt/SP9hxEDkbTVg57Flz5mZL4ZXROTDmpWdsJaQ
         P4fod2+GBTis/v+6CyRCBkirS4EvNtCarOfFAvMv/47Y7+MFTOyx3KEEXgl0EQcWK/jK
         Mc4PQ5MhKkxzwYRqpgubMjgeJ3jA1RRNDUZc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980508; x=1726585308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3S/xWDYYT6aXQfJigpAm85pXojspeDZChpWkYUa1Svc=;
        b=HUy6rbdrQgfydu8LjNNS1dTKqdkc2FqFTyVixEhrDP/O1afc4QV8NEEOI2rKu6tYvJ
         +Ae6IlvZVndfR9tayLuHmZJslnV4t6qlYggWaldc2/z+Scz7TMeiIpYPdYu+o+nUz5LZ
         3GJnPW6Aj4bjFjWaS+ORggb+ONI32v0XxuKiG2FCGMsCSpo0JJNqu/v1l8OmF8RppQ4k
         848oqbybm/byDS0DaiPUiEaqC+6+4abNQb5sVftpbFgG2rcD0ZrWyTLuSAJeVJ1HNsEf
         2yPzrWPqhR/53kCba+UL0WAWlHt/S4uIH9EPyEYa7TXzslfjpl/QQ/NrcuTbdW+pkvWM
         NP5Q==
X-Gm-Message-State: AOJu0YxtlafXa0bDgD61wHzjoxiZQ8Uw9ao3cvJ0Nwe0qanYhz70DGli
	t2ReEw/VzEr/DXvO0S1QkFOFd4z8TZ2ORWwnyY2AjK+0m9GbRxJJJNLCsxB62BG22hqt0uXpFPr
	j
X-Google-Smtp-Source: AGHT+IFrEzm/dN1/fe7/1hZAWEojkvDws91ZQFJS6zRttozNmm8BAHT4oM542F0Opo0WX5sCfR4D3A==
X-Received: by 2002:a05:6512:4028:b0:52c:d905:9645 with SMTP id 2adb3069b0e04-536587aaf0cmr8986355e87.13.1725980504783;
        Tue, 10 Sep 2024 08:01:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:589a:f003:f773:164e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a73sm116072995e9.3.2024.09.10.08.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 08:01:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ruby: Make docs generation deterministic
Date: Tue, 10 Sep 2024 16:01:42 +0100
Message-ID: <20240910150143.2816039-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 15:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204356

The presence or lack of nroff on the host was changing the doc type. Set it
explicitly to be deterministic and reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/ruby/ruby_3.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/ruby/ruby_3.3.4.bb b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
index ebff4136c9c..d39b7ae5206 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
@@ -67,6 +67,7 @@ EXTRA_OECONF = "\
     --enable-load-relative \
     --with-pkg-config=pkg-config \
     --with-static-linked-ext \
+    --with-mantype=man \
 "
 
 EXTRA_OECONF:append:libc-musl = "\

