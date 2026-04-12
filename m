Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88047E64001
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 09:13:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.233493.1775985191347079086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 02:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=to2oE+/5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38CCC4E42938;
	Sun, 12 Apr 2026 09:13:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFDB05FFB9;
	Sun, 12 Apr 2026 09:13:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B2CF10450082;
	Sun, 12 Apr 2026 11:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775985188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wsxtNJmdr0oWwzSjobJ19q3soXTt+z7OILHDLenkCX8=;
	b=to2oE+/5zWYdyZmHIvH9569ezfbP6Xeg5qL43tyNY1HHob/U2uTjqjYPC6eRXEgyuwWL2t
	Nv7Ulxc9reCosheNPnFQwkUK9TL7g1r9VXAhy9PD82qQozDxgqyfnrLNiDAlg8auPyED4u
	LLZjZrnXG79Pj9S2sy4hyf85vJJOM9+2Rcfi9TUxF+dqsjp4gNAHPy0ojj2UaErtbJmviy
	f6ZRgtbh24FUj53e3K69vlDYn39cWt3yGc9iz/xl+2BnYt7FkO+wWFYZ+rhunXLba/qV3e
	Q4iJ6YIkdc6RejCteI/LZL2fxGppFfApt+ZYuJ3MdVOi1v6hvxjuSYS8S1SueQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Apr 2026 11:13:00 +0200
Message-Id: <DHR27COITUU6.25MJ47LYD813Y@bootlin.com>
Subject: Re: [oe-core][PATCHv2] systemd: fix unmerged-bin tainted message
Cc: <openembedded-core@lists.openembedded.org>,
 <peter.kjellerstedt@axis.com>, <joerg.sommer@navimatix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260410182747.1646597-2-rs@ti.com>
In-Reply-To: <20260410182747.1646597-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 09:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235056

On Fri Apr 10, 2026 at 8:27 PM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
> the case it reports that the system is tainted in systemctl status.
>
> Add a link from /usr/sbin to /usr/bin to prevent anything from being
> excluded from the merged bin directory. This mimics the current merged
> bin directory structure of Arch Linux [1].
>
> Update the systemd recipe to prevent creating a duplicate link when
> sbinmerge is enabled.
>
> Override most sbin variables to point to their bin equivalent when
> usermerge is enabled, with the exception being base_sbindir_native and
> sbindir_native. There is no guarantee the host machine is using this
> filesystem scheme.
>
> This check was added to systemd back in 2024 [2].
>
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/=
-/blob/main/PKGBUILD
> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e4a6aa6d9f0d
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

Thanks for your patch. This triggering some issues because of missing
folders.

J=C3=B6rg suggested a fix for net-tools, but we have other failures, at lea=
st
one with tcf-agent:

ERROR: tcf-agent-1.9.0-r0 do_package: QA Issue: tcf-agent: Files/directorie=
s were installed but not shipped in any package:
  /usr/sbin/tcf-client
  /usr/sbin/tcf-agent
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
tcf-agent: 2 installed and not shipped files. [installed-vs-shipped]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/3574
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3557

Can you have a look at the issue?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


