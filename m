Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEEBE8FDAC
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 16:37:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156036.1766767035113974970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Dec 2025 08:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JqLUcmPy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 05EE41A2461;
	Fri, 26 Dec 2025 16:37:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6E1C606E4;
	Fri, 26 Dec 2025 16:37:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFEDF103C8D10;
	Fri, 26 Dec 2025 17:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766767032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XQBXOBIv8HDmKsf8AFqzpzbCDzsqwH6GhJ6l6T8HXUI=;
	b=JqLUcmPyqdB3aZM4FLp012naOusrRGAiNjWayVzvtBi6kHv6U3UBQgaUttYUI45fPw8fKX
	gxRc07MlGftx8zN3uqbq4AZ347BtrKJGDhMd30IGl4Hm22xPXh953YzQt64EYiSaZto8JY
	LFtJ1YGYDci+ZnPgNvS2tpjpn33UfdpiPHWpQJpX6q/Sl94ciAeufEspznEKQbPofwIT6V
	oRjQbLy8o9Z448ZhtnSvvwCvS8kSG6ivxDnnAfr55tQZpJBHgvZTlcFQvz7CdkijLDZ/dD
	4CUSL+x3pP/pDprYWA/cZtZubc6yzq0w10ArEbrg6mFWlOJj4qQdMXBXi44nEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Dec 2025 17:37:06 +0100
Message-Id: <DF8AN2WTCZLA.1VLMF7YHDLPPO@bootlin.com>
Subject: Re: [oe-core][PATCHv13 1/6] emptty: add version 0.15.0
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
 <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251223220114.2259233-1-rs@ti.com>
 <20251223220114.2259233-2-rs@ti.com>
In-Reply-To: <20251223220114.2259233-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 16:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228549

On Tue Dec 23, 2025 at 11:01 PM CET, rs wrote:
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

Thanks for your patch, it got way better.

It looks like the last error is some reproducibility issues:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-conf-dbg_1.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-conf-dev_1.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-conf_1.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-dbg_0.15.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-dev_0.15.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-doc_0.15.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty-src_0.15.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/emptty_0.15.0-r0_amd64.deb

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3100

Diffoscope output can be found here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20251226-g95kquv4/=
packages/diff-html/

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


