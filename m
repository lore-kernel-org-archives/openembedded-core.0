Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE62C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 18:31:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75891.1783017064909875118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 11:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y+EihsH0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B689C4F762
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 18:31:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B83E1602EE;
	Thu,  2 Jul 2026 18:31:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 089D0104C9567;
	Thu,  2 Jul 2026 20:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783017062; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CbL4BRc2rzJSIFSxqfl1dgxmfuZCJaFQp5Sdvp6Yt0c=;
	b=y+EihsH0P0858M/fsCCkXsuGhRzd6Tf5L6FN9dIzTw+CxiMpyxcViCC4y88Xz4Q56NPlMW
	ooWCCEyzqX43tQshv1rEVvCMbGvYfJ1x+fjzEb2+H1mWFhS0YB0/88nay7W+xbd1BTkb2j
	jQDpwacDoeUjoyvgA7aJ2ZaQVHxNMcmB3PSbpsgMYY1/5tguZfkZOsUGeGra3jdLM92kUe
	Nqa6Qg7e1WC3goF3SaGiZacS7oJPGIpyjnc6qxhuZSGhEs7ebbk80taVg2O5qqP6wnaG0g
	DWNg31gRjxIHsiOYPUa0EEaOalKbpAFYWFfxJXSTzxtTLHmtnPB69FFfnZTfbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 20:30:59 +0200
Message-Id: <DJOASP0ROLWE.3673CSD4EKMAU@bootlin.com>
Subject: Re: [oe-core][Patch 2/3] mesa.inc: enable intel raytracing support
 conditionally
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <f_l_k@t-online.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260701163640.1285581-1-f_l_k@t-online.de>
 <20260701163640.1285581-2-f_l_k@t-online.de>
In-Reply-To: <20260701163640.1285581-2-f_l_k@t-online.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 18:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240068

On Wed Jul 1, 2026 at 6:36 PM CEST, Markus Volk via lists.openembedded.org =
wrote:
> Enable intel-rt if 'libclc', 'gallium-llvm' and 'intel' are in PACKAGECON=
FIG
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---

Hi Markus,

Thanks for your patch.

It looks like this is failing on 32 bit platforms.

ERROR: mesa-2_26.1.2-r0 do_configure: Execution of '/srv/pokybuild/yocto-wo=
rker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/mesa/26.1.2/temp/=
run.do_configure.837832' failed with exit code 1
...
| ../sources/mesa-26.1.2/meson.build:373:4: ERROR: Feature intel-rt cannot =
be enabled: Intel Ray Tracing requires 64-bit architectures

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4010
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4054
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4010

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


