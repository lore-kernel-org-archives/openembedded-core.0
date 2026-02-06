Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D32EE2084
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:19:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8153.1770373185914340102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U8cnQCax;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48068127f00so18270635e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770373184; x=1770977984; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSi3chLIgmFT9Oh35G72FDBR+E3H1v/9rhoPFXAwJxU=;
        b=U8cnQCax/YWF6CVc3DD5W91uYu6tG9e9fzS6hKdDcU6WaE2zVPhkayOkY9dbMRhDD1
         mCX61pq6PqCmGA8AnM0g7E+o1yyRVY+PaMz8Gre+8INMkIU2BevCwO9lxCzVza4gAygo
         WxSyZwxjbwb1cFpt4M+Fz/MdDaeiMVyGwDOuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770373184; x=1770977984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSi3chLIgmFT9Oh35G72FDBR+E3H1v/9rhoPFXAwJxU=;
        b=WqvBEv98tz/AgmIaiAcx0yDzKh5FAk5aUt7DrqQqYx8AChG3xABpx0hpsNrEmXZ13D
         bN3iDfMviDqDZUOaR/87J1R/YGd06/i4uiw0xPSCk1FcfTFCLZ/1++jtS1Kz2YHAYL5n
         +PPZsyvkmdX9oBwibjUWmz+el1KoJga/YD+Wcdy6JuN6XcbENCbTSoE+nJMMggdufaE6
         q4Wedt9J0AyLFB7qZyiav54Qn9Ss6TUq0/gnZFUz99rye6/wcQypHFkuFkYEd/mnIvmb
         BnM8vZ3TeJNgTb2wRovJFfNES1qcMx2G5+ZQnbI98EzRM1CwaDP6ir282eaKYbTgLkb9
         OBXg==
X-Forwarded-Encrypted: i=1; AJvYcCW+lR/MAVx2KrvwZYmsLqx2RHuNfvdLWPvCsjLc5b4pdDk58L10pzOeXWD5o7twQBx636Q2IrgY2U2q6OmgmoSkfw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwACLadZl2fjeBlF7LAlTdZ3vgkQK34sdbfkET6/M2qsz9xjXl0
	Ia3LbuqmuODykJfDZ9DRQz7OTxG5XGEWP7XHzoJnCh5AWaihdpl34sCDXJSLolf+L2s=
X-Gm-Gg: AZuq6aLEzpIlrG8UAJOw9F+bqvp0LmapfIEfDV1S+YzFZr3sEoBk1ewasnol+AjI6gp
	GEa6WejQB0HcDrWpFUNdh/gHNXFEg+u1kCdgdDu2VjvjX1FTG6bVSc7OfCx4k5yWt3oXCAIU/xW
	4ro2toUa/N+zLIvslFwNeDefLebmHVBjnCY8M2k5B4FNOsUH5R8AxEajAUN/KFaLiW9Reiel0wJ
	Qswy4TipDJOqnXA3u/EzB3nj1tMmbJCBa274nISG0E/I3KXc6mJsAxgznHJzddCxgHOe5S69rBs
	nDNmPmL6Q1zSjGa4PrZKowNY09IWUb8LrEXI5aLDv6/rzlZ+UOHRjSx64nh9T4DbDS/ZGM885Yn
	NLe0ZZCRXaBZ1uRgOwK6msd52CBIjk0Sw1qPUIicnNl6rGI0EZdS7eB22Wr62vhzlVT7vCCuPJq
	AH9Ksr3Vxv+RBTn/nLQkB0U+WiLDT9/P7pI9ajg3NbFSgYhXgvPAQTkCyeGKPziPQCN5sbSazv5
	mbMWF10LIGW+/MSoGaXMJULFA==
