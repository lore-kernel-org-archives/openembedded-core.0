Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5923.1794389299749823566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OBSOjkew;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9AEAC79A8F;
	Wed, 11 Nov 2026 09:28:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F2056017E;
	Wed, 11 Nov 2026 09:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62F4711BC126B;
	Wed, 11 Nov 2026 10:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794389296; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yp6rprq/y4byFOMXA46e/v1DKbVouV4toRAXG6YJPJ8=;
	b=OBSOjkewCzzEAGwr8EgmNiDuIYMEynm1HUrWNfxb6U1A3Zd297nc2q+x4KP37Ru6+Zs+hv
	Rwvmj1E4rQMQ74BAs9AXa9U5EuHjpqcaAfrlfd6xmzZJvqF1n0FbLsOl6hR/cAfUaaDa+i
	+dLmBg2mNli1hcq+kJOUEJAYWP6vgSgjCr9NRIGOr8Ah9biWGdMppqsOQ1EED71pXb3J5g
	+GFsFIhjSaSxGMiUtIdpZdnLvgd1eWAO8RSokLZ90nbxFtyKzXu9zeTpyYhV4lQRBGuy4b
	uEOrOoQhEyQXMB2VXOasJOmO3c3PmSJGCFH5pNfU21gXYEB5nBRz7dk3fq99Kw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:28:13 +0100
Message-Id: <DMS9X16PKR9S.2D74CYC8SGRT4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] groff: Upgrade 1.24.2 -> 1.25.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
 <20261110115105.80984-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261110115105.80984-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250009

On Tue Nov 10, 2026 at 12:51 PM CET, Jaipaul Cheernam wrote:
> - Drop builddep.patch as fix is part of release
> - Drop 0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch;
>   fixed upstream (Savannah #68136, released in 1.24.1). gropdf's SubTag()
>   no longer uses rand(), so the SOURCE_DATE_EPOCH srand() seed is obsolet=
e.
> - Refresh exisitng patches
> - Fix cross-compilation of man pages by using native soelim and stripping=
 build paths.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the v3. This is a bit better now, but we have a failing
selftest:

2026-11-10 16:07:36,082 - oe-selftest - INFO - imagefeatures.ImageFeatures.=
test_mandb (subunit.RemotedTestCase)
2026-11-10 16:07:36,083 - oe-selftest - INFO -  ... FAIL
...
2026-11-10 16:07:36,083 - oe-selftest - INFO - 7: 27/51 314/791 (1880.17s) =
(0 failed) (imagefeatures.ImageFeatures.test_mandb)
2026-11-10 16:07:36,086 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 334, in tes=
t_mandb
    self.assertIn("introduction to user commands", output)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/unittest/case.py", line 1192, in assertIn
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
    raise self.failureException(msg)
AssertionError: 'introduction to user commands' not found in ''


https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5238
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/5048

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

