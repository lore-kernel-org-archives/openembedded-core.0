Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCDBCD128A
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 09:59:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.102826.1712570381805122150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 02:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xv6+QAHc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D1EF240006;
	Mon,  8 Apr 2024 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712570379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bTaX2xEaRL4qV0Pd2gcg8eU+UO5QwE3m7k4j4sF5oUU=;
	b=Xv6+QAHc9mwhWfIP4+CMS9Y4il683+gKzzJZQpLA9gesj+e70QW1sC6Fiph+gEbSzvtqvh
	q+MIMZQ4zmXgS0rDF73fTp5VQjPQyChGE9m4IhdtlvbdnxUVIASo8qLkCVRuhoI6p1m54t
	YFSZ/P/LFfL4gGQOUL1pefeaebMubvpb4hYj5r6gILUjlnXhGnv4KyG/IU5YBA3BwHB3F2
	d7x71sLp/LVxh3BlyJFGLgP+CejCsBfK8Cwz+sU1cD0SdtjrCmO3zb7BzggEiCQbrBsec9
	hU83xFq01rmWkMWfhC8tOsRy74TLJHx97xQu2JIb0frh8K0nAj7U4sKShnmnzg==
Date: Mon, 8 Apr 2024 11:59:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH V2 1/2] ovmf: set CVE_PRODUCT and CVE_VERSION
Message-ID: <20240408095939c88bc8d7@mail.local>
References: <20240406044129.84784-1-Qi.Chen@windriver.com>
 <202404080959033d7e878b@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404080959033d7e878b@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 09:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198007

On 08/04/2024 11:59:04+0200, Alexandre Belloni wrote:
> Since this merged, we have:
> 
> WARNING: ovmf-native-edk2-stable202308-r0 do_cve_check: edk2: Failed to compare 202308 < svn_16280 for CVE-2014-8271

This is because the second patch wasn't merged

> 
> On 06/04/2024 12:41:28+0800, Chen Qi via lists.openembedded.org wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > Set CVE_PRODUCT and CVE_VERSION for ovmf. NVD uses 'edk2' and the
> > version should be the date only. Here's an example:
> > https://nvd.nist.gov/vuln/detail/CVE-2023-45232
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-core/ovmf/ovmf_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> > index 3dc031d3b6..5b1353b8e8 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -30,6 +30,9 @@ PV = "edk2-stable202308"
> >  SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
> >  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
> >  
> > +CVE_PRODUCT = "edk2"
> > +CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
> > +
> >  inherit deploy
> >  
> >  PARALLEL_MAKE = ""
> > -- 
> > 2.34.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197989): https://lists.openembedded.org/g/openembedded-core/message/197989
> > Mute This Topic: https://lists.openembedded.org/mt/105362148/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

