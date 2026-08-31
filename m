Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA7FC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 07:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24919.1788163112983991184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 00:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=X7d2BCZV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 049931A18EB;
	Mon, 31 Aug 2026 07:58:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCA84601E1;
	Mon, 31 Aug 2026 07:58:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16FDA11C783E9;
	Mon, 31 Aug 2026 09:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788163106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=COWGLoEAF41hN+hKjhqJ0quMd5niIND0tDhq6SYsyD8=;
	b=X7d2BCZVIV30A6T6QHmBrEPBL5zKZPcUx5MxWOcVMhawFkOvozmAC7UXVPv9g98fqzRxF9
	DmJg0HEGRb4h+o6A18rTkRfvIO5ONMef4b4Ko+/cOXLCWIS0Rn4mw5GdKRVyIepXp09ylQ
	hfgKidgadhJN0kr2wqAqL+9Xv6Al1PZM0hHvs47couKhsKLtwC5CI2VcZ8Sh0j+axG+M3O
	t6qe1RgU/7hLPyrCt6Eb+gcB4dtTvsDu4mGf1rNHZJ/ykZ3GEqBDFRoBNEJiy/bq74MEsV
	pQdbU9Frs0Ps4VGZp+TpRCGyFxuMqJThYUYl6bKx3aD+3vyvPZ4+pzS2WDbJSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 09:58:24 +0200
Message-Id: <DL2YX1KDEX5Y.3TRD6JJ6RJF7J@bootlin.com>
Subject: Re: [OE-core][PATCH v4] zstd: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519090816.17783-1-pratik.farkase@est.tech>
 <20260831062453.8048-1-pratik.farkase@est.tech>
In-Reply-To: <20260831062453.8048-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 07:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244734

On Mon Aug 31, 2026 at 8:24 AM CEST, Pratik Farkase wrote:
> Add ptest support for zstd running fullbench and the upstream cli-tests
> suite, providing integration testing of compression, decompression,
> dictionaries, file handling, and CLI behavior.
>
> Tests included:
>   - fullbench: validates all internal compression/decompression functions
>   - cli-tests: 41 shell-based integration tests covering compression,
>     decompression, dictionaries, file-stat, progress, symlinks,
>     cltools, and multi-threading
>
> The cli-tests run as the ptest user so that permission-related tests
> work correctly. The levels.sh test is patched to skip the --max
> compression level on systems with less than 10GB RAM, as it allocates
> ~8.5GB on 64-bit systems.
>
> Tested on qemux86-64 (4GB RAM) with ptest-runner: fullbench PASS,
> cli-tests 41/41 PASS. Runtime is ~41 seconds.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for adding tests. It looks like some of these are failing on the
autobuilder:

Failed ptests:
{'zstd': ['compression/window-resize.sh',
          'compression/window-resize.sh.check_stdout',
          'cli-tests']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4443

Test outputs can be found here:
https://valkyrie.yocto.io/pub/non-release/20260831-42/testresults/qemux86-6=
4-ptest/core-image-ptest-zstd/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


