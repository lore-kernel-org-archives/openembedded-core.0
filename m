Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2450FC55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:23:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11706.1785417833488946671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UenM+NlM;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1396278f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785417832; x=1786022632; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jqPFPw1PDa/dSG/Uzrk8OFvU+Gtb7bhmy+5dRzLA1A4=;
        b=UenM+NlMX6hzb2TZiHjIMbVfxZpWlsPO56F+KWAgHhupKuwQ1byE3JuRFtWGlIZVTs
         +RsnsxuGMkUbQHLSIQP8riiutjx8174IF2+mehR2XiyjbWqNBLbd2VacajzQCjyo9P1x
         vZGnEY38ttE6UBBIpvWN9r4qL/aG/QWJl/i2IidVeXCMTgkdzlMpVB7eD0TZ2OI8CPoI
         DzNyqsbcV1BWEw0e6ojDBAjmHAgDxNe7rQ1MBtfob+By8EXSWfewR8n5Ea2IFcKA0inw
         F7oDo3tt77c2eIvBfrohXClpUbnp2Bag9FEkb7eOyrxWYODBldrK9jd1XzS0rZT9Dhlk
         H39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417832; x=1786022632;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqPFPw1PDa/dSG/Uzrk8OFvU+Gtb7bhmy+5dRzLA1A4=;
        b=AvGVjb5/wP24KXhDmVpahUfb5dpMier/9UjMYZFs0Xn9JguvyirpMi/Ak4bYuTvwLH
         1FScKikZ+TXdMqGnBlE1wTB3C+2+fGXgIcchPKQyeanspADrXRPmrjj9OVGhWuxPFius
         LDGkCO2QM4PCdnmEOI8oX+F7TShhavzz/KDsYSoQSmYPKinK87KCBWg1X93X3tXt9Oo9
         YUQklDhwsvbmsKFF8nGwQmfDTCWjHt8h08kFBWAASw5pBlBmwbIjVkf5cyhzT7huY3Vm
         rqS9rZ0+EmQHWdS/wq+QA0yF44mCB0GylWFOu66wZE7I8HuuZQGCfw2lcmDhkwgGYDiz
         jBYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4IiFc+5FulEW9p0BGRFGEQ9BSDe2DBo4EHs5Rfr/2Alsfl16g++CVug5rS7UPAkorl/p3G268eWoOyP7TyyTg9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/GaviIt4mF+0UBYa6Sylk2WJYyfpiFihjtJ3BzHM5WKjrLEmM
	1WKJItnd4sOgfOxtg0z4Yat/Sr4KvNP+HXmukOYMyO9hXi1sviagGok0
X-Gm-Gg: AR+sD13oPwhjjNGSDYIWZgK+ASZLs58f3cEUk3ENH0pSQ6zvj2qoU2BdAoTZZ/jBGKK
	GNgtZcYbqZdNTSOeAGtWF5SYbYM7JvXJuRKV2mwzCdE45jBDKnBbUU2+Q49sfe8vhKw8GXgR3ee
	FGijF/2+1DJxspDYVROAnlgU0zwsO95dIQT0UN2mTnEnM00IdmwFFMoDw2GZaZT44tfbKmr3Jou
	ZDcFfRIqSGwXkjVoSVHapwvVJW2wPesZeRW2OMBx2TD7jt7x7J2NJVHSU+XWh6PEklrDkrblM7j
	zC724LvhI4o4K853mZs3u/2X68I7sagcqaNN7qb+nlvrsp38529yeD1sHcOUIfPRH/R7yVolFLW
	nizu/lddPu/UNOa+2xoejn1Jj14jfjxe06vc4g7s794UenrMMuy6GqPYUcG5dxNIfmC8TsJ2cst
	27NCptCMtSzzYi4R/SS2o/78JTEn8H42ER3o7+HduTNE5BE4/AxXACfcHoMiDFLMdEfoR/AFI5Q
	J5NVR63kEJlSTbxPDAig7iVGZ0Jmj9eIVC7SKc=
X-Received: by 2002:a05:6000:430d:b0:47f:7c4c:8144 with SMTP id ffacd0b85a97d-47fc80c0d5fmr3938303f8f.10.1785417831414;
        Thu, 30 Jul 2026 06:23:51 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm5770726f8f.15.2026.07.30.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:23:46 -0700 (PDT)
Message-ID: <982caddffca561ea3bf1ce907a40447302e74378.camel@gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: adrian.freihofer@gmail.com
To: marek.vasut@mailbox.org, Yoann Congal <yoann.congal@smile.fr>, 
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Cc: Ryan Eatmon <reatmon@ti.com>
Date: Thu, 30 Jul 2026 15:23:44 +0200
In-Reply-To: <b4fd3e49-e436-40cd-8b62-0c6792cd6f14@mailbox.org>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
	 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
	 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
	 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
	 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
	 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
	 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
	 <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
	 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
	 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
	 <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
	 <2327c8bd-c465-43ad-bb56-ac571eadafc8@mailbox.org>
	 <0be60525b600137c0f723c7faa7ab5c2f04934ae.camel@gmail.com>
	 <DKBWUZLGTNVG.ZNWPY3U22BE8@smile.fr>
	 <b4fd3e49-e436-40cd-8b62-0c6792cd6f14@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242356

