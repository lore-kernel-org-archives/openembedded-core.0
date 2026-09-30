Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51815CA5FAB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 06:04:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7171.1790748266386814533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 23:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lhV0ixB9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 167964E410D2;
	Wed, 30 Sep 2026 06:04:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF6BA60749;
	Wed, 30 Sep 2026 06:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68F4A10329825;
	Wed, 30 Sep 2026 08:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790748263; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TUaXZl9LFyQB6Aqw2jN8QKpekKxQJvRhiNk1ctsUY3k=;
	b=lhV0ixB9TXAsJUyoeKUYMFGYeHpZ7JH6DM7TtFUKY5aXmcOcbiSqvC0gUmO4I9xAmKS6pk
	Rafrsik08ZYabdYKjDDNPBzRd5CB8KME64G8SM1I6emcr1Hwkm4NZXMyrw1XFQukurWR2e
	6+AzXARGnQr5xYxdNDN2TjSTHYL+ffTIhfXGwySdUOdf6lYZAlAkSQazH8wMzJOvVI+VDf
	wNy1aJpch380DLS/c0vEnBYkOVGRSzJV0v6RYV1bZ0sBqmvbAB0T9pKofs1w5sUqHgje5a
	fuB6/70VgCXgDXDnPwYYz40GDC7XGPWwvEnYUGTiQJeq86Ajr1hqydWFABitoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 08:04:21 +0200
Message-Id: <DLSFA2EWD42U.1UHXEHKQC0TMP@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] systemd: Upgrade 261.3 -> 262
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
 <20260929065933.71437-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260929065933.71437-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246919

On Tue Sep 29, 2026 at 8:59 AM CEST, Jaipaul Cheernam wrote:
> NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877
>
> - Refresh patches for v262
> - Drop deprecated meson build options [1]
> - Drop 0001-include-fix-limits.h-override.patch [2]
> - Add rules: install 60-persistent-media-controller.rules [3]
>
> [1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
> [2] https://github.com/systemd/systemd/commit/6a131b32e0fe948e845ae4bf41f=
8fed003ec30ce
> [3] https://github.com/systemd/systemd/commit/d153b49473
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the new version. It looks better, except for a test fail:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-alt/build/layers/openembedde=
d-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-alt/build/layers/openembedde=
d-core/meta/lib/oeqa/runtime/cases/systemd.py", line 100, in test_systemd_f=
ailed
    output +=3D self.systemctl('status --full --failed')
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-alt/build/layers/openembedde=
d-core/meta/lib/oeqa/runtime/cases/systemd.py", line 26, in systemctl
    self.assertEqual(status, expected, message)
AssertionError: 3 !=3D 0 : SYSTEMD_BUS_TIMEOUT=3D240s systemctl status --fu=
ll --failed
x systemd-coredumpd.service - Listen Kernel Core Dump Socket
     Loaded: loaded (/usr/lib/systemd/system/systemd-coredumpd.service; ena=
bled; preset: enabled)
     Active: failed (Result: start-limit-hit) since Tue 2026-09-29 15:04:12=
 UTC; 6s ago
 Invocation: 14d841285f64478290e42885757aee13
       Docs: man:systemd-coredump(8)
    Process: 841 ExecCondition=3D/usr/lib/systemd/systemd-coredump --check-=
requirements (code=3Dexited, status=3D1/FAILURE)
   FD Store: 0 (limit: 512)
   Mem peak: 2.1M
        CPU: 43ms

...
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (1.69s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/4667

Can you have a look at that?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


