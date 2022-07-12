Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7535AC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 12:32:09 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.8501.1657629126105712592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 05:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O0ADs4fr;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id fz10so7487308pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xYzREfrkbsSCqEw+sz1dk70SDG1gbgrmm+AvjhnHi+Q=;
        b=O0ADs4frFCCnbjBK6Bk0Ie03fkvnje8Q2SAkoE2bM7oCuUD61z8EaK1ANTO7l9A875
         BTVkL/XJ84TfMivKsS/vRoni/eAoG025O+jliwk5gj3cZMQshlMXVIieXhPq3yKhL4/L
         KS1SKtCTwzVNAW8jfM2VZKIgrJb9ZXhxonRk+weUXk5XjMUZXvL/drTI8njMeCApb98h
         slOb+PuGzdvxxibSNCAJ5HmRGqqPy2siv++4FV0Z9DIeg/h7YhZb2JU0UJAgXuv12nR+
         4IAkR0OsB7OMRqaBnMFReWyAkY97ZXAb7f9KJYuv80bxCGzIDwP3syEEhGu96B+9j46h
         xBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xYzREfrkbsSCqEw+sz1dk70SDG1gbgrmm+AvjhnHi+Q=;
        b=uJ1sPoEB/zmDy7EiIdjIFdXhWWwgbZjJ4kqKRbQ+c/LMFCKShUF6cssREWa9Cd1U8D
         xvSuZb6i2jOP9cfXpBYbmEHB73Vd2bsZrp5jzrddNWOrWDhh8Pnz/K52ZguPNxhJQvGG
         xN1X9L09u/Kh8YBpRuszmbq48x4xv+CAB5xYHOCp25h+4qsXIzsTTNcAPCRZY0YdqktM
         p5MaJRzpyJRAkzWt+mBrkSbpwsvIZMYApbS167ez1JnULxk8ioay4uqLZvGpDybp9Dzm
         tT03l1p/58IXDhQS06nEPbBF69fCiEnAepzXIk9EGfrZf1N6UeD25nVGlM6PF+OWwyIN
         TH1w==
X-Gm-Message-State: AJIora+64f/sAS54kJajoje8Z0wlDWUUzKXro1U27L875pxM/l/qx9on
	ybuYDyxHf38irXi3/nN+8nLmeJ+rHvgbZCDjQd0=
X-Google-Smtp-Source: 
 AGRyM1vQQXSlPSzLyqb8xddmuDmnIHSogXbJq4n3Qx/HOcEyzDU3YKYH3R1wedRzjZ2i5k0SYnAMoNrY4MooZRV4a/Q=
X-Received: by 2002:a17:902:b186:b0:16b:d762:6d81 with SMTP id
 s6-20020a170902b18600b0016bd7626d81mr23929207plr.88.1657629125270; Tue, 12
 Jul 2022 05:32:05 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
 <17009EE9B42D5D4F.21011@lists.openembedded.org>
 <1700A558F3D5D3E4.14864@lists.openembedded.org>
 <CADkTA4P=BDAYiZUCN+hhqpyUUAoOckX+RMphyZiwmci3nFrkOA@mail.gmail.com>
 <ce91dc24e3a6d7c011c6b3f0bb79ac404f597a1f.camel@linuxfoundation.org>
In-Reply-To: 
 <ce91dc24e3a6d7c011c6b3f0bb79ac404f597a1f.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Jul 2022 08:31:53 -0400
Message-ID: 
 <CADkTA4M8NQgNNodsSnQdPRLfHLWrJAPfdzzmZgNoYxV9bP8JJw@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alejandro Hernandez Samaniego <Alejandro.Hernandez@microsoft.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 12:32:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167925

On Tue, Jul 12, 2022 at 6:44 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-07-11 at 00:06 -0300, Bruce Ashfield wrote:
> > On Sun, Jul 10, 2022 at 11:27 PM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > On Sun, Jul 10, 2022 at 9:29 PM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
> > > > > > On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > Hi All,
> > > > > > >
> > > > > > > We've made good progress and I appreciate the help from peopl=
e. I ran a
> > > > > > > fresh build on the autobuilder and I forced it to rerun the Q=
A checks
> > > > > > > for all recipes. The tricky bit about warnings is that they d=
on't show
> > > > > > > up for objects from sstate and the addition of the buildpaths=
 QA check
