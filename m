Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2FDE9A75A
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:12:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16517.1774347149998149356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FJGAGTF4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D8334E427BB;
	Tue, 24 Mar 2026 10:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 307096011D;
	Tue, 24 Mar 2026 10:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB9AF104511B3;
	Tue, 24 Mar 2026 11:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774347146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QJ+UjclRMTIP+EEXl9U3/8ON6humDHnEVvl6pp4G9K8=;
	b=FJGAGTF4VxlJ6yleMazolf7FWD8jmVSkBR0zuP+QT4pkypAyYbl9XLaY7dE6TpummNcWyR
	w5s+AwDMbTtUvG+Znyn/cKjbUcreFlX0JQ3fQ5zizi/tfScudnP5Z5P4nKqkGNFFfbwYKh
	SSopJIArbWaaz15lyyxlv/fvdLIn4YLgdr0SOpkxBuSC4gENXuN/FvkW22MIz0dIWT1bsT
	kPaK8IyWY0HjrjnSswYTXN3WPbNSfHbQQsSoDzRSTlZ6dsxc3q7LKlnZrTczWjUuK6coJc
	Q5Fk66U5mzy/A+K4ZMKCbDrA8mnRwK2XfbjUjn9IzJjKTfet0VTYEdmjOCANbA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Antonin Godard <antonin.godard@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com,
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com,
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [PATCH v7 1/2] sbom-cve-check: Add class for post-build CVE analysis
Date: Tue, 24 Mar 2026 11:12:23 +0100
Message-ID: <3362783.5fSG56mABF@brobin-bootlin>
In-Reply-To: <DHAWHQYPBPQA.6MRY3SGOMM9Z@bootlin.com>
References: 
 <20260323-add-sbom-cve-check-v7-0-870eb8e145ad@bootlin.com>
 <20260323-add-sbom-cve-check-v7-1-870eb8e145ad@bootlin.com>
 <DHAWHQYPBPQA.6MRY3SGOMM9Z@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233781

Hi,

On Tuesday, March 24, 2026 at 10:21=E2=80=AFAM, Antonin Godard wrote:
> Hi,
>=20
> Thanks for the new version. I'll suggest a simplification to how the data=
bases
> are unpacked, since I understand this is a costly operation.
>=20
> This gets rid of the do_install() task, and rsync-native dependency. What=
 this
> does is let the BitBake fetcher handle the unpacking/checkout of the data=
bases
> directly in the DEPLOYDIR. This simplifies the recipe and removes one copy
> operation, I think.

Thank you Antonin for this suggestion, really good idea.
This is a bit simpler and faster, and should be completely safe.

I am going to send a v8 with these changes after running various tests.

The only thing left to have something way faster (for the initial build)
would be to have a true support of shallow clone that can be updated.
But this will be implemented later :)

> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-d=
b.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db
> .inc
> index 5d7a07001c..6a968e941c 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
> @@ -9,13 +9,12 @@ require sbom-cve-check-config.inc
>  SBOM_CVE_CHECK_DB_NAME[doc] =3D "Database name, which is the Git reposit=
ory directory name. \
>      The git repository will be stored in ${SBOM_CVE_CHECK_DEPLOY_DB_DIR)=
/"
>=20
> -DEPENDS +=3D "rsync-native"
> -ALLOW_EMPTY:${PN} =3D "1"
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
>=20
> -# In the install task, also deploy directly to ${DEPLOY_DIR} using rsync.
> -# This is an hack, we are not using do_deploy to prevent multiple unnece=
ssary copy of the CVE database.
> -do_install() {
> -    dst=3D"${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
> -    mkdir -p "$dst"
> -    rsync -aH --delete --link-dest=3D"${S}/" "${S}/" "${dst}/"
> -}
> +UNPACKDIR =3D "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}"
> +S =3D "${UNPACKDIR}"
> +BB_GIT_DEFAULT_DESTSUFFIX =3D "${SBOM_CVE_CHECK_DB_NAME}"


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




