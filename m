Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C23C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 00:13:21 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1707.1666397593271946809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 17:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Kmw7nLt7;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1666397594;
  x=1697933594;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cAY9LRqdBzSotWiNY5RmEPEVm3crEuUdZlhcNY2Bf/E=;
  b=Kmw7nLt7Cnv21XQR1pW5CE2yRu5NG4HIkLJqWzO8Dw7Wrt4xcgFp4YOV
   R0XZ5GV+0OfwhNFQVwqtBf7OCqGcCjUXEIDkLvQZxbg12KoLOSyY1997S
   gE5+c+iZ57ubMcWo6jHjtotCKds6ddTq1+qjFuFFpbeSdO2HY0xObdm0Z
   hVrBpPwPRZYV2EtSYvKMUtzXIXcavcbdXImh7xMgnzNSLleyV3HJeOM7+
   an1R7zEWQ/ojqTIkXtzbHSbhbpG5O/QOarTYvz5EH8HIiDR95XCiEZxdV
   faMF4dBpKv9Ej3buUTuUy91e+aM0/4ebMOS45jAZZQzyiknMG4CPbbUmU
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] kbd: package some fonts as restricted
Thread-Topic: [OE-core] [PATCH] kbd: package some fonts as restricted
Thread-Index: AQHY4oaVTn7Ho6x7skWlDHHjc467M64Zj9tw
Date: Sat, 22 Oct 2022 00:13:10 +0000
Message-ID: <c000d10350ab4ad0bc60bf63df836ebb@axis.com>
References: <20221018001415.76680-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20221018001415.76680-1-Randy.MacLeod@windriver.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 00:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172056

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Randy MacLeod
> Sent: den 18 oktober 2022 02:14
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] kbd: package some fonts as restricted
>=20
> The distribution terms of the Agafari fonts as described in
> data/consolefonts/README.Ethiopic is:
>=20
> Agafari:
>   Donated by the Ethiopian Science and Technology Commission
>   <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistribut=
ed
>   for non-commercial use under Unix environments only.
>=20
> so package them seperately to make it easier for affected users
> to avoid installing the fonts.
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-core/kbd/kbd_2.5.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/k=
bd_2.5.1.bb
> index aa3ab6e121..8822cdbef4 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -23,9 +23,11 @@ PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURE=
S',
> 'pam', d)} \
>=20
>  PACKAGECONFIG[pam] =3D "--enable-vlock, --disable-vlock, libpam,"
>=20
> -PACKAGES +=3D "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-cons=
oletrans"
> +PACKAGES +=3D "${PN}-consolefonts ${PN}-consolefonts-restricted ${PN}-ke=
ymaps ${PN}-unimaps ${PN}-consoletrans"
>=20
> -FILES:${PN}-consolefonts =3D "${datadir}/consolefonts"
> +# Package some fonts as restricted, see README.Ethiopic
> +FILES:${PN}-consolefonts =3D "${datadir}/consolefonts/[a-zB-Z0-9]*"

Rather than that pretty odd pattern, I recommend to change PACKAGES=20
so that ${PN}-consolefonts-restricted comes before "${PN}-consolefonts:

PACKAGES +=3D "${PN}-consolefonts-restricted ${PN}-consolefonts ${PN}-keyma=
ps ${PN}-unimaps ${PN}-consoletrans"

The you can leave FILES:${PN}-consolefonts as it was:

FILES:${PN}-consolefonts =3D "${datadir}/consolefonts"

> +FILES:${PN}-consolefonts-restricted =3D "${datadir}/consolefonts/Agafari=
*"
>  FILES:${PN}-consoletrans =3D "${datadir}/consoletrans"
>  FILES:${PN}-keymaps =3D "${datadir}/keymaps"
>  FILES:${PN}-unimaps =3D "${datadir}/unimaps"
> --
> 2.34.1

//Peter


