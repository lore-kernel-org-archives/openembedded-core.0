Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5536BC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:36:28 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.2777.1677094578716087218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 11:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S0h1olV1;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 69199240004;
	Wed, 22 Feb 2023 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677094576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3+4DN1bfgcowcg72bdPNQpOvxoiOA+D/5whT85rn0o=;
	b=S0h1olV10Dafc/LsaU2z4rxv7XCZtXYdv8WBnB+5uivmHGbmNYyvFm3qLZl7cX1PmIaokK
	tJkmPeB2+UqHvg6Vs/ZFie/d4a19ngy9r8XugU+Cf36EPADlF3ivrPUXISlY4JCdeS0u9H
	zpNMjsfGn8etSSQmBZ7UaHdgtl2fv7490VCzdHAfuEDWyjf+BuB2ejlHBTiCfpNY5Crfrw
	qNDZYJGETkoWd3DGrmUkGUL2jXjmNEA8f7ewB6LDJ47n/0y4ZbPNpGUMlFWVQGCwawxk19
	Gj/nGGH1g3sdnWwpb+zOdkB+4pghd7m0EjbvjMoMkQCsj/gQB0syuT4js8X0iQ==
Date: Wed, 22 Feb 2023 20:36:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] sstate cache management
Message-ID: <Y/ZurxXQueWv15l9@mail.local>
References: <CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 19:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177581

Hello,

This doesn't answer your question but did you look into
https://lore.kernel.org/all/20221121111102.5556-1-tomasz.dziendzielski@gmail.com/?

On 22/02/2023 17:56:35+0000, Alex Kiernan wrote:
> I needed to do something about our shared sstate store and waded into
> the sstate cache management problem as the existing script takes hours
> to run over NFS (which for better or worse is where ours is). I've set
> myself the problem of replacing the existing script with something
> more extensible, understandable and performant.
> 
> I've got something which I believed was roughly right, but I'm ending
> up with questions I can't answer when comparing the two outputs...
> 
> If I run the existing shell script against a tiny sstate-cache (on my
> laptop) I get 420 duplicate files eligible for removal, if I run my
> script I get 491, looking into the delta, I pick out things like
> these:
> 
> $ find sstate-cache/ -name
> sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:*_populate_sysroot.tar.zst*
> -ls
>     49067     16 -rw-r--r--   1 alexk    alexk       14435 Feb 18
> 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst
>     49129     16 -rw-r--r--   1 alexk    alexk       15205 Feb 18
> 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst.siginfo
>   2490392     16 -rw-r--r--   1 alexk    alexk       15204 Feb 20
> 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst.siginfo
>    339439     16 -rw-r--r--   1 alexk    alexk       14423 Feb 20
> 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst
> 
> Which look to me like I should be able to delete the older ones, or am
> I missing something? Trying to follow what the existing script is
> supposed to do is challenging!
> 
> -- 
> Alex Kiernan

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177579): https://lists.openembedded.org/g/openembedded-core/message/177579
> Mute This Topic: https://lists.openembedded.org/mt/97165650/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

