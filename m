Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C6DC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 01:39:45 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.5440.1637631583940968119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 17:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NdYMgBT0;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id z5so85151145edd.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 17:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GXeI66gJFdI7MN1fuypxH3mwn+ZUuATcJb0P58wmQ8Y=;
        b=NdYMgBT0qhu1P69Hxvi7jobLXZKL+pL6l6BV80QRgeznRZrrGLjRu4yWncYceXcW1j
         cDIIQbsz6EhatUa6L0RaDQ9d9TGu3FKb0QhyjnAf6ENDDcD8qAQmrsdIkSe7oJ2PERRR
         96DNXVbjJhXOu/RC6VmAFB/Bud14eP9au8fkQDouYW3t28DiRs97pjfHYIsgOTaJkVB2
         jQfh3ufmaZ1DP04Z/wXGtUDnLJ8TeDYkFHHtV7TgiiSy+KDIyBiO51X5B6BvMFtRmvcW
         3lJZRye+/7lsKpNvbY1EJkpwGl5R43BAMLWmxqyNN07eZLWrqzlSnEUs5CeybEC7hieg
         j3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GXeI66gJFdI7MN1fuypxH3mwn+ZUuATcJb0P58wmQ8Y=;
        b=jdMhOAO9hI22XOpiK9YtM3b6Qoq4KFhrt8ZAr9vfeYdwr/ZyDqpzCwfUFwque+dHPS
         rd7+wPsR68GK4b+6u3vazcxDrlN3LoQQyqXyrflvQusj7Ub6f+GnbFrAccYuc2lx9VQl
         V9jJg/gpz/SqWOucO3SUqL6NjgdGWepPv4g4SDQOs3IZwAoLLXir28KO0QxUSCFOSuBZ
         lmS9LSu2MmCkI+J7nyKhUqlEqEzKt1ii2O4cnX9sBLB7dURu1q9eD1ME1agfKPrJBW9G
         ib5HAvyI625s129WoKRay8zsggHJuKcerIMSuXg0ms1QZuGjIWac+06Dk8irbEn1U26P
         8/+g==
X-Gm-Message-State: AOAM531XdbVF07OF6pbbzztDoek9tLDvDDgQJ2TZ2FMCyTUmPMrZmQVs
	DEw5Q96nHsJyPbggDMzsyv42XUHT/7NLuVtI2pE=
X-Google-Smtp-Source: 
 ABdhPJxtJS4KyO1xa9YMq9udXBKhC3lSxlzCn5jKqGJ0tRIds9fqkDygnlM7VaJ/qsJZE7fMdsvOSuY0y5gRO+ljL6s=
X-Received: by 2002:a05:6402:278e:: with SMTP id
 b14mr2850093ede.354.1637631582254;
 Mon, 22 Nov 2021 17:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4N0kF36bOyQu=jOkT_253zQy9sXqnywv9z_E5GZeewpJw@mail.gmail.com>
 <CAEUSe7_pESAniiBwAv2oASHi6je67zf7sMw1F2TNcas_1raspA@mail.gmail.com>
In-Reply-To: 
 <CAEUSe7_pESAniiBwAv2oASHi6je67zf7sMw1F2TNcas_1raspA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Nov 2021 20:39:30 -0500
Message-ID: 
 <CADkTA4NNawU1htCkTv9T-uEZ=-e82nKZG9yN9M9oO19B9VQLXQ@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 01:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158594

On Mon, Nov 22, 2021 at 12:23 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> =
wrote:
>
> Hello!
>
> On Mon, 22 Nov 2021 at 10:51, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> > On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com=
> wrote:
> [...]
> > > Note that the kernel itself doesn't build either as after 5.15 it now
> > > does try to run the dt_binding_check for which the kernel recipe does
> > > not provide whatever stuff is needed.
> > > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > > DT schema checks for %.dtb targets") to get over that.
> >
> > I have a fixefor that particular problem (the bindings),  so you can
> > safely continue to ignore it .. but I hadn't gotten around to fixing
> > perf yet.
> [...]
>
> I don't mean to hijack the subject, but do you have some quick
> pointers on that? We're seeing the same on linux-next and
> linux-mainline since that patch landed in those trees, and have

I'm trying to come up with a way to fix this without needing a kernel patch=
.

Sounds like you are already aware of the pkgconfig issue, which is
what I'm attempting to fix via environment manipulation versus a
patch.

We do need python dtschema as well, as a new native dependency of the
bindings check, which unfortunately pulls in ruamel and jsonschema.
Those are both in meta-python, so they need to migrate to core to
support the new checking.

There's also a problem with nproc being used, and it was giving me an
error on one of my servers, I haven't looked into it more yet.

I have a quick recipe here as well. And with those two pieces in
place, I'm up and running again.

The right thing for the short term, is that revert. There's quite a
bit of sorting out to do, to get this in decent shape for core ...
personally, I'd like to make the checking optional for those that
don't want it .. but that goes against what Rob is trying to do in the
kernel :D

If those issues sound familiar, and there's interest, I can drop my
WIP commits into a branch and share.

Bruce

> soft-reverted the commit for now. This (incomplete) recipe has not
> helped us get through that:
>
>   https://github.com/mrchapp/meta-lkft/blob/d/add-dtschema/recipes-devtoo=
ls/python/dtschema_2021.10.bb
>
> Thanks and greetings!
>
> Daniel D=C3=ADaz
> daniel.diaz@linaro.org


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

