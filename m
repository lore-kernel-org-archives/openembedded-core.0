Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A7EC4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 13:32:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.13442.1673011942848117096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 05:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AsaG1qci;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id cf42so1973054lfb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 05:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aH21GSUHCsj2RmKzmpPGvdQRb7Fv2zA3UCaz6N1OxjY=;
        b=AsaG1qciGa9cKJ6jNLPyzBq+4NZzOcFZ0eU/rOWMuVuMuXN7kDagYgMZz0QNvJpfgJ
         zuYnWrBSCNVN4OyYOwSe4JfKxAXvpg4RK30XhC/MXs0tKGjU1z1O447C+QBD735nhPU0
         4HQcpXGTE41zmleNp4juAR25QwoM73b4Ccm2yZKhYKGJZv0Q1kWebW2NtKItciNWqZ/h
         CfnZ6xYnN00gxAb+SsNlyKb+630HuPsR9fkgl9sTRgzqHnHPdY/MHqESsAKPpkq1ViGj
         GoEe3ylt6Iz/R5c1DjsbLQ56hcBI+9bLJM9ND4FrHj/wU+DM4pO9PwxvmI+NZGZM5OxV
         2U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH21GSUHCsj2RmKzmpPGvdQRb7Fv2zA3UCaz6N1OxjY=;
        b=NhD0akAk1JkRIa0uWDj+pSALCDr0jLWDojAlbK4V2IrgZz3PLLzT14OnwP3qaLTGGW
         9vMHkR0JGMjq7BR+PpbxET51WSn9hgObnuBudKXB45AmwXOFheHulkbr2y31/LpZfqyL
         e4BrtA5uVvX/B2S7+fPNsTNbSHoNwUQ0KiopZOF+7/DjnDRxIE5NkN5PvUG2ypKZKUCU
         pMKFvHPUuRYnm4tI+oJGTPhZGSslzKM6nFHWVCPb4oXuesGMnCRs68O4Z9IiL8i6kpaz
         j148acr2TE5AHlFY/NX6cLuEAjVI3BL8+N/kzb3Yh7AioTm+kgd/93CxJdKNKEQ5Gjd2
         y+rw==
X-Gm-Message-State: AFqh2krn+y14rgImCK04+Xi1s6Z+PWHcya25wCOGoiK5a3dkEmUVZGKA
	FrlXpC4ry/rs4vEDzK871s/8JBNscYF5SrS8Iwo=
X-Google-Smtp-Source: AMrXdXsKTpnsoL62pEZbSyV4TpiPgW1biuQAOZZIkwHw9KQLaACXDYruryCx2fPG4rQvBgSWCu0W3+KAK8IsO0KGyrw=
X-Received: by 2002:a05:6512:261f:b0:4ca:fd2a:d984 with SMTP id
 bt31-20020a056512261f00b004cafd2ad984mr1949771lfb.445.1673011940984; Fri, 06
 Jan 2023 05:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
 <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org>
 <CAA6zWZKmRG8rvmjd-Pec0jKN+jkPH9DyOHFxFVycRuysnizLag@mail.gmail.com>
 <CANNYZj9H__DUKty+N3R=didcPYk9FT7RKSYTQum0H1HPzpbfJA@mail.gmail.com> <CAA6zWZ+Vh_qjeTaJw+c0EzOgmKdsYac2q85ihn0v5A6i=b-Y_Q@mail.gmail.com>
In-Reply-To: <CAA6zWZ+Vh_qjeTaJw+c0EzOgmKdsYac2q85ihn0v5A6i=b-Y_Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 14:32:08 +0100
Message-ID: <CANNYZj_aHCPmBH=Kzr6kvzdnPiDMxauC_q72Zv58zbPwWNrcbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 13:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175589

Now I see what's going on. The fs-uuid class contains two functions:
get_rootfs_uuid, and replace_rootfs_uuid. The former is not used
anywhere, but the latter is. Can you introduce get_rootfs_uuid() into
something in oe-core, perhaps it could enhance existing code somewhere
(maybe complement replace_rootfs_uuid usage?), or a test could be made
better?

Otherwise, it's still not tested, and will regress without notice.

Alex

On Fri, 6 Jan 2023 at 14:11, Pawel Zalewski
<pzalewski@thegoodpenguin.co.uk> wrote:
>
> 1. inherit fs-uuid in some-recipe
> 2. set ROOTFS to some-existing-rootfs
> 3. make call to get_rootfs_uuid somewhere in that recipe ie.
> "${@get_rootfs_uuid(d)}"
> 3. bitbake some-recipe
>
> Pawel
>
> On Fri, 6 Jan 2023 at 12:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Can you please describe steps to reproduce?
> >
> > Alex
> >
> > On Fri 6. Jan 2023 at 13.40, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk> wrote:
> >>
> >> It is not actually being used by default in Yocto ?
> >> This was found in kirkstone.
> >> But regardless, it is wrong and will drop an error.
> >>
> >> Kind regards,
> >> Pawel
> >>
> >> On Fri, 6 Jan 2023 at 12:06, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
> >> > > The default return value from subprocess.check_output is an encoded byte.
> >> > > The applied fix will decode the value to a string.
> >> > >
> >> > > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> >> > > ---
> >> > >  meta/classes/fs-uuid.bbclass | 2 +-
> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> >> > > index 9b53dfba7a..731ea575bd 100644
> >> > > --- a/meta/classes/fs-uuid.bbclass
> >> > > +++ b/meta/classes/fs-uuid.bbclass
> >> > > @@ -4,7 +4,7 @@
> >> > >  def get_rootfs_uuid(d):
> >> > >      import subprocess
> >> > >      rootfs = d.getVar('ROOTFS')
> >> > > -    output = subprocess.check_output(['tune2fs', '-l', rootfs])
> >> > > +    output = subprocess.check_output(['tune2fs', '-l', rootfs], text=True)
> >> > >      for line in output.split('\n'):
> >> > >          if line.startswith('Filesystem UUID:'):
> >> > >              uuid = line.split()[-1]
> >> >
> >> >
> >> > That looks reasonable, I just wonder how this has worked until now? Why
> >> > aren't we seeing errors due to this?
> >> >
> >> > Does it mean we don't have some test coverage? or was there silent
> >> > breakage of some kind this fixes?
> >> >
> >> > Cheers,
> >> >
> >> > Richard
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#175583): https://lists.openembedded.org/g/openembedded-core/message/175583
> >> Mute This Topic: https://lists.openembedded.org/mt/95823853/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

