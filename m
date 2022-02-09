Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26A9C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 15:35:45 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.27944.1644420944634557845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 07:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MKK6mgCy;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id e18so1938204vsq.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FFlCFzuszFxKP0H3wW8SntsIDJz5pEViHR2wHUI7sPE=;
        b=MKK6mgCyQ3BXgBuTQ6izslNauOOYgMl4OzwekYtYT41XwpNQzYkHE7aIcRfpk4ciiJ
         d78K9cz1b0qdzr+Nlo3GTYp8OZF9Cre0SMslFQd9Of3b0ak5PPK0UjGrDVZZo3KsfnFG
         Ft+6ZAEUZ/OTIJyQx9uIH/v1eckLSdKbEPZkM4mRYqe6gXlrF0ZxEpYcvrzsxRFVRcSA
         bxgYg6ssj+vT9SFA/U/+HkBmWo76rZJrwtxQ/cRm8LQacTCapvekIHe01Sqs5ZT5DbCA
         ++9wfoHS5/URzm7mc/XHC4s1uvC+Sq03HfdsVyEkSedoEj0ed0ODKwBdPQFI4wF7bqgR
         LOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FFlCFzuszFxKP0H3wW8SntsIDJz5pEViHR2wHUI7sPE=;
        b=wlpnz3J3gJyIW/Mp09zZ/I7QnSzRbofuJC9Z3+p2AANK7fhXDdDy2zFoZRIBDDcqUI
         Kr/UQc5yjwNIIIpy6CaO2dvYWaAwjXynRLgbdIuD6Bh5ZDHVGOt+1Shr711Du7bjeUeg
         nKlhcf/y146UdUEtEGLqamoCF/M/1ulaYhwauprsTgM3lV7I2n5iHw9p5b3OioCIzHpH
         6kxyzdfEZezxL/3NjSqCk2dlqf3YUyCTIY4cws5xPGol3dklwAXun4FJYEOv/AFAP/DY
         /DMro2/5IZc2Rk5m/fw8WAWJ4prMUiu6XXcBsZZS6KeIaXgIGWXNYQmokablDGRnWkrq
         tUPA==
X-Gm-Message-State: AOAM5320GX3PFGwN59lPDrpiJtxfFbYVVJv5nsBQ4V+gvPsxKxXr/BVK
	7RRMevtXHyb5DKLuvlqzhOOoOwkiOlsSdyEwheg=
X-Google-Smtp-Source: 
 ABdhPJz0opAGImRsc5w7XxPEIvDXByQETt9TqzzqM2jcPgnekMsP35XPiaKeLt6IIKRQcuO+SN8JTRrb4guIwdeauBQ=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr849062vss.45.1644420943718;
 Wed, 09 Feb 2022 07:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20220209095307.4080727-1-zboszor@pr.hu>
 <CANNYZj8c6brrf_ApjKD8Hj4DpSpAx7Xp+DAbWbz0aYR8eEufng@mail.gmail.com>
 <03140b0b-29cb-8f5e-e40c-f1df7d92d728@pr.hu>
 <CANNYZj9aphxFcy=2TVM6F-97T77VzAvNJwFkr4yDBcJk_KJk7w@mail.gmail.com>
 <16D225F453B8EF12.12172@lists.openembedded.org>
 <4f0d115b-0fd7-877e-39be-08f1dd760ee6@pr.hu>
In-Reply-To: <4f0d115b-0fd7-877e-39be-08f1dd760ee6@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Feb 2022 16:35:32 +0100
Message-ID: 
 <CANNYZj_1wNMh2oZWBuooinxhXKG68NRTG8R++gzF-RYuJbn2Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuboot: Fix NoneType error in
 do_write_qemuboot_conf
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 15:35:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161567

Right, I think the patch is ok then, but please change the commit
message so that it specifically mentions UNINATIVE_LOADER.

Alex

