Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312B9C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 21:29:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24901.1717190967674323092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 14:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JCH5ukHX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 804161BF204;
	Fri, 31 May 2024 21:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717190965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qzda1ziz7MhNMdrBFKkkr/iZIq1mF5Rhsdmc8GjXrWU=;
	b=JCH5ukHXmwBD9Lu4XOxEOxhvLArpUsJjetHMT4IMBHGCQLJAjH4OammwpXi6wFKSQmvd62
	6RVsvdq+igFsGjL0wdfVCCW4hNFqMkRw4LWgb0Z89cOICwxZtOkz+Cfgbpefg5UQJoHFDT
	jcZA+6C0c1tvceCGALnkMsMlSwtzsavM6Sg3e2cxu61zkCbgaNqYQ+Lsftnh4yZ8RrOa1l
	t2epXlo5VCuA1aahtnWf80EVLIFgxHf2d3egN+Uvdqz11KU2Vc/dTW2hwPCBSHd5WQ4ryq
	mbca+5sD+wjmQ+A4wvUKXGFy6cCtRr1R5vVTahNPaJ9nX9uAGF3sNrnLr7L//w==
Date: Fri, 31 May 2024 23:29:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RESEND][PATCH] insane: add patch-status to default
 ERROR_QA
Message-ID: <2024053121292511bb731d@mail.local>
References: <20240524160025.275450-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524160025.275450-1-martin.jansa@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 21:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200084

ERROR: gitrepotest-1.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: gitrepotest-1.0-r0 do_patch: Fatal QA errors were found, failing task.

On 24/05/2024 18:00:25+0200, Martin Jansa wrote:
> * it's enabled for patches in oe-core for very long time and I was using
>   it for many other layers as well, so most layers should be in good
>   shape
> 
> * it's also possible to disable it for individual layer as shown
>   by oe-core in:
>   https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> Resend https://patchwork.yoctoproject.org/project/oe-core/patch/20240314070903.83765-1-martin.jansa@gmail.com/
> now when scarthgap is released and master is open for development
> 
>  meta/classes-global/insane.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 99736830b9..6d2f83c6f7 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              already-stripped installed-vs-shipped ldflags compile-host-path \
>              install-host-path pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
> -            patch-fuzz \
> +            patch-fuzz patch-status \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> -ERROR_QA:append:layer-core = " patch-status"
>  WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
>  
>  FAKEROOT_QA = "host-user-contaminated"
> -- 
> 2.45.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199853): https://lists.openembedded.org/g/openembedded-core/message/199853
> Mute This Topic: https://lists.openembedded.org/mt/106284256/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

