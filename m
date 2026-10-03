Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322D8CA5FED
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 16:50:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9052.1791046230866561609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 09:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=d5G1W4/I;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C12E1A1108;
	Sat,  3 Oct 2026 16:50:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60753604FF;
	Sat,  3 Oct 2026 16:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B307C10328170;
	Sat,  3 Oct 2026 18:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791046227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RbDmOHzGiPKqRGc1V9eLtdIJexzevVV7+tTYcX+l86A=;
	b=d5G1W4/InnAkEENfnF6oQRsH8HiLk6+IYyd5/zpizgQhgokqEE+XgNb3wMYPZKnswhgqlR
	OudsK1r0zmaaQX2C/2GrtbGGkAWsK/TuLAS+AzeI07cvWaezpFI1NfR85A0ndy+xXyL2T1
	VsSqD4RzDUG/0P2i57EgWhtb+DOF4NHlpLxeLqRbvwkdIQLGDrVRxbL1T4Ysw5CeXtFaRg
	5ucvnVUoZgXAqGBYT+oO+VZqShoBtSlDBBCQ4JjcfRiaQMPfnIUcadRXrbHquZDkiVVc9z
	r7reLYBBaczgFdIvu5edLX3KhNRK8kvfyeLFXLObCB4WwG/o2q1DbJ1VNmL23g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 18:50:25 +0200
Message-Id: <DLVCWCY4UQ9E.3307IXG39F4B@bootlin.com>
Subject: Re: [OE-core] [PATCH v4 0/3] spdx: add support to include
 releaseTime
Cc: <JPEWhacker@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002075414.2311840-1-daniel.turull@ericsson.com>
In-Reply-To: <20261002075414.2311840-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 16:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247170

On Fri Oct 2, 2026 at 9:54 AM CEST, Daniel Turull via lists.openembedded.or=
g wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> We have a requirements to include release time of open source components
> in the SBOM. There is a field specific for that in spdx 3 spec.
>
> https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Properties/releaseTime=
/
>
> This can also be used to evaluate how old are some of the core
> components and decide if they need replacement.
>
> The previous 2 versions did not have cover letter.
>
> In v4 I kept the simpler logic to just check for the epoch date, even if
> we have multiple sources with different release dates. It was getting
> complicated and adding more code for git and tarfiles. I can do a follow
> up patch after this simpler version gets in, so we can fine tune it.
>
> Tested with oe-selftest -r spdx
>
> Daniel Turull (3):
>   classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
>   create-spdx-3.0: record component release date in SPDX output
>   scripts/contrib: add spdx-release-date-report.py
>
>  meta/classes-global/base.bbclass            |   4 +
>  meta/lib/oe/spdx30_tasks.py                 |  22 +++
>  meta/lib/oeqa/selftest/cases/spdx.py        |  41 +++++
>  scripts/contrib/spdx-release-date-report.py | 191 ++++++++++++++++++++
>  4 files changed, 258 insertions(+)
>  create mode 100755 scripts/contrib/spdx-release-date-report.py

Hi Daniel,

It looks like one of the added tests is failing here:

2026-10-03 15:26:28,760 - oe-selftest - INFO - spdx.SPDX30Check.test_releas=
e_date_source_date_epoch (subunit.RemotedTestCase)
2026-10-03 15:26:28,761 - oe-selftest - INFO -  ... FAIL
...
2026-10-03 15:26:28,761 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 473, in test_release=
_date_source_date_epoch
    self.assertEqual(pkg.releaseTime, expected)
  File "/usr/lib/python3.11/unittest/case.py", line 873, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.11/unittest/case.py", line 866, in _baseAssertEqua=
l
    raise self.failureException(msg)
AssertionError: datetime.datetime(2023, 7, 18, 6, 55, 23, tzinfo=3Ddatetime=
.timezone.utc) !=3D datetime.datetime(2011, 4, 5, 23, 0, tzinfo=3Ddatetime.=
timezone.utc)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4997

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


