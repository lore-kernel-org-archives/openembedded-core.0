Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5964E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 17:53:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.263.1771437230305872851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 09:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MiE5WRjW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C79724E402B3
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:53:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87F745FA23;
	Wed, 18 Feb 2026 17:53:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FB2C10368097;
	Wed, 18 Feb 2026 18:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771437228; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XnQW+Yk+INAriBPISgvYS0kdAAgzINbYj4pi426qPJE=;
	b=MiE5WRjWahPRQGO2+q0ZZoHDDzecEusSle72h5gjn2qE8F0j8WornN4OEjQCnc1v4/T4bK
	UQVLKcaqDyeHzoaqRlENaO7wyYhqZIVEC2OuysoR1QPepgM7cK+6BYdIssEJEaJmdVk+vX
	9bmqb+mnWUNoCBPmt+7c7lJZLZ6S4YPDstHnuQSJCgSJjTWDRVHvbjCZwqn9qcn8TKX6S/
	vx6wTuFLPjO2AU3iRDhiba2dJk2L5w5qZm8UbhHCosHDgMutQujapxogEqoFCqmrsdriJX
	1K9MPS6vSccnR6XTisXN60a3A5Y2yv0Es+XNWtbtZkwtV86UzaorZ7R0zw81aA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 18:53:44 +0100
Message-Id: <DGIA36GNR4J5.1T52ZELIA28Y9@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: remove dependency on
 initramfs when not bundled
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260217173225.101935-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260217173225.101935-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231315

On Tue Feb 17, 2026 at 6:32 PM CET, Adrian Freihofer via lists.openembedded=
.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Previously, the kernel recipe depended on the initramfs image even when
> INITRAMFS_IMAGE_BUNDLE was not enabled. This caused the kernel to be
> rebuilt whenever the initramfs image changed, regardless of whether the
> kernel actually included the initramfs.
>
> The problematic chain was:
>   linux:do_deploy ->
>   linux:do_bundle_initramfs ->
>   image-initramfs:do_image_complete
>
> The original intent (acc. to the comment) was to ensure the initramfs
> image was available for tools like wic. However, apart from bundling the
> initramfs in the kernel, there is probably no reason why the kernel
> should depend on the initramfs. And it is therefore simply wrong if it
> does so anyway. Thus, use cases that may be broken by these change are
> based on a bug, not a feature. This needs to be fixed by adding a
> dependency on the initramfs in the right place, not in the kernel where
> this destroys the kernel's sstate-caching.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---

Hi Adrian,

It looks like this is causing some build issues. I only saw them on
ARM64 so far:

ERROR: core-image-full-cmdline-1.0-r0 do_image_wic: Execution of '/srv/poky=
build/yocto-worker/genericarm64-alt/build/build/tmp/work/genericarm64-poky-=
linux/core-image-full-cmdline/1.0/temp/run.do_image_wic.2336354' failed wit=
h exit code 1
...
| INFO: Creating image(s)...
...
| ERROR: _exec_cmd: cp -v -p /srv/pokybuild/yocto-worker/genericarm64-alt/b=
uild/build/tmp/deploy/images/genericarm64/core-image-initramfs-boot-generic=
arm64.cpio.gz /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/=
work/genericarm64-poky-linux/core-image-full-cmdline/1.0/tmp-wic/hdd/boot r=
eturned '1' instead of 0
| output: cp: cannot stat '/srv/pokybuild/yocto-worker/genericarm64-alt/bui=
ld/build/tmp/deploy/images/genericarm64/core-image-initramfs-boot-genericar=
m64.cpio.gz': No such file or directory
|

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3228
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3202

Can you have a look at what is going wrong?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


