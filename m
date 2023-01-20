Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73F7C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:26:58 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.75330.1674224809989365793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 06:26:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ffCfMpGT;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id p189so2534354iod.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvr14DM8F68DTHaPTgxDyoJstYhLQQflmvcTyET45EM=;
        b=ffCfMpGT2yewbig1LWAPdprmVDsWi2eWQpbcDiaiNY898iOYjXREeknukgTllqjnUm
         AaFSQAVjcA/9K6mDp6xJ5gLHu/wqLwHBFLsVhgnasdphGTjM1bVK8NO/Ghs2SvAjr73V
         q+pMa8iOr/GxMS/U8LJuEfg6oHv/milemigvVuvZvXeuzzTRlFcvzOSDiWDCsBRWCced
         ITad/Ob77OzHnQUBnFFZ9JIdg5iQ+cbjtcuo+86QaPIX1GBFodV2PZj22iIu06jn0IUR
         5ldq5SmeivpAzMy79Vndk+otG1Y2cTDTsn2Y4XcfWtzIrWE/0mPTFbwj7iVfaXME1axy
         HaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvr14DM8F68DTHaPTgxDyoJstYhLQQflmvcTyET45EM=;
        b=7mdMhhJgh/4h5htr650MuUAf6vawPg8dhgpzhIzgnSI4fLqfEKYCtIpwuhO82WpIXG
         neSS9DFCfLVUFm15gz+6Ie6RzeRAys5Io7r5x1fZso7VyUJJvwfm9VMLhLfwCB/8uq7r
         ZW3tDqXSf74ghpK3cK3PyDpW2dp04dESM6wNMrAQzwKvBaHXgZ6kaPumFc1K/AXbCF3d
         SUkBtrrFO+zMZ8JNedJOdmGrK6ZH+5F23SdJuZZqdTithHjTeqZzchbLwE5zf++LCwkP
         078mj8hDrVUUq74iPdRKaK6iOY87IJwL/ZliIw6PGzDT07OVVvEuWhMKQEaxpzdV6Jbx
         aDlQ==
X-Gm-Message-State: AFqh2kpeaMh0XyepRTAvqolb8f3hUpfU0URdc6o3hl/JzI5yh8xOs2hu
	4eP8386if/yYiaSLi/NRxpzxL/qcB/VfY2HOKIM=
X-Google-Smtp-Source: AMrXdXv1ELj7jP/Hb2RKEtGALUmRVtrUROxxqtqqVNcPqubK08XFSprzZG3iZwpPGcdE0IuostFQCYVN0FysmCJEDf8=
X-Received: by 2002:a02:c643:0:b0:38a:c2a7:369d with SMTP id
 k3-20020a02c643000000b0038ac2a7369dmr1427715jan.245.1674224809275; Fri, 20
 Jan 2023 06:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty> <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com> <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
In-Reply-To: <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2023 09:26:48 -0500
Message-ID: <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 14:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176190

On Thu, Jan 19, 2023 at 9:56 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 19 Jan 2023, at 13:55, Bruce Ashfield via lists.openembedded.org <bruc=
e.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > I'd prefer the upstream-status check to be disabled for meta-virtualiza=
tion.
> >
> > This isn't something that I'm strictly enforcing, and not something tha=
t I
> > want to start strictly enforcing.
>
> With my meta-arm layer maintainer hat on, I=E2=80=99d like to briefly eva=
ngelise for this check. We=E2=80=99ve had patch status tracking in meta-arm=
 for a while and it has a lot of advantages for the minimal friction it add=
s.
>
> Yes, there=E2=80=99s the initial hit of spamming Upstream-Status tags int=
o all the existing patches.  This is fairly simple - especially if you assu=
me Pending and review them At Some Point - but the act of running through t=
he patches and marking backports, patches that will never be sent upstream,=
 and patches that _should_ be sent upstream is useful for everyone, both th=
e layer maintainers and other users of the layer.
>
> If upstream are =E2=80=A6 tricky to engage with, it=E2=80=99s useful to b=
e able to mark a patch as struggling it=E2=80=99s way upstream and link to =
the relevant tickets/merge requests.
>
> However, the biggest win for me is the leverage you have over patch contr=
ibutors:
>
> - Thanks for the contribution.  I see you=E2=80=99ve marked this patch as=
 Pending but it=E2=80=99s a good upstreamable fix, can you send it upstream=
 quickly so we=E2=80=99re not carrying a patch forever? The patch can then =
be marked as submitted with a link to the pull request.
> - This patch is a backport, please mark it as such and include the SHA so=
 we know when it is in a release
> - You said six months ago that you were going to refactor this ugly patch=
, how is that going?

That's actually leverage that I don't need over the contributors :)
The complexity of the projects and system level testing required are
the biggest barriers (and I'm working on that). I use my maintainer
karma to push back on larger direction items and features.

I'm not set on a machine parsable format of logging information about
upstream contributions, so I sometimes do ask (and log) the status, or
ask for upgrades, but it is all pretty flexible (I am routinely
annoyed when I can't remember (some sort of mental block) where the
capital letters go in upstream-status and I get a warning ;))

But the point is well taken! I'm just suggesting that one-size or
one-workflow suits all may not be the best initial approach (and I'm
not suggesting that others are suggesting one-size fits all either!).

I do mostly use (or end up with) 'inappropriate' in the patches, and
can do that, but it tends to be when the recipes are next updated, or
otherwise cause a problem. I've started doing that now (editing the
existing patches), but again, I won't insist that everyone does that
on submission, so not having the warning/error disabled is just an
extra load placed on me.

I'm not really a fan of recipes that use tarballs (when a proper
revision control system is available), but I don't force that on all
contributions where I'm the maintainer (ooops, I've started bikeshed
about recipe preferences and pet peeves !! :)

Bruce

>
> (the last is definitely my favourite)
>
> Just my 2c,
> Ross


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

