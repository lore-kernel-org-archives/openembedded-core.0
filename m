Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A954FEC01C4
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:29:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13998.1774261755933185862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AzhcMxtb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D9D774E427AE;
	Mon, 23 Mar 2026 10:29:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91FEF5FEF6;
	Mon, 23 Mar 2026 10:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AE05103720F2;
	Mon, 23 Mar 2026 11:29:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774261752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TlY66sm0r9jy2PsmnukvFQkcQ0XqIKnc2Sy+Py9fIDI=;
	b=AzhcMxtbmEBWauSaAU009LdfdPRBsz72nqIXczhBn92AMhhcRZMiUIeaZtKWlXPkeZJelY
	CCyvKN3bme1c4KC9wen4KTVLmIZnnQnJdoZCy82s4dSLbdlIZrtkVogZ+l8tzDATBkJV1y
	hb7UOGB/wiA/O4muoZ0AhI4+OW3QHuZY0tHZh0iViK4FHxuLMoT3fCP3TC+A2ucheq2eTx
	wdOTopoRu1ONQ0XtT+JQkTZHzruB1jdu8KL3kzE+BO+JPfrDFznHUaFJv9kU7E20Xezg01
	VeXpYbawP8TcGzmG686qOAg3maqc9HOMI1Cwhm0OENu34E5IyjKSUzhhte3bYQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Antonin Godard <antonin.godard@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com,
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com,
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v6] sbom-cve-check: Add class for post-build CVE analysis
Date: Mon, 23 Mar 2026 11:29:09 +0100
Message-ID: <3066728.e9J7NaK4W3@brobin-bootlin>
In-Reply-To: <DHA0QE0OIQWS.27293QOT1ZJFK@bootlin.com>
References: 
 <20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com>
 <20260319-add-sbom-cve-check-v6-1-cfc657daa6b7@bootlin.com>
 <DHA0QE0OIQWS.27293QOT1ZJFK@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233710

Hello Antonin,

Thank you for the review.

On Monday, March 23, 2026 at 9:28=E2=80=AFAM, Antonin Godard wrote:
> Hi,
>=20
> Some suggestions and questions I picked while reviewing this patch.
>=20
> On Thu Mar 19, 2026 at 4:42 PM CET, Benjamin Robin wrote:
> > By default, the sbom-cve-check class generates these export files:
> >  - A JSON in `cve-check` format, named `${IMAGE_NAME}.cve-check.json`
> >  - An SPDX 3.0 SBOM, named `${IMAGE_NAME}.cve-check.spdx.json`.
> >
> > A user can add or remove export file formats by using the
> > `SBOM_CVE_CHECK_EXPORT_VARS` variable.
> >
> > By default, the CVE databases are downloaded using the following
> > recipes:
> >  - sbom-cve-check-update-cvelist-native.bb
> >  - sbom-cve-check-update-nvd-native.bb
> >
> > The database fetch and deploy logic is implemented in
> > sbom-cve-check-update-db.inc. The CVE databases are stored in the
> > download directory (`DL_DIR`) by default. This can be configured by
> > the `SBOM_CVE_CHECK_DATABASES_DIR` variable defined in
> > meta/recipes-core/meta/sbom-cve-check-config.inc.
>=20
> Yet the default definition is:
>=20
> SBOM_CVE_CHECK_DATABASES_DIR ??=3D "${DEPLOY_DIR}/sbom_cve_check/database=
s"
>=20
> Which does not point to the DL_DIR? The commit message seems a bit mislea=
ding.

In the v7 this is going to be fixed.
=20
> > diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-=
recipe/sbom-cve-check.bbclass
> > new file mode 100644
> > index 000000000000..32f92a0bab29
> > --- /dev/null
> > +++ b/meta/classes-recipe/sbom-cve-check.bbclass
> > @@ -0,0 +1,121 @@
> > +# SPDX-License-Identifier: MIT
> > +
> > +# To enable this class, it is recommended to add this to local.conf
> > +# OE_FRAGMENTS +=3D "core/yocto/sbom-cve-check"
>=20
> I'd rather recommend the tool normally used to manage fragments, which mo=
difies
> toolcfg.conf, made for this purpose.
>=20
> ```
> # It is recommended to enable this class through the sbom-cve-check fragm=
ent:
> # bitbake-config-build enable-fragment sbom-cve-check
> ```

I improved the comment, but I kept the original explanation.
=46or example this could be useful for writing KAS configuration.


> > +
> > +require recipes-core/meta/sbom-cve-check-config.inc
> > +
> > +SBOM_CVE_CHECK_DEPLOYDIR =3D "${WORKDIR}/sbom_cve_check/image-deploy"
>=20
> Nitpick, but why use underscore for "sbom_cve_check"? Here, and in the ot=
her
> places in this patch. Using "sbom-cve-check" everywhere would perhaps be =
more
> coherent?

