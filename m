Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FB2C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:55:10 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.web10.10542.1709034907300156039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.112.87])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 4ED435F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 12:55:05 +0100 (CET)
From: Andreas =?ISO-8859-1?Q?M=FCtzel?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3-bcrypt: allow building native package
Date: Tue, 27 Feb 2024 12:55:01 +0100
Message-ID: <6625026.QJadu78ljV@mobilepool081.emlix.com>
In-Reply-To: <20240227113023.3194930-1-andreas.muetzel@emlix.com>
References: <20240227113023.3194930-1-andreas.muetzel@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196266

Some context on this: This is a dependency of some python3 packages related=
 to=20
SSH and SCP in meta-openembedded, e.g. python3-paramiko.=20

My use case is to package some test tools (such as the Robot Framework and =
its=20
SSH library) into a SDK that would not only contain the tools to build an=20
image, but also allow running automated tests using these tools. These test=
s=20
would not run on the target, but run on the host and connect to the target=
=20
(real or qemu) and then check some things.

=46or that, I would likely be able to contribute the relevant python3 libra=
ries=20
to meta-openembedded (python3-robotframework-sshlibrary and its dependency,=
=20
python3-scp). But since python3-bcrypt is a dependency of that, I can't bui=
ld=20
the native/sdk variants without this patch.
python3-bcrypt is the only missing piece of the dependency chain that is no=
t=20
in meta-openembedded, so my idea was that it is probably better to try and=
=20
contribute the patch here instead of sending a .bbappend to meta-oe togethe=
r=20
with the new recipes.

I currently have this set in a .bbappend (and would be fine with continuing=
 to=20
do so), but I thought this might be useful for other people as well.=20

If you think this use case is out of scope for this layer or not worth the=
=20
maintenance effort, I'm also fine with that :-)

Best regards,
Andreas

On Tuesday, 27 February 2024 12:30:23 CET you wrote:
> The native and nativesdk variants of this package build fine, but the
> corresponding BBCLASSEXTENDS was missing. Add it.
>=20
> Signed-off-by: Andreas M=FCtzel <andreas.muetzel@emlix.com>
> ---
>  meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb index
> 8328594bad..72216c39c2 100644
> --- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> @@ -34,3 +34,5 @@ RDEPENDS:${PN}:class-target +=3D "\
>      python3-shell \
>      python3-six \
>  "
> +
> +BBCLASSEXTEND =3D "native nativesdk"





