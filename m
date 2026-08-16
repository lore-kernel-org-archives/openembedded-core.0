Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B880DC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:25:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8341.1786879514621532434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n7swKQP7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 422C21A169B;
	Sun, 16 Aug 2026 11:25:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0664160352;
	Sun, 16 Aug 2026 11:25:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4958011C4F8F4;
	Sun, 16 Aug 2026 13:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786879507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b1sKEZZ0ZMbKtf1m/6XQ42SOAyLTYEmkmetBLEJpzJA=;
	b=n7swKQP7IuG+rfoV3OC978MlvTs4ysicMlC83R5V3UTGcg+hIngWbDQ6m7oa1M1ATLcu/B
	sFf9mcLF7qLfN8Lkhro2Xb25rjL506X0+DhLj9Lj+n6sclI7tPiyNteDtOxrYBvOR7sZ47
	5HglfooCQeZ1cDa2byRhYINIOKuaT46uOJTy82KFjTv5EnUX0RqFmn9O8oxYXdSVZWC7cj
	ekItflPRm7d1POhAPWuhGexOcg51oIp+uu2vSBNJFbu0oTwjYbx43U/auHiOIgzpCLyBjW
	fl9qy6s2FeO3f/OUpB9aM/qjO0BYqBwObBsk9mS3xF76qMfgphbdBgwQmddYtA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com,
 daniel.turull@ericsson.com
Subject: Re: [PATCH 2/2] package: fix source path in save_debugsources_info()
Date: Sun, 16 Aug 2026 13:25:04 +0200
Message-ID: <6mKnVq77T3qmNmVG0TaWpg@bootlin.com>
In-Reply-To: <foNKo7xSSzG14aIsBMYQlA@bootlin.com>
References: 
 <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
 <96d72ef99f426d380cd090740ff636df1512ba2f.camel@pbarker.dev>
 <foNKo7xSSzG14aIsBMYQlA@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243524

On Sunday, August 16, 2026 at 1:12=E2=80=AFPM, Benjamin Robin wrote:
> On Sunday, August 16, 2026 at 12:46=E2=80=AFPM, Paul Barker wrote:
> > On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> > > Previously, except for a kernel recipe, the source file paths were ne=
ver
> > > "resolved" since the KERNEL_SRC_PATH variable is always defined. So in
> > > the ${PN}-debugsources.json.zstd file the source file paths always st=
arted
> > > with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_DBGSRC_=
DIR).
> > >=20
> > > Currently the debugsources.json file is only used by the spdx generat=
ion.
> > > - In `get_patched_src()` the sources of the recipe are extracted (aga=
in).
> > >   The unpack task is executed from a modified local context with UNPA=
CKDIR
> > >   set to the value of `${SPDXWORK}`. So in summary the sources are
> > >   extracted in a sub-directory of `${SPDXWORK}`.
> > > - In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all t=
he
> > >   files (recursively) found in topdir are listed. For each source fil=
e,
> > >   if the file path (relative to topdir) is in the list of source files
> > >   retrieved by save_debugsources_info, then the file is added to the =
SPDX
> > >   SBoM.
> > >=20
> > > So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the relati=
ve
> > > path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative to
> > > ${UNPACKDIR}, do nothing.
> > >=20
> > > Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> >=20
> > The paths in ${PN}-debugsources.json currently match where the files
> > will be installed on the target. If we change these to be relative
> > paths within ${UNPACKDIR} then we would break other ways that the
> > debugsources json files may be used.
>=20
> Hello Paul,
>=20
> This was never the purpose of ${PN}-debugsources.json if I am not mistake=
n.
> If you look at the code (before my patches) the path should have been
> modified to be somewhat relative to WORKDIR. But the code had a bug, and
> the paths were never modified.
>=20
> Also, for the kernel, the kernel sources paths were already modified to be
> the same as the path in SPDX, so starting with ${BP}. This part was
> mostly working for the "main" use case. In a previous RFC series that was
> merged, I fix that to be working for any kernel recipe.
> =20
> > What is currently broken?=20
>=20
> SPDX_INCLUDE_COMPILED_SOURCES for a normal recipe (not the kernel) is not
> working.
>=20
> > Can this be fixed at the point where the
> > debugsources json file is parsed instead of where it is generated?

Yes, I guess we could modify how oe.spdx_common.get_compiled_sources() is
implemented. In that case I would recommend to no longer modify the paths
of kernel sources in save_debugsources_info(). We would keep the paths as i=
s,
we would only filter for "<internal>", "<built-in>", ...

In any cases, this is kind of a breaking change since the
${PN}-debugsources.json is not going to contain the same paths as before.

But what you are "proposing" (modifying get_compiled_sources()) is a bit
cleaner from my point of view. This is a bit more work, that is why I did
not do that.
Joshua do you have an option on that?

> > Sorry if I'm missing some context here.
>=20
> For the full context see:
> https://lore.kernel.org/all/20260727-fix-get-patched-src-v1-0-f5054ca10e1=
4@bootlin.com/
> https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




