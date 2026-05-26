Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36486CD5BD0
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 09:34:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33495.1779788085262816659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 02:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Oz6xMX++;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFFF91A36CE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 09:34:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2F1860732;
	Tue, 26 May 2026 09:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FE9E10888568;
	Tue, 26 May 2026 11:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779788082; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sfu9C/rggA9ItJz8VLMXuMl/XjcFUhpPt+WunzCr22M=;
	b=Oz6xMX++gfO07kPGQBw7yuYtGVYZFVUTwN6yoqjSBVFlSeg4AxoKNKQpQd4quyxXYJ/VmP
	rpoMgedau3Se8/nVdWDSBEqeDVUBkEwxAJ9r6hXBJtfTcW5zURnAFxHsXmf0IGI++YgfZd
	iNWtW+J+wmDPxXhHJ72ZGuZov5FwcZaYL8ft1MKPoVD+c0PmrInMfscv4EO4nQs2CHb94d
	hU31Entw6ud/HbQCCMugLNoePIOytC2omZByhog87oOkcbjhGFwARQ7PgjhE0unyjIQN6A
	b3wnsUffvM7rwrnkRDDZma+0cPYbvBDI1qWBwNPIlidUe971Ej7+JaJ64YI6tg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 11:34:38 +0200
Message-Id: <DISI7VNQ7EUI.1WFTMNSY1FBC4@bootlin.com>
Subject: Re: [OE-core] [PATCH] perl: Fix ptest failures
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rong.fu.cn@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260525013402.3744277-1-rong.fu.cn@windriver.com>
In-Reply-To: <20260525013402.3744277-1-rong.fu.cn@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 09:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237590

On Mon May 25, 2026 at 3:34 AM CEST, Rong Fu via lists.openembedded.org wro=
te:
> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Hi,

Thanks for your patch.

>
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-dev=
tools/perl/perl-ptest.inc
> index 4b4756118c..b33800ba54 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -59,7 +59,8 @@ python populate_packages:prepend() {
>              '${PN}-ptest%s', '%s', recursive=3DTrue, match_path=3DTrue)
>  }
> =20
> -RDEPENDS:${PN}-ptest +=3D "${PN}-modules ${PN}-doc sed procps-ps"
> +RDEPENDS:${PN}-ptest +=3D "${PN}-modules ${PN}-doc sed procps-ps libxcry=
pt-dev"

It looks like this is failing with musl:

ERROR: Nothing RPROVIDES 'libxcrypt-dev' (but /srv/pokybuild/yocto-worker/m=
usl-qemuarm64/build/layers/openembedded-core/meta/recipes-devtools/perl/per=
l_5.42.0.bb RDEPENDS on or otherwise requires it)
libxcrypt RPROVIDES libxcrypt-dev but was skipped: PREFERRED_PROVIDER_virtu=
al/crypt set to musl, not libxcrypt

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/2537
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3831
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3868

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


