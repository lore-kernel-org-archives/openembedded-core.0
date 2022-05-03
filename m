Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B3DC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 13:55:25 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.11389.1651586121008007445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 06:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NvAImIeR;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id l7so33642360ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B8a96XxmiKQZb2uSjh6iqudHRv1okfzSHia1H6jdEJ4=;
        b=NvAImIeR0MLsubrjdviK/pZX6KLpiCk4WDAU6LnprCNVP9WMCPq9k/HlCDCm8jHUhr
         ULM/PX9MDB4YNhUAAl3+caz+Ngc2u5IclQYwFJHbP6mxddhYBcNOpe+kTMwCl8+3r/71
         9TM2ZrvrTLPjZmGQZDAoCHnaM7X0ydWlalgUATZt6YA4MwScst4OhYpnM55krb8MyTWe
         K+Sfn51ZCoTGuipUxahfcQBaj0e0wlo9J9l2pOfAT8xvglEpgwdh6fduo+mRAvBiKrYX
         yRcxi4isZzWCii8g1zTL6zDc+idJPPAsKJHlQGakhpn+eC1wBtdxLP/DrN74VjH6sw2N
         NWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B8a96XxmiKQZb2uSjh6iqudHRv1okfzSHia1H6jdEJ4=;
        b=AAI6dNLZbwaGY8ZZAyTeCwjD/N9uGcwzKRtkpcTKBGqJxnY4sX2lNMBrNWZybIwIL2
         d2YZxzLm8WiZ3Ie2jrzaetBhI2a2pOgtSgImHCKlyLr3EI6TEjzeLDG4csbxdEblAnsr
         U/njynSBAe6xVtS6R5HwUUOAGfl69tXnIok45iRG5CIotUR3IJYG+9ua5UFaueWfxdpk
         QIsEQ7ur2ZQ4p0pqdI/Xcu+k3A/yaXKt45ckoazIvlNADV7gcQ6vmPzjumv2ow/N40Wb
         9yf/9m0H4alVHDhIQWHLcG3DQw2x9DgHB5kO6Ms6pHYRZJ904VycNVBYSzIt7RitRTpf
         QnKw==
X-Gm-Message-State: AOAM532GamG0eZXwuYuelG6S5QAOCYNHbiJLbAM+5tVYemw35Z2Nv+te
	kuIJYUMZcXAsy1mA85XRS9vCSktDM43u/U+wW7GU5A==
X-Google-Smtp-Source: 
 ABdhPJyfQR3LUY0GfuMwI3yeUnCMHKGT5xkD26lQIt2x27JjXobAXcNA30lKSCW/GWq2A2UP+njSTV0/+GVzXn7HgdY=
X-Received: by 2002:a17:907:3f8b:b0:6e8:318d:1def with SMTP id
 hr11-20020a1709073f8b00b006e8318d1defmr16141625ejc.153.1651586119254; Tue, 03
 May 2022 06:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651531749.git.steve@sakoman.com>
 <214a2fe628801af3fde5b540c31f1c515f6c855f.1651531749.git.steve@sakoman.com>
 <e1dfa49e3a2b44b8af449ff171dfba9e@axis.com>
In-Reply-To: <e1dfa49e3a2b44b8af449ff171dfba9e@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 May 2022 03:55:07 -1000
Message-ID: 
 <CAOSpxdZvQTo6Kk2JM96ut7J7=9ST4w1=m2_spsdve0USAL-L3g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 3/9] devshell.bbclass: Allow devshell &
 pydevshell to use the network
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 13:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165202

On Mon, May 2, 2022 at 9:52 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Steve Sakoman
> > Sent: den 3 maj 2022 01:03
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core][dunfell 3/9] devshell.bbclass: Allow devshell &
> > pydevshell to use the network
> >
> > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >
> > Otherwise it will fail if using OE_TERMINAL = "xterm" with the not so
> > helpful error:
> >
> >   xterm: Xt error: Can't open display: localhost:0.0
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit ba53fc3bcecfe32401471dc1008c7ead96504150)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/devshell.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> > index 76dd0b42ee..ad9f267848 100644
> > --- a/meta/classes/devshell.bbclass
> > +++ b/meta/classes/devshell.bbclass
> > @@ -21,6 +21,7 @@ addtask devshell after do_patch
> > do_prepare_recipe_sysroot
> >  DEVSHELL_STARTDIR ?= "${S}"
> >  do_devshell[dirs] = "${DEVSHELL_STARTDIR}"
> >  do_devshell[nostamp] = "1"
> > +do_devshell[network] = "1"
> >
> >  # devshell and fakeroot/pseudo need careful handling since only the final
> >  # command should run under fakeroot emulation, any X connection should
> > @@ -154,3 +155,4 @@ python do_devpyshell() {
> >  addtask devpyshell after do_patch
> >
> >  do_devpyshell[nostamp] = "1"
> > +do_devpyshell[network] = "1"
> > --
> > 2.25.1
>
> This shouldn't be needed for Dunfell, should it? I would assume the support
> for blocking network operations per task hasn't been backported.

Thanks so much for the review Peter!

Clearly I haven't yet perfected my mode switching between kirkstone
and dunfell :-(

Steve

