Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEA9CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:53:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8374.1790690029940569359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wu6zqqqb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A2DA4E410B8;
	Tue, 29 Sep 2026 13:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E447601BD;
	Tue, 29 Sep 2026 13:53:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FEC410328246;
	Tue, 29 Sep 2026 15:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790690026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U2aPJEnbTCcoaq9LxIm7qeDIf6MKPW2kAas1ZXrkLoU=;
	b=wu6zqqqboKD3Pn6CWdmkF48bjJTLNiJ4kxBdn/WpKDYNKLvDBgOwKkBUaNcouLengJQOaI
	yq2i8clZyBgMTSPXvAZ2SVEcWnLOAQZhNOHHZTage1f3311P8Jq/tsVjar8FsPRuWtUReP
	kDhq5syy0FqN0Na/gZkxmL3Xmb1Lx1ZxdgsuqOpkXXeJ4D0l5s73mVPyiPafQrNB0UGDw0
	I/u6vNaLd3EDcgOleC4nADgkEcTmQK+X4bRbjw5un6xP5mK3HQbHPW1im4ZFlKuWrxzs8m
	DtHtf23h4AT7bduuNcYg01ImVKUTMI7fFyHvUVrm7PS+Fl29QXTahSjm1zYB/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 15:53:44 +0200
Message-Id: <DLRUMWW7UMVV.2ELAA2KNK0F22@bootlin.com>
Subject: Re: [OE-core][PATCH v2] libpcap: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260928130950.49433-1-pratik.farkase@est.tech>
 <20260928134522.51765-1-pratik.farkase@est.tech>
In-Reply-To: <20260928134522.51765-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246871

On Mon Sep 28, 2026 at 3:45 PM CEST, Pratik Farkase wrote:
> Build libpcap's upstream testprogs and run the TESTrun harness under
> ptest. The harness drives filtertest, translatetest and enumeratetest to
> compile and translate BPF filter expressions against bundled savefiles an=
d
> compares the results with the embedded expected output. These tests are
> offline and deterministic and need no capture privileges or network.
>
> Tested on qemux86-64 with ptest-runner: 14801 passed, 0 failed.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for adding tests. It looks like this is failing on riscv64,
probably because of the performances of the qemu machine:

AssertionError:
Failed ptests:
{'libpcap': 'START: ptest-runner\n'
            '2026-09-29T12:01\n'
            'Timeout! System state:\n'
            'Collected system state:\n'
            '+ dmesg\n'
	    ...
	    '\n'
            'ERROR: Exited from signal Killed (9)\n'
            'DURATION: 451\n'}

I did happen on my two runs:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2498
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2501

Can you have a look at it? It might be some timeout we can increase, or
maybe we have to disable this test on riscv.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


