Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A30C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:21:07 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.14693.1679408457185911248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZImeLsrt;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id k15so7886641pgt.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mg1MKloKKOVDZYvfpUgCPHvgldeVoxeOpTuaZB1wxhY=;
        b=ZImeLsrtSPSFSRunZKdG8I6qvhMlIk/6DTBiw91WF8gSO2bXxoyOzFCq9WIEP7tkUX
         HSpdzyjRP+knhAzibGxkjJkSgySukKPzfx548F/DM5aD4PQ/SsWpjGfgDeuR3N1DS5Wa
         5DpUl0xubLsjRE1wQyNnfgDD1lTHmeyITHbIbjxcXEmXq33fIXlaUvsnWuEFYVlPTcAX
         67JUGG2zsIwMvwdxoBjLZIdgtmWa/s6PqBdYgsYhcZ1qQVG1+rGKYoZVOvMdB5Ey8hKs
         aPh9DsmGH1UDtNyI1VxcwIBYIcCwR0WKHfUtIqfIYOAGxq5yBXKsbKOTN3UB9vbIGZuP
         WIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mg1MKloKKOVDZYvfpUgCPHvgldeVoxeOpTuaZB1wxhY=;
        b=K4u4obGEgGXcZT0cJKnhiYOKRFTUCAum4UXjCI4Zv1Yrz5No/EPsFFIctamMY0U3ZX
         UvBuJ92Clz3xI1RND5Kk7r3YSfMou3v0b2GYpXvK1ZPqVk1s9HK95xgOqwHgg+ZD2M7A
         DnJV9+XPBzb77o4gVX14u9z9B4BPF9l58Ito6AbISMDhTzO9cdEGthF6F1uD4wY5lbKK
         vtDfqJFL8ons5n3JXLie6oSoG/gKYexRIiElVJasTir/r4Y3UrVEYUg6oj1Bmw705/ni
         HG7JLnowisu3NDPrC8sFKnf8Zna9y+g1ycETDf+k0VkYUoCVB3igPQxAfHvTk0VXX/sL
         9TVQ==
X-Gm-Message-State: AO0yUKXAgrYnwJ97QISm54dHWWAw0fHrNuUYkzyHblK1vC0V6VZZXPN3
	0dEpSDFTeXdiEfr2uSVrw8vbfSeISYuWf+4jOmw=
X-Google-Smtp-Source: AK7set/zW5d+SWtpb83hhWxNTXJe9sxHB+S4QTYGOHbmG3TBF4pZ8p9rWOBQXaS3OA/zeu9cHwui5Q==
X-Received: by 2002:a62:1989:0:b0:626:f692:5b1 with SMTP id 131-20020a621989000000b00626f69205b1mr2040690pfz.22.1679408456210;
        Tue, 21 Mar 2023 07:20:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] base-files: Drop localhost.localdomain from hosts file
Date: Tue, 21 Mar 2023 04:20:19 -1000
Message-Id: <a04b207c4ffa900313a0b5e3079ad2eec7d31f27.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178885

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
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
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


