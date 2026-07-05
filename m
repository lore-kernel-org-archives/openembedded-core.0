Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678EBC43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 09:37:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128899.1783244257500153507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 02:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=10dOkyTO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 42B7A1A0E67
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Jul 2026 09:37:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 116D6601A2;
	Sun,  5 Jul 2026 09:37:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1BD311BB9280;
	Sun,  5 Jul 2026 11:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783244254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DKNkGuK370VaNBVMlJCZMlmmCO88AtQoXCTtn6KADqQ=;
	b=10dOkyTOg/b4uCc4GGqTpXFG8+o05yl/TpIuFXfqfiWosMTdlU312s0aceZZJya49yIw0z
	cECtflvAv3ZFa2kI5w/VMaO9pq3CtTibqUCUswPizbU92ekMCnvTnnNucOZ9UHaUgf0xtk
	Nbv4uEYYdpfdkr/c4vFw4CAELLJrTI5UPfLXte0NwMJLqBwIqsNkF8HmkQNrDYKjFE5XhA
	cPYr4UAMhqL94DWRO9yqm4BpdcropfgWlw8DOqr9y2j8O8WhlNY9o1mWHESl/+IDKTUf84
	XV6UHG5q5YX2kxOGMtm+jKRIYJjIUwawdTEfCT70qnyYQzNT0S2uzryol7Uvig==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, olivier.benjamin@bootlin.com,
 mathieu.dubois-briand@bootlin.com
Subject: Re: [OE-core] [PATCH] glib-2.0: Upgrade 2.88.1 -> 2.89.1
Date: Sun, 05 Jul 2026 11:37:32 +0200
Message-ID: <SIA-K_G0Q1GK-Xo_yctzzw@bootlin.com>
In-Reply-To: 
 <CANNYZj_ffP48T3+YOkt9iQumB+G0Fs2LLhv8QtiS=KfYYdDd=g@mail.gmail.com>
References: 
 <20260703-glib-2-0-cve-2026-58016-master-v1-1-e16967ddff16@bootlin.com>
 <CANNYZj_ffP48T3+YOkt9iQumB+G0Fs2LLhv8QtiS=KfYYdDd=g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 09:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240147

On Friday, July 3, 2026 at 11:48=E2=80=AFPM, Alexander Kanavin wrote:
> On Fri, 3 Jul 2026 at 16:34, Benjamin Robin via lists.openembedded.org
> <benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > This upgrade fixes CVE-2026-58016
> >
> > A flaw was found in GLib. A state confusion issue exists in
> > g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> > processing malformed D-Bus introspection XML, specifically with a <node>
> > element nested within other elements like <method>, <signal>, <property>
> > or <arg>. This issue can cause an unsigned integer overflow and lead to=
 an
> > out-of-bounds read, resulting in a denial of service.
> >
> > The CVE NVD entry is wrong, it indicates that the CVE is fixed in 2.88.1
> > but the fix was realized in 2.89.0, see [1]. The fix is not present in =
2.88.2.
> >
> > [1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf9=
9f9fdf5dc433d6fcc2
> >  .../glib-2.0/{glib-2.0-initial_2.88.1.bb =3D> glib-2.0-initial_2.89.1.=
bb} | 0
> >  meta/recipes-core/glib-2.0/{glib-2.0_2.88.1.bb =3D> glib-2.0_2.89.1.bb=
}   | 0
>=20
> 2.89.1 is a pre-release, we cannot take it. You need to backport the
> patch, or get the upstream to release 2.88.3 with it.

Indeed, I did not know that. SECURITY.md contains the following:
| Under GLib=E2=80=99s versioning scheme, stable release series have an eve=
n minor
| component (for example, 2.66.0, 2.66.1, 2.68.3), and development release =
series
| have an odd minor component (2.67.1, 2.69.0).

So I sent a v2 that backport the patch.

Thanks,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




