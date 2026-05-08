Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A99CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:26:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8339.1778225161853555657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TOySiu7f;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F3B91A3486
	for <openembedded-core@lists.openembedded.org>; Fri,  8 May 2026 07:25:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70D08605D0;
	Fri,  8 May 2026 07:25:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF7010819603;
	Fri,  8 May 2026 09:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778225159; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BV+avxwa7gtCvVVN7EBj4KByYj5HDLdRDB/fBRNFpRo=;
	b=TOySiu7f8fYRwWIwfM9nzoTXnMOXZLO5w21mDmcxl273uHKf7tRm2CrGub6WuuzBnqc5NY
	aY1u1bLSsuU4fZJDetZiEKmzMHuNAQMT9KH87XBFtrIB4wPBPugbamNz7KVTfqGLPP6ml8
	GJK/LGjL2z/BHopyVaLWzmffCI3aN5PLrNozkyAPmey1rHP9jsusEbmkOXdmpaIruw/nhq
	/jyyX7USKdXzJe2B3uEGSZY29tyFpndMHKyPuJ9BIMalhHHyxcoFkEURCadtY0F9ypn0r1
	k7hYEKUOD0QB3DbkGHaZnLnJqZsRaoA3VIDo8pPPnqemb1GJCoM7Z61aUfF8PQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 09:25:55 +0200
Message-Id: <DID47J0WFLUR.3GGTJFJNINZIN@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/2] oeqa/selftest/pkgdata: add a test for
 variable consistency in multilib
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jaeyoon.jung@lge.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260506172416.4017418-1-jaeyoon.jung@lge.com>
 <20260506172416.4017418-3-jaeyoon.jung@lge.com>
In-Reply-To: <20260506172416.4017418-3-jaeyoon.jung@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236696

On Wed May 6, 2026 at 7:24 PM CEST, Jaeyoon Jung (LGE) via lists.openembedd=
ed.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> Add a selftest to verify that the pkgdata variable LICENSE is identical
> between libsystemd and lib32-libsystemd.
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---

Hi Jaeyoon,

Thanks for your patch.

It looks like the added test is failing on the autobuilder:

2026-05-07 11:45:34,293 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests.t=
est_multilib_variables (subunit.RemotedTestCase)
2026-05-07 11:45:34,296 - oe-selftest - INFO -  ... FAIL
...
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/pkgdata.py", line 239, in test_mul=
tilib_variables
    bitbake('systemd lib32-systemd')
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  systemd lib32-systemd' returned non-zero =
exit status 1:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
ERROR: Nothing PROVIDES 'systemd'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3911
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3806
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3678

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


