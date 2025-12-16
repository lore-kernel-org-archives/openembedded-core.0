Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F04D5CC99
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:40:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18740.1765878010282123990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xdurGIeS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 617D1C19D2E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:39:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE5746071C;
	Tue, 16 Dec 2025 09:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EBB311943283;
	Tue, 16 Dec 2025 10:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765878007; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bskzTvJwybmgXldcTybRSy6ym5w8NAkrJDsSKkCaVVk=;
	b=xdurGIeS3cbriAqGcJYIwbW2SvejHmHj1ivhWyMQZ/YjtubVdgb+aemLfWDOluvI6H7r4c
	2EGiNpgdE2Izl9fj4kRBJS+7lPhbA+5cqORm8ISp248afnBXm5m1MQgOEHvUXpPhuvkmzs
	sF0qyJZeZoYMfKSKvU72GJlptvma+x8NQMADOiLqtJvoVtAXKsRrFP6q5ymeCmuKKIbP3C
	zHBYFWbNGVwtHJuEFjCPH77Luz7enH8Iii3G7paK7D/p5NAKg6wcu+QaC2P9ADoaHaBpgh
	ST6e8uA6z5fpaAdfI9qgfRzfewNTNuFkbFzttSRQZWnxzECLCQd411i9ZVapBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:40:03 +0100
Message-Id: <DEZJIBHT7GKY.AIXJ4FBZHXER@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] socat: 1.8.0.3 -> 1.8.1.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251215084345.1797393-1-hongxu.jia@windriver.com>
 <20251215084345.1797393-2-hongxu.jia@windriver.com>
In-Reply-To: <20251215084345.1797393-2-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227931

On Mon Dec 15, 2025 at 9:43 AM CET, hongxu via lists.openembedded.org wrote=
:
> License-Update: No change, update README to add new lines
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Thanks for your patch.

It looks like the new version is having build issues with musl:

ERROR: socat-1.8.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/socat/1.8=
.1.0/temp/run.do_compile.476916' failed with exit code 1
...
| ../sources/socat-1.8.1.0/xio-netlink.c: In function 'xio_netlink_mtu':
| ../sources/socat-1.8.1.0/xio-netlink.c:33:59: error: initialization of 'i=
nt' from 'void *' makes integer from pointer without a cast [-Wint-conversi=
on]
|    33 |         struct msghdr rtmsg =3D { &sa, sizeof(sa), &iov, 1, NULL,=
 0, 0 };
|       |                                                           ^~~~
| ../sources/socat-1.8.1.0/xio-netlink.c:33:59: note: (near initialization =
for 'rtmsg.__pad1')
| make: *** [<builtin>: xio-netlink.o] Error 1

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


