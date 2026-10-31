Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2906.1793435916159128741
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 01:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mMB6FUDb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D877C1A139D;
	Sat, 31 Oct 2026 08:38:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EEB76076B;
	Sat, 31 Oct 2026 08:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B80510328EFA;
	Sat, 31 Oct 2026 09:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793435912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5J/e3x7NQlIP93Ii5xriODZQliW4c/eif57ibQkRHds=;
	b=mMB6FUDbgdc7yKdFZoMRN9KID13xh8d6wReo0Ud3DTMPHh1Jdl690+cRr4eG8/4j4GOE6k
	2fow4ucmMGglUITtWobOD3u3nGSZ1gQDCExBIdgJ1kDoeM8wdG8ID5bJEnYzmgCt47Rfx/
	8Fp/4T3h2A77IdUwZ++45nNDoplSK81ngtx3WCIvb23379PLoVx8SEX+M/kFqqZ5FQM3kg
	3W3pWCM58+9pMVAyBWTEpFM/4lWRNUDZtPoeOJjCxyRqeCk5azugHwi21E4y+luZ5LFBnV
	Ef+eT/JyNQiTgbpRFDjdWylYP8TBXGoSZ2InlHEWkqAWZDVw0WTApabbj8wiiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 09:38:30 +0100
Message-Id: <DMIVYZC6OZUY.K8JSSXN15YSD@bootlin.com>
Subject: Re: [OE-core][PATCH] lttng-ust: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261029131154.7487-1-pratik.farkase@est.tech>
In-Reply-To: <20261029131154.7487-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 08:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249143

On Thu Oct 29, 2026 at 2:11 PM CET, Pratik Farkase wrote:
> Build and run the lttng-ust unit test suite under ptest, modelled on the
> liburcu ptest support: the run-ptest script executes each TAP test from
> the tests/unit subdirectories and reports PASS/FAIL. The compile tests,
> benchmarks and the abi0-conflict regression test (unstable under QEMU)
> are excluded.
>
> The ust-elf test ships prebuilt, intentionally foreign-architecture ELF
> fixtures, so they are kept from being stripped and the related QA checks
> are relaxed for the ptest package.
>
> Tested on qemuriscv64 with ptest-runner.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

It looks like one of the tests is failing:

WARNING: core-image-ptest-lttng-ust-1.0-r0 do_testimage: There were failing=
 ptests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped=
_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped=
_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped=
_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestr=
unner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemuarm64-musl-ptest/build/layers/opene=
mbedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestru=
nner
    self.fail(failmsg)
AssertionError:
Failed ptests:
{'lttng-ust': ['unit/ust-error/test_ust_error']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1469
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1491

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

