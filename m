Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7742C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:00:46 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.8698.1654095639611625576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZuG5R0s3;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B7A2E200013;
	Wed,  1 Jun 2022 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654095637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsEu/9Dsf8iHObEk0hIHGTPYjWmydNvysb9EuAd0JBs=;
	b=ZuG5R0s3qIZ1gkiUXXel7w4WVYAcJ3OnHIuCr4cDhfiUcyWoZz2iTw6SWR2Lb23bfIRVlr
	m9v+EeS1mRX6gVZaal80O0XKsS1QGCbK5z2KKp2mZd87NLDLfFJKGvcHIGHisIdzMsDf7s
	yVMOJEaMUBS6CYmDEmijlFzrlKqUsTQa4sBnCrCovMPU1hxPK6l/pS8rlBpQeXIvKPcHyI
	bKiqujKx0mVbqKM3GEy91tOCn5sRBNlHhzrrYTJgN3hwKBE7SMVHjVruq/SaAf8hsLApHP
	Xy8lye5bdA3xB9Ux6W/3kPVsI0Lp0AWaKymbfblNIjUy9DXOPkbdnbXAEeE3Yg==
Date: Wed, 1 Jun 2022 17:00:35 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for
 wayland
Message-ID: <20220601170035.76ab1bcc@booty>
In-Reply-To: <20220531190620.186764-1-f_l_k@t-online.de>
References: <20220531190620.186764-1-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166380

Hi Markus,

On Tue, 31 May 2022 21:06:17 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>

I applied patches 1 to 3 of this series to my testing branch and got
these failures:

stdio: ERROR: Nothing PROVIDES 'font-util' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb DEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'libxfont2' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'libxfont2-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'libfontenc' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'libfontenc-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'libxfont-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Nothing RPROVIDES 'libxfont' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb RDEPENDS on or otherwise requires it)

See the full logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/12/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/15/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5304/steps/15/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

