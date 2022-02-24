Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A653C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 13:33:11 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.10324.1645709587366310214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 05:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=p6g1prZU;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645709587;
  x=1677245587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=smgLQ+LdOvT+2OqGAYSZQs1KkGlxjUgF4Mp3fkDLFf4=;
  b=p6g1prZUTtpnxILgWi+CPmtJjkOwFLsZzLRxfc2xw4H6XdgKw5XJPHsX
   /k/THWoP7f/G8IkPhrzifHAk7RkChHzUHDseVeNpzXENKSA99d2+Txz2t
   Tc5V5Yrek6SqZpLv8QFCK3T6NDiLN0SbPNmTPYPJ3AMsr4lVA4Kd1TjuB
   axE9xDRpG8lqv0hyOgfwPOfaRRMjNdiQeJiAeHkX4UEznAibyaHczbJBn
   Vye/2z2UFMj4zadpzq8BocBbrYueBBC8yn3R6TFOeAYynlT8UgF5J9x2k
   IeiW9WcqEAhtGousdgXriTMYAe2YawYVmCULBEBpZokz0eNp3ngHdOf6Q
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Tim Orling <ticotimo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tim Orling <tim.orling@konsulko.com>
Subject: RE: [OE-core] [PATCH 2/2] pip_install_wheel: improved wheel filename
 guess
Thread-Topic: [OE-core] [PATCH 2/2] pip_install_wheel: improved wheel filename
 guess
Thread-Index: AQHYKTS7kiYHeHK3HEi9n77gV4tUQqyisopQ
Date: Thu, 24 Feb 2022 13:33:01 +0000
Message-ID: <4acfd09b21f445a88a60cb574c0df3d1@axis.com>
References: <20220224041200.2645054-1-tim.orling@konsulko.com>
 <20220224041200.2645054-2-tim.orling@konsulko.com>
In-Reply-To: <20220224041200.2645054-2-tim.orling@konsulko.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 13:33:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162313

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Tim Orling
> Sent: den 24 februari 2022 05:12
> To: openembedded-core@lists.openembedded.org
> Cc: Tim Orling <tim.orling@konsulko.com>
> Subject: [OE-core] [PATCH 2/2] pip_install_wheel: improved wheel filename=
 guess
>=20
> Rather than only use PYPI_PACKAGE as a guess, fall back on PN for cases
> where a recipe does not inherit pypi.
>=20
> Wheels can only have alphanumeric characters in the 'distribution'
> name [1]. Any other characters are replaced with an underscore. Provide a
> function to replace dash with underscore.
>=20
> [1] https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode
>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/classes/pip_install_wheel.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_in=
stall_wheel.bbclass
> index f0312e0b1eb..e0f0b97ad13 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -1,6 +1,15 @@
>  DEPENDS:append =3D " python3-pip-native"
>=20
> -PIP_INSTALL_PACKAGE ?=3D "${PYPI_PACKAGE}"
> +def guess_pip_install_package_name(d):
> +    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> +    package =3D ""
> +    if not d.getVar('PYPI_PACKAGE'):
> +         package =3D (d.getVar('PN').replace('-', '_'))
> +    else:
> +         package =3D (d.getVar('PYPI_PACKAGE').replace('-', '_'))
> +    return package

You can simplify the above to:

+def guess_pip_install_package_name(d):
+    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
+    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')

> +
> +PIP_INSTALL_PACKAGE ?=3D "${@guess_pip_install_package_name(d)}"
>  PIP_INSTALL_DIST_PATH ?=3D "${B}/dist"
>  PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-=
*.whl"
>=20
> --
> 2.30.2

//Peter


