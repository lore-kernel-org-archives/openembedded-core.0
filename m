Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA078D609B4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:53:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25938.1765900402166029600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=R1fOTjWo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3BB8B1A2236;
	Tue, 16 Dec 2025 15:53:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 103936071C;
	Tue, 16 Dec 2025 15:53:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC08C119A8F4D;
	Tue, 16 Dec 2025 16:53:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765900395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WnAiMBmQaB8/HY+qZDmvVhuIWhNIV6gUKzcM1Ba9Pp0=;
	b=R1fOTjWo01egg5iIYukrlbZTUbX5QlPbSwGERgvie0LSmqsQ51hxfHfUsLzitHNM3gqYgf
	Y8xLXkp/5AXXMXetbzCd1qCjjemqGEp8EKj+vxQ44/Y+tBtJy88DCwec+ex9NJLnYqvyI1
	eg11OcQ41cR0yLrkcJOn1IGthLFGzy7ZTgSk0PXnuRk1uyogKS6KcRb+sdnaz5DTOQH+tE
	gGPEmFTHTvW1kyy5v2r5tsaIQIdEWIl/mUb6WhbTK3h8P1T6FZLbKll8LOth31IcW8FUjT
	FiWiMlwXh3+rWrEqhuoVnrum5okIZemwLurSk6a2EiRYSaNAaFnmKvDgPZ2PHg==
Date: Tue, 16 Dec 2025 16:53:12 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [OE-core] [scarthgap 0/3] Backport SPDX kernel config and
 PACKAGECONFIG metadata export
Message-ID: <vodnsherby4cvm5ajuwdicn7rpqnmqkiaivfuk73w7p2vhqhrs@czxpkjohbiwr>
References: <20251215155424.237662-1-kamel.bouhara@bootlin.com>
 <CADkTA4PhJZz1WcH5v3uLpCNxfhuR8_GkNM0kPPu+_TLmqfBXXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADkTA4PhJZz1WcH5v3uLpCNxfhuR8_GkNM0kPPu+_TLmqfBXXQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227974

On Mon, Dec 15, 2025 at 11:33:09AM -0500, Bruce Ashfield via lists.openem=
bedded.org wrote:
> On Mon, Dec 15, 2025 at 10:54=E2=80=AFAM Kamel Bouhara via
> lists.openembedded.org
> <kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > This series backports upstream commits that add support for exporting=
 kernel
> > configuration and PACKAGECONFIG features to SPDX 3.0 documents.
> >
>

Hi Bruce,

> regardless of this being opt-in functionality, we should have extra
> justification for
> adding features to old releases (LTS or not).
>
> Apologies if I missed a discussion where this was already justified
> and approved,
> I just can't remember it.

No worries the justification was discussed in the original upstream
submission thread [1].

These patches address a real compliance and auditing need for tracking
build-time configuration in SBOMs. Since Scarthgap is our LTS target for
the next several years, having these features integrated rather
than maintained as out-of-tree patches would significantly help our
maintenance burden.

>
> This is something that could actually sit in a layer, and not in core, =
for older
> releases.
>

That's certainly an option I'm happy to pursue if maintainers prefer.
However, given that:
- The features are fully opt-in (both default to "0")
- They're already accepted in master
- Scarthgap is LTS with active maintenance
- The backport is clean with no modifications needed

I believe they fit the criteria for LTS backports.

Regards,
Kamel

[1]: https://lists.openembedded.org/g/openembedded-core/topic/114181881#m=
sg220705

> Bruce
>
> > Upstream commits:
> > - 228a968e7c47 ("kernel.bbclass: Add task to export kernel configurat=
ion to SPDX")
> > - 7ec61ac40345 ("spdx30_tasks: Add support for exporting PACKAGECONFI=
G to SPDX")
> > - 2f0ab110d752 ("oeqa/selftest: oe-selftest: Add SPDX tests for kerne=
l config and PACKAGECONFIG")
> >
> > Kamel Bouhara (Schneider Electric) (3):
> >   kernel.bbclass: Add task to export kernel configuration to SPDX
> >   spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
> >   oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and
> >     PACKAGECONFIG
> >
> >  meta/classes-recipe/kernel.bbclass   | 64 ++++++++++++++++++++++++++=
++
> >  meta/classes/create-spdx-3.0.bbclass | 11 +++++
> >  meta/lib/oe/spdx30_tasks.py          | 20 +++++++++
> >  meta/lib/oeqa/selftest/cases/spdx.py | 57 +++++++++++++++++++++++++
> >  4 files changed, 152 insertions(+)
> >
> > --
> > 2.43.0
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227748): https://lists.openembedded.org/g/openembed=
ded-core/message/227748
> Mute This Topic: https://lists.openembedded.org/mt/116794215/5236779
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
kamel.bouhara@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

