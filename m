Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385D2C6FD1F
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 20:15:39 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.3748.1678306530878231165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 12:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mIn3haLU;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id z6so19556047qtv.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678306530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78o4ctXHdG4kKOns2fM8vpNFfGJzPfDcUkEdZXTqpqE=;
        b=mIn3haLUErIL6QiWVIR1XZfcW9fQCV6Y0PmU516KRge2nMwuO3ffye/7mr7yC19+sm
         DiugXSX84N8fbF17AFcv9KYWMyaqg56yOGKLvDgHZFMOIfQKamx381TZ9A/EGZahuJLM
         lr/7FCLUuCWSeRlzbh/3ZaIjuS4Ow6DMgocJXPJe6X8yvAEhRZrpZpp28jA6IxTl2705
         HSC3Ao4fimh0p8UhSFj4RYfkOK/0adV8mJnK2sj/2R6eeJQznyKjONYv7TQM6zlQRr9F
         9CcODWA15bQqsXz5wtcJEXdzXGdR9WkuZp+55NvAr634ele5+tKNiZqjUuLhNMCYQ1Be
         W6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678306530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78o4ctXHdG4kKOns2fM8vpNFfGJzPfDcUkEdZXTqpqE=;
        b=cPBqbQA4Zhb8C6faec4jwcE96bTcmZCYWqk0xahceNwDEfh0zqOC8tqS42R2uzjddX
         MKVFTvQD9gScVhahjrUoNORmfUsJc+Fv7vm+tgmw8Pic0WCU7Ap1BMFPTauqy62B33XS
         NE8kCvtUFINpUwDt+cnWVvHHwnl2DKJGNXMTydDGg/nY+tIeuF/39AT+pRuo8DmVNBGO
         /osykbyR/C9aCLFyXzC/IM8nTB4uxX2yKIiCegBdkdxpcK+Eu4z0ns7/Ru1PlAnlkAD0
         mlHRQCdDCICxa8sspTnR1UyxmnDWAVv4RG4PqpUEj23xQNv4HUVGm2gzLcglVEXDUu+2
         kaAg==
X-Gm-Message-State: AO0yUKVyPKRlyMHQY7f/Q4GdEsHlcU+VkNz2U4Sm+nggemQ96A3ehd4g
	ni/ppO8OEeWmpUMAtCwqyJ0M6L+w5GRRW+XqK6g=
X-Google-Smtp-Source: AK7set8wLVs2A6eNJ2AE+KhymAb4IvkOQelBqlP13fVS0kYCewahTDfTvxj+87wU7Kop8XDgantP/oWcW2hvofDHcio=
X-Received: by 2002:ac8:7004:0:b0:3bf:d272:73bb with SMTP id
 x4-20020ac87004000000b003bfd27273bbmr5116872qtm.6.1678306529859; Wed, 08 Mar
 2023 12:15:29 -0800 (PST)
MIME-Version: 1.0
References: <174A8107E1CB2F32.12537@lists.openembedded.org>
 <CAJiuCcd7TwBYuKXSA4Civr6=GrAymm6zTvakpzP=sYpwPLQNxw@mail.gmail.com> <0d5152e3-e8ab-14f1-cf25-5b66429e975f@msgid.tls.msk.ru>
In-Reply-To: <0d5152e3-e8ab-14f1-cf25-5b66429e975f@msgid.tls.msk.ru>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 8 Mar 2023 21:15:19 +0100
Message-ID: <CAJiuCcdnAbRiLw7Cb7fgZm4wfmXa70c-i-9SN5wJ2khSM3OQAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: openembedded-core@lists.openembedded.org, 
	Brenda Streiff <brenda.streiff@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 20:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178196

Hi Michael,

On Wed, 8 Mar 2023 at 18:55, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 08.03.2023 20:28, Cl=C3=A9ment P=C3=A9ron =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >>   meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
> >>   .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++=
++
> >>   .../qemu/qemu/qemu-guest-agent.udev           |  2 +
> >
> > In this patch,
> >
> > qemu-guest-agent.init and qemu-guest-agent.udev come from the Debian
> > source repo.
> >
> > Could you confirm that these files use the same license as the repo?
> > Or are they following another one?
>
> I wrote those files. It's not much. The license is the same as whole QEMU=
,
> which basically means GPL2.

Thanks for the confirmation

Best,
Clement

>
> /mjt

