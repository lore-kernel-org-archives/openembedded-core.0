Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8CECA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 10:03:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3013.1693562603643132664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 03:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HiS5+OKZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD7D2240006;
	Fri,  1 Sep 2023 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693562601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emWwSoWW/1g/It8I84zkLLHUZaT0fjnRnrroyHuAuYE=;
	b=HiS5+OKZBNjiQqZkX4zmRtIjI08PNwodbUgXrySJ8iJi13Y4AlwwYeCWbhWe9O4YnDOzbO
	yRkNaQxPcNxV1OHxwrgvfdzldflENr1GwHDUjjsBEZsIFaUpjLigR2cA6KNYZzFwswEdIa
	CdwPwp6yGY4mreJMFLfHz66Y5HJRSsR4Z+Qef8C8JAcGVgJqIG0eW1WexQtg947KtdzK6Y
	ryTQqFjw9CxXpOeoLa8zHUc6o6HB7m6k7HqME+OhDFL7RdLhORj8lHPYD/mXSvvXOeCra3
	fH2CWQUx91mE5rNQQ/Tn0X9cR/MlolmaP5AjT2g9YJNIiggolPeNaZLj3LZIjw==
Date: Fri, 1 Sep 2023 12:03:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: JD Schroeder <sweng5080@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] distcc: Fix groupname gid change warning
Message-ID: <20230901100320a0451563@mail.local>
References: <20230831142305.10981-1-sweng5080@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831142305.10981-1-sweng5080@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 10:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187000

Hello,

This fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3449/steps/12/logs/stdio

ERROR: Nothing RPROVIDES 'distcc' (but /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-devtools/devel-config/distcc-config.bb RDEPENDS on or otherwise requires it)
distcc was skipped: Recipe distcc, package distcc-server: system groupname "nogroup" does not have a static ID defined. Add nogroup to one of these files: /home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/files/static-group


On 31/08/2023 09:23:04-0500, JD Schroeder wrote:
> This patch fixes warnings when useradd-staticids.bbclass is used and
> USERADD_PARAM is used to add the user to a group that has not been
> explicitly created yet. By adding the GROUPADD_PARAM for the new group
> being used the warnings for changing the gid from GID-OLD to GID-NEW
> is eliminated.
> 
> Warning fixed:
> distcc: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!
> 
> Signed-off-by: JD Schroeder <sweng5080@gmail.com>
> ---
>  meta/recipes-devtools/distcc/distcc_3.4.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
> index 45fc7cde53..0c20f74d68 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.4.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
> @@ -33,6 +33,7 @@ EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
>  PACKAGE_BEFORE_PN = "${PN}-distmon-gnome ${PN}-server"
>  
>  USERADD_PACKAGES = "${PN}-server"
> +GROUPADD_PARAM:${PN}-server = "--system nogroup"
>  USERADD_PARAM:${PN}-server = "--system \
>                         --home /dev/null \
>                         --no-create-home \
> -- 
> 2.37.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186977): https://lists.openembedded.org/g/openembedded-core/message/186977
> Mute This Topic: https://lists.openembedded.org/mt/101074670/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

