Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97900C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 21:12:12 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.21569.1721855522660387153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 14:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PVY9HEZx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3C8E60003;
	Wed, 24 Jul 2024 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721855520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jU4v2fMzmNkRLWu9UGFp+hOFQjYy+kIb7cBZ/AebJZA=;
	b=PVY9HEZx5qbALgSjXF+N1JsLkaSmjkL7fMEnPq5BRHKqhjpLKCrLysJL2CEhEAaa94ka+w
	vw1zsyxw/jJ6WWNE0A/gbmvvQkowfFQLFxQoI2okNlF8L3OrS8vy79Q+NTgHK9BluPl6H1
	dyHPVKk26a+1RHGGF3+oWkb1xJprQlG9XDRns90yDL8cDAXvT9gLu9H2rahUHBbi6DtMxq
	NuH8eboCcKEtKg+S30u0pksxgWL0dWU3SRyxS8zwUB2L5DoUvz/EjqnR9BQsLpW0P1kM4P
	x4AMQ0gR+aBEqSVMqcN+MCJ7XT/kqqPxiZSBleR3APuONjaEZ6QJcKja94ExHA==
Date: Wed, 24 Jul 2024 23:11:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Wicki, Patrick" <patrick.wicki@siemens.com>,
	"patrick.wicki@subset.ch" <patrick.wicki@subset.ch>
Subject: Re: [OE-core][scarthgap][master][PATCH] gpgme: move gpgme-tool to
 own sub-package
Message-ID: <202407242111594579750a@mail.local>
References: <20240618100554.2793454-1-patrick@subset.ch>
 <AS1PR10MB5697BB37A759467BFAF6E326FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS1PR10MB5697BB37A759467BFAF6E326FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 21:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202486

On 24/07/2024 20:39:55+0000, Peter Marko via lists.openembedded.org wrote:
> Gentle ping

Tagging a patch with both a stable branch and master is a recipe to get
your patch ignored as there is no way for me to filter this properly...

> 
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Patrick Wicki via lists.openembedded.org
> Sent: Tuesday, June 18, 2024 12:06
> To: openembedded-core@lists.openembedded.org
> Cc: Wicki, Patrick (SI BP R&D ZG SW 2) <patrick.wicki@siemens.com>
> Subject: [OE-core][scarthgap][master][PATCH] gpgme: move gpgme-tool to own sub-package
> 
> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> The gpgme-tool binary is licensed GPL-3.0-or-later. Split it out into its own package that can be opted out of.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  meta/recipes-support/gpgme/gpgme_1.23.2.bb | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
> index d8807b3af2..55f164e4a9 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
> @@ -3,11 +3,18 @@ DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to G  HOMEPAGE = "http://www.gnupg.org/gpgme.html"
>  BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
>  
> -LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
> +LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
> +LICENSE:${PN} = "GPL-2.0-or-later & LGPL-2.1-or-later"
> +LICENSE:${PN}-cpp = "GPL-2.0-or-later & LGPL-2.1-or-later"
> +LICENSE:${PN}-tool = "GPL-3.0-or-later"
> +LICENSE:python3-gpg = "GPL-2.0-or-later & LGPL-2.1-or-later"
> +
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
>                      file://src/gpgme.h.in;endline=23;md5=2f0bf06d1c7dcb28532a9d0f94a7ca1d \
> -                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
> +                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d \
> +                    file://src/gpgme-tool.c;endline=21;md5=66c5381e0e05475792e24982d15e7ce8 \
> +                    "
>  
>  UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
>  SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \ @@ -33,6 +40,8 @@ RDEPENDS:${PN}-cpp += "libstdc++"
>  
>  RDEPENDS:python3-gpg += "python3-unixadmin"
>  
> +RRECOMMENDS:${PN} += "${PN}-tool"
> +
>  BINCONFIG = "${bindir}/gpgme-config"
>  
>  # Default in configure.ac: "cl cpp python qt"
> @@ -61,9 +70,10 @@ export PKG_CONFIG='pkg-config'
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
> -PACKAGES =+ "${PN}-cpp python3-gpg"
> +PACKAGES =+ "${PN}-cpp ${PN}-tool python3-gpg"
>  
>  FILES:${PN}-cpp = "${libdir}/libgpgmepp.so.*"
> +FILES:${PN}-tool = "${bindir}/gpgme-tool"
>  FILES:python3-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
>  FILES:${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
>  
> --
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202484): https://lists.openembedded.org/g/openembedded-core/message/202484
> Mute This Topic: https://lists.openembedded.org/mt/106737984/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

