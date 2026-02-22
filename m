Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF866C63699
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 13:34:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13309.1771767291032356460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 05:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ylCLyUZI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43D62C1656A;
	Sun, 22 Feb 2026 13:35:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DBB45FB83;
	Sun, 22 Feb 2026 13:34:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4B0A103688B8;
	Sun, 22 Feb 2026 14:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771767287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CWWXKrL00Iqh3b6ZISH9Ql+0JlPerYb74KKjEoy6a/M=;
	b=ylCLyUZIceYfN9iyIJPAa88m7Rs3f5ux7McNe0Cq/WtmRbmGKTAo6nYACNifREzgaG3upG
	1qpAUGcamzB815T6Hw/FAAZzlGSA2uJGppX8e1lSYZgCQ622L1Ogv8UXXA094GXetCGdlF
	XVi/YIqPQjKMVaJI/xYzWdRoMgd6ZGqbWn1OlA0P60MXf0wK3kEfCY25148+InLKSVOJ2R
	rn3Hk92bo/Corsso5Rg1Q8PlgEhUTYbNFGYaoY0V1D8vcVXZQM50SYZqoNtPMxYpMlYhM4
	rQzOdmLoIW2G/yNQeYMmmdKSwdHA/k/K+/eIR2UVrd8Eiy3gjcYqVfafC5lWZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 14:34:45 +0100
Message-Id: <DGLJ32AURGEJ.2E3625OVEY3H1@bootlin.com>
Cc: <stefano.tondo.ext@siemens.com>, <adrian.freihofer@siemens.com>,
 <Peter.Marko@siemens.com>, <jpewhacker@gmail.com>, <Ross.Burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 04/18] spdx30: Add version extraction from
 SRCREV for Git source components
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260221051006.335141-1-stondo@gmail.com>
 <20260221051006.335141-5-stondo@gmail.com>
In-Reply-To: <20260221051006.335141-5-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 13:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231633

On Sat Feb 21, 2026 at 6:09 AM CET, Stefano Tondo via lists.openembedded.or=
g wrote:
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

Thanks for your patch.

It looks like several selftests are failing on the autobuilder with this
series, possibly because of this commit.

We have the following errors:

2026-02-21 15:08:11,906 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.=
test_devtool_finish_upgrade_origlayer (subunit.RemotedTestCase)
2026-02-21 15:08:11,907 - oe-selftest - INFO -  ... FAIL
...
2026-02-21 15:08:11,907 - oe-selftest - INFO - 1: 21/52 212/672 (96.59s) (0=
 failed) (devtool.DevtoolUpgradeTests.test_devtool_finish_upgrade_origlayer=
)
2026-02-21 15:08:11,907 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2236, in test_de=
vtool_finish_upgrade_origlayer
    recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backport=
edpatchfn =3D self._setup_test_devtool_finish_upgrade()
                                                                           =
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2216, in _setup_=
test_devtool_finish_upgrade
    result =3D runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, new=
version))
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",

AssertionError: Command 'devtool upgrade devtool-upgrade-test1 /tmp/devtool=
qaskjpeqye -V 1.6.0' returned non-zero exit status 1:
...
2026-02-21 15:09:47,787 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.=
test_devtool_finish_upgrade_otherlayer (subunit.RemotedTestCase)
2026-02-21 15:09:47,788 - oe-selftest - INFO -  ... FAIL
...
2026-02-21 15:10:37,499 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.=
test_devtool_rename (subunit.RemotedTestCase)
2026-02-21 15:10:37,500 - oe-selftest - INFO -  ... FAIL
...
2026-02-21 15:12:11,843 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.=
test_devtool_upgrade (subunit.RemotedTestCase)
2026-02-21 15:12:11,843 - oe-selftest - INFO -  ... FAIL
...

We have 29 test fails in total, I will let you look at the logs for the
whole list.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3368
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3250
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3128

Can you have a look at these issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


