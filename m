Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B7DC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 21:29:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.34796.1671485390178914365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 13:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jj9J8stF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C5C7524000A;
	Mon, 19 Dec 2022 21:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671485387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ju4o0GEMvD6ptzgOpWBzYO6blsYAlxWFniRMEQLvrDg=;
	b=jj9J8stFhdVA7DBohObBUpdR7oSefvYRJtkgah0fGE5wi8H8EXOfPHLWkv2Wx85bZBfPLC
	8GNyu3cJEKMn+t5JUfQMEqdUqN20oFTlewzke3VORTWnVU2WcbhUvkvm/ImFFO9/EOmPZ2
	dy+lGLUYAiuOsoiWB9eNObPoQaCl/vJC4PV7slQON4rdRsOeaf1vsCypNkvTprYddfubY3
	+Sw/x5rpPxcaKCJm8JG0qKXRvhzM80gLjkxqw0TCvNInytmeAT6JKqDl+ch09g9PuOmDz2
	aon+zYqiPxXvnr81s9K5fXXWwblafVFdoCfEjMQzinzXNygGURVKhU1DdLm7yw==
Date: Mon, 19 Dec 2022 22:29:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Quentin Schulz <foss@0leil.net>
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Ross Burton <ross.burton@arm.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [OE-core] [PATCH] cairo: fix CVE patches assigned wrong CVE
 number
Message-ID: <Y6DXyqpY7Tn7ijSj@mail.local>
References: <20221214-cairo-cve-typo-v1-1-8ecb1bf8f9df@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214-cairo-cve-typo-v1-1-8ecb1bf8f9df@theobroma-systems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 21:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174835

Hello Quentin,

I couldn't apply this patch but it still seems relevant. Can you rebase?

On 14/12/2022 11:42:16+0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> CVE-2019-6461 and CVE-2019-6462 are fixed, but the reporting is
> incorrect as the patch for CVE-2019-6461 is actually for CVE-2019-6462
> and vice-versa.
> 
> This swaps both files and edit the CVE field to report the correct
> identifier.
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  .../cairo/cairo/CVE-2019-6461.patch                 | 21 +++++++++++----------
>  .../cairo/cairo/CVE-2019-6462.patch                 | 21 ++++++++++-----------
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
> index 5232cf70c6..a2dba6cb20 100644
> --- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
> +++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
> @@ -1,19 +1,20 @@
> -There is a potential infinite-loop in function _arc_error_normalized().
> +There is an assertion in function _cairo_arc_in_direction().
>  
>  CVE: CVE-2019-6461
>  Upstream-Status: Pending
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>  
>  diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> -index 390397bae..f9249dbeb 100644
> +index 390397bae..1bde774a4 100644
>  --- a/src/cairo-arc.c
>  +++ b/src/cairo-arc.c
> -@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
> -     do {
> - 	angle = M_PI / i++;
> - 	error = _arc_error_normalized (angle);
> --    } while (error > tolerance);
> -+    } while (error > tolerance && error > __DBL_EPSILON__);
> +@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
> +     if (cairo_status (cr))
> +         return;
>   
> -     return angle;
> - }
> +-    assert (angle_max >= angle_min);
> ++    if (angle_max < angle_min)
> ++       return;
> + 
> +     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
> + 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
> diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
> index 4e4598c5b5..e3a8d5a219 100644
> --- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
> +++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
> @@ -1,20 +1,19 @@
> -There is an assertion in function _cairo_arc_in_direction().
> +There is a potential infinite-loop in function _arc_error_normalized().
>  
>  CVE: CVE-2019-6462
>  Upstream-Status: Pending
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>  
>  diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> -index 390397bae..1bde774a4 100644
> +index 390397bae..f9249dbeb 100644
>  --- a/src/cairo-arc.c
>  +++ b/src/cairo-arc.c
> -@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
> -     if (cairo_status (cr))
> -         return;
> +@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
> +     do {
> + 	angle = M_PI / i++;
> + 	error = _arc_error_normalized (angle);
> +-    } while (error > tolerance);
> ++    } while (error > tolerance && error > __DBL_EPSILON__);
>   
> --    assert (angle_max >= angle_min);
> -+    if (angle_max < angle_min)
> -+       return;
> - 
> -     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
> - 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
> +     return angle;
> + }
> 
> ---
> base-commit: a89bea9fed0005bc7d820a1fc6a9d6dd7c246c22
> change-id: 20221214-cairo-cve-typo-fd0d89835d77
> 
> Best regards,
> -- 
> Quentin Schulz <quentin.schulz@theobroma-systems.com>

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174552): https://lists.openembedded.org/g/openembedded-core/message/174552
> Mute This Topic: https://lists.openembedded.org/mt/95663780/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

