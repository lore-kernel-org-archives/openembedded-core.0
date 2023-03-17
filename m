Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC80C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.495.1679093001555243155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xzT0PT8p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id bc12so6219614plb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679093001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjA7poPXi78Xq776K31BaqBi+vHlmIg54HrfH7uRCbk=;
        b=xzT0PT8pLQRgWD8mClBCapYy854OVoQdZq5/gz367ukc47xrxOT/wIbByGZC1ij6U0
         EgreA+SWzcgqKp6sipJYiGoNY6I+C+xDdl4cL+Vor74xTnWJzgwT0xg44Wne97macKXX
         et3aad8h7x9LwcYF7Y6L2xH/SgNCcxHjL+ZOu4BwGUFxoN91RS5pW9knhm4uA2jUfvyL
         SIxUIklr6Q5QpYM6BJBVf0u1NPd+UCPHteX6d6hVF/NHxX+1gyAZR1Y4Mtsk2y/eIe0W
         qwwxT/I7QbAINggDPTtgNNqJWLiuj76KiJtMBF3THf/NPAQP+vOC4e18ffZ3OUfpsKS6
         Ju1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679093001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjA7poPXi78Xq776K31BaqBi+vHlmIg54HrfH7uRCbk=;
        b=XVnSMSUyCmWpBO5rbvV6fFfynyE6B9wafmn1oyyI6IXwzlVIPOLNojI5/QGmayfSf1
         KcN3EFDehkWDpliFdODu5KXJfqIlRhkqTttsiOIqJb8LW3z3DmGmwQYmwLBeuv8Pf5Bf
         xY1rSw49poC2baOY9roLtWzFGg8iJ/VUlNEUp8e04MVtG8WGenk8TBk9cpKTq1zBtviP
         kkZn84aLHqto4Vnl31JpzPNoQRvwHSj4BzlZMrwzn/DJ4Viacp6Me8WVAFvfrP764uMc
         2nfyTxbhv0LvCHMUcmQAVT6Hbp4q/e+lafrAzmPKNUrW0hal7z61bWJ5Rifto/58qA/F
         kPYg==
X-Gm-Message-State: AO0yUKVek5/59IBl/h0b4Ey2D9VwPz4NRyH9tjPtd/jSAAaiDKivsTsW
	wT5Zm7upk6v5/WatF+fNHnCnF55fMRvxQcdxWO0=
X-Google-Smtp-Source: AK7set+duqEDc9M/HOtUoFnEnU8dQH4whgqaboeMA6rKQCMepuMsrd0LXMnRwJ7z5dbCWSGYeSVRHA==
X-Received: by 2002:a17:902:c94f:b0:19e:73df:b0e9 with SMTP id i15-20020a170902c94f00b0019e73dfb0e9mr10599573pla.21.1679093000637;
        Fri, 17 Mar 2023 15:43:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/21] base-files: Drop localhost.localdomain from hosts file
Date: Fri, 17 Mar 2023 12:42:35 -1000
Message-Id: <7df46e003ea76cf7d5b7263f23bd6e6a781bd22c.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178782

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was likely something we took inspiration from elsewhere with.
It was added in:

https://git.openembedded.org/openembedded/commit/packages/netbase/netbase/hosts?id=c8e5702127e507e82e6f68a4b8c546803accea9d

in 2005. Debian added this entry around 2004 and discussed and dropped
it in 2005:

https://lists.debian.org/debian-devel/2005/10/msg00559.html

resulting in:

https://salsa.debian.org/installer-team/netcfg/-/commit/3c15ee521b2b8f47b34ccc7f610523cd284f2221

We should drop this for some of the reasons in those threads,
it doesn't seem to be doing anything too helpful and isn't what most
applications expect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e730d005fa8aec07f9ae25c58d4566eaa92a6997)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/base-files/base-files/hosts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/hosts b/meta/recipes-core/base-files/base-files/hosts
index b94f414d5c..10a5b6c704 100644
--- a/meta/recipes-core/base-files/base-files/hosts
+++ b/meta/recipes-core/base-files/base-files/hosts
@@ -1,4 +1,4 @@
-127.0.0.1	localhost.localdomain		localhost
+127.0.0.1	localhost
 
 # The following lines are desirable for IPv6 capable hosts
 ::1     localhost ip6-localhost ip6-loopback
-- 
2.34.1


