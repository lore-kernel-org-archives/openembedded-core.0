Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B789CC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 15:10:08 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.420.1685459407590950392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 08:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Wgl/2kuw;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-19f62a4924eso1629151fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685459407; x=1688051407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SexoqCDxWhCzv0fjWZpZx3T1hgpo6ryRH0Xshl9Br74=;
        b=Wgl/2kuwIcnI+yVkf1gT1PfjKObsbneg/qtJsoevLQYL9bttkP14BYL0RTBwjdmTq7
         yglqUNBp52eiXXt0G73406bWTH8nwbySQDh7v1lJgAsGXeHQTY0Y2MonCdOE2lSONQnw
         TgYXqGKJSfdYKOkAErQ0HkzGlVbRfrOwH+PNGdnvkr0etqk5tTqaaF9rRSdjNQnI5wNQ
         /uXrpqB89cCQgoAoXLLm8of7FhRZeIM2yothvHKVLUT7xxLNm6Ky2GhjQqcDfS6tPXF7
         vU/GmKvBfB7ARqPjRqbtPOzf3F9X9gCY1ag8qcMOq0SJfcpqv+/dh/Eqhu9QO7IAkH9H
         EbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685459407; x=1688051407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SexoqCDxWhCzv0fjWZpZx3T1hgpo6ryRH0Xshl9Br74=;
        b=VUiAIPf9YhMMUU5W6zJDf4dyngXs5tL8ativQ9/M/BMFjUW1SD3jH6IUi/gBwPuMms
         srvFEfQTVTp1dEI4VjtaT9kjjWP39zy6gW+YJ37X2JOxm4OGR3WAKwppro1Qa0F+zGk6
         M0wcprVRQZSYVvAQo4rK831FpWeeuwjhxt18okCXvVYs1fnutOZvLVhzes+qlW5BpqR2
         VTULjKQmxkeycTjEXH2cUglxvSwgagHvnXciC5Gisxsvu1knlbO5R2FIkw16UuA/aCSX
         bsQTt0o6Sa1/BSkkGCojiMc2Hh62fJVcfhckixZZXtgid3cyUrM6w86YMKUVP7lAVCrU
         4vvA==
X-Gm-Message-State: AC+VfDwt0+qWleJac5QBRgD6i8i2PLbKTQgki+Vx06bfPmcTriGgk76N
	DEtijnGur/IaQCBpgMi6jiN1FbF3Zx2P15KHXP4=
X-Google-Smtp-Source: ACHHUZ78bcvgxsuw+Qwi7PZ4NsE1QcA9A23xexIUod1de+WaxF1ATjTVpmC0wP09DkCcHYL3GeWjzhGcB2SmDmWOORA=
X-Received: by 2002:a05:6808:1d5:b0:398:5235:34ca with SMTP id
 x21-20020a05680801d500b00398523534camr1437587oic.50.1685459406792; Tue, 30
 May 2023 08:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
 <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
 <CANNYZj9xxEnyxEyWv9q4AY9Cj_zpw6fSyqc6uwLOwzkFYFnZvw@mail.gmail.com> <01fcd740217f9836f3d13deb15b77ea94910f62e.camel@linuxfoundation.org>
In-Reply-To: <01fcd740217f9836f3d13deb15b77ea94910f62e.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 May 2023 11:09:57 -0400
Message-ID: <CADkTA4O6q8sB3QCWMOWpuxNFLUoSbiwCGxFZDMzrYTSzAPjJwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181935

On Tue, May 30, 2023 at 10:54=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-05-30 at 16:33 +0200, Alexander Kanavin wrote:
> > I might be missing something here, but can the free-form, anonymous
> > python code block be avoided? Don't we have PACKAGES_DYNAMIC for this
> > purpose?
>
> PACKAGES_DYNAMIC is for when we can't predict the packages a recipe
> might generate. A good example might be kernel modules.
>
> You're right that we could add a do_split_packages() call to the qemu
> recipe have have it generate these dynamically.
>
> The downside would be the namespacing as dynamic packages need to have
> specific namespaces (e.g. kernel-module-XXX). This means qemu-mips
> wouldn't be an option (conflicts with non dynamic packages like qemu-
> dbg).
>
> We could use a more specific prefix like qemu-system-XXX and qemu-user-
> XXX and use do_split_packages
>
> I did also wonder about using more specific inline python for some of
> this, things along the lines of:
>
> PACKAGES +=3D '${@" ".join("qemu-system-" + x for x in d.getVar('QEMU_TAR=
GETS').split())}'
>
> I'm also not a fan of the python code block.
>
> We do use do_split_packages() in other recipes like gstreamer to handle
> things like this.
>

And in case anyone hasn't looked it up, this is the meta-virt solution:

https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/qemu=
/qemu-package-split.inc

Which I'll have to re-work once (if) something lands in core.

It isn't suitable as-is, but it doesn't need any python code to suit
the on-target system emulation needs of meta-virt.

Bruce

> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