On Wed, 9 Feb 2022 at 16:27, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@pr.hu> wrote:
>
> I guess this commit below is what broke the image build for me,
> as it added UNINATIVE_LOADER handling to qemuboot.bbclass.
>
> commit 39c10816d5ec9d9c7952d786d7a3f942d25d0c27
> Author: Alexander Kanavin <alex@linutronix.de>
> Date:   Fri Feb 4 20:59:43 2022 +0100
>
>      runqemu: preload uninative libraries when host gl drivers are in use
>
>      Some of the host distributions build the drivers in a way (RPATH/RUN=
PATH)
>      that tricks uninative loader into loading pieces of the host libc, i=
f
>      the same pieces haven't been previously loaded by native binaries. M=
ixing
>      the two libc versions leads to failures.
>
>      This change ensures that the correct (uninative) versions are always=
 in use.
>
>      Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
> Zolt=C3=A1n
>
> 2022. 02. 09. 15:55 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > I have added a bb.error line to print the value of "k".
> > It's "UNINATIVE_LOADER".
> >
> > I am not touching this variable in my custom distro layer. Should I?
> >
> > Zolt=C3=A1n
> >
> > 2022. 02. 09. 11:56 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >> Right, but this might be fixing the symptom, and not the problem.
> >>
> >> Alex
> >>
> >> On Wed, 9 Feb 2022 at 11:53, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <z=
boszor@pr.hu> wrote:
> >>>
> >>> (Resending from the address I am subscribed with.)
> >>>
> >>> I have no idea.
> >>>
> >>> It was working a week ago for me but today after "repo sync"
> >>> the image build failed on me with the quoted error.
> >>>
> >>> With this fix, the image is built with the expected contents.
> >>>
> >>> The change with "if val.startswith()" was from 2017,
> >>> something around it must have changed very recently.
> >>>
> >>> Zolt=C3=A1n
> >>>
> >>> 2022. 02. 09. 11:35 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >>>> Wait, why val is none in the first place? Why aren't others seeing i=
t?
> >>>>
> >>>> Alex
> >>>>
> >>>> On Wed, 9 Feb 2022 at 10:53, Zoltan Boszormenyi via
> >>>> lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrot=
e:
> >>>>>
> >>>>> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>>>>
> >>>>> I got this error on current master:
> >>>>>
> >>>>> File: 'exec_func_python() autogenerated', lineno: 2, function: <mod=
ule>
> >>>>>        0001:
> >>>>>    *** 0002:do_write_qemuboot_conf(d)
> >>>>>        0003:
> >>>>> File: '.../layers/openembedded-core/meta/classes/qemuboot.bbclass',=
 lineno: 141,
> >>>>> function: do_write_qemuboot_conf
> >>>>>        0137:        else:
> >>>>>        0138:            val =3D d.getVar(k)
> >>>>>        0139:        # we only want to write out relative paths so t=
hat we can
> >>>>> relocate images
> >>>>>        0140:        # and still run them
> >>>>>    *** 0141:        if val.startswith(topdir):
> >>>>>        0142:            val =3D os.path.relpath(val, finalpath)
> >>>>>        0143:        cf.set('config_bsp', k, '%s' % val)
> >>>>>        0144:
> >>>>>        0145:    # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is =
the name of a symlink
> >>>>> Exception: AttributeError: 'NoneType' object has no attribute 'star=
tswith'
> >>>>>
> >>>>> Do nothing if "val" is None.
> >>>>>
> >>>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> >>>>> ---
> >>>>>    meta/classes/qemuboot.bbclass | 2 ++
> >>>>>    1 file changed, 2 insertions(+)
> >>>>>
> >>>>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.=
bbclass
> >>>>> index 229bd88527..755d49acd6 100644
> >>>>> --- a/meta/classes/qemuboot.bbclass
> >>>>> +++ b/meta/classes/qemuboot.bbclass
> >>>>> @@ -136,6 +136,8 @@ python do_write_qemuboot_conf() {
> >>>>>
> >>>>> 'qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/')
> >>>>>            else:
> >>>>>                val =3D d.getVar(k)
> >>>>> +        if val is None:
> >>>>> +            continue
> >>>>>            # we only want to write out relative paths so that we ca=
n relocate images
> >>>>>            # and still run them
> >>>>>            if val.startswith(topdir):
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161564): https://lists.openembedded.org/g/openembed=
ded-core/message/161564
> > Mute This Topic: https://lists.openembedded.org/mt/89018458/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@pr.hu]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

