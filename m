Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918AAC4450A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 17:20:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.259.1784395202574605178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 10:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=q+FTXD2U;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B0C84E40E3F;
	Sat, 18 Jul 2026 17:20:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E93BB60363;
	Sat, 18 Jul 2026 17:19:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B72211BD1202;
	Sat, 18 Jul 2026 19:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784395199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ivM+rpjqusQns12JGORbI/3/k9ydTTP1ifFgTbRfOX0=;
	b=q+FTXD2UtF4IAml/eKlvlfMZG5/sc1M7eNymkmfQUtJLW1glxBigITitpyqXMbhB40uXGI
	clX3gLlmzgZqKkV0WseQzjOruIgE7W0A6ofudqToYkNyJCDWRwbKazJIQxAUifbv96J9qh
	ZsfK0x1k5/QynZkrzkwxWOybqWtIWjPM2Kv64W5+e9uRd6Zf8Y6QJWvhAE4G3IVfQkA1Uc
	ysyMRoGCoGTcFMZQJkL7GVGbfc0HNtXn7ThDlhfsKKGFbwy+Xy92pNuFVPlAxyX+aL8hKn
	67FwfoR/NIulRzwvi8XZqlnCqFobSrGigAveMUzQDcbXLwjNv1NUCW/rS7Rv5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 19:19:54 +0200
Message-Id: <DK1VAZRFTOTC.Z792D3AQE422@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/2] seatd: use readyfd2sd to get rid of
 systemd service startup races
Cc: <yocto@pengutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Lucas Stach" <l.stach@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715101345.274000-1-l.stach@pengutronix.de>
 <20260715101345.274000-2-l.stach@pengutronix.de>
In-Reply-To: <20260715101345.274000-2-l.stach@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 17:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241266

On Wed Jul 15, 2026 at 12:13 PM CEST, Lucas Stach wrote:
> Currently systemd has no insight into the startup state of the seatd serv=
er
> process, so it might start dependant services too early, causing them to
> fail due to being unable to connect to seatd.
>
> Use the readyfd2sd adapter to convert the seatd s6 ready notification to
> systemd-notify and switch the service to the notify type to allow systemd
> to defer dependant service startup until seatd is ready to accept request=
s.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Hi,

Thanks for the new version.

It looks like the systemd.SystemdBasicTests.test_systemd_failed test is
failing with this patch, strangely, only for images built without x11
support:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/no-x11/build/layers/openembedded-core/m=
eta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/no-x11/build/layers/openembedded-core/m=
eta/lib/oeqa/runtime/cases/systemd.py", line 95, in test_systemd_failed
    self.assertTrue(settled, msg=3Dmsg)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
AssertionError: False is not true : Timed out waiting for systemd to settle=
:
starting
...
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (127.02s)
SUMMARY:
core-image-weston () - Ran 76 tests in 206.326s
core-image-weston - FAIL - Required tests failed (successes=3D42, skipped=
=3D33, failures=3D1, errors=3D0)
core-image-weston - FAILED - Last lines of QEMU boot logs:
--- qemu_boot_log.20260718112858 ---
[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49632)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49648)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49658)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49668)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49684)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49692)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49706)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49708)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49724)=E2=90=9B[0m.

[=E2=90=9B[0;32m  OK  =E2=90=9B[0m] Started =E2=90=9B[0;1;39mSSH Per-Connec=
tion Server (192.168.7.3:49728)=E2=90=9B[0m.


--- qemu_boot_log.20260718112858.2 ---
=E2=90=9B[!p=E2=90=9B]104=E2=90=9B\=E2=90=9B[0m=E2=90=9B[?7h=E2=90=9B[1G=E2=
=90=9B[0J=E2=90=9B[6n
=E2=90=9B[6n=E2=90=9B[!p=E2=90=9B]104=E2=90=9B\=E2=90=9B[0m=E2=90=9B[?7h=E2=
=90=9B[1G=E2=90=9B[0J=E2=90=9B[6n
=E2=90=9B[6n=E2=90=9B]3008;start=3D403e36bd5a1c42bbb36601d3a29037c0;user=3D=
root;hostname=3Dqemux86-64;machineid=3D8e279edcef204437b2cc30688f5a9895;boo=
tid=3D7994f691f1d5422db4ac58bdaddd68dd;pid=3D246;pidfdid=3D247;comm=3D(aget=
ty);servicename=3Dserial-getty@ttyS1.service;invocationid=3Dcefe0df5c3e3490=
7826aff9044103155;type=3Dservice=E2=90=9B\=E2=90=9BP+q6E616D65=E2=90=9B\

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4157

If needed, the build configuration is here:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7747007/raw_inlin=
e

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


