Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E3CF94CCE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:10:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71582.1776838210292519005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xZbFl+8L;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41152C5C9B9
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:10:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85F7E600DD;
	Wed, 22 Apr 2026 06:10:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D9A810460AFD;
	Wed, 22 Apr 2026 08:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776838208; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ks8tBzhIlgN/FE7piGv02ASJmDPctHmMoEOeITYp7qk=;
	b=xZbFl+8LnRq523BXo445y83jdDgd4aCjPYKD6vJwFe66poY6ieTI39MkuRQUknxRyLabUQ
	VHIydx+PIvCvXM4C8mPSOltP1CSa0ENHXncGLbV7Ev6u5w1QQt1lsXEJY0Dka9e1WgsLKN
	2SmHxIR0Tvtjw1dJ71QdMtzW9LIQ/eWm5P6wRK+X7E63KgdePwr/RdQ/847+hQQshQ4y/3
	1epDV5WKAgEs/MgpQmiWc7QJAdehwijwrwTlQ9CDmN/C7HcaZEzxizUwZYZrt4ryLtD+Of
	IZAUutAfxCg1i9GA4wfFuG6f2seVYfy/ZT5UvAiI5bgmydU2LGfr0zwUPxXC2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 08:10:06 +0200
Message-Id: <DHZGKR60MP1M.23FPMKT1SDWV@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 39/49] python3-uv-build: upgrade 0.10.10 ->
 0.11.7
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260421095559.1856-1-wangmy@fujitsu.com>
 <20260421095559.1856-39-wangmy@fujitsu.com>
In-Reply-To: <20260421095559.1856-39-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235694

On Tue Apr 21, 2026 at 11:55 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

It looks like python-cryptography code needs to be modified to support
this version of uv:

https://github.com/pyca/cryptography/blob/main/vectors/pyproject.toml#L4

ERROR: python3-cryptography-vectors-46.0.5-r0 do_compile: Execution of '/sr=
v/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-p=
oky-linux/python3-cryptography-vectors/46.0.5/temp/run.do_compile.2952603' =
failed with exit code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemux86-wo=
rld-alt/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vect=
ors/46.0.5/temp/log.do_compile.2952603
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	uv_build<0.11.0,>=3D0.7.19
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-cryptography-vectors-46.0.5-r0: task do_compile: Faile=
d

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3482

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


