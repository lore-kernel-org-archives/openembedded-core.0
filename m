Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D03C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 15:09:44 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.10816.1633360183520332114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 08:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QDnZcgkA;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1633360184;
  x=1664896184;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SsA+W7blDo5RvjMKs5ekeAqLnQncVtYNd4LX91T0wqE=;
  b=QDnZcgkAlY1DSyAuf45I2T5OdPYlA+OPkoPP8ajn+vsBZVltJLL7Kobw
   HmvrQDRqRBXe1S0JRaQZDge6bYD5m+8gjY6h9qndFn8o8Cg9vCMEvTE68
   +5nV+ClyC81YJdZe06MYBJ6zai4XnD36FH5yOGUUPZhmMqNF9/v7+hONQ
   vtBkT30SxeZXayp31gi9QX4v3v1EYc1fK6TfYiuiuOhS1DN6yG0KQL/3v
   6e5g4PdCWFaDBiF8mFgZ0f452sZauvtMHu0S+JIeaNKK9t9hydhw6BnVL
   zUKnnIFmrzS84vU1t62sW7tVFldnmfLyfHdxo5yqp1Q6JptBWu4vezLFH
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/3] update-rc.d: fix append in DEPENDS
Thread-Topic: [OE-core] [PATCH 3/3] update-rc.d: fix append in DEPENDS
Thread-Index: AQHXuSPguiFCvFp4SEWe6wV5X147yavC8TgA
Date: Mon, 4 Oct 2021 15:09:40 +0000
Message-ID: <843f916fb31a4b559b89042356423584@axis.com>
References: <20211004132853.30543-1-kweihmann@outlook.com>
 <AM9PR09MB46420CA5C827065A7E8AA58CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46420CA5C827065A7E8AA58CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 15:09:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156610

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> Sent: den 4 oktober 2021 15:29
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH 3/3] update-rc.d: fix append in DEPENDS
>=20
> fix the append with a leading blank, otherwise this messes up
> DEPENDS when globally inherited classes add dependecies of their own
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/update-rc.d.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-
> rc.d.bbclass
> index 0a3a608662..921df98584 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -1,6 +1,6 @@
>  UPDATERCPN ?=3D "${PN}"
>=20
> -DEPENDS:append:class-target =3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'sysvinit', ' update-rc.d initscripts', '', d)}"
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES'=
, 'sysvinit', ' update-rc.d initscripts', '', d)}"

This change is not needed as there already is a space inside=20
the if statement (in ' update-rc.d initscripts').

>=20
>  UPDATERCD =3D "update-rc.d"
>  UPDATERCD:class-cross =3D ""
> --
> 2.25.1

//Peter


