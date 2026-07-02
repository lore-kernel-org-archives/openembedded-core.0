Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ADFC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 07:51:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64052.1782978701670202890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 00:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sRw+yiMR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D8B61A0DD5
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 07:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF52D5FF03;
	Thu,  2 Jul 2026 07:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C318A104C96A5;
	Thu,  2 Jul 2026 09:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782978698; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=70SFw9LCf76N7aY6ZRgZRu+HGnggH9i1VWNC8B8LL0E=;
	b=sRw+yiMRy0i6rst4tk76Ccev5Frp9ZuGpdoXIP3xhWSTZFrM8+gwRa+8mZB0Y0jB425Bhh
	Pf5HmFBq8lSWylwT35t1PgnDOacESU/Y4u+BtwgR2NoPjfipq/cZC3uSBtxc2GoAArfPOE
	JETqHpe3XHeOSvfIyClQNs5svaaiACsam7ARTC0nEMfd8AO2wDd2vLw0lOCCTTMqzih1V0
	YZDfgqVTqs0w94zK4bMS/poH1TDH1QymZ6llbZLJPSHJ32YwNcGywRsYzFO88XL2Ro4OPA
	PYQ8vGxiENe5waqtzFv4iOxpjZvo8KwnxFpONH6uNXoceiXHyl39+yakw+FSAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 09:51:36 +0200
Message-Id: <DJNX75KATLKJ.1QVN3N27RRPW9@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4 00/10] Implement SPDX for deploy tasks
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 07:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240022

On Tue Jun 30, 2026 at 11:01 PM CEST, Joshua Watt via lists.openembedded.or=
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
> This patch series adds support for this. Any sstate task that starts
> with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> will run a postfunc to generate SPDX output that describes what is being
> deployed. For classical do_deploy tasks, this is setup to be easy by
> automatically capturing all the deployed output files in the SPDX data,
> but other tasks can be added as well.
>
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
>
> V2: Fixed SPDX documents missing at SBoM creation time when the
> documents were not a direct dependency of the SBoM, and were present in
> a sstate object. Previously, these sstate objects were not restored
> because they were "covered" by the later sstate tasks, but now they are
> restored if they are depended on by a task that creates SPDX output.
>
> V3: Fixed a bug where dependencies that are not in the taskhash could be
> missing when the final SBoM is created and added tests.
>
> V4: Fixed some testing errors that revealed that EFI providers have to
> be MACHINE_ARCH (and consequently, wic-tools)
>

Hi Joshua,

Thanks for the new version. We now have just one warning remaining:

WARNING: core-image-full-cmdline-1.0-r0 do_create_image_sbom_spdx: The foll=
owing SPDX IDs were unable to be resolved:
  http://spdxdocs.org/openembedded-alias/by-doc-hash/6e0461f8d0ebcd6cab741f=
f4175cb1256279c1657d809f71c257fb2a0991e7ca/eudev/UNIHASH/package/eudev
...
WARNING: core-image-sato-1.0-r0 do_create_image_sbom_spdx: The following SP=
DX IDs were unable to be resolved:
  http://spdxdocs.org/openembedded-alias/by-doc-hash/6e0461f8d0ebcd6cab741f=
f4175cb1256279c1657d809f71c257fb2a0991e7ca/eudev/UNIHASH/package/eudev

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4059

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


