Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6471C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 15:09:38 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8211.1646233777131651004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=I9YUTOUu;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646233777;
  x=1677769777;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yCI9xCZsdSH5+wLycOkhFK4yhMt9mG+SnajFkyPHxf4=;
  b=I9YUTOUumDHCB4STc3ToBLf3558UBaeH0Ct3tHNO4lWQ2oBkrtKrIoLy
   ID+cCLV0i6JHFD/FdIT0xJGlS/i8J6ACj4B9EAhMjQT5v14REGTx/C48j
   D19GMuQj7rg1FgPsE2obdIiV5LyMqd6FZQ9odialSo7NxFJqnzdFzehFH
   y/EBxgM7DEcpPfTaCp/BQ242rWSu7XOqjVAv8KwaSMhZ2oUyoTgdTVuxj
   Sbtf8gJrsTAXUsKki1nh8esOpFfqeQo76IYZtLVgu6xGaHYicDvNSJOXi
   XGxw0fHmKpyaiNuWMxvQcIhcG4Wa41Hl0v2dbd0j3dRI8ASIf9Gq133li
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/4] license: Rework INCOMPATIBLE_LICENSE
 wildcard handling
Thread-Topic: [OE-core] [PATCH 4/4] license: Rework INCOMPATIBLE_LICENSE
 wildcard handling
Thread-Index: AQHYLcYbtTa+sZxqf0an/snBXvM4laysMiDQ
Date: Wed, 2 Mar 2022 15:09:30 +0000
Message-ID: <7d61dda553234e96b0be45bd550b0918@axis.com>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
 <20220301234214.247172-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220301234214.247172-4-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 15:09:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162614

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 2 mars 2022 00:42
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/4] license: Rework INCOMPATIBLE_LICENSE
> wildcard handling
>=20
> The current wildcard handling is badly documented and inconsistently
> used and understood.
>=20
> Forcing users to have to use "GPL-3.0-only GPL-3.0-or-later" whilst
> explict is not very user friendly. Equally, using the current wildcards
> is ambigious. This supports pre-defined expansions only and at least make=
s
> it clear what GPL-3.0* means (it doesn't include the exception licenses).
>=20
> This is hopefully an acceptable compromise between literal meaning and
> having something usable.
>=20
> Non-SPDX forms of license in this field have been dropped and errors are
> shown for unsupported expansions and unsupported old style license terms.
>=20
> Users need to carefully consider how to migrate to the new syntax but
> the meaning should be well defined and clear from here forward.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/license.bbclass                  | 41 +++++----
>  .../oeqa/selftest/cases/incompatible_lic.py   | 86 +++++++++++--------
>  2 files changed, 70 insertions(+), 57 deletions(-)
>=20
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 68c022248c8..cb1f46983ac 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -277,28 +277,27 @@ AVAILABLE_LICENSES :=3D "${@' '.join(available_lice=
nses(d))}"
>=20
>  def expand_wildcard_licenses(d, wildcard_licenses):
>      """
> -    Return actual spdx format license names if wildcards are used. We ex=
pand
> -    wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
> +    There are some common wildcard values users may want to use. Support=
 them
> +    here.
>      """
> -    import fnmatch
> -
> -    licenses =3D wildcard_licenses[:]
> -    spdxmapkeys =3D d.getVarFlags('SPDXLICENSEMAP').keys()
> -    for wld_lic in wildcard_licenses:
> -        spdxflags =3D fnmatch.filter(spdxmapkeys, wld_lic)
> -        licenses +=3D [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in =
spdxflags]
> -        # Assume that if we are passed "GPL-3.0" or "*GPL-3.0", then it =
means
> -        # "-or-later" as well.
> -        if not wld_lic.endswith(("-or-later", "-only", "*", "+")):
> -            spdxflags =3D fnmatch.filter(spdxmapkeys, wld_lic + "+")
> -            licenses +=3D [d.getVarFlag('SPDXLICENSEMAP', flag) for flag=
 in spdxflags]
> -
> -    spdx_lics =3D d.getVar('AVAILABLE_LICENSES').split()
> -    for wld_lic in wildcard_licenses:
> -        licenses +=3D fnmatch.filter(spdx_lics, wld_lic)
> -
> -    licenses =3D list(set(licenses))
> -    return licenses
> +    licenses =3D set(wildcard_licenses)
> +    mapping =3D {
> +        "GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later"],
> +        "LGPL-3.0*" : ["LGPL-3.0-only", "LGPL-3.0-or-later"],

If you are adamant about using "*" in these shortcuts (which I=20
still think is a mistake), then you should add these two as well:

        "AGPL-3.0*" : ["AGPL-3.0-only", "AGPL-3.0-or-later"],
        "*GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later", "LGPL-3.0-only",=
 "LGPL-3.0-or-later", "AGPL-3.0-only", "AGPL-3.0-or-later"],

I believe the last one is what most really want to do, i.e.,=20
exclude all GPL-3.0 variants.

//Peter

