Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48717C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:18:02 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.14973.1681222674202097842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 07:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=gsNM+bpE;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a29so9410881ljq.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681222672; x=1683814672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b73bNgqU8Wa7/TfVvnIzcGtGyT9WABMumcLiET7jL0=;
        b=gsNM+bpEFdo/zysAiFN4L4KXNYpmaFaCZ8yL3TJ7ZksUmPtvYyH8PZmPRgxTto/8u4
         rmCFXn+w3MWbNvEQWVcgq1wX9uMShm6QwsVovG7BnXYLUL9fl3qb9UCNXLlOJexiZum/
         ggG5Iha/+MQpfJ4sKNKOetY7xPGYxn7zbQmBAgRrEI8sUFlSTdF6ZMlNmt5Yn7MgV0jV
         nIaq3YcnrcDO/yLFr1g1g7jHCrpkBBsCmCZObqP3NChblV32lyAUf2DSf1pAectoqT6r
         TnI17rGCKTtDXAhagJxpQ2MlsXy/fn6IIxc42yRFUw4Zt+vjm8eFPKmLVetdpDi12LTS
         ScxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681222672; x=1683814672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6b73bNgqU8Wa7/TfVvnIzcGtGyT9WABMumcLiET7jL0=;
        b=eQyN1cIrpT9Os4pWZlEo0oneYY0uEigSqU4FnWq4LH2OntaxDDO+HgC4DQZsIkCz2a
         Q9DY8NP4kodaRmGMRdt2gBfN9nEj4cbTpbBJN/GjtOiSKnyQTQ+hghF7NWBpgHokAata
         +TWYaLQDQzFLWnVC9kuohoXksBbzRQlL9KPa2knAt7hCDg+NULVOGSj3yJUWImav/Kse
         CXHDTvcSZqUiDyzzPU/kbWB4vDqbA4rh7zH9azgaYftw+O2/JA6GdidM9fu5ZqNtCHYH
         6pm/WnzkKWVF39FPj6YcMxdmpzBL/J4Zvvpv/GuqW9qXw1D+7l0qVnfv1vd8do83d21Z
         yCCA==
X-Gm-Message-State: AAQBX9fSNQ1RSZO+Jshr+WqtPHM9DUCe0M7pjUD3JJUWuozBgDCkdtXd
	aleQqCndFJVple9SqxQOKcMEemYq07AUq1n/E+A=
X-Google-Smtp-Source: AKy350Y1r07QFZq9VM4aMl28TsQANau//wIyr8y0wp9BM4EGD4l2Ehe869s8r27Cd5BPpDHHysyLnvwejcbG+lW5jMo=
X-Received: by 2002:a2e:80c3:0:b0:2a3:5c1c:ec20 with SMTP id
 r3-20020a2e80c3000000b002a35c1cec20mr3232386ljg.7.1681222672379; Tue, 11 Apr
 2023 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de> <20230331104025.1478393-5-ejo@pengutronix.de>
 <CANNYZj8Z1kSGOpZ7jj5bRT++ugPNTrbzyuFdF6y7TYc98bqqtg@mail.gmail.com> <d781cf840988282726b4d09217f5080704ec1343.camel@pengutronix.de>
In-Reply-To: <d781cf840988282726b4d09217f5080704ec1343.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Apr 2023 16:17:41 +0200
Message-ID: <CANNYZj-477UWNDOUM_y1TUzQGFkhn9ZDVz1M9pW1Yw97QVPb+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] oeqa/utils/qemurunner: support ignoring vt100
 escape sequences
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 14:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179921

Right, but this information should be recorded in commit message, or
the file itself.

Alex

On Mon, 3 Apr 2023 at 15:02, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
>
> Hi Alex,
>
> Am Freitag, dem 31.03.2023 um 16:05 +0200 schrieb Alexander Kanavin:
> > On Fri, 31 Mar 2023 at 12:40, Enrico Jorns <ejo@pengutronix.de> wrote:
> > > +re_vt100 =3D re.compile(r'(\x1b\[|\x9b)[^@-_a-z]*[@-_a-z]|\x1b[@-_a-=
z]')
> >
> > This piece of 'magic' needs to be explained :) What does it define?
>
> this is actually 'stolen' from labgrid's implementation for barebox[1] or=
 shell[2] drivers which
> have exactly the same needs: They need to remove the ansii (color) contro=
l codes from the strings in
> order to match the text only.
>
> The unprocessed barebox console prompt would look like:
>
>   ESC[1;32mbarebox@ESC[1;36mARM QEMU virt64:/ESC[0m
>
> where we cannot match for something like "barebox@ARM QEMU virt64:/".
> The same applies to colored linux terminal output of course.
>
> The "\x1b\[" from the regex catches the standard start of ansii escape se=
quence while the rest
> catches the actual command code executed.
>
>
> Regards, Enrico
>
> [1] https://github.com/labgrid-project/labgrid/blob/e05f530c22513cd775b4f=
84e28f6c8c920b95102/labgrid/driver/bareboxdriver.py#L44
> [2] https://github.com/labgrid-project/labgrid/blob/5d3d5714976b37df0f9a9=
b769c581fe1f83ccbdc/labgrid/driver/shelldriver.py#L61
>
> > Alex
> >
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|
>

