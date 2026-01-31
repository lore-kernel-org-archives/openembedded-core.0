Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71696D7976C
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 13:26:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8800.1769865994699923429
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 05:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k2PhEIl9;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10A14C22F7C;
	Sat, 31 Jan 2026 13:26:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0862606B6;
	Sat, 31 Jan 2026 13:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3B23119A8886;
	Sat, 31 Jan 2026 14:26:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769865991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eKAUKwkQw2P7KYe0gaxENsJCf+W5A39PhKfnwnvm1b4=;
	b=k2PhEIl9YqZL18oia6NTj1fKx9MJ6kXod1TFT1nlXhruRUACCIItqnBucxoJzRP5/ie1+2
	9vW9zMNC9Fu8buWMbNqA1WnbTc8ST7XLyD5YdAB83Yn0y3pcCHxjCgoLZWkYL0W+0MgcLU
	scvvVW7QyxpPLc3FoP6rcbRqRUnYY240v36ZY4zM09u4hRfbOvgGFd6bQa/DBUhG0DBu10
	rzR54tsHWW6NCD2c3t+h6FnYfo1JqYeVfzof9a/5LyIkQYn/D9IeIkO5LjFKGqUfjqo00/
	YIL2HI5WhYYJBfeYipwabL1mWt5l7i0dYUqxDxyu/Xa4O+QDxDOjDesQpuVSdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:26:22 +0100
Message-Id: <DG2T4NX8CGKB.2DLS05SJU3QVB@bootlin.com>
Subject: Re: [oe-core][PATCHv14 1/6] emptty: add version 0.15.0
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
 <a-christidis@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
 <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260129230210.2934333-1-rs@ti.com>
 <20260129230210.2934333-2-rs@ti.com>
In-Reply-To: <20260129230210.2934333-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 13:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230236

On Fri Jan 30, 2026 at 12:02 AM CET, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
> relatively lightweight display manager that supports x11 as well as
> wayland through both a CLI and an automatic login mechanism.
>
> This can effectively replace the custom init scripts for both x11
> (xserver-nodm-init) and wayland (weston-init) with a single tool with
> more verbose logging capabilities.
>
> This is split into two recipes. The emptty package provides the binary
> and various agnostic configs while the emptty-conf package provides the
> default configuration for the application itself. This RPROVIDES
> virtual-emptty-conf, allowing other recipes to provide their own
> configurations to override the default behavior.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

Thanks for the new version.

It looks like add_emptty_inittab is failing in some configurations:

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Execution of '/srv/pokybui=
ld/yocto-worker/qemux86-alt/build/build/tmp/work/qemux86-poky-linux/core-im=
age-full-cmdline/1.0/temp/run.add_emptty_inittab.2108438' failed with exit =
code 1
...
| NOTE: Executing add_emptty_inittab ...
| DEBUG: Executing shell function add_emptty_inittab
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function do_rootfs finished
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Failed

I don't see more context in the log, sorry.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/3088
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3103
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3143
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3115
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/3106
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/3095
https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/3113
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/3077
...

Interestingly it's failing on a lot of builds but not all. I was not
able to identify what's the pattern so far, but you can have a look at
the whole a-full build. I will let it finish so maybe it will provide a
better overview of the situation.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3153

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


