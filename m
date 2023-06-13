Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76320EB64D8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 15:12:27 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.15851.1686669140306670736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 08:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=m7cXZxYc;
 spf=pass (domain: foundries.io, ip: 209.85.208.169, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b1bb2fc9c6so69132641fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1686669138; x=1689261138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot5QvpXjmQ/2BoLEvGbL3CkVehPSns/n6VEFeyrkTWQ=;
        b=m7cXZxYcg06JVz4UeOTjmC5ZCXs1caBDqY8RCKk4XXV9yc2HZca0Cs2szKAos49iWV
         BV7nXeUwVen+ZepNIE5McEOTGq5UDWQ/vUCzi3Pb1UhfORoHouBwV1CrIpJSDPqrKrT5
         yOAEVSDAJnEG9n5dg5GYJBEI0vqH9QJW/1c391sMFYb+pSMbd5NHI91gTFD8WVD9PBeM
         TzkVqMdSDIfK9wIAqWUV5wbJs/ZfJzBWBcxW7LJgLnNh0/UQEXOz/BhZTJGjzavqpnC2
         EtJoKRBdh3cuTu+Yl7trd5RE0Z921EUoZDeA91Z+5FdBjBcQ7v6EK6IcZ8kgOHtyQYEf
         gZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686669138; x=1689261138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot5QvpXjmQ/2BoLEvGbL3CkVehPSns/n6VEFeyrkTWQ=;
        b=em6ax3TzdVtTHUZcTOfuT3IO9c/41/RzdmcOY7cwU8yCOnReuekL9zXpB/37GjOZm6
         Tct5USC43vq30sHW2Rbxz3ZLSa9UELLBAVutB3efR/qvNv+PxSF7krDdaiECgURspvjX
         cFBR15YUBfj4tndYLcqNWBINHJG1pQvwCrwzJKYabnKG6VKwK4ugkeYqJUTj22xs+TS4
         lnBn2efOUS5rMT2az+xvkrPfHKhjEDr2qB/Hcy8k8U6eDDC2qxnawenN36Ro4RjjBVlC
         zi3C9+zQc9P1xXf4dPvcyu25FPHfO7Ch+0Af9h100FiVEBXVEx1I5Tc8zyEDzNdIotyX
         CVoQ==
X-Gm-Message-State: AC+VfDyrV71EOpxgeWqzNFpn+XD/a28uopghvLu+YaTCxmPI9P/V7Kjc
	xe4Tp54O8JbM0nMmNvC3DjkbTg0JbmJmsNh2FEbC
X-Google-Smtp-Source: ACHHUZ47bTf2a11B5tvC9q+orIoou9bHBBIhQs/5a4VHy5ETcCcdMpXoNlK7QvVQ2uIGmGb0lgFh4FZSMeWGyc72FQw=
X-Received: by 2002:a2e:8417:0:b0:2ad:d422:f334 with SMTP id
 z23-20020a2e8417000000b002add422f334mr4531893ljg.17.1686669138398; Tue, 13
 Jun 2023 08:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230328084141.49802-1-Qi.Chen@windriver.com> <CAAaKDhEE0PDexvfPYDcn27Sxzs78Db=Br9GNb+DbQ7MVH8oizw@mail.gmail.com>
 <CAOSpxdb+Z+nOB0u4qyqxD50bEhyAqXijBgwmH4-LcJNp6NLUyw@mail.gmail.com>
In-Reply-To: <CAOSpxdb+Z+nOB0u4qyqxD50bEhyAqXijBgwmH4-LcJNp6NLUyw@mail.gmail.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Tue, 13 Jun 2023 12:11:42 -0300
Message-ID: <CAAaKDhFnhgN3KKQt7KozeXKB5FSUaiyMnmkSoygB3koxK+8y8Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssh: fix CVE-2023-28531
To: Steve Sakoman <steve@sakoman.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 15:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182718

On Tue, Jun 13, 2023 at 12:08=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:
>
> On Mon, Jun 12, 2023 at 4:00=E2=80=AFPM Ricardo Salveti <ricardo@foundrie=
s.io> wrote:
> >
> > Hi,
> >
> > Was looking if CVE-2023-28531 was backported to kirkstone already and
> > noticed this patch was already proposed before, but not
> > merged/accepted.
>
> Sigh, it looks like I somehow missed this one and no one followed up on i=
t :-(
>
> I've got it in my test queue now.
>
> Thanks for letting me know!

Awesome, thanks!

--=20
Ricardo Salveti

