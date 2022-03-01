Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD335C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 13:14:29 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7785.1646140469094335964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EU9NXwQW;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id q17so21926681edd.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WPYfbv41dWxpuV9D0+KblwyiPJ/4rjdh2RL8z5wk9n8=;
        b=EU9NXwQWU3xVv9O4cLDIuDrsqo5QMdPi6dFSUWkuShJtzEOVHfAQhoKzL7QO1BpXdb
         5t1lH67hf31oWuTtLqI2MQTFdEyaRbQQUmGHvBAdxz8poMi4Hgj9IKa9k7LIbJoSs3UE
         CBYowYy2bhNguk0oK+f25KP7g9OyP1hXbFNdqB//kHH1ZFkYv071MsD4Op+L67aOdStn
         N00zFYm+kHeGhRpAah1lB/7qpXYdfkmnmdAKlphABmr2PJzDvTDZR9yKcrsCyPgK12IP
         3vEatbFidncg53AQtDszGCGIORkeWnkyh1OSDHc3GjhSyySXwGqgsN6IaVq7+oPyAyYa
         ZRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WPYfbv41dWxpuV9D0+KblwyiPJ/4rjdh2RL8z5wk9n8=;
        b=NzjpgMzNPWAmhn62dlmR8YBh129ZE9IqpdUxWsjlPMXQ144hwjGhZygGwBzj4xAh4J
         20U+fIC5op5oDxhS/aHZ7hsASz7NB6bmTdeijaQaE2a04Xxo/jbT8wMG2IZ/bR8IjYlb
         BZ6oCKkq9sDl9ZDwTwlLPpAiJb6otXhetSVgnvH90ig9EyqGrOoJZSyCkM5E4qpE6OkA
         LWZ7C36dJVSUJpp7x5rlSKIz3aCe0wgP+OR3dr5cLZek14rqoJX/of7LT5reQM0KlrVr
         4IgPPWV2xUR4tplr6UaUOIDwd8esQaF11aF6jsqkJCG1dsG0QkKrhoNRFrR+BvgQ11Iq
         l91A==
X-Gm-Message-State: AOAM531qlqsUiLuFx/nId3JCaKVP3retB5U69xbjCuYqeZkohDONA7Ps
	gE7lm7oNUVeqqNwJ6dUxpcp6O+qT1IpyTkQNJIA=
X-Google-Smtp-Source: 
 ABdhPJw2vvvl4j3NoQlEeOH725s7dxmOPHWGvC2IazECTMyVM2wZzLRJcURqppg8s5j7Cx9eh0WXPIcwcAl/7mypko8=
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr24572633edb.288.1646140467414; Tue, 01
 Mar 2022 05:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20220228235433.3948994-1-andrei@gherzan.com>
 <16D81CEE77B62019.3953@lists.openembedded.org>
 <CADkTA4MEqxJc7=RNEKS4emNKOy_7ytPs4rF6F5E=EPCCMTLQSQ@mail.gmail.com>
 <85ec6efd-44f0-4f9c-8844-b65ec255b2d1@www.fastmail.com>
In-Reply-To: <85ec6efd-44f0-4f9c-8844-b65ec255b2d1@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Mar 2022 08:14:16 -0500
Message-ID: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 zygmunt.krynicki@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 13:14:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162555

On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
> > On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wr=
ote:
> >> >
> >> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >> >
> >> > Compile pulls in the go.mod list requiring network. Without this, do
> >> > compile would fail with a similar error to the following:
> >> >
> >> > dial tcp: lookup proxy.golang.org: Temporary failure in name resolut=
ion
> >>
> >> This is something that needs to be carried in your own layers, IMHO it
> >> isn't appropriate for core.
> >>
> >> It isn't about the fetching, it is the entire gap in functionality
> >> that we are missing if go starts fetching dependencies during compile.
> >
> > A further thought is that if this is for go.mod issues, there is the
> > go-mod.bbclass.
> >
> > Perhaps enabling it in that class and doing a bbwarn about go fetching
> > dependencies would be appropriate ?
> >
> > Otherwise, someone may not know that this is happening and that a no
> > network configuration has no chance of working.
> >
>
> I reckon that is reasonable. I'll personally go down the recipe level to =
workaround this change but understanding and agreeing with the reasoning be=
hind this change, I want to invest a bit into trying to find a proper solut=
ion in the core. Bruce, I know you invested a fair amount of time into this=
 already. Would you be willing to sync up and see how we can work together =
in tackling this?
>

Definitely, more ideas are good. In fact, I think there are probably
several approaches that can co-exist, depending on what a
recipe/developer needs.

I'm in the Eastern time zone here, and will try and grab folks on IRC
to have a level set

Bruce

> Added Zyga to CC as he is also interested in this as part of his go devel=
opment activities.
>
> Thanks,
> Andrei



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

