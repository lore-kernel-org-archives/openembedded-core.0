Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D98C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 11:29:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29063.1785151782739844910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 04:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t/ko66g8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BDFF4E40F99
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 11:29:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 404A4601BE;
	Mon, 27 Jul 2026 11:29:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65F4511C132A0;
	Mon, 27 Jul 2026 13:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785151779; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I69AqcMzSyFd8TY3lIqbPzXWSqEG1ErWTCSaMmPkJHI=;
	b=t/ko66g8PEwHDxZ37vJVRSheQA3mhpTYIST3yrgjncMzto0kdyTsN8+iRloWyUWWEq5jR1
	k/u3xwLDQe3p1Vd1PEK5AdTe+T94RMQw4SL/w9r/FKAX5WBhSArccB2Tnbtq02C2vdSi8H
	aENjnV+3T3tUfnZE+GPSNIw1TKJIwbnhwH+ETBFZ6BNXv7rI8b0pIcaRfkFVdHzsKRSOhn
	d0AhfWGd2cqhsS28sx6a781mESlMOqF4kUYlCOEkIQr9fPY0Ocwa7r8zZjR8OPTkDcAZRX
	/XDX0NoKJRhBG/PQm9iC53TZDpYlfk6MG6zYWb6v4DVOgg8p9rIcmciZsMUmCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:29:37 +0200
Message-Id: <DK9BHOZIOEJ5.2BRG4ADH7JAK3@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/3] rust: refactor source handling into a
 shared work-shared recipe
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260725035136.1260408-1-Deepesh.Varatharajan@windriver.com>
 <20260725035136.1260408-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260725035136.1260408-2-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 11:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242087

On Sat Jul 25, 2026 at 5:51 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>

Hi Deepesh,

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
> Performance (clean core-image-sato build, qemux86-64):
>
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
> +SUMMARY =3D "Rust sources"
> +HOMEPAGE =3D "http://www.rust-lang.org"
> +SECTION =3D "devel"
> +LICENSE =3D "(Unicode-3.0 AND (Apache-2.0 OR MIT)"

We are missing a closing parentheses here. I believe you can remove the
opening one.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


