Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49011125824
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:55:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21548.1773237322997697667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JQdg0Wis;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43556C42872;
	Wed, 11 Mar 2026 13:55:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00AE760004;
	Wed, 11 Mar 2026 13:55:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B32B103699A8;
	Wed, 11 Mar 2026 14:55:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773237320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yLqZo7/0OGIQ94DdubQ9Hi4eL3TZQutLNTXuzEWAIvc=;
	b=JQdg0WiskTkiRk1sF1NCHWCIdDOaHQlwol1z4sTVaMevxjMWYEHeNh3aOUiFQ95STNGtoQ
	XFqtV3edNXyUIpJuG/Jicj8jiBwjX+9BfRlbx8bqn+kWla1+aV5l+UbdMLHv0Eu+tlp4So
	xGuZYVSZKEORnh+lEt+5fOzhRDlonKfLnXMXzsc32EIIY9HTPSBqav//+Pr8nRyEcrz9Py
	1nwpmnEcp2UI8gDarisS3RTQyjQn7la1KeTBYWenbx6jAKzFe6//vzb0HnBe7e7lrtkgzf
	cs10i/d4Zj1CBrBhSBuddpOUKRpbjtrr6nl++kEKh+3bblVCn1jEoKQn1nbuGw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:55:18 +0100
Message-Id: <DH00629IS6EY.1W6LCNY88LTHL@bootlin.com>
Subject: Re: [OE-core][PATCH v6 00/15] Add SPDX 3 Recipe Information
Cc: "Stefano Tondo" <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232886

On Tue Mar 10, 2026 at 7:38 PM CET, Joshua Watt via lists.openembedded.org =
wrote:
> Changes the SPDX 3 output to include a "recipe" package that describe
> static information available at parse time (without building). This is
> primarily useful for gathering SPDX 3 VEX information about some or all
> recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
> vex.bbclass.
>
> Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
> helping work through this.
>
> V2: Fixes a bug where do_populate_sysroot was running when it should not
> be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
> incorrect (this is already handled by bitbake in the taskgraph, and
> doesn't need to be manually removed).
>
> V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
> dependency. meta-world-recipe-sbom also no longer runs in world builds,
> as there's no reason to this. Finally, fixes a bug where
> NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
> (because do_unpack was not run).
>
> V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
> information is linked to binary packages, or just recipes. Defaults to
> "0" to significantly reduce the size of the SPDX output.
>
> V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
> does funny things with its arch which prevents it from rebuilding SPDX
> data properly, and no SPDX data is needed for it anyway
>
> V6: Fixes a bug where SPDX task would not correctly re-run when they
> change, which would cause errors about missing SPDX document. Also
> updates to the latest version of the SPDX bindings which improves
> performance
>

Hi Joshua,

Ok, we are almost there!

I suspect it would work fine on master, but we have a fail on two tests
that were recently added by Stefano, and were not merged so far.

As both series might still evolve or get reviews, I will probably keep
both in my branch, but some changes are needed if we want to merge both
series.

2026-03-11 11:31:27,495 - oe-selftest - INFO - spdx.SPDX30Check.test_downlo=
ad_location_defensive_handling (subunit.RemotedTestCase)
2026-03-11 11:31:27,495 - oe-selftest - INFO -  ... FAIL
...
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
d-st-1004290/tmp/deploy/spdx/3.0.1/cortexa57/recipes/recipe-m4.spdx.json' d=
oes not exist
...
2026-03-11 12:39:25,602 - oe-selftest - INFO - spdx.SPDX30Check.test_versio=
n_extraction_patterns (subunit.RemotedTestCase)
2026-03-11 12:39:25,603 - oe-selftest - INFO -  ... FAIL
...
2026-03-11 12:39:25,611 - oe-selftest - INFO - 6: 45/55 656/681 (14.27s) (2=
 failed) (spdx.SPDX30Check.test_version_extraction_patterns)
2026-03-11 12:39:25,611 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 479, in test_versio=
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
d-st-1004290/tmp/deploy/spdx/3.0.1/cortexa57/recipes/recipe-tar.spdx.json' =
does not exist

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3499
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3380
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3270

For reference, this oe-core branch was used during the build:
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3385

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


