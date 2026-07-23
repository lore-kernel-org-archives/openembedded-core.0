Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7E2C44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 05:33:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17475.1784784808365811947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 22:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b+wS3Yfo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 263D01A119A
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:33:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDDC06038D;
	Thu, 23 Jul 2026 05:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EEDE11BD3B71;
	Thu, 23 Jul 2026 07:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784784805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b/YqJzAhWwEojosNVUpWIOILOQrWVseT3ciQfgYUkdQ=;
	b=b+wS3YfozzWKs8BBCzHgyCp7mt1Kf0rVhE8OIoeaz9VHoHpZYDY3KBnWYoDClOwl7EisQz
	wnxO9RFczHHu5AytnyrfscUhEJV7sxy5tTGV8nOXJ6fH1kuXEH3RuvlrreRF3ZMOsHdORc
	AQQRGygAxNUUud5FjOrF5nsusxfDfTJzFZ/rDeyKAnPxZL5pH+36bRDxQfFy4RYyyfr1PH
	ftM3eh27BwUbm/5c09qv/HC5OpYy20SOJSrcVrvlbSYEp5cntePdZI4d8xg4F9xPmmA+YZ
	j1qTwgS5r+YtpXr6BjWJ5iHa1/4VCufTo73a844smaWYHF5gvLMOXYtVqFJCtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 07:33:22 +0200
Message-Id: <DK5PEQXXJ9YA.34F0OF7DED7VM@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] rust: refactor source handling into a
 shared work-shared recipe
Cc: <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
 <20260722061757.109411-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260722061757.109411-2-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241772

On Wed Jul 22, 2026 at 8:17 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> [YOCTO #15808]
>
> Consolidate Rust source management across all Rust recipes (rust, cargo,
> libstd-rs and their native/nativesdk variants) into a single shared
> source tree using the work-shared pattern.
>
> Disk savings: a world build with multilibs enabled, together with
> nativesdk-rust and nativesdk-cargo, now shares a single ~4.2 GB rustc-src
> tree instead of maintaining up to 11 independent copies (~46.2 GB total).
>

Hi Deepesh,

> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-source.bb
> @@ -0,0 +1,56 @@
> +# rust-source.bb - Shared source recipe for the Rust toolchain
> +#
> +# This recipe fetches, unpacks, and patches the rustc source tree into a
> +# work-shared location so that rust, cargo, libstd-rs, and their native/=
nativesdk
> +# variants all share a single copy of the source. This eliminates duplic=
ation
> +# (up to 11 copies of the ~4.2 GB source tree in multilib + nativesdk bu=
ilds)
> +# and significantly reduces disk usage (~46.2 GB -> ~4.2 GB for rustc-sr=
c).
> +#
> +# Only do_fetch, do_unpack, and do_patch are meaningful here. All other
> +# tasks are disabled since this recipe exists solely to provide sources.
> +
> +SUMMARY =3D "Rust compiler and runtime libaries"
> +HOMEPAGE =3D "http://www.rust-lang.org"
> +SECTION =3D "devel"
> +LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"

Please use the new LICENSE syntax here...


> --- a/meta/recipes-devtools/rust/rust_1.96.1.bb
> +++ b/meta/recipes-devtools/rust/rust_git.bb
> @@ -4,6 +4,10 @@ SECTION =3D "devel"
>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"

... and here.

Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/beaglebone/build/lay=
ers/openembedded-core/meta/recipes-devtools/rust/rust-source.bb: rust-sourc=
e-1.96.1: LICENSE is using an old syntax and should be upgraded to: "Unicod=
e-3.0 AND (Apache-2.0 OR MIT)"

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


