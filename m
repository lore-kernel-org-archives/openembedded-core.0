Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA70EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 05:18:37 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.11656.1687583915889470249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 22:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HdM9S2hF;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f8775126d3so1792027e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687583914; x=1690175914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJZqG6x2lEWIcXLpcK+lShrE5fQCgqgETvh9gOYuoDk=;
        b=HdM9S2hF7oLIFUZ3g3/tLcp7jvkiWVatJ3bpCChRMgGY/opTVfoey/y9b5684ZrdfS
         0dvUnZH7L2i+aZpeLZq8qJU/8Y8XR4+M1gbO1z+2x7BsxADBBeGv4JgdIxV10yincj6+
         FQXrjSbM1p0XDvNV/ZCjEJGQ4OMa9SvoI58lXD22BtPzTbwlQAQZOAO81ylfGEzPsH1l
         hhQz4VbW+dRiefiMk4ZiYilOpB+fzvtkaIRZMhy0FotrKAPyZPyk7kHubMK+Is8DSHCK
         VdBRgOd10s30hKsTd/PT+HrRj2y5B7ngQxvhzwYU82UwKdYVIK381bi9MgzEGILUGnG4
         oCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687583914; x=1690175914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJZqG6x2lEWIcXLpcK+lShrE5fQCgqgETvh9gOYuoDk=;
        b=CR8uRKowWCy3F605Nv78H4oCW02T2iXWDHJi5+RdVm2XxjgUW81DUD2zguqvQCgStU
         5ho3MpN7ATXzZfSF7ZnJKgIWZq17tTAhtxYOcEh+MmQmIra48Del9bNRV21pyZc2w/sQ
         BsmojPnPm8zOlBRyOiGEdNHgZTNqD6Xo8bhiuueQdVV5ZK+om1rRYKX86wdq3VCCbk+N
         xpZJ87bE2HANznXUs8SGxir7HkMXOgz0RkY2HUFWE2V2rmnVygRnZkTiu1mZ4c3qK1dT
         XULkb9AVQbzOoG26eOLvEFpm8UaTtXDNCY4bYqWyCJrCI3ocASfShxRo8/30rj//Vt7i
         g8gA==
X-Gm-Message-State: AC+VfDyPuG4LOhu5dOwVWLuuayFMUCMyPBaZrrddtYRI46/+ozmvRwl8
	8hu5XzMUqR10mf8XKcsfg5qxcy9R8dlN8w/pbVk=
X-Google-Smtp-Source: ACHHUZ4zMCbIQLcN1p8i6++FJlhiTnS2SV2wxL2uspedYwfkzxQDyU0DhXd6FZm9SV3JRKctC30vTc1i8KYbaHHrZJg=
X-Received: by 2002:a05:6512:3c88:b0:4f9:6a7b:b8de with SMTP id
 h8-20020a0565123c8800b004f96a7bb8demr5069406lfv.3.1687583913378; Fri, 23 Jun
 2023 22:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687444823.git.pidge@baylibre.com> <20230623104629.2cbf4a53@booty>
 <fbbc9e99-a727-ad08-42f3-06d4ec15cbd2@baylibre.com> <20230623125323.70aad0d1@booty>
In-Reply-To: <20230623125323.70aad0d1@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 24 Jun 2023 07:18:21 +0200
Message-ID: <CANNYZj9SE5kkPCS8AGdCcgusBh50DX6OmUj8pJt8i3YpEYoi6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] wayland/weston upgrades
To: luca.ceresoli@bootlin.com
Cc: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 05:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183355

I have meanwhile been addressing all these issues in parallel with
pidge. There's a patch here:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-version=
-updates
and it doesn't show issues in a-full. If you''re pressed for time, I
can simply submit my version when the whole patchset is ready.

Alex

On Fri, 23 Jun 2023 at 12:53, Luca Ceresoli via lists.openembedded.org
<luca.ceresoli=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello Eil=C3=ADs,
>
> On Fri, 23 Jun 2023 11:21:29 +0100
> Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com> wrote:
>
> > On 23/06/2023 09:46, Luca Ceresoli wrote:
> > > Hello Eil=C3=ADs,
> > >
> > > On Thu, 22 Jun 2023 15:42:14 +0100
> > > Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com> wrot=
e:
> > >
> > >> Nothing really surprising here, except we should note that launcher-=
logind is
> > >> being depreciated so some thought on how that is dealt with will nee=
d to occur
> > >
> > > Should we file a bug in bugzilla to avoid forgetting about this?
> >
> > Yes, I'll assign it to myself. Alex had suggested we just require seatd
> > which to me makes the most sense.
>
> OK, so it I guess you should add it as soon as a future version of
> this series is accepted, unless you have managed to handle this
> properly by then.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183319): https://lists.openembedded.org/g/openembedde=
d-core/message/183319
> Mute This Topic: https://lists.openembedded.org/mt/99702158/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

