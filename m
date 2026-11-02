Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13473.1793628621151357477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 06:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ng9pUjUs;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF1DC4E413CF
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 14:10:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76F8860750;
	Mon,  2 Nov 2026 14:10:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CFFE10328C5E;
	Mon,  2 Nov 2026 15:10:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793628613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mYBZh4MBfD7z858jOdgahy41HhJoDiGdqJetYsn5KBw=;
	b=Ng9pUjUs+Crx68Jz9AmX3vB6O8tMKr5myfPfMTGm2YuZ8gStMVQUGQsGcmpm4Y9iLohuRk
	Tr8O9sYV1AIta9n9827Tvqm/zR0E6IXlPnY+9s5DJZdKzjUy9K1uoTV7A4tY69PTcMIkSc
	NbvAwrwK+r3rBcV1U9EeiR8uTeiWHfeICCWbFPbAFMf7axn5Xq3hyM91nMakt6dTznAZu+
	2a5aoewN9MOHlD9+sLGlVlNDw5Ax9I4njaoZBKyT9kf21x90bCoibmTJsnFSBm/SMkLGBF
	+3BacYnUh1vgwYyOcWL3936rFD91sfFzkQkmdJDCV4ek+RHFy8qWtd6KCvlqUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 15:10:11 +0100
Message-Id: <DMKSA11YDYBP.33D4G9KGENZHA@bootlin.com>
Cc: "Trevor Gamblin" <tgamblin@baylibre.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tim.orling@konsulko.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/5] python3-uvloop: enable ptest
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261102011816.3710992-2-tim.orling@konsulko.com>
In-Reply-To: <20261102011816.3710992-2-tim.orling@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 14:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249211

On Mon Nov 2, 2026 at 2:18 AM CET, Tim Orling via openembedded-core wrote:
> From: Tim Orling <tim.orling@konsulko.com>
>
> The sdist ships the test suite. run-ptest deselects:
> * tests that conflict with pytest's output capture;
> * tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,
>   which bypasses uvloop's preexec_fn fork hook;
> * DNS tests that wait for resolver timeouts without network access,
>   which took the suite from 1 to 10 minutes over tap without NAT.
>
> .flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and
> mypy are missing.
>
> Tested with core-image-ptest-python3-uvloop on qemux86-64 (kvm, tap):
> 455 passed, 35 skipped, 0 failed in 82s, so add it to PTESTS_SLOW.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---

Hi Tim,

Thanks for your patch.

I can see it tends to fail on riscv.

First build:
Failed ptests:
{'python3-uvloop': ['tests/test_regr1.py:TestIssue39Regr.test_issue39_regre=
ssion',
                    'tests/test_tcp.py:Test_UV_TCPSSL.test_create_connectio=
n_ssl_1',
                    'tests/test_tcp.py:Test_UV_TCPSSL.test_create_server_ss=
l_over_ssl',
                    'tests/test_tcp.py:Test_UV_TCPSSL.test_renegotiation',
                    'tests/test_tcp.py:Test_AIO_TCPSSL.test_create_connecti=
on_ssl_1',
                    'tests/test_unix.py:Test_UV_UnixSSL.test_create_unix_co=
nnection_ssl_1',
                    'tests/test_unix.py:Test_AIO_UnixSSL.test_create_unix_c=
onnection_ssl_1',
                    'tests/test_unix.py:Test_AIO_UnixSSL.test_create_unix_s=
erver_ssl_1']}
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2713

Second build:
Failed ptests:
{'python3-uvloop': ['tests/test_regr1.py:TestIssue39Regr.test_issue39_regre=
ssion']}
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2714

This is riscv, so emulation is slower than for other architectures.
Maybe we need to relax a bit some timings.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

