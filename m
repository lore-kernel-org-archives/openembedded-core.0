Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.780.1793897685235262307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 08:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Guq5b0pq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B950D4E40830;
	Thu,  5 Nov 2026 16:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 789135FF43;
	Thu,  5 Nov 2026 16:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BEAF10329289;
	Thu,  5 Nov 2026 17:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793897678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dMuJ0wfiLkSN5J64tOM/B4eB9IfyxkWBjbVOCwZQbr8=;
	b=Guq5b0pqF15NB3BEIgYbsaJO5LUFwq5yj8TpYxUTOzjBwydevgLbdQct8uKL2xzYI/qW+w
	ai6cdjBYezbeqCRVcWFUgdFulyyxUKuXoMqPUL8qoz00GPKJtXY8EZJvAjV4/czaLUlQvH
	RE4+nPtza6dij0JFELM4aE/qeUiSn26j0fG9qQtfvqz2Vqs2T0MFQsT6gnMC8UL5yv7Imb
	vk02k92qRr2ENCdfQBiw4yMgy5igpe6dPphnw7j+4ZlhbQ+ajLWgEv2nYwYM6o/crThHgj
	OqQDK1Jnu+kIqqq7BVzd3WNRMA6LIhnwuOWAD0JeD/x/XL8CkA8mVqQaXfuL6w==
Message-ID: <eacf0910-e3a1-4820-ae91-513e3644db5a@bootlin.com>
Date: Thu, 5 Nov 2026 17:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] python3-uvloop: enable ptest
To: mathieu.dubois-briand@bootlin.com, tim.orling@konsulko.com,
 openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261102011816.3710992-2-tim.orling@konsulko.com>
 <DMKSA11YDYBP.33D4G9KGENZHA@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DMKSA11YDYBP.33D4G9KGENZHA@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 16:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249565

Hello, Tim and Mathieu

On 11/2/26 3:10 PM, Mathieu Dubois-Briand via openembedded-core wrote:
(...)
>=20
> I can see it tends to fail on riscv.
>=20
> First build:
> Failed ptests:
> {'python3-uvloop': ['tests/test_regr1.py:TestIssue39Regr.test_issue39_r=
egression',
>                      'tests/test_tcp.py:Test_UV_TCPSSL.test_create_conn=
ection_ssl_1',
>                      'tests/test_tcp.py:Test_UV_TCPSSL.test_create_serv=
er_ssl_over_ssl',
>                      'tests/test_tcp.py:Test_UV_TCPSSL.test_renegotiati=
on',
>                      'tests/test_tcp.py:Test_AIO_TCPSSL.test_create_con=
nection_ssl_1',
>                      'tests/test_unix.py:Test_UV_UnixSSL.test_create_un=
ix_connection_ssl_1',
>                      'tests/test_unix.py:Test_AIO_UnixSSL.test_create_u=
nix_connection_ssl_1',
>                      'tests/test_unix.py:Test_AIO_UnixSSL.test_create_u=
nix_server_ssl_1']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2713
>=20
> Second build:
> Failed ptests:
> {'python3-uvloop': ['tests/test_regr1.py:TestIssue39Regr.test_issue39_r=
egression']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2714
>=20
> This is riscv, so emulation is slower than for other architectures.
> Maybe we need to relax a bit some timings.
>=20
> Thanks,
> Mathieu

FYI, there was another failure on RISC-V related to another patch in=20
this series:

Failed ptests:
{'python3-websockets':=20
['tests/asyncio/test_client.py:ClientTests.test_reconnect']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2734/s=
teps/15/logs/stdio

--=20
Best regards,
Jo=C3=A3o Marcos Costa

