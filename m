Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F85C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:31:30 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.31244.1685626283810118356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pNbmRfvy;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b204f0ca0so3400805ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685626283; x=1688218283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm8jG9zgd18Z9ejKOnMmg6ODVlANsmDtVV1SA6IJn3k=;
        b=pNbmRfvy9uRhf5I1CthmdNKhgbFJMRCXQDQLL+x80tHPshZnBMGWoxekOPvRkCqWYg
         x5WcUMTxJMQvKZfzDRhOU9sNVZ6qIWKLRlpPjUqVxddE+H0EvXSzUctbHvDEU9ttZElF
         zrLdYcLTf/3lFQACq03370QMB3WniwW3AX/bzNeV3GTba8syluUDuGRgyMcGlzrG07fX
         bmU769jkKiExPI6NnbAbAN/Jtf+1pERICYElgvVcnMrB4ndjONZD6CwBUFa9UtIDZrko
         CEQMNbGoL33EkSI3VzotPJ77i272Pa/ku4wQgQje7HV60oy25CV27mRyTLlw+2gz14Uh
         Ef9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685626283; x=1688218283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jm8jG9zgd18Z9ejKOnMmg6ODVlANsmDtVV1SA6IJn3k=;
        b=jOnNK6RuwHbraixlFbXHwztBiCz4d/3u9gZ7+243IFdPX4P2+K2VX59ZFZrzVrkj+U
         1NSxrij/Zt3Mda3HNM4WspJCbT8wqwfiAWmG4u8ODb+FvZAtGo7oCBK1FxQAwzscTpjC
         4sxXSDF0z1PBa/Ww4FjVaeuM09hx0IeQrBv/OZJ5R/LMKd+2zPAcc2HYrUNgBAuMIedZ
         ki66Svjz0qUvcko5GJQG5raejyTFG7ZXc6Nc5et5oD1UmEPFn0afsPOEW4d/rIxfg8zp
         jvSeoFwOpM2QFKG8/+h4kCa+cWD6+tVikQbxJnLmzW73grQ9/PZuZDm/PD+Mb1qrep81
         0YHw==
X-Gm-Message-State: AC+VfDzUwOoiZqsgh0amjgAgIWY21EJpCsLZcHytnxVCux27FxyLW2Eb
	iSDuPKjJQp0uBFsOR/IpsbRP26vRljFYSGEieOI=
X-Google-Smtp-Source: ACHHUZ7lUp9M5I2fxh02ErCoG3tv1oVkKycyXGaMwf+jGdRo/V2DxP66PY6MK9r53+YTf8gT749Q/jcLwe/ZirRmCAM=
X-Received: by 2002:a92:d382:0:b0:338:a648:9c7 with SMTP id
 o2-20020a92d382000000b00338a64809c7mr6595958ilo.20.1685626283003; Thu, 01 Jun
 2023 06:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
 <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
 <CANNYZj9xxEnyxEyWv9q4AY9Cj_zpw6fSyqc6uwLOwzkFYFnZvw@mail.gmail.com>
 <01fcd740217f9836f3d13deb15b77ea94910f62e.camel@linuxfoundation.org>
 <CADkTA4O6q8sB3QCWMOWpuxNFLUoSbiwCGxFZDMzrYTSzAPjJwA@mail.gmail.com> <199e4af0-7ec4-2abe-d4e9-d4eb648513d9@windriver.com>
In-Reply-To: <199e4af0-7ec4-2abe-d4e9-d4eb648513d9@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Jun 2023 09:31:11 -0400
Message-ID: <CADkTA4OaXWAOSDwK3ThGdRBixbbWB2iH0kTj75+7=oBGjwE2zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182106

On Thu, Jun 1, 2023 at 5:33=E2=80=AFAM Yu, Mingli <mingli.yu@windriver.com>=
 wrote:
>
>
>
> On 5/30/23 23:09, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Tue, May 30, 2023 at 10:54=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Tue, 2023-05-30 at 16:33 +0200, Alexander Kanavin wrote:
> >>> I might be missing something here, but can the free-form, anonymous
> >>> python code block be avoided? Don't we have PACKAGES_DYNAMIC for this
> >>> purpose?
> >>
> >> PACKAGES_DYNAMIC is for when we can't predict the packages a recipe
> >> might generate. A good example might be kernel modules.
> >>
> >> You're right that we could add a do_split_packages() call to the qemu
> >> recipe have have it generate these dynamically.
> >>
> >> The downside would be the namespacing as dynamic packages need to have
> >> specific namespaces (e.g. kernel-module-XXX). This means qemu-mips
> >> wouldn't be an option (conflicts with non dynamic packages like qemu-
> >> dbg).
> >>
> >> We could use a more specific prefix like qemu-system-XXX and qemu-user=
-
> >> XXX and use do_split_packages
> >>
> >> I did also wonder about using more specific inline python for some of
> >> this, things along the lines of:
> >>
> >> PACKAGES +=3D '${@" ".join("qemu-system-" + x for x in d.getVar('QEMU_=
TARGETS').split())}'
> >>
> >> I'm also not a fan of the python code block.
> >>
> >> We do use do_split_packages() in other recipes like gstreamer to handl=
e
> >> things like this.
> >>
> >
> > And in case anyone hasn't looked it up, this is the meta-virt solution:
> >
> > https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/=
qemu/qemu-package-split.inc
>
> Thanks! I did see this before I send out
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230530131708.1=
916975-1-mingli.yu@eng.windriver.com.
>
>
> Considering to dynamically generate the sub-packages via QEMU_TARGETS,
> so I use a python block and don't need the change the code even
> QEMU_TARGETS has some change.

QEMU_TARGETS is not something that changes very often.

I still think that there needs to be a way to opt-out of the split
packages, since there are some split requirements for virtualization,
etc, that don't follow the relatively simple pattern being introduced
here.

With the python code and the :prepend, I don't see how I'll be able to
opt out of it in meta-virtualization.

Also, the dependency I see in the v2 patch isn't what I'd expect to
keep existing use cases working.
i.e. For kernel modules we have the package that rdepends on all the
split packages, since there are expectations in places that all the
qemu-system packages are installed.

Bruce


>
> But I should let all sub-package to depend the qemu-7.2.0*.rpm.
>
> Thanks,
>
> >
> > Which I'll have to re-work once (if) something lands in core.
> >
> > It isn't suitable as-is, but it doesn't need any python code to suit
> > the on-target system emulation needs of meta-virt.
> >
> > Bruce
> >
> >> Cheers,
> >>
> >> Richard
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

