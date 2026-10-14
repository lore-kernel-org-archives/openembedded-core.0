Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564A6CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 11:48:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11568.1791978506147844922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 04:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k3TwfiaG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 984C3C63447
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 11:49:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3B4860368;
	Wed, 14 Oct 2026 11:48:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C23510328200;
	Wed, 14 Oct 2026 13:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791978499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z09CUkeoJG44CJy+OyZsmX7/gd0K+lcEINdFUAsFmXA=;
	b=k3TwfiaGeOc8PAqCRQvVJtQ8bfkuS8m5g9YSFtOvwMUun4+qBOFji/y90HEFZcyTkU7fQ0
	v0BWDYJr0+RnBtNLK+7gd9wOKlni/muUniH1A6k+xftxtVhBP+pRkYtJEKO1Es8Le6O+F7
	GZ7HtI9AaL2rLtsaWoUyMxDQ2AYLLbHjCb0GWiFBcS9Dlk2Fuz8/ir8OMAUUk+teL9YPPz
	ZA8Pmjpy3v6h8YmiER/jLM+qQ2KI0EEnOZ1ZNHGqKt6W94s6eWSfa/5tucMaFtUn5No5uS
	qzNjsyWCFY+iJYX/KeAb2YqGyF2uDMaD7LFYO02i/E3GtdbOaTFcE0xAAUQTdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 13:48:17 +0200
Message-Id: <DM4JD0YNS0WB.3T9SS6VQUFL6Y@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] libsoup: add ptest support
Cc: <pratik.farkase@ericsson.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012095602.19261-1-pratik.farkase@est.tech>
 <20261014085044.14497-1-pratik.farkase@est.tech>
In-Reply-To: <20261014085044.14497-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 11:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247756

On Wed Oct 14, 2026 at 10:50 AM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> Tested on qemux86-64 with ptest-runner: 36 tests, all pass.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version. It looks like we are still getting OOM
issues:

WARNING: core-image-ptest-libsoup-1.0-r0 do_testimage: There were failing p=
tests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptest=
runner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestr=
unner
    self.fail(failmsg)
AssertionError: ERROR: Processes were killed by the OOM Killer:
[   38.188495] Out of memory: Killed process 563 (logger-test) total-vm:420=
9544kB, anon-rss:3997540kB, file-rss:36kB, shmem-rss:0kB, UID:0 pgtables:79=
04kB oom_score_adj:0

Failed ptests:
{'libsoup': ['libsoup-3.0/logger-test.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4743
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1364
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1379

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


