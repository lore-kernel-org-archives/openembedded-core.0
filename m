Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16813EE36A7
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:45:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49635.1770914720539632970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lzOZ+fEN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B900C23DA6;
	Thu, 12 Feb 2026 16:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B05FC606B8;
	Thu, 12 Feb 2026 16:45:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38B3F1036888C;
	Thu, 12 Feb 2026 17:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770914716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cFjMpaxSRkI4Zl6ER6cyzAnpQf9pLoOLoh+exv6vyM8=;
	b=lzOZ+fENVah4csmcm5XKWpaAmruLivsO4lK0NSFSyQ38E5JaTY1sNqw+oupQZLJBjAWG3e
	0HPLzRMAKMjNTmSM2vAimzBk/o+ZFuzw5mn8Ss8xS868mlDihByKY/fqyYNZz6rQh8top9
	Z/VvHpZ8sYIak5WYAtZ0krJomrLGxxXVrkROSC5Fbg4wOK7Vvnr1SM1mrWmlAxxhOp1lUR
	h1Jm8Mr+9OJRGmWWDWyn7eZ1xMwSWC4f6upMDcRIz4gggGg2h0CpKUM7Hbt2qXbKPt6dha
	tHdYAsFgBNcPnBzL4p5ozqR6BcP6DjwF5+MrRPi3ZGK+uBA1HpoQUNkjfOHVtA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 17:45:10 +0100
Message-Id: <DGD4VEZTM65I.2V08DA6RR8L95@bootlin.com>
Subject: Re: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
 <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260203012028.4008229-1-rs@ti.com>
 <20260203012028.4008229-2-rs@ti.com>
In-Reply-To: <20260203012028.4008229-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231047

On Tue Feb 3, 2026 at 2:20 AM CET, Randolph Sapp via lists.openembedded.org=
 wrote:
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

This patch has been in my branch for a week now, but we are seeing some
intermittent reproducibility issues.

I opened a bugzilla entry by error, as for a second I thought this patch
was merged, so details can be found here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16171

Diffoscope output is here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260212-ssslvz6_/=
packages/diff-html/

Can you have a look at what is going wrong please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


