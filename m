Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71325D116F2
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:19:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7277.1775204349567670706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bJPaWfX4;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1525FC59F5E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 08:19:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F0F4603C1;
	Fri,  3 Apr 2026 08:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67AD31045013D;
	Fri,  3 Apr 2026 10:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204346; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jUUfTVPjqB66ywVik94/ISzAoCPtfLaCdcVq/zVe4WE=;
	b=bJPaWfX4vCvutX4a9Kl7lWL28jWUO8lizuadv9V2YRBwOuHSliF7C3iPuCwkOh1Q+FJfbZ
	KyG7pLUbB1q4cPybqMPwI+6/8RHV00WbJbgiYSISNFYOH1j0uehLt2pY6RwufQhAfAPxRa
	6ZsffHfe9WxhL7cykL4Q+Bubxrg/SdUVDfJe+dSp+T55sEanMuomOj/fkmDfy1+nht1/KE
	eeFEDNRQRUBEo4Efo2Y7z6wru1xNVwbqd4DM0bO92ICdrZbdjZ8cSusQM+zZgtdVZAykFF
	O9PnPMfTba4z/eQNKYIrkuhZBzo2Qy+a1h+wBpAM5+6yVugazCjWPaKC/WotgA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>
Subject: Re: [RFC PATCH 1/3] sbom-cve-check: refactor do_sbom_cve_check
Date: Fri, 03 Apr 2026 10:19:05 +0200
Message-ID: <40351709.10thIPus4b@brobin-bootlin>
In-Reply-To: <20260402162510.1945892-1-ross.burton@arm.com>
References: <20260402162510.1945892-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234563

Hello Ross,

I have seen that you have made various previous improvement to the
sbom-cve-check class. Thank you!
Don't hesitate to always add me in CC. Sometime I am quite busy, and I
may miss the exchange in the mailing list.

=46or this RFC, I am overall OK with it. There are few thing that needs
to be fixed/improved.

On Thursday, April 2, 2026 at 6:25=E2=80=AFPM, Ross Burton wrote:
> Extract the bulk of the logic to a separate function, so the task just
> has to pass a few variables.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/sbom-cve-check.bbclass | 29 +++++++++++++---------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
> index 4abc427c58..fef6f0c2aa 100644
> --- a/meta/classes-recipe/sbom-cve-check.bbclass
> +++ b/meta/classes-recipe/sbom-cve-check.bbclass
> @@ -43,28 +43,24 @@ SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export config=
uration to generate a human-r
>  SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
>  SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
> =20
> -python do_sbom_cve_check() {
> -    """
> -    Task: Run sbom-cve-check analysis on SBOM.
> -    """
> +
> +def run_sbom_cve_check(d, recipe_name, link_name=3DNone):

Maybe rename the parameters to: export_base_name and export_link_name?
Another parameter is needed (I guess), the path to the SPDX3 SBOM that needs
to be analyzed.

>      import os
>      import bb
> -    from oe.cve_check import update_symlinks

Do you know why you did remove this import?
It is not necessary? Who import it globally (it this is the case)?

> =20
>      if not bb.data.inherits_class("create-spdx-3.0", d):
> -        bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 =
inherit.")
> +        bb.fatal("Cannot execute sbom-cve-check: missing create-spdx-3.0=
 inherit.")
> =20
> -    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
> +    image_deploy_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
> +    sbom_path =3D d.expand(f"{image_deploy_dir}/{recipe_name}.spdx.json")
>      dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
> -    deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
> -    img_link_name =3D d.getVar("IMAGE_LINK_NAME")
> -    img_name =3D d.getVar("IMAGE_NAME")
> +    out_deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
> =20
>      export_files =3D []
>      for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
>          export_ext =3D d.getVarFlag(export_var, "ext")
> -        export_path =3D f"{deploy_dir}/{img_name}{export_ext}"
> -        export_link =3D f"{deploy_dir}/{img_link_name}{export_ext}"
> +        export_path =3D f"{out_deploy_dir}/{recipe_name}{export_ext}"
> +        export_link =3D f"{out_deploy_dir}/{link_name}{export_ext}" if l=
ink_name else None
>          export_type =3D d.getVarFlag(export_var, "type")
>          export_files.append((export_type, export_path, export_link))
> =20
> @@ -96,6 +92,15 @@ python do_sbom_cve_check() {
>          bb.note(f"sbom-cve-check exported: {export_file}")
>          if export_link:
>              update_symlinks(export_file, export_link)
> +
> +
> +python do_sbom_cve_check() {
> +    """
> +    Task: Run sbom-cve-check analysis on SBOM.
> +    """
> +    image_name =3D d.getVar("IMAGE_NAME")
> +    link_name =3D d.getVar("IMAGE_LINK_NAME")
> +    run_sbom_cve_check(d, image_name, link_name, sbom_path)

Here you pass the path to the SBOM, which is (I think) a good idea,
but the variable sbom_path is not declared here.

>  }
> =20
>  addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_build
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




