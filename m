Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10859C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 02:09:28 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.17950.1633226965925475963
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 19:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=j/Lgd0hj;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1633226966;
  x=1664762966;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BTSdPqvx/97Q3rmE6XsvXD+WX+IMxWRHOL66Kth9oTw=;
  b=j/Lgd0hj22vfXQurVeU8rvVfKHSvmeGEv9fhv2zpL9lhdhOYIhAFm+4f
   OhizF9ADFGiBth+Aau11PZk6MVc2XIqRi/GGHpOQyspPU7t6Ov7jwQyxE
   WKkKryrbrLTK1T75y8XxAg1+efGwJvEW9KCJvpy0u+C2TKXhV8qbhL8V9
   c+tMSDDXsNdodD+7LWXamALxNDDKi5+lJAWlSgURnTmIY5clpLrvjgzbg
   igsKyv2/EFHluZEqiPxKZ2pUPS1e1qQFhuEsWWp/Gqj6raS5VyOWocXhO
   gQ/Pf9nx8emjAUgUO45xbGcEUV6HSm/PCz5PSizI41WSZl6VuZzB+B5W3
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/5] image-artifact-names: Use SOURCE_DATE_EPOCH
 when making reproducible builds
Thread-Topic: [OE-core] [PATCH 3/5] image-artifact-names: Use
 SOURCE_DATE_EPOCH when making reproducible builds
Thread-Index: AQHXt9t2b99KXneOxUOE4/cXZbjaDqvAhOFw
Date: Sun, 3 Oct 2021 02:09:22 +0000
Message-ID: <76b81ffd58674f24a568247e02697846@axis.com>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
 <20211002221803.2283254-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211002221803.2283254-3-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 02:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156544

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 3 oktober 2021 00:18
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/5] image-artifact-names: Use SOURCE_DATE_EPOC=
H
> when making reproducible builds
>=20
> Using DATETIME means the deploy output is not deterministic. Use SDE
> when using reproducible builds since it is consistent for given input
> data.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image-artifact-names.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image-artifact-names.bbclass
> b/meta/classes/image-artifact-names.bbclass
> index 3ac8dd731a6..df9e17c6b0f 100644
> --- a/meta/classes/image-artifact-names.bbclass
> +++ b/meta/classes/image-artifact-names.bbclass
> @@ -4,7 +4,7 @@
>=20
>  IMAGE_BASENAME ?=3D "${PN}"
>  IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
> -IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME"
> +IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME SOURCE_DATE_EPOCH"
>  IMAGE_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
>  IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}"
>=20
> @@ -13,3 +13,10 @@ IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}"
>  # by default) followed by additional suffices which describe the format =
(.ext4,
>  # .ext4.xz, etc.).
>  IMAGE_NAME_SUFFIX ??=3D ".rootfs"
> +
> +python () {
> +    if bb.data.inherits_class('reproducible_build', d):

This needs to be something like:

    if bb.data.inherits_class('reproducible_build', d) and d.getVar("IMAGE_=
VERSION_SUFFIX", False) =3D=3D "-${DATETIME}":

otherwise it will be impossible to change IMAGE_VERSION_SUFFIX if one also
has reproducible builds enabled.

//Peter

> +        import datetime
> +        d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtim=
estamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime(=
'%Y%m%d%H%M%S'))
> +        d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
> +}
> --
> 2.32.0


