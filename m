Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79352F30937
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:46:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41684.1772707609451175703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 02:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yec0SxRl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F6191A2CDD
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 10:46:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 372875FDEB;
	Thu,  5 Mar 2026 10:46:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4A0710368AD5;
	Thu,  5 Mar 2026 11:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772707606; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FSgNaU4xNaPjioNKBrBWtzJEi6ORcAq4LN4CvxjZy84=;
	b=yec0SxRlq8C8g7XAx2RGsbbphJstUwA7kZkOj+3q/GeL9NB/tAdKDfm1dHh5LstsaMDkWu
	u8gMVFD1ZS6/N7l8TYFUSY2bbPhh1Bl7fg6GyY3KJs+AZlZL5MjbjOPfMgjgUepePcJtmP
	hTShRlwJNIYtif8n8CFCzxS/G7pTSzdXla1VrToO3T6d5vo4RWMKEAM7tdzL9bBfnrKaqt
	zbLZpuqWDD3PbVTNY9sdMWNnhWfPrDr7vJt/cR5IDpsn1DqI9fCu2v9JjOVUsBDf2KZ2bB
	YHBB7E/vDNCx8gjcUCNmijh453m6D8imXOIV7whXy4R2/NjoDGw9neV3XeaZYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 11:46:45 +0100
Message-Id: <DGUSEFCGQ1MN.12P5HEQPR4NDA@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/7] module.bbclass: move environment setup to
 kernel_module.py
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
 <20260223210748.1905502-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260223210748.1905502-5-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232477

Hi,

On Mon Feb 23, 2026 at 10:06 PM CET, Adrian Freihofer via lists.openembedde=
d.org wrote:
[...]
> diff --git a/meta/lib/oe/kernel_module.py b/meta/lib/oe/kernel_module.py
> new file mode 100644
> index 0000000000..678f7de03b
> --- /dev/null
> +++ b/meta/lib/oe/kernel_module.py
> @@ -0,0 +1,22 @@
> +
> +# Set up the environment for building kernel modules
> +def kernel_module_os_env(d, env_dict):
> +    env_dict['CFLAGS'] =3D ''
> +    env_dict['CPPFLAGS'] =3D ''
> +    env_dict['CXXFLAGS'] =3D ''
> +    env_dict['LDFLAGS'] =3D ''
> +
> +    env_dict['KERNEL_PATH'] =3D d.getVar('STAGING_KERNEL_DIR')
> +    env_dict['KERNEL_SRC'] =3D d.getVar('STAGING_KERNEL_DIR')
> +    env_dict['KERNEL_VERSION'] =3D d.getVar('KERNEL_VERSION')
> +    env_dict['CC'] =3D d.getVar('KERNEL_CC')
> +    env_dict['LD'] =3D d.getVar('KERNEL_LD')
> +    env_dict['AR'] =3D d.getVar('KERNEL_AR')
> +    env_dict['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
> +    env_dict['STRIP'] =3D d.getVar('KERNEL_STRIP')
> +    env_dict['O'] =3D d.getVar('STAGING_KERNEL_BUILDDIR')
> +    kbuild_extra_symbols =3D d.getVar('KBUILD_EXTRA_SYMBOLS')
> +    if kbuild_extra_symbols:
> +        env_dict['KBUILD_EXTRA_SYMBOLS'] =3D kbuild_extra_symbols
> +    else:
> +        env_dict['KBUILD_EXTRA_SYMBOLS'] =3D ''

This is missing an SPDX identifier, which should be something like:

#
# Copyright OpenEmbedded Contributors
#
# SPDX-License-Identifier: GPL-2.0-only
#

from looking at the other files.

During the patch review call we said it was fine to merge without it for no=
w but
could you follow-up with a patch adding it?

Thanks,
Antonin

