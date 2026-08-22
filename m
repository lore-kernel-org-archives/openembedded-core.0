Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E1BC5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 09:50:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4013.1787392193511717096
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 02:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0gzQ/Xju;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 84E3B4E4132E;
	Sat, 22 Aug 2026 09:49:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43AA9604C4;
	Sat, 22 Aug 2026 09:49:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F84511C77977;
	Sat, 22 Aug 2026 11:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787392186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RSHEGHwOd6EofYSa9gOXZXg8P74+6Fr8zqEiO6n0rbQ=;
	b=0gzQ/XjuJIT22DNglwDBNiJqC5qudjtlUDqnroaI9alAQq//91XfIpkJu0pONlVU9s7OtT
	qGSQy+Ikdld2Hi9ZElvMa5YfyFafHZkyLyvDf0SJtkYApUwpN6xvtYVYHSSRnnHR7Jae7T
	wFrvWRHqhpACWo3HsBs0coPbqi5+zZiHodgExOHShPTBHjtvYWYqet1kNjwL13G4vJI+MZ
	E93pAly9QPKur6wpRkBdAQ4pPJuPXPaxZv50+F7UUT3F6FnEhunbWU4/dNc9k5wds0FaEM
	5yxDb2B7SNnsKRIUQg9dYrHNiKt47gKDx9O6G4xJ9JepIfo6JMsVoOo2GN/QYw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com,
 daniel.turull@ericsson.com
Subject: 
 Re: [OE-core] [PATCH 2/2] package: fix source path in
 save_debugsources_info()
Date: Sat, 22 Aug 2026 11:49:44 +0200
Message-ID: <1OMpr5mbRGa64B_8cFNdPw@bootlin.com>
In-Reply-To: 
 <c74cc8fd01dff0446c6d7a06eecea7efcbe31295.camel@linuxfoundation.org>
References: 
 <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
 <deTZ1aVaTSi1lGA0cUFFsw@bootlin.com>
 <c74cc8fd01dff0446c6d7a06eecea7efcbe31295.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243972

On Thursday, August 20, 2026 at 4:14=E2=80=AFPM, Richard Purdie wrote:
> On Sun, 2026-08-16 at 14:19 +0200, Benjamin Robin via lists.openembedded.=
org wrote:
> > On Sunday, August 16, 2026 at 1:37=E2=80=AFPM, Paul Barker wrote:
> > > On Sun, 2026-08-16 at 13:25 +0200, Benjamin Robin wrote:
> > > > On Sunday, August 16, 2026 at 1:12=E2=80=AFPM, Benjamin Robin wrote:
> > > > > On Sunday, August 16, 2026 at 12:46=E2=80=AFPM, Paul Barker wrote:
> > > > > > On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> > > > > > The paths in ${PN}-debugsources.json currently match where the =
files
> > > > > > will be installed on the target. If we change these to be relat=
ive
> > > > > > paths within ${UNPACKDIR} then we would break other ways that t=
he
> > > > > > debugsources json files may be used.
> > > > >=20
> > > > > Hello Paul,
> > > > >=20
> > > > > This was never the purpose of ${PN}-debugsources.json if I am not=
 mistaken.
> > > > > If you look at the code (before my patches) the path should have =
been
> > > > > modified to be somewhat relative to WORKDIR. But the code had a b=
ug, and
> > > > > the paths were never modified.
> > > > >=20
> > > > > Also, for the kernel, the kernel sources paths were already modif=
ied to be
> > > > > the same as the path in SPDX, so starting with ${BP}. This part w=
as
> > > > > mostly working for the "main" use case. In a previous RFC series =
that was
> > > > > merged, I fix that to be working for any kernel recipe.
> > > > > =20
> > > > > > What is currently broken?=20
> > > > >=20
> > > > > SPDX_INCLUDE_COMPILED_SOURCES for a normal recipe (not the kernel=
) is not
> > > > > working.
> > > > >=20
> > > > > > Can this be fixed at the point where the
> > > > > > debugsources json file is parsed instead of where it is generat=
ed?
> > > >=20
> > > > Yes, I guess we could modify how oe.spdx_common.get_compiled_source=
s() is
> > > > implemented. In that case I would recommend to no longer modify the=
 paths
> > > > of kernel sources in save_debugsources_info(). We would keep the pa=
ths as is,
> > > > we would only filter for "<internal>", "<built-in>", ...
> > > >=20
> > > > In any cases, this is kind of a breaking change since the
> > > > ${PN}-debugsources.json is not going to contain the same paths as b=
efore.
> > > >=20
> > > > But what you are "proposing" (modifying get_compiled_sources()) is =
a bit
> > > > cleaner from my point of view. This is a bit more work, that is why=
 I did
> > > > not do that.
> > > > Joshua do you have an option on that?
> > > >=20
> > > > > > Sorry if I'm missing some context here.
> > > > >=20
> > > > > For the full context see:
> > > > > https://lore.kernel.org/all/20260727-fix-get-patched-src-v1-0-f50=
54ca10e14@bootlin.com/
> > > > > https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224=
833
> > >=20
> > > Hi Benjamin,
> > >=20
> > > Yes, I was missing some context! I was replying based off discussions=
 we
> > > had on the patch review call on Thursday.
> > >=20
> > > If the paths in debugsources.json files are currently inconsistent
> > > between kernel and non-kernel recipes then we should fix that. So
> > > perhaps your patch is correct after all. I'll let Joshua give an
> > > opinion.
> >=20
> > Be aware that with all my patches, the content of debugsources.json will
> > still contain paths starting with /usr/src/debug/ since there are paths
> > from others recipes (header files from glibc for example, ...).
> >=20
> > I am not sure I will have time this week to take a look at the second
> > solution (modifying get_compiled_sources which is a bit cleaner from my
> > point of view). I'll let Joshua give his opinion first :)
>=20
> Giving some extra data here, we list all the sources the binaries
> reference, whether they're from the current recipe or a different one.
> The sources from a different recipe use the on target paths for the
> soruces and I think the paths for the current recipe should be the same
> for consistency.
>=20
> The /usr/src/debug/ paths are therefore correct and we should be
> standarising on that, not on transient build paths IMO.
>=20
> If other code has to resolve that to find the real files, so be it.
> That will depend on the context the file is being used in as to whether
> they're even still available.

Hello Richard,

I sent a v2 with a cleaner approach:
 - No longer modify paths in debugsources.json.zstd
 - The logic is now in oe.spdx_common.get_compiled_sources()=20

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




