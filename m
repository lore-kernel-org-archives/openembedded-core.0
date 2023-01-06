Return-Path: <pzalewski@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E32C4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:40:40 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.12548.1673008837273989328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20210112.gappssmtp.com header.s=20210112 header.b=NtYfNNB8;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.166.41, mailfrom: pzalewski@thegoodpenguin.co.uk)
Received: by mail-io1-f41.google.com with SMTP id b192so628997iof.8
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 04:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jb0E6T3WgtV8jyY09SI5Yqag/XcvrqtyvMEM1RfBKpc=;
        b=NtYfNNB8RByQEN9szIfpmkkoUQaIyjqKqKoGMZBaNTvg/CqyttpNmcAXQuTYjmAN9h
         Ey3nND5YhatGW4k7oX1QJxPdexbCetDfgH6nXQ4DDnLuPcNcaT6fjbEGVJ2wz+/m9Mqi
         jpUfS1/SRo5HHrXQhml9hLj1qJR35QobJmFhTMqK16xBWNd+kL2NiWxpV5YnnVLtZVce
         1IUS8fnYigMzPbcCAuzxz31Fw9x5TLcSIfvaF9B0m8tePbcSNJCk0aOiKMou9fdY38uX
         meIG/hHJfoin+HlvzcMEKnB4nIvXJ93+TQ0+hGVgRzv9AbY75B64I/+aAFwgez+hgQLY
         JlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jb0E6T3WgtV8jyY09SI5Yqag/XcvrqtyvMEM1RfBKpc=;
        b=elQybx0re0H3NehxY4ld6kJiKQa8z1UYZ0KboQWOW5F6w0yA3xbi71rJixMeeYa44c
         8o318c4UWQKwMTVhEYT1XQohcrEWJfxrH+Rw2yHwYlxxs/ER1bUkFEEK3vP0gox3NTXc
         EF1yrYeEok9D1uCzKjUBD2gs98bGRVRZAlEKRdw6qX3KWnWBpbCv+cR1UcLi+QCAZtK9
         10G86WCGx3jpmc5bxLG81OKeDfIJ/zK+5ZY3GdIZsNkW/i3D9FuT9coIE6+zOO9EEoPv
         iA5YUJFWGhnqUzRfwpWxeUhP1hfAHV7VsE555IC1e+fA4UTxBE6SGxSpRt1eTBziPVBR
         AYtg==
X-Gm-Message-State: AFqh2kp5rDfYmsbMqMIFB3q/RQzkJpHI8v7uHkQ/Kk9GazyuYV4Ce2Q9
	F4/I+MOExZyEZOouR3LSQtdALKKJFK3VII9FlZE0wg==
X-Google-Smtp-Source: AMrXdXsDl6AXso+lLM2IMqa8VdDU+zw8z0q87Ey5/D4A4ag1I6wxAHZV1z7xUHuQvJmEt72CPq4fWf8iUdUlw2BvmIg=
X-Received: by 2002:a05:6638:1a7:b0:38a:3770:2fa2 with SMTP id
 b7-20020a05663801a700b0038a37702fa2mr4651106jaq.208.1673008836449; Fri, 06
 Jan 2023 04:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk> <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org>
In-Reply-To: <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 6 Jan 2023 12:40:25 +0000
Message-ID: <CAA6zWZKmRG8rvmjd-Pec0jKN+jkPH9DyOHFxFVycRuysnizLag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175583

It is not actually being used by default in Yocto ?
This was found in kirkstone.
But regardless, it is wrong and will drop an error.

Kind regards,
Pawel

On Fri, 6 Jan 2023 at 12:06, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
> > The default return value from subprocess.check_output is an encoded byte.
> > The applied fix will decode the value to a string.
> >
> > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> > ---
> >  meta/classes/fs-uuid.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> > index 9b53dfba7a..731ea575bd 100644
> > --- a/meta/classes/fs-uuid.bbclass
> > +++ b/meta/classes/fs-uuid.bbclass
> > @@ -4,7 +4,7 @@
> >  def get_rootfs_uuid(d):
> >      import subprocess
> >      rootfs = d.getVar('ROOTFS')
> > -    output = subprocess.check_output(['tune2fs', '-l', rootfs])
> > +    output = subprocess.check_output(['tune2fs', '-l', rootfs], text=True)
> >      for line in output.split('\n'):
> >          if line.startswith('Filesystem UUID:'):
> >              uuid = line.split()[-1]
>
>
> That looks reasonable, I just wonder how this has worked until now? Why
> aren't we seeing errors due to this?
>
> Does it mean we don't have some test coverage? or was there silent
> breakage of some kind this fixes?
>
> Cheers,
>
> Richard

