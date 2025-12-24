Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87210E74916
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 12:07:21 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.119469.1766578035751644201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 04:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Lv31IISW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5B878C1A5A4
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 12:06:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63F296073D;
	Wed, 24 Dec 2025 12:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BCBD10AB0AEE;
	Wed, 24 Dec 2025 13:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766578032; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pxFAI1eAA4mCXee1NFOXA3pcq0SPrK1ne4o6MSy1NQg=;
	b=Lv31IISWJHnwhL7w8y3alBxqKMySwloC6ynbFEg+7oGcavVfbUdwQuFgGxdq2FTn0CM+vO
	yTCZvD0eahiv1/+jLgQQxXrbcl8Zahezj9RUgbkdF2FY03HJ+c0YFaaiohrFMQXKcWioQL
	Zl2jY5PM4Said50+tT/KGgRr27fNN290USnXVm3xN97NzElVYoV8qsDm/GF1xTk0ZP9bDy
	WLcWbOnPQz4bimexkzCCk2DNHrAw3Q1dCAFJYIwU7KFdwoj0T7t3x3nQ7N6h25NiqakByZ
	JeEH6DkC5yJRhY2fUcLJSyy+oJIWwZ6NGmX6NX2mjuuqdsrgK1m6tpKDajtihQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 13:07:11 +0100
Message-Id: <DF6FNBU6P0LO.3DX90J7NFTZK4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <uvv.mail@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] oe-selftest: overlayfs: Add a demo case
 for /etc
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251222113840.2163929-1-uvv.mail@gmail.com>
 <20251222113840.2163929-4-uvv.mail@gmail.com>
In-Reply-To: <20251222113840.2163929-4-uvv.mail@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228528

On Mon Dec 22, 2025 at 12:38 PM CET, Vyacheslav Yurkov via lists.openembedd=
ed.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>
> /etc is a special directory. It's possible to create a mount unit for
> it, but many system services that start early at boot time will not
> rescan its content when you mount overlay on top. The added test case
> demonstrates this but adding a sample systemd service and enabling it in
> overlay.
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---

Hi Vyacheslav,

Thanks for your patches.

It looks like the added test is failing on the autobuilder, on arm host
platform, with some wic related error:

2025-12-24 10:16:24,719 - oe-selftest - INFO - overlayfs.OverlayFSTests.tes=
t_etc_mount (subunit.RemotedTestCase)
2025-12-24 10:16:24,720 - oe-selftest - INFO -  ... FAIL
...
39519	/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-904882=
/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/tmp-wic/boot.img
| ERROR: Couldn't find correct bootimg_dir, exiting
|
| WARNING: exit code 1 from a shell command.
NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/o=
penembedded-core/meta/recipes-core/images/core-image-minimal.bb:do_image_wi=
c) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5451 tasks of which 5354 didn't need to be r=
erun and 1 failed.
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/o=
e-selftest-armhost/build/build-st-904882/tmp/log/error-report/error_report_=
20251224101317.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/b=
uild-st-904882/tmp/log/error-report/error_report_20251224101317.txt [-s ser=
ver]
NOTE: The contents of these logs will be posted in public if you use the ab=
ove command with the default server. Please ensure you remove any identifyi=
ng or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded=
-core/meta/recipes-core/images/core-image-minimal.bb:do_image_wic
    log: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-904=
882/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/temp/log.do_image_=
wic.3087704
Summary: There was 1 ERROR message, returning a non-zero exit code.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3043

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


