Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41F4C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 17:45:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24800.1784915102149103419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 10:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z9EY9um8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C97C64E40F30;
	Fri, 24 Jul 2026 17:44:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E50F60395;
	Fri, 24 Jul 2026 17:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B74711C129E3;
	Fri, 24 Jul 2026 19:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784915098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yr6ue8Myh7kdAn/apC1Ie/TqgxOgzs9J5NR/s1Mlsx4=;
	b=z9EY9um82odLcAX9HJWW5YdvEk17bER3NFkRchvCF6SvmH4pQO2YZKkwCQ2YRmgfzcFEvV
	Jmsa90PsYQ5f4b3DNHQVoPRUkzaV+6/JIa2h03cEIp9vbIWC4qP5M1Ly7FrVBsprFNJ1Cv
	UkjcAQcpNYZldvs8RMZpXXHKu8NmzZ1qOImH1Rw1V1zGWKAQN09ASzifmVn+BYHorFv2pa
	TAQSD5YqUzNxYItd8Q3SKzS10EnM4j8NFZzMo5yCxfCARDaM2PbBUEmJuRpQN6FgQkA3ar
	ruAr/6EgLv0pE0ojmG8Ur4/3MR5oKZtxO+pH79r1msC/Wxoc8KhZifhvyW2qSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 19:44:54 +0200
Message-Id: <DK6ZLE8Z4WZG.3VXZXP49YQWE0@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] libarchive: ptest: run tests from tmpfs to
 avoid inode overflow failures
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260720122619.34696-1-pratik.farkase@est.tech>
 <20260720125854.39562-1-pratik.farkase@est.tech>
In-Reply-To: <20260720125854.39562-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 17:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241940

On Mon Jul 20, 2026 at 2:58 PM CEST, Pratik Farkase wrote:
> The bsdcpio_test odc/newc format tests verify archive headers byte-by-byt=
e
> including inode and device numbers. On ext4 root filesystems (particularl=
y
> qemuarm64 and qemuriscv64) inode numbers can exceed the odc 6-octal-digit
> or newc 8-hex-digit field widths, causing intermittent assertion failures
> in test_format_newc and test_option_c.
>
> Run all tests from a tmpfs working directory where inode numbers always
> start small, avoiding the overflow condition.
>
> [YOCTO #16231] : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1623=
1
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version. It looks like we have some ptest failures
here:

Failed ptests:
{'libarchive': ['libarchive_test',
                'bsdtar_test',
                'bsdcpio_test',
                'bsdcat_test',
                'bsdunzip_test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4107
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4091
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1981

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


