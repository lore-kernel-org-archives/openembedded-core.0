Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.581.1608160807349412909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 15:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=l+VaaN+/;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608160807;
  x=1639696807;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/RdVUL2DBnq7UOm0dRy9W0srD5nVdcxWg2AySh7Ayvs=;
  b=l+VaaN+/2ytiG/HbF93TPu/GSImbGykWbnocV3x3FlXmxgKjX4S6Z5+t
   /EBvg6Oe026eXjDImmhnMwqnl6HMbkVKQUCRUkykKDXOBhkw1m1rI1byi
   4IgHnxsaTx09P46fVtiiVxkX8OiprxT487a4qVym84oQXR/CtYle4PTp+
   h4+BB0GOSmnpse88hjp6KzSmiXTVvS3TPZ9AmL+JsJrj8ekNpWbW8BOOi
   6NYHQvshQO9nBy6qHNI1fUhKVs5dqeJbTqalaXo4+m7z39mBfk4qM+k8w
   jdXW+YJUscLCMkO/xBDpH8cdt6ktLUQVueLeBMVpE+LbHAzlt/gp0XVaD
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Sinan Kaya <okaya@kernel.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH v4] iproute2: split ip to individual package
Thread-Topic: [OE-core] [meta-oe][PATCH v4] iproute2: split ip to individual
 package
Thread-Index: AQHW09P4EciF8lhHa0+vZz2Q4JHbcKn6V+KQ
Date: Wed, 16 Dec 2020 23:19:54 +0000
Message-ID: <c140c451791b4523b97df878f492fba8@XBOX03.axis.com>
References: <20201216175021.18813-1-okaya@kernel.org>
In-Reply-To: <20201216175021.18813-1-okaya@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Sinan Kaya
> Sent: den 16 december 2020 18:50
> To: openembedded-core@lists.openembedded.org
> Cc: Sinan Kaya <okaya@kernel.org>
> Subject: [OE-core] [meta-oe][PATCH v4] iproute2: split ip to individual
> package
>=20
> Move the ip tool into its own package. Useful for size constrained
> systems that only want the ip tool.
>=20
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 403d264308c..44f336bd580 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -46,10 +46,11 @@ do_install () {
>  # The .so files in iproute2-tc are modules, not traditional libraries
>  INSANE_SKIP_${PN}-tc =3D "dev-so"
>=20
> -PACKAGES =3D+ "\
> +IPROUTE2_PACKAGES =3D+ "\
>      ${PN}-devlink \
>      ${PN}-genl \
>      ${PN}-ifstat \
> +    ${PN}-ip \
>      ${PN}-lnstat \
>      ${PN}-nstat \
>      ${PN}-rtacct \
> @@ -58,12 +59,16 @@ PACKAGES =3D+ "\
>      ${PN}-tipc \
>  "
>=20
> +PACKAGE_BEFORE_PN =3D "${IPROUTE2_PACKAGES}"
> +RDEPENDS_${PN} +=3D "${IPROUTE2_PACKAGES}"

This breaks backwards compatibility. The iproute2 package today=20
does not bring in all the sub-packages.=20

> +
>  FILES_${PN}-tc =3D "${base_sbindir}/tc* \
>                    ${libdir}/tc/*.so"
>  FILES_${PN}-lnstat =3D "${base_sbindir}/lnstat \
>                        ${base_sbindir}/ctstat \
>                        ${base_sbindir}/rtstat"
>  FILES_${PN}-ifstat =3D "${base_sbindir}/ifstat"
> +FILES_${PN}-ip =3D "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
>  FILES_${PN}-genl =3D "${base_sbindir}/genl"
>  FILES_${PN}-rtacct =3D "${base_sbindir}/rtacct"
>  FILES_${PN}-nstat =3D "${base_sbindir}/nstat"
> @@ -71,7 +76,7 @@ FILES_${PN}-ss =3D "${base_sbindir}/ss"
>  FILES_${PN}-tipc =3D "${base_sbindir}/tipc"
>  FILES_${PN}-devlink =3D "${base_sbindir}/devlink"
>=20
> -ALTERNATIVE_${PN} =3D "ip"
> +ALTERNATIVE_${PN}-ip =3D "ip"
>  ALTERNATIVE_TARGET[ip] =3D "${base_sbindir}/ip.${BPN}"
>  ALTERNATIVE_LINK_NAME[ip] =3D "${base_sbindir}/ip"
>  ALTERNATIVE_PRIORITY =3D "100"
> --
> 2.17.1

If you are this space constrained, I would suggest adding bbappend files=20
to your own layer for these recipes instead. That is what we do so we can=20
control exactly what files we want or not. E.g., this is what we have in=20
our iproute2_%.bbappend:

EXTRA_OEMAKE +=3D "SUBDIRS=3D'lib tc ip'"

do_install_append() {
        # Remove unused files
        rm -f ${D}${base_sbindir}/ifcfg
        rm -f ${D}${base_sbindir}/rtmon
        rm -f ${D}${base_sbindir}/routef
        rm -f ${D}${base_sbindir}/routel
        rm -f ${D}${base_sbindir}/rtpr
}

With the above bbappend, the only binary left in the iproute2 package is in=
=20
fact "ip".

//Peter

