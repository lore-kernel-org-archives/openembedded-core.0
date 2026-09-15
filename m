Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F3DC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:37:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18004.1789457854477457964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1c1U9uwg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BAF11A07AD
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:37:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E814E60498;
	Tue, 15 Sep 2026 07:37:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 699F311C7AFBF;
	Tue, 15 Sep 2026 09:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789457851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WhgGjdIZd343MSMr+UL9HLwdU3yLtKQ365W3Xxid/sU=;
	b=1c1U9uwgYKW3+YAK39FrSZS6+2TRv+omvQB9ZoHxV5v5ZkasDQLEFpLTkHsxvN8+42XrcD
	rzfsGtUmRcPJi7JrJLCzQ+asse0zmQLa7jOS1izkFxES8nyC01HfrxlyUz9XX1DDGqd4IW
	NQ2GU9v7gN4wAo8fV7S5VOBUf1G3WVr7SEF3OUN5rR56OQQfC+yxWKkEgFuBgEgBWdKi4d
	f4UK4i545cQVzQ5zUOcPiHhgXegMBA9WBOi8eRbanLPmBxUBIhc7OGAB8DqyYkn+wAQTXB
	9lmE0gtWl+SmJQAb6LoLurWnLxTjLLrDE6b6103QkregdKsPTkLzmd6eyAXFNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 09:37:29 +0200
Message-Id: <DLFPV7E70LU9.32YF2D5IUTKH8@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] flex: backport the upstream malloc
 prototype fix
Cc: <aurelien.desbrieres@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Aurelien DESBRIERES" <aurelien@hackers.camp>,
 <openembedded-core@lists.openembedded.org>
References: <3d12110d88ce771519ccedb12e7b6d0d24d7d17a.camel@linuxfoundation.org> <20260914085318.67139-1-aurelien@hackers.camp>
In-Reply-To: <20260914085318.67139-1-aurelien@hackers.camp>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245822

On Mon Sep 14, 2026 at 10:53 AM CEST, Aurelien DESBRIERES wrote:
> lib/malloc.c declares "void *malloc ();" with an empty parameter list
> and calls it with one argument. That meant "unspecified" in C89 and
> means "none" in C23, so a host compiler defaulting to C23 -- GCC 15 and
> later -- rejects the call:
>
>   lib/malloc.c:16:15: error: too many arguments to function 'malloc';
>                              expected 0, have 1
>
> The file is built by stage1flex with the build host's compiler before
> flex can build itself, so neither CFLAGS nor BUILD_CFLAGS reaches that
> command line and no flag in the recipe can silence it.
>
> Upstream fixed it in bf254c75b1e0 and the patch falls out when flex
> next releases. Gentoo carries the same backport as
> flex-2.6.4-fix-malloc-prototype.patch.

This patch is already applied to flex on the master branch, from commit
e1832f02d70b ("flex: fix build with gcc-15 on host"). Maybe you need to reb=
ase?

Antonin

