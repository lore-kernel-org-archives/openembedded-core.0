Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C78C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 13:03:42 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.13318.1693400617043353458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 06:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KC5L2TvF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so4672531f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693400615; x=1694005415; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mOrJkR/5bNbIEzR3pBlMPrYb2lZzmOjjtv3m13SUmrI=;
        b=KC5L2TvFgX5tb0U2/dQTrv9X6ytwIFvT1+nH5JovOjoy1tnG4pCefeEEbWnN9leV15
         3/s8MO797QmxFYvFALnHFrfNQMiPM/KUMT86NP2ZleUuLZiCYIrfL8ndPs1/4tgimM7m
         YjZdlTE2S9X/yME0Ezd1u/sbEgmsrHBUQM+Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693400615; x=1694005415;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOrJkR/5bNbIEzR3pBlMPrYb2lZzmOjjtv3m13SUmrI=;
        b=PpY685rrPolQgI4pXFsm/1ix/VuUp+Pj2L1gyukaxDK43er3tTdk3w8CT1/l0wEW9R
         x7wNKAxNmpnAxtnt5R8dhij0Kp/cvBXd9Ln6nRRm0EhciB/ef1S5upaHTQcMHjXjk652
         rPC9ikCQK2jP9nVaUQdF+E8bZjmenypWOkAyYuvRZDokOdlfCDQM5sj3AGIidmZ7GUoz
         3brtuRRV3gzRriMuVED2ndpHNWHzevsNIHmKSI5mkYl+FCGfozzH8kGXdSl78f25YK4/
         Ej+LJRgYVTFK1ljaXyvkfQqd5L0APimghqmyxqoD9nq1dCD9DHZp5100rvZPQZZcKagK
         zgrg==
X-Gm-Message-State: AOJu0Yz06ZT1U5EYmCFJoou5PZ+vS7GHHqKNOYYYCSKg7Gizi6fjq0BS
	HGKh3tY1TpOrFvcrPt1E9LmGyA==
X-Google-Smtp-Source: AGHT+IHJhH59L+A1ZFJP8ozFBBigGkrxVgeum3SLJ7DxJElywhQGcOUvw7Ti4bRc7EguMgyRKMj8Kw==
X-Received: by 2002:a05:6000:128d:b0:319:6d03:13ae with SMTP id f13-20020a056000128d00b003196d0313aemr1274996wrx.55.1693400615252;
        Wed, 30 Aug 2023 06:03:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15ec:a052:9304:60a5? ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id y1-20020adff6c1000000b00317e77106dbsm16449169wrp.48.2023.08.30.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:03:34 -0700 (PDT)
Message-ID: <d27a78798a712d46c6af89980b533d68cb718fa8.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Ross Burton <ross@burtonini.com>
Date: Wed, 30 Aug 2023 14:03:33 +0100
In-Reply-To: <178023427EE7BA0B.20206@lists.openembedded.org>
References: <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
	 <177DBC07E94591CC.4797@lists.openembedded.org>
	 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
	 <177DD39B5534099F.27837@lists.openembedded.org>
	 <177E1FB73F514F09.8058@lists.openembedded.org>
	 <177E56C1DFAB4DFC.13053@lists.openembedded.org>
	 <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
	 <ZOhJuUWYSU8MmaCK@nuoska> <177E8CC0D944344B.23833@lists.openembedded.org>
	 <178023427EE7BA0B.20206@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 13:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186887

On Wed, 2023-08-30 at 11:43 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2023-08-25 at 07:34 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > > >=20
> > > > qemu 8.1.0 brings with it a new set of problems but I've reproduced=
 the
> > > > hang with 8.1.0 so it does not solve that.
> > > >=20
> > > > I'm really struggling to understand which change brought in these
> > > > issues for qemuppc.
> > >=20
> > > Are these issues visible on mickledore branch? Maybe mickledore with =
kernel 6.1 stable update or
> > > qemu 7.2 update to 8.y.x could be tested too. At least then kernel or=
 qemu could be blamed
> > > for the issues.
> >=20
> > Not that I know of.
> >=20
> > I have now also reproduced the failure with glibc 2.37 instead of 2.38
> > including the fortify sources change and the 6.1.34 kernel so there is
> > something else causing this.
> >=20
> > I've wondered if we need to try going back to qemu 7.2. It may also be
> > worth ruling out binutils.
> >=20
> > It shouldn't be systemd as the sysvinit images show the issue too.
>=20
> I've ruled out the binutils upgrade, the glibc upgrade, systemd, the
> kernel changes and the tar, libarchive and qemu upgrades.
>=20
> I've continued to try and narrow things down and we see the issue from
> this commit onwards:
>=20
> https://git.yoctoproject.org/poky/commit/?id=3D12d9280c3de24c1c2b835e80fa=
1b8be72e9bc63a
>=20
> I did get three clean runs with:
>=20
> https://git.yoctoproject.org/poky/commit/?id=3Dfb51e196a978d452e6a14a8343=
832659da97fdc7
>=20
> but that still could be false negatives as it is intermittent.
>=20
> I'm trying builds of the commits between those two to see if any
> pattern emerges.
>=20
> The qemu 8.1.0 upgrade breaks x86 with qemu kernel hangs seemingly with
> nfs root relatively consistently:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/424/st=
eps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/430/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/427/st=
eps/12/logs/stdio
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/433/st=
eps/12/logs/stdio

This can be reproduced with a "bitbake core-image-minimal" then:

runqemu nographic /XXX/tmp/deploy/images/qemux86-64/core-image-minimal-qemu=
x86-64.rootfs.tar.bz2  bootparams=3D" printk.time=3D1"

If you add "kvm" to the command, it works.

Interestingly dropping the nographic resulted in a different crash with
rcu stalls and fun timestamps.

> I think this was where I was previously worrying about x86 kernel hangs
> from. Now we know the 8.1.0 upgrade is the cause of this, we can
> hopefully get to the bottom of it more quickly.

Bisection brings us fairly conclusively to:

https://git.yoctoproject.org/poky/commit/?id=3Dffd73bef9b9bb5c94c050387941e=
ee29719ca697

"yocto-uninative: Update to 4.2 for glibc 2.38"

which means somehow qemu for qemuppc is breaking when used with glibc
2.38.

Why? No idea.

Cheers,

Richard

