Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C241CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:45:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.10999.1760517893796323679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=diCcOXaH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A2E04E410C4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71186606F9;
	Wed, 15 Oct 2025 08:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A111102F22AF;
	Wed, 15 Oct 2025 10:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760517891; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ua+9cEywIOmkAjcJsudN0l9TNc5gNXoNcgmSdm/hp08=;
	b=diCcOXaHtaV9czG3jWCOXLmx4wZ/OOdGxjwGK/EGYZsFxTUUh50TXp+ttHrllUtl7UCUJ2
	Qh33vcuu4E6VDAO56tzcrQf0o2hVNtU439hM45/LzcqfOQhB89O5isX8jRPO82dwHnp22H
	WUeb7Olmu5RrU2ZvkcGF4947UU641GCoOypFYI5uChDCyAM3TFxaOBIBA1JvFzBonPTwMh
	3luC8RKNew43F2YWOMv8vFsT9THNusFpS9ROR2SM0C1CMjCheU+1K3LtL/rFYtrjFhRo1K
	nxyxuC58Z9YGNWtex/1C66UNnCJ8IgegfzWZ/FvJfKtQ7Lb8rl28PTz0/iF9/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 10:44:42 +0200
Message-Id: <DDIRI660AS9R.2FK1M3YUMCMTD@bootlin.com>
Subject: Re: [OE-core][PATCH 2/2] systemd: upgrade from 257.8 to 258
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251014121513.2606389-1-Qi.Chen@windriver.com>
 <20251014121513.2606389-2-Qi.Chen@windriver.com>
In-Reply-To: <20251014121513.2606389-2-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224884

On Tue Oct 14, 2025 at 2:15 PM CEST, Chen Qi via lists.openembedded.org wro=
te:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> 258 Release Changes:
> https://github.com/systemd/systemd/releases/tag/v258
>
> The 'runlevel', 'initctl', 'telinit' related contents are removed
> because they are offically removed in v258.
>
> Disable tests explicitly. This is because we're not installing any
> tests. There's no point building them out. And this puts extra burden
> on making things compile for musl.
>
> musl changes:
> 1. The -D__UAPI_DEF_ETHHDR=3D0 is removed from TARGET_CC_ARCH.
>    The __UAIP_DEF_ETHHDR is defined as 0 in netinet/if_ether.h in
>    musl. There's no need to explicitly define it in compiler
>    commandline. And such explicit definition will break the logic
>    of the header files in systemd, resulting in extra patches.
> 2. All patches are re-evaluated.
>    This version of systemd introduces big changes in header
>    files and other places. So the previous musl patches are
>    re-evaluated one by one. Those that are dropped are considered not
>    needed. A few new ones are added. There are some notable ones.
>    0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>    there is not runtime error.
>    0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>    added because this version of systemd uses strv_free to free gl_pathv
>    instead of relying on globfree provided by libc.
> 3. The 'struct ethhdr' re-definition error is solved in musl recipe.
>    If musl upstream does not accept the patches, we'll need to use
>    previous method and change quite a few files.
>    https://www.openwall.com/lists/musl/2025/09/30/1
>    https://www.openwall.com/lists/musl/2025/09/30/2
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

I saw your message saying this is not ready to merge, but I already had
this in testing and got some warnings:

WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: Group clock has never be=
en defined

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2560

They do appear while building with poky-altcfg distro, for all machines
and probably all images. It was confirmed here with core-image-minimal.

Can you investigate this before your next iteration?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


