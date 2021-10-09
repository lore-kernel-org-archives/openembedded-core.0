Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E961C433F5
	for <webhook@archiver.kernel.org>; Sat,  9 Oct 2021 15:51:39 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.8125.1633794698212895997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Oct 2021 08:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XHY6i3Ij;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1633794698;
  x=1665330698;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lkXfab/xQs7QGue7dz/jjAvkef4eBAkx6BdLu+fFJ7I=;
  b=XHY6i3IjSgmqUy3dRfjbplxAqH1sECgC4aJRpmlhLTEreHiWk/IF8fqG
   b/wBbVBjqkgkLQ4DaaHRXFJHmwyCZPMXoiOJJdATysPUEXwgQzUTZuYq+
   XpvwQbrKGSwo75oJA+TEaCABbQxU/sYkWaWqYKXbNjac2O1b8h8sMYkh3
   qQuyMV5ANIVfx4L5DiJINpqEumeg3jiaXIoySGuJkTWKABloz1Rubtm8I
   w3V7RtK3XKsQtXLbxzFZ8WvIWX0dljWenS+PGj52T+z1jRiJmzKBwuTou
   HbAwPet3AtolrDNr2gjDjWKvZ0F3mkPaYez/cXmjWlTBzg7wRfHsUiggr
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "mac@mcrowe.com" <mac@mcrowe.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] license: Allow treating missing license as
 error
Thread-Topic: [OE-core] [PATCH] license: Allow treating missing license as
 error
Thread-Index: AQHXvCIIw1pofp2Lv0++pxaMePnQSqvK0hiQ
Date: Sat, 9 Oct 2021 15:51:35 +0000
Message-ID: <52fa4ac2b9ae4501aa2a7fe654e43c10@axis.com>
References: <20211008085330.3031018-1-mac@mcrowe.com>
In-Reply-To: <20211008085330.3031018-1-mac@mcrowe.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 09 Oct 2021 15:51:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156788

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mike Crowe via
> lists.openembedded.org
> Sent: den 8 oktober 2021 10:54
> To: openembedded-core@lists.openembedded.org
> Cc: Mike Crowe <mac@mcrowe.com>
> Subject: [OE-core] [PATCH] license: Allow treating missing license as
> error
>=20
> Use mechanism inspired by insane.bbclass to allow individual recipes or
> other configuration to determine whether a missing licence should be
> treated as a warning (as it is now) or as an error. This is controlled
> by whether the error class is in WARN_LICENSE or ERROR_LICENSE.
>=20
> Use bb.fatal in the error case to ensure that the task really fails. If
> only bb.error is used then do_populate_lic isn't re-run on subsequent
> builds which could lead to the error being missed.
>=20
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/license.bbclass | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 45d912741d..1805f18076 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -12,6 +12,23 @@ LICENSE_CREATE_PACKAGE ??=3D "0"
>  LICENSE_PACKAGE_SUFFIX ??=3D "-lic"
>  LICENSE_FILES_DIRECTORY ??=3D "${datadir}/licenses/"
>=20
> +# Elect whether a given type of error is a warning or error, they may
> +# have been set by other files.
> +WARN_LICENSE ?=3D "no-license"
> +ERROR_LICENSE ?=3D ""
> +WARN_LICENSE[doc] =3D "Space-separated list of license problems that sho=
uld be reported only as warnings"
> +ERROR_LICENSE[doc] =3D "Space-separated list of license problems that sh=
ould be reported as errors"
> +
> +def package_license_handle_error(error_class, error_msg, d):
> +    if error_class in (d.getVar("ERROR_LICENSE") or "").split():
> +        package_qa_write_error(error_class, error_msg, d)
> +        bb.fatal("License Issue: %s [%s]" % (error_msg, error_class))
> +    elif error_class in (d.getVar("WARN_LICENSE") or "").split():
> +        package_qa_write_error(error_class, error_msg, d)
> +        bb.warn("License Issue: %s [%s]" % (error_msg, error_class))
> +    else:
> +        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))

Change "QA Issue" to "License Issue" for consistency.

> +
>  addtask populate_lic after do_patch before do_build
>  do_populate_lic[dirs] =3D "${LICSSTATEDIR}/${PN}"
>  do_populate_lic[cleandirs] =3D "${LICSSTATEDIR}"
> @@ -190,7 +207,7 @@ def find_license_files(d):
>              # Add explicity avoid of CLOSED license because this isn't g=
eneric
>              if license_type !=3D 'CLOSED':
>                  # And here is where we warn people that their licenses a=
re lousy
> -                bb.warn("%s: No generic license file exists for: %s in a=
ny provider" % (pn, license_type))
> +                package_license_handle_error("no-license", "%s: No gener=
ic license file exists for: %s in any provider" % (pn, license_type), d)
>              pass
>=20
>      if not generic_directory:
> --
> 2.30.2

//Peter


