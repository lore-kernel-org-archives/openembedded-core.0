Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA5CC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:03:41 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.15265.1720620210928646239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A312tNaO;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so5745400e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720620209; x=1721225009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FF7rP2+PJ2ZvvpWZLjQAQJ1wp4b+Ih/p5xp7h5PUB0=;
        b=A312tNaOOAxj/HH4V5EfTdXcWx16HpQQSMwBgv4HGEkhqqBl+Ic7iC0TZ6ixvRqwiv
         x1KGxVnbCPAhtTUOIsKZ9Apy/tjtF53pNKE0Ue0QuFEevNwcSff1KpuJll54FBGjxwkH
         IX3ajPVIycj/lN0If2xtVDDGK02njn5f+ED1ElgiWSMjJ/9EZXiL7HOiVaCDNZy5jNAI
         Tr5bJU23dpPnQ5MyPcUA6EldZN0dt9t/h9VyImS8Dz1GXdeUjnbtDrTzQvdzXfB9ZrPd
         jDSfj2K+m55Ka+PJRQO1nFmXInTZiFiWnfbZGjAoUH9XFEczlNQS6cdaWwLGAjoCy3Tn
         e+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720620209; x=1721225009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FF7rP2+PJ2ZvvpWZLjQAQJ1wp4b+Ih/p5xp7h5PUB0=;
        b=b75iO89oAPsElYOEr0Qww9JnktjOoha6+phGQIALcw+lZd7X02vBvhX0AYdGeIKPCz
         OcDyx1O0pkE650MXKX0DPNxgOa5R7CIxuhGJD9dMEHa6xEwl8qsbcz+NCE/AFcrKu8MC
         lKQyaoDWa/2VXBwApE6jHzM+59dg/ceP7h27zZXjHk9bqQ8HsL6o+vtHKhzEPKIk9Hgq
         f4bGEBWRrUwVxpc9E+VDc2CPCS2DI+2TJNueOyai9YOvcADwCx8uOtGQqBVtyIe3xks7
         89qjGVzuJqVZcorT/vRAcbKwRRPB1Rr7ssNTk1ZmB28PxvHh+GB6G+dQcP6vN4M9jCMz
         6/xA==
X-Gm-Message-State: AOJu0YyIdc0n29PGjn2g+n1e3K+98tGaq5YfD+Yh61Vu2XXyrtYH5pFa
	PXcLr1FEMMqk1QSDfkn+mo3VtQJ1beGqdSYJaMLraNkRcxIfGCsdsN4NZb/8aLpWOSh96AKy5oi
	kXySs8WZOeKFlXXkDh1EqWYoowYo=
X-Google-Smtp-Source: AGHT+IH3DFwpNX7PkZOfy8l+p5/Bw8+T4EjG7j3e7jk8D61GfVOdETQkrRsY91YfSPDkD2QM7ibH+2zxdnqmwoUcSbs=
X-Received: by 2002:a05:6512:3a83:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-52eb9990f87mr4100427e87.14.1720620208475; Wed, 10 Jul 2024
 07:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
 <20240703140059.4096394-1-JPEWhacker@gmail.com> <17DF3FE80C22BC48.23364@lists.openembedded.org>
 <1227d1d9b29b6f83d9ad03c8d0046b04ad72ddfc.camel@linuxfoundation.org>
In-Reply-To: <1227d1d9b29b6f83d9ad03c8d0046b04ad72ddfc.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 10 Jul 2024 08:03:16 -0600
Message-ID: <CAJdd5GbG0Zy4+8QD6NGTvFV=STomOAgghiAYShCrS0gZAknPeQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 0/8] Add SPDX 3.0 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 14:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201734

