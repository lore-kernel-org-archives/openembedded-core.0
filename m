Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08139CD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 06:47:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2642.1780642033147329816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cAjG/Nwl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6DA24C5846E
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Jun 2026 06:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D69805FED1;
	Fri,  5 Jun 2026 06:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56A51106A1F2F;
	Fri,  5 Jun 2026 08:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780642030; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=39zQ4Aoxp5VJ2gRAa2+KNIJwf8z2+C/Lz8JigtUJsVI=;
	b=cAjG/Nwl4lra8Bcx+eDmymTcjXHqb9jYFwxVeZxgTAK0Nn3YAM9Z8+mFCP431iyh0wPUjQ
	Adkg/QbUqtiTk5yp29iQ0flwc6GReXKPwwV9i00q349dfEECkTr8rpMlq4b9w2oW4DEent
	JsxMqTTlztoB7iHFcR973Hz8hCiatoqEfo5t3T7eOR1GicIMjqKIK2uwQokWjObWWdgrp3
	lc879nQsQgtXdnfMYooXCSP4wtRJzhav8BlUbIfcaCp0/4b1GBYgMkAR6fGCKLpDqvz8lu
	/bxfJ0saz18hwfIJNJVd9dSeR/4jSEV/QPfGViG57a4zQDcQTWG2Q6vrpDBtgQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 08:47:08 +0200
Message-Id: <DJ0WX33YW3NU.1SJXTUGODRTOX@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rybczynska@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] oe-selftest: fitimage: support new
 schema for uboot configuration signing
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
 <20260603105453.25881-2-marta.rybczynska@ygreky.com>
In-Reply-To: <20260603105453.25881-2-marta.rybczynska@ygreky.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238142

On Wed Jun 3, 2026 at 12:54 PM CEST, Marta Rybczynska via lists.openembedde=
d.org wrote:
> From: Marta Rybczynska <rybczynska@gmail.com>
>
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

It looks like we still have some failing selftests:

2026-06-04 10:59:24,072 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_atf_tee_fit_image (subunit.RemotedTestCase)
2026-06-04 10:59:24,073 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of '/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-3150517/tmp/work/q=
emuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fitimag=
e.4036817' failed with exit code 1
...
| sha256,rsa2048:spl-oe-selftest-
|  error!
| Verification failed for '(null)' hash node in 'conf' config node
| Failed to verify required signature 'key-spl-cascaded-oe-selftest'
| Signature check bad (error 1)
| WARNING: exit code 1 from a shell command.
NOTE: recipe u-boot-1_2026.04-r0: task do_uboot_assemble_fitimage: Failed
...
2026-06-04 11:00:25,624 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_fit_image (subunit.RemotedTestCase)
2026-06-04 11:00:25,625 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of '/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-3150517/tmp/work/q=
emuarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fitimag=
e.4134657' failed with exit code 1
...
| Signature check bad (error 1)
| Verifying Hash Integrity for node 'conf'... sha256,rsa2048:spl-oe-selftes=
t+
| sha256,rsa2048:spl-oe-selftest-
|  error!
| Verification failed for '(null)' hash node in 'conf' config node
| Failed to verify required signature 'key-spl-cascaded-oe-selftest'
| WARNING: exit code 1 from a shell command.
NOTE: recipe u-boot-1_2026.04-r0: task do_uboot_assemble_fitimage: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4050
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3964
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3820

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


