Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED049C48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:39:26 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.10031.1708598361998224250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dWhZkAI9;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: andreaskleist@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so546792766b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708598360; x=1709203160; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G7Y0qYHVouNV0+6BhgauI7CqK2kJgozA/wzmqoY+VU4=;
        b=dWhZkAI98+0DGTXPjXE0367yCNrBos3e/FIVCzdcazCBoZqmK00U5hRtXH7Bz3BFOA
         89ph7x07aF4hnJFYp5QFBfXIWc+mRMhH9KsNebt6/tv1Si0ajO4s1Ypxcii3nLEvmPN3
         xTae60VcnL+VYhn41/rGISVJvFjkRteMw5lx7gNdF8Lic4YGYDRaELg4UvP+s5Gu5i7s
         nLk+D99S28xjHI1N5pC4XiJgwq/ASGiVr5U6729hdoUOhUHHQGqRvl/54uSDRX2yGsIc
         jGh8cQ/NRYJYJWcQjkgDlFQbyXICx2HpLpy6mE9HgTSOY8ngpxIQGU5LNAT5BVVc/aoP
         FqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598360; x=1709203160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7Y0qYHVouNV0+6BhgauI7CqK2kJgozA/wzmqoY+VU4=;
        b=qQ70pVqK/duxEZMvhJ046MKm1nuDgE4LL/j8XoKv5A2iOUJ0q21J/eRwfCd1PPfAIc
         TkHue+9LoJpLDm+vi7KfC2+XxzdWedCR/EgkPQg7Nit2x+xqArZFDw84iAljG0ivUNQL
         DjhKj8cHlTla4ftAyZ+ObWgIIssv6B/bz2HmrcdPazdm/7nlrxEbrauWmPcVSvfSLkt7
         t4djlBx90l6zzL4s4soEo1zmXeE0TewDZ/jHD4cdGctriTP+89bJaXbaXUku+gTVpP2l
         OJMQqyT9Eift3OIfz7MGgc4imsKYfqYbiYuB6T7L97uTgfbSXpc4mFg8pD8lBXdSbp2L
         dm8Q==
X-Gm-Message-State: AOJu0YysxigRdghaDpuz9XQ43uzywJ6Ou0X3B/x/ZdklgBc2kczjqNSC
	LSDqcNd0tYFAd8xqzff1NtTEFuzNCidf4WKcwxB0bQsLkirKQ2YDEO0/fuKE
X-Google-Smtp-Source: AGHT+IHom+PNRTOg4w0MkMGp5reGl/tp00AZBioufhcL6paPMophzhkODrI6mAXRX2nOh2T9fNuDVA==
X-Received: by 2002:a17:906:3598:b0:a3f:33b2:5ce2 with SMTP id o24-20020a170906359800b00a3f33b25ce2mr3147519ejb.35.1708598360071;
        Thu, 22 Feb 2024 02:39:20 -0800 (PST)
