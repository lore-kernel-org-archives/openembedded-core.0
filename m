Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833B2E732FD
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 17:07:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.19092.1695920854283786572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 10:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/C1x3ti;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5043a01ee20so18815821e87.0;
        Thu, 28 Sep 2023 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695920852; x=1696525652; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8QVYbh7m/zP4AyBk06jPj44grWNUBd/nUaOoWZV770c=;
        b=V/C1x3tiUDkdbq1fubUkZp2jjmuMJRRPrguGHeIMo5arQDjhVTyI2aaKQKEH+ae40n
         xG2pE0xeEUkAWV1OsN10U9gAkahGLlw6AaY14ZOTJxz9qGWhRPO4LfGVCNJ04xNF7AVk
         VZwei50QTfiAj9TEjFdh6Ke1COBiGoJqwkcjgTK2aAqnScZBUK78SyXTiVERa8M9SRkh
         oqO3J/hTc3C0ErNWxA1TOYj4ajTgzhBoGyS0AqRDAXxXwqOtuz4Rw8EagmxhoRBMpGfx
         0X2kyDx4cNEdZ7z/pXkcB87gVuzx9qdA7TqW9+mYcOJx/xKXBVR0pBt3fW0MGQMKEVLx
         v5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695920852; x=1696525652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QVYbh7m/zP4AyBk06jPj44grWNUBd/nUaOoWZV770c=;
        b=dzYQybl019WRUDIZXoNBV8wf9QlGbe+Fe4OyuYJ5aINWpVJZGcNJRzo0k+Rc6tPKqT
         h2+mJ6dE5iH3zwvCggOC8JA4u6kPAm1T2wf0o+lKoC1S7fEsZDCh5HaxZVBAh53z/l86
         KPM1AO35RYRR2GPDb/Pn44Q7ZSIAX4859LzOGs8/OknhZoWUYg9hBTZIyN1WkUi8aVvu
         vJ34ezpkgA2trX1kEelGBYvyqIX/xwmttjYmlL3O321qmuLMpYxFPOrulooVaptvmE57
         DlfMfcnUi+mcMqJoVhdltilUlssNMW/pPoXYbTjF05zqKUOls5cE2r1lLt6pfzlTb7QH
         8E9g==
X-Gm-Message-State: AOJu0Yzw/Jc3ZRuHwy+FY2BZ7rXD4MUECTsTUxctNCGcwg+ywBOJG9GU
	PBfumcazH8VYcevIAO40wpWRaMMbOLLZueza0p0=
X-Google-Smtp-Source: AGHT+IHokwCNKHBcZ2mmGBB66DYWWLwD9wkyQ1Sfmvo2eZXSyLim4/JAmiNZPIvvJn5/06c2WFL0qJnvuzpJV1FNmaE=
X-Received: by 2002:ac2:5051:0:b0:4ff:8863:be01 with SMTP id
 a17-20020ac25051000000b004ff8863be01mr1456914lfm.8.1695920852200; Thu, 28 Sep
 2023 10:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
 <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com>
 <24b60007a669d075fa1e4ccd18980ada93714c7a.camel@linuxfoundation.org>
 <CANNYZj-YBTN_yje-fyzp12YDF9XMaZSuMvLh6qA1H+9GEYEmfA@mail.gmail.com> <7564ae2b6c036b10a35e8c9927c0ab2cf533f35c.camel@linuxfoundation.org>
In-Reply-To: <7564ae2b6c036b10a35e8c9927c0ab2cf533f35c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Sep 2023 19:07:20 +0200
Message-ID: <CANNYZj_PNNb1x-H73aG73Boob7bdofvizw9KM-ZmYH0AZm2a0w@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 17:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188377

On Thu, 28 Sept 2023 at 18:49, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've wondered if we should split bitbake -S printdiff into a separate
> utility? It exists from a time before we had bitbake command APIs.

It can also be a simple shell wrapper.

I've separated -S lockedsigs into it's own option as well, so it can
be explicitly requested (just need to fix up a couple of selftests
that relied on -S none to get locked-sigs.inc):
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/sstate-for-all&id=41e8a8a79bac4e3b9eb74a99e32e0d26ac8af0c5

> I'm curious to see what you find with analysis of bitbake-whatchanged.
> I'm also somewhat surprised the scenarios you're testing all work!

It's not 100% perfect. One out of 2*3=6 scenarios isn't fully
functional (gcc-source:do_preconfigure signature isn't found from
sstate even though it exists there - but it is found if it's in
tmp/stamps/). I left a FIXME in the test.

Alex

