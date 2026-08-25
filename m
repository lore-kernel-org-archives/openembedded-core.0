Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE76C61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 07:34:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16665.1787643239460562183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 00:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xdyluie7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2851D4E4138B;
	Tue, 25 Aug 2026 07:33:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E429C604C4;
	Tue, 25 Aug 2026 07:33:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B61E11C79FD5;
	Tue, 25 Aug 2026 09:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787643232; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DQpHqwfZU/Fz6MLEp+bWe77N/ZMxRjGXTHT4qpS4njk=;
	b=xdyluie73dPqkF0SAKhE/nnRa5RjG8aYyQeDemEDFmw0F04WT4HX6Bg5cpyelmeuUuKwWY
	OKjkKp/AUWOoCotT40HdsS7s0dXIh/mpORW/uBQ/MT/PCQ0WnSQEyVEWjyaSXQSpKH2Ahr
	q2TI/AkON4xPAEiAfADsEI4XAg7ZUX0+R+32RWpGPw5JmF2CsxrPTetf5CJ0zZQs6jZmpI
	OgUCT+OVQp3E8AeYkcUQMmVa77dvyaApJZuRsTXHTG4p2Oe9M42N0Ge6uH920vBNaO64sH
	Nr2Gw0aQnfv5ZejhN1ZIDk6KWR3ryv3Dx+woxj473mQda0Qo5rw3kDtJgmKv5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 09:33:49 +0200
Message-Id: <DKXUMYGPD8SN.157ROYN12FNA7@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joerg.sommer@navimatix.de>, <openembedded-core@lists.openembedded.org>,
 <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de> <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
In-Reply-To: <5fff22004037096d27276023cf29c473c8c8ce85.1787575546.git.joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 07:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244209

On Mon Aug 24, 2026 at 2:48 PM CEST, J=C3=B6rg Sommer via lists.openembedde=
d.org wrote:
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

Hi J=C3=B6rg,

I do note just one failure with this version, in two builds:

ERROR: lib32-inetutils-2.8-r0 do_install: Execution of '/srv/pokybuild/yoct=
o-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32=
-inetutils/2.8/temp/run.do_install.4024907' failed with exit code 1
...
| mv: '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x=
86-pokymllib32-linux/lib32-inetutils/2.8/image/usr/bin/ifconfig' and '/srv/=
pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib=
32-linux/lib32-inetutils/2.8/image/usr/bin/ifconfig' are the same file
| WARNING: exit code 1 from a shell command.
NOTE: recipe lib32-inetutils-2.8-r0: task do_install: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4324
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4479

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


