Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82941C3DA66
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 18:42:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.916.1692816146554824583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 11:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Yw4XKfWO;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so9345255e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692816145; x=1693420945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+0dR3sgJlejlZ62Jv6XT4FqOENj5LbEm812h75PzHY=;
        b=Yw4XKfWOC1bX+43NV0hfP05DeOTRq74ohkf1DEvTJqFVmoVNLGE4mIfQ2ShGvLfdLU
         lY5WIFArw06oP7CeeLUHOs/sO4i0dIDXdnST3SFKHUP621hhfM1Hmr0ONe4/nnsoi+ou
         tgofAaWNVHdtEkeOWNIwenL9zpHjjxcnKNvMCHgzJDgpvywg/ymbR8kieAPjSfih67Ot
         IqkNxXGgufs3zOAln94MmuO8pa72fd2LWsCvRZmJFgd9WxYt7DClbZcclVHa3sHqvsH7
         GX6r+9XdIaQz5zUs7xkpKI9EeWsrk/QtXDbTaYP2XfQVBwHoQW4lpASaCNIG2NDsL81J
         eJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692816145; x=1693420945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+0dR3sgJlejlZ62Jv6XT4FqOENj5LbEm812h75PzHY=;
        b=UmBF4+cpy0/aUhI3lKw+ZUvZ0nzAL8Yir1Cq0+MyFsraWbnlLuqbIdVykSxv0H24G+
         U9/XbFPngzoUdVPo8WFa4uVC21E1cqHiFNGye9udLzxSG7WiAVW+pV7Z2/eUDK+8uTxX
         +P+MMbTU0PG5EBhzRBx94LfiejIyC7DWUTCIyZJ0yBQAHl1XJOc/FldithqF+0FSL0kW
         3lhC0vrYGdBWnmYc6KWCR4a2ePOVAJ009acIfSboHwqgJxHFYfz1B3XP+X5srbtRwsck
         cQVVukrWx1bcQoDtlKiTvqpP3lJrt9bi9RtEdGvUycpajfHMd5s/9yC6X8ucwfU4E9E2
         8Sqw==
X-Gm-Message-State: AOJu0YwcvytHZot6EHdGv4GY4kXfAyfV+yXGqvLeybnP+PIXqZph+fRx
	k0KwbRqidlr2LN0jARjpry5ViV5uDQhAWLcQbEk=
X-Google-Smtp-Source: AGHT+IEq4hdjSVcFSeATZ/TVEnhEsDvHCOSFrhQrYN/xPsx6y9bBJBHAs4Oovrz5nvV1vBbwb/J8SGlqnoX+9gGdi0g=
X-Received: by 2002:a05:6512:3b92:b0:4fb:7c40:9f97 with SMTP id
 g18-20020a0565123b9200b004fb7c409f97mr11003078lfv.27.1692816144483; Wed, 23
 Aug 2023 11:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-9-mikko.rapeli@linaro.org> <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
 <CANNYZj-i3gAnho=+D=95G_Ez3C4ZaXLMRxsavgbmEOfaO-ZR8A@mail.gmail.com> <177E172FFEF11691.18238@lists.openembedded.org>
In-Reply-To: <177E172FFEF11691.18238@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 20:42:13 +0200
Message-ID: <CANNYZj_6rFz8+CvOVrFmko+OGfDscF9b6zxpqH=b+hTbCFhtZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
To: alex.kanavin@gmail.com
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 18:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186630

I mean runqemu does already have

def check_render_nodes(self):

where this should be fixed. Sorry can't help myself :)

Alex

On Wed, 23 Aug 2023 at 20:40, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Better yet, how about fixing this at the source, i.e. qemu itself?
> Sorry for the rapid-fire :)
>
> Alex
>
> On Wed, 23 Aug 2023 at 20:38, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Oh, and device should be /dev/dri/render*, and all of this should be in runqemu.
> >
> > Alex
> >
> > On Wed, 23 Aug 2023 at 20:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > > >
> > > > If access to /dev/dri/renderD128 fails, then qemu with 3d graphics will
> > > > fail to start and errors are rather cryptic like:
> > > >
> > > > qemu-system-x86_64: egl: render node init failed
> > > >
> > > > To fix this, users likely need to
> > > >
> > > >  * modprobe vgem
> > > >  * add their user to "render" group to write to /dev/dri/renderD128
> > > >
> > > > If access is not available due to missing HW, driver or failing access,
> > > > then skip the test:
> > >
> > > This should be a failure rather than a skip. Otherwise, autobuilder
> > > testing will silently regress and no one will notice. The error
> > > message should include information from IOError as well so that it's
> > > clear that the issue is device file permissions.
> > >
> > > Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186629): https://lists.openembedded.org/g/openembedded-core/message/186629
> Mute This Topic: https://lists.openembedded.org/mt/100910043/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

