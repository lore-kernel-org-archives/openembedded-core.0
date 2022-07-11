Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F3FC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 02:27:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.23961.1657506464044937808
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 19:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvA6+RzN;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso3657599pjk.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 19:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BzFcu5rzJSPdKerabt9JiCAUEyqmTBgIeDmlCkKLo+g=;
        b=GvA6+RzNoCjo0MF5/6VvCDP6TUabwkigJBPxgZ//7VgXnCCRthRk9Lnosz0dw7PSap
         p8mM+2kzcyaf0K04c5NrR3izNzM/REJnkopVXypX5P2tkGXoQTJwJk9TLrsRu5K0ZMDR
         knlNciU1N3xKxitxRdJ8n727y0FHjObt3X5Cj64mA0Y/fLkz9cYGBFCbMnuPFE1cblls
         ggEvl7Zty5knCQs8ntGTuTS88eTGzv0ikY/ADtROpIfMWRbNuSKXaYlwae/wgT0Amv89
         8biHKVXMtYZuRPmGM+iqsHEyFk13fhb9MJcyPGI1mh7y5dbWsPGWxdKiGpAJFR945cyx
         VHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BzFcu5rzJSPdKerabt9JiCAUEyqmTBgIeDmlCkKLo+g=;
        b=KWPy04rtrFgCuP6PpVoa3TRDS/zeH709P8CP/jyqK1H+p++UNK9VDWwC6rIV/+Yxi/
         oZG3n4dSCvrD02385vKscmaqPbSQauc7LI3genXGHFPOvqh59jyG4kIFlEj5GSAguwhX
         sQTUHy/ztG08cSDCEOkxEyTyfDj3HWnIm4x0bYP74/r4WgO7YmqBm5/MABJ1oY2m1UhE
         85XrDczJ5IzN6kdM1OSacB1o7Mb1DeXdfvA0tD54C41o3Xli5UPTBjneKmWIuZ6I8h/w
         12Z5NW6hhpP3aRikHlnmFNFYTE19rsxwHBQ3iAeRasHE/yto6xb6NHFNhNd2RU5qiHuz
         nLRQ==
X-Gm-Message-State: AJIora8jTEtQEVYFd1NAZx4tY5ULxTdO7YK32bbvVXk/SGaOzI90gpeS
	Ax7FPsUXUvGqFdUlxifGNc4h4mK1HB2CzZ7ggFc=
X-Google-Smtp-Source: 
 AGRyM1tyKgoIS9Bu3db0gpqfK0XFkkF2YP8kzV5jw7GdLjxaqd0jLzSn0zcnKtyTKccx77afZl+cpKyiPzVxPr9MXJE=
X-Received: by 2002:a17:902:e153:b0:16b:dccf:5a89 with SMTP id
 d19-20020a170902e15300b0016bdccf5a89mr16179140pla.69.1657506463554; Sun, 10
 Jul 2022 19:27:43 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
 <17009EE9B42D5D4F.21011@lists.openembedded.org>
In-Reply-To: <17009EE9B42D5D4F.21011@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Jul 2022 23:27:36 -0300
Message-ID: 
 <CADkTA4PHA2BMjv1rb349Tu_T72zQ-mUG1OGSgCacisTh3dDOMw@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 02:27:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167856

On Sun, Jul 10, 2022 at 9:29 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
> > > On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > Hi All,
> > > >
> > > > We've made good progress and I appreciate the help from people. I r=
an a
> > > > fresh build on the autobuilder and I forced it to rerun the QA chec=
ks
> > > > for all recipes. The tricky bit about warnings is that they don't s=
how
> > > > up for objects from sstate and the addition of the buildpaths QA ch=
eck
> > > > doesn't cause the checks to rerun. Due to that a few more previsoul=
y
> > > > unseen issues cropped up.
> > > >
> > > > The list of issues now stands are:
> > > >
> > > > qemuppc:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5=
428
> > > > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/mo=
dules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd =
in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> > >
> > > I'll take this one. My fix was only for arch/arm, but I'll expand it
> > > to cover ppc32.
> >
> > Thanks.
> >
> > I built qemuppc locally and got a different failure, I'd really like to
> > know why I saw that and the autobuilder did not. The failure was:
> >
> > WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do_pac=
kage_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1=
d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_=
deftbl.c in package linux-yocto-src contains reference to TMPDIR
> > File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07=
b-r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package linux-=
yocto-src contains reference to TMPDIR [buildpaths]
>
> I have the devsrc fixed for qeumppc32, fix incoming shortly.
>
> But for this one, I don't see it either. What do I need to enable to
> get the linux-yocto-src package ? Mine is empty, hence no warning. Is
> it one of the archiver modes ?

I sent a series with a fix for qemuppc32 kernel-devsrc and a WIP fix
for the conmakehash issue, I'll have a look at oid_registry next.

Bruce

>
> Bruce
>
> >
> > sure enough, tmp/work/qemuppc-poky-linux/linux-yocto/5.15.48+gitAUTOINC=
+b35d1d1e83_5aa3abf07b-r0$ head package/usr/src/debug/linux-yocto/5.15.48+g=
itAUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty=
/vt/consolemap_deftbl.c
> > /*
> >  * Do not edit this file; it was automatically generated by
> >  *
> >  * conmakehash /media/build1/poky/build/tmp/work-shared/qemuppc/kernel-=
source/drivers/tty/vt/cp437.uni > [this file]
> >  *
> >  */
> >
> >
> > I think the warning is saying there is a second issue in linux-qemuppc-
> > standard-build/lib/oid_registry_data.c too.
> >
> > Sorry Bruce, not sure why several roads lead to the kernel :/
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167851): https://lists.openembedded.org/g/openembedde=
d-core/message/167851
> Mute This Topic: https://lists.openembedded.org/mt/92248896/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

