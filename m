Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F99DC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 16:28:24 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.663.1667492897684928868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 09:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=t8LFV++h;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id k2so6759452ejr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=78k7NtK3ksMHyQx6RZymDiZAJ4SEAC1jFXNXMcAepH0=;
        b=t8LFV++hAuKgmfC3NT2SY1ETU7rm7JwbD69wHVzkNCLniE8OFtRuqKx1hlxoJq9v5Z
         PvrAZm0Xp4Bj7V8nKJ1hozZieHUat29DqZnjMZfvKKeTomwuF8x1rZZvkGAq0y/CYy+i
         74k+aYMJaHpm5e2k2b2esSM1Cr9vR8Zu+GYuT997jj0/anWTMg60N4kZHcyUJ1K0nBrS
         xRAQVx9ln/LkpIgz6OXbklKKznhCL+BavynPRVnNVBGay7U7nIJa+08t5+E1L14/sohX
         Z/gLpTJirYHz8em96QkCwEeltbJ5rrjL9sjX7dDVwE/oOutuIPu9Jo4prw6gV/v3oPdJ
         QfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78k7NtK3ksMHyQx6RZymDiZAJ4SEAC1jFXNXMcAepH0=;
        b=DAktbH46Q1q3yAuqAxujEnnpqpD0EEXu58WdOU2tmQhaH7FmE3+/KjpEvBY2elEJlp
         FiRHvJkfnUPhpq0/waps/74E7r9AYz0mbyeAEEjEFtwOz1WP9JEpmCwA5In3wKBc2I4S
         raQKYzBoDpNMzZr9tVwGy9FrOLqZ+hvZpGVXKqs10CK9Xk6tPqi6v0Teim0JrPZkORQn
         SdZ7d/mrmg2Y5BTbOCAdXFc0WEXK7WLVH3qBXsRMjfPOUyR4LdtjLQ67s7s5rRK/gOze
         o9OH6yHFM9GH6dvDaAvA0d0xv30fo5aqSaGpZTPcQHgQDXyr3HCbsTqxsMN8jeIiQWgo
         Z+aA==
X-Gm-Message-State: ACrzQf0B9hMo06lPyii3Ami1VgjEAALX2B1A7S+DNOqYFBVuey0Vi9cw
	dcvWwPcGL+yTZvozZi9jf5dfo97phyXJDK7f6+IBTw==
X-Google-Smtp-Source: AMsMyM5Sm7qMMXQTIMR/CwVW2NsnEvQVieZbs0z9VFMjcshvjD+ZaK/O8LoTDLcsN5RZIcTQohKtECdlJMa5o8Hn7U4=
X-Received: by 2002:a17:907:7e9f:b0:7ad:b389:1145 with SMTP id
 qb31-20020a1709077e9f00b007adb3891145mr27541234ejc.92.1667492895857; Thu, 03
 Nov 2022 09:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1667356805.git.steve@sakoman.com> <c28dc71f17133f6e4470fc0c1a552c743869b3ad.1667356805.git.steve@sakoman.com>
 <Y2PkQjspCvfitDqj@heinlein.taila677.ts.net>
In-Reply-To: <Y2PkQjspCvfitDqj@heinlein.taila677.ts.net>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 3 Nov 2022 06:28:04 -1000
Message-ID: <CAOSpxdb0PxRcf7Xgq5sP3JHVe9doF7XH71xW=yK4wYQwpRnegQ@mail.gmail.com>
Subject: Re: [OE-core][langdale 01/20] openssl: CVE-2022-3358 Using a Custom
 Cipher with NID_undef may lead to NULL encryption
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 16:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172643

On Thu, Nov 3, 2022 at 5:54 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Nov 01, 2022 at 04:41:51PM -1000, Steve Sakoman wrote:
> > From: Hitendra Prajapati <hprajapati@mvista.com>
> >
> > Upstream-Status: Backport from https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
> > Description:
> >       CVE-2022-3358 openssl: Using a Custom Cipher with NID_undef may lead to NULL encryption.
> > Affects "openssl < 3.0.6"
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > (cherry picked from commit f98b2273c6f03f8f6029a7a409600ce290817e27)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>
> Instead of picking up this patch, wouldn't it make a lot more sense to
> go to 3.0.7 like we did with [1]?  Since 3.0.7 contains a HIGH severity
> CVE fix as well as the one mentioned here, it seems like we should get
> that backported to both Langdale and Kirkstone quickly.

This patchset was tested and sent out for review prior to the 3.0.7
upgrade hitting master.

Note that I have the 3.0.7 upgrade in the patches currently under test
for both langdale and kirkstone:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut
https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

If the langdale test succeeds I will include the 3.0.7 upgrade patch
in the pull request for the above series (hopefully later today)

Steve

> 1. https://lore.kernel.org/openembedded-core/20221101170310.2740317-1-edtanous@google.com/
>
> --
> Patrick Williams

