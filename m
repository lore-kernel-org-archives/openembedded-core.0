Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2FAC47090
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.19165.1650531866140002940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fZx5Z3yk;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id g20so5648144edw.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mkFt8YJ/CAMuglfGZPcWDhLxrLNQuoYAhuah74PXXQs=;
        b=fZx5Z3ykhHcQqm3mzbJWXodHH1Y1xkdB9YMWw1LKQdHvM36oY9aiO9zYzWemX1qIgi
         R6Uos/lCc31foDt0kmWoQF8NlQHpl3oYWUf2id3/geVpZNz5MWmios6H8+l5p0Ave68Q
         eh0ri+Tb10GwqClV/EnHIfkwpXn7xMmOk7gzYsZsACHDtl52rObAuoItsRPzBltOmPYB
         oWnxWN6cBdVz6uqlroq3fNO9VKasE6MiUhwsmMt/95OAG/SK21Pbc2hBedQNyN4EpP1a
         xVL41l30bbUIRxOnZh0NDBQsM5yFkca3hPqtUj637CGTa/rarnddkrg3yF01TWHSwKhb
         NgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mkFt8YJ/CAMuglfGZPcWDhLxrLNQuoYAhuah74PXXQs=;
        b=kJ2VCoyMGrxnEGi9WbkAQODthLR2HmJgtFT0PRyOBRhW+xWvZqwzEcVJx7vPWWptvl
         tC8SEHnTVIkN+8igizPUcmWJkG64agw7/MS6EU4LHqB4DrBoidkb2yvKWSFprVE2iIAI
         wJp5/8f5NmOb55NrJEN4jWDsADq7J9FL4nvtdDIsNksgK+nMt880IMpwYVeybtI2fJ9G
         0cTwtxUBdgtdhgsECcsj83Bjr/MBNi9rD7TerxAcp25sw338RsNkxy0p0eYxxjxcothv
         Z7viaXrW0mVg9LWthaGz7XAZNtKo9IcoUOJ+/wE/n2qAVHuaWjInrW8RXRZnpeuxTIlD
         uHkg==
X-Gm-Message-State: AOAM531N/XBezNaYQN7V+5QIl2yjlXxLVCOc+zvthzuVQEfcY4uoWgpe
	hcEVJsxN8Tgfcflv+vk+H9rgET7b2SWwEFgGB2Y=
X-Google-Smtp-Source: 
 ABdhPJyJBel9BTy7l6/0wRjyvfPD+DA5cav2adz3RQWJqj+Gmz4kEuT3WiAEaG7IlleNXqS7TXQ2KtndAnthbGD4jpU=
X-Received: by 2002:a05:6402:84c:b0:423:e5a2:3655 with SMTP id
 b12-20020a056402084c00b00423e5a23655mr21306315edz.28.1650531864411; Thu, 21
 Apr 2022 02:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220412130315.25917-1-alexk@zuma.ai>
 <20220412130315.25917-7-alexk@zuma.ai>
 <20220421102035.244debd2@kmaincent-XPS-13-7390>
In-Reply-To: <20220421102035.244debd2@kmaincent-XPS-13-7390>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 21 Apr 2022 10:04:13 +0100
Message-ID: 
 <CAO5Uq5S_UCaHgc+iT2prrZB9K2+iErkBp09wHnbjhJUrNC=Wjg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 7/8] wpa-supplicant: Simplify
 build/install flow
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164748

On Thu, Apr 21, 2022 at 9:20 AM K=C3=B6ry Maincent <kory.maincent@bootlin.c=
om> wrote:
>
> Hello Alex,
>
> On Tue, 12 Apr 2022 14:03:14 +0100
> "Alex Kiernan" <alex.kiernan@gmail.com> wrote:
>
> > The build/install steps for wpa-supplicant support CFLAGS and an instal=
l
> > target, so use these rather than attempting to do it manually (which wa=
s
> > broken by upstream splitting into build.rules and lib.rules).
> >
> > Note that this installs wpa_passphrase into sbindir rather than bindir.
>
> It seems the wpa_passphrase binary is not installed anymore with that pat=
ch.
> Could you verify on your side?
>

Looks like it gets built, but not installed, seems like it's the
upstream patch which fixes parsing of the config for it (and the
shared library).

I'll take a look at it.


--
Alex Kiernan

