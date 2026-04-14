Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7778F531F6
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:44:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12954.1776149073452153615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BpklQCQv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1AB55C5B1BB
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:45:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12E505FFBB;
	Tue, 14 Apr 2026 06:44:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50B7D10450150;
	Tue, 14 Apr 2026 08:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776149070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TMZhamC5tyI0JbD+WPY0ZU0Ac39ShqyCfQUx4AdZKdw=;
	b=BpklQCQvAbd0LBcc77KrA4WjoOtrVFFkVfav1Vf0t4LqyCzQg1mBbM+BOlhrjjz/MBmqqZ
	n20sAvfWWNS1VUAGyAc9nWbyazyqWesS7dnn/SR7JttWWiXVNEKUtKt/lB+08ovoJ3y4zU
	gG91myTubyVhZk1WFyQDIp55czBE4HEDapoZ3zbVfAWcL11UYrOwZpF6M5n5416PL7PN41
	fadQP0ERuW+5qEPU4pNWuiD3tRXwhle423hsSskELIZsXlhb9PehOqnsBVm9vrk7ql8O/j
	kg6fB6tOj4Z718DhjcOrRbKS02rbVTpi4DhMaT9G8OTcWzdXSHkyQvJKVKAKjg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 6/6] mpg123: set status for CVE-2006-3355
Date: Tue, 14 Apr 2026 08:44:26 +0200
Message-ID: <7931127.EvYhyI6sBW@brobin-bootlin>
In-Reply-To: 
 <AS1PR10MB5697198A4211439AC1A131A8FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260413211447.564257-1-peter.marko@siemens.com>
 <20260413211447.564257-6-peter.marko@siemens.com>
 <AS1PR10MB5697198A4211439AC1A131A8FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235142

On Monday, April 13, 2026 at 11:23=E2=80=AFPM, Marko, Peter wrote:
> Benjamin,
>=20
> This one is weird
> How can someone debug the sbom-cve-check script to figure out why the mat=
ch is positive or negative?
> That would be great feature if there would be some option to print the co=
mparisons.

Yeah, this is in the backlog, sbom-cve-check should have an "audit log".
But this is not that simple, and I have other priorities :)

> Peter

> > From: Peter Marko <peter.marko@siemens.com>
> >=20
> > This seems to be a bug in sbom-cve-check.
> > I could get a clean report with following fkie change:
> >=20
> >            "cpeMatch": [
> > +            {
> > +              "vulnerable": true,
> > +              "criteria": "cpe:2.3:a:mpg123:mpg123:0.59r:*:*:*:*:*:*:*=
",
> > +              "matchCriteriaId": "1F8EEF7E-C6BB-4669-81D2-68AABF8A7686"
> > +            },
> >              {
> >                "vulnerable": true,
> >                "criteria": "cpe:2.3:a:mpg123:mpg123:pre0.59s_r11:*:*:*:=
*:*:*:*",
> >                "matchCriteriaId": "9765C6AD-E1F0-421C-B7B1-C09AD83A3DB7"
> >              }
> >            ]

The algorithm is described here:
https://sbom-cve-check.readthedocs.io/en/latest/design.html#compute-vex-ass=
essment

But in summary, the CVE is found "applicable" (associated with mpg123 compo=
nent),
but no valide version range was found (pre0.59s_r11 is not a valid version).
So as documented: "In the end if no assessment could be computed, generate a
default assessment indicating that databases do not contain enough version
information. This default assessment considers that the component is affect=
ed
(vulnerable) by this CVE".

> >=20
> > However I'm not sure why adding another vulnerable version should switch
> > the vulnerability flag from true to false...

Adding a new valid cpeMatch entry is going to fix it. But maybe not exactly
this one, I guess we need to express that version range <=3D 0.59

=46or information, I am currently working on a big improvement for the
generation of VEX assessment (statement and status notes).

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