X-Received: by 2002:a05:600c:3b19:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-48320200068mr30084905e9.6.1770373184122;
        Fri, 06 Feb 2026 02:19:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c3ca:e743:b37a:d8b5? ([2001:8b0:aba:5f3c:c3ca:e743:b37a:d8b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320638ff7sm46874545e9.0.2026.02.06.02.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:19:43 -0800 (PST)
Message-ID: <b885c311ab2d6e31289f5bc857340e96ffc530bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, "yoann.congal@smile.fr"
 <yoann.congal@smile.fr>,  "Hemanth.KumarMD@windriver.com"	
 <Hemanth.KumarMD@windriver.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Feb 2026 10:19:41 +0000
In-Reply-To: <AS1PR10MB5697B71BC0C1DDAF032FEC46FD66A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260125161623.729884-1-peter.marko@siemens.com>
	 <554632.1770355472810056681@lists.openembedded.org>
	 <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
	 <AS1PR10MB5697B71BC0C1DDAF032FEC46FD66A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230601

On Fri, 2026-02-06 at 07:42 +0000, Peter Marko via lists.openembedded.org w=
rote:
> > On Fri Feb 6, 2026 at 6:24 AM CET, Hemanth.KumarMD via
> > lists.openembedded.org wrote:
> > > Hello Peter,
> >=20
> > (Yoann here)
> >=20
> > > We sometimes see regressions in glibc test runs depending on the loca=
l
> > > environment. In such cases, it can help to re-trigger the tests to
> > > check whether the failures are consistently reproducible. It may also
> > > be useful to cross-check the results with autobuilder runs, which
> > > generally provide a more stable baseline before concluding on
> > > regressions.
>=20
> I am planning to run the testsuites again during weekend.
> I also find it weird that every update shows different "before" results t=
han previous one showin in "after" result.
> Not sure if it's flakiness or local conditions like CPU overload at time =
of running tests.
>=20

For context, many of the 'toolchain' testsuites have some flaky tests
in them and we don't always see consistent output.

For example, the 5.0.14 regression report mentions:

https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.14/testresults/=
testresult-regressions-report.txt

Regression:  oeselftest_almalinux-8.10_qemuarm_20251014024649
             oeselftest_almalinux-9.7_qemuarm_20251118011611
    Total: 3 new regression(s):
    1 regression(s) for ptestresult.gcc-libstdc++-v3-user
        ptestresult.gcc-libstdc++-v3-user.30_threads/async/async.cc executi=
on test: PASS -> FAIL
    2 regression(s) for ptestresult.glibc-user
        ptestresult.glibc-user.misc/tst-linux-mremap1: UNSUPPORTED -> FAIL
        ptestresult.glibc-user.misc/tst-pidfd: UNSUPPORTED -> FAIL

or:

    5 regression(s) for ptestresult.glibc
        ptestresult.glibc.elf/ifuncmain8: PASS -> No matching test result
        ptestresult.glibc.elf/tst-tls20: PASS -> FAIL
        ptestresult.glibc.iconvdata/mtrace-tst-loading: PASS -> FAIL
        ptestresult.glibc.iconvdata/tst-loading: PASS -> FAIL
        ptestresult.glibc.nptl/tst-thread-affinity-pthread: PASS -> FAIL

over time we've been trying to investigate and resolve these kinds of
issues but we're obviously not there yet.


I can say we've made big improvements, you can see it in the numbers,
e.g. comparing:

https://downloads.yoctoproject.org/releases/yocto/yocto-4.0/testreport.txt =
- 142,413 failures
https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-5.3_M3/t=
estreport.txt 1,636 failures

which shows a definite improvement! The number of flaky test results
has also decreased but is obviously not as easy to measure.

We have a policy with ptests and rust of no failures. We're trying to
get there with gcc/binutils/glibc/ltp.

The test results are stored in the testresults.json files and
resulttool knows how to generate reports and compare files for
regression reports.

The plus side of the autobuilder results is that we have a long
baseline for comparison and a relatively stbale testing environment
which should be consistent.

Cheers,

Richard





