Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E8CD10DC0
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 08:41:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.169855.1733128861367621560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 00:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kN9LbmvC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A097FF802;
	Mon,  2 Dec 2024 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733128859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNL2RMKLYGCHFWE5w7KnRi/055qDun4m7aLhwNZZga8=;
	b=kN9LbmvCwfqDP4je8akXbxsiWo3EqbjZOpq98xON0erBIbJsKlnKJBCP1RQbaIAYNepHyp
	wUYxlATJluKRG5eB+C0fvhZpTIk7l9kxo4N/A1JnR1y/f8SiuXuwcYkcPfRhU8Rh/wSvcs
	dpSP4cqqroBxWKeyIYIVl0dWwRIeotGk1Q/Q468GvkGuTq5eWQf703PgoyYgCVP2MC2bud
	dB4pctjP5P3B0PzzcX8ssSDgeO/IZQ2jCnvQsJk641mJ5xiqnqjQKxOE1Snwp3HhB4kD2b
	JQa4BymdcEweXH0wj8fGaNruV++Bq92zRwuiaAPhxVfSHBQ0Iz314EAtQuLdNg==
Date: Mon, 2 Dec 2024 09:40:57 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: ricardo.salveti@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] systemd: drop deprecated rootlibdir,
 rootprefix and split-usr options
Message-ID: <Z01ymX9S3BWQsdcR@bootlin-mathieu>
Mail-Followup-To: ricardo.salveti@oss.qualcomm.com,
	openembedded-core@lists.openembedded.org
References: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 08:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208128

On Fri, Nov 29, 2024 at 12:36:53AM -0300, Ricardo Salveti via lists.openembedded.org wrote:
> Support for split-usr and unmerged-usr were both removed as part of the
> systemd 255 release, so remove the current deprecated rootlibdir,
> rootprefix and split-usr options from the recipe.
> 
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---

Hi,

I believe these patches are breaking some builds on the autobuilder:

ERROR: systemd-1_256.8-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any package:
  /usr/lib64/libnss_resolve.so.2
  /usr/lib64/libudev.so.1.7.9
  /usr/lib64/libnss_systemd.so.2
  /usr/lib64/libsystemd.so.0.39.0
  /usr/lib64/libsystemd.so.0
  /usr/lib64/libnss_myhostname.so.2
  /usr/lib64/libnss_mymachines.so.2
  /usr/lib64/libudev.so.1
  /usr/lib64/systemd/libsystemd-core-256.so
  /usr/lib64/systemd/libsystemd-shared-256.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
systemd: 10 installed and not shipped files. [installed-vs-shipped]

https://valkyrie.yoctoproject.org/#/builders/17/builds/491/steps/12/logs/stdio

Can you have a look at this failure, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

