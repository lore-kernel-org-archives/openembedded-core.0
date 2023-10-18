Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7347CCDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 17:53:48 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.288052.1697651625419604376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 10:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y0RhpxQN;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-79fb78e297bso297601439f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697651624; x=1698256424; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZIScMaAbehXIs8HKh7zeZst+Nh99nOSyXmnXCJzwcI=;
        b=Y0RhpxQNPqihpnUebkcOojsJEIfwaRm074/3/UVr1z2OYPCzGW1wUTT5yqeNc/1Fn8
         YPieZxylKr5ON8u9mv8tdIyop/exmqkbjkvvluK+h/7imRhZQEnw6twh+f117moVVu4a
         2eQm9/NtwxSWtqfSY7QApFn1RNP0hK62CljzOwr3TKeU2SzWl0lXJu4ysaydQJvJAt9p
         WxPr38lWO5KnFgJfaYHeVqmnMbjw05d/0eeXov4AkQWfLZjf+vIHtIf8QoqR4u3DqSw7
         V0uwtyVBGd5opYakzn2DKpokS59lcpZhGOkt76yk7DSY2k9nEwkj7r1owNXjMLtvV7x+
         GxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697651624; x=1698256424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZIScMaAbehXIs8HKh7zeZst+Nh99nOSyXmnXCJzwcI=;
        b=CdDm8N20yMUszuKwVt5B5csvBpe6vKH8fdvILpf6ty2SQcMLNxvu6LXG1UKd+Man9Y
         Ual4o6jg57rE1lXor/aKTVKKN3pBERpihTOV0n2sjGz8aUqOyC9dvhnuyq/wk0q/xqAD
         z9EfGzAG/kg8Q2M9wmqoWhjcNjvREaLRvxTvsVBIaZe0jD3ZujsPtgkSDX5ybsY+wbxk
         ZStgLCo0sMBsUq2mp7p0XmIfNOQd7DgRKB77kq4xL4Mgw4MDWtkb0vF1aMXk6gIGf2EA
         H2860MuzjtUZ4g3QxnsqmcJHTUkX5EeD9oGN0ijKsNmPj5AsbmnPo/SYC/YQBUlHpOvE
         MNsw==
X-Gm-Message-State: AOJu0YxPYne8i3HUU4EwYqdZ6FKPOENEEEk2XCBvzDw2l5SDoUAiE4f+
	94b5AtLAEScxZIaQ3rrFcCkZZCT/hdZM5epThhU=
X-Google-Smtp-Source: AGHT+IFXZ+wRN4acHcfYDins19PVMyPaiuUwODuPQD9c9BpC2titaUGWPiH6gleznYXaBSSkDUhtg2m875WucuKYJWM=
X-Received: by 2002:a92:c94f:0:b0:357:9ec8:87f1 with SMTP id
 i15-20020a92c94f000000b003579ec887f1mr102140ilq.1.1697651624552; Wed, 18 Oct
 2023 10:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <178D75FBE8F44DE3.14388@lists.openembedded.org>
 <DM8PR12MB5430ECC002146797097B60B58BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <DM8PR12MB54301AFB99198C2370B9FF698BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54301AFB99198C2370B9FF698BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Oct 2023 13:53:33 -0400
Message-ID: <CADkTA4P9yTNMf0OUH6i+pRXdiBTdQcKBAmNzWGzcFBmLhOtR5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"jon.richardson@generac.com" <jon.richardson@generac.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 17:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189416

On Wed, Oct 18, 2023 at 1:49=E2=80=AFPM chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:
>
> > Ugh, actually this needs more work. If a recipe sets KBUILD_DEFCONFIG b=
ased
> > on MACHINE overrides, then the no-override case will explode when we ca=
ll
> > 'kernel_pre_patch(localdata)'. Since in that case, KBUILD_DEFCONFIG wil=
l be
> > unset.
>
> Actually, this approach is problematic in general because calling do_kern=
el_metadata with the overrides changed isn't enough - we'd also have to cha=
nge MACHINE. E.g.:
>
> machine-a.conf:
>     KBUILD_DEFCONFIG:machine-a =3D "<blah>"
>
> machine-b.conf:
>     KBUILD_DEFCONFIG:machine-b =3D "<blah 2>"
>
> kernel-recipe.bb:
>     SRC_URI =3D "<kernel src>"
>     SRC_URI:append:machine-a =3D "  <patches>"
>     SRC_URI:append:machine-b =3D " <different patches>"
>
>
> Assuming MACHINE=3Dmachine-a in local.conf, then 'devtool modify <kernel-=
recipe>' will fail to setup kernel metadata for 'machine-b'.
>
> Is setting up MACHINE too invasive? Or do we come up with a way of only s=
etting up override branches for overrides that are valid for the given loca=
l.conf? I lean towards the latter approach for simplicity.
>

I admit to not using devtool, and not following much of what has been
going on in the series.

But unless we are changing the machine for other devtool modify
workflows, I wouldn't' see why we'd want to do that in the kernel
either.

Any type of valid override should work, as long as you get all the
required variables setup for that override.

To the error you mentioned in the original email, what exactly is
blowing up ? KBUILD_DEFCONFIG is completely optional, and not used in
most builds, so the empty / unset case shouldn't have any issues.

Bruce

> Thanks,
> Chris



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