> > > > > > > doesn't cause the checks to rerun. Due to that a few more pre=
visouly
> > > > > > > unseen issues cropped up.
> > > > > > >
> > > > > > > The list of issues now stands are:
> > > > > > >
> > > > > > > qemuppc:
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/bu=
ilds/5428
> > > > > > > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /=
lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.=
h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> > > > > >
> > > > > > I'll take this one. My fix was only for arch/arm, but I'll expa=
nd it
> > > > > > to cover ppc32.
> > > > >
> > > > > Thanks.
> > > > >
> > > > > I built qemuppc locally and got a different failure, I'd really l=
ike to
> > > > > know why I saw that and the autobuilder did not. The failure was:
> > > > >
> > > > > WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 =
do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC=
+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/conso=
lemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
> > > > > File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa=
3abf07b-r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package =
linux-yocto-src contains reference to TMPDIR [buildpaths]
> > > >
> > > > I have the devsrc fixed for qeumppc32, fix incoming shortly.
> > > >
> > > > But for this one, I don't see it either. What do I need to enable t=
o
> > > > get the linux-yocto-src package ? Mine is empty, hence no warning. =
Is
> > > > it one of the archiver modes ?
> > >
> > > I sent a series with a fix for qemuppc32 kernel-devsrc and a WIP fix
> > > for the conmakehash issue, I'll have a look at oid_registry next.
> >
> >
> > oid_registry is a perl script .. also capturing the full path of the
> > executable. I did a similar fix for linux-yocto 5.15 and used
> > 'basename' versus the whole path.
> >
> > If these hold up, we can expand the versions that get the fix.
>
> Thanks. I spent a bit of time working out why I was seeing things the
> autobuilder wasn't. It turns out:
>
> https://git.yoctoproject.org/poky/commit/?id=3Dc725bdb29b2669e53ea0f9d30f=
9683f094c9b326
>
> broke kernel source handling (and hence SPDX license handling for the
> kernel too). I was using an older build where that wasn't present,
> hence I saw more kernel errors.
>
> With your fixes and the above reverted, I ran another build overnight
> and in that we saw:
>
> beaglebone:
> WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_4c875cf137-r0 do_packa=
ge_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f122fe5=
9e7_4c875cf137-r0/linux-beaglebone_yocto-standard-build/lib/oid_registry_da=
ta.c in package linux-yocto-src contains reference to TMPDIR
>
> beaglebone-alt:
> stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_8038166b72-r0 =
do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOIN=
C+5b3dacac6f_8038166b72-r0/linux-beaglebone_yocto-standard-build/drivers/tt=
y/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to T=
MPDIR
>
> edgerouter:
> stdio: WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_b978686694-r0 d=
o_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+=
f122fe59e7_b978686694-r0/linux-edgerouter-standard-build/lib/oid_registry_d=
ata.c in package linux-yocto-src contains reference to TMPDIR
>
> edgerouter-alt:
> stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_43577894d2-r0 =
do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOIN=
C+5b3dacac6f_43577894d2-r0/linux-edgerouter-standard-build/lib/oid_registry=
_data.c in package linux-yocto-src contains reference to TMPDIR
>
> meta-intel:
> tdio: WARNING: linux-intel-5.15.43+gitAUTOINC+ea948a0983_1ec5959a8f-r0 do=
_package_qa: QA Issue: File /usr/src/debug/linux-intel/5.15.43+gitAUTOINC+e=
a948a0983_1ec5959a8f-r0/linux-corei7-64-intel-common-standard-build/drivers=
/tty/vt/consolemap_deftbl.c in package linux-intel-src contains reference t=
o TMPDIR
>
> qemumips-alt:
> tdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_cdec08a505-r0 d=
o_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC=
+5b3dacac6f_cdec08a505-r0/linux-qemumips-standard-build/drivers/tty/vt/cons=
olemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
>
> qemuppc-alt:
> stdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_c0821a7ab5-r0 =
do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOIN=
C+5b3dacac6f_c0821a7ab5-r0/linux-qemuppc-standard-build/drivers/tty/vt/cons=
olemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
>
> so thankfully that looks like the two errors we know about spread over
> different kernel versions. I think a version bump for yocto-bsp would
> fix some of them and backports to 5.10 some of the others?

Yup, my fixes should hold for those as well.

I'll send bumps to 5.10 and the BSPs this morning.

Bruce

>
> I'm sharing the full info in case you spot any patterns I don't! :)
>
> In summary, we're down to these and the lttng-modules issue which
> appears when we start checking .debug files in buildpaths (patch added
> and reverted in master-next currently).
>
> Cheers,
>
> Richard
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

