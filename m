Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34035C55167
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:49:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12224.1785419361791342764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uxHO+o+m;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so17335445e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785419360; x=1786024160; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ndBLLkHVpL8QjlMgzFwEdsDRXsLVCrjGf8g5HwBlEZE=;
        b=uxHO+o+mUMk0uhxhPgTfAbAS7ULl0IabL4pL5JqD4NPbf1ddi4ZVRlv9ksQjWXdmi2
         hFApDDo69vYfamexmWc2yzKb2zMbYYWkyzcl+Bd0ro0czikTAIQq/y6AG3tpA0pVfWHQ
         yneGwKUpGQe2evug1/lzzzUtKwNiKZX4B4wo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419360; x=1786024160;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndBLLkHVpL8QjlMgzFwEdsDRXsLVCrjGf8g5HwBlEZE=;
        b=CsCV/Lu40TRhQ+YullD9TX2oglqvHp8rDsXQy9rdsp4HDqUN6idyHjemzdnyQ69OUj
         B0Cqxu9lZEaPzH2OXp2rngL6xsKqtPQkFkg5f9QH2HhwgL+t8rnO3oMAdsXhAYVP2zRN
         71KE5wIE6HX5oBGb6YwCgO8D9gGjta42uZhTxYA7KQqmYl1zqj9xKht7z6FvfKnXvPh2
         /k8M2VWAv9I/5OUxXXpI7cE4MtvkV1cNJkWKUlgxTE565Fss9OLRiim8UFB3FKL/oQXu
         MGzzP2hC4Ro4TDbMLvPgFONI+RaB63kg+/lDQdZwyqehfQ18L2CK2PGZSAf7EcasroxH
         Z53A==
X-Forwarded-Encrypted: i=1; AHgh+Rqz9SxXirgK+8dC6vm+dtRHnf0U8Zr2bKy6avGsezTqfqR47qTMlYRl7ffsmmSfzjKeaIZQqCaD89kZyXsDrxqEZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyy0kLJNEF1jb0eWCWXB2YRPpBEtk33ZQFOzUP7aWQhuld/oovJ
	Y22NjpdriRQbMtB2EvgnSl1kbYCcSaFYN6cLvHvH/akZDBAo5qfsmVMvAH0jiKSsjF0=
X-Gm-Gg: AR+sD10S/sTceesh0qDZf9YBMtKvxw9jTJ9863Ou5wqVz7eUuY3WjiCxOinnm2oKyjo
	E2bl+hsBSNHtCFeCk2UojtQ13M8sGMrfEh5kZdSUeoZmFwR9/euFtAfIyzSUEtQ4jKX3NZZwwEL
	jryOcsqI2fFTHi4i7pxrU5W/WD4CYHs7B1waIMA4Q5Epcu8JIbe6DcesFKIUby3dZlMoHzBpI/k
	QqR8ztPEj4x3h+U3LCU7kPbAv0mo7c240U4EJ1OTSqd+gqiJOSbHBWy4sKcBcL77IeeaLRVHraA
	n31IrurlP38PokdvHfs2pRW2PMfE3YB6pYLPJyjOUcPc9SlvKnNzUAhulsK2TaopCNsJhCrgQNI
	2wIpF+1InLJugA1QCVofRWJPh2/jFQUU3lbTXeOVnNkWKPMQ98tx9xEx26lfNsIrEtaPANsp1WE
	moBQWGvqjRrzD+AGvGac80QwK+eiHJe8MZGqVOkC7Yg6CKf0RkUFXn74eTqatN6QdNMuGPyjwVF
	NGmz8lmMpXXrmiZ6TP4y5mAwa1xvKy+1XpV/Vwh9rU5rgvDGph+ism73OuE2zXq
X-Received: by 2002:a05:600c:138b:b0:495:406f:dff6 with SMTP id 5b1f17b1804b1-49800ecf301mr36620925e9.33.1785419359892;
        Thu, 30 Jul 2026 06:49:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dd417ef569a828a8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dd41:7ef5:69a8:28a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a05a6sm71711775e9.10.2026.07.30.06.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:49:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 15:49:19 +0200
Message-Id: <DKBYCAF9BZO1.1QQXVA3V614B3@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
To: <adrian.freihofer@gmail.com>, <marek.vasut@mailbox.org>, "Freihofer,
 Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
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
 <982caddffca561ea3bf1ce907a40447302e74378.camel@gmail.com>
In-Reply-To: <982caddffca561ea3bf1ce907a40447302e74378.camel@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242359

