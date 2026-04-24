Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA8BFE520D
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 11:34:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19167.1777030436416451447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 04:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vQ+C1QUS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 305B0C5EF2B;
	Fri, 24 Apr 2026 11:34:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43FBC604EB;
	Fri, 24 Apr 2026 11:33:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9057F107207BB;
	Fri, 24 Apr 2026 13:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777030427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AeYBPtO5S4XKB6UcoCJ9hpnsGqyn0PLgvR1+UcyFIDs=;
	b=vQ+C1QUSzewDoKwZdFr5jsW0lPNEPHM+9289Rll/N4IHmECA1StoVoCa6JRdwc7CSyi4Yh
	eqLCJZCpwF51WOTEKD/77fzyhfgnvX5LDLn5vDGDLwVdpIPb+nmQJiUhuW3wt5QXT5loQA
	rQA6usUSQve4g992MeuOec841zVTG73SCPYCuJ/So6uV6+W/6DqzU9nWWPyeMY40v4tn3Z
	LF4Lyt1y/8sO7pX3bAZOJPpIjiHyhnT0DxFXrY/w59ZGafAcovsLnD3ne1pxmjw/uk5N2k
	g+MJySQjBc6hzAAFHm8r0uDfbTUN6L/e0NEJ8tZ3kSuU4d5BDQ+7ilCPYe57uw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 13:33:40 +0200
Message-Id: <DI1CPLA12N5H.16XL7T8INAAJ6@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] rsync: add ptest support
Cc: "Yi Zhao" <yi.zhao@windriver.com>, "Ross Burton" <ross.burton@arm.com>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Jhonata
 Poma-Hansen" <jhonata.poma@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Jhonata.poma@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260423113024.2549245-1-jhonata.poma@gmail.com>
In-Reply-To: <20260423113024.2549245-1-jhonata.poma@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 11:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235860

On Thu Apr 23, 2026 at 1:30 PM CEST, Jhonata Poma-Hansen via lists.openembe=
dded.org wrote:
> Wire up upstream's runtests.sh testsuite as a ptest package. The
> testsuite runs rsync itself through 43 .test scenarios covering
> ACLs, xattrs, device nodes, hardlinks, symlinks, daemon mode,
> filters, backup, batch, etc., plus 3 CHECK_SYMLINKS variants
> (chown-fake, devices-fake, xattrs-hlink).
>
> Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
> ---

Hi Jhonata,

Thanks for adding tests.

It looks like this is failing on the autobuilder, riscv64 machine. This
might be due to timings, as these machines tend to be slower.

AssertionError:
Failed ptests:
{'rsync': ['hardlinks']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1505

Additional logs can be found here:
https://valkyrie.yocto.io/pub/non-release/20260424-40/testresults/qemuriscv=
64-ptest/core-image-ptest-rsync/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