On Wed, Jul 10, 2024 at 6:18=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-07-05 at 08:17 +0100, Richard Purdie via lists.openembedded.=
org wrote:
> > > On Wed, 2024-07-03 at 07:59 -0600, Joshua Watt via
> > > lists.openembedded.org wrote:
> > > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > > default.
> > > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enable=
d at
> > > > > the same time
> > > > >
> > > > > v2: Added tests and addressed feedback
> > > > > v3: Fixed several oe-selftest and build failures
> > > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > > v5: Reworked to make SPDX 3 output reproducible by default. Varia=
bles
> > > > >     that introduce non-reproducible output are documented as such=
.
> > >
> > > Thanks for working on this. The patches generally seem to working wel=
l
> > > in testing but this does look related:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/710=
9/steps/23/logs/stdio
> > >
> > > Particularly these bits:
> > >
> > > AssertionError: 10 !=3D 0 : Missing objects in the cache:
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/a6/eb/sstate:perf:qe=
mux86_64-poky-linux:1.0:r0:qemux86_64:12:a6eb451ebf8142b51d88b66b79ebbfc430=
19458d7e335e0a1b2a79e19cf3eed6_create_spdx.tar.zst
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:qe=
mux86_64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7f6=
5dd1808bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
> > >
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:qe=
mux86_64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7f6=
5dd1808bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/31/ce/sstate:core-im=
age-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:31ce987a3b0b34b=
0d2bbacab96b4b9848f851caadd1f1fb1522d38c2b392c65d_create_image_sbom.tar.zst
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/2f/cf/sstate:core-im=
age-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:2fcfbfd93928c643c30=
f92b69cd17e19f4dd9136506e0bf1373a28883593d3a9_create_rootfs_spdx.tar.zst
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/1d/de/sstate:core-im=
age-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:1dded8f18500fb63356=
331c5e4f5eee5fc35c113398ec98ad7bed1d82c3f330d_create_image_spdx.tar.zst
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/6a/92/sstate:core-im=
age-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:6a924154d59877cfc45=
27602e72d0984c1fa7b685ac7f93fa8bee225a5de57e3_create_image_sbom.tar.zst
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/62/47/sstate:core-im=
age-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:624764dcea54752=
c3f6f3928f6719b440728eecd7516b85d80d37b305c56f530_create_rootfs_spdx.tar.zs=
t
> > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/7c/6f/sstate:core-im=
age-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:7c6f212fe1a869a=
e8edc251f2f9c02e939a5f2b659fd77e9b4bb262eb60f6f5d_create_image_spdx.tar.zst
>
> I think I understand what might have happened here. I suspect we've had
> test builds on the new test cluster which can write to the hash
> equivalence server but not the sstate. I think this means entries were
> added for artefacts which don't exist on sstate.
>
> In theory those should be created on new build runs but in practise I
> suspect they're shadowed by other artefacts so newer builds probably
> don't create them. That would at least explain how we end up where we
> are.

There is also https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest=
/cases/sstatetests.py#n933
which I beleive is still accurate and probably why the images
themselves show up; we'll need to adjust the exclusions to match the
new SPDX tasks I added. I think '.*:do_create.*_spdx' would be OK?

>
> If I'm correct, if there are changes to the code (as we discussed on
> yesterdays tech call), everything will rerun and assuming we run this
> only on the main cluster, things should work out ok.
>
> I would be curious to understand how these things aren't being
> recreated when missing though?

I'm not sure. I can't really think of any reason in the SPDX code that
it wouldn't recreate a missing sstate object; I'm not doing anything
particularly strange with sstate

>
> I did also notice an interesting issue in that if you run a build with
> PACKAGE_CLASSES =3D "package_rpm", then add deb/ipk, all the
> do_collect_spdx_deps tasks and do_create_spdx tasks change hashes and
> rerun. This isn't ideal as it effectively breaks our ability to turn
> package backends on/off without rebuilds :(. Can we avoid that or at
> least minimise things a bit more?

Ya, that's a leftover from when I was trying to tie the SPDX packages
to the produced package files. I had to give up thought because it's
actually really difficult to figure out what .rpm and .deb files
correspond to a PACKAGE (at least, I couldn't see an easy way to do
it). We can just remove the dependency on do_package_write_* for now
and figure out how to do it later.

>
> Cheers,
>
> Richard
>
>
>

