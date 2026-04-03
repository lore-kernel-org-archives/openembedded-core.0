Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986CCD6AAFC
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:24:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7331.1775204683478566326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mz7TJ1Bs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 028B41A311A
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 08:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD7F8603C1;
	Fri,  3 Apr 2026 08:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E620710450F5D;
	Fri,  3 Apr 2026 10:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204681; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X0PzSyJ665nLQEzaYgLQFFw64HoXPWM7ZoU9ojQoVX0=;
	b=mz7TJ1BsCIgiXd22hsUN+nodRXQKfCJwwIyDrXqD6QH7mI/ULu4rGyps2Uptwzc05BK43I
	Neek/yF3PoQhyH/vrvwFmaE4hQofDc6+a2HsvTRqdK70duTeJb8TbNwHGl1U/HOQVf88Rw
	Xxgwic9AV5NMkTgOhgKa2n9mQTsPLp1Zw1CALnTTIPnMGKbm5IavSrtXlRyv64cD/WN9Eb
	YrpgbPoe8ytHIAzRB44ERJQTwDCzaXRRoYw9ARSU1EhLlDi5TDONDQ3spyv0LxxzO8ILxw
	fregCA0hvI58TF02kWWKpQCaXU/o7LvNz4Yr+xEk3Rt0fqACXzcvCLzw4f7oTw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>
Subject: 
 Re: [RFC PATCH 3/3] sbom-cve-check: add prototype recipe scanning task
Date: Fri, 03 Apr 2026 10:24:39 +0200
Message-ID: <1813900.QkHrqEjB74@brobin-bootlin>
In-Reply-To: <20260402162510.1945892-3-ross.burton@arm.com>
References: 
 <20260402162510.1945892-1-ross.burton@arm.com>
 <20260402162510.1945892-3-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234564

On Thursday, April 2, 2026 at 6:25=E2=80=AFPM, Ross Burton wrote:
> Add a new task, sbom_cve_check_recipe, that will do a CVE scan of the
> SPDX for the specified recipe.
>=20
> This is mainly useful for top-level or aggregration packages (e.g.
> meta-world-recipe-sbom) as it follows dependencies, so running it on a
> single package (e.g. curl) will also show CVEs for its dependencies
> (e.g. zlib).
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/sbom-cve-check.bbclass | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/meta/classes/sbom-cve-check.bbclass b/meta/classes/sbom-cve-=
check.bbclass
> index fef6f0c2aa..fc89ab9799 100644
> --- a/meta/classes/sbom-cve-check.bbclass
> +++ b/meta/classes/sbom-cve-check.bbclass
> @@ -94,6 +94,9 @@ def run_sbom_cve_check(d, recipe_name, link_name=3DNone=
):
>              update_symlinks(export_file, export_link)
> =20
> =20
> +#
> +# Scan the SBOM of an image.
> +#
>  python do_sbom_cve_check() {
>      """
>      Task: Run sbom-cve-check analysis on SBOM.
> @@ -119,3 +122,29 @@ python do_sbom_cve_check_setscene() {
>      sstate_setscene(d)
>  }
>  addtask do_sbom_cve_check_setscene
> +
> +
> +#
> +# Scan the SBOM of a recipe.
> +#
> +
> +python do_sbom_cve_check_recipe() {
> +    recipe =3D d.getVar("SPDX_RECIPE_SBOM_NAME")
> +    run_sbom_cve_check(d, recipe)

Call run_sbom_cve_check() with the path of the SPDX3 SBOM file that needs
to be analyzed.

> +}
> +
> +addtask do_sbom_cve_check_recipe after do_create_recipe_sbom
> +
> +SSTATETASKS +=3D "do_sbom_cve_check_recipe"
> +do_sbom_cve_check_recipe[cleandirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"
> +do_sbom_cve_check_recipe[sstate-inputdirs] =3D "${SBOM_CVE_CHECK_DEPLOYD=
IR}"
> +do_sbom_cve_check_recipe[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
> +do_sbom_cve_check_recipe[depends] +=3D " \
> +    python3-sbom-cve-check-native:do_populate_sysroot \
> +    sbom-cve-check-update-cvelist-native:do_unpack \
> +    sbom-cve-check-update-nvd-native:do_unpack \

Maybe we should create a variable that contains the list of
sbom-cve-check-update-* database recipes dependencies. This way if an user
want to add a database, it could do it easily, and it does not need to
duplicate the configuration.

So I am proposing something like that:

SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?=3D " \
   sbom-cve-check-update-cvelist-native:do_unpack \
   sbom-cve-check-update-nvd-native:do_unpack \
"

do_sbom_cve_check_recipe[depends] +=3D " \
   python3-sbom-cve-check-native:do_populate_sysroot \
   ${SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES} \
"


> +"
> +python do_sbom_cve_check_recipe_setscene() {
> +    sstate_setscene(d)
> +}
> +addtask do_sbom_cve_check_recipe_setscene
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




