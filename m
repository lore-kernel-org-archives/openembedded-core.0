Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82479CCF2C1
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 10:29:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3848.1792232949255441395
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 03:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1wV1izcg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 619E04E4126B;
	Sat, 17 Oct 2026 10:29:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 178BA6038B;
	Sat, 17 Oct 2026 10:29:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F19D103281F4;
	Sat, 17 Oct 2026 12:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792232946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=foJQMNuiXgyeTPTkg/CwLXYS9TX/cboKgnorPlM70m4=;
	b=1wV1izcgAbkkGFmTO4AJ0dxa1XfTs5VFTV398LFbrNc7TGBfIIlK8uHYRP+aTLzRhFyYNA
	Xq0T87ju4cv+YilzvuGUlSjHz5bLEZEzeAg6FolPdMsu17l8rTBHP8R/We4lYxP5Fk35S8
	kAowTNZAQiiS1ilSa5svHQK5E5QAcZcxGEUi1W8LPGV3da2Jf2pdiwodT3Z5Nd33MV6s3Y
	Hi1Y1nBW6TeoaNj2To142Z2lApZhZkTixzgJZcUWmWt7tG3tHaEuv/0WoCKVlbUHMAp8B/
	WzaF55Wryoj4py3P9Z+ZLwh4v9FUb1h/7dQ8CO7YtPLCk1syBUYmfFugMFwIow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Oct 2026 12:29:03 +0200
Message-Id: <DM71K03PYNLU.ACDXXJ36A9BF@bootlin.com>
Subject: Re: [OE-core] [PATCH 5/7] tcl, tcl8: skip binary-40.3 on RISC-V
Cc: <raj.khem@gmail.com>, <tgamblin@baylibre.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <oo.hehir@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261016204547.2328847-6-oo.hehir@gmail.com>
In-Reply-To: <20261016204547.2328847-6-oo.hehir@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 10:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248077

On Fri Oct 16, 2026 at 10:45 PM CEST, OOHehir via lists.openembedded.org wr=
ote:
> binary-40.3 expects a negative float NaN to stay negative when widened to
> double. RISC-V returns the positive canonical NaN instead, as the ISA req=
uires,
> so the test always fails there. Reported upstream on the matching MIPS ti=
cket.
>
> Signed-off-by: OOHehir <oo.hehir@gmail.com>
> ---

Hi,

Thanks for your patch. Something looks wrong here, tcl/tcl8 ptests
started to fail on non-riscv architectures with a syntax error:

AssertionError:
Failed ptests:
{'tcl': 'START: ptest-runner\n'
        '2026-10-17T09:16\n'
        '/usr/lib/tcl/ptest/run-ptest: line 73: syntax error: unexpected '
        'newline (expecting ")")\n'
        '\n'
        'ERROR: Exit status is 2\n'
        'DURATION: 0\n'}

ptests which had no test results:
['tcl']

Failed ptests:
{'tcl8': 'START: ptest-runner\n'
         '2026-10-17T09:16\n'
         '/usr/lib/tcl8/ptest/run-ptest: line 69: syntax error: unexpected =
'
         'newline (expecting ")")\n'
         '\n'
         'ERROR: Exit status is 2\n'
         'DURATION: 0\n'}

ptests which had no test results:
['tcl8']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1396
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1385

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


