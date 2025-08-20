Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A7CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 06:23:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.13723.1755671015595738369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 23:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L2LimMme;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8CFB11A0D4F;
	Wed, 20 Aug 2025 06:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D622606A0;
	Wed, 20 Aug 2025 06:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30B411C228B4F;
	Wed, 20 Aug 2025 08:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755671012; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9bSQG/xCAMqjXkZBNu086PP8k5UQzWks4mkANx0+6eY=;
	b=L2LimMmecQmv195WITZ5pMbqKKVz000AHzJoXxpA5cAkLqTZhdD67ZyjHjq4vLhvrOLY9C
	/pu5pKQ1wEBJQp+28x3Zb3D/Cbf0TwPtB6WI14DrNn7EMwJjYTNQEUAu1y83SG8/nup6QU
	3pByRxr97xezWJuV1H1YNVoeH2kz2C6a52xphgbWQMgj3Reqkw9/dWZuZlWO69y9Vbpl3h
	1lk5EKTfsSR1nnMoRsDBnXtejrZwSE+CXSwgR0Z50kB7G9Sywm7UlMLFJU7s7/HRax9fA3
	B1BOequvyLdYTnM/GC7KLhrEJuOD4dT6YRzlvPFDm2NKgPXMjWEXleJvXI1Yaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 08:23:30 +0200
Message-Id: <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250819010128.3519760-1-raj.khem@gmail.com>
 <20250819010128.3519760-3-raj.khem@gmail.com>
In-Reply-To: <20250819010128.3519760-3-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222154

On Tue Aug 19, 2025 at 3:01 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Fixes
> ../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion 'is =3D=3D=
 0' failed
> ./test-c32ispunct.sh: line 36:   402 Aborted
> (core dumped) LC_ALL=3D"$testlocale" ${CHECKER} ./test-c32ispunct${EXEEXT=
} 3
>
> FAIL: test-c32ispunct.sh
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patch.

It looks like this is breaking tests, specifically on qemuriscv64:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sdk/cas=
es/maturin.py", line 25, in test_maturin_list_python
    output =3D self._run("maturin list-python")
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuriscv64/build/meta/lib/oeqa/sdk/cas=
e.py", line 17, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemuriscv64/build/build/tmp/work/qemuriscv64-poky-linux/co=
re-image-minimal/1.0/testsdkext/environment-setup-riscv64imafdc-poky-linux =
> /dev/null; maturin list-python;' died with <Signals.SIGSEGV: 11>.


https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/354

I've launched a few rebuilds, the issue does reproduce every times. Can
you have a look please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


