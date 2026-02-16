Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB793E63F30
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 06:48:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14579.1771224535570174097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 22:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jbJmCvW3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39D5AC17B47
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 06:49:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6450B606CF;
	Mon, 16 Feb 2026 06:48:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A44C102F1D2B;
	Mon, 16 Feb 2026 07:48:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771224530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Wo3WVeZocY/4GT2C38LRHbpAyx7hKB/d8L+y07/uLG4=;
	b=jbJmCvW3U71f8G1XBDYGXSnN9JUutmalvltDWaQrj5OAG2sBz8Se8XUsK0m64H0KerOC7a
	mvJxMXfCHkeYkuarFJzhV5Z3+feRTLtACEDHQCJlIumeGIuzgKt4DtAH9JucEEUy+c2U4m
	xJTXPWNcznFQ1yogcipp7Mm5lQa1mqVy/pJDNuJ53c8vMCbrW7bz4pSF6lOjjctRmL7UIM
	rewlpfCyXbQqC3YUYBxBvHWoeT2ls9kKVtwIES1DOguxG55zxE7GWuYQ855MZL1bjGlbvO
	7bLmtx27tRGI9lIMtk5+BkioTLpnD7nysHHwfM240AnQBELALDO+xAYZVZ898A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 07:48:47 +0100
Message-Id: <DGG6OYYX5OU2.2B78BO0SIP4WM@bootlin.com>
Subject: Re: [PATCH] meta: fix generation of kernel CONFIG_ in SPDX3
Cc: <JPEWhacker@gmail.com>, <kamel.bouhara@bootlin.com>,
 <jeremie.dautheribes@bootlin.com>, <thomas.petazzoni@bootlin.com>,
 <antonin.godard@bootlin.com>, <pascal.eberhard@se.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213-fix-kernel-config-spdx-v1-1-4fd66ca5cb5d@bootlin.com>
In-Reply-To: <20260213-fix-kernel-config-spdx-v1-1-4fd66ca5cb5d@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 06:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231180

On Fri Feb 13, 2026 at 10:26 AM CET, Benjamin Robin wrote:
> With the current solution, using a separate task
> (do_create_kernel_config_spdx) there is a dependency issue. Sometimes
> the final rootfs SBOM does not contain the CONFIG_ values.
>
> do_create_kernel_config_spdx is executed after do_create_spdx which
> deploys the SPDX file. do_create_kernel_config_spdx calls
> oe.sbom30.find_root_obj_in_jsonld to read from the deploy directory,
> which is OK, but the do_create_kernel_config_spdx ends up writing to
> this deployed file (updating it).
>
> do_create_rootfs_spdx has an explicit dependency to all do_create_spdx
> tasks, but there is nothing that prevents executing
> do_create_kernel_config_spdx after do_create_rootfs_spdx.
>
> To fix it, instead, now read from the workdir, and write to the
> workdir, and do the processing from the do_create_spdx task:
> we append to the do_create_spdx task.
>
> Also only execute this task if create-spdx-3.0 was inherited,
> previously this code could be executed if create-spdx-2.2 is
> inherited.
>
> Fixes: 228a968e7c47 ("kernel.bbclass: Add task to export kernel configura=
tion to SPDX")
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---

Hi Benjamin,

Thanks for your patch.

It looks like this is breaking=20

2026-02-15 20:21:08,055 - oe-selftest - INFO - spdx.SPDX30Check.test_kernel=
_config_spdx (subunit.RemotedTestCase)
2026-02-15 20:21:08,055 - oe-selftest - INFO -  ... FAIL
...
2026-02-15 20:21:08,055 - oe-selftest - INFO - 4: 41/51 636/670 (135.25s) (=
2 failed) (spdx.SPDX30Check.test_kernel_config_spdx)
2026-02-15 20:21:08,056 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 369, in test_kernel=
_config_spdx
    objset =3D self.check_recipe_spdx(
             ^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 102, in check_recip=
e_spdx
    bitbake(f"-c {task} {target_name}")
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
AssertionError: Command 'bitbake  -c do_create_kernel_config_spdx linux-yoc=
to' returned non-zero exit status 1:
...
Initialising tasks...ERROR: Task do_create_kernel_config_spdx does not exis=
t for target linux-yocto (/srv/pokybuild/yocto-worker/oe-selftest-armhost/b=
uild/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb=
:do_create_kernel_config_spdx)
ERROR: Command execution failed: 1

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3329
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3096
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3220

Can you have a look at what is the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


