Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC06F4BB93
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 10:34:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42587.1772015685899004882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 02:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=khIhSIYR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A23744E41118
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 10:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72A965FDE5;
	Wed, 25 Feb 2026 10:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3ED310369097;
	Wed, 25 Feb 2026 11:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772015683; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Foi6nXJYc7Lq9IqxFTf60qj1EfPS5UTyy7x7JnLPtaM=;
	b=khIhSIYROqL8IvqIqw8szCSXAedb7kBpGqvYIZGgIkWvmymt/sYs+bIj3zKlM/fL+jbbGb
	7IRndc1+LbDrHa63U2wpt23I/uo1B//A2r+/neCzzH8Tu4Q/LddOsdNu0vLYuwlRAjzTE2
	Nd+5hug2h8hqITuqLDNiQHTJE+Hc0hAzFrX4D0q0I1sC+e58/l2O7xs/3hpz4KA5qQM0bN
	7x9y4lhEutTD6HYUqEhbyJ6nHMmVchJsRGugYZMWQ0rKTNwBgrlN7m7hpxgk3MUbTNwkQz
	8SAQArvec8YWvPki1I8333kxCvKp0vYLnb/UlpYOIVbD2gG/Y5klR5jXzjH/mg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 11:34:41 +0100
Message-Id: <DGNZ4TTUX39Y.3K965DAB0AOLE@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 0/9] standalone wic
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260225074931.1661345-1-twoerner@gmail.com>
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 10:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231948

On Wed Feb 25, 2026 at 8:49 AM CET, Trevor Woerner via lists.openembedded.o=
rg wrote:
> This series of patches splits wic out from oe-core into its own=20
> standalone utility. The wic utility will continue to be under The Yocto
> Project umbrella, but will no longer be integrated into the project
> as part of oe-core. The ultimate goal is to make wic a completely
> independent tool, hosted on PyPI, with its own tests, development
> roadmap, and releases.
>
> Some benefits include:
> - relieving the oe-core maintainers from having to review wic patches
> - allow the tool to be used outside of The Yocto Project
> - provide more flexibility to explore other features, libraries,
>   mechanisms, etc=20
>
> These changes have been tested with oe-selftest as follows:
>         $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <=
my numeric group id> 4
>         $ oe-selftest -v -r wic=20
>
> Previously, I had two separate patch sets for wic on oe-core: one=20
> to create a standalone utility, and one to re-implement variable
> sector-size handling. Both these were combined to create a combined "v5"
> patch set.
>
> In v6 the major changes are:
> - code cleanups to remove cases of "if sector_size and sector_size =3D
>   512" in places where we can guarantee sector_size will exist
> - cleanups to replace "getattr(var, 'sector_size', 512) or 512" since
>   the 3rd arg to getattr() is already setting a default if the variable
>   name is not found
> - many comment and commit comment improvements
> - error out if extraopts includes options to set the sector-size in wks
>   files
> - patch 2 (add ufs class) was dropped
> - patches 3 and 4 were reversed (move/save wks files before removing the
>   rest of wic from oe-core)
>
> For the patch sets up to and including v5:
> For the standalone patch set:
> v1: an RFC patchset was sent out, split up into small patches for easy
>     review
> v2: add wic utility to list of native dependencies of
>     image_types_wic.bbclass
> v3: squash all commits together to apply atomically
> v4: (does not exist)
> v5: rebase on latest master
>     split commits back out acknowledging any bisection that lands
>     between them will fail
>     combine with sector-size patch
>
> For the sector-size patch:
> v1: initial patch set=20
> v2: add Mark as co-author of ufs class
>     try to fix a build warning when not using wic=20
> v3: actually fix warning when not using wic=20
> v4: deprecate, but allow, WIC_SECTOR_SIZE to continue to be used to set=
=20
>     the sector-size both from config files and the environment
>     warn when both are used, but prefer cmdline value
>     change partition type of sample wks to gpt=20
> v5: fix a bug where WIC_SECTOR_SIZE is not given anywhere
>     combine with standalone patch set=20
>
>
> Trevor Woerner (9):

Hi Trevor,

Thanks for the new version.

We have some test failure as the wic tool is not found in path. I
believe we already discussed that previously, but I'm not sure what was
the conclusion.

Poky - The Yocto Project testing distribution
Running '. ./init-build-env; wic create directdisk -e core-image-sato -o ${=
BUILDDIR}/tmp/deploy/wic_images/qemux86/directdisk/core-image-sato/' with o=
utput to /srv/pokybuild/yocto-worker/wic/build/build/command-1-cmds.log in =
/srv/pokybuild/yocto-worker/wic/build/build
/bin/bash: line 1: wic: command not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3190

I will let other tests finish, so we can have an overview of the
situation.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


