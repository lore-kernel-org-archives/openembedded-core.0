Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71633CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 16:15:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.81809.1756829729533625276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 09:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wShj4uw8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E96651A08E0;
	Tue,  2 Sep 2025 16:15:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B91AF60695;
	Tue,  2 Sep 2025 16:15:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7B981C22CFC4;
	Tue,  2 Sep 2025 18:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756829727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bJKvMSw+csTLpInhxc7stjs+j8/k4IQDtc1mxPs+cbE=;
	b=wShj4uw8+AvME8pVwxB5yOEZUc1WwGoHEa2NCQ/2DUKIjByg2RxAuNYEg2c3Xe+G3rndwz
	hPXlXoVJTGx0RNcd8/BOxrS4bw9Wduz3k43q+yuutTvkRYZTPUmIBPvXmfMbDqMnkZKOtw
	dFyIejG5Pa53YRceq9CeokSIS51wCF2g5VopaHNotTitnNo1sSakz7eX7x4fMxgcJNqblq
	7UY9MEukkoxo8liBZpAP2to2MdZEbkHAJG1ur8c0GdZ8gj4qshO161PxsX1txnmxJ1roFu
	ZtGJu0xNj09Ua4DXLomSyde6erlMwDAakHammj0TtE1PeiQrakTnsLE4uYwvaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 18:15:22 +0200
Message-Id: <DCIG5SL7J2MV.1DUWUG4I45M4O@bootlin.com>
Subject: Re: [OE-core] [PATCH v4 1/2] wic: add --extra-partition-space
 option to set unused space
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250902075901.1550357-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250902075901.1550357-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 16:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222741

On Tue Sep 2, 2025 at 9:59 AM CEST, pierre-loup.gosse via lists.openembedde=
d.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> By default, the content of the partition is filled by the filesystem
> without leaving any unused free space. The --extra-space flag adds
> extra space to the filesystem size, not to the partition.
>
> Unused free space after the filesystem can be useful for some cases,
> such as encrypting a partition at runtime.
> With --extra-partition-space 32M, we ensure that the last 32M of the
> partition is unused: this space does not contain filesystem data and
> can store the LUKS2 header.
>
> The implementation sets a difference between the partition and
> filesystem size:
>   - With --fixed-size, the extra part space is removed from the
>     filesystem size.
>   - Otherwise (with or without --size flag), the extra part space is
>     added to the partition size.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Hi Pierre-Loup,

It looks like we have a build issue in some conditions:

ERROR: core-image-full-cmdline-1.0-r0 do_image_wic: Execution of '/srv/poky=
build/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-ima=
ge-full-cmdline/1.0/temp/run.do_image_wic.3936615' failed with exit code 1
...
| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
...
| Traceback (most recent call last):
...
|   File "/srv/pokybuild/yocto-worker/qemux86/build/scripts/lib/wic/ksparse=
r.py", line 284, in _parse
|     if not parsed.extra_space:
|            ^^^^^^^^^^^^^^^^^^
| AttributeError: 'Namespace' object has no attribute 'extra_space'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2293

Can you have a look at the issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


