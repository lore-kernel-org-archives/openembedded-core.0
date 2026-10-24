Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10076.1792863085499560880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 10:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i9D1mp7N;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32FB01A1321;
	Sat, 24 Oct 2026 17:31:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0CAC60769;
	Sat, 24 Oct 2026 17:31:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2282A10328DD2;
	Sat, 24 Oct 2026 19:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792863081; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xDKsSmjfZS7dn0cbqhisSeCPB80CwTfjY5abhtemABg=;
	b=i9D1mp7NK8CMhefDF1Y1RJn/1iK8ICKRczn/Zlj5eASR6B4htzZ4GXaaA4t0tbupmXlW7g
	CMvnA2EAmA0NcRM9uao1O7txixktXdJPwNx8IjRBLei9TtVlquSM/1z2NqYd63bhbqo4dO
	nhQ6sxrB35KsKUgz7kyBeJefKzFbmzr70wWmvAXzVz6+DzuuZg0gPYMyhCPTQ+5+TkGBCP
	RFOmJEz5Ld5SUuDjbZ2/SAyaV/l3HhfF/8l+yp9Wqxop5seqBx7E9hzFNY9cafSQzKg7S2
	vskpQ99aBqD1h92VC3lJfsj/CghvZydOtVEQdRkHluxYyUKaAuK4jrT9XFiTqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Oct 2026 19:31:18 +0200
Message-Id: <DMD8X3RTVWMC.Z82034UND8KZ@bootlin.com>
Subject: Re: [OE-core] [PATCH] elfutils: Fix backtrace ptests on musl
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261022154937.1328672-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261022154937.1328672-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 17:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248597

On Thu Oct 22, 2026 at 5:49 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> musl is built with -fno-asynchronous-unwind-tables, so libc.so carries
> almost no .eh_frame and its CFI only lives in .debug_frame. Without it th=
e
> unwinder cannot get out of abort () and run-backtrace-dwarf.sh fails with
> "No DWARF information found". Add musl-dbg to the ptest dependencies, lik=
e
> glibc-dbg for glibc.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

Thanks for your patch.

It looks like this is breaking some ptest on qemux86-64-musl:

AssertionError:
Failed ptests:
{'elfutils': 'START: ptest-runner\n'
...
             '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
             '2 of 259 tests did not behave as expected (2 unexpected passe=
s)\n'
             '(45 tests were not run)\n'
             'Please report to https://sourceware.org/bugzilla\n'
             '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1435

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

