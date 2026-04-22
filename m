Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A06F94CD6
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:53:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73028.1776840813267129316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mfYFIDoe;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 32AB44E42AA2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:53:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A4B3600DD
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:53:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3655110460B43;
	Wed, 22 Apr 2026 08:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776840810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0GjXjOXtW1dx92qiE7W/wjz7Eo5jT2tD2eQC6SzlXsQ=;
	b=mfYFIDoeMGdbKB1Z0vunJAVKt5pK3wpxrQ8ddDGX7tC1/3OJAMX4XJyQflh+SzU1Q/gnGM
	2b15VPfZVnzlX80ZhUp7sF+VYOzXb+WfklWvw17pDOgkVTf68ib0P5XR7XQlh8BMt48MnP
	7JRXi5c2is9SREgfHjq8sIQAjSHzdvrUCzH3JmoJT2JQ6S8y6eUPtY6jJAsKBN5ZJI9tuI
	LDrxFyV4UKWbUnT6+XWsdsWZVjn1nLP23lTIurgXNUlWKltGTc1yjdJBNHKrgHt+6YcQT4
	/u4Z4CBnnmxBdismvwp6bA/pmpwUJSmsQm9JMBQYI3dqJ4d7zTNtbquNZptcWA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: 
 Re: [PATCH v2] sbom-cve-check-common: print warnings on unpatched CVEs
Date: Wed, 22 Apr 2026 08:53:29 +0200
Message-ID: <53NyEVGwRGarcYy4JYMYFw@bootlin.com>
In-Reply-To: <20260421-sbom-cve-check-warnings-v2-1-79ae1d2395be@bootlin.com>
References: <20260421-sbom-cve-check-warnings-v2-1-79ae1d2395be@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235697

Hello Antonin,

Looks good to me. I have just a slight suggestion.

On Tuesday, April 21, 2026 at 3:01=E2=80=AFPM, Antonin Godard wrote:
> The now removed cve-check class used to print warnings when CVEs with
> status "Unpatched" were found. Add this feature to the
> sbom-cve-check class with the same default value (enabled).
>=20
> For now it only does so when the cvecheck report type is enabled. It may
> be possible to do the same for the SPDX report type.
>=20
> Sample output:
>=20
> WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: busybox-1.37.0: Fou=
nd unpatched CVEs: CVE-2024-58251
> WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: expat-2.7.5: Found =
unpatched CVEs: CVE-2025-66382, CVE-2026-41080
> WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: glibc-2.43+git: Fou=
nd unpatched CVEs: CVE-2010-4756, CVE-2026-4046
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Apply suggestions from Paul
> - Link to v1: https://patch.msgid.link/20260421-sbom-cve-check-warnings-v=
1-1-df7861a0a0bc@bootlin.com
> ---
>  meta/classes/sbom-cve-check-common.bbclass | 30 ++++++++++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sb=
om-cve-check-common.bbclass
> index 6963ad71c61..32c29a0ec2c 100644
> --- a/meta/classes/sbom-cve-check-common.bbclass
> +++ b/meta/classes/sbom-cve-check-common.bbclass
> @@ -48,6 +48,32 @@ SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?=3D " \
>      sbom-cve-check-update-nvd-native:do_patch \
>  "
> =20
> +SBOM_CVE_CHECK_SHOW_WARNINGS ?=3D "1"
> +SBOM_CVE_CHECK_SHOW_WARNINGS[doc] =3D "Show warning messages when unpatc=
hed CVEs are found. \
> +Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
> +
> +def show_warnings_from_file(cvecheck_export_file):
> +    import json
> +
> +    try:
> +        with open(cvecheck_export_file, "r") as f:
> +            report =3D json.load(f)
> +    except (json.JSONDecodeError, UnicodeDecodeError) as e:
> +        bb.error(f"Failed to open JSON report file {f}: {e}")
> +        return
> +
> +    packages =3D report.get("package", [])
> +    for package in packages:
> +        unpatched =3D []
> +        cves =3D package.get("issue", [])
> +        for cve in cves:
> +            if cve["status"] =3D=3D "Unpatched":
> +                unpatched.append(cve["id"])

A more Pythonic way of writing that is:

       for package in packages:
           cves =3D package.get("issue", [])
           unpatched =3D [cve["id"] for cve in cves if cve["status"] =3D=3D=
 "Unpatched"]

> +        if unpatched:
> +            pname =3D package["name"]
> +            version =3D package["version"]
> +            bb.warn(f"{pname}-{version}: Found unpatched CVEs: {', '.joi=
n(unpatched)}")
> +
>  def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=
=3DNone):
>      import os
>      import bb
> @@ -94,9 +120,13 @@ def run_sbom_cve_check(d, sbom_path, export_base_name=
, export_link_name=3DNone):
>          bb.error(f"sbom-cve-check failed: {e}")
>          return
> =20
> +    show_warnings =3D bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_=
WARNINGS"))
> +
>      for export_type, export_file, export_link in export_files:
>          bb.note(f"sbom-cve-check exported: {export_file}")
>          if export_link:
>              update_symlinks(export_file, export_link)
> +        if show_warnings and export_type =3D=3D d.getVarFlag("SBOM_CVE_C=
HECK_EXPORT_CVECHECK", "type"):
> +            show_warnings_from_file(export_file)
> =20
> =20
>=20
> ---
> base-commit: 9a83f0878b6bacbc7b322cfec076b4e79ad7b8fb
> change-id: 20260421-sbom-cve-check-warnings-408de9776bc0
>=20
>=20
>=20
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




