Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA50CA6017
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 03:50:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3390.1791604218789952871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 20:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xuU5i77C;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BBD44E411C6;
	Sat, 10 Oct 2026 03:50:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AEA66075D;
	Sat, 10 Oct 2026 03:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C63411D70BDA;
	Sat, 10 Oct 2026 05:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791604214; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KG60U8JVq5lV0ZDySAoHGm/VO7zx+w+lduHJm7UJV98=;
	b=xuU5i77ClJkyFsJ+ZCTTHDKWFvdrI7yybSPMb7Isqo0ieslsdoUzOecSpeEcs0FdLrc6cc
	t5fZNPMhxJDpfjDiJPp5QO/eCndlNHcBGQ+eTYlQtQRv6UQuzhgtu7Le3T8yrHVjQWjY4d
	fdL48AD3pvRqHMjRaEl+yHF8idzpGsHaHm6S7lm2nLsE5cTMnOhrLffXtbkZsEuyTXHwhX
	VyY8jT5VfZoia7CW6zQ/t5liteUH7Bn8/zK57Oms0KWboy0r8r3g31alioyfR+8oYWh2K8
	BugV8mZmSEbbmq+wXERi/GIx0EVPaT4LF58fzZkhbs42PKjBV8FraW07lXoTvw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 05:50:11 +0200
Message-Id: <DM0UOS73NIO8.2EU8I5189XEIK@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261008094148.752601-1-ross.burton@arm.com>
In-Reply-To: <20261008094148.752601-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 03:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247488

On Thu Oct 8, 2026 at 11:41 AM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Lots of upstream changes, see the full release notes at
> https://github.com/cython/cython/blob/master/CHANGES.rst
>
> Backport a commit to fix non-reproducible code generation. The type
> inference is still non-deterministic if there's ambiguity[1], but this
> fix ensures there's no ambiguity in cython itself.
>
> Disable parallel builds because there's a race which causes occasional
> build failures[2]. This has a non-trivial implication to build time
> (89.1s to 243.1s on my machine), but it builds.
>
> [1] https://github.com/cython/cython/issues/8002
> [2] https://github.com/cython/cython/issues/7997
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like we have intermittent reproducibility issues :/

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5147
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20261009-v2gtsbmt/=
packages/diff-html/

It looks likes some generated _shared.c file with differences between
the two builds:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20261009-v2gtsbmt/=
packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproduc=
ibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-x------v----reproducibl=
eA-tmp-deploy-deb-x------v--python--cython-src_-.-.--r-_amd--.deb---data.ta=
r.xz---data.tar---.-usr-src-debug-python--cython--.-.--Cython-_shared.c

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