On Thu, 2026-07-30 at 15:00 +0200, Marek Vasut via
lists.openembedded.org wrote:
> On 7/30/26 2:39 PM, Yoann Congal wrote:
>=20
> Hello everyone,
>=20
> > > > The fitimage fixes landed in oe-core master 6 weeks ago and
> > > > they fix
> > > > fitImage usability issues which block me from updating to
> > > > wrynose in
> > > > multiple projects, that's why I keep monitoring this thread so,
> > > > but
> > > > again, please do not read this as a push.
> > >=20
> > > I think going with the four patches from
> > > https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.f=
r/
> > > without a fifth patch which adds test coverage for this fairly
> > > isolated
> > > detail is fine.
> >=20
> > This is where I disagree. Last time I reviewed this series it
> > looked
> > good but I had no way to check it actually worked once backported
> > to
> > wrynose. That is why I asked Ryan to backport the test from master
> > to
> > wrynose.
>=20
> Is there a git tree/branch with those patches ? If so, I can at least
> test this locally and confirm whether or not anything is broken on my
> end ?
>=20
> > > Important is: We need 4 not only 3 patches:
> > >=20
> > > Adrian Freihofer (1):
> > > =C2=A0=C2=A0 oe-selftest: fitimage: Do not expect kernel property in =
DTBO
> > > config
> > > =C2=A0=C2=A0=C2=A0=C2=A0 subnodes
> > >=20
> > > Marek Vasut (2):
> > > =C2=A0=C2=A0 kernel-fit-image.bbclass: Do not include kernel property=
 in
> > > DTBO
> > > =C2=A0=C2=A0=C2=A0=C2=A0 config subnodes
> > > =C2=A0=C2=A0 kernel-fit-image.bbclass: Fix operation with
> > > KERNEL_DTBVENDORED =3D "1"
> > >=20
> > > Ryan Eatmon (1):
> > > =C2=A0=C2=A0 kernel-fit-image: Add KERNEL_DTBVENDORED support for
> > > =C2=A0=C2=A0=C2=A0=C2=A0 FIT_CONF_DEFAULT_DTB
> >=20
> > Yes. This is the patches I have for this work.
> >=20
> > > And also important is: We need time for testing on master before
> > > back-
> > > porting to stable. Six weeks is probably enough. But the exact
> > > same
> > > pattern ended up with a broken stable branch maybe one year ago.
> > > And
> > > also this time there was a state on master which was at least
> > > incomplete (three instead of four patches). But still, I think
> > > this is
> > > ready for stable now.
> >=20
> > I agree on the series needing testing. One more argument for
> > waiting for
> > a wrynose test.
> > See
> > https://lore.kernel.org/all/DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr/
> > (from the same thread you linked)
>=20
> I ran this now and got 8 commits which cleanly apply on the wrynose=20
> branch, maybe that is all that is missing for the test part ?
>=20
> $ git log --oneline --reverse --grep=3Dfitimage=20
> origin/wrynose..origin/master --
> meta/lib/oeqa/selftest/cases/fitimage.py
> e46d8473fb3 oeqa/selftest/fitimage: fix missing whitespace around
> assignment
> 0344e652a40 oe-selftest: fitimage: replace _gen_random_file with=20
> _gen_elf64_dummy
> 5592be53348 oe-selftest: fitimage: replace bbb-dtbs-as-ext with=20
> test-dtbs-as-ext
> befc103a95d oe-selftest: fitimage: replace MACHINE=3D=3Dqemux86-64 guards
> with KERNEL_SETUP_BIN
> 4b08cf6048b oe-selftest: fitimage: add machine settings table and
> skip=20
> helpers
> f17f4263c07 oe-selftest: fitimage: stop hardcoding MACHINE and DISTRO
> in=20
> tests
> 85e0408a81b oe-selftest: fitimage: Do not expect kernel property in
> DTBO=20
> config subnodes
> de2e11e6362 oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
>=20

It's this series which makes back-porting the tests hard, I agree:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D47907&sta=
te=3D%2A&archive=3Dboth

Question is what's simpler and more appropriate: Back-porting major
changes for "only" test code or adding test coverage to the old test
code on wrynose. Technically, I would have sent the oe-selftest rework
earlier if I had it available. So, back-porting=3Dcherry-picking would
make sense and be straight forward. Process wise, I would probably
stick to just adding test coverage for the changes on wrynose. That
should be easy doable, it's just not cherry-pickable.

Regards
Adrian

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242350):
> https://lists.openembedded.org/g/openembedded-core/message/242350
> Mute This Topic: https://lists.openembedded.org/mt/120043543/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

