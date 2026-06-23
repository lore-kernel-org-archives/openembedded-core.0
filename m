Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B250CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 14:12:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21899.1782223950985054235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 07:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NVNWrmbn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AEB6D4E40769
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 14:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C6EC601C2;
	Tue, 23 Jun 2026 14:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83FA0106C83CD;
	Tue, 23 Jun 2026 16:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782223948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lf32UB15ERvRmg4kicRdLmDX7J+BzQjC/R/S0MTpric=;
	b=NVNWrmbn3SSMHWKJyW4x+IfE01XUvrzskzLIvF6ha+WxWcGbzHm39dl92VmdGGv7R16emv
	gm20Zrq1/e6R0RuqbnVvXc+b4pO9VI+/GHSFFSSlYoHkpbKx6azRLEg6g0iLvMR12gPL5G
	HvyCWCp8XZ4ON4ZKM6Km/0CTiE1+kHX5NGuted4uXMLUKa/vCLeuBAZ8BXG8xZ+NGh0Tll
	i4AQQ3tLuR0iZ5w9g8UR1LMo1x/QqkPwzngqiWcO9QCptFoOb0GSKNEOu49NgKuFKzCIhK
	T99hP2+4DJNAP0Za44dUOZNdM5F2+k2xqMVVVm6EBnjhGCiTBiOctgY4u1sqyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 16:12:25 +0200
Message-Id: <DJGHNTGT2MED.PW12J0XM4EPW@bootlin.com>
To: <antoine.gouby@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: fix INSANE_SKIP package name for
 mesa-gl builds
Cc: "Antoine Gouby" <antoine.gouby@toradex.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260623-mesa-fix-insane-skip-v1-1-97856536ea8b@toradex.com>
In-Reply-To: <20260623-mesa-fix-insane-skip-v1-1-97856536ea8b@toradex.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 14:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239403

On Tue Jun 23, 2026 at 1:21 PM CEST, Antoine Gouby via lists.openembedded.o=
rg wrote:
> From: Antoine Gouby <antoine.gouby@toradex.com>
>
> mesa.inc is shared by both mesa.bb and mesa-gl.bb. The variable
> INSANE_SKIP:${PN}-megadriver expands to mesa-gl-megadriver when
> included by mesa-gl.bb, but the package is always named mesa-megadriver
> (hardcoded via PACKAGES =3D+). The skip therefore had no effect for
> mesa-gl builds.
>
> This was hidden until mesa 26.1.0 removed the with_gbm condition from
> the dril subdir build, causing mesa-gl to now install DRI driver
> symlinks into mesa-megadriver for the first time.
>
> Use the hardcoded package name, consistent with the three RREPLACES/
> RCONFLICTS/RPROVIDES lines right below.
>
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> ---

Hi Antoine,

Thanks for your patch.

This is now producing another QA issue about these symlinks, in multilib
configuration:
ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/native=
sdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/panel=
-mipi-dbi_dri.so' [dev-so]
ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/native=
sdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/crocu=
s_dri.so' [dev-so]
ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/native=
sdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/ili92=
25_dri.so' [dev-so]
ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/native=
sdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/gm12u=
320_dri.so' [dev-so]
ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/native=
sdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/rcar-=
du_dri.so' [dev-so]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3975

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