On Thu Jul 30, 2026 at 3:23 PM CEST, adrian.freihofer wrote:
> On Thu, 2026-07-30 at 15:00 +0200, Marek Vasut via
> lists.openembedded.org wrote:
>> On 7/30/26 2:39 PM, Yoann Congal wrote:
>>=20
>> Hello everyone,
>>=20
>> > > > The fitimage fixes landed in oe-core master 6 weeks ago and
>> > > > they fix
>> > > > fitImage usability issues which block me from updating to
>> > > > wrynose in
>> > > > multiple projects, that's why I keep monitoring this thread so,
>> > > > but
>> > > > again, please do not read this as a push.
>> > >=20
>> > > I think going with the four patches from
>> > > https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.=
fr/
>> > > without a fifth patch which adds test coverage for this fairly
>> > > isolated
>> > > detail is fine.
>> >=20
>> > This is where I disagree. Last time I reviewed this series it
>> > looked
>> > good but I had no way to check it actually worked once backported
>> > to
>> > wrynose. That is why I asked Ryan to backport the test from master
>> > to
>> > wrynose.
>>=20
>> Is there a git tree/branch with those patches ? If so, I can at least
>> test this locally and confirm whether or not anything is broken on my
>> end ?

I pushed that here:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dycongal/wry=
nose/kernel-fit

>>=20
>> > > Important is: We need 4 not only 3 patches:
>> > >=20
>> > > Adrian Freihofer (1):
>> > > =C2=A0=C2=A0 oe-selftest: fitimage: Do not expect kernel property in=
 DTBO
>> > > config
>> > > =C2=A0=C2=A0=C2=A0=C2=A0 subnodes
>> > >=20
>> > > Marek Vasut (2):
>> > > =C2=A0=C2=A0 kernel-fit-image.bbclass: Do not include kernel propert=
y in
>> > > DTBO
>> > > =C2=A0=C2=A0=C2=A0=C2=A0 config subnodes
>> > > =C2=A0=C2=A0 kernel-fit-image.bbclass: Fix operation with
>> > > KERNEL_DTBVENDORED =3D "1"
>> > >=20
>> > > Ryan Eatmon (1):
>> > > =C2=A0=C2=A0 kernel-fit-image: Add KERNEL_DTBVENDORED support for
>> > > =C2=A0=C2=A0=C2=A0=C2=A0 FIT_CONF_DEFAULT_DTB
>> >=20
>> > Yes. This is the patches I have for this work.
>> >=20
>> > > And also important is: We need time for testing on master before
>> > > back-
>> > > porting to stable. Six weeks is probably enough. But the exact
>> > > same
>> > > pattern ended up with a broken stable branch maybe one year ago.
>> > > And
>> > > also this time there was a state on master which was at least
>> > > incomplete (three instead of four patches). But still, I think
>> > > this is
>> > > ready for stable now.
>> >=20
>> > I agree on the series needing testing. One more argument for
>> > waiting for
>> > a wrynose test.
>> > See
>> > https://lore.kernel.org/all/DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr/
>> > (from the same thread you linked)
>>=20
>> I ran this now and got 8 commits which cleanly apply on the wrynose=20
>> branch, maybe that is all that is missing for the test part ?
>>=20
>> $ git log --oneline --reverse --grep=3Dfitimage=20
>> origin/wrynose..origin/master --
>> meta/lib/oeqa/selftest/cases/fitimage.py
>> e46d8473fb3 oeqa/selftest/fitimage: fix missing whitespace around
>> assignment
>> 0344e652a40 oe-selftest: fitimage: replace _gen_random_file with=20
>> _gen_elf64_dummy
>> 5592be53348 oe-selftest: fitimage: replace bbb-dtbs-as-ext with=20
>> test-dtbs-as-ext
>> befc103a95d oe-selftest: fitimage: replace MACHINE=3D=3Dqemux86-64 guard=
s
>> with KERNEL_SETUP_BIN
>> 4b08cf6048b oe-selftest: fitimage: add machine settings table and
>> skip=20
>> helpers
>> f17f4263c07 oe-selftest: fitimage: stop hardcoding MACHINE and DISTRO
>> in=20
>> tests
>> 85e0408a81b oe-selftest: fitimage: Do not expect kernel property in
>> DTBO=20
>> config subnodes
>> de2e11e6362 oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
>>=20
>
> It's this series which makes back-porting the tests hard, I agree:
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D47907&s=
tate=3D%2A&archive=3Dboth
>
> Question is what's simpler and more appropriate: Back-porting major
> changes for "only" test code or adding test coverage to the old test
> code on wrynose. Technically, I would have sent the oe-selftest rework
> earlier if I had it available. So, back-porting=3Dcherry-picking would
> make sense and be straight forward. Process wise, I would probably
> stick to just adding test coverage for the changes on wrynose. That
> should be easy doable, it's just not cherry-pickable.

Those cherry-picks do not look particularly good, please avoid them if
we can...

If you can easily send a single patch that test the series on
wrynose, that does sound better.

Thanks!
--=20
Yoann Congal
Smile ECS


