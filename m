Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A01D79766
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 09:09:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5592.1769850580977945137
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 01:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qGfv5g7X;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A535DC22F77;
	Sat, 31 Jan 2026 09:09:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFEAE606B6;
	Sat, 31 Jan 2026 09:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C770119A88ED;
	Sat, 31 Jan 2026 10:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769850578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4cV2MsydPDUF/PhdHmCSNkZ91QXwE59rjcBwZOMCCLQ=;
	b=qGfv5g7XiAl/2vRBju/O8iYZpQLnZAnGQAOr/vut/CC5ywxV2DA9Ox7gjT///6xibYmMK0
	f6R6buy8hCpE/9dt5GoWEnJQIc6VtbUaStfejBtLeiQHgBbFn74hM2B7bgb/x5PRf58ZHr
	eTlQnZTcg8h/UGj0d/iVC71B9db77iQOSio9f1Artxu16IPEh5Fk31oqrVY5jo9HOryJv4
	jA+tgiLxEPaNjfrPKzL0E3jr52pgPR2QCwT/boSFHyg9Hr0KsF9+FgcdBt4tv1eBMD/q8s
	VqFxJTjVfeeID8p/Bixes3ADRbDIKJCtgccQ8F0OU1wKvF/s+ghLm6MZ0Wex+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 10:09:35 +0100
Message-Id: <DG2NO21MCM0Z.1O2COT6XY25OU@bootlin.com>
Subject: Re: [OE-core] [[PATCHv2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Leon Anavi" <leon.anavi@konsulko.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260127091829.3500551-1-leon.anavi@konsulko.com>
 <DG0DVCEFA5HX.L3N59E48OKKP@bootlin.com>
 <CALtQ3O3yqQrStH+99WU04rah6d-pOBGP2nONOW=mPK5d+DkKSw@mail.gmail.com>
In-Reply-To: <CALtQ3O3yqQrStH+99WU04rah6d-pOBGP2nONOW=mPK5d+DkKSw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 09:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230234

On Thu Jan 29, 2026 at 12:22 PM CET, Leon Anavi wrote:
> Hi Mathieu,
>
> On Wed, Jan 28, 2026 at 7:03=E2=80=AFPM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Tue Jan 27, 2026 at 10:18 AM CET, Leon Anavi via lists.openembedded.o=
rg
>> wrote:
>> > Upgrade to release 0.19.1:
>> >
>> > - Fix SeekableZstdFile write table entries on 32-bits architectures
>> >   when there is a huge number of entries
>> >
>> > From release 0.19.0:
>> >
>> > - The project has been completely refactored to use the Zstandard
>> >   implementation from the standard library (PEP-784)
>> > - The refactor has some minor impact on public APIs, such as
>> >   changing the exception raised on invalid input
>> > - Add backports.zstd dependency for Python before 3.14
>> > - Changes in build dependency: remove setuptools and C build
>> >   toolchain, add hatchling and hatch-vcs
>> > - Remove git submodule usage
>> > - Drop support for Python 3.9 and below
>> > - Use ruff as formatter and linter
>> > - Embed type hints in Python code, and check with mypy
>> >
>> > All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.
>> >
>> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> > ---
>>
>> Hi Leon,
>>
>> Thanks for the new version.
>>
>> It looks like this is breaking some ptest:
>>
>> Failed ptests:
>> {'python3-pyzstd': 'START: ptest-runner\n'
>>                    '2026-01-28T16:27\n'
>>                    '\n'
>> ...
>>                    "E   ImportError: cannot import name 'zstd' from "
>>                    "'compression' (unknown location)\n"
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2996
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1005
>>
>> Test results can be found here:
>>
>>
>> https://valkyrie.yocto.io/pub/non-release/20260128-86/testresults/qemux8=
6-64-ptest/core-image-ptest-python3-pyzstd/
>> Test results for riscv64 and arm64 are not published at this time, as
>> some tests are still running. They will all end-up in
>> https://valkyrie.yocto.io/pub/non-release/20260128-86/testresults/
>>
>> Can you have a look at these failures?
>>
>
> Hm, I am not exactly sure what's going on. On my Raspberry Pi 5 test
> setup ptest-runner python3-pyzstd doesn't report any issues:
>
> Testsuite summary
> # TOTAL: 209
> # PASS: 209
> # SKIP: 0
> # XFAIL: 0
> # FAIL: 0
> # XPASS: 0
> # ERROR: 0
> DURATION: 4
> END: /usr/lib/python3-pyzstd/ptest
> 2026-01-29T11:17
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> I will take another look after FOSDEM. I will likely need to reproduce yo=
ur
> exact test environment. In the meantime, do you have any hints about what
> might be causing the test failures on your side?
>
> Best regards, Leon
>
>

Hi Leon,

I'm not really sure about what is the issue here, but maybe a different
configuration or a missing dependency.

If you need any data about how to reproduce it in qemu, all data should
be in the build, particularly in the "Write config" step:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5139973/raw_inlin=
e

So basically:

SDKMACHINE =3D "x86_64"
TEST_SUITES =3D 'ping ssh ptest'
SANITY_TESTED_DISTROS =3D ''
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'

bitbake-config-build enable-fragment machine/qemux86-64
bitbake-config-build enable-fragment distro/poky

bitbake core-image-ptest-python3-pyzstd
bitbake -c do_testimage core-image-ptest-python3-pyzstd

Please tell me if you have any issue reproducing the failure.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