Received: from [192.168.50.250] (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id vh9-20020a170907d38900b00a3f1ea776a1sm1877768ejc.94.2024.02.22.02.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:39:19 -0800 (PST)
Message-ID: <4a22040be0dfa95f0fc7be851d39b233f088feb5.camel@gmail.com>
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Ryan Eatmon <reatmon@ti.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2024 11:39:18 +0100
In-Reply-To: <f232c109-3b18-44a9-913a-3a8b10f69e04@ti.com>
References: <cover.1707745886.git.steve@sakoman.com>
	 <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
	 <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
	 <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
	 <ca451d91-e029-4913-9404-98cd1c6fe415@ti.com>
	 <0b450e8bcb3caf34fe2ef3e2737af6f4e62a63bc.camel@gmail.com>
	 <bc5ae7215cb00d5f61e2c9870a5f4c9ec0b2854d.camel@gmail.com>
	 <f232c109-3b18-44a9-913a-3a8b10f69e04@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196015

On Wed, 2024-02-21 at 08:40 -0600, Ryan Eatmon wrote:
>=20
> On 2/16/2024 7:51 AM, Andreas Helbech Kleist wrote:
> > On Fri, 2024-02-16 at 09:11 +0100, Andreas Helbech Kleist wrote:
> > > On Thu, 2024-02-15 at 19:45 -0600, Ryan Eatmon via
> > > lists.openembedded.org wrote:
> > > >=20
> > > > On 2/15/2024 7:43 PM, Steve Sakoman wrote:
> > > > > On Thu, Feb 15, 2024 at 3:20=E2=80=AFPM Ryan Eatmon <reatmon@ti.c=
om> wrote:
> > > > > >=20
> > > > > >=20
> > > > > > With this patch in place we are seeing a breakage on our kernel=
 builds.
> > > > > > This patch was cherry picked from master, but the next patch on=
 this
> > > > > > file in master removes the LOCALVERSION setting...
> > > > > >=20
> > > > > > https://git.openembedded.org/openembedded-core/commit/meta/clas=
ses-recipe/kernel-arch.bbclass?h=3Dmaster-next&id=3Db378eec156998eea55ba61e=
59103cb34fab0d07c
> > > > > >=20
> > > > > >=20
> > > > > > There is a disconnect here.  Why did we change kirkstone, a sta=
ble LTS
> > > > > > version with a partial patch series based on master?
> > > > >=20
> > > > > The original kirkstone backport request for this patch was sent t=
o the
> > > > > list for review on February 9.
> > > > >=20
> > > > > There were no comments or objections, so I added it to the patch =
test
> > > > > queue.  No issues were encountered on the autobuilder, so I sent =
this
> > > > > patch (along with the rest of the patch queue) to the list for a
> > > > > second review opportunity on February 12.  Once again there were =
no
> > > > > comments or objections, so it was merged today February 15.
> > > > >=20
> > > > > I follow this process because I'm not smart enough, nor do I have=
 time
> > > > > enough to thoroughly research all implications of every patch.  I=
 rely
> > > > > on autobuilder testing and community review to minimize breakage.
> > > > >=20
> > > > > This normally works quite well, but this time it didn't.  I'll re=
vert
> > > > > this patch and if someone would like to resubmit a proper series =
to
> > > > > deal with the issue it is trying to fix I will consider it and ru=
n it
> > > > > through the same process.
> > > >=20
> > > > I can appreciate that.  My comment was more for the person who sent=
 the
> > > > patch in the first place.  You are doing a great job.  I will try a=
nd
> > > > pay attention for a replacement patch coming in and review as well.
> > >=20
> > > I'm sorry about that. I need to use a 6.6 kernel on kirkstone, and th=
is
> > > patch fixed my usecase. It looked like a simple bugfix, and I was not
> > > aware that there was a later fix for this change.
> > >=20
> > > Is there any way I can reproduce the error you saw Ryan?
> > >=20
> > > And would it make sense to add an automated test for this usecase?
> > >=20
> > > I'll test my usecase with both patches backported and re-submit.
> >=20
> > I've now looked into it and can make it work in my setup by backporting
> > these three commits from master:
> >=20
> >    kernel.bbclass: introduce KERNEL_LOCALVERSION
> >  =20
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3D229435a52f36ddec5f85fb6d5ccd42044b688397
> >=20
> >    kernel: fix localversion in v6.3+
> >  =20
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3D765b13b7305c8d2f222cfc66d77c02e6a088c691
> >=20
> >    kernel: make LOCALVERSION consistent between recipes
> >  =20
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3Db378eec156998eea55ba61e59103cb34fab0d07c
> >=20
> > The cherry-pick's apply cleanly without any conflicts.
> >=20
> > Would they be appropriate for kirkstone? I'm wondering if there would
> > be any issue with backporting the KERNEL_LOCALVERSION variable
> > specifically.
> >=20
> > If I hear nothing before the middle of next week, I'll submit the patch
> > series (CC'ing you Ryan).
> >=20
>=20
> Can you send me the patch series that you want to want to send in=20
> against kirkstone?  I'll apply them locally and run some tests on our=20
> setup to make sure they don't cause an issue.  I don't foresee them=20
> being a problem, but I'm more than happy to verify.

I send them to the list and CC'ed you, hope that is ok.

See
https://lore.kernel.org/openembedded-core/20240222103545.2970387-1-andreask=
leist@gmail.com/T/#t

> > /Andreas
> > >=20
> > > PS: This is my first submission to oe-core, so I'm just starting to
> > > learn. I have no idea what or how the autobuilder tests, but I'm
> > > willing to learn.
> > >=20
> > > >=20
> > > >=20
> > > > > Steve
> > > > >=20
> > > > >=20
> > > > > > On 2/12/2024 7:54 AM, Steve Sakoman wrote:
> > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > >=20
> > > > > > > During testing of the v6.4 reference kernel, it was noticed t=
hat
> > > > > > > on-target modules no longer matched the magic value of the ru=
nning
> > > > > > > kernel.
> > > > > > >=20
> > > > > > > This was due to a different localversion in the cross built k=
ernel
> > > > > > > and the scripts / resources created on target.
> > > > > > >=20
> > > > > > > This was due to changes in the setlocalversion script introdu=
ced
> > > > > > > in the v6.3 series.
> > > > > > >=20
> > > > > > > The .scmversion file is no longer used (or packaged) to inhib=
it
> > > > > > > the addition of a "+" (through querying of the git status of =
the
> > > > > > > kernel) or the setting of a local version.
> > > > > > >=20
> > > > > > > We recently introduced the KERNEL_LOCALVERSION variable to al=
low
> > > > > > > recipes to place a value in .scmversion, so we extend the use=
 of
> > > > > > > that variable to kernel-arch.bbclass and use it to set the
> > > > > > > exported variable LOCALVERSION.
> > > > > > >=20
> > > > > > > We must do it at the kernel-arch level, as the variable must =
be
> > > > > > > exported in any kernel build to ensure that setlocalversion a=
lways
> > > > > > > correctly sets the localversion.
> > > > > > >=20
> > > > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation=
.org>
> > > > > > >=20
> > > > > > > Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a08=
8c691
> > > > > > >=20
> > > > > > > Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.co=
m>
> > > > > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > > > > ---
> > > > > > >     meta/classes/kernel-arch.bbclass |  7 +++++++
> > > > > > >     meta/classes/kernel.bbclass      | 10 ++++++++--
> > > > > > >     2 files changed, 15 insertions(+), 2 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/=
kernel-arch.bbclass
> > > > > > > index 4cd08b96fb..0a79dea0af 100644
> > > > > > > --- a/meta/classes/kernel-arch.bbclass
> > > > > > > +++ b/meta/classes/kernel-arch.bbclass
> > > > > > > @@ -66,3 +66,10 @@ KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.b=
fd ${HOST_LD_KERNEL_ARCH}"
> > > > > > >     KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL=
_ARCH}"
> > > > > > >     TOOLCHAIN ?=3D "gcc"
> > > > > > >=20
> > > > > > > +# 6.3+ requires the variable LOCALVERSION to be set to not g=
et a "+" in
> > > > > > > +# the local version. Having it empty means nothing will be a=
dded, and any
> > > > > > > +# value will be appended to the local kernel version. This r=
eplaces the
> > > > > > > +# use of .scmversion file for setting a localversion without=
 using
> > > > > > > +# the CONFIG_LOCALVERSION option.
> > > > > > > +KERNEL_LOCALVERSION ??=3D ""
> > > > > > > +export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> > > > > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kerne=
l.bbclass
> > > > > > > index 5951347361..940f1a3cf4 100644
> > > > > > > --- a/meta/classes/kernel.bbclass
> > > > > > > +++ b/meta/classes/kernel.bbclass
> > > > > > > @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
> > > > > > >         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config=
); then
> > > > > > >                 oe_runmake -C ${B} ${PARALLEL_MAKE} modules $=
{KERNEL_EXTRA_ARGS}
> > > > > > >=20
> > > > > > > -             # Module.symvers gets updated during the
> > > > > > > +             # Module.symvers gets updated during the
> > > > > > >                 # building of the kernel modules. We need to
> > > > > > >                 # update this in the shared workdir since som=
e
> > > > > > >                 # external kernel modules has a dependency on
> > > > > > > @@ -635,7 +635,13 @@ kernel_do_configure() {
> > > > > > >         # $ scripts/setlocalversion . =3D> +
> > > > > > >         # $ make kernelversion =3D> 2.6.37
> > > > > > >         # $ make kernelrelease =3D> 2.6.37+
> > > > > > > -     touch ${B}/.scmversion ${S}/.scmversion
> > > > > > > +     # See kernel-arch.bbclass for post v6.3 removal of the =
extra
> > > > > > > +     # + in localversion. .scmversion is no longer used, and=
 the
> > > > > > > +     # variable LOCALVERSION must be used
> > > > > > > +     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; =
then
> > > > > > > +             echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > > > > > > +             echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > > > > > > +     fi
> > > > > > >=20
> > > > > > >         if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] &&=
 [ ! -f "${B}/.config" ]; then
> > > > > > >                 mv "${S}/.config" "${B}/.config"
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > >=20
> > > > > > --
> > > > > > Ryan Eatmon                reatmon@ti.com
> > > > > > -----------------------------------------
> > > > > > Texas Instruments, Inc.  -  LCPD  -  MGTS
> > > >=20
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#195736): https://lists.openembedded.org/g/opene=
mbedded-core/message/195736
> > > > Mute This Topic: https://lists.openembedded.org/mt/104311283/750139=
2
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [andreaskleist@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >=20
> > >=20
> >=20
>=20


