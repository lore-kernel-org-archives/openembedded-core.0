Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD81C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.423.1652293203265242221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eJR39IOB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id i17so2653366pla.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XpeDrsqeoC5HQePnlGWB7nV/exYG6V8WnCuYbJ2yf4Q=;
        b=eJR39IOB0xAwu9MMKiPgnTx4PBl3bTV41Nwrz4w4Y8eeHiB9wdreK8P6MOa1/MMtvs
         3c3peNHjiF2nb0L/CB2SbaU8ysFi9p4QkpR2oFhiRU1SPIHXO8CrxriRzCD3RHlYOE6z
         1OAgWw4xkZY0PrqeWQBfFJhkqJz5T/9KhGgeSrf1cLSVRRu5XUluenQc3XK70W3ALdLu
         +8IThPWQnTSUOpCyfrHxZmzk5Vg9O/97UU9DNPNtQ953/BDURBspeeDWZwQGJr7U+XMp
         6b2BL4VsbMZAIBqPhXU8/O5rMbBjhRj+mjX/nAMaZMsmdHezl8sNQvf+T5QkxVdrhN2u
         /l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpeDrsqeoC5HQePnlGWB7nV/exYG6V8WnCuYbJ2yf4Q=;
        b=59jFSCP1NYEjeZArCfFFrkEmftlOjxTvlgMJzwbfJD1FtWIf0QhBMrgiOK47zMnFRr
         5wcR5xPsDCMqISQLZ7lbFKP0sPsZdQPDd3uhoSgkdq9uOhsE9gcLXyj6crKu5acnz+a2
         5WYXkGQTt1sQ3iU6fp4is62/kC2aP9vV1V+nOKYcGb9G4bsL/BrdeUiqixW1dIciZp21
         XCVYOu06BugTdOzsHo99N9jnv7Xt804y3bSC9BNPSkH3acQ/BRMW+/pXY2+41qa0yqjg
         sdXrIOCuZBNvaklnKEE4almdaF5O7y99DIRY9lD9n6CVyLMkyEE81V7zZjj8OdfMUqC/
         f2IA==
X-Gm-Message-State: AOAM531icrJMCchlAryhOXo1WBlDkJIrunawoE/GccClyfZg+IYOufOq
	58Squm7bmCrua2WMJ7jpqK1eNUDETDCGd46v
X-Google-Smtp-Source: 
 ABdhPJy1chlhdVtwTQXqR5u14re/ibugh6gdLnT2404ia3sz/NIZAJJH+RkJ8RXHST5krgsFFlhEpA==
X-Received: by 2002:a17:903:1104:b0:15f:bce:1a0c with SMTP id
 n4-20020a170903110400b0015f0bce1a0cmr16807957plh.149.1652293225714;
        Wed, 11 May 2022 11:20:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] scripts: Make git intercept global
Date: Wed, 11 May 2022 08:19:32 -1000
Message-Id: 
 <ce6e606ba8b975a33df2f3dc6104abed9cfa7a36.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165519

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous minimially invasive git intercept simply isn't enough. For example,
meson used in the igt-gpu-tools recipe hardcodes the path to git in the configure
step so at install time, changing PATH has no effect.

There are lots of interesting things we could do to try and avoid problems but
making the git intercept and dropping fakeroot privs for git global is probably
the least worst solution at this point. It will add slight overhead to git calls
but we don't make many so the overall impact is likely minimal.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af27c81eaf68ee681dcd9456a74cca6a9ab40bf6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/{git-intercept => }/git | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{git-intercept => }/git (100%)

diff --git a/scripts/git-intercept/git b/scripts/git
similarity index 100%
rename from scripts/git-intercept/git
rename to scripts/git
-- 
2.25.1


