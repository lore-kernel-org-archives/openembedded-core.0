Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885E5C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 09:41:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.5699.1666777273849690773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 02:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BbcbEh4D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 947B5E0008;
	Wed, 26 Oct 2022 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666777272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TbDd0ZIqnbkHgwHm1BB1YyKEzH+UJyex0QaDHhKPJJc=;
	b=BbcbEh4D6WD6BXSkiZBI2LHZP2FTztaAkV+vb53oErUyQkENnJBmkDllbqy9J7gqfAHCT9
	q7tjwh9O59rP55ektUALuJKI3aqEb6Xy8hEY83tG5kSF0Jy8ApKn+mhSBKTRq6XAL0vMvj
	xGX3xziwrPy4L+4Yk6RH8LutJUkmpW/6lk9XJYs75Pq6SUF4iSpMRIu3bUXrkpRL9d6Aug
	IxykcFJJXhUpQxvtBHwiM05Ye+hXTAno0EyuC+4vFqC+6vEQeUQj4uVflATe8ZOf4LTuVU
	6jyoKZRcZhf7/k2wWxp6X2DsCmipC0GtGJZTtpD+2W+g1qt9d/IbTfrPnESjZA==
Date: Wed, 26 Oct 2022 11:41:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] mesa: update 22.2.0 -> 22.2.2
Message-ID: <Y1kAt9JSrXsZqDXB@mail.local>
References: <20221024150608.455173-1-f_l_k@t-online.de>
 <Y1gBSjnaB+frzv3i@mail.local>
 <83998312-9025-44DE-A6FE-F05282A5F532@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83998312-9025-44DE-A6FE-F05282A5F532@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 09:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172148

On 26/10/2022 08:45:10+0000, Ross Burton wrote:
> This fallout might be related to the libglx patch for mesa?
> 

Yeah, sorry, this patch is ok, the failure is coming from glvnd support
and I'm going to reply to the other patch.

> Ross
> 
> > On 25 Oct 2022, at 16:31, Alexandre Belloni via lists.openembedded.org <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > 
> > Hello,
> > 
> > This is failing on the AB:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/steps/13/logs/stdio
> > 
> > On 24/10/2022 17:06:08+0200, Markus Volk wrote:
> >> - add a PACKAGECONFIG for perfetto support
> >> 
> >> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> >> ---
> >> .../mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb}             | 0
> >> meta/recipes-graphics/mesa/mesa.inc                           | 4 +++-
> >> meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} | 0
> >> 3 files changed, 3 insertions(+), 1 deletion(-)
> >> rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb} (100%)
> >> rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} (100%)
> >> 
> >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
> >> similarity index 100%
> >> rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
> >> rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> index 8a74e0a80a..bad8461fef 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >>            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
> >>            "
> >> 
> >> -SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
> >> +SRC_URI[sha256sum] = "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
> >> 
> >> UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> >> 
> >> @@ -179,6 +179,8 @@ PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
> >> 
> >> PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
> >> 
> >> +PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
> >> +
> >> PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
> >> 
> >> PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
> >> diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-graphics/mesa/mesa_22.2.2.bb
> >> similarity index 100%
> >> rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
> >> rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
> >> -- 
> >> 2.34.1
> >> 
> > 
> >> 
> >> 
> >> 
> > 
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172134): https://lists.openembedded.org/g/openembedded-core/message/172134
> > Mute This Topic: https://lists.openembedded.org/mt/94536553/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross.burton@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

