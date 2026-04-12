Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00513E93804
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 20:22:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.257387.1776025368040731985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 13:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HbJwQ2PG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03027C5B19B;
	Sun, 12 Apr 2026 20:23:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC02C5FFB9;
	Sun, 12 Apr 2026 20:22:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CA2B104500EE;
	Sun, 12 Apr 2026 22:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776025365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W5WgzDWiqFy/rbXlkCbqPW72KVt+a8YX1kIhqg6e1Mg=;
	b=HbJwQ2PGJ4W9OGK4qh0jATaKHj3wwehMyFdWictk6fFdNSNm8x3htF8V197/U/oKuiYlel
	Bqw6RVBVByryecQkDCvCWHhak9ttpK/nrYlpK5TQEAtJx16g8LrUpNY6M/8Z3jDKxxYsuU
	4ZKJL7RNb6fzRKkJLuuirQ7NzPQtHx9/MpkKx0b10fCyAL4Nn/B+Qq75M2MeaVfPrunb+A
	XkG5pzOhtcyOs2q7SK/5VxTwEwzkQwAYSd9j5YoqmXMXhN891NqZzcRB4dImXVSK2H7Ool
	BTFxPAbB5gAezNoBvaWPyhIsBsHff3Ll4uD9sDMP3kqF6b5te9nHiFqzQAA88g==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Ross Burton <ross.burton@arm.com>,
 "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Date: Sun, 12 Apr 2026 22:22:43 +0200
Message-ID: <13986342.uLZWGnKmhe@brobin-bootlin>
In-Reply-To: 
 <AS1PR10MB5697C1A55909F05EE73FB5A2FD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260412185201.2556780-1-peter.marko@siemens.com>
 <20260412185201.2556780-2-peter.marko@siemens.com>
 <AS1PR10MB5697C1A55909F05EE73FB5A2FD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 20:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235075

Hello Peter,

On Sunday, April 12, 2026 at 9:04=E2=80=AFPM, Marko, Peter wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >=20
> > Reference [1]:
> > Introduced in: xorg-server-1.13.0 (2012)
> > Fixed in: xorg-server-21.1.11 and xwayland-23.2.4
> >=20
> > Note that the status should be "fixed-version", however that does not=09
> > seem to work correctly with the new sbom-cve-check.
>=20
> This looks like a bug in sbom-cve-check (or vex?) code.
> Any idea why certain manual CVE_STATUSes would be overridden by cvelistV5=
 status?

This should not be possible. With default configuration a manual
annotation cannot be overwritten. sbom-cve-check directly use the
annotation without any extra processing.

> > diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/r=
ecipes-
> > graphics/xwayland/xwayland_24.1.9.bb
> > index df1bb7e31b..6c10eddb8e 100644
> > --- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
> > +++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
> > @@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D
> > "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f58245
> >=20
> >  UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
> >=20
> > +CVE_STATUS[CVE-2024-21886] =3D "version-not-in-range: fixed since xway=
land-
> > 23.2.4"
> > +
> >  inherit meson features_check pkgconfig
> >  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"

What you see is perfectly normal.
The recipe is named "xwayland", without a CVE_PRODUCT specified, so the
default CPE is "cpe:2.3:*:*:xwayland:24.1.9:*:*:*:*:*:*:*"

The CVE is associated with xorg-server and with xwayland.
And if you notice, in the report the CVE is linked to xorg-server
and to xwayland: The CVE is referenced twice in the report.
When associated with xorg-server the annotation does not work,
but when associated with xwayland it works.

I guess you also need to add the CVE_STATUS in xserver-xorg recipe.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