I standardized all directory names, it should be named with dash now.

> > +SBOM_CVE_CHECK_EXTRA_ARGS[doc] =3D "Allow to specify extra arguments t=
o sbom-cve-check. \
> > +    For example to add export flags for filtering (e.g., only export v=
ulnerable CVEs). \
> > +"
> > +SBOM_CVE_CHECK_EXTRA_ARGS ??=3D ""
> > +
> > +SBOM_CVE_CHECK_EXPORT_VARS[doc] =3D "List of variables that declare ex=
port files to generate. \
> > +    Each variable must have a 'type' and an 'ext' flag set. \
> > +    The 'type' flag contains the value that is passed to the --export-=
type command flags. \
> > +    The 'ext' flag contains the filename extension (suffix). The outpu=
t filename is going \
> > +    to be ${IMAGE_NAME}${ext} \
> > +"
> > +SBOM_CVE_CHECK_EXPORT_VARS ?=3D "SBOM_CVE_CHECK_EXPORT_SPDX3 SBOM_CVE_=
CHECK_EXPORT_CVECHECK"
> > +
> > +SBOM_CVE_CHECK_EXPORT_SPDX3[doc] =3D "Export configuration to generate=
 an SPDX3 SBOM file, \
> > +    with the following name: ${IMAGE_NAME}.cve-check.spdx.json \
> > +"
> > +SBOM_CVE_CHECK_EXPORT_SPDX3[type] ?=3D "spdx3"
> > +SBOM_CVE_CHECK_EXPORT_SPDX3[ext] ?=3D ".cve-check.spdx.json"
> > +
> > +SBOM_CVE_CHECK_EXPORT_CVECHECK[doc] =3D "Export configuration to gener=
ate a JSON manifest \
> > +    in the same format as the cve-check class, with the following name=
: \
> > +    ${IMAGE_NAME}.cve-check.json \
> > +"
> > +SBOM_CVE_CHECK_EXPORT_CVECHECK[type] ?=3D "yocto-cve-check-manifest"
> > +SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?=3D ".cve-check.json"
>=20
> As I understand it, these represent the different kinds of outputs of
> sbom-cve-check. Wouldn't these make more sense as:
>=20
> SBOM_CVE_CHECK_EXPORT_SPDX3[ext] ?=3D ".sbom-cve-check.spdx.json"
> SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?=3D ".sbom-cve-check.yocto.json"
>=20
> first item indicates that this is an sbom-cve-check generated file,
> second item denotes the format of the file : either spdx3, or the yocto s=
pecific
> one.

Yeah you are write, it is clearer this way, despite the fact that is it
a bit longer.

> > diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/=
fragments/yocto/sbom-cve-check.conf
> > new file mode 100644
> > index 000000000000..a3f229acf28a
> > --- /dev/null
> > +++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
> > @@ -0,0 +1,14 @@
> > +BB_CONF_FRAGMENT_SUMMARY =3D "This fragment enables sbom-cve-check wit=
h recommended default options"
> > +BB_CONF_FRAGMENT_DESCRIPTION =3D "Enables sbom-cve-check and applies t=
he following configurations: \
> > + - Adds the sbom-cve-check class to IMAGE_CLASSES. \
> > + - Configures CVE database recipes to fetch the latest git revision us=
ing AUTOREV. \
> > + - Ensures generated SBOM includes all CVE annotations. \
> > + - Configures the Linux kernel recipe to provide compiled sources, \
> > +   allowing CVEs to be excluded if the source is not compiled. \
> > +"
> > +
> > +IMAGE_CLASSES:append =3D " sbom-cve-check"
> > +SRCREV:pn-sbom-cve-check-update-nvd-native =3D "${AUTOREV}"
> > +SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "${AUTOREV}"
> > +SPDX_INCLUDE_VEX =3D "all"
> > +SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
>=20
> Could we also set SBOM_CVE_CHECK_ALLOW_NETWORK to 1 here? Since we already
> require network with AUTOREV anyway.

The do_sbom_cve_check task does not need network by default.
It is only needed if the user want to fetch additional databases, for
example annotation databases.

