Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED6EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 10:49:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.10947.1689763759267882829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 03:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=f0ua+brh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso67396915e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689763757; x=1690368557;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FsRDU4P/OyhUvworsVrA+UtTdukOaL0kFtaA5nJRIoo=;
        b=f0ua+brhTA0ourunr//2E2420NJP5NzWUg6IO+eANmKC/2eacfgc6KQ23m34LsuOEM
         3LUSUEbwCgPmDq6N3mHxemyij+YSYD1i3gr/wlpAnRDKex//NJZnVrA9RiTOS/W7WCct
         lohrkEnsN/8S6N9cPnUUlECiu1kfLCw0okUyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689763757; x=1690368557;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsRDU4P/OyhUvworsVrA+UtTdukOaL0kFtaA5nJRIoo=;
        b=f5NIr6ebBvR5O+wj93siA77qS5eOoHatoiKUIBlbma7GOZFVfYbJnGDex36CWcyoj2
         cXco118ws+hQydbGYDHHvjaGm0u2z+RRpSYN9UwLy2mw4vdiEwVmIclUf2CuMOm7i0BF
         nmYyFgL9/fjpKwiMhQR7OngJaG8G34gjuz93Q/qamX1HKfX34tY5WVoBKJZ0Lx4Ob1aB
         BdM2UENhMCiIkT9ugb5o5U9twxW3FASYXZH2KiIC8mTZcuL9FqOTjaaiyjEYmqUAJi5w
         AZ6VTC4qfbY/rNzI3/TNpHbl2NyLyuW2veHXFR4Vd9HwJhoHzd6B2T/q1JsN7RAFnSlO
         LdSQ==
X-Gm-Message-State: ABy/qLZpoC53/Pg7MmaotG5Zy13B9ERzq3WLohWst8NKfFks/vZ/o8yE
	TByF67UmlQBiJswZSjLEgBgyqw==
X-Google-Smtp-Source: APBJJlEIA1XG0XH8pkfexiOGI4iJTSzGwuBfGl0fRckjUZzzEsN5hWf6Lk5GgeTqiw/y13dl+2rarA==
X-Received: by 2002:a7b:ce16:0:b0:3fa:9e61:19ed with SMTP id m22-20020a7bce16000000b003fa9e6119edmr1749483wmc.23.1689763757614;
        Wed, 19 Jul 2023 03:49:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm1417969wmi.6.2023.07.19.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:49:17 -0700 (PDT)
Message-ID: <910f3165b7ba14fdd89e1ce89e3a70b9b5cbc014.camel@linuxfoundation.org>
Subject: Re: Rust Oe-Selftest implementation V15 Testing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Shinde, Yash"
	 <Yash.Shinde@windriver.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>, "Gowda, Naveen"
 <Naveen.Gowda@windriver.com>
Date: Wed, 19 Jul 2023 11:49:16 +0100
In-Reply-To: <8d7b610d82cb606aebba1bc582176b072375f3ed.camel@linuxfoundation.org>
References: <efa2be27-b66e-3ec5-dc5c-872e4480055a@windriver.com>
	 <CH2PR11MB44707BB142B48AA62AB5FF5A89499@CH2PR11MB4470.namprd11.prod.outlook.com>
	 <SJ1PR11MB6129C95690F5CECB834AF2EBEB5BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
	 <2023061619564473739a2d@mail.local> <2023061809292129ae9b9e@mail.local>
	 <SJ1PR11MB6129BF560606CCE63FF83457EB23A@SJ1PR11MB6129.namprd11.prod.outlook.com>
	 <365cabd0-72a1-6ec8-d7be-fff24311934c@windriver.com>
	 <d6c84ad89f53c685be3defa3f8ac9fa6a19c889c.camel@linuxfoundation.org>
	 <20230630131626130a658b@mail.local>
	 <SJ1PR11MB6129783A802FD0B5B8713D64EB36A@SJ1PR11MB6129.namprd11.prod.outlook.com>
	 <20230717143459f37f8da6@mail.local>
	 <8d7b610d82cb606aebba1bc582176b072375f3ed.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184576

On Mon, 2023-07-17 at 16:08 +0100, Richard Purdie wrote:
> On Mon, 2023-07-17 at 16:34 +0200, Alexandre Belloni wrote:
> > Hello,
> >=20
> > I got some feedback from RP:
> >=20
> > http://autobuilder.yocto.io/pub/non-release/20230716-18/testresults/tes=
tresult-report.txt
> >=20
> > This shows warnings for duplicate tests and he also asks being where th=
e
> > qemuarm64 went, both issues being probably related.
>=20
> I had a look and you probably need to add a:
>=20
> @OETestTag("toolchain-user")
> @OETestTag("runqemu")
> class RustSelfTestBase(RustSelfTestSystemEmulated):
>     def test_check(self):
>         self.test_rust()
>=20
> section to the tests to allow the tests to run for the non-IA
> architectures that use usermode emulation for the other tests which
> rust can't.
>=20
> That then just brings the question of why there are duplicate tests
> results being reported. This is where the result for an ID is being
> reported more than once. I haven't looked into why that might be
> happening.

I really do want to get this rust test suite issue resolved so I went
digging into the code to find out what is really going on.

Firstly, the duplicate test results. The issue is that you defined the
core class like this:

 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase=
):
     def test_rust

and python unittest has a convention where anything starting "test_" is
a test.

This meant that the rust test ran unguarded in all the oe-selftest
targets on the autobuilder and not just in the toolchain-system
filtered section.

The easiest fix is to drop the RustSelfTestBase class and move the
toolchain-system decorator to RustSelfTestSystemEmulated. That will
resolve the duplicate test warnings and ensure things run where they
should. You could have worked out this issue by finding that there were
rust test results in oe-selftest-* testresults.json files, e.g. here:

http://autobuilder.yocto.io/pub/non-release/20230716-18/testresults/oe-self=
test-centos/oeqa/testresults.json

Moving on, the test result names really don't look good with the=C2=A0
"[ui]  " and similar prefixes in the results file. I've patched a tweak
in to drop that.

I also noticed that there were no skipped tests being reported in the
results. This was due to "SKIP" being used instead of "SKIPPED" which
resulttool looks for.

We need to also add the toolchain-user decorator to make sure that the
tests run for the "user" architectures since we don't have any user
mode rust test equivalent.

I've rolled all these changes into a patch on master-next:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D46ab84785da1=
5ac156ee0b4a693ce8bb5ccf8c22

which I'll put into testing.

Looking to the future, I have concerns about the ease of maintenance of
this huge patch to rust to disable failing tests. I'd propose we change
this to a hardcoded list of tests to ignore in the result parsing code
which will be easier to maintain in the future.

We may want to take that as a subsequent follow up patch.

Cheers,

Richard

