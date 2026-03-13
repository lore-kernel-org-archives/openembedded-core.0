Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59EB105F795
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 10:32:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12853.1773397952392814786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 03:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZH/1jCxE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 19992C42701
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:32:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB77F60027;
	Fri, 13 Mar 2026 10:32:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A82E510369E5C;
	Fri, 13 Mar 2026 11:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773397948; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7xSvL+UuPjirJuw+XM7YIsgiGbdLtf0UJZn0qiMhPtI=;
	b=ZH/1jCxEoa0kP/KPv+pyF+igsJmtuia2R1p/JzoPdh+GhZ1FmcjiIU8glqr2yXGcSBd+v2
	MYuZY1v+MRYl5+I709R8xUlNr0J3HFNzzeWpUCT6QJxtftQ3UXYBu8pW1QOfRC5amLy31S
	Cghnc7fWJ1DNHTA2x8AlJAfH78P0Q7v4oUb/d1CV9SykUM4M7db8PlqAY4ghrR8HHhxEET
	uvWG8RtcrngUKBTHIJrCkkMfvflmWMGgUDjwJtMtQGjQXQ87wq+TZc22bW3V+0truC1iTU
	0fRySSDIIY9upOX1UfT5nZDAHWO016OJRgt/gW51Ugs21onJdROBLoHheZBHAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:32:26 +0100
Message-Id: <DH1L3TS6CIOI.2I9VCSJIZ8QG2@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] nfs-utils: upgrade 2.8.5 -> 2.8.6
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260312200448.2019165-1-peter.marko@siemens.com>
In-Reply-To: <20260312200448.2019165-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233037

On Thu Mar 12, 2026 at 9:04 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Fixes CVE-2025-12801 per [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2025-12801
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for the upgrade.

It looks like this is having issues with musl:
[    1.485154] udevd[147]: starting version 3.2.14
[    1.489350] usb 2-2: new high-speed USB device number 3 using ehci-pci
[    1.492825] udevd[148]: starting eudev-3.2.14
[    1.519296] traps: nfsrahead[175] general protection fault ip:7f51bd8fbf=
9b sp:7fffd3b63708 error:0 in libc.so[4bf9b,7f51bd8c2000+6a000]
[    1.519391] traps: nfsrahead[174] general protection fault ip:7fd52597df=
9b sp:7ffd0db22588 error:0
[    1.519389] traps: nfsrahead[171] general protection fault ip:7fa02af85f=
9b sp:7ffedb159978 error:0 in libc.so[4bf9b,7fa02af4c000+6a000]
[    1.520062] traps: nfsrahead[173] general protection fault ip:7fca37d52f=
9b sp:7ffd6397c578 error:0 in libc.so[4bf9b,7fca37d19000+6a000]
[    1.526911] udevd[167]: '/usr/libexec/nfsrahead 1:11' [175] terminated b=
y signal 11 (Segmentation fault)
[    1.527274] traps: nfsrahead[169] general protection fault ip:7fdfa34e8f=
9b sp:7fffad0c0e68 error:0 in libc.so[4bf9b,7fdfa34af000+6a000]
[    1.527828] traps: nfsrahead[170] general protection fault ip:7ff367ae1f=
9b sp:7ffca27b7958 error:0 in libc.so[4bf9b,7ff367aa8000+6a000]
[    1.527927] udevd[162]: '/usr/libexec/nfsrahead 11:0' [170] terminated b=
y signal 11 (Segmentation fault)
[    1.528466] traps: nfsrahead[172] general protection fault ip:7f065d110f=
9b sp:7fff1b31a278 error:0 in libc.so[4bf9b,7f065d0d7000+6a000]
[    1.529105] traps: nfsrahead[176] general protection fault ip:7f4527694f=
9b sp:7ffe7ccacf18 error:0
[    1.529299] udevd[154]: '/usr/libexec/nfsrahead 1:10' [172] terminated b=
y signal 11 (Segmentation fault)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3410
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3379

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


