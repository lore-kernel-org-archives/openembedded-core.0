Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.26723.1611142043659235605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Y28bt2U1;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1611142044;
  x=1642678044;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Cb5FX7jqM2WJPgE3k/vUyshxnRrF4i60XLFRwTgEGH8=;
  b=Y28bt2U1S4OKyW5KhCeCQeJvRa1OS42PJtMb41qdtsFOWZChGysEYBiM
   ExxUQds553gf6eBk3fLEp/JZZ414Hu9FlIQGdThMrDg0o4aiy4y1alDD8
   Fc0Tvnzeviqf8GHvVKFj0Q9UeDTgvNrthojS87GF0xD8ipjTF8Cc+pB0G
   PTs7eprzyF3fxuBEUP2FlSETcEqwqeyb8PJ53BeTs6AXk9tteW9/rfe3i
   uf/HoI5QEWZzZV4t55G9Vokrm3obixfN9COYoixKod7mSFVwnhA9wW9B2
   QnVku07++yNjh8ARi7SijpdWyCDOTf5coSg7V3ll1vdCh0WLm+yEyctnD
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Richard Purdie
 (richard.purdie@linuxfoundation.org)" <richard.purdie@linuxfoundation.org>
CC: "Yu, Mingli" <mingli.yu@windriver.com>
Subject: Reformat PSEUDO_IGNORE_PATHS ?
Thread-Topic: Reformat PSEUDO_IGNORE_PATHS ?
Thread-Index: AdbvHzT1IrZ6cEOjTdCv0LTJlAo89A==
Date: Wed, 20 Jan 2021 11:27:20 +0000
Message-ID: <f76710e0703d4ab287f379ffcfbbf17e@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yu, Mingli
> Sent: den 20 januari 2021 08:05
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] bitbake.conf: use ${RECIPE_SYSROOT} for PSE=
UDO_IGNORE_PATHS
>=20
> From: Mingli Yu <mingli.yu@windriver.com>

[cut]

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index af1b3b8c3e..312b544d41 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -686,7 +686,7 @@ SRC_URI =3D ""
>  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
>  PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>  PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> -PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/re=
cipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDI=
R}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${W=
ORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}=
/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_D=
IR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
> +PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSR=
OOT},${RECIPE_SYSROOT_NATIVE},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdat=
a-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDI=
R}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-pa=
ckage_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components=
,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,=
${CCACHE_DIR}"

This is not related to the actual change of the above patch, but rather=20
triggered by it. Given how long the above lines are, and the fact that=20
it is nearly impossible to see what paths actually make them up and=20
what is being changed, would it make sense to reformat the definition=20
of PSEUDO_IGNORE_PATHS like this:

PSEUDO_IGNORE_PATHS  =3D ""
PSEUDO_IGNORE_PATHS .=3D "/usr/,"
PSEUDO_IGNORE_PATHS .=3D "/etc/,"
PSEUDO_IGNORE_PATHS .=3D "/lib,"
PSEUDO_IGNORE_PATHS .=3D "/dev/,"
PSEUDO_IGNORE_PATHS .=3D "/run/,"
PSEUDO_IGNORE_PATHS .=3D "${T},"
PSEUDO_IGNORE_PATHS .=3D "${RECIPE_SYSROOT},"
PSEUDO_IGNORE_PATHS .=3D "${RECIPE_SYSROOT_NATIVE},"
PSEUDO_IGNORE_PATHS .=3D "${SSTATE_DIR},"
PSEUDO_IGNORE_PATHS .=3D "${STAMPS_DIR},"
PSEUDO_IGNORE_PATHS .=3D "${WORKDIR}/pkgdata-sysroot,"
PSEUDO_IGNORE_PATHS .=3D "${TMPDIR}/sstate-control,"
PSEUDO_IGNORE_PATHS .=3D "${DEPLOY_DIR},"
PSEUDO_IGNORE_PATHS .=3D "${WORKDIR}/deploy-,"
PSEUDO_IGNORE_PATHS .=3D "${TMPDIR}/buildstats,"
PSEUDO_IGNORE_PATHS .=3D "${WORKDIR}/sstate-build-package_,"
PSEUDO_IGNORE_PATHS .=3D "${WORKDIR}/sstate-install-package_,"
PSEUDO_IGNORE_PATHS .=3D "${WORKDIR}/sstate-build-image_complete,"
PSEUDO_IGNORE_PATHS .=3D "${TMPDIR}/sysroots-components,"
PSEUDO_IGNORE_PATHS .=3D "${BUILDHISTORY_DIR},"
PSEUDO_IGNORE_PATHS .=3D "${TMPDIR}/pkgdata,"
PSEUDO_IGNORE_PATHS .=3D "${TOPDIR}/cache,"
PSEUDO_IGNORE_PATHS .=3D "${COREBASE}/scripts,"
PSEUDO_IGNORE_PATHS .=3D "${CCACHE_DIR},"

If this is acceptable, then I can send a patch to do it.

I would prefer to add that comma to the last line so that all=20
lines follow the same format, which avoids having to modify=20
multiple lines when adding/removing entries. I have verified the=20
code in pseudo and it is ok to have a trailing comma (or multiple=20
consecutive commas for that matter). The recently added=20
oe.path.canonicalize() function needs to be modified to skip=20
empty paths as well (no idea why I missed that when I added it).

That leaves a question of what to do with other classes that add=20
to the PSEUDO_IGNORE_PATHS variable. They currently typically do
PSEUDO_IGNORE_PATHS .=3D ",foo", but if a trailing comma is added=20
above, it would be more appropriate to change them to do=20
PSEUDO_IGNORE_PATHS .=3D "foo,". They will continue to work as they=20
are, however, there is the risk that someone wanting to add to the=20
PSEUDO_IGNORE_PATHS variable in their own layer looks at the above=20
code and then adds something like PSEUDO_IGNORE_PATHS_append =3D "foo,"=20
without realizing there are other classes adding paths using ",foo".=20
My guess is that there are not many users of PSEUDO_IGNORE_PATHS=20
outside of OE-Core yet that we can still change this without=20
adverse effects.

//Peter

