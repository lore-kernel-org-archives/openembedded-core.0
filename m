Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E378BFC590F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 08:28:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66198.1772094533660060254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 00:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=owNjxoG1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98A93C40695
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 08:29:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E8455FDEB;
	Thu, 26 Feb 2026 08:28:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33431103682A8;
	Thu, 26 Feb 2026 09:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772094525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cERTLUUSmfQoSLW8Nggh5el8hsiUkCtHaNKpNGK7XRA=;
	b=owNjxoG1rOw8pdi7UPaC7Ckf8szcUEWHELJG7BBkTnZSWS/NQz6iWPoZiTFo+DN3qvfB9G
	Z9is+fr1JeyZmN9tfkIUnBrlf/bNoyyK9ZFuixeUkf29sA1boKISQRkFAYVZGdm8AWAREP
	VlBXWFNgA0Bw8CmG0ZmJMGREmea1OZR83ycKx5NKBzEHEdLgtj1GFmYIl/rnae1SPQ7uQW
	H4++0eiXQC2RdWftOFGPB5LRCCmfZSIDV+tRDfC0LLJfbGe5Fq+TTuzsGz22yiapWaL212
	KqfjaohjWMXKYQdQgvRRNjvaLa8mBl7NyyOX6mU0CE5xWp7do/ezTMzmQHTzLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 09:28:41 +0100
Message-Id: <DGOR2WRMKZON.1HERC4PJ8HFZP@bootlin.com>
Subject: Re: [PATCH v3 04/11] spdx30: Add version extraction from SRCREV for
 Git source components
Cc: <stefano.tondo.ext@siemens.com>, <adrian.freihofer@siemens.com>,
 <Peter.Marko@siemens.com>, <jpewhacker@gmail.com>, <Ross.Burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224162946.4000445-1-stondo@gmail.com>
 <20260224162946.4000445-5-stondo@gmail.com>
In-Reply-To: <20260224162946.4000445-5-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 08:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231994

On Tue Feb 24, 2026 at 5:29 PM CET, Stefano Tondo wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Extract version information for Git-based source components in SPDX 3.0
> SBOMs to improve SBOM completeness and enable better supply chain trackin=
g.
>
> Problem:
> Git repositories fetched as SRC_URI entries currently appear in SBOMs
> without version information (software_packageVersion is null). This makes
> it difficult to track which specific revision of a dependency was used,
> reducing SBOM usefulness for security and compliance tracking.
>
> Solution:
> - Extract SRCREV for Git sources and use it as packageVersion
> - Use fd.revision attribute (the resolved Git commit)
> - Fallback to SRCREV variable if fd.revision not available
> - Use first 12 characters as version (standard Git short hash)
> - Generate pkg:github PURLs for GitHub repositories (official PURL type)
> - Add comprehensive debug logging for troubleshooting
>
> Impact:
> - Git source components now have version information
> - GitHub repositories get proper PURLs (pkg:github/owner/repo@commit)
> - Enables tracking specific commit dependencies in SBOMs
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---

Hi Stefano,

Thanks for the new version.

It looks like some selftests are failing with this:

2026-02-25 10:19:06,136 - oe-selftest - INFO - recipetool.RecipetoolCreateT=
ests.test_recipetool_create_python3_setuptools (subunit.RemotedTestCase)
2026-02-25 10:19:06,136 - oe-selftest - INFO -  ... FAIL

Stderr:
2026-02-25 10:01:07,706 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-264192=
2/conf/local.conf
2026-02-25 10:01:07,706 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2026-02-25 10:19:06,136 - oe-selftest - INFO - 0: 30/38 191/672 (18.93s) (6=
 failed) (recipetool.RecipetoolCreateTests.test_recipetool_create_python3_s=
etuptools)
2026-02-25 10:19:06,136 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/recipetool.py", line 487, in test_=
recipetool_create_python3_setuptools
    result =3D runCmd('recipetool create --no-pypi -o %s %s' % (temprecipe,=
 srcuri))
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'recipetool create --no-pypi -o /tmp/recipetoolqak2=
seh03s/recipe https://files.pythonhosted.org/packages/84/30/80932401906eaf7=
87f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-0.4.15.tar.gz' r=
eturned non-zero exit status 1:
NOTE: Reconnecting to bitbake server...
INFO: Fetching https://files.pythonhosted.org/packages/84/30/80932401906eaf=
787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-0.4.15.tar.gz..=
.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...ERROR: /tmp/recipetoolqab0ppgbe1/recipes-recipetool/recip=
etool/tmp-recipetool-rnbr783h.bb: AUTOREV/SRCPV set too late for the fetche=
r to work properly, please set the variables earlier in parsing. Erroring i=
nstead of later obtuse build failures.
ERROR: Parsing halted due to errors, see error messages above

Summary: There were 2 ERROR messages, returning a non-zero exit code.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/scripts/recipetool", line 111, in <module>
    ret =3D main()
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/scripts/recipetool", line 100, in main
    ret =3D args.func(args)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/scripts/lib/recipetool/create.py", line 525, in create_recipe
    checksums, ftmpdir =3D scriptutils.fetch_url(tinfoil, fetchuri, srcrev,=
 srctree, logger, preserve_tmp=3Dargs.keep_temp)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/scripts/lib/scriptutils.py", line 202, in fetch_url
    tinfoil.parse_recipes()
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/tinfoil.py", line 585, in parse_recipes
    self.run_actions(config_params)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/bitbak=
e/lib/bb/tinfoil.py", line 568, in run_actions
    raise TinfoilUIException(ret)
bb.tinfoil.TinfoilUIException: 1
...
2026-02-25 10:19:25,736 - oe-selftest - INFO - recipetool.RecipetoolCreateT=
ests.test_recipetool_create_python3_setuptools_pypi (subunit.RemotedTestCas=
e)
2026-02-25 10:19:25,737 - oe-selftest - INFO -  ... FAIL
...

And so on with I believe 17 tests.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3397
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3279

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


