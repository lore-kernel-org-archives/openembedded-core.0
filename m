Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB57DC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:10:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16138.1787577040939981843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RMWOQCj3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A43C61A17FE;
	Mon, 24 Aug 2026 13:10:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7896F5FFC1;
	Mon, 24 Aug 2026 13:10:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A95C11C794BF;
	Mon, 24 Aug 2026 15:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787577034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tgE5dXuoGrM1VlJ83eDqwd6GZyIWS1oybxxADhDfqfg=;
	b=RMWOQCj3SVxHkDAxTtZyEGeZ0+wqwLs3rz9lNSZQhhm0TVVsnp2TYb5T25MW8KVmJ7eG2r
	TCzWUAl3V4VN8z3pbEOzVxstP1oMItcJNH/4bQM8CnG0vI0gK7YJIKD4RJOIXa45b0endd
	vuu3eah8dwwGIUD2xQ7njzzBEG1C7j6RuY7rwIKVLZm9pEmjQI/n55jrBgPX4X/2nG+XvL
	strPvOJmW1vnsAr1TqJGlSfAgS+yEmssnREUxnAbpmBgb7+z2IHzLjQMU5bDSARrDtA8lv
	Yf6ycPD01TD4uqjOLE3ahgt4nAPFrO9YTaII2WSfUgUKIiVlWlGpFMo5aMKh7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 15:10:31 +0200
Message-Id: <DKX7678REYJC.X179JUNYAL4K@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, <rs@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to
 merge bin+sbin
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de> <aolV39x9UzHwcTrZ@navimatix.de> <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com> <aoms3iLkFaLTp8E7@navimatix.de> <DKWYNZVX7C32.11QQ5O5ZO8J68@bootlin.com> <aowSZF6aysT2amaR@navimatix.de> <DKX36LKP5G7W.3D3MAFXU05Z5X@bootlin.com> <aow7fs_7Zb0KTAPf@navimatix.de>
In-Reply-To: <aow7fs_7Zb0KTAPf@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244119

On Mon Aug 24, 2026 at 2:43 PM CEST, J=C3=B6rg Sommer wrote:
> Mathieu Dubois-Briand schrieb am Mo 24. Aug, 12:02 (+0200):
>> You can find a tag in there:
>>=20
>> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder=
.yoctoproject.org/valkyrie/a-full-4555
>
> This really helped to track down the issue. In your commit [1] this block=
 is
> missing:
>
> ```
> --- meta/recipes-core/systemd/systemd_261.2.bb
> +++ meta/recipes-core/systemd/systemd_261.2.bb
> @@ -196,7 +196,6 @@ def build_epoch(d):
>  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0"
>  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
>  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
> -PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
>  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
>  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
>  PACKAGECONFIG[valgrind] =3D "-DVALGRIND=3D1,,valgrind"
> ```
>
> [1] https://git.yoctoproject.org/poky-ci-archive/commit/?h=3Doecore/autob=
uilder.yoctoproject.org/valkyrie/a-full-4555&id=3D9da89593957c05809e58e85f2=
d521ab80ce7f807
>
> I'll send a v3 based on 261.2

Looks like I missed it while resolving conflicts. Thanks for the v3.

