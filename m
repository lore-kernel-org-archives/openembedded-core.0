Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE265C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 06:30:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10911.1787553044633630619
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 23:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wx5RPLCY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB8981A17DE;
	Mon, 24 Aug 2026 06:30:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F9BC60378;
	Mon, 24 Aug 2026 06:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14AEA11C788F7;
	Mon, 24 Aug 2026 08:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787553038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kw++XbQ7OiyLWFL/1/LNEBvHbelVOPLOFrRljPP1/ZQ=;
	b=wx5RPLCYbqS/ZFZ2Ck45LNHrENYFSrwDfY43T2Rm/JMMmovOXRu39ZBrD7lgcMKm5GsTgb
	KePgtbiot1owQw+9c9ae5MWJMzUR0dnZLTh5OiBQ0PmLgtVClIuv1eog7oC/HPMy7l/06e
	7PDpPnnVeRTFDy4VUQWZ4iNjM3Agy8JSxM113hJVe2FslTs7f8xGOTfpqweVEsRjPwRJjn
	yCbuj2yVR+BBl/3ADeiLgOq9zSfSFSkIhfuiXr4Teol7jNYK4dpcpxbUkQv19Jxz5D57fM
	JSqvfXUQNBFHLjmfB7zE4BFV65Sh8FwsR1V8KSSEyW61VoRpoKwL3Bx0R+6tLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 08:30:35 +0200
Message-Id: <DKWYNZVX7C32.11QQ5O5ZO8J68@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to
 merge bin+sbin
Cc: <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de> <aolV39x9UzHwcTrZ@navimatix.de> <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com> <aoms3iLkFaLTp8E7@navimatix.de>
In-Reply-To: <aoms3iLkFaLTp8E7@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244065

On Sat Aug 22, 2026 at 4:09 PM CEST, J=C3=B6rg Sommer wrote:
> Mathieu Dubois-Briand schrieb am Sa 22. Aug, 14:16 (+0200):
>> On Sat Aug 22, 2026 at 9:56 AM CEST, J=C3=B6rg Sommer wrote:
>> > J=C3=B6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
>> >> From: Randolph Sapp <rs@ti.com>
>> >>=20
>> >> The split of bin and sbin became more artificial over time, and it is=
 no
>> >> longer clear why programmes goes into the one or the other directory;=
 e.g.
>> >> forever normal users have used sendmail in /usr/sbin, and fdisk and m=
kfs
>> >> learned to operate on files to create images long ago.
>> >
>> > Gentle ping. What's the state of this?
>> >
>>=20
>> Hi J=C3=B6rg,
>>=20
>> Previous builds showed some errors. Should it have evolve since that?
>
> Yes, I think so. The bootchart2 errors were addressed by 2bf18f9908, and =
the
> tcf-agent by 443f8c62ad.

Hi J=C3=B6rg,

It looks like this is still failing, at least with alt distro:

ERROR: systemd-1_261.2-r0 do_package: QA Issue: systemd: Files/directories =
were installed but not shipped in any package:
  /usr/sbin
  /usr/sbin/poweroff
  /usr/sbin/mount.ddi
  /usr/sbin/init
  /usr/sbin/resolvconf
  /usr/sbin/mount.storage
  /usr/sbin/halt
  /usr/sbin/mount.mstack
  /usr/sbin/reboot
  /usr/sbin/shutdown
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
systemd: 10 installed and not shipped files. [installed-vs-shipped]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4407
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4430

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


