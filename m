Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D09DCD5BAC
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 08:46:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12853.1779439564456408276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 01:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=KaYEL2Ub;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8561C2C658;
	Fri, 22 May 2026 08:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21C0D6003C;
	Fri, 22 May 2026 08:46:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60E07107E8CB1;
	Fri, 22 May 2026 10:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779439561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qrPpnQtXxPgX9Op84ucf+XZdFeZa9zxf+Cvxp/UyxLA=;
	b=KaYEL2UbklP/OZbzfsMm+ImNcsjbgOQenJLCUFfLAuOr4UMZMKsWM8SHiaphCjc0rjxgj+
	5tEiCS+hh8+AzSTy+08TxI2OtF9bAVglYNg9tKp3c9sm2MzJelu3GtFCZMnBc+GVsjaGJj
	C8lQ8tRHEuO00vcFVqMe9zO78Zvwd9GRvMh1onPtEdmGZ88V798FPP5pXNeLMj8NakqYJz
	PRrk7aMczaYgiGn+jnXCbvU6l89bRjMj+Cb1w8mJG/JfG+9GWv3VDKn59KGGDtZWQ38KLR
	c9Fig0UMEAdlxg6mIA5/qYwfmDiFoCDi2dA5qVhoyc1Zq+sc5U9JKeDLeAY9qQ==
Message-ID: <928236bc-c6b6-4411-8ff5-1a020636f4f3@bootlin.com>
Date: Fri, 22 May 2026 10:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/5] Split vim and xxd in different recipes
To: Antonin Godard <antonin.godard@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, Ross.Burton@arm.com,
 alex.kanavin@gmail.com, paul@pbarker.dev, richard.purdie@linuxfoundation.org
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
 <DIP0ISZG473W.2595LSKY0SFUH@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DIP0ISZG473W.2595LSKY0SFUH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 08:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237534

Hello,

On 5/22/26 09:04, Antonin Godard wrote:
> Hi,
>=20
> I suspect for some reason this is triggering the following error on the=
 Autobuilder:
>=20
> ERROR: vim-tiny-9.2.0340-r0 do_package_qa: QA Issue: File /usr/src/debu=
g/vim-tiny/9.2.0340/src/auto/pathdef.c in package vim-tiny-src contains r=
eference to TMPDIR [buildpaths]
> ERROR: vim-tiny-9.2.0340-r0 do_package_qa: QA Issue: File /usr/bin/vim.=
tiny in package vim-tiny contains reference to TMPDIR [buildpaths]
> ERROR: vim-tiny-9.2.0340-r0 do_package_qa: Fatal QA errors were found, =
failing task.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3794
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3635
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3818
>=20
> Could you try reproducing this on your end?
>=20
> Thanks,
> Antonin

Yep, that comes from no longer applying (by mistake) the patches on=20
vim-tiny. I will fix that in a v3, after collecting other feedbacks. Than=
ks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

