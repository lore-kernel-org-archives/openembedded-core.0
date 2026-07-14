Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC05C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:50:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8851.1784033399246632471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 05:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ofgtyaly;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01C891A0FC9
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:49:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDA2B60346;
	Tue, 14 Jul 2026 12:49:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A91011BD1B55;
	Tue, 14 Jul 2026 14:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784033396; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nEgqbyD2fQIXgWiX6aIMAJRRxfXRiqsInAocGaNsd08=;
	b=ofgtyalyO2eWwzOf7O/7hD6vOn0aor90awOoc+ZraiRyWMiJT9NkL6K97ho2/27Slk7Zga
	4kcVFBObxWKX89VqD97bZKKVnP8KExBC5jTuDuQcYly9eQBVOWBSx1GRUfyKDadXlaQFqC
	g4TZwigVW6p0Fp7nAnygrg6YoWcV91J7/xi/cDgJv+VIe7p8W4xFh32XSRFz4/blAAkPM+
	+ekwr8ttQXUsEi/VHEo2bzjlP0lf7eEm5oE7QBo6gkrQ9HOBAB4OlipRGsfZAR4g4/dL5m
	ejLIXlCC+2lNU7WjAD6GYpjrte0iUVJ0f4BA1dTiEq96ZPLzWpWxlewlvhFxDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 14:49:54 +0200
Message-Id: <DJYB230VVFGI.3OG933GRJ4M1D@bootlin.com>
Subject: Re: [OE-core] [PATCH] memory-control: add recipe and bbclass for
 cgroup v2 memory limiting
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Ishaan.Desai@ibm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713185154.4171585-1-Ishaan.Desai@ibm.com>
In-Reply-To: <20260713185154.4171585-1-Ishaan.Desai@ibm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240883

On Mon Jul 13, 2026 at 8:51 PM CEST, Ishaan Desai via lists.openembedded.or=
g wrote:
> Adds a CLI tool and bbclass for applying per-service memory limits via
> systemd resource control and Linux cgroups v2.
>
> The memory-control command inspects MemoryMax and MemoryHigh settings
> for any running systemd service and lists all services with a drop-in
> applied.
>
> memory-control.bbclass allows any recipe to set a memory limit at build
> time by inheriting the class and setting MEMORY_LIMIT. Two OOM policies
> are available via MEMORY_OOM_POLICY: "reboot" (default) reboots on OOM,
> and "kill" terminates only the offending process.
>
> The recipe requires the systemd DISTRO_FEATURE via features_check so it
> is cleanly skipped on non-systemd distros. The bbclass guards its
> RDEPENDS injection with bb.utils.contains for the same reason.
>
> AI-Generated: Uses IBM Bob
>
> Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>

Hi Ishaan,

Thanks for your patch.

We get a warning about this new recipe during the build:

WARNING: lib32-memory-control-1.0-r0 do_unpack: lib32-memory-control: the d=
irectory ${UNPACKDIR}/${BP} (/srv/pokybuild/yocto-worker/qemux86-world-alt/=
build/build/tmp/work/x86-pokymllib32-linux/lib32-memory-control/1.0/sources=
/memory-control-1.0) pointed to by the S variable doesn't exist - please se=
t S within the recipe to point to where the source has been unpacked to

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3970
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4125

Can you make sure everything is correct?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


