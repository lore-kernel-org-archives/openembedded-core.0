Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A96FF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 07:13:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37872.1777273975210399962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 00:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kWddnhJT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7D0C1A343C;
	Mon, 27 Apr 2026 07:12:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 874E5600D1;
	Mon, 27 Apr 2026 07:12:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C76410721153;
	Mon, 27 Apr 2026 09:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777273972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kL0vcUU0Mhvc5uNPAvzwo2+NCbimDD+ghPBQBSTvi1U=;
	b=kWddnhJTDnVvWCGNSVKLbRxzeBmlQ8ELwqyKnmw3ipcXyLM42WVxd7H3eyTkQzi50G0lq0
	Ri2Xcj12E4ZvOKBYo+504a8DUB9+ahEwNvWugpIo1/8B8vy26YtRcCp6DNoqAgkDvdXSUk
	ZBnZdORXRV0UBajJeiiL86QeCbuz60HH9AZwGUZBWACL+JV6WcilMkfO2awlxvbFaqupfJ
	2yKIXz/CIJyO1uIKPSUe4/ggK1+DoCfIISwFqXVypw0ttBPvB7ZQFsnzURChy5S0sGU+PT
	VtR32ab431HhW8L1tcCWyO5MczE5wR8TC66KVr5A28bS9s7bEof8uPZb5ZOt+A==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Date: Mon, 27 Apr 2026 09:12:50 +0200
Message-ID: <RRV3rhtPRj-XxHaMgbEl5A@bootlin.com>
In-Reply-To: 
 <AS1PR10MB56977CF6AB8F681734EAD75DFD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260426185025.13217-1-peter.marko@siemens.com>
 <AS1PR10MB56977CF6AB8F681734EAD75DFD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235987

On Sunday, April 26, 2026 at 9:17=E2=80=AFPM, Marko, Peter wrote:
>=20
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Sunday, April 26, 2026 8:50 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64=
517
> >=20
> > From: Peter Marko <peter.marko@siemens.com>
> >=20
> > These CVEs are for sudo-rs, not sudo.
> > It can be easily deducted from first word in NVD descripotion.
> > Also cvelistV5 product is "sudo-re".
> >=20
> > It looks line that new version of sbom-cve-check matches product with
> > startsWith instead of equals?
>=20
> Benjamin, any idea about this topic?

Yes, sadly the CPE of sudo-rs is trifectatech:sudo.
Why this is the official CPE of sudo-rs, I don't know...

What it is happening:
 - From https://cveawg.mitre.org/api/cve/CVE-2025-64170
   we extract vendor and product name, then we look the products database
   which is built in sbom-cve-check.
 - The returned CPE are "memorysafety:sudo", "trifectatech:sudo"
 - Then we check if the CPE in the SBOM matches with these CPE.
   Currently sudo is declared as: *:sudo, which matches trifectatech:sudo.

The easy fix is to declare the proper CPE of sudo using CVE_PRODUCT,
which should be set to "sudo_project:sudo".

This behavior is documented here:
https://sbom-cve-check.readthedocs.io/en/latest/design.html#find-applicable=
=2Dcve

>=20
> >=20
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-
> > extended/sudo/sudo_1.9.17p2.bb
> > index d6ee881f8c..12f81c5d4a 100644
> > --- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
> > +++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
> > @@ -60,3 +60,6 @@ RDEPENDS:${PN} +=3D "${SUDO_PACKAGES}"
> >=20
> >  FILES:${PN}-sudo =3D "${bindir}/sudo ${bindir}/sudoedit"
> >  FILES:${PN}-lib =3D "${localstatedir} ${libexecdir} ${sysconfdir} ${li=
bdir}
> > ${nonarch_libdir}"
> > +
> > +CVE_STATUS[CVE-2025-64170] =3D "cpe-incorrect: this CVE is for sudo-rs"
> > +CVE_STATUS[CVE-2025-64517] =3D "cpe-incorrect: this CVE is for sudo-rs"
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




