Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535F7CA5FED
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 09:13:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3749.1791537205016315106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 02:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LsKpguuU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC3BC1A1189;
	Fri,  9 Oct 2026 09:13:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F36160754;
	Fri,  9 Oct 2026 09:13:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E7CF11D72644;
	Fri,  9 Oct 2026 11:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791537202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QArv6zrM+XNF5eyzq32Jtjd11U49djrvLUz4TOTxVLk=;
	b=LsKpguuUxWyyHqnz9D9FBVxPK/3n8/lIgLuPXdEtPrIqiFGBnoTzoDWG4wqJ+YA+GUUF26
	RtooMUMXBUxJNTK8/TNLLzw/DAa/jun78oxgKmmAL7T3LbiYiGvgBFm8dQSddArNpLOUsK
	xtV6hktI7HH0s/hS6HFcUE3Z+MYhRtgtAFTNbOzNl7ORJgK4iL0w4znL30tIpA70jQDaNN
	n3tg5yTgFz3F9Oy0pteHCNVa80t8zcDibhQUF1J1NleMnLlWtROfOBMClFhexnDMQ9SPbY
	c9fZnsgXF1qiPRbhl467Wr8NdmhCjijOxXUS6eHXzDl/vb/Bds/z68Vuow9j/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 11:13:18 +0200
Message-Id: <DM06XN6DKCG2.1T0CK74DHZUF6@bootlin.com>
Subject: Re: [OE-core] [PATCH v4 2/3] oe-selftest: fitimage: support new
 schema for uboot configuration signing
Cc: <a.fatoum@pengutronix.de>, <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rybczynska@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261008060935.4225-1-rybczynska@gmail.com>
 <20261008060935.4225-2-rybczynska@gmail.com>
In-Reply-To: <20261008060935.4225-2-rybczynska@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 09:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247471

On Thu Oct 8, 2026 at 8:09 AM CEST, Marta Rybczynska via lists.openembedded=
.org wrote:
> Modify testcases after adding signing of a configuration of uboot instead
> of various sections separately.
>
> This change includes an additional parameter to _check_signing that allow=
s
> more flexible configuration and avoids assumptions on what section has,
> and which section does not have a signature - now they are defined
> in a data structure.
>
> Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
> ---

Hi Marta,

Thanks for the new version.

It looks like the selftest is failing here:

2026-10-09 07:38:19,536 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs (subunit.RemotedTestCase)
2026-10-09 07:38:19,536 - oe-selftest - INFO -  ... ERROR
...
2026-10-09 07:38:19,537 - oe-selftest - INFO - 13: 7/35 462/773 (190.09s) (=
0 failed) (fitimage.KernelFitImageRecipeTests.test_fit_image_sign_initramfs=
)
2026-10-09 07:38:19,537 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1414, in test_fi=
t_image_sign_initramfs
    self._test_fitimage(bb_vars)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 660, in _test_fi=
timage
    self._check_fitimage(bb_vars, fitimage_path, uboot_tools_bindir)
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 617, in _check_f=
itimage
    self._check_signing(bb_vars, sections, req_sections, num_signatures, ub=
oot_tools_bindir, fitimage_path)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1108, in _check_=
signing
    if 'Sign algo' not in req_values[section]:
                          ^^^^^^^^^^
NameError: name 'req_values' is not defined

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4842
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5029

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


