Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30214C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:07:39 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.5536.1716368852378938250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjGfsGwA;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso83724301fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716368850; x=1716973650; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CKmFTAZ88gjjnpJ4D2Vr92Q6m4RGvHa1uV+0NNnoEzk=;
        b=fjGfsGwAOI82fdsazzKNxjbjxyEka306A3KcvpmPCih6csC1PYmrVmcQyEhbSdbhw6
         bJtCxdAaoqpN/QzVI+RHq3sUt0DTQr92h5Fr+zok2wOBKvK8yR3YPJefNHUlkFzUptCt
         Rb7aV4haMi+t+1b0QY21vHqMeb8GLnOLMudE3pns1ZMUGJUoY0x73XqpUcXB6MH/pgkl
         ovnNRVFW573W9anPhZACxXWdXchVanp5dd9VPV5RwP0iKEWfVDZFj4jCfM7UTjN9TlTz
         C58Axtxnx4MnGXv5k+wUbRN5oR5n6wAsm/sz6ME0OVJ6sWq4jipbQF/nSZxIJewgMb3V
         GO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716368850; x=1716973650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKmFTAZ88gjjnpJ4D2Vr92Q6m4RGvHa1uV+0NNnoEzk=;
        b=Q3FDkriCSAhR/YxdVvUCE9CK8WM9L/BktocR1xrHep3Epu2OX0jCWR+nwwrJA2POxC
         U4f6Ug0cR8RXTa3TSuGUA5coDeMAHQDypCJ+0sPrJQ3pa1UklEqjxcnCsRIrBmdNmaXD
         raMkO8lbIqMJer6IXrWGuIOmRFe7vPLB9iwKl1m2EhCQDjis9am+LUITyO7dpo7tVOCP
         giZyRCHHvVQQBp6Ia8o7cZB/x9hk/Pybu0ijzcSkAiMuZHUygaFRukgmF8jtS7wRklDx
         4C+uKl+Xn9L06/r2iqRekkXWcLXY9wjAdmg14/58wu9Bj5gVPPV4YnMmsoH7OGYigUuc
         hx+g==
X-Forwarded-Encrypted: i=1; AJvYcCXWB9GVmVncjNZrzZRc+gEIxqE2LSzT/o1NXr3+kbnDKXMKoxmq6z8n8BZhHTjHKxZK2LVYWpMuxMZhxZ9DrLyamh3GLSevzkeCFT67IJCIi14a4YFzJV0g
X-Gm-Message-State: AOJu0YwVZ2rNL+yrMupP7M/XajdNBJ5VDYQwaSshCbFffqCgjFQ2KYQm
	oSak1kXWFFUTbJaGDsTm96N4AbnXA0rAv4JZex25/xAKmUX947s9lawZsfqH2QWmcQcBopxxi71
	jaOLOQ4yaO8QxDrZD8ew6p1b76KA=
X-Google-Smtp-Source: AGHT+IHVeLhO/sCuv1aMop6S8gtuymUaymerBB3hDbKp672AHvCKGTXy3v2uoGfOQqXt1QhPy98c5ofPFG3Ut9v9sk4=
X-Received: by 2002:ac2:554b:0:b0:51d:9e17:29f0 with SMTP id
 2adb3069b0e04-526bf07e6b3mr937356e87.24.1716368850247; Wed, 22 May 2024
 02:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240520175706.1840576-1-f_l_k@t-online.de> <20240522090622114b300c@mail.local>
In-Reply-To: <20240522090622114b300c@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2024 11:07:17 +0200
Message-ID: <CANNYZj-5EkpYwcaiQEkxM6dQhXVNSJ-cjodnKHjUoiREUXV8og@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gcc-runtime.inc: additionally remove
 libgomp.info-1 and libgomp.info-2
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199695

I'm also curious in what scenarios is this needed, if the AB doesn't
have the issue?

Alex

On Wed, 22 May 2024 at 11:06, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> Hello Markus,
>
> this doesn't apply on master anymore, can you rebase?
>
> On 20/05/2024 19:57:06+0200, Markus Volk wrote:
> > This avoids:
> > ERROR: gcc-runtime-14.1.0-r0 do_package: QA Issue: gcc-runtime: Files/directories were installed but not shipped in any package:
> >   /usr/share/info
> >   /usr/share/info/libgomp.info-1
> >   /usr/share/info/libgomp.info-2
> > Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> > gcc-runtime: 3 installed and not shipped files. [installed-vs-shipped]
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index dbc9141000..d1c47c5d5c 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -92,7 +92,7 @@ do_install () {
> >               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> >               rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> >       fi
> > -     rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
> > +     rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/libgomp.info-1 ${D}${infodir}/libgomp.info-2 ${D}${infodir}/dir
> >       rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
> >       rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
> >       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
> > --
> > 2.44.0
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199694): https://lists.openembedded.org/g/openembedded-core/message/199694
> Mute This Topic: https://lists.openembedded.org/mt/106208568/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

