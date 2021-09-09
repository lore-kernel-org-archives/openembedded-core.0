Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.5069.1631178967958731544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Rt+ir6Ea;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631178968;
  x=1662714968;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=p/s7BxAr8yD4GBarLZmACeYpDHjVe7DZ3p6LVYMHP/E=;
  b=Rt+ir6EaCmWrUf5eGtpVUs9Diwqlik0e7KoDjaca4QOEolYCz6X5J2XM
   zDh/OPtTSVCRY1hRiVIjE1Dgr1uzfQqJEoB3Is8KZZaXJLVH2Kf/OWs1d
   nr1YAJm8WEplNsxFcZT+ev7r+zi4DnmaAUG9wp3EQlNOrrjxUyroNXggQ
   y+ksGcKw6T0RESIbutL1tZypPMNEop0BzDI76RM64MeC/dlkHysg3/C6L
   lTqX4ZNM4mOaneXl8m3HMx39mmFDshXklVAmR6sNGxQF/H/34ciUR4i7N
   9DQnx+QDSI1IkEUAn4lzefVu7f+sL85+4PpngbrYlibuDv1zkT+1s1Qjd
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] reproducible_build: Honor BUILD_REPRODUCIBLE_BINARIES
Thread-Topic: [OE-core][PATCH 1/2] reproducible_build: Honor
 BUILD_REPRODUCIBLE_BINARIES
Thread-Index: AQHXpSWQsaKEgbeXg02DeZe2GQ9BMqubahRg
Date: Thu, 9 Sep 2021 09:16:05 +0000
Message-ID: <39a00ec1151548b59c2b39db0b12bd4c@axis.com>
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
 <20210909025100.119427-2-mark.hatle@kernel.crashing.org>
In-Reply-To: <20210909025100.119427-2-mark.hatle@kernel.crashing.org>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mark Hatle
> Sent: den 9 september 2021 04:51
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH 1/2] reproducible_build: Honor
> BUILD_REPRODUCIBLE_BINARIES
>=20
> From: Mark Hatle <mark.hatle@xilinx.com>
>=20
> A variable BUILD_REPRODUCIBLE_BINARIES is set to '1' by default and was> =
used
> to control if the postfuncs were added.  However, it didn't actually disa=
ble
> the reproducible_build (date) logic.  This resulted in the program fallin=
g
> back to the default date.
>=20
> This change fully honors the variable and disables the various pieces
> that discover and configure the SOURCE_DATE_EPOCH if the value if not
> set to '1'.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/reproducible_build.bbclass | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/reproducible_build.bbclass
> b/meta/classes/reproducible_build.bbclass
> index 378121903d..a9c117c3b9 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -47,7 +47,9 @@ TARGET_CC_ARCH:append:class-target =3D " -Wdate-time"
>  # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
>  export SOURCE_DATE_EPOCH_FALLBACK ??=3D "1302044400"
>=20
> -SSTATETASKS +=3D "do_deploy_source_date_epoch"
> +# The following are preformed in the anonymous python function, only if

Change "are preformed" to "is performed".

> +# BUILD_REPRODUCIBLE_BINARIES =3D=3D 1
> +#SSTATETASKS +=3D "do_deploy_source_date_epoch"
>=20
>  do_deploy_source_date_epoch () {
>      mkdir -p ${SDE_DEPLOYDIR}
> @@ -73,8 +75,10 @@ python do_deploy_source_date_epoch_setscene () {
>=20
>  do_deploy_source_date_epoch[dirs] =3D "${SDE_DEPLOYDIR}"
>  do_deploy_source_date_epoch[sstate-plaindirs] =3D "${SDE_DEPLOYDIR}"
> -addtask do_deploy_source_date_epoch_setscene
> -addtask do_deploy_source_date_epoch before do_configure after do_patch
> +# The following are preformed in the anonymous python function, only if

Change "preformed" to "performed".

> +# BUILD_REPRODUCIBLE_BINARIES =3D=3D 1
> +#addtask do_deploy_source_date_epoch_setscene
> +#addtask do_deploy_source_date_epoch before do_configure after do_patch

Alternatively remove the two comments with the moved code since there=20
is a large risk that these comments won't be updated if the code below=20
is modified and eventually they will be out of sync.

>  python create_source_date_epoch_stamp() {
>      import oe.reproducible
> @@ -123,5 +127,12 @@ BB_HASHBASE_WHITELIST +=3D "SOURCE_DATE_EPOCH"
>=20
>  python () {
>      if d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=3D '1':
> +        # Generate the timestamp with create_source_date_epoch_stamp.
>          d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_e=
poch_stamp")
> +        d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
> +        bb.build.addtask('do_deploy_source_date_epoch_setscene', None, N=
one, d)
> +        bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', =
'do_patch', d)
> +    else:
> +        # If this is set at all, the system components will attempt to u=
se it
> +        d.delVar('SOURCE_DATE_EPOCH')
>  }
> --
> 2.17.1

//Peter

