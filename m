Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4EEC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:46:59 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
 by mx.groups.io with SMTP id smtpd.web11.10800.1716536816024949786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 00:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=kc6axGWG;
 spf=pass (domain: protonmail.com, ip: 185.70.40.134, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716536813; x=1716796013;
	bh=uIWpUgLjP8O8Tl1MzohM1fmXZFi0SOOGuXHVdaxSyZw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kc6axGWGs/w4iSiSAEfBdCK4odG2uJPJW3P0eVPRB4ICHLuMZDGjMM4J89Br4T6Ra
	 HRp7irkMCFPaggTcrXzCS2/2R4lYYdrbbHDG9Xp3Zyz2VbQ/RvASbD26iH3enoDvi+
	 syWJX/ropmEGqVyKZut4CsPWNCYWGseZAG7W/oC2cBKTnM0Ac/WemodxAEmsmo+3rM
	 q9myTxO8DJyyUMCJkeK+ju59FO4K6t0XCi1q7ONabVHIEFNzLcJuy40TQ5pO3eW8w9
	 3jcNlRQ6WjBoQ2K26S2aq4zpp1kL9VQmxzWHqJ/I4zbvfKX7dz2hm2F0ZBAQHw3A6z
	 FDkhvnpR/IlaQ==
Date: Fri, 24 May 2024 07:46:49 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: openembedded-core@lists.openembedded.org, rasmus.villemoes@prevas.dk
Subject: Re: [OE-core] [PATCH] insane.bbclass: use HOST_ARCH to check for 32-bit symbols
Message-ID: <7ubt3kdspc5rp6ab4k6qip2gakgh7wf77oj2llf677gkach6xe@fsqhtqt4eeed>
In-Reply-To: <a1e40553b608081c1f251c1ac61310f2583ee015.camel@linuxfoundation.org>
References: <20240523125441.45922-1-emil.kronborg@protonmail.com> <a1e40553b608081c1f251c1ac61310f2583ee015.camel@linuxfoundation.org>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: 5776c98ebafb021be4e43ebacbebbcb86f07438c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199830

On Thu, May 23, 2024 at 14:39 GMT, Richard Purdie wrote:
> This is not correct, e.g. HOST_ARCH does not always equal "x86" for 32
> bit x86 builds.
>=20
> $ MACHINE=3Dqemux86 bitbake -e | grep ^OVERRIDES=3D -C 2
> # pre-expansion value:
> #   "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNA=
ME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:=
forcevariable"
> OVERRIDES=3D"linux:i686:pn-defaultpkgname:layer-config:x86:qemuall:qemux8=
6:poky:poky-altcfg:class-target:libc-glibc:forcevariable"
>=20
> i.e. the x86 comes from MACHINEOVERRIDES.

There is obviously a problem when building binaries for an SDK and using
OVERRIDES for the check. To me, HOST_ARCH looks most correct, but if it
misses some cases, it should not be used as a one-to-one replacement for
OVERRIDES. Is there some proper way in BitBake to catch all 32-bit
architectures? If not, would adding i686, and potentially other missing
names, to the list of 32-bit time architectures, i.e
thirtytwo_bit_time_archs, be feasible?

--=20
Emil Kronborg


