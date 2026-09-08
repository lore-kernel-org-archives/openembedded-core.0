Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BF8C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 21:27:39 +0000 (UTC)
Received: from tim.rpsys.net (tim.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.377.1788902847771390625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 14:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=2021 header.b=UsJsn9eq;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rpsys.net; s=2021;
	t=1788902840; bh=c5rzYIPVbWI3DPzsZRBBSekzVI2/N9cKLzjqf4pcTwg=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=UsJsn9eqdgRYE8oY7FF6AjeHZNtdrobEeA/qvySvpGgHXiqGSheZLbaaSIjL/KvI7
	 +DLQUEodjyhnMD+G05N5cFMInYB8yoBjzlMbwg5msPYzI/tIcFwR7oZia06ZGMseBR
	 bbYK5Wpw/M/oyt/gkN9Ll6icwG0inw9mR/yV96ChGvYXnG+6NTPkNqF1W7Wf0mgaU2
	 lip1ynFVSStsDM6AfqTvvbTI3twU6d9EZcQlWQW7iOHQXQ5OS0Z/rezMZV3JSBS6pZ
	 uTflGck+np+NfmhuLvrF0Cil7MiJRSAaYrASSqIGHbqsjIu5LcZjoc14V/txErR8br
	 OxV/oD8EpvFJA==
Received: from [192.168.1.129] (tim.rpsys.net [217.169.23.61] (may be forged))
	(authenticated bits=0)
	by tim.rpsys.net (8.18.1/8.18.1/Debian-6~bpo12+1) with ESMTPSA id 688LRJgo909375
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 8 Sep 2026 22:27:20 +0100
Message-ID: <4a24a47b584780a1fcb592c10ad8b54c46e4fd63.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH v5] rust: Avoid passing host-specific
 information to crates
From: Richard Purdie <rpurdie@rpsys.net>
To: alhe@linux.microsoft.com, openembedded-core@lists.openembedded.org
Date: Tue, 08 Sep 2026 22:27:14 +0100
In-Reply-To: <bdb742a4-8a83-4424-bdfa-7bd29ebdf421@linux.microsoft.com>
References: <18D363CCD7DEB481.108400@lists.openembedded.org>
	 <bdb742a4-8a83-4424-bdfa-7bd29ebdf421@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at tim
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245390

On Tue, 2026-09-08 at 10:03 -0600, Alejandro Hernandez Samaniego via lists.=
openembedded.org wrote:
> =C2=A0
>=20
> I was able to debug a few more issues, I admit I don't have an autobuilde=
r set up
> available so its still possible that this wont address everything, but I =
think its
> worth spinning it at this point.
>=20
> To find these, I attempted to reproduce the reproducibility check, I did =
iterative
> builds on x86-64 and aarch64 hosts and did byte-to-byte comparison on the=
 build
> artifacts.
>=20
> Fixed the build tag based on the comment by Richard, and v4 -> v5 had som=
e typos.
>=20
> Please let me know the results of the AB testing.
>=20

Thanks for this. I ran it through testing and the rust test suite isn't hap=
py on any arch, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/4691

but I've triggered the reproducibility build tests and we'll see what they =
show:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/4
https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/4
https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/4

Cheers,

Richard


