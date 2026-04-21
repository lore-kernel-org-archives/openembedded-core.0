Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5160AF8925D
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 11:08:58 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23194.1776769728489994119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 04:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=dK1fSd6r;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=rpbPYb3P;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A28F51400079;
	Tue, 21 Apr 2026 07:08:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 21 Apr 2026 07:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776769727; x=1776856127; bh=wY2uAmAPuE
	j6eRQl4NC1jEJQWI/EYnA/63WsdtAvHuM=; b=dK1fSd6rMjlxPJj+0VMBJMNcKu
	SOzBcT0RtKvbGXlgur0WGZEPsTsaT1OAg2UbUy4aS8gQ5TkdPvkOCsHLOmdK5T0i
	onFoSGIW/Im0GJM2PH4fI7FCViTun76Lyb3ilq8dZmnAclzhUBL+l48Y1a80LEf2
	6D0BwL4qvttAr1lAWUjmi5Fe6dJI3PjWcHrr6Mgq6gSzF1Ezx3j7wS3kD+VQ21xn
	HNpY+9P3+mA+9UaShz/pjJ4Ei/CxvQNYFoFQFd6cgS8byD2lentUvvsatH7HOUi7
	tVWJpRo7tkOx0ikc9cz5o2J2qFcJAt+O8FKCeMjHILz2Xj9yVCq2yud9WN+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776769727; x=1776856127; bh=wY2uAmAPuEj6eRQl4NC1jEJQWI/EYnA/63W
	sdtAvHuM=; b=rpbPYb3PGdMh3EyoGyjOANbe4OO0fYbvBwFFbGQB1yYMKnsjC6I
	P95FK4h9eASVjekbgV4g+fX8NcMyCVbYgHO3nP4duIn0YuTV3DVGDhaG+mbZIEhJ
	wKlZBsAfd1RJH6LjgKcoOqQaWbNKxN/s+wWFqByPX7SnsXXc2gg8OoDyyXmRpHnR
	GW8TBlYmKWqUCOQh6Oh4qBb/dM1RI83ZrVHndhEBKvwbT/CcMGE3Xf/H7jt/bruG
	sMySxwq/GYF8gR/Gwfm0Xgaq7VuOCnMOJ+493ebOIrJMPvVkGQof5XzU4AGxNam9
	prziqViU7s9nT5hIHw0ISl4YZJz03NPUtag==
X-ME-Sender: <xms:v1rnaSOr6Xt3OPUMqPgDQFt7_f0z20nuu7Tubc4Pd9ZEVTWReLYsPg>
    <xme:v1rnaYZHVYJVL5mAyDxItRFrjM6HJe5W_xWbWDfc1LL6PtFnHlBcAtrwVzp4D9ikR
    FK3-7JzdPtjmVECCkFruPgJmYG1kWOo4mQHrMWqXcWdFF1BMLcFKVI>
X-ME-Received: <xmr:v1rnaWrgl3QiLwZjNLCQ1TTjyeCHtJ-l20X4D5gXainmKRpF-n-L5wbnasvMq8xZ9_3TCiATlF2RuhoBb3OzmOWIAuL43XxH-NcyxcfyO_4m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiuddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    etffeiudejjeefvdeileeltddvvdejtdegtdehjeekkeetueehhfdtvddvtdfhffenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhuthhilhhsrdhtohenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgs
    rghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhr
    tghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvg
    hmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhi
    segsohhothhlihhnrdgtohhm
X-ME-Proxy: <xmx:v1rnacZMzM7QJjvQzBNdeaRQ1Tf97U_7ReXuXxcXJOe1x0w278nuLw>
    <xmx:v1rnaeQP4H7ObXH-wf8gyt1weDMVIH3d_CBYMCR1-qbM2kaHQ3vfoQ>
    <xmx:v1rnaT4db7wVuNmebpeOc-mPF1CpwSjV31gq6Zk38Fr6cldKcOL9Hw>
    <xmx:v1rnaTwxkDaF47I41i_QDrq3-nOB6KP0WAuGAB9HfpsCGrovPFw76A>
    <xmx:v1rnaXy1PUJDeXTewjgR_Qzd4aQzoPCHKbWmjuDTylOmonI1h1qptRJB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Apr 2026 07:08:46 -0400 (EDT)
Message-ID: <9369197a4e7f2d032decc797406ecba201fe6799.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] sbom-cve-check-common: print warnings on
 unpatched CVEs
From: Paul Barker <paul@pbarker.dev>
To: antonin.godard@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2026 12:08:43 +0100
In-Reply-To: <20260421-sbom-cve-check-warnings-v1-1-df7861a0a0bc@bootlin.com>
References: <20260421-sbom-cve-check-warnings-v1-1-df7861a0a0bc@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-G53mS4+YrT0AtSrEa1ga"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 11:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235670


--=-G53mS4+YrT0AtSrEa1ga
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 11:15 +0200, Antonin Godard via
lists.openembedded.org wrote:
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
>  meta/classes/sbom-cve-check-common.bbclass | 31 ++++++++++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sb=
om-cve-check-common.bbclass
> index 6963ad71c61..d84416c8a50 100644
> --- a/meta/classes/sbom-cve-check-common.bbclass
> +++ b/meta/classes/sbom-cve-check-common.bbclass
> @@ -48,6 +48,33 @@ SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?=3D " \
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
> +    report =3D {}

We shouldn't need to initialise report here as it is always set if we
get past the try block below.

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
> @@ -94,9 +121,13 @@ def run_sbom_cve_check(d, sbom_path, export_base_name=
, export_link_name=3DNone):
>          bb.error(f"sbom-cve-check failed: {e}")
>          return
> =20
> +    show_warnings =3D oe.utils.vartrue("SBOM_CVE_CHECK_SHOW_WARNINGS", T=
rue, False, d)

I think this can be:

    show_warnings =3D bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_WAR=
NINGS"))

> +
>      for export_type, export_file, export_link in export_files:
>          bb.note(f"sbom-cve-check exported: {export_file}")
>          if export_link:
>              update_symlinks(export_file, export_link)
> +        if show_warnings and export_type =3D=3D d.getVarFlag("SBOM_CVE_C=
HECK_EXPORT_CVECHECK", "type"):
> +            show_warnings_from_file(export_file)

Best regards,

--=20
Paul Barker


--=-G53mS4+YrT0AtSrEa1ga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaedauxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsfWAP9VrqlQfLfc/4DOaYRxREv4NGIya4Qc4RsQ
3jrNHfVaKwD9Flmb4Zhm8hncSQn8SrwAeU7e0vWctxV1Anwjk2WjpgA=
=R9UZ
-----END PGP SIGNATURE-----

--=-G53mS4+YrT0AtSrEa1ga--

