Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD750C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:44:28 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.7680.1657622657729418828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 03:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YCFfJMWB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so4557284wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=xmV7kcdfCKm1tlwHs2mDv52+xAKx4UUTXqtZ3B1fYP4=;
        b=YCFfJMWBWjcvk/vqp4wJtuNy2Z7j3COX+1m+H/4ilWW4UcAjPo20uutNlaeLoSwLGM
         RZrIxhEUgbNa9cQB0tr0cs9bUT+C80TnjnZ7qLMnc8RSssJsn1Cb+MohjgMTorjkRaiK
         HgbPsxJPSfxn+IWmWlo9gnRrv2ty7orc5Mqj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=xmV7kcdfCKm1tlwHs2mDv52+xAKx4UUTXqtZ3B1fYP4=;
        b=L4iUBTpWsapxuF54CKhXZQpHoS1Nez6FfzttOR9gyQwNjXK50aHzVtAyZco2raiWp+
         EnS2w3ROahTaONFVKxOfwcQ22oVxQ2b5O6aM34x0kqiE0n5KVe5qJ8/5h6viTr6d8zTr
         0eTJ2kv1/qxVbl97LsPjG9kMaTRH6NdhkBElcUQkaUThgzOr4njcvqHi3xHb00s/OxlE
         liQ/CTTknddPieis8ldAAJJ0oaK6YDnKPA01s38UXc0rGPeDtSU7PR4FUS4yfm/PvbG7
         aP1keID64/G4sCUEygCJLW3HMTSv70DE5h7ylSWV7I6JwLPjQZ2IMPi4Bsb0j7ebAoQY
         E1EA==
X-Gm-Message-State: AJIora+jlflDwqgFVR9hEhR82f0q3946poGaKihO8luWPoOQi7X/AjzF
	uPcpZ7F4ie3m2ffW8bCHq4REkg==
X-Google-Smtp-Source: 
 AGRyM1ujQlHudpxKvXaXIzsDKM9NObYa0+Wh4weF6oXqjQomykkL2WUUy+qY6EhpA+yCHlwRHA+cLA==
X-Received: by 2002:a05:600c:4f48:b0:3a0:45dd:8bd5 with SMTP id
 m8-20020a05600c4f4800b003a045dd8bd5mr3184014wmq.80.1657622655907;
        Tue, 12 Jul 2022 03:44:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:375:1449:b69:de14?
 ([2001:8b0:aba:5f3c:375:1449:b69:de14])
        by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b0021d76985929sm7818392wrn.80.2022.07.12.03.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 03:44:15 -0700 (PDT)
Message-ID: 
 <ce91dc24e3a6d7c011c6b3f0bb79ac404f597a1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Alejandro Hernandez Samaniego
	 <Alejandro.Hernandez@microsoft.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2022 11:44:14 +0100
In-Reply-To: 
 <CADkTA4P=BDAYiZUCN+hhqpyUUAoOckX+RMphyZiwmci3nFrkOA@mail.gmail.com>
References: 
	<7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
	 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
	 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
	 <17009EE9B42D5D4F.21011@lists.openembedded.org>
	 <1700A558F3D5D3E4.14864@lists.openembedded.org>
	 <CADkTA4P=BDAYiZUCN+hhqpyUUAoOckX+RMphyZiwmci3nFrkOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 10:44:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167919

On Mon, 2022-07-11 at 00:06 -0300, Bruce Ashfield wrote:
> On Sun, Jul 10, 2022 at 11:27 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > On Sun, Jul 10, 2022 at 9:29 PM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > >=20
> > > On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
> > > > > On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >=20
> > > > > > Hi All,
> > > > > >=20
> > > > > > We've made good progress and I appreciate the help from people.=
 I ran a
> > > > > > fresh build on the autobuilder and I forced it to rerun the QA =
checks
> > > > > > for all recipes. The tricky bit about warnings is that they don=
't show
> > > > > > up for objects from sstate and the addition of the buildpaths Q=
A check
> > > > > > doesn't cause the checks to rerun. Due to that a few more previ=
souly
> > > > > > unseen issues cropped up.
> > > > > >=20
> > > > > > The list of issues now stands are:
> > > > > >=20
> > > > > > qemuppc:
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/buil=
ds/5428
> > > > > > WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /li=
b/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.=
cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
> > > > >=20
> > > > > I'll take this one. My fix was only for arch/arm, but I'll expand=
 it
