Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3E3C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:14:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.711.1683036845719878134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=js/1bLhh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1F704E000E;
	Tue,  2 May 2023 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683036843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7weqAAJi1UmFqxPhCH/hKKCC2xf5fRFafKzbbrLdBGc=;
	b=js/1bLhhziQtFz0UXfr+qOkgD95clZtSYXrSLJVO1FG5tjFRtODGUcL81bIyU36B4O50n0
	jQY612s9MCMu8puPEtfaSocK+3ZKMuQGeFXdAMoiFgtRGPYxzlV99AgedDpPfUnljYQEZg
	/DgxQShUmXnog+yKnANEYi3oZKCimnVrDsy0iRQtUlwJIWcnQ7/tHiOO1FfWCQeKugfliJ
	offH8F4j2O0A6Pfl8U8P8k2KhgfjVRimZ+bclmKfca01c+z8gYzBmFSXg39KgFtIqS5OZh
	nny+Aw6XEeiLyQqa7YW+HybB/zfetgRJz8SMV/1zsJ2k3sP6GOeHdjOnubCDgw==
Date: Tue, 2 May 2023 16:14:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [OE-core] [PATCH] init-manager-none.inc: have no init manager
Message-ID: <20230502141402301f77f9@mail.local>
References: <175A0DD84C89F64A.26969@lists.openembedded.org>
 <20230428090602.82995-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428090602.82995-1-michael.opdenacker@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180731

Hello,

This causes the following error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7035/steps/12/logs/stdio

This is the expected behaviour of the patch but doesn't fit with what
this particular build (qemuarm-oecore) is testing as we can't run
testimage without an init. I'm wondering what should be the proper
course of action here.


On 28/04/2023 11:06:02+0200, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This fixes the issue that setting INIT_MANAGER to "none"
> produces a system with sysvinit.
> 
> As the name suggests, this produces a system without
> an init manager (no systemd, no sysvinit, no BusyBox init, no
> /etc/inittab). There isn't any login manager either.
> The kernel just starts /bin/sh in the console.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/conf/distro/include/init-manager-none.inc | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
> index bbedf898f7..56d2b0f406 100644
> --- a/meta/conf/distro/include/init-manager-none.inc
> +++ b/meta/conf/distro/include/init-manager-none.inc
> @@ -1,3 +1,4 @@
> -VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
> -VIRTUAL-RUNTIME_initscripts ??= "initscripts"
> -VIRTUAL-RUNTIME_login_manager ??= "busybox"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
> +VIRTUAL-RUNTIME_init_manager ??= ""
> +VIRTUAL-RUNTIME_initscripts ??= ""
> +VIRTUAL-RUNTIME_login_manager ??= ""
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180524): https://lists.openembedded.org/g/openembedded-core/message/180524
> Mute This Topic: https://lists.openembedded.org/mt/98554799/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

