Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721F0CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 11:10:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.17275.1755688248106480100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 04:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MT2XLot5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F06CC6B3B9
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 11:10:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5B9606A0;
	Wed, 20 Aug 2025 11:10:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D02831C2286DB;
	Wed, 20 Aug 2025 13:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755688244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yAIot08K0bh67KuiwQORjKLIN98lvqz31R6R1fbZYdY=;
	b=MT2XLot5ifAj482FnVlBH4i94QSA4kkGPb7s1euXBVnPpgrfs09bKgXif8Jrv2YG5KN6t8
	spNuxxqB0uayqsXWRXGYvGss3jvmFtC62t0kLLJyJSidNrvA35/8N38hltwwWKedtIaQ6u
	4L2wffj+51qW2Ip1zdIxubMiCrqADMeolLD0XuZI2btr2RA78q6HDxtwEyhK+hfSBMDkQC
	02l9dSO3Yv0onYC3nWxYYiWaVTVlUCm9/pO32PRroH6f3h2zm2hk7Oxu5aOwcqq6FkcAsc
	0Pi5QVdPCKULNL6OMfzxTUBqPgFB2ZatZ1m23l/g/GvXXwb3AKMQ1yp0HDyXnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 13:10:41 +0200
Message-Id: <DC77JFI2499F.1BTYUM51QCASE@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250819010128.3519760-1-raj.khem@gmail.com>
 <20250819010128.3519760-3-raj.khem@gmail.com>
 <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com>
 <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
In-Reply-To: <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 11:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222173

On Wed Aug 20, 2025 at 9:15 AM CEST, Khem Raj wrote:
> On Tue, Aug 19, 2025 at 11:23=E2=80=AFPM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
>>
>> On Tue Aug 19, 2025 at 3:01 AM CEST, Khem Raj via lists.openembedded.org=
 wrote:
>> > Fixes
>> > ../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion 'is =3D=
=3D 0' failed
>> > ./test-c32ispunct.sh: line 36:   402 Aborted
>> > (core dumped) LC_ALL=3D"$testlocale" ${CHECKER} ./test-c32ispunct${EXE=
EXT} 3
>> >
>> > FAIL: test-c32ispunct.sh
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>>
>> Hi Khem,
>>
>> Thanks for your patch.
>>
>> It looks like this is breaking tests, specifically on qemuriscv64:
>>
>> Traceback (most recent call last):
>>   File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sdk/=
cases/maturin.py", line 25, in test_maturin_list_python
>>     output =3D self._run("maturin list-python")
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sdk/=
case.py", line 17, in _run
>>     return subprocess.check_output(". %s > /dev/null; %s;" % \
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
>>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTru=
e,
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   File "/usr/lib/python3.12/subprocess.py", line 571, in run
>>     raise CalledProcessError(retcode, process.args,
>> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pok=
ybuild/yocto-worker/qemuriscv64/build/build/tmp/work/qemuriscv64-poky-linux=
/core-image-minimal/1.0/testsdkext/environment-setup-riscv64imafdc-poky-lin=
ux > /dev/null; maturin list-python;' died with <Signals.SIGSEGV: 11>.
>>
>
> seems quite unrelated, I wonder if its finding some other bug

Yes, I can't understand what happens here :(
Yet this commit always triggers the failure.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