> > diff --git a/meta/recipes-core/meta/sbom-cve-check-config.inc b/meta/re=
cipes-core/meta/sbom-cve-check-config.inc
> > new file mode 100644
> > index 000000000000..a1a909e22250
> > --- /dev/null
> > +++ b/meta/recipes-core/meta/sbom-cve-check-config.inc
>=20
> This file and others could be in a more appropriate directory, such are
> recipes-devtools/sbom-cve-check/? I think in a patch review call we said =
that
> this directory was wrongly used for the previous cve-check-related recipe=
s (you
> weren't in this call IIRC).

This is going to be fixed in the v7 series: The recipes are moved to
recipes-devtools/sbom-cve-check/.

> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: MIT
> > +
> > +SBOM_CVE_CHECK_DATABASES_DIR ??=3D "${DEPLOY_DIR}/sbom_cve_check/datab=
ases"
>=20
> I think there is already "${DEPLOY_DIR}/cve" used by cve-check and vex, m=
aybe
> you could re-use this path as:
>=20
> SBOM_CVE_CHECK_DATABASES_DIR ??=3D "${DEPLOY_DIR}/cve/sbom_cve_check/data=
bases"
>=20
> to avoid creating a new directory in DEPLOY_DIR?

I really think this is a bad idea. The ${DEPLOY_DIR}/cve/ directory contains
a lot of json file at the root of this directory. I really do not want to
break existing VEX and/or cve-check tasks.

> > +SBOM_CVE_CHECK_DATABASES_DIR[doc] =3D "Download directory path where t=
o store the CVE databases"
> > diff --git a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-nativ=
e.bb b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
> > new file mode 100644
> > index 000000000000..ce204db6c51a
> > --- /dev/null
> > +++ b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY =3D "Updates the CVE List database"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade69=
8e0bcf8506ecda2f7b4f302"
> > +
> > +HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
> > +SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;p=
rotocol=3Dhttps"
> > +SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
> > +
> > +# 2026-03-19_baseline
> > +SRCREV =3D "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
> > +
> > +require sbom-cve-check-update-db.inc
> > diff --git a/meta/recipes-core/meta/sbom-cve-check-update-db.inc b/meta=
/recipes-core/meta/sbom-cve-check-update-db.inc
> > new file mode 100644
> > index 000000000000..5ecb79820247
> > --- /dev/null
> > +++ b/meta/recipes-core/meta/sbom-cve-check-update-db.inc
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: MIT
> > +
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +EXCLUDE_FROM_WORLD =3D "1"
> > +
> > +inherit native
> > +require sbom-cve-check-config.inc
> > +
> > +SBOM_CVE_CHECK_DB_NAME[doc] =3D "Database name, which is the Git repos=
itory directory name. \
> > +    The git repository will be stored in ${SBOM_CVE_CHECK_DATABASES_DI=
R)/"
> > +
> > +DEPENDS +=3D "rsync-native"
> > +
> > +# Leverage BitBake's checksum computation for populated sysroot files =
to determine
> > +# whether other recipe tasks dependent on this output need to be re-ex=
ecuted.
> > +do_compile() {
> > +    git -C "${S}" rev-parse --verify "HEAD^{object}" > "${WORKDIR}/${S=
BOM_CVE_CHECK_DB_NAME}.rev"
>=20
> We're in do_compile(), so you can store the output file in ${B}?
>=20
> git -C "${S}" rev-parse --verify "HEAD^{object}" > "${B}/${SBOM_CVE_CHECK=
_DB_NAME}.rev"

This part is going to be removed since it is no longer necessary.

> > +}
> > +
> > +# In the install task, also deploy directly to ${DEPLOY_DIR} using rsy=
nc.
> > +# This is an hack, we are not using do_deploy to prevent multiple unec=
essary copy of the CVE database.
> > +do_install() {
> > +    install -m 644 -D -t "${D}${datadir}/sbom_cve_check/databases/" "$=
{WORKDIR}/${SBOM_CVE_CHECK_DB_NAME}.rev"
> > +
> > +    dst=3D"${SBOM_CVE_CHECK_DATABASES_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
> > +    mkdir -p "$dst"
> > +    rsync -aH --delete --link-dest=3D"${S}/" "${S}/" "${dst}/"
> > +}
>=20
> Why do we need this in both ${datadir} and the deploy dir? Isn't
> sbom-cve-check only using the one in the deploy dir? Was this done to cre=
ate a
> package out of these recipes? If we don't really need one we could use
> ALLOW_EMPTY:${PN} =3D "1" instead?

Indeed, we could do that, and in this case the do_sbom_cve_check task should
depend on the do_install task. I am going to use ALLOW_EMPTY on this v7
series.

> > diff --git a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb=
 b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
> > new file mode 100644
> > index 000000000000..46c86952a164
> > --- /dev/null
> > +++ b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY =3D "Updates the NVD CVE database"
> > +LICENSE =3D "cve-tou"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/cve-tou.md;md5=3Dbc5bbf146f01e20=
ece63d83c8916d8fb"
> > +
> > +HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
> > +SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=
=3Dmain;protocol=3Dhttps"
> > +SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
> > +
> > +# v2026.03.19-010002
> > +SRCREV =3D "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
> > +
> > +require sbom-cve-check-update-db.inc

Thanks,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




