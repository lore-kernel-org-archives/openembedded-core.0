Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBEBC43219
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 11:35:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.21572.1669289713276753980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 03:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BPywO/JX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D29CCE0011;
	Thu, 24 Nov 2022 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669289711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KYhooDOS0ogC3Gdo+8b6H47gkrYXcSZc11OyLzGk82Y=;
	b=BPywO/JXDAV+OfQbsr4843QO4OJaRagY1PfiwokpM5HGT8+QnP2yzJJEd8bgOsuOpCF6Rv
	RbcKOKTBdPq+jKQNBxRadhoPJohP3QdFAWj0lp3ispXsvyGst7XPMiIX5UcgUJmw+BsnZP
	tiI2X0qOkMr+NxKPDmz8OvHZkb7s/77VBmsFhqbGhy5xnEYB41lAqAdY9lHMnyN0MHNsdt
	8z/p5aaXcQbnUkQwlReIfWWEWNdbTViCeUEg09rD56QaaHWRt3FNj94y1OqXwZtIQfOAQ7
	hyEGqcl1HFIgjqNLlxIlo0gvIM7N92rikast58VJXha/hGvSEcR6rumCqPEBxw==
Date: Thu, 24 Nov 2022 12:35:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Message-ID: <Y39W7D6ps5v1cCyn@mail.local>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124025528.114101-1-Qi.Chen@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 11:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173741

Hello,

On 23/11/2022 18:55:28-0800, Chen Qi wrote:
> For now, there's no easy way to skip some specified tests when
> using 'oe-selftest -r'. This is because '-R' and '-r' are in the
> mutually exclusive group. Looking at the codes, the codes have already
> allowed running specified tests and skipping specified tests at
> the same time. So move '-R' out of the mutually exclusive group
> and change its help message.
> 
> After this change, the following command could be used.
>   oe-selftest -r A -R A.B.C
> 
> This does introduce a behavior regression.
> Previous 'oe-selftest -R xxx' needs to now be changed to
> 'oe-selftest -a -R xxx'.
> 

This fails on the autobuilders which uses:

oe-selftest --skip-tests distrodata.Distrodata.test_checkpkg buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -T machine -T toolchain-user -T toolchain-system -j 15

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4395/steps/14/logs/stdio

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/selftest/context.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
> index 78c7a467e2..c7dd03ce37 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -154,9 +154,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>          group.add_argument('-a', '--run-all-tests', default=False,
>                  action="store_true", dest="run_all_tests",
>                  help='Run all (unhidden) tests')
> -        group.add_argument('-R', '--skip-tests', required=False, action='store',
> -                nargs='+', dest="skips", default=None,
> -                help='Run all (unhidden) tests except the ones specified. Format should be <module>[.<class>[.<test_method>]]')
>          group.add_argument('-r', '--run-tests', required=False, action='store',
>                  nargs='+', dest="run_tests", default=None,
>                  help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
> @@ -171,6 +168,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
>                  action="store_true", default=False,
>                  help='List all available tests.')
>  
> +        parser.add_argument('-R', '--skip-tests', required=False, action='store',
> +                nargs='+', dest="skips", default=None,
> +                help='Skip the tests specified. Format should be <module>[.<class>[.<test_method>]]')
>          parser.add_argument('-j', '--num-processes', dest='processes', action='store',
>                  type=int, help="number of processes to execute in parallel with")
>  
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173732): https://lists.openembedded.org/g/openembedded-core/message/173732
> Mute This Topic: https://lists.openembedded.org/mt/95231396/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

