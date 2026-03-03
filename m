Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F074CE67A95
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 08:42:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13913.1772527331454733067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 00:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z2j+LqEu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B1933C40FA3;
	Tue,  3 Mar 2026 08:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23AE05FF29;
	Tue,  3 Mar 2026 08:42:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C06C10368535;
	Tue,  3 Mar 2026 09:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772527328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EEVFCIi9vl2hs255rUPlFjwACCh1AVjtVYVLP3a7q6k=;
	b=z2j+LqEu+QvO6GD8FEv6u4Fc+tDOS3WG+FDWDNlxmB7366HB+7DTIeETaYvuIGJnLXC54a
	HarBe6H1m9Qxk+v5sdOJBukuk8RcLQTTlCjaTxHMMk320MYCdBCAC+b99x22dPHnsMvp7I
	skbaX+u5AfITAxzuXUq3VB5BdBPqBX/ez42QqQRDHQnDkG6vffRd4sn5AnhUN90YwYlLpl
	Po8UDmx3K2cl0HLV2wZSHFMlk3kfAaKykJGTgMTXuDhi/OHLHb7plRuXI5rqcV5gHJ1THo
	Lq40m45G3bR2U4VX5+s/Cmbsn+WXbpKu1ADMyN7jcbYZzrKIBQpY0S3UHHxTXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 09:42:04 +0100
Message-Id: <DGT0HVQB154L.3E9JJLNYVHH0Q@bootlin.com>
Cc: <Ross.Burton@arm.com>, <jpewhacker@gmail.com>,
 <stefano.tondo.ext@siemens.com>, <Peter.Marko@siemens.com>,
 <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 04/10] spdx30: Add version extraction from
 SRCREV for Git source components
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260302160114.46884-5-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260302160114.46884-5-stefano.tondo.ext@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 08:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232265

On Mon Mar 2, 2026 at 5:01 PM CET, Stefano Tondo via lists.openembedded.org=
 wrote:
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

Thanks for the new version, but we again have a lot of selftests failing:

2026-03-02 17:36:16,484 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_binary (subunit.RemotedTestCase)
2026-03-02 17:36:16,484 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 17:36:16,486 - oe-selftest - INFO - 7: 7/29 178/673 (21.91s) (0 =
failed) (devtool.DevtoolAddTests.test_devtool_add_binary)
2026-03-02 17:36:16,486 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 419, in test_devt=
ool_add_binary
    result =3D runCmd('devtool add  -b %s %s' % (pn, bin_package_path))
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'devtool add  -b tst-bin /tmp/devtoolqalnb521vt/tst=
-bin.tar.gz' returned non-zero exit status 1:
...
2026-03-02 17:36:37,300 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_fetch (subunit.RemotedTestCase)
2026-03-02 17:36:37,301 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 17:36:37,302 - oe-selftest - INFO - 7: 8/29 181/673 (20.82s) (2 =
failed) (devtool.DevtoolAddTests.test_devtool_add_fetch)
2026-03-02 17:36:37,302 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 554, in test_devt=
ool_add_fetch
    result =3D runCmd('devtool add --no-pypi %s %s -f %s' % (testrecipe, sr=
cdir, url))
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'devtool add --no-pypi python-markupsafe /tmp/devto=
olqaamxld4_b/python-markupsafe -f https://files.pythonhosted.org/packages/c=
0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSaf=
e-0.23.tar.gz' returned non-zero exit status 1:
...
2026-03-02 17:37:54,668 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_fetch_simple (subunit.RemotedTestCase)
2026-03-02 17:37:54,668 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 17:41:18,826 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_python_egg_requires (subunit.RemotedTestCase)
2026-03-02 17:41:18,826 - oe-selftest - INFO -  ... FAIL
...

Continuing with 25 test fails.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3314
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3204
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3434

Can you have a look at these failures?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


