Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE89C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:03:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34844.1790503412746971286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RNR+dYk/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E10E1C62214;
	Sun, 27 Sep 2026 10:04:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37460604FF;
	Sun, 27 Sep 2026 10:03:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EBB4102F1E6A;
	Sun, 27 Sep 2026 12:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790503409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mm+GhsPCAEXsarD1aTUAUllzQiW2lwdwUf7enu/ZI/0=;
	b=RNR+dYk/CyZ+QdnNeO+H2Hm9wxUvSDQ8wk3IYPtfN99pufXU3bSWkhBvfUfra89B34sk+q
	j+xzxBranKAacvwMjnhy/d+DFs3gZmgJLoLMbpyShMweGAamctiGSy9xoWCiD8KtAiiQmg
	bmDO8RyA4cGWhyYZIa5mfZzx2bXaeoWXiV+KmgF0ycCB/Wwp0RWfD27PJpadkG35KcxZfp
	tCQBkUQn0kMXy1Y72yPtBQa2FcB+57iiN0N6fwdyr9TY+w7V2G2wd38bkGrxjWtdZbCpci
	sTDcp1VI+ZKwz1GgXwI/iifmaWNZ0YO9/mLPRZJL6FQ4FtdKZsCbBNaPfZi6Ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 12:03:25 +0200
Message-Id: <DLQ0HH8L9QHZ.1WYTWAWQERROV@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] create-spdx-3.0: record component
 release date in SPDX output
Cc: <JPEWhacker@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260925082404.1491266-1-daniel.turull@ericsson.com>
In-Reply-To: <20260925082404.1491266-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 10:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246687

On Fri Sep 25, 2026 at 10:24 AM CEST, Daniel Turull via lists.openembedded.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Record each recipe's release date in the releaseTime property of its
> software_Package object, using the SOURCE_DATE_EPOCH already computed
> for reproducible builds.
>
> Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for
> git-tagged recipes, best-effort for tarball/http(s) sources. Some
> Python sdists (e.g. cryptography, hypothesis, maturin) normalize all
> file mtimes to a fixed placeholder, so their releaseTime reflects
> packaging-tool behavior, not the real release date.
>
> Tested with oe-selftest -r spdx, and with `bitbake world
> --runall=3Ddo_create_spdx`: 1011/1150 recipes got a releaseTime (range
> 1998-12-30 to 2026-09-17), 139 correctly had none.
>
> AI-Generated: Uses Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---

Hi Daniel,

Thanks for the new version, but it looks like the added test is failing:

2026-09-27 08:54:07,889 - oe-selftest - INFO - spdx.SPDX30Check.test_releas=
e_date_omitted_for_fallback_value (subunit.RemotedTestCase)
2026-09-27 08:54:07,890 - oe-selftest - INFO -  ... FAIL

Stderr:
2026-09-27 07:49:50,901 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2700487=
/conf/local.conf
2026-09-27 07:49:50,902 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2026-09-27 08:28:06,204 - oe-selftest - INFO - Found ANNOTATION2: ANNOTATIO=
N2=3DTestAnnotation2
2026-09-27 08:28:06,204 - oe-selftest - INFO - Found ANNOTATION1: ANNOTATIO=
N1=3DTestAnnotation1
2026-09-27 08:28:17,771 - oe-selftest - INFO - External references not foun=
d in SPDX output (defensive handling verified)
2026-09-27 08:51:21,993 - oe-selftest - INFO - The spdxId of gcc-16.2.0/REA=
DME in build-gcc.spdx.json is http://spdx.org/spdxdocs/gcc-f2eaeb0d-b54b-53=
ba-899a-8c36c21139bf/8d0c5dabebec7cf453eedeadd0b28521a17ebf965ccdf6c437d361=
3676ca56dc/sourcefile/22
2026-09-27 08:54:07,890 - oe-selftest - INFO - 8: 51/64 792/807 (15.32s) (0=
 failed) (spdx.SPDX30Check.test_release_date_omitted_for_fallback_value)
2026-09-27 08:54:07,890 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 482, in test_release=
_date_omitted_for_fallback_value
    self.assertExists(sde_file)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build=
-st-2700487/tmp/work/qemux86_64-poky-linux/packagegroup-base/1.0/source-dat=
e-epoch/__source_date_epoch.txt' does not exist

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4933
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4740

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


