Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585F7EF586F
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 09:03:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22241.1771146197118503023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 01:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BMJvdVzX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D41D71A0F34;
	Sun, 15 Feb 2026 09:03:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EF08606CE;
	Sun, 15 Feb 2026 09:03:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D87A10368FED;
	Sun, 15 Feb 2026 10:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771146193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bOT5BRD4L+GU2cIfRoEi3C26fY1oa/AQTsfdzWyqcdQ=;
	b=BMJvdVzXAGAT0HIbyO7QFimwJrTUKykpueGnwUQObFAYw6cjTHNUkBfiPcV5vbM+YmFDvT
	pcB4EbNh7vpjXH0MjPxqXRXuRjRNYavgV++F8oLLvl5ulf+dPJmGWOWmN3dU44RRlyfcVh
	WY59dbkMDaeEy113qqFI2Wl7Ve90cMcUsSJ8zkmr34IFLV5U7KqgnjK40r0z5SKbpbL+Lz
	1sKTaTlAPSFOxDQgHSwrRr2MkQTCa+GNDpzaYPT+bKzsfQIT3tbB3ginQb7kNAAJ4nzGex
	BeJ+lVx9g1U0J8nHqePc6XLtcqdlRZb/RuQGf+4m5gOxJvcj8UDWe2cJ+UzJlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 10:03:08 +0100
Message-Id: <DGFEXAE48FOM.2H2FQ3F1P9HSX@bootlin.com>
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
 <alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
Subject: Re: [oe-core][RFC] xuser-account: convert to standard-user-account
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260210002506.95298-2-rs@ti.com>
In-Reply-To: <20260210002506.95298-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 09:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231156

On Tue Feb 10, 2026 at 1:25 AM CET, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Change this single xuser account template into a generic
> standard-user-account that uses distro level variables for
> configuration.
>
> This allows for seamless configuration of multiple out-of-box scripts
> and tests across layers without having to implicitly hope that the
> username or groups haven't been changed by a bbappend or recipe
> override.
>
> This was proposed specifically to remove some issues highlighted in:
> https://lists.openembedded.org/g/openembedded-core/message/230665
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

I know this is still an RFC, but it went into by weekend batch of RFC
patches tested on the autobuilder.

A note first: this was tested without your other display manager series.
I hope there is no dependency.

So far we had the following issues:

AssertionError: ssh exited with status '255' for command '['ssh', '-l', 'ro=
ot', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '-o=
', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', '-=
o', 'LogLevel=3DERROR', '192.168.7.8', 'export PATH=3D/usr/sbin:/sbin:/usr/=
bin:/bin; export XDG_RUNTIME_DIR=3D/run/user/`id -u weston`; export WAYLAND=
_DISPLAY=3Dwayland-1; wayland-info']': this is likely an SSH failure
id: unknown user weston
failed to create display: No such file or directory
...
RESULTS - weston.WestonTest.test_weston_running: FAILED (0.80s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3189
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3316
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3214
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3090

And a second one:

2026-02-14 17:59:08,803 - oe-selftest - INFO -       ERROR: Nothing PROVIDE=
S 'standard-user-account' (but /srv/pokybuild/yocto-worker/reproducible/bui=
ld/layers/openembedded-core/meta/recipes-graphics/wayland/weston-init.bb DE=
PENDS on or otherwise requires it)
2026-02-14 17:59:08,803 - oe-selftest - INFO -       standard-user-account =
was skipped: Recipe standard-user-account, package standard-user-account: s=
ystem groupname "disk" does not have a static ID defined. Add disk to one o=
f these files: /srv/pokybuild/yocto-worker/reproducible/build/build-st/meta=
-selftest/files/static-group
2026-02-14 17:59:08,803 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'weston-init' (but /srv/pokybuild/yocto-worker/reproducible/build/layers=
/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-we=
ston.bb, /srv/pokybuild/yocto-worker/reproducible/build/layers/openembedded=
-core/meta/recipes-graphics/wayland/weston-init.bb, /srv/pokybuild/yocto-wo=
rker/reproducible/build/layers/openembedded-core/meta/recipes-graphics/wayl=
and/weston_14.0.2.bb RDEPENDS on or otherwise requires it)
2026-02-14 17:59:08,803 - oe-selftest - INFO -       No eligible RPROVIDERs=
 exist for 'weston-init'
2026-02-14 17:59:08,803 - oe-selftest - INFO -       NOTE: Runtime target '=
weston-init' is unbuildable, removing...
2026-02-14 17:59:08,803 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['weston-init']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3355

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


