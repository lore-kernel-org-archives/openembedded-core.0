Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D70EF3C245
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 12:17:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12838.1773058659957886538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 05:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZV45jZPZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 03E8A4E425DC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 12:17:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C20D05FFB8;
	Mon,  9 Mar 2026 12:17:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8322B10369A00;
	Mon,  9 Mar 2026 13:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773058657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OMX8GbhDkV0gDcXF+pm4w/t7WJ2VN0/Ii9Nj0+IAArs=;
	b=ZV45jZPZGxpPvumzgPjManfnkmWNUcVUKH8JOoDvD9RMivfheMN7IuvxU8Bg0wXkvOLYMO
	bAaZ7o71R0nT/kDoQP4Anur0SZERZVjPQLdGGT41Mf/LfGdaSYvJjNvbDl5u5UU23eTZL4
	YG4nV3mq19f4BoSTDfAJiHfyu10GX0u/z2zwQesovKgrrontyh4ZWFrztFBrDHY+HPgEti
	THUbMIt8QPz7lnMMQ0iVbQ2Oa/qqEksfJ9ZgCXvqS3FZtw07ae8dTyW2BAenJqd16jW4Ew
	O27tLzx4oFiYmDgbsmysLK7QioMhzMrbvhPmbEmXnziWs87Ag7WUGjuHgTfwfg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com,
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH v3 6/6] sbom-cve-check.bbclass: Add class for post-build
 CVE analysis
Date: Mon, 09 Mar 2026 13:17:33 +0100
Message-ID: <3036686.e9J7NaK4W3@brobin-bootlin>
In-Reply-To: <1922651.atdPhlSkOF@brobin-bootlin>
References: 
 <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
 <8fae3195a70bb6b43872b57cb27b6197c08744b8.camel@pbarker.dev>
 <1922651.atdPhlSkOF@brobin-bootlin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 12:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232702

Hello Paul,

On Thursday, March 5, 2026 at 5:22=E2=80=AFPM, Benjamin Robin wrote:
> On Thursday, March 5, 2026 at 2:47=E2=80=AFPM, Paul Barker wrote:
> > We would prefer not to override do_fetch for sbom-cve-check-update-*.bb.
> > We should be able to use the standard git fetcher here, with a hardcoded
> > SRCREV to allow offline parsing to succeed. A config fragment should
> > then be defined which enables the sbom-cve-check bbclass and sets the
> > srcrevs for the update recipes to ${AUTOREV}.
>=20
> Honestly, I've been considering the best approach for fetching the CVE
> databases. While using the Yocto internal fetcher is indeed cleaner, it
> raises a few questions:
>=20
>  - Is it possible to implement updates at fixed intervals (e.g., every X
>    hours)? If so, how could this be done?
>    If this isn't feasible, it's not a major concern, having the latest
>    updates is more important than performance.
>=20
>  - Would there be any objections to updating the `RM_WORK_EXCLUDE`
>    variable within the database update recipes to exclude the recipe
>    itself? Unpacking the CVE database is quite slow, especially given its
>    size (~3GB).
>=20
>  - By retaining the unpacked databases, we could store the database index
>    in the `$workdir`. This would avoid the need to recompute the database
>    index each time, which is something we'd prefer to avoid.
>=20
>  - However, it feels questionable to use an extracted Git repository from
>    another recipe: My whole (new) idea on how to fix this looks wrong.
>    I checked how `cve-update-nvd2-native.bb` handles this, the database
>    is moved to the download directory. But if we do this, the database
>    will still be unpacked for every analysis, which we try to avoid.
>=20
> My primary aim is to avoid extracting the database repeatedly for every
> build, and to be able to keep the database index somewhere.

I am proposing two solutions to address this issue:

=2D First RFC [1]: A refined version of the original solution using a
  custom `do_fetch`. While performance on an NFS-mounted download directory
  may not be optimal, this approach now includes a configurable variable to
  specify the CVE database storage location.

=2D Second RFC [2]: An alternative approach leveraging BitBake=E2=80=99s in=
ternal
  fetcher.

I prefer the first solution, as it appears cleaner to me. It supports
shallow cloning (depth of 1) and allows explicit control over update
intervals.

Once feedback is received, I will prepare a formal patch based on the
chosen solution.

> > Running sbom-cve-check offline should be supported, but manual config
> > may be needed to set an appropriate srcrev. We should provide an example
> > of this in the docs.

=46or fully offline use of `sbom-cve-check`, there is already a commit in
the main branch that introduces the `--disable-auto-updates` flag. I
plan to release this update for `sbom-cve-check` soon (within one or two
weeks) to integrate it into the OE-core class. If this timeline is not OK,
please let me know.
=20
> I plan to write documentation (in yocto-docs) as soon as this series is
> merged :)
>=20
> > We should also be able to avoid setting do_sbom_cve_check[nostamp]. With
> > dependencies set correctly, this should only re-run if the image changes
> > or the cve database has been updated.
>=20
> I am going to fix that (at least try, see discussion above)!

[1] https://lore.kernel.org/r/20260309-add-sbom-cve-check-p2-v1-0-72a0771e1=
f12@bootlin.com
[2] https://lore.kernel.org/r/20260309-add-sbom-cve-check-p2b-v1-0-09165cdd=
fcf1@bootlin.com

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




