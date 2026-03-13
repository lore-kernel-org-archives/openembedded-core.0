Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33903106FD85
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:14:21 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9923.1773382450252704511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=B359GOvF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B12FEC415A5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 899B660027;
	Fri, 13 Mar 2026 06:14:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60C7A10369DE1;
	Fri, 13 Mar 2026 07:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773382446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=byOEVS7jsL6wCATlX5Ur+KsoYOTYBYgfLX7Egex1hlk=;
	b=B359GOvF7HN2kIPuSCGfYaSZody4jm1eXwyQh8REhAJxpkNRftxwOab/YtaLie0zMRa3Fk
	p9Fcw2khOhryR2mpENc/JuygSsDw5Hu5EsradmeJb/r6vmxBC5yjpq8/wXASLL2i7TIx5B
	Xru2FrlGPZ7KostKnKlFRK3G7I3zrrC5ZfaG0NxoccVy85rc1BjOmcJC+OxcrjfB+ZUVQl
	w8ktUhhx8/fXRkKxTo3YoT/8ogweFE/KklQNu6oQ5ruhXeTkoFGzq2x8943p5W35w6ye88
	feOmPLpxQ6x8LWFrQoy2M+FBQ6X+mQUQA/bTlGy1IQGqus1GSb2byQiB1c/3DA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 07:14:04 +0100
Message-Id: <DH1FM09J7MP2.1V0UMBU01I298@bootlin.com>
Subject: Re: [OE-core][PATCH v9 5/7] oeqa/selftest: Add tests for source
 download enrichment
Cc: <JPEWhacker@gmail.com>, "Stefano Tondo" <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
 <20260312153845.164369-6-stondo@gmail.com>
In-Reply-To: <20260312153845.164369-6-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233024

On Thu Mar 12, 2026 at 4:38 PM CET, Stefano Tondo via lists.openembedded.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add two new SPDX 3.0 selftest cases:
>
> test_download_location_defensive_handling:
>   Verifies SPDX generation succeeds for recipes with tarball sources
>   and that external references are properly structured (ExternalRef
>   locator is a list of strings per SPDX 3.0 spec).
>
> test_version_extraction_patterns:
>   Verifies that version extraction works correctly and all source
>   packages have proper version strings containing digits.
>
> These tests validate the source download enrichment added in the
> previous commit.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---

Hi Stefano,

Thanks for the new version. Builds look correct so far, except for
these 3 selftest errors:

2026-03-12 22:29:04,908 - oe-selftest - INFO - spdx.SPDX30Check.test_downlo=
ad_location_defensive_handling (subunit.RemotedTestCase)
2026-03-12 22:29:04,909 - oe-selftest - INFO -  ... FAIL
...
2026-03-12 22:29:04,910 - oe-selftest - INFO - 6: 39/53 444/679 (18.85s) (0=
 failed) (spdx.SPDX30Check.test_download_location_defensive_handling)
2026-03-12 22:29:04,911 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 424, in test_downlo=
ad_location_defensive_handling
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-m4.spdx.json' do=
es not exist
...
2026-03-12 23:32:02,849 - oe-selftest - INFO - spdx.SPDX30Check.test_packag=
econfig_spdx (subunit.RemotedTestCase)
2026-03-12 23:32:02,849 - oe-selftest - INFO -  ... FAIL
...
2026-03-12 23:32:02,850 - oe-selftest - INFO - 6: 43/53 634/679 (70.33s) (2=
 failed) (spdx.SPDX30Check.test_packageconfig_spdx)
2026-03-12 23:32:02,850 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 393, in test_packag=
econfig_spdx
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-tar.spdx.json' d=
oes not exist
...
2026-03-12 23:32:16,627 - oe-selftest - INFO - spdx.SPDX30Check.test_versio=
n_extraction_patterns (subunit.RemotedTestCase)
2026-03-12 23:32:16,628 - oe-selftest - INFO -  ... FAIL
...
2026-03-12 23:32:16,628 - oe-selftest - INFO - 6: 44/53 635/679 (13.78s) (4=
 failed) (spdx.SPDX30Check.test_version_extraction_patterns)
2026-03-12 23:32:16,628 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 452, in test_versio=
n_extraction_patterns
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recip=
e_spdx
    return self.check_spdx_file(filename)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_f=
ile
    self.assertExists(filename)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3170645/tmp/deploy/spdx/3.0.1/cortexa57/recipes/build-tar.spdx.json' d=
oes not exist

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3513
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3395
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3286

Looking at the error, I suspect this is to address changes from the
Joshua series, but I didn't had this series in my branch. Is that right?

I will keep these changes in my branch, so we can go further, but please
confirm everything is correct.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


