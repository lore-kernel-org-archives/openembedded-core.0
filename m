Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DCCC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 12:19:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9040.1786882757218634489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 05:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dAoQoqR5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E295D1A1692;
	Sun, 16 Aug 2026 12:19:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A78A360352;
	Sun, 16 Aug 2026 12:19:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 889C311C4F912;
	Sun, 16 Aug 2026 14:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786882750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dJx/3lzckPxT+3ZR/dWWrbjztOnxqgR+LoPsX+BJMeY=;
	b=dAoQoqR5F3FhRrZS1N/H774c8t7AJ0rFbkZwfNBf6iZnXD8Oq5PbQ+nUi0fUtADdVI3m4s
	CxSys24MGTuakdvBmt5SDaXo3IMmHv+zlZWxigDQqr7IvG7sSXQ09E6QFYWoozvnHhxOmS
	zFom0jDbuic0R1Ld2asP6Z2yyY+74gbt7bXPzlvwpmYz0p3r8DauWojK/ASLMl6C/7rONo
	1tsrXlcP1vnBQb1ThmiIehiIzPFXSJDTmKJHa2FHlIMr6IxwMwPCIMeNZxWNPvV0yXzCgU
	AObUyGSJMnchAF47/gV1gjZOT25DakKL9WW4rlGdxG5G4RJa0uvfdV5vVQ1onw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com,
 daniel.turull@ericsson.com
Subject: Re: [PATCH 2/2] package: fix source path in save_debugsources_info()
Date: Sun, 16 Aug 2026 14:19:07 +0200
Message-ID: <deTZ1aVaTSi1lGA0cUFFsw@bootlin.com>
In-Reply-To: <31833741ed68de2878234d906c2a1cfe680c4508.camel@pbarker.dev>
References: 
 <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
 <6mKnVq77T3qmNmVG0TaWpg@bootlin.com>
 <31833741ed68de2878234d906c2a1cfe680c4508.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 12:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243527

On Sunday, August 16, 2026 at 1:37=E2=80=AFPM, Paul Barker wrote:
> On Sun, 2026-08-16 at 13:25 +0200, Benjamin Robin wrote:
> > On Sunday, August 16, 2026 at 1:12=E2=80=AFPM, Benjamin Robin wrote:
> > > On Sunday, August 16, 2026 at 12:46=E2=80=AFPM, Paul Barker wrote:
> > > > On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> > > > > Previously, except for a kernel recipe, the source file paths wer=
e never
> > > > > "resolved" since the KERNEL_SRC_PATH variable is always defined. =
So in
> > > > > the ${PN}-debugsources.json.zstd file the source file paths alway=
s started
> > > > > with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_DBG=
SRC_DIR).
> > > > >=20
> > > > > Currently the debugsources.json file is only used by the spdx gen=
eration.
> > > > > - In `get_patched_src()` the sources of the recipe are extracted =
(again).
> > > > >   The unpack task is executed from a modified local context with =
UNPACKDIR
> > > > >   set to the value of `${SPDXWORK}`. So in summary the sources are
> > > > >   extracted in a sub-directory of `${SPDXWORK}`.
> > > > > - In `add_package_files()`, with topdir equal to `${SPDXWORK}`, a=
ll the
> > > > >   files (recursively) found in topdir are listed. For each source=
 file,
> > > > >   if the file path (relative to topdir) is in the list of source =
files
> > > > >   retrieved by save_debugsources_info, then the file is added to =
the SPDX
> > > > >   SBoM.
> > > > >=20
> > > > > So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the re=
lative
> > > > > path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative to
> > > > > ${UNPACKDIR}, do nothing.
> > > > >=20
> > > > > Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> > > >=20
> > > > The paths in ${PN}-debugsources.json currently match where the files
> > > > will be installed on the target. If we change these to be relative
> > > > paths within ${UNPACKDIR} then we would break other ways that the
> > > > debugsources json files may be used.
> > >=20
> > > Hello Paul,
> > >=20
> > > This was never the purpose of ${PN}-debugsources.json if I am not mis=
taken.
> > > If you look at the code (before my patches) the path should have been
> > > modified to be somewhat relative to WORKDIR. But the code had a bug, =
and
> > > the paths were never modified.
> > >=20
> > > Also, for the kernel, the kernel sources paths were already modified =
to be
> > > the same as the path in SPDX, so starting with ${BP}. This part was
> > > mostly working for the "main" use case. In a previous RFC series that=
 was
> > > merged, I fix that to be working for any kernel recipe.
> > > =20
> > > > What is currently broken?=20
> > >=20
> > > SPDX_INCLUDE_COMPILED_SOURCES for a normal recipe (not the kernel) is=
 not
> > > working.
> > >=20
> > > > Can this be fixed at the point where the
> > > > debugsources json file is parsed instead of where it is generated?
> >=20
> > Yes, I guess we could modify how oe.spdx_common.get_compiled_sources() =
is
> > implemented. In that case I would recommend to no longer modify the pat=
hs
> > of kernel sources in save_debugsources_info(). We would keep the paths =
as is,
> > we would only filter for "<internal>", "<built-in>", ...
> >=20
> > In any cases, this is kind of a breaking change since the
> > ${PN}-debugsources.json is not going to contain the same paths as befor=
e.
> >=20
> > But what you are "proposing" (modifying get_compiled_sources()) is a bit
> > cleaner from my point of view. This is a bit more work, that is why I d=
id
> > not do that.
> > Joshua do you have an option on that?
> >=20
> > > > Sorry if I'm missing some context here.
> > >=20
> > > For the full context see:
> > > https://lore.kernel.org/all/20260727-fix-get-patched-src-v1-0-f5054ca=
10e14@bootlin.com/
> > > https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833
>=20
> Hi Benjamin,
>=20
> Yes, I was missing some context! I was replying based off discussions we
> had on the patch review call on Thursday.
>=20
> If the paths in debugsources.json files are currently inconsistent
> between kernel and non-kernel recipes then we should fix that. So
> perhaps your patch is correct after all. I'll let Joshua give an
> opinion.

Be aware that with all my patches, the content of debugsources.json will
still contain paths starting with /usr/src/debug/ since there are paths
from others recipes (header files from glibc for example, ...).

I am not sure I will have time this week to take a look at the second
solution (modifying get_compiled_sources which is a bit cleaner from my
point of view). I'll let Joshua give his opinion first :)

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




