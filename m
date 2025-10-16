Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E93CCD185
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 05:01:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.1200.1760590869701973503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 22:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I3s4t8jg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C0E64E410EA
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 05:01:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C3A5606D7;
	Thu, 16 Oct 2025 05:01:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D37F4102F22DA;
	Thu, 16 Oct 2025 07:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760590866; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHAlEJ3SRLSfmwSnLeexw6NGtQ16zjqaWPe002lLWSk=;
	b=I3s4t8jgWIwUIxiNQjRMaDsIYKO+pAyRRL+WWRIcff/4g2Z/872RcrzCcWw/WD8+1wPVpW
	Te87b4FoEAzIDzGuNlNuCuZOXJTx5PYf2wD/pQUoXZ/lAqKlTJE290H180Jz3yz0aRVD6u
	TKxwZJMPC7Nf8BzWVFwHCQkFR4dpXTXXSiGCkMssICf6bbn35kBU39+9ShpFPZGpW+bJXH
	mBpJC368wG+BquzmdbwPn5krxV4Q04pj3aPNd2bA9HviumnSlHQvkCrFiGvRmRxrOLsay9
	HbDQR4iFS1DtzrEgxijH3jRht2e4KqKdnyw8NXT1r5q22WHuxn6/vyFbvd0BvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 07:01:01 +0200
Message-Id: <DDJHDG8U5VH9.2S6H3E4F5TBSN@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] webkitgtk: upgrade 2.48.5 -> 2.50.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251015083804.623380-1-skandigraun@gmail.com>
In-Reply-To: <20251015083804.623380-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 05:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224943

On Wed Oct 15, 2025 at 10:38 AM CEST, Gyorgy Sarvari via lists.openembedded=
.org wrote:
> Dropped fix-armv7-compilation.patch, because it is included in this
> release.
> Dropped no-musttail-arm.patch, because it has been solved by project
> (a bit differently)[1]
>
> Added a new patch (related PR is under review currently), fix-musl-compil=
ation.patch
> to avoid build error when compiling with musl libc:
>
> .../Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_alloc=
ator.c:52:10: fatal error: execinfo.h: No such file or directory
> |    52 | #include <execinfo.h>
> |       |          ^~~~~~~~~~~~
>
> [1]: https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.0/Source/WTF/wt=
f/Compiler.h#L280
>

Hi Gyorgy,

Thanks for the new version. However, I believe we still have some build
issue, specifically on musl-x86:

ERROR: webkitgtk-2.50.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/webkitgtk/=
2.50.0/temp/run.do_compile.2081195' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/webkitgtk/2.50.0/build/JavaScriptCore/DerivedSources/Bytecode=
s.h:989:11: error: label 'op_instanceof_return_location' used but not defin=
ed
|   989 |     macro(op_instanceof_return_location, 0) \
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2615

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


