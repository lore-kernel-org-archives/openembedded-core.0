Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABE4C63680
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 13:23:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13191.1771766614568784524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 05:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xPVb0XKt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 144ABC63A0C
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 13:23:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2FF9E5FB83;
	Sun, 22 Feb 2026 13:23:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10674103688B8;
	Sun, 22 Feb 2026 14:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771766611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r1GqCITs7PbpTZo3Y2GRNhq+1Vs95Nmgdcx1flyOcaU=;
	b=xPVb0XKt6SQ/TiYgQrOQCxgrwOxq0vEFpeHaTTWb7lpYTTK7ny+q4rJu4gYoZnL0HPx6Op
	u5q+VnC5sOEF8pjZ2oTuMpogt9mlQLLxaqe+eK2ZcGkXFuCgPd+jBdn0iqMvtff5D1XPm2
	FUDarzBHNfYGFLrk8nkrG8fyVhpHm3BBsH1KKyl8xt4dBKP8ovjFe7/hyyQdm0aPsl7qys
	VNxYKztixVfXdzUTGHUnJVBi0rT80VLFbWpA7a6YgcXc5aKzqy0XFialeUUsqfm19H/Imo
	yHBtp/SC7BR3kJ2hbp05giorThRMVZlaR5ydWuobZWXUlKp7Pia23gww83BSgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 14:23:28 +0100
Message-Id: <DGLIUFB3U88J.RMGWBUVVCWOY@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] spdx30: Read runtime dependencies from
 package manifests
Cc: <stefano.tondo.ext@siemens.com>, <adrian.freihofer@siemens.com>,
 <Peter.Marko@siemens.com>, <jpewhacker@gmail.com>, <Ross.Burton@arm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260221042521.318013-1-stondo@gmail.com>
 <20260221042521.318013-2-stondo@gmail.com>
In-Reply-To: <20260221042521.318013-2-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 13:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231632

On Sat Feb 21, 2026 at 5:25 AM CET, Stefano Tondo via lists.openembedded.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Previous implementation only captured explicit RDEPENDS from recipe
> variables, missing implicit runtime dependencies auto-detected by
> Yocto's packaging system (shared libraries like libc6, libssl3, libz1).
>
> This commit updates get_dependencies_by_scope() to:
> - Accept package parameter to read package-specific manifests
> - Read package manifests (PKGDATA) after packaging completes
> - Parse RDEPENDS including auto-detected shared library dependencies
> - Handle split packages correctly (multiple packages per recipe)
> - Fall back to recipe-level RDEPENDS if manifest unavailable
>
> Also clarifies that recursive dependency expansion is unnecessary:
> - Each package is processed separately in create_package_spdx()
> - Each package's direct dependencies are added as SPDX relationships
> - The resulting SBOM contains the complete dependency graph
> - SBOM consumers can traverse the graph for transitive dependencies
>
> Fixes lifecycle scope classification to capture ALL runtime dependencies
> (explicit + implicit).
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> Cc: "Ross Burton" <Ross.Burton@arm.com>
> ---

Hi Stefano,

Thanks for your patch.

It looks like the added
spdx.SPDX30Check.test_lifecycle_scope_dependencies test is failing:

2026-02-22 10:51:36,579 - oe-selftest - INFO - spdx.SPDX30Check.test_lifecy=
cle_scope_dependencies (subunit.RemotedTestCase)
2026-02-22 10:51:36,583 - oe-selftest - INFO -  ... FAIL
...
026-02-22 10:22:36,898 - oe-selftest - INFO - Found ANNOTATION2: ANNOTATION=
2=3DTestAnnotation2
2026-02-22 10:22:36,899 - oe-selftest - INFO - Found ANNOTATION1: ANNOTATIO=
N1=3DTestAnnotation1
2026-02-22 10:51:01,398 - oe-selftest - INFO - The spdxId of gcc-15.2.0/REA=
DME in recipe-gcc.spdx.json is http://spdx.org/spdxdocs/gcc-f2eaeb0d-b54b-5=
3ba-899a-8c36c21139bf/77722cdb050cf950f66e3b9cb87574fcb0bf404cd0c167d12d2b2=
060e65cb176/sourcefile/21
2026-02-22 10:51:36,583 - oe-selftest - INFO - 4: 41/51 658/670 (8.81s) (0 =
failed) (spdx.SPDX30Check.test_lifecycle_scope_dependencies)
2026-02-22 10:51:36,583 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 474, in test_lifecyc=
le_scope_dependencies
    self.assertTrue(
    ~~~~~~~~~~~~~~~^
        len(runtime_deps) > 0,
        ^^^^^^^^^^^^^^^^^^^^^^
        "No runtime dependencies found - lifecycle scope may not be working=
"
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^
    )
    ^
  File "/usr/lib/python3.13/unittest/case.py", line 744, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : No runtime dependencies found - lifecyc=
le scope may not be working


https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3371
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3253
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3131

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


