Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8558DC5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:12:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8068.1786878766543200818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SQr18QyK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F96C4E41259;
	Sun, 16 Aug 2026 11:12:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6131460352;
	Sun, 16 Aug 2026 11:12:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27D9311C4F8E9;
	Sun, 16 Aug 2026 13:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786878763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tBX6cSR/2LO65TzETFxtdbGu7YuppFemGarYE6wYCEU=;
	b=SQr18QyKsi1GrVj+iNlxz7UZCSW3pIb024PaiIO+wjOMTtn/kC1KxdRdhGA7IiOpjl5KkO
	zk57rVONq6bMChVakOqaL/KMHYTZu+nO1DY/ucbBh0kdPE0dbfPtDwgPe4vCK5EYyvqGP/
	DB+ivReQzvN+sgRN5EjREF8szPFNQRRsViMZ589+QKJ0rIOEgrGuztJ/VgD+C+H3XKEUCB
	3dvU6m8MTBPhPlrbtspbquaq8zS9qjQ8OL9pwChvyU2UfE5TCXcvVIlngMGSKx80RZ9fr3
	3Ei7kUxtbxt91LEMywLncke6bmwSOm1gnn3gIhOb5waIHZuTiy2PDq96wm111g==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com,
 daniel.turull@ericsson.com
Subject: Re: [PATCH 2/2] package: fix source path in save_debugsources_info()
Date: Sun, 16 Aug 2026 13:12:41 +0200
Message-ID: <foNKo7xSSzG14aIsBMYQlA@bootlin.com>
In-Reply-To: <96d72ef99f426d380cd090740ff636df1512ba2f.camel@pbarker.dev>
References: 
 <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
 <20260810-fix-save-debugsources-info-v1-2-2e83131bcf01@bootlin.com>
 <96d72ef99f426d380cd090740ff636df1512ba2f.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243521

On Sunday, August 16, 2026 at 12:46=E2=80=AFPM, Paul Barker wrote:
> On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> > Previously, except for a kernel recipe, the source file paths were never
> > "resolved" since the KERNEL_SRC_PATH variable is always defined. So in
> > the ${PN}-debugsources.json.zstd file the source file paths always star=
ted
> > with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_DBGSRC_DI=
R).
> >=20
> > Currently the debugsources.json file is only used by the spdx generatio=
n.
> > - In `get_patched_src()` the sources of the recipe are extracted (again=
).
> >   The unpack task is executed from a modified local context with UNPACK=
DIR
> >   set to the value of `${SPDXWORK}`. So in summary the sources are
> >   extracted in a sub-directory of `${SPDXWORK}`.
> > - In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
> >   files (recursively) found in topdir are listed. For each source file,
> >   if the file path (relative to topdir) is in the list of source files
> >   retrieved by save_debugsources_info, then the file is added to the SP=
DX
> >   SBoM.
> >=20
> > So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the relative
> > path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative to
> > ${UNPACKDIR}, do nothing.
> >=20
> > Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
>=20
> The paths in ${PN}-debugsources.json currently match where the files
> will be installed on the target. If we change these to be relative
> paths within ${UNPACKDIR} then we would break other ways that the
> debugsources json files may be used.

Hello Paul,

This was never the purpose of ${PN}-debugsources.json if I am not mistaken.
If you look at the code (before my patches) the path should have been
modified to be somewhat relative to WORKDIR. But the code had a bug, and
the paths were never modified.

Also, for the kernel, the kernel sources paths were already modified to be
the same as the path in SPDX, so starting with ${BP}. This part was
mostly working for the "main" use case. In a previous RFC series that was
merged, I fix that to be working for any kernel recipe.
=20
> What is currently broken?=20

SPDX_INCLUDE_COMPILED_SOURCES for a normal recipe (not the kernel) is not
working.

> Can this be fixed at the point where the
> debugsources json file is parsed instead of where it is generated? Sorry
> if I'm missing some context here.

=46or the full context see:
https://lore.kernel.org/all/20260727-fix-get-patched-src-v1-0-f5054ca10e14@=
bootlin.com/
https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




