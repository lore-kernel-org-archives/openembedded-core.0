Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA37C44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:42:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94672.1783089740584461629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a4L6Hq9v;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B91784E40C64;
	Fri,  3 Jul 2026 14:42:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8434160300;
	Fri,  3 Jul 2026 14:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8B1104C95AC;
	Fri,  3 Jul 2026 16:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rUnIZ66/0pH1Sq26g92AWF/t98Pb/En47UDaTOQx+3w=;
	b=a4L6Hq9vPK3e6W4ahC6B2wUxcesJMu8N4zYl6ROMFXUs9rBPItIjbfuvnHigvY3ARKPPwk
	NSOcuhUnXeZYY7nkBRFFQzqzjVWn5PEwOAoH5N35my4xTarLn/rKFf/V/MCEaoEQI5FWkF
	EzV0FkgyZl8NjoEAdRx2vRQD3KV11/wE0Ow99CAhaDsYEbCA3oTdI+YU1pBuiB1auFVYv6
	MWz8kOuligc54BRqKSqLEmeW75L+TOfMpxCia/UvIJkEAq8kETQEnFtWBmYm6IaVnYP9oD
	rjiTgTpXP6uL4xIJo+QJiKV8pbcsi7GEEQXQ1Op+fI8oP0O5AF5OvfVnBtc3Wg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com,
 pascal.eberhard@se.com, wahid.essid@se.com
Subject: Re: [OE-core] [scarthgap][PATCH] glib-2.0: fix CVE-2026-58016
Date: Fri, 03 Jul 2026 16:42:15 +0200
Message-ID: <knWe4ZSRSj6lGOsQSiMYKg@bootlin.com>
In-Reply-To: <DJOZILMNU3O5.3VMDRLWHGKGHU@smile.fr>
References: 
 <20260703-glib-2-0-cve-2026-58016-v1-1-23bfe853642f@bootlin.com>
 <wUwD7u-8QNWeO3TEktmZ1Q@bootlin.com> <DJOZILMNU3O5.3VMDRLWHGKGHU@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240117

On Friday, July 3, 2026 at 3:53=E2=80=AFPM, Yoann Congal wrote:
> On Fri Jul 3, 2026 at 3:46 PM CEST, Benjamin Robin wrote:
> > Hello Yoann,
> >
> > On Friday, July 3, 2026 at 3:33=E2=80=AFPM, Yoann Congal wrote:
> >> On Fri Jul 3, 2026 at 3:25 PM CEST, Benjamin Robin via lists.openembed=
ded.org wrote:
> >> > ---
> >> >  .../glib-2.0/glib-2.0/CVE-2026-58016-1.patch       | 92 +++++++++++=
++++++++++
> >> >  .../glib-2.0/glib-2.0/CVE-2026-58016-2.patch       | 96 +++++++++++=
+++++++++++
> >> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb      |  2 +
> >>=20
> >> NVD tells this is fixed in 2.88.1 but wrynose is at 2.88.0. Can you se=
nd
> >> a patch for wrynose so I can accept this on scarthgap?
> >
> > The fun thing, that this is not fixed in version 2.88.1 but in 2.89.0.
>=20
> Then,
> * NVD is wrong(?). Can you send a modification request so we avoid false
>   negatives (those are the worst ones!)

Yes, this was in my (very) long TODO list.
The commit fixing this issue is [1] and it was never backported.
The version 2.88.2 does not have the fix.

I am going to to that now :)

> * And, in that case, master is also impacted and need a fix.

I have sent:
 - A patch for master upgrading to 2.89.1
 - A patch for wrynose with the patches applied on 2.88.0

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9f=
df5dc433d6fcc2

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




