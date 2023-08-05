Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE8EEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 10:36:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.3607.1691231785732285312
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 03:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BnAbW3tn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31771a876b5so2326156f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691231784; x=1691836584;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LbrYG8O+U0a7K0S+k94udA8vrvZQl2mgC+Wipg2mmuw=;
        b=BnAbW3tnHdsOTy4anhEjkhf2+1cZozY0PM2S9PXW5UDbW16O67qvn2X6X2cDOhhnb9
         0DAzfhkLFvmceIhDw7Jx90qHiRcOuiVwWj+0VO1ZMvAWttbnq5ilUWI30PtYG7vluoP/
         B+4tn+oawRKrixEb93DR6LhLd8wnpXPA1LS7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691231784; x=1691836584;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LbrYG8O+U0a7K0S+k94udA8vrvZQl2mgC+Wipg2mmuw=;
        b=fLq9qOQJ2tMPmCOBeD9fAU4AcPYVp24jLidcEvNddxsIZmk6hm7k8pXd38xoiECkHt
         5uvIpuNMFH+CN2UtBQpCGjzRAkke7RMfmeNc9764Bk0hqv2cgTK/SuN4rK1hWe75EvC+
         ORGBHgEGkfWsl+zD8sF+2G7MlYXU25Wdrc9VM9sNjlEiiYslaASt1H8WYo9n3QtAd8f7
         Zw9b7Lde7BbbQrG0Nf8Jjt/cJLduHejusF488NevD0Lghq5Qh95lIjfuHwuupFcXbxpC
         DX0h0XH5GqAPJVm8JHgL0Q7uCTpFskK1w9Kv1beiP4OBwuYfULKlV7yf2OKCMK15UDsX
         ehtw==
X-Gm-Message-State: AOJu0YyNKCFoCHd7vLssS77Kjd5gDC7Ou2nGEhl2v1J/Nqv0GXrTLmQj
	d8rsmldJxZRFcX4NJeghey3WGqJK0pqnnylz66Y=
X-Google-Smtp-Source: AGHT+IGJmrCyw0I0u8eDgtIWR/oSOEXhRBmE0tZuZMtdy7wKTwumfu+t12ef+EWrwRux1yGM4YdxCg==
X-Received: by 2002:adf:eec9:0:b0:314:3f98:a788 with SMTP id a9-20020adfeec9000000b003143f98a788mr2648404wrp.7.1691231783528;
        Sat, 05 Aug 2023 03:36:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1adf:6477:9da8:f35a? ([2001:8b0:aba:5f3c:1adf:6477:9da8:f35a])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000008f00b0031417b0d338sm4868327wrx.87.2023.08.05.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 03:36:22 -0700 (PDT)
Message-ID: <89e8391834fb349cff2b603545aee7a2742561ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] sstatesig: Fix pn and taskname derivation
 in find_siginfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yang.xu@mediatek.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Ross.Burton@arm.com
Date: Sat, 05 Aug 2023 11:36:22 +0100
In-Reply-To: <17783A2A112CFD7F.19347@lists.openembedded.org>
References: <20230713021659.23130-1-yang.xu@mediatek.com>
	 <17783A2A112CFD7F.19347@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 10:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185550

On Fri, 2023-08-04 at 17:13 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-07-13 at 02:16 +0000, Yang Xu via lists.openembedded.org
> wrote:
> > From: Yang Xu <yang.xu@mediatek.com>
> >=20
> > The `bb.siggen.compare_sigfiles` method transforms the key format from
> > `[mc:<mc_name>:][virtual:][native:]<recipe path>:<taskname>` to
> > `<recipe dir>/<recipe name>:<taskname>[:virtual][:native][:mc:<mc_name>=
]`
> > by `clean_basepaths`. However, `find_siginfo` uses the original format
> > to get the package name (pn) and task name.
> >=20
> > This commit corrects the method for deriving the pn and task name in
> > `find_siginfo` and adds handling for multilib name.
> > And add test for compare_sigfiles and find_siginfo working together.
> >=20
> > Signed-off-by: Yang Xu <yang.xu@mediatek.com>
> > ---
> >=20
> > Notes:
> >     v1: correct handling for pn and taskname for native target in find_=
siginfo
> >     v2: add handling for multilib target in find_siginfo
> >     v3: add testcase for compare_sigfiles and find_siginfo work togethe=
r.
> >     v4: optimize testcase to avoid non-deterministic fail
> >=20
> >  .../recipes-test/binutils/binutils_%.bbappend |  2 +
> >  meta/lib/oe/sstatesig.py                      | 17 ++--
> >  meta/lib/oeqa/selftest/cases/sstatetests.py   | 83 +++++++++++++++++++
> >  3 files changed, 97 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-selftest/recipes-test/binutils/binutils_%.bbap=
pend
> >=20
> > diff --git a/meta-selftest/recipes-test/binutils/binutils_%.bbappend b/=
meta-selftest/recipes-test/binutils/binutils_%.bbappend
> > new file mode 100644
> > index 0000000000..205720982c
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/binutils/binutils_%.bbappend
> > @@ -0,0 +1,2 @@
> > +# This bbappend is used to alter the recipe using the test_recipe.inc =
file created by tests.
> > +include test_recipe.inc
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index f943df181e..f041a0c430 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -321,11 +321,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
> >      if not taskname:
> >          # We have to derive pn and taskname
> >          key =3D pn
> > -        splitit =3D key.split('.bb:')
> > -        taskname =3D splitit[1]
> > -        pn =3D os.path.basename(splitit[0]).split('_')[0]
> > -        if key.startswith('virtual:native:'):
> > -            pn =3D pn + '-native'
> > +        if key.count(':') >=3D 2:
> > +            splitit, taskname, affix =3D key.split(':', 2)
> > +        else:
> > +            splitit, taskname =3D key.split(':', 1)
> > +            affix =3D ''
> > +        pn =3D os.path.splitext(os.path.basename(splitit))[0].split('_=
')[0]
> > +        affixitems =3D affix.split(':')
> > +        if affixitems[0] =3D=3D 'virtual':
> > +            if affixitems[1] =3D=3D 'native':
> > +                pn =3D pn + '-native'
> > +            if affixitems[1] =3D=3D 'multilib':
> > +                pn =3D affixitems[2] + '-' + pn
> > =20
> >      hashfiles =3D {}
> >      filedates =3D {}
>=20
>=20
> I've stared at this patch long and hard and I'm coming to the
> conclusion that whilst what you're doing improves things, there are
> more corner cases remaining and we're just moving the problem to new
> ones down the road. Having to hardcode in each of the class names and
> special case them is a big warning sign.
>=20
> I started wondering why we encode pathnames into the siginfo files. The
> reason is that is how bitbake handles them within runqueue. In earlier
> times when this was being built, that was fine but things have been
> extended many times over since that decision was made.
>=20
> The issue is that those "internal" representations don't map onto other
> systems, so sstate writes files in a different format. There is no easy
> way to map the original representations to the format used in the
> sstate file names.
>=20
> My conclusion is that we should change the siginfo files to have the
> data already in "sstate" format. That does potentially break a few
> things but is probably worth doing for the simplicity gains in code
> like this.

I've sent a couple of patches, one to bitbake and one to OE-Core which
change the format of the data in runtaskdeps to be PN based rather than
recipe filename based which then makes the above change unneeded, we no
longer need to hardcode classes into it.

With those changes, I did confirm that the testcase added in this
pattch does pass.

We need to review those other changes but assuming testing shows they
work out ok could you update this patch to simply add the test case?
I'd also appreciate it if you could check those patches do resolve the
issue you were seeing.

Cheers,

Richard


