Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DD8CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 18:06:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.4038.1755713163194757592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 11:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Js8SVu8A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8C29F4E40C24
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 18:06:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A676606A0;
	Wed, 20 Aug 2025 18:06:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2A7C1C22C87E;
	Wed, 20 Aug 2025 20:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755713160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6NYiQDCl0LU8JAM4LtZKWFNTuSMmoI/5uUV+FwPENyE=;
	b=Js8SVu8A2A/vUANnAv00EGcKGZeNgalvoxt91xFKNbo8ysq3Z8NLrj9lU98YdmDYCNfWEA
	Uj5cJVowOVcB7j8xifKDOYZbS7m7KaC1TLNWUAeRjBxHTKC4rfBRaW3gwLRWrgv1Bd3N/C
	VBEqwcxO4ODADqGI7AzZxg1Uf9lMSGmcq8FlYpJB//f2n4sVCkTVcFlBd7b9vdK71IcmEP
	27Bs+O6qeGZ9UPCkZPKesfRN5Cks+V0XqYB8H345ehIOPNxAlQ8x5qCzhD4hThRl1BRlPy
	/qjtq2R9Kjx6Zem6JO47dTE3KRKCLJWvYCr/7xeYQbyRFFwFqOUjIcHCXCGxqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 20:05:56 +0200
Message-Id: <DC7GDD8QCOBP.3INL9UNR70EB0@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
Cc: "Ross Burton" <ross.burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, "Marko, Peter" <Peter.Marko@siemens.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250819010128.3519760-1-raj.khem@gmail.com>
 <20250819010128.3519760-3-raj.khem@gmail.com>
 <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com>
 <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
 <DC77JFI2499F.1BTYUM51QCASE@bootlin.com>
 <CAMKF1spYCYK3PJ-Keauh1Z3n7i6xq1TUJMfSbCB_Gu9S_80FbQ@mail.gmail.com>
 <AS1PR10MB5697C7D8E470853393F57036FD33A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <CAMKF1so-QpbXt39GbXJXsfhBWoeH8yAJ-Ub8HExrx5Ze2wwu9Q@mail.gmail.com>
In-Reply-To: <CAMKF1so-QpbXt39GbXJXsfhBWoeH8yAJ-Ub8HExrx5Ze2wwu9Q@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 18:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222194

On Wed Aug 20, 2025 at 5:24 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> On Wed, Aug 20, 2025 at 7:40=E2=80=AFAM Marko, Peter <Peter.Marko@siemens=
.com> wrote:
>>
>>
>>
>> > -----Original Message-----
>> > From: Khem Raj <raj.khem@gmail.com>
>> > Sent: Wednesday, August 20, 2025 16:33
>> > To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; Marko, =
Peter
>> > (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Ross Burton
>> > <ross.burton@arm.com>
>> > Cc: openembedded-core@lists.openembedded.org
>> > Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
>> >
>> > On Wed, Aug 20, 2025 at 4:10=E2=80=AFAM Mathieu Dubois-Briand
>> > <mathieu.dubois-briand@bootlin.com> wrote:
>> > >
>> > > On Wed Aug 20, 2025 at 9:15 AM CEST, Khem Raj wrote:
>> > > > On Tue, Aug 19, 2025 at 11:23=E2=80=AFPM Mathieu Dubois-Briand
>> > > > <mathieu.dubois-briand@bootlin.com> wrote:
>> > > >>
>> > > >> On Tue Aug 19, 2025 at 3:01 AM CEST, Khem Raj via
>> > lists.openembedded.org wrote:
>> > > >> > Fixes
>> > > >> > ../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion =
'is =3D=3D 0' failed
>> > > >> > ./test-c32ispunct.sh: line 36:   402 Aborted
>> > > >> > (core dumped) LC_ALL=3D"$testlocale" ${CHECKER} ./test-
>> > c32ispunct${EXEEXT} 3
>> > > >> >
>> > > >> > FAIL: test-c32ispunct.sh
>> > > >> >
>> > > >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > >> > ---
>> > > >>
>> > > >> Hi Khem,
>> > > >>
>> > > >> Thanks for your patch.
>> > > >>
>> > > >> It looks like this is breaking tests, specifically on qemuriscv64=
:
>> > > >>
>> > > >> Traceback (most recent call last):
>> > > >>   File "/srv/pokybuild/yocto-
>> > worker/qemuriscv64/build/meta/lib/oeqa/sdk/cases/maturin.py", line 25,=
 in
>> > test_maturin_list_python
>> > > >>     output =3D self._run("maturin list-python")
>> > > >>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > > >>   File "/srv/pokybuild/yocto-
>> > worker/qemuriscv64/build/meta/lib/oeqa/sdk/case.py", line 17, in _run
>> > > >>     return subprocess.check_output(". %s > /dev/null; %s;" % \
>> > > >>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> > > >>   File "/usr/lib/python3.12/subprocess.py", line 466, in check_ou=
tput
>> > > >>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, chec=
k=3DTrue,
>> > > >>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
>> > > >>   File "/usr/lib/python3.12/subprocess.py", line 571, in run
>> > > >>     raise CalledProcessError(retcode, process.args,
>> > > >> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '.
>> > /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/work/qemuriscv=
64-poky-
>> > linux/core-image-minimal/1.0/testsdkext/environment-setup-riscv64imafd=
c-poky-
>> > linux > /dev/null; maturin list-python;' died with <Signals.SIGSEGV: 1=
1>.
>> > > >>
>> > > >
>> > > > seems quite unrelated, I wonder if its finding some other bug
>> > >
>> > > Yes, I can't understand what happens here :(
>> > > Yet this commit always triggers the failure.
>> > >
>> >
>> > Looking at logs there is some more info  immediately after what you
>> > posted above that is interesting
>> >
>> > Stdout:
>> > Trying to install python3-maturin-native...
>> >
>> > its running lib/oeqa/sdk/cases/maturin.py and
>> > it seems it needs python3-maturin-native in sstate cache and I wonder
>> > if it's missing because m4/m4-native dependency will rebuild
>> > python3-maturin-native or something is racing with it.
>> >
>> > There was a similar problem in recent past and a related fix was commi=
tted
>> > https://git.yoctoproject.org/poky/commit/?id=3D2239c2c91ab35c67ccd95af=
e0573500
>> > 37f7d0e59
>> >
>> > I now wonder if the test is exited when it does not find
>> > python3-maturin-native correctly or not.
>>
>> The fact that maturin test is executed means that it was installed succe=
ssfully, so code in mentioned commit was not active.
>> Also segmentation fault suggests that the binary is installed, it just d=
oes not work correctly.
>
> Seems so, I would have expected SkipTest to execute if the install
> failed. so it seems to be installed fine, but segfaulting on run
> seems unrelated to above change which is modifying a testcase source
> file in m4, its not changing anything even in m4,  there
> was a possibility that modified m4-native is indirectly injecting some
> bug into maturin but thats unlikely.
>
> maybe run a build with just this single patch applied on top of the
> master branch.
>

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/368

Also failing :(


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


