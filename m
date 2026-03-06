Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911F2F51408
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 06:32:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64131.1772778758668890273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QjqrW5Y9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F1584E42584
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 06:32:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AFC95FF92;
	Fri,  6 Mar 2026 06:32:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81B371036980B;
	Fri,  6 Mar 2026 07:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772778755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/j4OQnGaSxV6tOTRA8+3UMfZ1khkm9Yyi8/Om4gYyTc=;
	b=QjqrW5Y9WRGqT+5EcEixmQg1POiQPcWYOxthufLOhWuFad/qP72VmQJhcqdVsQGXupZRIx
	imWnFBYG8C4CmLzpJWricqw2oqRFwbfWb0/TAlJr/jk/Po4kyQ/29kwZjZRyKGnXYrs09F
	JGP+o9/bRwtIJiQbb4B/uI/W8mq/yxxyQAr5oxjZcSoJG3R4ITTZDl827yOUwd6AvyqNHj
	jbRpDevJebQmYmKGGL+QLzXSeLf47tCgig03JXIJSbkeoWN5GVNr4+/ZZJ5zh+IRdcLVGf
	wWU8b7lXFNX3DHFAjH8+IEnwfWx+RAK5g6BT3byc3wux6fR/NFlGBXS53FFQiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 07:32:32 +0100
Message-Id: <DGVHMBZHN957.38EKYTFFXU9XZ@bootlin.com>
Subject: Re: [PATCH v6 00/10] spdx30: SBOM enrichment and documentation
Cc: <Ross.Burton@arm.com>, <stefano.tondo.ext@siemens.com>,
 <Peter.Marko@siemens.com>, <adrian.freihofer@siemens.com>,
 <jpewhacker@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232532

On Wed Mar 4, 2026 at 6:05 PM CET, Stefano Tondo wrote:
> This v6 fixes the autobuilder selftest failures (25+ devtool/recipetool
> tests) reported by Mathieu Dubois-Briand for v5. The root cause was a
> reintroduced d.getVar('SRCREV') call in patch 04 ("Add version extraction
> from SRCREV for Git source components") that was accidentally restored
> during the v5 rebase/squash.
>
> Because spdx30_tasks.py is registered via BBIMPORTS, bitbake's code parse=
r
> traces all variable references in its public functions. The d.getVar('SRC=
REV')
> call caused the signature generator to follow the SRCREV -> AUTOREV
> dependency chain during recipe finalization, triggering "AUTOREV/SRCPV se=
t
> too late" fatal errors for non-git temporary recipes used by recipetool
> and devtool with HTTP sources.
>
> The fix removes the d.getVar('SRCREV') fallback entirely, relying solely =
on
> fd.revision which is always available for git sources after fetch. A safe=
ty
> comment explains why d.getVar('SRCREV') must never be used in this contex=
t.
>

Hi Stefano,

Thanks for the new version. We still have two selftest failures:

2026-03-05 19:31:34,702 - oe-selftest - INFO - spdx.SPDX30Check.test_downlo=
ad_location_defensive_handling (subunit.RemotedTestCase)
2026-03-05 19:31:34,703 - oe-selftest - INFO -  ... FAIL
...
2026-03-05 19:31:34,708 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 451, in test_downlo=
ad_location_defensive_handling
    objset =3D self.check_recipe_spdx(
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-1062472/tmp/deploy/spdx/3.0.1/cortexa57/recipes/recipe-m4.spdx.json' d=
oes not exist
...
2026-03-05 21:02:03,859 - oe-selftest - INFO - spdx.SPDX30Check.test_versio=
n_extraction_patterns (subunit.RemotedTestCase)
2026-03-05 21:02:03,860 - oe-selftest - INFO -  ... FAIL
...
2026-03-05 21:02:03,860 - oe-selftest - INFO - 5: 42/52 664/676 (12.84s) (2=
 failed) (spdx.SPDX30Check.test_version_extraction_patterns)
2026-03-05 21:02:03,860 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 485, in test_versio=
n_extraction_patterns
    objset =3D self.check_recipe_spdx(
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-1062472/tmp/deploy/spdx/3.0.1/cortexa57/recipes/recipe-tar.spdx.json' =
does not exist


https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3458
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3339
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3228

Can you have a look at these errors?


I also note this test failure, specifically on Fedora:
2026-03-05 18:18:02,472 - oe-selftest - INFO - newlib.NewlibTest.test_newli=
b (subunit.RemotedTestCase)
2026-03-05 18:18:02,473 - oe-selftest - INFO -  ... FAIL

I seems a bit unrelated, so maybe just an intermittent error.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


