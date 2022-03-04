Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87093C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 19:03:44 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.437.1646420622888889871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 11:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oQB9L4MU;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646420623;
  x=1677956623;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cLo4KZEYRTolW0j6sDnn1f6i4hoVEnZZpuJMjm+mgtc=;
  b=oQB9L4MUQHFSXjg1Uf66g5rOslm+pSJU7SmGhl2R7DEBbXpQdXFEBV1u
   xwdthfONdjhOUDF9lfm2eqKkglrIlkiZtfhKznZUdk+EijnRkDYU6MzRk
   +BcbymswmRC71d9Q2ohGVNVugJb6pbW9VI9UWspxiB+SQFBZq7B+bRlhV
   7ef5QZJXlNsyKC4JHADuO3SBezl32M02a3Q63PUniGhICNCY2QMmblPNN
   QqSTchijWU+AW7chyK9PFt8NumhuR+Cro8VpK/qO1FCEQIdRb8Hrf5dwN
   OQDpvBkqHWi1Goxun0xryDMVtSIefkuKwhANKZnrF8t5S/8gTxNv1Jg49
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] setuptools3.bbclass: clean up
Thread-Topic: [OE-core] [PATCH 2/3] setuptools3.bbclass: clean up
Thread-Index: AQHYL+tjR+i3X472xkiJRERxiS+1nqyvjTcQ
Date: Fri, 4 Mar 2022 19:03:37 +0000
Message-ID: <7914aeb052c84f0895246df5f8a7e440@axis.com>
References: <20220304171408.2672507-1-ross.burton@arm.com>
 <20220304171408.2672507-2-ross.burton@arm.com>
In-Reply-To: <20220304171408.2672507-2-ross.burton@arm.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 19:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162754

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 4 mars 2022 18:14
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/3] setuptools3.bbclass: clean up
>=20
> There's been a lot of work in this class lately, so a little spring
> cleaning is needed.
>=20
> Create wheels verbosely to help debug problems.
>=20
> Remove unused SETUPTOOLS_INSTALL_ARGS, these can't be passed to
> bdist_wheel.
>=20
> Remove duplicate manipulation of files in bindir as pip_install_wheel
> does the same.
>=20
> Remove obsolete deletion of easy-install.pth, wheels don't generate that.
>=20
> Remove obsolete ${datadir}/share fixup, pip-installed wheels can't
> generate that path combination.
>=20
> Remove purging of ${D} references from *.py, these won't be written by
> standard setuptools, and recipes can do it themselves to work around
> specific issues if needed.
>=20
> Remove obsolete vardepsexclude of MACHINE on do_install, as that variable
> isn't referenced.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
>=20
> fixup! setuptools3.bbclass: clean up

That last line looks like some leftover from rebasing?

> ---
>  meta/classes/setuptools3.bbclass | 34 +-------------------------------
>  1 file changed, 1 insertion(+), 33 deletions(-)
>=20
> diff --git a/meta/classes/setuptools3.bbclass
> b/meta/classes/setuptools3.bbclass
> index 564996c556..1b1a8aac76 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -4,13 +4,6 @@ inherit setuptools3-base pip_install_wheel
>  #B =3D "${WORKDIR}/build"
>=20
>  SETUPTOOLS_BUILD_ARGS ?=3D ""
> -SETUPTOOLS_INSTALL_ARGS ?=3D "--root=3D${D} \
> -    --prefix=3D${prefix} \
> -    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=3D${datadir}"
> -
> -SETUPTOOLS_PYTHON =3D "python3"
> -SETUPTOOLS_PYTHON:class-native =3D "nativepython3"
>=20
>  SETUPTOOLS_SETUP_PATH ?=3D "${S}"
>=20
> @@ -24,42 +17,17 @@ setuptools3_do_compile() {
>          STAGING_INCDIR=3D${STAGING_INCDIR} \
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
> -        bdist_wheel ${SETUPTOOLS_BUILD_ARGS} || \
> +        bdist_wheel --verbose ${SETUPTOOLS_BUILD_ARGS} || \
>          bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUI=
LD_ARGS}' execution failed."

Why all the backslashes? This is bitbake, not make. ;)

>  }
>  setuptools3_do_compile[vardepsexclude] =3D "MACHINE"
>  do_compile[cleandirs] +=3D "${SETUPTOOLS_SETUP_PATH}/dist"
>=20
>  setuptools3_do_install() {
> -        cd ${SETUPTOOLS_SETUP_PATH}
> -
>          pip_install_wheel_do_install
> -
> -        # support filenames with *spaces*
> -        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
> -                               -exec sed -i -e s:${D}::g {} \;
> -
> -        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> -            if [ -f "$i" ]; then
> -                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${SETUPTOOLS_PY=
THON}:g $i
> -                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> -            fi
> -        done
> -
> -        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> -
> -        #
> -        # FIXME: Bandaid against wrong datadir computation
> -        #
> -        if [ -e ${D}${datadir}/share ]; then
> -            mv -f ${D}${datadir}/share/* ${D}${datadir}/
> -            rmdir ${D}${datadir}/share
> -        fi
>  }
> -setuptools3_do_install[vardepsexclude] =3D "MACHINE"
>=20
>  EXPORT_FUNCTIONS do_configure do_compile do_install
>=20
>  export LDSHARED=3D"${CCLD} -shared"
>  DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
> -
> --
> 2.25.1

//Peter


