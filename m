Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333C2CD4F3D
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 07:04:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12099.1779433480492022172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 00:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AwiiJ3QW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 598DE4E42D28;
	Fri, 22 May 2026 07:04:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE7E6003C;
	Fri, 22 May 2026 07:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03D83107E8BD4;
	Fri, 22 May 2026 09:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779433477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=prFPqbpbuEpjzIn02z04d1w4+80V0cAcsmcp5m2/Ku8=;
	b=AwiiJ3QW4NLcYNPWXNozI6fUm9yMXIjAGwWKuody4GDeWuanNP1ljwB1evr1oQuO3pRIh9
	XecRLPZXx5pK2knrcRCNsGeFwNnMgXB0XFbhG+Xn4ASaXaMnN7bLz6zRpWswEeTaalDih9
	Fvxhp5K4tASbuKxcBMU0z/fM957z//EeS45B6r+79NIVDnLbeH1Z83EEXxkvJaYFJhn/Ov
	P1wpibZ6b01BExRUZKPa7eyevRHOicgMojtJVWGcHeb8Bxomw/OBV3efcHYCS/x+TOS/9P
	CJ4uBw15cpIIRWOziFCHN6xdVVeSXssPNK9EnqFA2x/aF1hW8RI4vVeDvFaAqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 09:04:34 +0200
Message-Id: <DIP0ISZG473W.2595LSKY0SFUH@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 0/5] Split vim and xxd in different recipes
Cc: <thomas.petazzoni@bootlin.com>, <Ross.Burton@arm.com>,
 <alex.kanavin@gmail.com>, <paul@pbarker.dev>,
 <richard.purdie@linuxfoundation.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 07:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237528

Hi,

I suspect for some reason this is triggering the following error on the Aut=
obuilder:

ERROR: vim-tiny-9.2.0340-r0 do_package_qa: QA Issue: File /usr/src/debug/vi=
m-tiny/9.2.0340/src/auto/pathdef.c in package vim-tiny-src contains referen=
ce to TMPDIR [buildpaths]
ERROR: vim-tiny-9.2.0340-r0 do_package_qa: QA Issue: File /usr/bin/vim.tiny=
 in package vim-tiny contains reference to TMPDIR [buildpaths]
ERROR: vim-tiny-9.2.0340-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3794
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3635
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3818

Could you try reproducing this on your end?

Thanks,
Antonin

