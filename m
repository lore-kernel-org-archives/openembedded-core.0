Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4681C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 07:47:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.94503.1701762471329616289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 23:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zea1gxqu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC5D91C0006;
	Tue,  5 Dec 2023 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701762469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRFVrhHnZ00a85mCpezHF6vuvqJ6cT4t1e7jzl5HhJU=;
	b=Zea1gxqun5X3x0j8+acrZ5uriLUaWs5rKl7wXlBc/I+SNZNAo7RkEp0CIx4YNXa5yevJkW
	krfizvr8afpPFFB6G9uWJSousRh7YDnTl7J6w1pZ/Ne1aL92vLTtarfM+5NJxyQC/E9MCl
	vyML2art3dDDYl2pXAoxPdS9PgoerGt8UeZ41oQgjEBuhUO7rknWH0BntqQMQNIejNG425
	fr78sYpJCOdOsxcf5lmXvq51k9O2V0MAcFn/V62IjIhXmfPZ2KNLAd/a8sjxy+7E4Gm2cA
	XtEDnYhvcOmD/MTM1MtG+Nj5GQdLSwo1wyRZJ9R0J8SqOSH62XValsRsmpRVFA==
Date: Tue, 5 Dec 2023 08:47:48 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 0/9] Several fixes around recipetool
 appendsrcfile(s) and oe.recipeutils.bbappend_recipe
Message-ID: <202312050747484b944cf9@mail.local>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191804

Hello,

The series doesn't apply on master, can you rebase?

On 04/12/2023 16:25:54+0100, Julien Stephan wrote:
> Hi all,
> 
> I was trying to use recipetool appendsrcfile to add a file to a recipe and I noticed several issues:
> * -m is not correctly supported
> * recipetool appendsrfile(s) are missing a usefull dry-run mode
> * appendsrc function relies on oe.recipeutils.bbappend_recipe but
>   duplicates some code: it constructs itself the new src_uri entry
>   although oe.recipeutils.bbappend_recipe is already doing it
> * we are lacking a mode to patch the recipe itself
> 
> So this series tries to fix the issues above, fix the selftest
> accordingly and add new test for -m and for "patch mode" (update recipe)
> and also add a way to specify the name of the file to add
> (in oe.recipeutils.bbappend_recipe)
> 
> Improvements from v1:
> - in bbappend_recipe function remove old entry if an entry with different parameters already exists 
> to avoid duplicate entries with different parameters
> 
> Link to v1: https://lists.openembedded.org/g/openembedded-core/message/191544
> 
> 
> Julien Stephan (9):
>   recipetool: appendsrcfile(s): add dry-run mode
>   recipeutils: bbappend_recipe: fix undefined variable
>   recipeutils: bbappend_recipe: add a way to specify the name of the
>     file to add
>   recipeutils: bbappend_recipe: remove old srcuri entry if parameters
>     are different
>   recipetool: appendsrcfile(s): use params instead of extraline
>   recipeutils: bbappend_recipe: allow to patch the recipe itself
>   recipetool: appendsrcfile(s): add a mode to update the recipe itself
>   oeqa/selftest/recipetool: appendsrfile: add test for machine
>   oeqa/selftest/recipetool: appendsrc: add test for update mode
> 
>  meta/lib/oe/recipeutils.py                 | 62 +++++++++++-----
>  meta/lib/oeqa/selftest/cases/recipetool.py | 83 +++++++++++++++++++---
>  scripts/lib/devtool/standard.py            |  6 +-
>  scripts/lib/recipetool/append.py           | 63 +++++++++++-----
>  4 files changed, 168 insertions(+), 46 deletions(-)
> 
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191744): https://lists.openembedded.org/g/openembedded-core/message/191744
> Mute This Topic: https://lists.openembedded.org/mt/102972288/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

