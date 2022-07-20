Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E77BC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 17:21:38 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.56840.1658337695716889325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 10:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CCz2wWcM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id u5so4032442wrm.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=qxYc+kvIKEo3SqFngmEROuBdnwrgVk9/y4Yfs2IMxlA=;
        b=CCz2wWcMRiuoDovNyyYVFPxVKVWgigWHOlaDoCQkI5oyHsTsw6JbnL7o3cNbUvc4Gp
         8U43DXw1RWsLHTBI+kQsa3LArKkUf5Du/0VtZNQg2T3zL/0Weu3lAHgFtdrdxqFOd77E
         iWi8GvMG8ksKmlUhSWieAjYAOhyqoKG2ZuydY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=qxYc+kvIKEo3SqFngmEROuBdnwrgVk9/y4Yfs2IMxlA=;
        b=kF8Qci0wau26UhSkA42e5567RaHTVmWyY2xBc5AtVDgG/ZahfsVdQI3gMsxD7Kjna4
         GAUELSH8JVEYVg6pm0/0g+L8BNdIp11TTqqaVJNrlDd4tv11locfzo9nbB7glummIkdn
         gD9Bc9DtI76RXGi6A3RR4SEqLri2Dpa78odHzb7icSHdWRydivpJAyFkEFwg5AtBPh5m
         10YKJaRXYAuPd2hWU7PhrHAfy3combNU0V9Q30o9cZiQolWW9PtL33KDc+9RZQqn/ZBL
         nCZMRsfcZJ8mdGBBUcnsLUTU+vbTL7J2OctCYitb1J0d6H9queJeXTjqjVVJ/vrek46T
         j8Xw==
X-Gm-Message-State: AJIora+vVx7RfYbdtj9LPHVVdzRzIEtocfJUMOBnJFXRxVdS38e6N0Jx
	+ZsvM6XeZcUX9iHRaN1p0gTITA==
X-Google-Smtp-Source: 
 AGRyM1s029uRM8tKify1L7pCdTV6ViGuGlwd0zu5LOJxTjflqeRlUAEm7Nn//fX43c1q9KtQ3T7tfg==
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id
 j8-20020a5d6048000000b0021d68e57cf0mr31928349wrt.678.1658337693863;
        Wed, 20 Jul 2022 10:21:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56?
 ([2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56])
        by smtp.gmail.com with ESMTPSA id
 l20-20020a5d5274000000b0021dfacfdf0dsm11236860wrc.33.2022.07.20.10.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 10:21:31 -0700 (PDT)
Message-ID: 
 <5937fc9b1b2507727cc838a6ba3ad13a9bd47fe2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador
 <otavio@ossystems.com.br>,  Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2022 18:21:29 +0100
In-Reply-To: 
 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
	 <20220710164300.953098-2-otavio@ossystems.com.br>
	 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
	 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
	 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
	 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
	 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
	 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
	 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
	 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 17:21:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168370

On Mon, 2022-07-18 at 21:07 -0300, Otavio Salvador wrote:
> Em seg., 18 de jul. de 2022 =C3=A0s 19:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Mon, 2022-07-18 at 18:41 -0300, Otavio Salvador wrote:
> > > Em seg., 18 de jul. de 2022 =C3=A0s 18:18, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> escreveu:
> > > > > It does, indeed, but it doesn't seem related to this PR.=C2=A0
> > > > >=20
> > > > > Do you know if this has worked?
> > > > >=20
> > > > > I am asking as I did all development and testing
> > > > > using=C2=A0SDKMACHINE
> > > > > ?=3D
> > > > > 'x86_64' and even=C2=A0MACHINE ?=3D 'qemuarm64' worked just fine.
> > > > > However,
> > > > > looking at some of the logs above, it seems it is using an
> > > > > SDKMACHINE
> > > > > as i686, so this appears as a different issue for me.
> > > > >=20
> > > >=20
> > > > rust-cross-canadian hasn't officially worked properly or been
> > > > supported. In assessing whether a patch is better or worse, it
> > > > is
> > > > useful to know which cases regress and which improve. I had
> > > > hoped
> > > > this
> > > > list of failures would be smaller. I will admit I don't know
> > > > whether
> > > > this is better or worse than before so I guess that is the next
> > > > thing I
> > > > need to determine.
> > > >=20
> > >=20
> > >=20
> > > I told you. I tried SDKMACHINE as x86_64 on a x86_64 host and
> > > this
> > > worked.
> > >=20
> > > > What we don't know right now is which combinations work and
> > > > which
> > > > don't
> > > > so we can't even tell people what is expected to work and what
> > > > isn't/doesn't :(
> > > >=20
> > >=20
> > >=20
> > > See above.
> > > =C2=A0
> > > > I mentioned this report in case someone can work out the
> > > > pattern,
> > > > or
> > > > even better, understand what a fix looks like...
> > > >=20
> > >=20
> > >=20
> > > I am not familiar enough to Rust boostrap=C2=A0to help here but we
> > > spent a
> > > lot of time to get the SDK working and I think this is a step on
> > > the
> > > right direction, at least.
> >=20
> > Thanks, I do appreciate the patches. I think we've talked cross
> > purposes as I did report my aarch64 test case issue previously and
> > I
> > thought this series was to attempt to fix things so the recipe did
> > work
> > generically.
> >=20
>=20
>=20
> I had it fixed to SDKMACHINE as x86_64 on a x86_64. I didn't realise
> it was using a different SDKMACHINE.
>=20
> > If I merge this to fix x86_64, I think people will then just ignore
> > the
> > other cases and things will remain broken there which worries me a
> > lot
> > and means we can't generically enable rust SDKs for the project and
> > gain autobuilder testing to spot future regressions.
> >=20
>=20
>=20
> I understand.
> =C2=A0
> > Obviously you want your use case fixed though. I will try and
> > evaluate
> > things a bit more tomorrow. What I don't want to do is merge a fix
> > which then makes it harder to get things correctly done in future
> > though, particularly when I know there will be an instant backport
> > request to an LTS as soon as I accept it for master.
> >=20
>=20
>=20
> In fact I need patch 1/2 as this fixes our use case. We worked on 2/2
> (this patch) for completeness.
> =C2=A0
> > We never should have accepted these rust cross-canadian recipes at
> > all
> > as they are just broken :(.
>=20
> Agreed.
> =C2=A0

I've done a bit more work on this and the more I dig, the more I think
we have some issues we need to sort with taking a step back and
checking some assumptions.

What I'm lacking is a good way to test the resulting rust toolchain.
Would someone with some rust knowledge be able to add something to
meta/lib/oeqa/sdk/cases/ which tested rust in the SDK?

If someone can add some rust tests in the SDK, I think I might have an
idea of what the patches look like to properly fix the rust toolchain
there.

Cheers,

Richard


