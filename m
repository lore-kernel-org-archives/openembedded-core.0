Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8168CCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:00:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6048.1762610437274524138
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IlznLX+Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A4F54E415C5
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 14:00:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7BF660710;
	Sat,  8 Nov 2025 14:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CA9611852F5C;
	Sat,  8 Nov 2025 15:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762610434; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=brXLXvcLHCRchQTsJ4/QiPwEwF7dfbN6mtXYGgWp18I=;
	b=IlznLX+QCnoeVjNpeHujPHxiXnxF+P6qOl7lib2WUAX3alPDZiZ2ZPrpRyrGQe0tEDVVO6
	OraWSuqvqZpCy3dZ319I+B1SjCRhSlc2aTKd9zAQs1MeO6OnLOhT/F7WcVChfoNtcpqIpm
	+Ae9NsYtfXb/v9C07OXPbHlO6sQMD/v1c49ICXEYEtb6P2l6fHgEHgDUkoAuJ0RygpSSwm
	VDtxExkIAnCKHfcpZyrMt2x/oKQQJ4Qip4yru6CfxSCliH/jwiSpx6gd/jFNTHSQjiW1/J
	RVVJKmElhcVkWs1jMmobv9iLEamQGAlPwjeEnoJiJmNCWH7bOWQPDV2joPcFEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 15:00:31 +0100
Message-Id: <DE3D91UDJETW.1GCQINSH3TU1E@bootlin.com>
Subject: Re: [OE-core] [PATCH] bash-completion.bbclass: put bash-completion
 package to PACKAGE_BEFORE_PN
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251108113710.23299-1-liu.ming50@gmail.com>
In-Reply-To: <20251108113710.23299-1-liu.ming50@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 14:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226080

On Sat Nov 8, 2025 at 12:37 PM CET, Ming Liu via lists.openembedded.org wro=
te:
> It was observed when FILES:${PN} contains "${sysconfdir}" or
> "${datadir}", the bash-completion files wont be installed to
> bash-completion package.
>
> Fix it by putting bash-completion package to PACKAGE_BEFORE_PN, this
> ensures bash-completion package get the files packaged before PN.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---

Hi Ming,

Thanks for your patch.

It looks like this is breaking some builds:

ERROR: iproute2-6.17.0-r0 do_package: QA Issue: iproute2: Files/directories=
 were installed but not shipped in any package:
  /usr/share
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/tc
  /usr/share/bash-completion/completions/devlink
...
ERROR: systemd-1_258.1-r0 do_package: QA Issue: systemd: Files/directories =
were installed but not shipped in any package:
  /usr/share/bash-completion/completions/userdbctl
  /usr/share/bash-completion/completions/systemd-id128
  /usr/share/bash-completion/completions/bootctl
  /usr/share/bash-completion/completions/systemd-run
  /usr/share/bash-completion/completions/localectl
  /usr/share/bash-completion/completions/journalctl
  /usr/share/bash-completion/completions/systemd-cgtop
  /usr/share/bash-completion/completions/systemd-nspawn
  /usr/share/bash-completion/completions/systemd-creds
  /usr/share/bash-completion/completions/systemctl
  /usr/share/bash-completion/completions/systemd-dissect
  /usr/share/bash-completion/completions/resolvectl
  /usr/share/bash-completion/completions/machinectl
  /usr/share/bash-completion/completions/systemd-delta
  /usr/share/bash-completion/completions/systemd-path
  /usr/share/bash-completion/completions/systemd-analyze
  /usr/share/bash-completion/completions/loginctl
  /usr/share/bash-completion/completions/busctl
  /usr/share/bash-completion/completions/networkctl
  /usr/share/bash-completion/completions/hostnamectl
  /usr/share/bash-completion/completions/systemd-cgls
  /usr/share/bash-completion/completions/kernel-install
  /usr/share/bash-completion/completions/systemd-cat
  /usr/share/bash-completion/completions/systemd-vpick
  /usr/share/bash-completion/completions/timedatectl
  /usr/share/bash-completion/completions/systemd-resolve
  /usr/share/bash-completion/completions/systemd-detect-virt
  /usr/share/bash-completion/completions/run0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2669
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2667
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/2687
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2679
https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/2722
https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/2684

Can you fix this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


