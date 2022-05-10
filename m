Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CE0C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:15 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.10898.1652193608536365606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VkN9yugj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id g184so12309103pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XpeDrsqeoC5HQePnlGWB7nV/exYG6V8WnCuYbJ2yf4Q=;
        b=VkN9yugjeztDTz5ksU9aocAuYFRSmakq+RqLgELNth2JvAftc6ErkP6UZCvFXNDx9Z
         WUUkF8axCIo90kh5Dth1v2FRYXchmNMBP+M0JJr6lGumtGKL5yZAOhPHtg33YV/dzdha
         z10MApxFXZDYcVE650EbEaOlm7vgoiGB1smpbb2q9cu+p7GiVrct0stfldzcQ6DXnflO
         4jChWm2V/i5e5SZJ0gtdq4hF0yltUC9MnA0TkPLdPu5PD/KSbWO0+qmW/10F4kw9mH5F
         iLp1wm68URgu8t3HqsaF/XZSJsgl8q0eDPcFzWTfu3s8meTYWRIHuiuMgNkES4EzmmM2
         eUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpeDrsqeoC5HQePnlGWB7nV/exYG6V8WnCuYbJ2yf4Q=;
        b=A3gHBFFVb23+cizC4uMEOTJI5zjpaS1jYIKqpqm58uGorLeBAt6qmhTQ0ZwYCU6NKD
         hv3ckBZax96hrLZb7w/36UZTAlGlyBB+DXRL/oTTiIsxvDpVkQ8zsgiclCQlhOSzgqZD
         mUQhvqONcTGUMCaENJAHG8/t9GvbWvygoewxlZE68K7s4Gym1fgywsPaijsNP73OQHWN
         +ouKg7tDshhac2upOUXAwZPXnQVe2ND5AXLLoKPbVpzBsqZRWL4E/l77Ds1h0MdNNpsA
         +Iv3ldaPAIVBLo/nLRQ8Ijd506BN7H15tn5JBTrNuQlTbkDwVaacn58Y/URuQhGAYGLN
         6SRQ==
X-Gm-Message-State: AOAM533/YKZOP5QK0yIBSgpSMUIh7O/oWXK4J0cUoup6EbsCSumP4TCB
	NnsKG4Rmy/URu0iBRBtSLdK7sSW4nMgkjW0B
X-Google-Smtp-Source: 
 ABdhPJwou7sJi3CqJ7kt5SPpRNq6iAXkf6f21tIszMp9e4MftBLfzcUJknfXPfHeQJtKwN4BzYNj3w==
X-Received: by 2002:a65:63d0:0:b0:3da:eacd:2033 with SMTP id
 n16-20020a6563d0000000b003daeacd2033mr3099643pgv.387.1652193607320;
        Tue, 10 May 2022 07:40:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 36/40] scripts: Make git intercept global
Date: Tue, 10 May 2022 04:37:15 -1000
Message-Id: 
 <07f282fb94a5a7c0a3fad451c844e5b26074c744.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165453

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


