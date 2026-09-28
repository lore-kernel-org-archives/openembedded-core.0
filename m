Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA18C9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 08:57:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54361.1790585822943924938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Xe/pdCdv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9ACF14E41093;
	Mon, 28 Sep 2026 08:57:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EF17601BD;
	Mon, 28 Sep 2026 08:57:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6136E102F1EA9;
	Mon, 28 Sep 2026 10:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790585819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tbYUXOX/jVWM7fp8LVbNpOfoSPAownfBIBEFc/eGVw4=;
	b=Xe/pdCdvVqOjarnQgemW2x/12AKSALw/wXpstButnTMaa8nUb/mxwZkdY+fedrGY2uoEDn
	yCR2SWf/DvwzFUQ7YR3zxOplres4x8k2sb3M+rF3vO4m+n5k7tAVjmUmQJwZwOadtGmn3j
	ZEuFC5SVjHTFs0lCTs7wLGW5b4w2SdwykAw/BuRPPN1VGd7oLuLClotLQToMnbOT1R3b7m
	xUWPYrFCxDR86bPTl1G5oMoEEEhNVZaPwUYd+EGlFCxYmpk3NzlLS0IIvvvwZjj9zgSaFJ
	bGxPakBjub8gNq89eGIdsdM2kIyhC0C+5s2vhJ5MhVoYCPCtwcFR+MqQwz4aWQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: kazuyoshi_akiyama@jp.honda, openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: 
 Re: [OE-core] [PATCH wrynose 0/4] spdx: fix the compiled-sources filter
Date: Mon, 28 Sep 2026 10:56:57 +0200
Message-ID: <P6U4ukI2TxueJYGtH8T_Xw@bootlin.com>
In-Reply-To: <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr>
References: 
 <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
 <DLP4XNN74N6I.1RINHBSPGZQL3@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246742

On Saturday, September 26, 2026 at 11:19=E2=80=AFAM, Yoann Congal wrote:
> On Thu Sep 17, 2026 at 6:24 AM CEST, KAZUYOSHI AKIYAMA via lists.openembe=
dded.org wrote:
> > SPDX_INCLUDE_COMPILED_SOURCES is meant to filter all source files down =
to
> > only the ones that were compiled before adding them to the SBOM,
> > but on wrynose it doesn't work.
> > add_package_files() is what picks which files go into the SBOM.
> > It walks ${SPDXWORK} itself to get file paths,
> > then keeps only the ones that match the list of compiled sources
> > returned by get_compiled_sources().
> > get_compiled_sources() just returns what save_debugsources_info() store=
d,
> > and that data uses paths rooted at ${TARGET_DBGSRC_DIR}
> > (=3D /usr/src/debug/${PN}/${PV}), not the ${SPDXWORK}-rooted paths
> > add_package_files() compares against.
> > So the list get_compiled_sources() returns never matches
> > what add_package_files() is comparing,
> > and almost every file ends up marked as not compiled.
> > This happens for every recipe except the kernel,
> > which has its own special-cased path.
> >
> > This isn't just a matter of the SBOM missing the right files.
> > sbom-cve-check uses the same match result to decide whether
> > a vulnerable file was actually built, for its vulnerability triage.
> > If the match count is always zero, that triage doesn't work either.
> > On yocto-6.0.2 we confirmed the misjudgment affects cpio and perl.
> >
> > master already has this fixed,
> > and this backport brings that fix to wrynose.
> > b567c2f0d9 is the commit that fixes it.
> > Everything else in the series is a prerequisite for that patch.
> > Backporting b567c2f0d9 along with its prerequisites
> > brings wrynose's behavior in line with master.
> > With this, compiled sources get counted correctly,
> > and sbom-cve-check's triage works correctly too.
> >
> > On wrynose (genericx86-64, core-image-full-cmdline),
> > the match rate goes from effectively zero to 93.9%.
> >
> > One thing changes.
> > What the SBOM records as a source file name changes too.
> > aa44a0f0eb re-unpacks under UNPACKDIR instead of WORKDIR,
> > so a recorded source file name changes
> > (e.g. sources/acl-2.3.2/... becomes acl-2.3.2/...).
> > This is a change to SBOM metadata only.
> > The actual build output is unaffected.
> > Anyone diffing SBOMs across LTS point releases will see it.
>=20
> Hello,
>=20
> Thanks for the series, this sounds like a worthy fix.
> But, this SBOM change is a bit more intrusive than I'm confortable
> with... This will create a lot of noise for users that precisely track
> their SBOMs.

Hello Yoann,

> Can we do the fix without this change?

Technically, we could do it. But it wouldn't be exactly the same series,
which I don't really like, and the code will diverge.
=46or information I could develop a solution after ELCE capable of
generating a similar SBOM if Kazuyoshi doesn't feel comfortable doing it.


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




