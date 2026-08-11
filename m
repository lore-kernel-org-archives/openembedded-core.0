Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEC6C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 18:48:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61495.1786474126100886609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 11:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IkI+s291;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C78931A1577
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 18:48:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 876A36033C;
	Tue, 11 Aug 2026 18:48:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E11D911C4C0FB;
	Tue, 11 Aug 2026 20:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786474119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=es8s8oi8r0hnSVZrSAbaNkXv2pdFLLa5/eXleqlpveM=;
	b=IkI+s291M/5h0koH0aheKqs7+RzH25dvCbpGNqRp/v+SleuUVZuyJgdGKCtA7wSabEMu/4
	qWpLyOoMr28qW9fv78uBHImIfRZtnH4oUTzrZ4pLgb6tduk7mpDrlTn/n+BziKK1Huo8mg
	EAP2s1uoCcj524HWmTGGxjsu3hJ+8wjDCDCWVDJMZmp3IBLUCiA5kEIPmqDGaB/zAuqQUi
	VZ8E+H9j0vEFHmZAkdFPheZ8fJvWfZ6UJz6Kn0js3wCiN+ceRkzV+1iGM7QFi5COrg3hCZ
	Ou2Cat7xytpmcoOc/yZ4OsYqVQ90KmwkayRhl57dRmDwvdfo0q8apbOXCbS6rQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 20:48:37 +0200
Message-Id: <DKMC7ZM6NDM7.3U64VA8LP2GYM@bootlin.com>
Cc: <twoerner@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] gptfdisk: remove recipe
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260811153619.2048639-1-ross.burton@arm.com>
 <20260811153619.2048639-2-ross.burton@arm.com>
In-Reply-To: <20260811153619.2048639-2-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 18:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243220

On Tue Aug 11, 2026 at 5:36 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> There are no dependencies on this recipe in oe-core or meta-oe now, as
> the standard fdisk command in util-linux has both a scriptable frontend
> and supports GPT partition tables.
>
> Also the last release was in 2024 and there's very little activity
> upstream.
>
> As such, remove the recipe.
>

And break the build :)

Looks like we do have a dependency on gptfdisk-native. Maybe this match
in meta-yocto?

meta-yocto-bsp/conf/machine/include/genericx86-common.inc:do_image_wic[depe=
nds] +=3D "gptfdisk-native:do_populate_sysroot"

Here is the error:
ERROR: Nothing PROVIDES 'gptfdisk-native'. Close matches:
  gperf-native
  gtk+3-native
  gtk4-native
ERROR: Nothing RPROVIDES 'core-image-sato'
No eligible RPROVIDERs exist for 'core-image-sato'
NOTE: Runtime target 'core-image-sato' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-sato']
ERROR: Nothing RPROVIDES 'core-image-sato-sdk'
No eligible RPROVIDERs exist for 'core-image-sato-sdk'
NOTE: Runtime target 'core-image-sato-sdk' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-sato-sdk']
ERROR: Nothing RPROVIDES 'core-image-minimal'
No eligible RPROVIDERs exist for 'core-image-minimal'
NOTE: Runtime target 'core-image-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-minimal']
ERROR: Nothing RPROVIDES 'core-image-full-cmdline'
No eligible RPROVIDERs exist for 'core-image-full-cmdline'
NOTE: Runtime target 'core-image-full-cmdline' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-full-cmdline']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4388
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4362
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/4336
...

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


