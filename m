Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB497C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:14:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11382.1790086452736931918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 07:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kFSAPOHO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 53FC14E40ECF;
	Tue, 22 Sep 2026 14:14:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27E6C60580;
	Tue, 22 Sep 2026 14:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B69B103290DA;
	Tue, 22 Sep 2026 16:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790086445; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D1Wv09UF3rOhBcdGdpHztxgiafuNKhap3jPCwhGhd6Y=;
	b=kFSAPOHOGk3bxv2hlJ+vd8m2zfLh/H0oIPdVhtO76FyptvxDJnZhExQj38LImqn7y4Zwur
	AgWGnT6RtKIPhBzikm0rjrIFuGneB4To3UN4FjKU4x5itITP0ZAvyMZsNm+p+DGMgQypAK
	RGjMahZpCT8v/PGzMbOYrZxLW2snm78UcSplo6WM2iN9hQz8NYmuq1O2tB3WUOQEg1/70X
	j+ClzYfIFOYEDjoTDLxisf9Ouji3LSQubGyn7lVzsMGLvHDQse7NII86JeTNNplZ7GOj//
	QfyA2TQA9jhJ6hu6qclllLSw/K7vby2+iwtT2nmSXrps58aOrgK7u03K0rYG9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 16:14:03 +0200
Message-Id: <DLLWONAJMUWW.JNH415ZXTGVI@bootlin.com>
Subject: Re: [oe-core][PATCH 5/5] go-mod-update-modules: include the
 generated files from the class
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <f_l_k@t-online.de>, <openembedded-core@lists.openembedded.org>
References: <20260922092411.262885-1-f_l_k@t-online.de>
 <20260922092411.262885-5-f_l_k@t-online.de>
In-Reply-To: <20260922092411.262885-5-f_l_k@t-online.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246416

Hi,

On Tue Sep 22, 2026 at 11:23 AM CEST, Markus Volk via lists.openembedded.or=
g wrote:
> A new recipe could not be parsed before its first update_modules run
> because it had to require the two generated files itself. Include them
> from the class instead, relative to the recipe, so a missing file is
> tolerated until the task has written it.

This has the following side-effect for recipes already including the file(s=
):

stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb: Dup=
licate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-opene=
mbedded/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.in=
c in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-net=
working/recipes-connectivity/tailscale/tailscale_1.102.3.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb: Dup=
licate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-opene=
mbedded/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.i=
nc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-ne=
tworking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb: Duplicate inclus=
ion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-=
oe/recipes-extended/simpleiot/simpleiot-go-mods.inc in /srv/pokybuild/yocto=
-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleio=
t/simpleiot_0.18.5.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: Duplicate inclu=
sion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta=
-oe/recipes-support/crucible/crucible-go-mods.inc in /srv/pokybuild/yocto-w=
orker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/cr=
ucible_2025.05.28.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedd=
ed/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: Duplicate inclu=
sion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta=
-oe/recipes-support/crucible/crucible-licenses.inc in /srv/pokybuild/yocto-=
worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/c=
rucible_2025.05.28.bb

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4515

If this is merged we'll need to adjust these recipes. Also if this is merge=
d
please send an update to
https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides=
/migration-6.1.rst
on the documentation mailing list to let people know why this is happening =
in
their build.

Thanks,
Antonin

