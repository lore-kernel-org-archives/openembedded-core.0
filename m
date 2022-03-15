Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0208C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:48:19 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.14179.1647366496560593508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Bqk1hI4I;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647366497;
  x=1678902497;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HXL40C0/HA/EzJY6ARnEW6DLCQ7BkgewkMWgJNVt5VY=;
  b=Bqk1hI4I2LGDTUO8ILrJGlZO2D8SKSRmCV6mSxvcFmIRq1OrYZ7r2bC0
   SEYcRqngIkqQHoYwAtRLyCxzF8bo/0M8kg9ED1pbAS4i3LO18jlHFUQfb
   JZkkYwHHpIS92GzsYWlZ6mhK/blGq4y1l6Yp/Nxeke/Ul+r7JbcTgORF8
   6G+uJnuDs68f4Pdm/R7mqjQRfBkeBlkzhprlHUIZp779QftxO9caP/2dE
   CQPkC49vG9pfIVkJMr+5eC0TZLaTU8c5fa9bzUuncv6mXOIzt+31G5m7/
   KoIzlsMvPCUOgjRVJJhSzpQ1PQRX1nloSkTd9Ek3QAY7g6bzTtzSv+W94
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] create-spdx: Use function rather than
 AVAILABLE_LICENSES
Thread-Topic: [OE-core] [PATCH 1/2] create-spdx: Use function rather than
 AVAILABLE_LICENSES
Thread-Index: AQHYOJLEnWk5X83gPkSC/TokkETxMqzAthYw
Date: Tue, 15 Mar 2022 17:48:12 +0000
Message-ID: <f39762f2fc464c619aa3035abd66321e@axis.com>
References: <20220315173310.889973-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220315173310.889973-1-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:48:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163314

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 15 mars 2022 18:33
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] create-spdx: Use function rather than AVAI=
LABLE_LICENSES
>=20
> We can directly call the function rather than using the variable
> indirection.
> As this is the last user of the variable, it then allows removal of it in=
 a
> followup patch.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/create-spdx.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
> index daf99ca676c..1a4804a7c50 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -94,7 +94,7 @@ def convert_license_to_spdx(lic, document, d, existing=
=3D{}):
>      from pathlib import Path
>      import oe.spdx
>=20
> -    available_licenses =3D d.getVar("AVAILABLE_LICENSES").split()
> +    avail_licenses =3D available_licenses(d)

Doesn't this mean that the available licenses will be calculated once=20
per recipe? Or isn't it a problem since the time will not be spent=20
during recipe parsing, but rather during task execution where no one=20
will notice if the create-spdx task for all recipes takes a little=20
longer?

That said, if I remember correctly from the last time I looked at this=20
function, it should be possible to rewrite it to not rely on=20
available_licenses() without any real loss in functionality.

>      license_data =3D d.getVar("SPDX_LICENSE_DATA")
>      extracted =3D {}
>=20
> @@ -112,7 +112,7 @@ def convert_license_to_spdx(lic, document, d, existin=
g=3D{}):
>          if name =3D=3D "PD":
>              # Special-case this.
>              extracted_info.extractedText =3D "Software released to the p=
ublic domain"
> -        elif name in available_licenses:
> +        elif name in avail_licenses:
>              # This license can be found in COMMON_LICENSE_DIR or LICENSE=
_PATH
>              for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVa=
r('LICENSE_PATH') or '').split():
>                  try:
> @@ -122,11 +122,11 @@ def convert_license_to_spdx(lic, document, d, exist=
ing=3D{}):
>                  except FileNotFoundError:
>                      pass
>              if extracted_info.extractedText is None:
> -                # Error out, as the license was in available_licenses so=
 should
> +                # Error out, as the license was in avail_licenses so sho=
uld
>                  # be on disk somewhere.
>                  bb.error("Cannot find text for license %s" % name)
>          else:
> -            # If it's not SPDX, or PD, or in available licenses, then NO=
_GENERIC_LICENSE must be set
> +            # If it's not SPDX, or PD, or in avail_licenses, then NO_GEN=
ERIC_LICENSE must be set
>              filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
>              if filename:
>                  filename =3D d.expand("${S}/" + filename)
> --
> 2.32.0

//Peter