> > > > > to cover ppc32.
> > > >=20
> > > > Thanks.
> > > >=20
> > > > I built qemuppc locally and got a different failure, I'd really lik=
e to
> > > > know why I saw that and the autobuilder did not. The failure was:
> > > >=20
> > > > WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do=
_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b=
35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/console=
map_deftbl.c in package linux-yocto-src contains reference to TMPDIR
> > > > File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3a=
bf07b-r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package li=
nux-yocto-src contains reference to TMPDIR [buildpaths]
> > >=20
> > > I have the devsrc fixed for qeumppc32, fix incoming shortly.
> > >=20
> > > But for this one, I don't see it either. What do I need to enable to
> > > get the linux-yocto-src package ? Mine is empty, hence no warning. Is
> > > it one of the archiver modes ?
> >=20
> > I sent a series with a fix for qemuppc32 kernel-devsrc and a WIP fix
> > for the conmakehash issue, I'll have a look at oid_registry next.
>=20
>=20
> oid_registry is a perl script .. also capturing the full path of the
> executable. I did a similar fix for linux-yocto 5.15 and used
> 'basename' versus the whole path.
>=20
> If these hold up, we can expand the versions that get the fix.

Thanks. I spent a bit of time working out why I was seeing things the
autobuilder wasn't. It turns out:

https://git.yoctoproject.org/poky/commit/?id=3Dc725bdb29b2669e53ea0f9d30f96=
83f094c9b326

broke kernel source handling (and hence SPDX license handling for the
kernel too). I was using an older build where that wasn't present,
hence I saw more kernel errors.

With your fixes and the above reverted, I ran another build overnight
and in that we saw:

beaglebone:
WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_4c875cf137-r0 do_package=
_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f122fe59e=
7_4c875cf137-r0/linux-beaglebone_yocto-standard-build/lib/oid_registry_data=
.c in package linux-yocto-src contains reference to TMPDIR

beaglebone-alt:
stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_8038166b72-r0 do=
_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOINC+=
5b3dacac6f_8038166b72-r0/linux-beaglebone_yocto-standard-build/drivers/tty/=
vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMP=
DIR

edgerouter:
stdio: WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_b978686694-r0 do_=
package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f1=
22fe59e7_b978686694-r0/linux-edgerouter-standard-build/lib/oid_registry_dat=
a.c in package linux-yocto-src contains reference to TMPDIR

edgerouter-alt:
stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_43577894d2-r0 do=
_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOINC+=
5b3dacac6f_43577894d2-r0/linux-edgerouter-standard-build/lib/oid_registry_d=
ata.c in package linux-yocto-src contains reference to TMPDIR

meta-intel:
tdio: WARNING: linux-intel-5.15.43+gitAUTOINC+ea948a0983_1ec5959a8f-r0 do_p=
ackage_qa: QA Issue: File /usr/src/debug/linux-intel/5.15.43+gitAUTOINC+ea9=
48a0983_1ec5959a8f-r0/linux-corei7-64-intel-common-standard-build/drivers/t=
ty/vt/consolemap_deftbl.c in package linux-intel-src contains reference to =
TMPDIR

qemumips-alt:
tdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_cdec08a505-r0 do_=
package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC+5=
b3dacac6f_cdec08a505-r0/linux-qemumips-standard-build/drivers/tty/vt/consol=
emap_deftbl.c in package linux-yocto-src contains reference to TMPDIR

qemuppc-alt:
stdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_c0821a7ab5-r0 do=
_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC+=
5b3dacac6f_c0821a7ab5-r0/linux-qemuppc-standard-build/drivers/tty/vt/consol=
emap_deftbl.c in package linux-yocto-src contains reference to TMPDIR

so thankfully that looks like the two errors we know about spread over
different kernel versions. I think a version bump for yocto-bsp would
fix some of them and backports to 5.10 some of the others?

I'm sharing the full info in case you spot any patterns I don't! :)

In summary, we're down to these and the lttng-modules issue which
appears when we start checking .debug files in buildpaths (patch added
and reverted in master-next currently).

Cheers,

Richard



