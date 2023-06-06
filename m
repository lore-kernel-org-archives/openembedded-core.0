Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFE1C7EE45
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 20:34:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.7933.1686083656778360239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 13:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S0T7pCt/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686083654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXqXejN20UrL8e2zGtQT+FVoaan4yKPubtlUsCx2YXc=;
	b=S0T7pCt/xCmwGy57HTwI61xJSxozOccbYBUVG+RuTUqAxb2xD8FFFl1HyCNdKPV/U74Nl2
	+wqlqQG2xB5TeVYOG12JF78K1RQS7HC+4oBqNBBmJbjiiwEaXIA6pPWufO2fRTzhUmzNrU
	wDBh4KwGuIwhjN3+UsKp8fs/oEX9JGYYddRaxeKB7Iene2tQOWP9ZmHcYfeBr7EsJlKtlz
	TbzoQcp3lIj8mqGD6jsqKjk5tmboFvOiYd8cv5AsgMA5qF+bb2MmZQX65oiHz2E34e9WOc
	2HVk0CfX+rxHQKO+YtIhX6pm6XwB4opT6kyqYXJL/Phbz9frmAYeCjXSy7RjjA==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63675240003;
	Tue,  6 Jun 2023 20:34:14 +0000 (UTC)
Date: Tue, 6 Jun 2023 22:34:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] sqlite3: upgrade 3.41.2 -> 3.42.0
Message-ID: <20230606203414645c1c04@mail.local>
References: <20230602130012.3998377-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230602130012.3998377-1-tgamblin@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 20:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182450

Hello,

While this compiles, it breaks dnf:

ERROR: core-image-ptest-openssl-1.0-r0 do_rootfs: Could not invoke dnf. Com=
mand '/home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qe=
mux86_64-poky-linux/core-image-ptest-openssl/1.0-r0/recipe-sysroot-native/u=
sr/bin/dnf -v --rpmverbosity=3Dinfo -y -c /home/pokybuild/yocto-worker/qemu=
x86-64-ptest/build/build/tmp/work/qemux86_64-poky-linux/core-image-ptest-op=
enssl/1.0-r0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/home/pokybuild/=
yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky-linux/co=
re-image-ptest-openssl/1.0-r0/rootfs/etc/yum.repos.d --installroot=3D/home/=
pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-pok=
y-linux/core-image-ptest-openssl/1.0-r0/rootfs --setopt=3Dlogdir=3D/home/po=
kybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky-=
linux/core-image-ptest-openssl/1.0-r0/temp --repofrompath=3Doe-repo,/home/p=
okybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky=
-linux/core-image-ptest-openssl/1.0-r0/oe-rootfs-repo remove run-postinsts'=
 returned -11:
DNF version: 4.14.0
cachedir: /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/wor=
k/qemux86_64-poky-linux/core-image-ptest-openssl/1.0-r0/rootfs/var/cache/dnf
Added oe-repo repo from /home/pokybuild/yocto-worker/qemux86-64-ptest/build=
/build/tmp/work/qemux86_64-poky-linux/core-image-ptest-openssl/1.0-r0/oe-ro=
otfs-repo
User-Agent: falling back to 'libdnf': could not detect OS or basearch
--> Starting dependency resolution
--> Finding unneeded leftover dependencies


https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5154/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6123/ste=
ps/13/logs/stdio

And many more builds as I have been struggling with this one.

On 02/06/2023 09:00:12-0400, Trevor Gamblin wrote:
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../sqlite/{sqlite3_3.41.2.bb =3D> sqlite3_3.42.0.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3.41.2.bb =3D> sqlite3_3.42.=
0.bb} (86%)
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb b/meta/recipes=
-support/sqlite/sqlite3_3.42.0.bb
> similarity index 86%
> rename from meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> index b09e8e7f55..f60aca63d2 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "PD"
>  LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff0=
3f4fd9e4a77ed00c66"
> =20
>  SRC_URI =3D "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar=
=2Egz"
> -SRC_URI[sha256sum] =3D "e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c5=
7acc46514fae9499"
> +SRC_URI[sha256sum] =3D "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49=
da4e1eca5d088ca6"
> =20
>  # -19242 is only an issue in specific development branch commits
>  CVE_CHECK_IGNORE +=3D "CVE-2019-19242"
> --=20
> 2.40.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182315): https://lists.openembedded.org/g/openembedde=
d-core/message/182315
> Mute This Topic: https://lists.openembedded.org/mt/99285468/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

