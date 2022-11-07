Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCDEC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 18:37:42 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1635.1667846255471553814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 10:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Qzr+JKi5;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667846255;
  x=1699382255;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q7D4jEc/3ntgVMElOyeLAJTABS4V+HJGcetbeh+FpKg=;
  b=Qzr+JKi5wi7F3MRfWwJq1hR0r2MBV4mKG9Mi8jjtY/GLOzWneLINc+6Q
   cwx6Xns+N+ByarhgaBqvLH10BOpzkEnxk+dOpNP9JK1ajbqIW170sHZJg
   x5fmgiwCdhB1OutmHeh27fyJAp9SYofDH4IgUsNzSWzfBdtzS9ibg1d73
   mbxeGhlYTiV/OxAFH3Q3/W10Nbjj+L0ZajOBapuxBqWnolJRVTLR0a9VS
   wCdXQAoiF8IaZA479cl8vl8aXYYFc84fCHf1jUtW6HZSLzQtquETYD/2y
   E2KsnpfwHLSJY3aqWsKocBOa3yNnfAdCvKzuVxgReF/CHx+qQxsOqGkrc
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gcc-source: Ensure deploy_date_epoch sstate
 hash doesn't change
Thread-Topic: [OE-core] [PATCH] gcc-source: Ensure deploy_date_epoch sstate
 hash doesn't change
Thread-Index: AQHY8rToW9H2cmDkm0eVfp46Ikv4C64zyNzA
Date: Mon, 7 Nov 2022 18:37:32 +0000
Message-ID: <7043881828034920aa5327304ff2ed75@axis.com>
References: <20221107142609.1509126-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221107142609.1509126-1-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 18:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172930

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 7 november 2022 15:26
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] gcc-source: Ensure deploy_date_epoch sstate ha=
sh doesn't change
>=20
> Currently if you switch machines, gcc-source do_deploy_source_date_epoch
> would reun-run as the stamps are tune specific. This hasn't caused much

Change "reun-run" to "re-run".

> of an issue until now however if we fix the gcc recipes to reuse the

For better readability, I would change the above line to:

of an issue until now. However, if we fix the gcc recipes to reuse the

> timestamp from this task, it does then create problems.
>=20
> Copy code from allarch to ensire this task hash doesn't change between

Change "ensire" to "ensure".

> machines/tunes.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-source.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devt=
ools/gcc/gcc-source.inc
> index bf33a4b31ff..265bcf4bef5 100644
> --- a/meta/recipes-devtools/gcc/gcc-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-source.inc
> @@ -17,6 +17,13 @@ STAMPCLEAN =3D "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  DEPENDS =3D ""
>  PACKAGES =3D ""
> +TARGET_ARCH =3D "allarch"
> +TARGET_AS_ARCH =3D "none"
> +TARGET_CC_ARCH =3D "none"
> +TARGET_LD_ARCH =3D "none"
> +TARGET_OS =3D "linux"
> +baselib =3D "lib"
> +PACKAGE_ARCH =3D "all"
>=20
>  B =3D "${WORKDIR}/build"
>=20
> --
> 2.34.1

//Peter


