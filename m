Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D43C531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 07:34:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35690.1784964877608659328
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 00:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lrOSZX7u;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38E8B4E40F46;
	Sat, 25 Jul 2026 07:34:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E446160398;
	Sat, 25 Jul 2026 07:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B378711C10070;
	Sat, 25 Jul 2026 09:34:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784964873; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MRm5VpskYR+c5lTdgZZeG5I0g/P3mppmvHHcIevY+IA=;
	b=lrOSZX7uRJIBDSXUjzHLqi5hoJVlsn54T3ON8NyqJdrqppKEoqjBimzkfBt/U9ZPf9Bgv3
	nUbz2/TwAP01azRJgbprOkShQmVLdKfkYJr95w8BmmdI4A3fuX+gIkgGyBv7bTxIq3fmaY
	wO1nbIqtPPtey6cI5LyuPFI6TLrif1NoiMCUe4eDZwEo4+nfuztPMMS0PzxaV9b3WpGiX1
	ETZ473/P3yKKcVMdrLnV7UenXC5cGMVKe+XiXokGp0ZmOJ158K1Ae5NTGekf29HiUSjIAs
	mwXemKLKz3LIxVeU0Zzrj8aRsQdv5QzqUA5tevuLD8Hbg0nTagkhEqyGatZZGQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 09:34:29 +0200
Message-Id: <DK7H8L0W9TKT.2W8J7GXRP2R7K@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joerg.sommer@navimatix.de>, <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
In-Reply-To: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241966

On Fri Jul 24, 2026 at 11:00 AM CEST, J=C3=B6rg Sommer via lists.openembedd=
ed.org wrote:
> From: Randolph Sapp <rs@ti.com>
>
> The split of bin and sbin became more artificial over time, and it is no
> longer clear why programmes goes into the one or the other directory; e.g=
.
> forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
> learned to operate on files to create images long ago.
>
> Because systemd drives this movement to have only /usr/bin and symlink /b=
in,
> /sbin and /usr/sbin to there, the usrmerge feature (started by systemd to=
o)
> should be extended to include the binmerge. For a system with split bin/s=
bin
> `systemctl status` reports the system as tainted for *unmerged-bin.*
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
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>

Hi J=C3=B6rg,

Thanks for your patch.

It looks like this is failing to build with poky-altcfg on various
recipes:

ERROR: tcf-agent-1.11.0-r0 do_package: QA Issue: tcf-agent: Files/directori=
es were installed but not shipped in any package:
  /usr/sbin/tcf-client
  /usr/sbin/tcf-agent
...
ERROR: bootchart2-0.14.9-r0 do_package: QA Issue: bootchart2: Files/directo=
ries were installed but not shipped in any package:
  /usr/sbin
  /usr/sbin/bootchartd

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4214
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/4176
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/4146
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4215

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


