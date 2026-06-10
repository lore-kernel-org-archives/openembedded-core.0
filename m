Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F65CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 13:17:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20041.1781097471915702526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 06:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SInNEIxi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E18564E42E00;
	Wed, 10 Jun 2026 13:17:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B65AF5FFC9;
	Wed, 10 Jun 2026 13:17:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22341106B9989;
	Wed, 10 Jun 2026 15:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781097469; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HTMFY/e5dQV5BUGJxyOhstVvyH5u6gnGzP4H7VRoZWY=;
	b=SInNEIxiE5oXJnmHInv8wpm2Bp3d1ZZo/MaV0RQOmXL/kuvX+eNwQ1J1Q3TB+q6WuCwG6e
	UYslUfWhDzBzLF311Q9iPaQkxh48RkdCFi1diBJeJimw27cnfF1UAuEttj3qiOPRjmAV8k
	DAn2FGCSe3ksWe2XXSVvWyV3HIP90bNdb2mhpSw3z5d7W4A8AZn08fmJDQfA0highfAqaL
	sbQwNqlGUhSiqwQKSNEW27YBuz44fWdf6AnCUfiPyVIB6tItozLcCFVh3Dw+DHoTYNprn0
	q5UYsOdQ3DtmcOtmDwNoPPZ2Z1mgfeD7xP2TYfiIP0pbzp+AMCE+Vq1xI3JLXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:17:47 +0200
Message-Id: <DJ5ECWT1RDTI.1242I56RX2AZ2@bootlin.com>
Subject: Re: [OE-core][PATCH 0/5] Implement SPDX for deploy tasks
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
In-Reply-To: <20260609222331.1293007-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 13:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238359

On Wed Jun 10, 2026 at 12:15 AM CEST, Joshua Watt via lists.openembedded.or=
g wrote:
> The SPDX use case for file system image has been well defined since SPDX
> was first implemented, however there has always been a desire to also
> express SPDX output for other non-image deliverables (primarily, those
> that have a do_deploy task or similar). These types of tasks cannot
> easily use the traditional method of having a separate SPDX task that
> runs to create their SPDX output as this causes lots of problems with
> the way dependencies are specified. Instead, it is desirable for these
> tasks to directly produce SPDX output that can be consumed by other
> tasks that depend on them.
>
> This patch series adds support for this. Any sstate task can now be
> added to the SPDX_DEPLOY_TASKS list and it will run a postfunc to
> generate SPDX output that describes what is being deployed. For
> classical do_deploy tasks, this is setup to be easy by automatically
> capturing all the deployed output files in the SPDX data, but other
> tasks can be added as well.
>
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
>
> Joshua Watt (5):

Hi Joshua,

Thanks for your series. I believe we are seeing both a new error and new
warnings because of it.


ERROR: grub-efi-2.14-r0 do_deploy_setscene: Recipe grub-efi is trying to in=
stall files into a shared area when those files already exist. The files an=
d the manifests listing them are:
  /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2-3=
2/deploy/grub-efi-do_deploy-deploy.spdx.json
    (matched in manifest-qemux86-grub-efi.deploy)
  /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2-3=
2/by-task/grub-efi:do_deploy.spdx.json
    (matched in manifest-qemux86-grub-efi.deploy)
  /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core2-3=
2/by-spdxid-hash/3c/3c29614c1a202bc0cc0a6f3dfd5b29235ea75ce5ee5bb0a847367bd=
8ce978004.spdx.json
    (matched in manifest-qemux86-grub-efi.deploy)
Please adjust the recipes so only one recipe provides a given file.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3852


WARNING: core-image-minimal-1.0-r0 do_create_deploy_sbom: The following SPD=
X IDs were unable to be resolved:
  http://spdxdocs.org/openembedded-alias/by-doc-hash/500473e510f927d1a990e9=
32c4942f978ce9da778692ab840dec17ad0ece09a1/pigz-native/UNIHASH/build/recipe

https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3852
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/3887
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/3874

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


